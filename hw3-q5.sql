
WITH Indirect AS

(SELECT DISTINCT F2.dest_city AS city
FROM Flights F1, Flights F2
WHERE F1.month_id = F2.month_id AND F1.day_of_month = F2.day_of_month AND F1.origin_city = 'Seattle WA' AND F1.dest_city = F2.origin_city AND F2.dest_city NOT IN (SELECT DISTINCT F.dest_city as destination FROM Flights F WHERE F.origin_city = 'Seattle WA')
),


Direct AS

(SELECT DISTINCT F.dest_city AS city
FROM Flights F
WHERE F.origin_city = 'Seattle WA'
)


SELECT Distinct F.dest_city AS city
FROM Flights F, DIRECT D, INDIRECT I
WHERE F.dest_city NOT IN (SELECT * FROM Direct) AND F.dest_city NOT IN (SELECT * FROM Indirect)
ORDER BY city ASC;



-- 3 lines
-- 106 seconds
/* First 3 lines
Devils Lake ND
Hattiesburg/Laurel MS
St. Augustine FL
*/


