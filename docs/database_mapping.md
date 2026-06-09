# Database Mapping

## Core Entities

### users

Stores player profile information.

Key columns:

- id (PK)
- display_name
- elo
- cs2_nickname
- created_at

---

### match_player_stats

Stores player performance metrics.

Key columns:

- id (PK)
- user_id (FK)
- match_id (FK)
- kills
- deaths
- assists
- rating

---

### match_games

Stores match information.

Key columns:

- id (PK)
- selected_map
- status
- score_team_a
- score_team_b

---

## Relationships

users.id
↓
match_player_stats.user_id

match_games.id
↓
match_player_stats.match_id