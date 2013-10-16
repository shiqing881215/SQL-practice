-- procedure
set serverpoutput on

create or replace procedure say_hello 
(p_name in varchar2 := 'defaultValue',
 p_id in employees.employee_id%type,
 p_lastname out employees.last_name%type,   -- This is the output variable
 p_inout_date in out date)     -- This is the in out variable
IS
  v_name varchar2(30) := 'qing';
BEGIN
  dbms_output.put_line('Hello ' || v_name);
  dbms_output.put_line('Hello ' || p_name);
  select last_name into p_lastname
  from employees
  where employee_id = p_id;
  p_inout_date := p_inout_date + 7;
END say_hello;
/
show errors