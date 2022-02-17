--8. Using the attendance figures from the homegames table, find the teams and parks which had the top 5 average
-- attendance per game in 2016 (where average attendance is defined as total attendance divided by number of games).
-- Only consider parks where there were at least 10 games played. Report the park name, team name, and 
-- average attendance.Repeat for the lowest 5 average attendance.
SELECT  DISTINCT name as teamname, team, park_name, (h.attendance / h.games) as avg_atnds
	FROM homegames AS h
		INNER JOIN parks AS p ON h.park=p.park
		INNER JOIN teams AS t ON h.team=t.teamid AND t.yearid=h.year
		WHERE year = 2016 AND h.games >= 10
		GROUP BY teamname, team, park_name, h.games, avg_atnds
		ORDER BY avg_atnds DESC
		LIMIT 5;
		
SELECT  DISTINCT name as teamname, team, park_name, (h.attendance / h.games) as avg_atnds
	FROM homegames AS h
		INNER JOIN parks AS p ON h.park=p.park
		INNER JOIN teams AS t ON h.team=t.teamid AND t.yearid=h.year
		WHERE year = 2016 AND h.games >= 10
		GROUP BY teamname, team, park_name, h.games, avg_atnds
		ORDER BY avg_atnds ASC
		LIMIT 5;
		


	
