SELECT 	s.name as supplier_name,
		SUM(hc.hitcount) hits,
        COUNT(hc.month) months,
        AVG(hc.hitcount) as avg_hitcount
FROM mhl_hitcount hc
JOIN mhl_suppliers s ON s.ID = hc.supplier_ID
GROUP BY s.name