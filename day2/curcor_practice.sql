set serveroutput on


-- display the name, dept name, jobid of all emplpyees who is in the location 1700
--DECLARE
--  cursor emp_cur is 
--  select last_name, department_name, job_id
--  from departments d, employees e
--  where d.department_id = e.department_id
--  and d.location_id = 1700;
--BEGIN
--  for emp_rec in emp_cur loop
--    dbms_output.put_line(emp_rec.last_name || ' ' || emp_rec.department_name || ' ' || emp_rec.job_id);
--  end loop;
--END;


-- display the city and address of all locations
--DECLARE
--  cursor loc_cur is 
--  select city, street_address from locations;
--BEGIN
--  for loc_rec in loc_cur loop
--    dbms_output.put_line(loc_rec.city || ' ' || loc_rec.street_address);
--  end loop;
--END;
 
 
 -- display the name and anual salary of all employees in dept 50
--DECLARE
--  cursor emp_cur is 
--  select last_name, salary from employees where department_id = 50;
--BEGIN
--  for emp_rec in emp_cur loop
--    dbms_output.put_line(emp_rec.last_name || ' ' || emp_rec.salary);
--  end loop;
--END;
 
 
  