--Question 5: 
Select DISTINCT (yearid/10*10) AS decade, 
	   ROUND(SUM(g::numeric),2) AS total_games, 
	   ROUND(SUM(so::numeric),2) AS total_strikeouts,
	   ROUND(SUM(hr::numeric),2) AS total_homeruns,
       ROUND(SUM(so::numeric)/(SUM(g::numeric)),2) AS strikeouts_per_game,
	   ROUND(SUM(hr::numeric)/(SUM(g::numeric)),2) AS homeruns_per_game
FROM teams
WHERE yearid >= 1920
GROUP BY decade
ORDER BY decade;





