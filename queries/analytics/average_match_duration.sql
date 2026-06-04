SELECT
    AVG(
        TIMESTAMPDIFF(
            MINUTE,
            started_at,
            ended_at
        )
    ) AS avg_match_duration
FROM match_games
WHERE status = 'finished';