SELECT
    IFNULL(rp.name, rc.name) AS hoofdrubriek,
    IF(ISNULL(rp.name), '', rc.name) AS subrubriek
FROM mhl_rubrieken rp
RIGHT OUTER JOIN mhl_rubrieken rc ON rc.parent = rp.id
ORDER BY hoofdrubriek, subrubriek