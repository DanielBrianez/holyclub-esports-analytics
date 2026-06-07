SELECT
    COALESCE(
        u.display_name,
        u.cs2_nickname,
        u.steam_persona_name,
        u.id
    ) AS player_name,
    COUNT(*) AS matches_played
FROM match_player_stats mps
INNER JOIN users u
    ON mps.user_id = u.id
GROUP BY player_name
ORDER BY matches_played DESC
LIMIT 10;