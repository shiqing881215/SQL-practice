-- call
set serveroutput on

DECLARE
  v_name employees.last_name%type;
  v_date date :=sysdate;
BEGIN
  say_hello('overrid', 100, v_name, v_date);
  dbms_output.put_line('Hello ' || v_name);
  dbms_output.put_line(v_date);
END;