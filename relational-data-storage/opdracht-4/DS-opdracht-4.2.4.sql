SELECT s.name, pt.name, IFNULL(yn.content, "NOT SET") AS VALUE
FROM mhl_suppliers AS s
CROSS JOIN mhl_propertytypes AS pt
LEFT JOIN mhl_yn_properties AS yn ON s.ID = yn.supplier_ID AND pt.ID = yn.propertytype_ID
JOIN mhl_cities AS c ON s.city_ID = c.ID
WHERE c.name = "Amsterdam"