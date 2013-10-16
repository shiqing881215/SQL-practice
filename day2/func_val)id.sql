set serveroutput on

create or replace function val_id(p_dept_id employees.department_id%type)
return boolean
is 
  v_num number;
BEGIN
  select count(department_id) into v_num from employees;
  return v_num > 0;
END;
/
show errors