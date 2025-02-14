//1.              Care este procentul de bilete vandute din fiecare sala
SELECT h.hall_ID AS "ID",
    h.hall_name AS "Sala", 
    h.capacity AS "Capacitatea",
    COUNT(t.ticket_ID)/(SELECT COUNT(*) * h.capacity 
        FROM projection 
        WHERE hall_ID = h.hall_ID) * 100 AS "Procent bilete vandute"
FROM hall h
JOIN projection p ON p.hall_ID = h.hall_ID
LEFT JOIN ticket t ON t.projection_ID = p.projection_ID AND t.client_ID IS NOT NULL
GROUP BY h.hall_ID, h.hall_name, h.capacity
ORDER BY "Procent bilete vandute" DESC;     


//2.              Care este procentul de bilete vandute pentru fiecare film
SELECT m.movie_ID AS "ID",
    m.movie_title AS "Film", 
    m.movie_duration AS "Durata",
    COUNT(t.ticket_ID)/NVL((SELECT SUM(h.capacity)
        FROM projection p2, hall h
        WHERE p2.hall_ID = h.hall_ID AND p2.movie_ID = m.movie_ID), 1) * 100 AS "Procent bilete vandute"
FROM movie m
JOIN projection p ON p.movie_ID = m.movie_ID
JOIN hall h ON p.hall_ID = h.hall_ID
LEFT JOIN ticket t ON t.projection_ID = p.projection_ID AND t.client_ID IS NOT NULL
GROUP BY m.movie_ID, m.movie_title, m.movie_duration
ORDER BY "Procent bilete vandute" DESC, "ID";


//3.              Care este procentul de bilete vandute pentru fiecare status
SELECT s.status_ID AS "ID", 
    s.status_name AS "Status", 
    s.discount_percentage AS "Discount",
    COUNT(t.ticket_ID)/(SELECT COUNT(*)
        FROM ticket) * 100 AS "Procent bilete vandute"
FROM status s
LEFT JOIN ticket t ON t.status_ID = s.status_ID AND t.client_ID IS NOT NULL
GROUP BY s.status_ID, s.status_name, s.discount_percentage
ORDER BY "Procent bilete vandute" DESC, "ID" ASC


//4.              Care este clientul ce a cumparat cele mai multe bilete
SELECT c.client_ID AS "ID",
    c.first_name || ' ' || c.last_name AS "Nume",
    COUNT(t.ticket_ID) AS "Bilete cumparate"
FROM client c, ticket t
WHERE t.client_ID = c.client_ID
GROUP BY c.client_ID, c.first_name, c.last_name
HAVING COUNT(t.ticket_ID) = (SELECT MAX(COUNT(t2.ticket_ID))
    FROM client c2, ticket t2
    WHERE t2.client_ID = c2.client_ID
    GROUP BY c2.client_ID)