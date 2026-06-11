SELECT
    mg.selected_map,
    COUNT(DISTINCT mg.id) AS total_matches,
    SUM(mps.kills) AS total_kills,
    ROUND(AVG(mps.rating), 2) AS avg_rating,
    ROUND(
        SUM(mps.kills) / NULLIF(SUM(mps.deaths), 0),
        2
    ) AS avg_kd
FROM match_games mg
INNER JOIN match_player_stats mps
    ON mg.id = mps.match_id
WHERE mg.selected_map IS NOT NULL
GROUP BY mg.selected_map
ORDER BY total_matches DESC;