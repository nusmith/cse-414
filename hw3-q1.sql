WITH MaxTime AS 
(SELECT F1.origin_city AS origin, MAX(F1.actual_time) AS t 
FROM Flights F1 
GROUP BY F1.origin_city)

SELECT DISTINCT F2.origin_city AS origin_city, F2.dest_city AS dest_city, F2.actual_time AS time

FROM Flights F2, MaxTime MT

WHERE MT.origin = F2.origin_city AND MT.t = F2.actual_time

ORDER BY F2.origin_city ASC, F2.dest_city ASC;



-- 334 lines of output
-- 6 seconds
/* First 20 Rows: 
Aberdeen SD|Minneapolis MN|106
Abilene TX|Dallas/Fort Worth TX|111
Adak Island AK|Anchorage AK|471
Aguadilla PR|New York NY|368
Akron OH|Atlanta GA|408
Albany GA|Atlanta GA|243
Albany NY|Atlanta GA|390
Albuquerque NM|Houston TX|492
Alexandria LA|Atlanta GA|391
Allentown/Bethlehem/Easton PA|Atlanta GA|456
Alpena MI|Detroit MI|80
Amarillo TX|Houston TX|390
Anchorage AK|Barrow AK|490
Appleton WI|Atlanta GA|405
Arcata/Eureka CA|San Francisco CA|476
Asheville NC|Chicago IL|279
Ashland WV|Cincinnati OH|84
Aspen CO|Los Angeles CA|304
Atlanta GA|Honolulu HI|649
Atlantic City NJ|Fort Lauderdale FL|212
*/

