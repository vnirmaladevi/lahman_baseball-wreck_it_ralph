with cte1 as (select teamid,sum(w) as win from teams
where
wswin='N' and
yearid between 1970 and 2016
group by teamid
order by win desc)
select max(win) from cte1

with cte2 as(select teamid,sum(w) as win from teams
where
wswin='Y' and
yearid between 1970 and 2016
group by teamid
order by win )
select min(win) from cte2

select *  from
people p
inner join 
appa
teams t
on
p.playerid=t.playerid
where
wswin='Y' and
