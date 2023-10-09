SELECT s.name, s.straat, s.huisnr, s.postcode
FROM mhl_yn_properties AS pr

JOIN mhl_suppliers AS s ON pr.supplier_ID = s.ID
JOIN mhl_propertytypes as prt ON pr.propertytype_ID = prt.ID

WHERE prt.name = "specialistische leverancier" OR prt.name = "ook voor particulieren"
