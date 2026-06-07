SELECT
    mg.selected_map,
    ROUND(
        SUM(mps.kills) /
        NULLIF(SUM(mps.deaths),0),
        2
    ) AS avg_kd
FROM match_player_stats mps
INNER JOIN match_games mg
    ON mps.match_id = mg.id
WHERE mg.status = 'finished'
GROUP BY mg.selected_map
ORDER BY avg_kd DESC;