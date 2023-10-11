SELECT 	mhl_suppliers.name,
		IF(ISNULL(directie.contact),'t.a.v. directie', directie.contact) contact,
        postadres.adres,
        postadres.postcode,
        postadres.stad
FROM mhl_suppliers
JOIN postadres ON postadres.ID = mhl_suppliers.ID
LEFT JOIN directie ON directie.supplier_ID = mhl_suppliers.ID