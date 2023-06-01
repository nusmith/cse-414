SELECT DISTINCT F.flight_num AS flight_num 
FROM Flights AS F, Carriers AS C 
WHERE C.cid = F.carrier_id AND F.origin_city = 'Seattle WA' AND F.dest_city = 'Boston MA' AND C.name = 'Alaska Airlines Inc.' AND F.day_of_week_id = 1;


-- Query returns a list of 3 rows


