-- use practice;
-- values ('234', 'jones', 'forbes ave');

-- select ssn from student where name='smith';

use practice;
-- insert into student values ('456','jones', '3rd ave');
-- select name from student where address like 'main____';
-- select name from
-- student s, takes t
-- where s.ssn = t.ssn 
-- and t.c_id = '15-414';

/*
insert into takes
values ('234','15-413','B');
*/


-- select c_name 
-- from class 
-- where unit >= 
-- (select unit from class where c_id = '15-413');

-- select c1.c_name
-- from class c1, class c2
-- where c1.unit >= c2.unit
-- and c2.c_id = '15-413';
-- t t1.ssn
-- from takes t1, takes t2
-- where t1.ssn = t2.ssn
-- and t1.c_id = '15-413'
-- and t2.c_id = '15-412';


-- select count(*) pop, c_id from takes
-- group by c_id
-- having pop >= 2;


-- select name 
-- from student s, takes t
-- where s.ssn = t.ssn
-- and t.c_id = '15-413';


-- select name
-- from student
-- where ssn in 
-- (select ssn from takes where c_id = '15-413');
-- 

-- select name
-- from student
-- where ssn >=
-- all (select ssn from student);



-- select name
-- from student
-- where ssn in
-- (select max(ssn) from student);


-- select ssn, avg(grade) g
-- from takes
-- group by ssn
-- having g >= all(select avg(grade) from takes group by ssn);


-- select c_id
-- from class
-- where c_id not in (select c_id from takes);



-- select c_id
-- from class
-- where not exists 
-- (select * from takes
--  where takes.c_id = class.c_id);


-- select ssn, avg(grade) a
-- from takes
-- group by ssn
-- having a >= all(select avg(grade) from takes group by ssn);



-- create view help(ssn, a) as
-- select ssn, avg(grade) 
-- from takes
-- group by ssn;
-- select ssn 
-- from help
-- where a in (select max(a) from help);


-- update takes
-- set grade = 'B'
-- where c_id = '15-412';


-- select ssn, c_name
-- from takes left outer join class on class.c_id = takes.c_id;



select count(distinct ssn) from takes;















