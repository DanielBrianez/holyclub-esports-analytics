SELECT
    COALESCE(
        u.display_name,
        u.cs2_nickname,
        u.steam_persona_name,
        u.id
    ) AS player_name,
    u.elo,
    COUNT(*) AS matches_played,
    SUM(mps.kills) AS total_kills,
    SUM(mps.deaths) AS total_deaths,
    SUM(mps.assists) AS total_assists,
    COUNT(
        CASE
            WHEN mps.is_mvp = 1 THEN 1
        END
    ) AS total_mvps,
    ROUND(AVG(mps.rating), 2) AS avg_rating,
    ROUND(
        SUM(mps.kills) / NULLIF(SUM(mps.deaths), 0),
        2
    ) AS kd_ratio
FROM users u
INNER JOIN match_player_stats mps
    ON u.id = mps.user_id
GROUP BY
    player_name,
    u.elo
ORDER BY total_kills DESC;