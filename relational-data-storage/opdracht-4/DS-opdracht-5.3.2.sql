CREATE VIEW VERZENDLIJST AS
	SELECT 	mhl_suppliers.ID,
			IF(p_address IS NULL or p_address = '', CONCAT(straat, ' ', huisnr), p_address) AS adres,
            IF(p_address IS NULL or p_address = '', postcode, p_postcode) AS postcode,
            IF(p_address IS NULL or p_address = '', city.name, p_city.name) AS stad
	FROM mhl_suppliers
    LEFT JOIN mhl_cities AS p_city ON mhl_suppliers.p_city_ID = p_city.ID
    LEFT JOIN mhl_cities AS city ON mhl_suppliers.city_ID = city.ID