SELECT
  f.title, f.release_year, f.score,
  years.year_avg, categories.category_avg
FROM film f

LEFT JOIN
  (SELECT f.release_year, ROUND(AVG(score), 2) AS year_avg
    FROM film f GROUP BY f.release_year) years
  ON f.release_year = years.release_year

LEFT JOIN
  (SELECT f.category_id, ROUND(AVG(score), 2) AS category_avg
    FROM film f GROUP BY f.category_id) categories
 ON f.category_id = categories.category_id

ORDER BY f.title
