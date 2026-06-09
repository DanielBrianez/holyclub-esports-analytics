SELECT
    COALESCE(
        u.display_name,
        u.cs2_nickname,
        u.steam_persona_name,
        u.id
    ) AS player_name,
    u.elo,
    SUM(mps.kills) AS total_kills,
    SUM(mps.deaths) AS total_deaths,
    ROUND(
        SUM(mps.kills) / NULLIF(SUM(mps.deaths), 0),
        2
    ) AS kd_ratio,
    COUNT(*) AS matches_played
FROM users u
INNER JOIN match_player_stats mps
    ON u.id = mps.user_id
GROUP BY
    player_name,
    u.elo
HAVING COUNT(*) >= 5
ORDER BY u.elo DESC
LIMIT 20;