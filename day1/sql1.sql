set serveroutput on;

DECLARE 
  v_name VARCHAR2(30) := 'QSHI';
  c_company CONSTANT VARCHAR2(200) := 'SALESFORC  E''s';
BEGIN
  v_name := 'qing shi';
  dbms_output.put_line('hello world ' || v_name || '!');
  dbms_output.put_line('work for ' || c_company|| '!');
END;