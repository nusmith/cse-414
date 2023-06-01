SELECT DISTINCT F.origin_city AS city

FROM Flights F

WHERE F.canceled = 0 AND F.origin_city NOT IN 
(SELECT F1.origin_city AS city1
FROM Flights F1
WHERE F1.actual_time >= 180)

ORDER BY F.origin_city ASC;



-- 109 lines of output
-- 12 seconds
/* First 20 Rows: 
Aberdeen SD
Abilene TX
Alpena MI
Ashland WV
Augusta GA
Barrow AK
Beaumont/Port Arthur TX
Bemidji MN
Bethel AK
Binghamton NY
Brainerd MN
Bristol/Johnson City/Kingsport TN
Butte MT
Carlsbad CA
Casper WY
Cedar City UT
Chico CA
College Station/Bryan TX
Columbia MO
Columbus GA
*/
