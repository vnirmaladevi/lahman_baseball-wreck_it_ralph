/****7.  From 1970 – 2016, what is the largest number of wins for a team that did not win the world series?
What is the smallest number of wins for a team that did win the world series?
Doing this will probably result in an unusually small number of wins for a world series champion – determine why this is the case.
Then redo your query, excluding the problem year.
How often from 1970 – 2016 was it the case that a team with the most wins also won the world series?
What percentage of the time?***/

----From 1970 – 2016, what is the largest number of wins for a team that did not win the world series?

SELECT TEAMID,W
FROM TEAMS
WHERE YEARID >= 1970
	AND YEARID <= 2016
	AND WSWIN = 'N'
GROUP BY TEAMID,W
ORDER BY W DESC
LIMIT 1 
---What is the smallest number of wins for a team that did win the world series?

SELECT TEAMID,W,
	YEARID
FROM TEAMS
WHERE YEARID >= 1970
	AND YEARID <= 2016
	AND WSWIN = 'Y'
GROUP BY TEAMID,W,
	YEARID
ORDER BY W
LIMIT 1 

---Redoing the query excluding Problem year
 ---What is the smallest number of wins for a team that did win the world series?

SELECT TEAMID,
	YEARID,W
FROM TEAMS
WHERE WSWIN = 'Y'
GROUP BY TEAMID,W,
	YEARID
ORDER BY W
LIMIT 1

/****How often from 1970 – 2016 was it the case that a team with the most wins also won the world series?
What percentage of the time?***/
WITH WSC AS
	(SELECT DISTINCT T.YEARID,
			MAXWIN,
			T.TEAMID AS TEAM_MAXWIN,
			T.WSWIN AS TEAM_WSWIN
		FROM TEAMS T
		LEFT OUTER JOIN
			(SELECT YEARID,
					MAX(W) AS MAXWIN
				FROM TEAMS
				GROUP BY YEARID) TM ON T.YEARID = TM.YEARID
		AND T.W = TM.MAXWIN
		WHERE T.YEARID BETWEEN 1970 AND 2016
			AND MAXWIN IS NOT NULL
			AND T.WSWIN = 'Y'
		ORDER BY T.YEARID)
SELECT COUNT(*) AS WORLD_SERIES_CHAMPION_MOST_WINS,
	((COUNT(*)::float / (2016-1970)::float) * 100)::real AS PERCENT_TIME
FROM WSC;