#Q1: Top 5 players with most man of the match awards
SELECT player_of_match, COUNT(*) AS awards_count
FROM matches
GROUP BY player_of_match
ORDER BY awards_count DESC
LIMIT 5;

#Q2: Matches won by each team in each season
SELECT season, winner as team, count(*) AS matches_won
FROM matches
GROUP BY season, winner
ORDER BY season, matches_won DESC;

#Q3: Average Strike Rate of Batsmen
WITH cte AS (
SELECT batsman, (sum(total_runs)/count(ball))*100 AS strike_rate 
FROM deliveries
GROUP BY batsman)
SELECT avg(strike_rate) AS average_strike_rate FROM cte;

#Q4: Number of matches won by each team batting first v/s batting second
WITH cte AS(
SELECT CASE WHEN win_by_runs > 0 THEN team1
ELSE team2 END AS batting_first
FROM matches
WHERE result != 'Tie')
SELECT batting_first, count(*) AS matches_won
FROM cte
GROUP BY batting_first;

#Q5: Batsman having highest strike rate (minimum 200 runs scored)
SELECT batsman, (sum(batsman_runs)/count(*))*100 AS strike_rate 
FROM deliveries
GROUP BY batsman
HAVING sum(batsman_runs) >= 200
ORDER BY strike_rate DESC
LIMIT 1;

#Q6: Times each batsman dismissed by Malinga
SELECT batsman, count(*) AS total_dismissals
FROM deliveries
WHERE bowler = 'SL Malinga' AND player_dismissed IS NOT NULL
GROUP BY batsman;

#Q7: Average percentage of boundaries hit by each batsman
SELECT batsman,
AVG(CASE WHEN batsman_runs=4 OR batsman_runs=6 THEN 1 
ELSE 0 END)*100 AS average_boundaries
FROM deliveries 
GROUP BY batsman;

#Q8: Average number of boundaries hit by each team in each season
WITH cte AS (
SELECT m.season, d.batting_team,
    SUM(CASE WHEN d.batsman_runs = 4 THEN 1 ELSE 0 END) AS fours,
    SUM(CASE WHEN d.batsman_runs = 6 THEN 1 ELSE 0 END) AS sixes
FROM deliveries d JOIN matches m ON d.match_id = m.id
GROUP BY m.season, d.match_id, d.batting_team
)
SELECT season, batting_team, AVG(fours + sixes) AS average_boundaries
FROM cte
GROUP BY season, batting_team;

#Q9: Highest partnership for each team in each season
WITH TeamScores AS (
SELECT m.season, d.batting_team, d.match_id, d.over AS over_no,
SUM(d.batsman_runs) AS partnership,
SUM(d.batsman_runs) + SUM(d.extra_runs) AS total_runs
FROM deliveries d
JOIN matches m ON d.match_id = m.id
GROUP BY m.season, d.match_id, d.batting_team, d.over
),
Partnerships AS (
SELECT season, batting_team, CONCAT(match_id, '-', over_no) AS partnership,
SUM(total_runs) AS total_runs
FROM TeamScores
GROUP BY season, batting_team, partnership
)
SELECT season,batting_team,
MAX(total_runs) AS highest_partnership
FROM Partnerships
GROUP BY season, batting_team;

#Q10: Extras bowled by each team in each match
SELECT 
    m.id AS match_no,
    d.bowling_team,
    SUM(d.extra_runs) AS extras
FROM
    matches AS m
        JOIN
    deliveries AS d ON d.match_id = m.id
WHERE
    extra_runs > 0
GROUP BY m.id , d.bowling_team;

#Q11: Bowler having best bowling figures in a single match
SELECT m.id AS match_no, d.bowler, COUNT(*) AS wickets_taken
FROM matches AS m
JOIN deliveries AS d ON d.match_id = m.id
WHERE d.player_dismissed IS NOT NULL
GROUP BY m.id, d.bowler
ORDER BY wickets_taken DESC
LIMIT 1;

#Q12: Matches resulted in a win in each city
SELECT m.city,
CASE 
	WHEN m.team1 = m.winner THEN m.team1
    WHEN m.team2 = m.winner THEN m.team2
    ELSE 'draw' END AS winning_team,
COUNT(*) AS wins
FROM matches AS m
JOIN deliveries AS d ON d.match_id = m.id
WHERE m.result != 'Tie'
GROUP BY m.city, winning_team;

#Q13: Times each team won the toss in each season
SELECT season,toss_winner,COUNT(*) AS toss_wins
FROM matches 
GROUP BY season,toss_winner;

#Q14: Matches each player won the 'Man of the Match' award
SELECT player_of_match, COUNT(*) AS total_wins
FROM matches
WHERE player_of_match IS NOT NULL
GROUP BY player_of_match
ORDER BY total_wins DESC;

#Q15: Avg no. of runs scored in each over of the innings in each match
SELECT m.id, d.inning, d.over_no,
AVG(d.total_runs) AS average_runs_per_over
FROM matches AS m
JOIN deliveries AS d ON d.match_id = m.id
GROUP BY m.id, d.inning, d.over_no;

#Q16: Team having highest total score in a single match
SELECT m.season, m.id AS match_no, d.batting_team,
SUM(d.total_runs) AS total_score
FROM matches AS m
JOIN deliveries AS d ON d.match_id = m.id
GROUP BY m.season, m.id, d.batting_team
ORDER BY total_score DESC
LIMIT 1;

#Q17: Most runs scored by batsman in a single match
SELECT m.season, m.id AS match_no, d.batsman,
SUM(d.batsman_runs) AS total_runs
FROM matches AS m
JOIN deliveries AS d ON d.match_id = m.id
GROUP BY m.season, m.id, d.batsman
ORDER BY total_runs DESC
LIMIT 1;