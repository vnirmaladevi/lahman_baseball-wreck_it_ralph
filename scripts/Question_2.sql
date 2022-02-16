/***Question 2***/

select namefirst,namelast,height,g_all,t.teamid,t.name from people p
left outer join appearances a
on
p.playerid=a.playerid 
left  outer join teams t
on
t.teamid=a.teamid
where
height in
(
select min(height) from people)
group by namefirst,namelast,height,g_all,t.teamid,t.name






