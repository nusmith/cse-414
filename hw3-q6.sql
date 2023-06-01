
SELECT DISTINCT C.name AS carrier
FROM Carriers C, Flights F
WHERE C.cid = F.carrier_id AND F.carrier_id IN (SELECT F1.carrier_id FROM Flights F1 WHERE F1.origin_city = 'Seattle WA' AND F1.dest_city = 'San Francisco CA')
ORDER BY carrier ASC;


-- 4 lines
-- 0 seconds
/* First 4 lines
Alaska Airlines Inc.
SkyWest Airlines Inc.
United Air Lines Inc.
Virgin America
*/