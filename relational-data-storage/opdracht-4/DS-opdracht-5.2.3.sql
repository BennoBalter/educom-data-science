SELECT 
	hc.year,
    SUM(hc.hitcount)
FROM mhl_hitcount hc
GROUP BY year