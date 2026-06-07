SELECT
    selected_map,
    COUNT(*) AS total_matches
FROM match_games
WHERE selected_map IS NOT NULL
GROUP BY selected_map
ORDER BY total_matches DESC;