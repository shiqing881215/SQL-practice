set serveroutput on

BEGIN
  dbms_output.put_line('Factorial for 5 is ' || fac(5));
END;