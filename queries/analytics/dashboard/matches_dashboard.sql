SELECT
    status,
    COUNT(*) AS total_matches
FROM match_games
GROUP BY status
ORDER BY total_matches DESC;