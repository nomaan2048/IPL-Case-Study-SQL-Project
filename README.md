# IPL-Case-Study-SQL-Project

In this project, we will analyze IPL cricket data to uncover insights into team performances, player statistics, and match outcomes.

🏏 We will use SQL to extract, transform, and analyze data from match-level and ball-by-ball datasets.

🏏 The analysis will provide insights into key areas such as the most successful players, team strategies, and factors influencing match results.

🏏 We will explore relationships between variables such as batting performance, bowling effectiveness, and match-winning strategies to gain a deeper understanding of the game.

# DATA:
This project utilizes IPL cricket data from two CSV files, providing match-level and ball-by-ball details for analysis.

- 'matches.csv':  
  Contains match-level data, including:
  - Match ID, season, city, and date of the match.
  - Teams involved (team1 and team2), toss winner, and toss decision.
  - Match result details like winner, victory margin (runs/wickets), and whether Duckworth-Lewis method was applied.
  - Player of the Match, venue, and umpire information.

- 'deliveries.csv':  
  Provides ball-by-ball details for each match, including:
  - Match ID, inning number, batting and bowling teams.
  - Over and ball numbers, batsman, non-striker, and bowler names.
  - Runs scored (batsman runs, extras, total runs) and dismissal details (player dismissed, dismissal kind, fielder).
 
# SQL Functions Used:
- Joins
- CTEs
- Case statements
- Logical conditions
- Aggregate Functions

# IMPORTANT INSIGHTS:-
- Andre Russell has the highest strike rate among batsmen who scored at least 200 runs.
- Kings XI Punjab (21.73) and Rajasthan Royals (21.50) were the most boundary-hitting teams, while Royal Challengers Bangalore had the lowest average (17.57).
- Chennai Super Kings (18.67) and Mumbai Indians (19.50) led in boundaries, whereas Rajasthan Royals struggled with an average of only 11.
- Yusuf Pathan and Shaun Marsh have each won the "Player of the Match" award 5 times, showcasing their consistent match-winning performances. Shane Watson follows closely with 4 awards, highlighting his all-round contributions to his team's success.
- Brendon McCullum scored an unbeaten 158 runs off 73 balls for Kolkata Knight Riders (KKR) against Royal Challengers Bangalore (RCB) in the inaugural IPL match on April 18, 2008, at Bengaluru. His innings included 10 fours and 13 sixes, achieving a strike rate of 216.43
