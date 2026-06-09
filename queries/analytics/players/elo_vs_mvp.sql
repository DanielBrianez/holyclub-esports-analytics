SELECT
    COALESCE(
        u.display_name,
        u.cs2_nickname,
        u.steam_persona_name,
        u.id
    ) AS player_name,
    u.elo,
    COUNT(
        CASE
            WHEN mps.is_mvp = 1 THEN 1
        END
    ) AS total_mvps,
    COUNT(*) AS matches_played,
    ROUND(
        COUNT(
            CASE
                WHEN mps.is_mvp = 1 THEN 1
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS mvp_rate
FROM users u
INNER JOIN match_player_stats mps
    ON u.id = mps.user_id
GROUP BY
    player_name,
    u.elo
HAVING COUNT(*) >= 5
ORDER BY u.elo DESC
LIMIT 20;