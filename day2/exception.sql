set serveroutput on

--DECLARE
--  v_lname employees.last_name%type;
--BEGIN
--  select last_name into v_lname from employees where employee_id = 100;
--  dbms_output.put_line(v_lname);
--  
--  DECLARE
--    v_num number(2);
--  BEGIN
--    v_num := 1/0;
--  EXCEPTION
--    when zero_divide then
--      dbms_output.put_line('inner block zero divide');
--  END;
--    
--EXCEPTION
--  when no_data_found then
--  dbms_output.put_line('no data found');
--  when zero_divide then
--  dbms_output.put_line('divide zero');
--END;




-- associate own exception
-- first find the exception number then associate that number with own defined exception var
--DECLARE
--  v_num number(2);
--  e_zero_divide EXCEPTION;
--  PRAGMA exception_init (e_zero_divide, -01476);
--BEGIN
--  v_num := 1/0;
--EXCEPTION
--  when e_zero_divide then
--  dbms_output.put_line('zero divide exception catch!');
--END;



-- declare own exception
DECLARE
  -- Create exception ans associate with a number between -20000 and -20999
  e_no_update EXCEPTION;
  PRAGMA EXCEPTION_INIT(e_no_update, -20100);
BEGIN
  update employees
  set first_name = 'qing'
  where employee_id = 1000;
  -- define the logic when to raise the defined exception
  if SQL%NOTFOUND then
    raise e_no_update;
    -- raise_application_error(-20100, 'No rows is update');
  end if;
EXCEPTION
  -- handle the defined exception
  when e_no_update then
    dbms_output.put_line(SQLCODE || ' ' || SQLERRM || '!!!!');
END;





  
  
  
  
