SELECT
  f.title, f.release_year, f.score,

  RANK() OVER
    (ORDER BY score DESC) AS general_rank,

  RANK() OVER
    (PARTITION BY category_id ORDER BY score DESC)
    AS category_rank

FROM film f
ORDER BY f.title
