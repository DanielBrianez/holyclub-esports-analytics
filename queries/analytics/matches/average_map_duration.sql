SELECT
    selected_map,
    AVG(
        TIMESTAMPDIFF(
            MINUTE,
            started_at,
            ended_at
        )
    ) AS avg_duration
FROM match_games
WHERE status = 'finished'
GROUP BY selected_map
ORDER BY avg_duration DESC;