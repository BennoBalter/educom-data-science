SELECT c1.name as c1_name, 
	c1.ID AS c1_ID, 
	c1.commune_ID AS c1_commune_ID, 
	c2.name AS c2_name, 
	c2.ID AS c2_ID, 
	c2.commune_ID AS c2_commune_ID
FROM mhl_cities c1
JOIN mhl_cities AS c2 ON c1.name = c2.name
WHERE c1.ID != c2.ID
ORDER BY c1.name