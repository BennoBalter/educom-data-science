SELECT 	COUNT(id) AS aantal_leveranciers,
		MONTHNAME(joindate) AS maand,
        YEAR(joindate) AS jaar
FROM mhl_suppliers
GROUP BY MONTH(joindate), YEAR(joindate)
ORDER BY YEAR(joindate), MONTH(joindate)