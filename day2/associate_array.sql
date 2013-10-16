set serveroutput on

-- associate array


--DECLARE 
--  type emp_aa_type is table of employees.last_name%type
--  index by pls_integer;
--  emp_aa emp_aa_type;
--BEGIN
--  emp_aa(1) := 'qshi';
--  dbms_output.put_line(emp_aa(1));
--END;


-- THIS IS USE THE CURSOR WITH THE ASSOCIATE ARRAY
-- THIS IS USED WHEN YOU CARE OF THE KEY AND WANT TO GET THE CONTROL OF IT
-- WHICH MEANS THE KEY HAS SOME SENSE TO YOU
--DECLARE
--  type emp_aa_type is table of employees.last_name%type
--  index by pls_integer;
--  emp_aa emp_aa_type;
--  cursor emp_cur is
--  select last_name, employee_id from employees order by employee_id;
--BEGIN
--  for emp_rec in emp_cur loop
--    emp_aa(emp_rec.employee_id) := emp_rec.last_name;
--  end loop;
--  dbms_output.put_line(emp_aa(100));
--END;


-- IN THIS WAY, YOU CAN INSERT WITH BULK, BUT YOU LOSE THE CONTROL OF THE KEY
-- ORACLE START THE KEY FROM 1 WITH INCREAMENT OF 1
--DECLARE
--  type emp_aa_type is table of employees.last_name%type
--  index by pls_integer;
--  emp_aa emp_aa_type;
--BEGIN
--  select last_name bulk collect into emp_aa from employees;
--  dbms_output.put_line(emp_aa(7));
--END;

-- array methods
-- first, last, next, prior, count
--DECLARE
--  type emp_aa_type is table of employees.last_name%type
--  index by pls_integer;
--  emp_aa emp_aa_type;
--BEGIN
--  select last_name bulk collect into emp_aa from employees;
--  for i in emp_aa.first..emp_aa.last loop
--    dbms_output.put_line(i || ' ' || emp_aa(i));
--  end loop;
--  dbms_output.put_line('count = ' || emp_aa.count);
--  dbms_output.put_line('next of 100 is ' || emp_aa.next(100));
----  dbms_output.put_line(i || ' ' || emp_aa(i));
--END;


-- This is the practice 3 for cursor_practice, here we use the associate array
-- THIS IS USING A RECORD AS THE VALUE TYPE IN THE ARRAY
-- WHICH MAKES THE ARRAY MORE LIKE A TABLE
-- I THINK THAT'S THE REASON WHY WE USE IS TABLE OF 
--DECLARE
--  type emp_rec_type is record
--  (name employees.last_name%type,
--   dept_name departments.department_name%type,
--   job_id employees.job_id%type);
--   
--   type emp_aa_type is table of emp_rec_type
--   index by pls_integer;
--   
--   emp_aa emp_aa_type;
--BEGIN
--  select last_name, department_name, job_id bulk collect into emp_aa
--  from departments d, employees e
--  where d.department_id = e.department_id
--  and d.location_id = 1700;
--  
--  dbms_output.put_line(emp_aa(5).name || ' ' || emp_aa(5).dept_name || ' ' || emp_aa(5).job_id);
--END;


-- This is the second of cursor_practice
--DECLARE
--  type loc_type is record 
--  (city locations.city%type,
--   str locations.street_address%type);
--  type loc_aa_type is table of loc_type
--  index by pls_integer;
--  
--  loc_aa loc_aa_type;
--BEGIN
--  select city, street_address bulk collect into loc_aa from locations;
--  
--  dbms_output.put_line(loc_aa(1).city ||' '|| loc_aa(1).str);
--END;





