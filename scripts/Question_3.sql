select  
p.playerid,
p.namefirst,
p.namelast,
sl.lgid,
s.schoolname,
coalesce(sum(sl.salary)::text::money::text,'unknown'):: money as salary  
from people p
inner join
collegeplaying c
on
p.playerid=c.playerid
inner join
schools s
on
c.schoolid=s.schoolid
left outer join
salaries sl
on
p.playerid=sl.playerid

where
sl.salary is not null and
schoolname ilike '%vander%'
group by p.playerid,p.namefirst,p.namelast,sl.lgid,
s.schoolname
order by salary desc