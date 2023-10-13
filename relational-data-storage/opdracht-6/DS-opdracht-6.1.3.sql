SELECT
    rubrieken_suppliers.hoofdrubriek,
    rubrieken_suppliers.subrubriek,
    (SELECT COUNT(mhl_suppliers_ID)
     FROM mhl_suppliers_mhl_rubriek_view
     WHERE mhl_rubriek_view_ID = rubrieken_suppliers.id) AS aantal_sup_rub
FROM (	SELECT
			rc.id,
			IFNULL(rp.name, rc.name) AS hoofdrubriek,
			IF(ISNULL(rp.name), ' ', rc.name) AS subrubriek
		FROM mhl_rubrieken rp
		RIGHT OUTER JOIN mhl_rubrieken rc ON rc.parent = rp.id
		ORDER BY hoofdrubriek) AS rubrieken_suppliers
ORDER BY hoofdrubriek