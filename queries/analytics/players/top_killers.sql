SELECT
    COALESCE(
        u.display_name,
        u.cs2_nickname,
        u.steam_persona_name,
        u.id
    ) AS player_name,
    SUM(mps.kills) AS total_kills
FROM match_player_stats mps
INNER JOIN users u
    ON mps.user_id = u.id
GROUP BY player_name
ORDER BY total_kills DESC
LIMIT 10;