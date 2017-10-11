SELECT f.title, COUNT(*),
  a.title, a.actors, b.title, b.actors
FROM film f JOIN film_actor fa ON f.id = fa.film_id

LEFT JOIN (SELECT f.*, COUNT(*) AS actors
  FROM film f JOIN film_actor fa ON f.id = fa.film_id
  GROUP BY f.id) a ON a.id = f.prequel_id

LEFT JOIN (SELECT f.*, COUNT(*) AS actors
  FROM film f JOIN film_actor fa ON f.id = fa.film_id
  GROUP BY f.id) b ON b.id = f.sequel_id

GROUP BY f.id
ORDER BY f.title
