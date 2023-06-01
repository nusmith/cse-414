SELECT DISTINCT F2.dest_city AS city

FROM Flights F1, Flights F2

WHERE F1.month_id = F2.month_id AND F1.day_of_month = F2.day_of_month AND F1.origin_city = 'Seattle WA' AND F1.dest_city = F2.origin_city AND F2.dest_city != 'Seattle WA' AND F2.dest_city NOT IN (SELECT DISTINCT F.dest_city as destination FROM Flights F WHERE F.origin_city = 'Seattle WA')

ORDER BY city ASC;



-- 256 lines
-- 3 seconds
/* First 20 lines
Aberdeen SD
Abilene TX
Adak Island AK
Aguadilla PR
Akron OH
Albany GA
Albany NY
Alexandria LA
Allentown/Bethlehem/Easton PA
Alpena MI
Amarillo TX
Appleton WI
Arcata/Eureka CA
Asheville NC
Ashland WV
Aspen CO
Atlantic City NJ
Augusta GA
Bakersfield CA
Bangor ME
*/
