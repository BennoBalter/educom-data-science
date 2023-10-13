SELECT 	ID,
		DATE_FORMAT(joindate, GET_FORMAT(DATE, 'EUR')) AS joindate
FROM mhl_suppliers
WHERE DATEDIFF(LAST_DAY(joindate), joindate) <= 7;