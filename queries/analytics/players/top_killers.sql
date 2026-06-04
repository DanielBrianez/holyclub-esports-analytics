SELECT
    u.username,
    SUM(mps.kills) AS total_kills
FROM match_player_stats mps
INNER JOIN users u
    ON mps.user_id = u.id
GROUP BY u.username
ORDER BY total_kills DESC
LIMIT 10;