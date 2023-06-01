WITH T1 AS (SELECT DISTINCT C.Name as name, F.month_id, F.day_of_month

FROM Carriers AS C, Flights F

WHERE C.cid = F.carrier_id

GROUP BY C.Name, F.month_id, F.day_of_month

HAVING COUNT(*) > 1000) 

SELECT DISTINCT T1.name as name

FROM T1;



-- Query returns 12 rows