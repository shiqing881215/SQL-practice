set serveroutput on

-- RECORD ***********************************

--DECLARE
--  type emp_rec_type is record 
--  (id number,
--   last_name employees.last_name%type,
--   email employees.email%type,
--   phone employees.phone_number%type);
--  rec emp_rec_type; 
--BEGIN
--  select employee_id, last_name, email, phone_number
--  into rec
--  from employees
--  where employee_id = 198;
--  dbms_output.put_line(rec.id || ' ' || rec.last_name || ' ' || rec.email || ' ' || rec.phone);
--END;



-- ROWTYPE ***********************************

--DECLARE
--  rec employees%ROWTYPE;
--BEGIN
--  select * into rec from employees where employee_id = 188;
--  dbms_output.put_line(rec.employee_id);
--END;



-- IF STATMENT ***********************************
--DECLARE
--  v_weather varchar2(30) := 'rainy';
--BEGIN
--  if v_weather = 'rainy' then
--    dbms_output.put_line('rain coat');
--  elsif v_weather = 'snowy' then
--    dbms_output.put_line('thick coat');
--  else
--    dbms_output.put_line('whatever');
--  end if;
--END;


-- CASE **************************************
-- attention, when you use case, it muse return a value, you can consider it as a function with a return value
--DECLARE
--  v_case number := 10;
--  v_result varchar2(200);
--BEGIN
--  v_result := case 
--    when v_case < 10 then 'small'
--    when v_case < 20 and v_case >= 10 then 'medium'
--    when v_case < 20 and v_case >= 30 then 'big'
--    else 'huge'
--  end;
--  dbms_output.put_line(v_result);
--END;


-- LOOP ***************************************
--DECLARE
--  v_loop PLS_INTEGER := 1;
--BEGIN
--  loop 
--    dbms_output.put_line(v_loop || ' times');
--    exit when v_loop > 5;
--    v_loop := v_loop + 1;
--  end loop;
--END;



-- WHILE LOOP **********************************

--DECLARE
--  v_loop number := 1;
--BEGIN
--  while v_loop < 9 loop
--    dbms_output.put_line(v_loop);
--    v_loop := v_loop + 1;
--  end loop;
--END;


-- FOR LOOP ***************************************
--BEGIN
--  for i in reverse 1..10 loop
--    dbms_output.put_line(i);
--  end loop;
--END;


-- cursor *********************************************
-- GET THE DATA FROM THE DB ONCE AND STORE IN THE CURSOR WHICH IS A PEICE OF MEMORY
DECLARE
  CURSOR emp_cur IS
  select last_name, job_id, department_id from employees;
BEGIN
  for emp_rec in emp_cur loop
    dbms_output.put_line(emp_rec.last_name || ' ' || emp_rec.job_id || ' ' || emp_rec.department_id);
  end loop;
END;




  