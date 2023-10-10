SELECT
	s.name AS leverancier,
    IFNULL(c.name, 'tav de directie') AS aanhef,
	IF(ISNULL(p_postcode), p_address, CONCAT(straat, ' ', huisnr)) AS adres,
    IF(ISNULL(p_postcode), p_postcode, postcode) AS postcode,
    IF(ISNULL(p_postcode), cip.name, ci.name) AS stad,
	IF(ISNULL(p_postcode), dip.name, di.name) AS provincie
FROM mhl_suppliers AS s
LEFT JOIN mhl_contacts AS c ON s.ID=c.supplier_ID AND c.department=3
LEFT JOIN mhl_cities AS cip ON cip.ID=s.p_city_ID
LEFT JOIN mhl_communes AS cop ON cop.ID=cip.commune_ID
LEFT JOIN mhl_districts AS dip ON dip.ID=cop.district_ID
LEFT JOIN mhl_cities AS ci ON ci.ID=s.city_ID
LEFT JOIN mhl_communes AS co ON co.ID=ci.commune_ID
LEFT JOIN mhl_districts AS di ON di.ID=co.district_ID
WHERE postcode <> ''
ORDER BY provincie, stad, leverancier
   
