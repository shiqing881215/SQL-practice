set serveroutput on

-- record practice*************************************************
--DECLARE
--  type v_type is record 
--  (first_name employees.first_name%type,
--   last_name employees.last_name%type,
--   manager_id employees.manager_id%type,
--   job_id employees.job_id%type,
--   dept_id employees.department_id%type);
--  v_record v_type;
--BEGIN
--  update employees
--  set manager_id = 130
--  where employee_id = 130
--  returning first_name, last_name, manager_id, job_id, department_id into v_record;
--  dbms_output.put_line(v_record.dept_id);
--END;


--  determine employee 144 is paid enough
--DECLARE
--  v_salary employees.salary%type;
--  v_result varchar2(5);
--BEGIN
--  select salary
--  into v_salary
--  from employees
--  where employee_id = 144;
--  if v_salary < 10000 then
--    v_result := 'no';
--  else
--    v_result := 'yes';
--  end if;
--  dbms_output.put_line(v_result);
--END;

DECLARE
  v_salary employees.salary%type;
  v_result varchar2(5);
BEGIN
  select salary
  into v_salary
  from employees
  where employee_id = 144;
  v_result := case
    when v_salary < 10000 then 'No'
    else 'yse'
  end;
  dbms_output.put_line(v_result);
END;











