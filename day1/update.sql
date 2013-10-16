--update
set serveroutput on

--BEGIN
--  UPDATE departments 
--  SET location_id = 2500
--  WHERE department_id = 310;
--  dbms_output.put_line(SQL%ROWCOUNT || ' rows updated.');
--END;

DECLARE
  v_salary employees.salary%type;
BEGIN
  update employees
  set salary = salary*1.1
  where employee_id = 101
  returning salary into v_salary;
  dbms_output.put_line(v_salary);
  rollback;
END;
  