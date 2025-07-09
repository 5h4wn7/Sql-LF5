ALTER TABLE kundendaten ADD KundenId INT (1) 

SET @id := 0;
UPDATE kundendaten
SET kundennr = (@id := @id + 1);

SELECT
ROW_NUMBER() OVER (ORDER BY Nachname, Vorname) As KundenID;
Vorname,
Nachname,
Adresse,
Hausnummer,
Postleitzahl,
Ort
FROM kundendaten;

SELECT COUNT(*) AS Anzahl
FROM kundendaten
WHERE Adresse = 'Wiesenweg'
AND Ort = 'Buxtehude';

SELECT COUNT(Ort) As maxort, Ort
FROM kundendaten
GROUP BY Ort
ORDER BY maxort DESC;