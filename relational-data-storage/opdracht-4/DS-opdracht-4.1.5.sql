SELECT s.name, s.straat, s.huisnr, s.postcode
FROM mhl_suppliers AS s, pc_lat_long AS ll
WHERE s.postcode = ll.pc6
ORDER BY ll.lat DESC LIMIT 5
