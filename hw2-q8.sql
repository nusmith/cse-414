SELECT C.Name AS name, SUM(F.departure_delay) AS delay
FROM Flights F, Carriers C
WHERE C.cid = F.carrier_id
GROUP BY C.Name


-- Query returns 22 rows