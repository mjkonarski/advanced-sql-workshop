SELECT c.name, f.title, f.score
FROM category c
JOIN (

  SELECT
    f.title, f.category_id, f.score,
    @rank:=IF(@cur_cat = category_id, @rank + 1, 1) AS rank,
    @cur_cat:=category_id
  FROM film f
  ORDER BY category_id, score DESC

) f ON c.id = f.category_id
WHERE f.rank <= 3
