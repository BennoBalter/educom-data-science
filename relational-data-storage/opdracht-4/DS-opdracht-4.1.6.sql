SELECT
    s.name,
    c.name,
    co.name,
    d.name,
    hc.hitcount
FROM mhl_suppliers s
JOIN mhl_cities c ON s.city_ID = c.ID
JOIN mhl_communes co ON c.commune_ID = co.ID
JOIN mhl_districts d ON co.district_ID = d.ID
JOIN mhl_hitcount hc ON hc.supplier_ID = s.ID AND hc.month = 1 AND hc.year = 2014
WHERE d.name IN ("Limburg", "Noord-Brabant", "Zeeland")
