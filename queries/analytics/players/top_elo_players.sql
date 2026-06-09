SELECT
    COALESCE(
        display_name,
        cs2_nickname,
        steam_persona_name,
        id
    ) AS player_name,
    elo
FROM users
WHERE elo IS NOT NULL
ORDER BY elo DESC
LIMIT 10;