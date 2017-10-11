WITH RECURSIVE films_with_prequels_number AS (
	SELECT f.id, f.sequel_id, 0 AS prequels_num FROM film f WHERE f.prequel_id IS NULL

    UNION ALL

    SELECT f.id, f.sequel_id, fr.prequels_num + 1 AS prequels_num
    FROM films_with_prequels_number fr
    JOIN film f ON fr.sequel_id = f.id
),

films_with_sequels_number AS (
	SELECT f.id, f.prequel_id, 0 AS sequels_num FROM film f WHERE f.sequel_id IS NULL

    UNION ALL

    SELECT f.id, f.prequel_id, fr.sequels_num + 1 AS sequels_num
    FROM films_with_sequels_number fr
    JOIN film f ON fr.prequel_id = f.id
)

SELECT f.title, fpn.prequels_num, fsn.sequels_num FROM film f
LEFT JOIN films_with_prequels_number fpn ON f.id = fpn.id
LEFT JOIN films_with_sequels_number fsn ON f.id = fsn.id

ORDER BY f.title
