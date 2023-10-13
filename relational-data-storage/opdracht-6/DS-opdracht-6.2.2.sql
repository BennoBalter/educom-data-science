SELECT	ID,
		DATE_FORMAT(joindate, GET_FORMAT(DATE, 'EUR')) AS joindate,
        DATEDIFF(CURDATE(), joindate) AS days_member
FROM mhl_suppliers
ORDER BY days_member ASC