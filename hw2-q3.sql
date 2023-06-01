SELECT W.day_of_week AS day_of_week, AVG(F.arrival_delay) AS delay

FROM Weekdays AS W, Flights AS F

WHERE W.did = F.day_of_week_id

GROUP BY W.day_of_week

ORDER BY AVG(F.arrival_delay) DESC

LIMIT 1;



-- Query returns 1 row