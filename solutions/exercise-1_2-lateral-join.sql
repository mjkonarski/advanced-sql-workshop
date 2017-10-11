SELECT title, actors.first_name, actors.last_name
FROM film f
LEFT JOIN LATERAL (

  SELECT first_name, last_name
  FROM film_actor fa
  JOIN actor a ON fa.actor_id = a.id
  WHERE fa.film_id = f.id
  ORDER BY a.last_name
  LIMIT 3

) actors ON true
ORDER BY title
