SELECT
    mg.selected_map,
    SUM(mps.kills) AS total_kills
FROM match_player_stats mps
INNER JOIN match_games mg
    ON mps.match_id = mg.id
WHERE mg.status = 'finished'
GROUP BY mg.selected_map
ORDER BY total_kills DESC;