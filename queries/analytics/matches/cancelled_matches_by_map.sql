SELECT
    selected_map,
    COUNT(*) AS cancelled_matches
FROM match_games
WHERE status = 'cancelled'
GROUP BY selected_map
ORDER BY cancelled_matches DESC;