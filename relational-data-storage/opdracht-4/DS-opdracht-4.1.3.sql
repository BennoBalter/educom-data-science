SELECT s.name, s.straat, s.huisnr, s.postcode
FROM mhl_suppliers_mhl_rubriek_view AS sr

JOIN mhl_suppliers AS s ON sr.mhl_suppliers_ID = s.ID
JOIN mhl_rubrieken AS r ON sr.mhl_rubriek_view_ID = r.ID
LEFT JOIN mhl_rubrieken AS r2 ON r.parent = r2.ID
JOIN mhl_cities AS c ON s.city_ID = c.ID 

WHERE c.name = "Amsterdam" AND (r.name = "drank" OR r2.name = "drank")

ORDER BY r.name, s.name