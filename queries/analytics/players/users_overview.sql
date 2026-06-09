SELECT
    COALESCE(
        u.display_name,
        u.cs2_nickname,
        u.steam_persona_name,
        u.id
    ) AS player_name,
    COUNT(*) AS total_matches
FROM match_player_stats mps
INNER JOIN users u
    ON mps.user_id = u.id
GROUP BY player_name
ORDER BY total_matches DESC
LIMIT 10;