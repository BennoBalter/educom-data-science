SELECT 	s.name, 
		s.straat, 
        s.huisnr, 
        s.postcode 
FROM mhl_suppliers AS s 
JOIN mhl_cities AS c ON s.city_ID = c.id 
WHERE c.name = 'Amsterdam' AND s.p_city_ID <> 104;