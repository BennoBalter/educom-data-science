SELECT name,
REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(name, '&eacute;', 'é'),'&ouml;', 'ö'), '&Uuml;', 'Ü'), '&euml;', 'ë'),'&egrave;', 'è'),'&iuml;','ï'), '&acirc;', 'â') AS name_spectok
FROM mhl_suppliers
WHERE name REGEXP '&[^\s]*;' LIMIT 25