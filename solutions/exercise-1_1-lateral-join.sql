SELECT c.name, f.title, f.score
FROM category c
JOIN LATERAL (

    SELECT f.title, f.score
    FROM film f
    WHERE f.category_id = c.id
    ORDER BY f.score DESC
    LIMIT 3

) f ON true
