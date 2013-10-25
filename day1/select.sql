--select
set serveroutput on

--DECLARE
--  v_dept_id departments.department_id%TYPE;
--BEGIN
--  select department_id
--  into v_dept_id
--  from departments
--  where department_name = 'Administration';
--  dbms_output.put_line(v_dept_name);
--END;

DECLARE
  v_ret_name employees.first_name%type;
  v_ret_salary employees.salary%type;
  v_ret_id employees.employee_id%type;
BEGIN
  select first_name, salary, employee_id
  into v_ret_name, v_ret_salary, v_ret_id
  from employees
  where employee_id = 122;
  dbms_output.put_line(v_ret_name);
  dbms_output.put_line(v_ret_salary);
  dbms_output.put_line(v_ret_id);
END;
  
  
  
  
  
  
