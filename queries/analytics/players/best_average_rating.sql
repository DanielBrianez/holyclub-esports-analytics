SELECT
    u.username,
    ROUND(AVG(mps.rating),2) AS avg_rating
FROM match_player_stats mps
INNER JOIN users u
    ON mps.user_id = u.id
GROUP BY u.username
HAVING COUNT(*) >= 5
ORDER BY avg_rating DESC
LIMIT 10;