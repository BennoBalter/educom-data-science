SELECT 
	c1.name as c1_name, 
	c1.ID AS c1_ID, 
	c1.commune_ID AS c1_commune_ID, 
    co1.ID AS co_ID,
    co1.name AS co1_name,
	c2.name AS c2_name, 
	c2.ID AS c2_ID, 
	c2.commune_ID AS c2_commune_ID,
    co2.name AS co2_name,
    co2.ID AS co2_ID
FROM mhl_cities c1
JOIN mhl_cities AS c2 ON c1.name = c2.name
JOIN mhl_communes AS co1 ON c1.commune_ID = co1.ID
JOIN mhl_communes AS co2 ON c2.commune_ID = co2.ID
WHERE c1.ID < c2.ID
ORDER BY c1.name