
-- action 3

-- drop fk employees

DROP TABLE IF EXISTS employeeArchive;    

CREATE TABLE employeeArchive (
 `id` int(11) NOT NULL AUTO_INCREMENT,
 `employeeNumber` int(11) NOT NULL,
 `lastName` varchar(50) NOT NULL,
 `firstName` varchar(50) NOT NULL,
 `extension` varchar(10) NOT NULL,
 `email` varchar(100) NOT NULL,
 `officeCode` varchar(10) NOT NULL,
 `reportsTo` int(11) DEFAULT NULL,
 `jobTitle` varchar(50) NOT NULL,
 `salary` decimal(10,2) DEFAULT NULL,
 `date_hired` date DEFAULT NULL,
 `date_fired` date DEFAULT NULL,
 `deletedAt` TIMESTAMP DEFAULT NOW(),
 PRIMARY KEY (`id`)
 -- CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`reportsTo`) REFERENCES `employees` (`employeeNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci



DROP TRIGGER IF EXISTS salaries_bdr;

DELIMITER $$

CREATE TRIGGER employees_bdr
BEFORE DELETE
ON employees FOR EACH ROW
BEGIN
    INSERT INTO employeeArchive(employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle, salary, date_hired, date_fired)
    VALUES(OLD.employeeNumber, OLD.lastName, OLD.firstName, OLD.extension, OLD.email, OLD.officeCode, OLD.reportsTo, OLD.jobTitle, OLD.salary, OLD.date_hired, OLD.date_fired);
END$$    

DELIMITER ;

-- action 4

DROP FUNCTION IF EXISTS f_employee_status;

DELIMITER $$

CREATE FUNCTION f_employee_status(werknemersnummer INT) 
RETURNS VARCHAR(20)
BEGIN
    DECLARE status VARCHAR(20);

    SELECT CASE
		WHEN date_fired IS NULL THEN ''
        ELSE 'FIRED'
	END INTO status
    FROM employees
    WHERE employeeNumber = werknemersnummer;
    RETURN status;
END$$

DELIMITER ;

SELECT f_employee_status(1);

-- action 5

CREATE VIEW v_employee_status AS
SELECT 	employeeNumber,
		lastName,
        firstName,
        f_employee_status(employeeNumber)
FROM employees

-- action 6

DELIMITER $$

CREATE PROCEDURE employee_salary_plus5()
BEGIN
    UPDATE employees
    SET salary = salary * 1.05;
END$$

DELIMITER ;

-- action 7

DELIMITER $$

CREATE PROCEDURE remove_employee_fired()
BEGIN
    DELETE e
    FROM employees e
    JOIN v_employee_status v ON e.employeeNumber = v.employeeNumber
    WHERE v.status = 'FIRED';
END$$

DELIMITER ;

START TRANSACTION;
CALL RemoveFiredEmployees();

COMMIT;

-- action 8

DROP TABLE IF EXISTS SalaryChanges;

CREATE TABLE SalaryChanges (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT(11),
    beforeSalary decimal(10,2),
    afterSalary decimal(10,2),
    changedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

DROP TRIGGER IF EXISTS salary_update_log_aur
DELIMITER $$

CREATE TRIGGER salary_update_log_aur
AFTER UPDATE
ON employees FOR EACH ROW
BEGIN
    IF OLD.salary <> new.salary THEN
        INSERT INTO SalaryChanges(employeeNumber, beforeSalary, afterSalary)
        VALUES(old.employeeNumber, old.salary, new.salary);
    END IF;
END$$

DELIMITER ;

UPDATE employees SET salary = 350 WHERE employeeNumber = 1056;