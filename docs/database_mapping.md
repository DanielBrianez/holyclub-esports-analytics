# users

Stores platform user information.

Important columns:
- id
- username
- created_at
- elo
- status

---

# match_games

Stores competitive match information.

Key analytical columns:
- id: unique match identifier
- started_at: match start timestamp
- ended_at: match end timestamp
- status: current match status
- selected_map: selected CS2 map
- score_team_a: final score for team A
- score_team_b: final score for team B
- server_id: server used in the match
- queue_id: matchmaking queue
- mvp_user_id: match MVP
- has_overtime: indicates overtime
- elo_deltas: ELO variation after match

Possible KPIs:
- Total matches
- Completed matches
- Matches by status
- Most played maps
- Average match duration
- Overtime rate
- Average score by team
- Matches by server
- MVP ranking