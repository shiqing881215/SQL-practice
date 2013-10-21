--delete
set serveroutput on

DECLARE
  v_dept_name departments.department_name%type;
BEGIN
  DELETE FROM departments WHERE department_id > 290
  returning department_name into v_dept_name;
  dbms_output.put_line(SQL%ROWCOUNT || ' rows deleted.');
END;
