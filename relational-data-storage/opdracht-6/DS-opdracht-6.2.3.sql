SELECT	DAYNAME(joindate) as dag,
		COUNT(ID) AS aantal_supp_leden
FROM mhl_suppliers
GROUP BY DAYNAME(joindate), DAYOFWEEK(joindate)
ORDER BY DAYOFWEEK(joindate)