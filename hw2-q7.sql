SELECT SUM(F.capacity) AS capacity

FROM Flights F

WHERE ((F.dest_city = 'Seattle WA' AND F.origin_city = 'San Francisco CA') OR (F.dest_city = 'San Francisco CA' AND F.origin_city = 'Seattle WA')) AND F.month_id = 7 AND F.day_of_month = 10;


-- Query returns 1 row