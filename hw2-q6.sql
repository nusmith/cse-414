SELECT C.name AS carrier, MAX(F2.price) AS max_price

FROM Carriers C, Flights F, Flights F2

WHERE F.fid = F2.fid AND C.cid = F.carrier_id AND ((F.dest_city = 'Seattle WA' AND F.origin_city = 'New York NY') OR (F.dest_city = 'New York NY' AND F.origin_city = 'Seattle WA'))

GROUP BY F.carrier_id

HAVING F.price = MAX(F2.price);



-- Query returns a list of 3 rows