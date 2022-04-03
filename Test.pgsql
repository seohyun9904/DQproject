select a.s_id, a.s_nm, a.c_id, a.c_nm
     , min(case when c.chasu = 1 then 'O' end) as "1차"
     , min(case when c.chasu = 2 then 'O' end) as "2차"
     , min(case when c.chasu = 3 then 'O' end) as "3차"
     , count(c.s_id) as 참여횟수
from (select a.s_id, a.s_nm, b.c_id, b.c_nm
        from student2 a, course2 b) as a, study2 c
where a.s_id = c.s_id
and a.c_id = c.c_id
group by a.s_id, a.s_nm, a.c_id, a.c_nm
order by a.s_id, a.c_id;