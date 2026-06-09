SELECT
    COALESCE(
        u.display_name,
        u.cs2_nickname,
        u.steam_persona_name,
        u.id
    ) AS player_name,
    u.elo,
    ROUND(AVG(mps.rating), 2) AS avg_rating,
    COUNT(*) AS matches_played
FROM users u
INNER JOIN match_player_stats mps
    ON u.id = mps.user_id
GROUP BY player_name, u.elo
HAVING COUNT(*) >= 5
ORDER BY u.elo DESC
LIMIT 20;