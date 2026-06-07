SELECT
    mg.selected_map,
    ROUND(
        AVG(mps.rating),
        2
    ) AS avg_rating
FROM match_player_stats mps
INNER JOIN match_games mg
    ON mps.match_id = mg.id
WHERE mg.status = 'finished'
GROUP BY mg.selected_map
ORDER BY avg_rating DESC;