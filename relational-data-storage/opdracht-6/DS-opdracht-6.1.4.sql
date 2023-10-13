-- SELECT
--     rubrieken_suppliers.rubriek,
--     IFNULL(
--         (SELECT SUM(hitcount) AS total
--          FROM mhl_hitcount h
--          WHERE h.supplier_id IN (
--              SELECT mhl_suppliers_ID
--              FROM mhl_suppliers_mhl_rubriek_view
--              WHERE mhl_rubriek_view_ID = rubrieken_suppliers.id)
--         ), 'Geen hits') AS total
-- FROM (
--     SELECT
--         rc.id,
--         IFNULL(rp.name, rc.name) AS rubriek,
--         IFNULL(rp.name, rc.name) AS hoofdrubriek,
--         IF(ISNULL(rp.name), ' ', rc.name) AS subrubriek
--     FROM mhl_rubrieken rp
--     RIGHT OUTER JOIN mhl_rubrieken rc ON rc.parent = rp.id
--     ORDER BY rubriek
-- ) AS rubrieken_suppliers;


CREATE OR REPLACE VIEW rubrieken AS
  SELECT
    IFNULL(rc.id, rp.id) as id,
    IF(ISNULL(rp.name), rc.name, CONCAT(rp.name, ' - ', rc.name)) AS rubriek,
    IFNULL(rp.name, rc.name) AS hoofdrubriek,
    IF(ISNULL(rp.name), ' ', rc.name) AS subrubriek
  FROM
    mhl_rubrieken rp
  RIGHT OUTER JOIN
    mhl_rubrieken rc ON rc.parent = rp.id
  ORDER BY
    rubriek

SELECT
    rubrieken.rubriek,
    IFNULL((
        SELECT SUM(hitcount) AS total
        FROM mhl_hitcount
        WHERE supplier_id IN (
            SELECT mhl_suppliers_ID
            FROM mhl_suppliers_mhl_rubriek_view
            WHERE mhl_rubriek_view_ID = rubrieken.id
            )
        ), 'Geen hits') AS total
FROM rubrieken