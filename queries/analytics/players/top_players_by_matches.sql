SELECT
    u.id AS user_id,
    COUNT(*) AS total_matches
FROM match_player_stats mps
INNER JOIN users u
    ON mps.user_id = u.id
GROUP BY u.id
ORDER BY total_matches DESC
LIMIT 10;