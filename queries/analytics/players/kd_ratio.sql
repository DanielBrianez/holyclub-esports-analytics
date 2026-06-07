SELECT
    COALESCE(
        u.display_name,
        u.cs2_nickname,
        u.steam_persona_name,
        u.id
    ) AS player_name,
    SUM(mps.kills) AS total_kills,
    SUM(mps.deaths) AS total_deaths,
    ROUND(
        SUM(mps.kills) / NULLIF(SUM(mps.deaths),0),
        2
    ) AS kd_ratio
FROM match_player_stats mps
INNER JOIN users u
    ON mps.user_id = u.id
GROUP BY player_name
HAVING COUNT(*) >= 5
ORDER BY kd_ratio DESC
LIMIT 10;