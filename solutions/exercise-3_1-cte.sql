WITH film_with_actors AS (
  SELECT f.*, count(*) AS actors
  FROM film f
  JOIN film_actor fa ON f.id = fa.film_id
  GROUP BY f.id
)

SELECT
  f.title, f.actors, a.title, a.actors, b.title, b.actors
FROM film_with_actors f
LEFT JOIN film_with_actors AS a ON f.prequel_id = a.id
LEFT JOIN film_with_actors AS b ON f.sequel_id = b.id

ORDER BY f.title
