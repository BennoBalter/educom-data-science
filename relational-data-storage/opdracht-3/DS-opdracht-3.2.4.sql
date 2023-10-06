SELECT name, straat, huisnr, postcode
FROM mhl_suppliers
WHERE city_ID=104 OR p_city_ID=(SELECT DISTINCT c.id
								FROM mhl_cities AS c 
								JOIN mhl_suppliers AS s ON s.city_ID = c.id 
								WHERE c.name = 'Den Haag');