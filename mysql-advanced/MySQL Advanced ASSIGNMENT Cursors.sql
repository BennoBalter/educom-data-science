DROP PROCEDURE IF EXISTS p_generate_customer_reporting;

DELIMITER $$

CREATE PROCEDURE p_generate_customer_reporting()
BEGIN

    CREATE TABLE IF NOT EXISTS customer_reporting (
        customerName VARCHAR(255),
        totalOrderAmount DECIMAL(10, 2)
    );
    DELETE FROM customer_reporting;
    
    INSERT INTO customer_reporting (customerName, totalOrderAmount)
    SELECT
        c.customerName,
        IFNULL(COUNT(o.customerNumber), 0) AS totalOrderAmount
    FROM customers c
    LEFT JOIN orders o ON c.customerNumber = o.customerNumber
    GROUP BY c.customerNumber;
END$$

DELIMITER ;

CALL p_generate_customer_reporting();