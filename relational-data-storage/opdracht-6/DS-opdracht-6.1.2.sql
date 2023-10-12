SELECT 
    co.name AS gemeente, 
    s.name AS leverancier, 
    SUM(hc.hitcount) AS total_hitcount, 
    AVG(hc.hitcount) AS average_hitcount
FROM mhl_suppliers s
INNER JOIN mhl_cities c ON s.city_ID = c.id
INNER JOIN mhl_communes co ON c.commune_ID = co.id
INNER JOIN mhl_districts d ON co.district_ID = d.id
INNER JOIN mhl_hitcount hc ON hc.supplier_ID = s.id
WHERE d.country_ID = (
    SELECT id
    FROM mhl_countries
    WHERE name = 'Nederland'
)
GROUP BY co.name, s.name
HAVING SUM(hc.hitcount) > AVG(hc.hitcount)
ORDER BY gemeente, (SUM(hc.hitcount) - AVG(hc.hitcount)) DESC;