--Question 9: Which managers have won the TSN Manager of the Year award in both the National League (NL) 
--and the American League (AL)? Give their full name and the teams that they were managing when they won the award.

WITH manager_wins AS ((SELECT playerid
					  FROM awardsmanagers
					  WHERE lgid = 'AL'
					  AND awardid = 'TSN Manager of the Year')
					  INTERSECT                       
					  (SELECT playerid
					  FROM awardsmanagers
					  WHERE lgid = 'NL'
					  AND awardid = 'TSN Manager of the Year')),
	manager_info AS (SELECT namefirst, namelast, mw.playerid
					 FROM people AS p
					 INNER JOIN manager_wins AS mw
					 ON p.playerid = mw.playerid
					 WHERE p.playerid = mw.playerid
					 GROUP BY namefirst, namelast, mw.playerid),
	manager_complete AS	(SELECT mi.namefirst, mi.namelast, m.yearid, m.teamid, m.playerid
						 FROM awardsmanagers AS am
				         LEFT JOIN managers AS m
				         ON am.playerid = m.playerid AND am.yearid = m.yearid
				         INNER JOIN manager_info AS mi
				         ON am.playerid = mi.playerid
				         GROUP BY mi.namefirst, mi.namelast, m.yearid, m.teamid, m.playerid)
SELECT namefirst AS first_name, 
	   namelast AS last_name, 
	   mc.yearid AS award_year, 
	   t.teamid AS team_id, 
	   t.name AS team_name
FROM manager_complete AS mc
LEFT JOIN teams AS t
ON mc.teamid = t.teamid AND mc.yearid = t.yearid
GROUP BY namefirst, namelast, mc.yearid, t.teamid, t.name
ORDER BY mc.yearid;



