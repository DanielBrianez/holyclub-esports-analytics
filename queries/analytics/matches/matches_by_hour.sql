SELECT
    HOUR(created_at) AS hour,
    COUNT(*) AS total_matches
FROM match_games
GROUP BY hour
ORDER BY hour;