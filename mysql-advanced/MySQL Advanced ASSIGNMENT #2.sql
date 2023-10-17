DROP PROCEDURE IF EXISTS p_get_office_by_country;

DELIMITER $$
CREATE PROCEDURE p_get_office_by_country (
INOUT officeCodeList varchar(4000),
IN countryName VARCHAR(255)
)
BEGIN
    DECLARE finished INTEGER DEFAULT 0;
    DECLARE result_officeCode varchar(100) DEFAULT "";

    -- declare cursor for employee email
    DEClARE curOfficeCode 
        CURSOR FOR 
            SELECT officeCode FROM offices;

    -- declare NOT FOUND handler
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;

    OPEN curOfficeCode;

    getOfficeCode: LOOP
        FETCH curOfficeCode INTO result_officeCode;
        IF finished = 1 THEN 
            LEAVE getOfficeCode;
        END IF;
        -- build email list
        SET officeCodeList = CONCAT(result_officeCode,";",officeCodeList);
    END LOOP getOfficeCode;
    CLOSE curOfficeCode;

END$$
DELIMITER ;

SET @officeCodeList = ""; 
CALL p_get_office_by_country(@officeCodeList, 'USA'); 
SELECT @officeCodeList;