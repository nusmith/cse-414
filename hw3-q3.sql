WITH ShortFlights AS 
(SELECT F.origin_city AS origin, COUNT(*) AS ct
FROM Flights F
WHERE F.actual_time < 180 AND F.canceled = 0
GROUP BY F.origin_city),

Counts AS

(SELECT F.origin_city AS city, SF.ct AS ct
FROM Flights F
LEFT OUTER JOIN ShortFlights AS SF ON SF.origin = F.origin_city
GROUP BY F.origin_city, SF.ct)



SELECT F.origin_city AS city, (coalesce(C.ct, 0) * 1.0 / COUNT(F.origin_city) * 1.0) * 100 AS percentage

FROM Flights F, Counts C
 
WHERE F.canceled = 0 AND F.origin_city = C.city

GROUP BY F.origin_city, C.ct

ORDER BY percentage ASC, city ASC;


-- 327 lines of output
-- 9 seconds
/* First 20 lines
Guam TT|0.0
Pago Pago TT|0.0
Aguadilla PR|28.8973384030418
Anchorage AK|31.8120805369128
San Juan PR|33.6605316973415
Charlotte Amalie VI|39.5588235294118
Ponce PR|40.9836065573771
Fairbanks AK|50.1165501165501
Kahului HI|53.5144713526285
Honolulu HI|54.7390288236822
San Francisco CA|55.8288645371882
Los Angeles CA|56.0808908229873
Seattle WA|57.6093877922314
Long Beach CA|62.176439513999
New York NY|62.371834136728
Kona HI|63.1607929515419
Las Vegas NV|64.9202563720376
Christiansted VI|65.1006711409396
Newark NJ|65.8499710969807
Plattsburgh NY|66.6666666666667
*/

























