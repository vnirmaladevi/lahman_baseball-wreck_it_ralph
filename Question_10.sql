WITH career_high_hr AS (SELECT DISTINCT b.playerid, namefirst, namelast, COUNT(*) as seasons_played, MAX(hr) as homerun_career_high
					FROM batting as b
					INNER JOIN people as p
					ON b.playerid = p.playerid
					GROUP BY namefirst, namelast, b.playerid
					HAVING COUNT(*) >= 10
					ORDER BY homerun_career_high DESC)
SELECT namefirst, namelast, hr
FROM batting
INNER JOIN career_high_hr
ON career_high_hr.playerid = batting.playerid
WHERE yearid = 2016
AND hr >= 1
ORDER BY hr DESC;


