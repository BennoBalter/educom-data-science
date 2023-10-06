SELECT name, straat, huisnr, postcode
FROM mhl_suppliers
WHERE huisnr IN (10,11,12,13,14,15,16,17,18,19,20) OR huisnr > 100;