SELECT s.name, s.straat, s.huisnr, s.postcode, c.name
FROM mhl_suppliers AS s
JOIN mhl_cities AS c ON s.city_ID = c.ID
JOIN mhl_communes AS co ON c.commune_ID = co.ID AND co.name = "Steenwijkerland"