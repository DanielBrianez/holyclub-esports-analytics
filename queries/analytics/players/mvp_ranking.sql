SELECT
    COALESCE(
        u.display_name,
        u.cs2_nickname,
        u.steam_persona_name,
        u.id
    ) AS player_name,
    COUNT(*) AS total_mvps
FROM match_player_stats mps
INNER JOIN users u
    ON mps.user_id = u.id
WHERE mps.is_mvp = 1
GROUP BY player_name
ORDER BY total_mvps DESC
LIMIT 10;