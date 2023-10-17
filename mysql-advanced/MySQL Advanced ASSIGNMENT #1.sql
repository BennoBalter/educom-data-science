DROP PROCEDURE p_get_office_by_country;

DELIMITER $$
CREATE PROCEDURE p_get_office_by_country(IN countryName VARCHAR(255))
BEGIN
    DECLARE search_country VARCHAR(25);
    DECLARE result_officeCode VARCHAR(255);
    
    SELECT country, officeCode
    INTO search_country, result_officeCode
    FROM offices
    WHERE LOWER(TRIM(country)) = LOWER(TRIM(countryName));
	
    SELECT search_country, result_officeCode;
END$$
DELIMITER ;

CALL p_get_office_by_country('%USA%');

