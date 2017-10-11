SELECT
    f.title, COUNT(*)
FROM
    film f
JOIN
    film_actor fa ON f.id = fa.film_id
WHERE
    f.release_year = 2016
GROUP BY f.id
HAVING COUNT(*) >= 8
ORDER BY title
