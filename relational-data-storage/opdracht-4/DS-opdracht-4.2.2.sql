SELECT c.name AS city_name, IFNULL(co.name,"INVALID")
FROM mhl_cities c
LEFT JOIN mhl_communes co ON c.commune_ID = co.ID
