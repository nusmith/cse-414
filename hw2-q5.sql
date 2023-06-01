SELECT C.Name AS name, (AVG(F.canceled)*100 + '%') AS percent

FROM Carriers AS C, Flights AS F

WHERE C.cid = F.carrier_id AND F.origin_city = 'Seattle WA'

GROUP BY C.Name

HAVING AVG(F.canceled) > 0.005;




-- Query returns a list of 6 rows







