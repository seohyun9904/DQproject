select a.s_id, a.s_nm, b.c_id, b.c_nm
     , min(case when c.chasu = 1 then 'O' end) as "1차"
     , min(case when c.chasu = 2 then 'O' end) as "2차"
     , min(case when c.chasu = 3 then 'O' end) as "3차"
     , count(c.s_id) as 참여횟수
from student2 a
cross join course2 b
inner join study2 c
on a.s_id = c.s_id
and b.c_id = c.c_id
group by a.s_id, a.s_nm, b.c_id, b.c_nm
order by a.s_id, b.c_id;