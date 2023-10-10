SELECT
	c.name AS Stad,
    SUM(IF(mt.name = 'Gold', 1, NULL)) Gold,
    SUM(IF(mt.name = 'Silver', 1, NULL)) Silver,
    SUM(IF(mt.name = 'Bronze', 1, NULL)) Bronze,
    SUM(IF(mt.name NOT IN ('Gold', 'Silver', 'Bronze'), 1, NULL)) Overige
FROM mhl_suppliers s
JOIN mhl_membertypes mt ON s.membertype = mt.ID
JOIN mhl_cities c ON city_ID = c.ID
GROUP BY city_ID
ORDER BY Gold DESC, Silver DESC, Bronze DESC, Overige DESC