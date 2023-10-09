SELECT c.name, co.ID
FROM mhl_cities c
LEFT JOIN mhl_communes co ON c.commune_ID = co.ID
WHERE ISNULL(co.name)