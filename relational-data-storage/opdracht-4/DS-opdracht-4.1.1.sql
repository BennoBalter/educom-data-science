SELECT s.name, s.straat, s.huisnr, s.postcode
FROM mhl_suppliers s
INNER JOIN mhl_cities c ON s.city_ID = c.ID AND c.name="Amsterdam"