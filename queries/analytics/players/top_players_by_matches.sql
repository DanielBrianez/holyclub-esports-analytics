SELECT
    u.username,
    COUNT(*) AS total_matches
FROM match_player_stats mps
INNER JOIN users u
    ON mps.user_id = u.id
GROUP BY u.username
ORDER BY total_matches DESC
LIMIT 10;