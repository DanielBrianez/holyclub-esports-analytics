SELECT
    u.username,
    COUNT(*) AS total_mvps
FROM match_player_stats mps
INNER JOIN users u
    ON mps.user_id = u.id
WHERE mps.is_mvp = 1
GROUP BY u.username
ORDER BY total_mvps DESC
LIMIT 10;