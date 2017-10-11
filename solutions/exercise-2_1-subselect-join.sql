SELECT
  f.title, f.release_year, f.score,
  years.year_avg
FROM film f
LEFT JOIN (

  SELECT f.release_year, ROUND(AVG(score), 2) AS year_avg
    FROM film f GROUP BY f.release_year

) years ON f.release_year = years.release_year
ORDER BY f.title
