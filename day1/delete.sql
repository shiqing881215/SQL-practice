--delete
set serveroutput on

BEGIN
  DELETE FROM departments WHERE department_id > 290;
  dbms_output.put_line(SQL%ROWCOUNT || ' rows deleted.');
END;