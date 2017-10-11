WITH film_with_category AS (
  SELECT f.*, cat.name AS category_name
  FROM film f
  JOIN category cat ON cat.id = f.category_id
)

SELECT
  f.title, f.category_name, a.title, a.category_name, b.title, b.category_name
FROM film_with_category AS f
LEFT JOIN film_with_category AS a ON f.prequel_id = a.id
LEFT JOIN film_with_category AS b ON f.sequel_id = b.id

ORDER BY f.title
