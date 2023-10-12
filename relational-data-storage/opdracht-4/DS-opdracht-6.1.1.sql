CREATE TABLE months (
	id int, 
    name varchar(255)
);

INSERT INTO months (id, name)
VALUES 	(1,'Januari'),
		(2,'Februari'),
		(3,'Maart'),
		(4,'April'),
		(5,'Mei'),
		(6,'Juni'),
		(7,'Juli'),
		(8,'Augustus'),
		(9,'September'),
		(10, 'Oktober'),
		(11,'November'),
		(12,'December');
        
SELECT 	year,
		name,
        aantal_leveranciers,
        totaal_aantal_hits
FROM
	(SELECT 
		mhl_hitcount.year,
		mhl_hitcount.month,
		COUNT(supplier_ID) AS 'aantal_leveranciers',
		SUM(mhl_hitcount.hitcount) AS 'totaal_aantal_hits'
	FROM mhl_hitcount
	GROUP BY year, month
	ORDER BY year, month) AS tot_lev_hits
JOIN months ON month = months.id
ORDER BY year DESC, months.name ASC
    
    
    