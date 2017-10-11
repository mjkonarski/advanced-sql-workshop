SELECT
  f.title, f.release_year, f.score,

  AVG(score) OVER
    (PARTITION BY release_year) AS year_avg,

  AVG(score) OVER
    (PARTITION BY category_id) AS category_avg

FROM film f
ORDER BY f.title
