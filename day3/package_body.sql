create or replace package body hr_pkg is


v_private number := 1;

--------------------------------------------------------------------------------

-- This is the private func, which only shows here but does declare in the spec
-- PLSQL is compile top down, so you have two choices
-- 1. Put all private stuff at the top of the body file
-- 2. Declare the private stuff at the top, and put the real code anywhere you like

function private_func
(num1 in number, num2 in number)
return number
is
  v_name number;
BEGIN
  v_name := num1 + num2;
  v_private := v_name;
  return v_name;
END private_func;


--------------------------------------------------------------------------------

function private_wrapper(p_num in number) return number
is
begin
   v_private := private_func(p_num, p_num);
   return v_private;
end private_wrapper;


--------------------------------------------------------------------------------
procedure emp_info
(p_dept_id in employees.department_id%type)
is
  cursor emp_cur is
  select last_name, salary, job_id, department_id, phone_number
  from employees
  where department_id = p_dept_id;
BEGIN
  if (val_id(p_dept_id)) then
    for emp_rec in emp_cur loop
      dbms_output.put_line(emp_rec.last_name || ' ' ||
      emp_rec.salary || ' ' || emp_rec.job_id || ' ' || 
      emp_rec.department_id || ' ' || emp_rec.phone_number);
    end loop;
  else 
    dbms_output.put_line('Invalid department id.');
  end if;
END emp_info;

--------------------------------------------------------------------------------

procedure insert_pro
(p_job_id in jobs.job_id%type,
 p_job_title in jobs.job_title%type)
is
  v_job_id jobs.job_id%type;
  v_job_title jobs.job_title%type;
BEGIN
  insert into jobs (job_id, job_title)
  values (p_job_id, p_job_title)
  returning job_id, job_title into v_job_id, v_job_title;
  dbms_output.put_line(v_job_id);
  dbms_output.put_line(v_job_title);
  dbms_output.put_line(sql%rowcount || ' rows affected.');
END insert_pro;


--------------------------------------------------------------------------------

procedure say_hello 
(p_name in varchar2 := 'defaultValue',
 p_id in employees.employee_id%type,
 p_lastname out employees.last_name%type,
 p_inout_date in out date)     -- This is the output variable
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

--------------------------------------------------------------------------------

procedure update_pro
(p_job_title jobs.job_title%type,
 p_job_id jobs.job_id%type)
 is
 v_job_title jobs.job_title%type;
 v_job_id jobs.job_id%type;
 e_no_update exception;
 pragma exception_init(e_no_update, -20100);
 BEGIN
  update jobs
  set job_title = p_job_title
  where job_id = p_job_id
  returning job_title, job_id into v_job_title, v_job_id;
  if sql%notfound then
    raise_application_error(-20100, 'No update found......');
  end if;
  dbms_output.put_line('Job title change to ' || v_job_title
  || ' for ' || v_job_id);
EXCEPTION
  when e_no_update then 
    dbms_output.put_line(sqlcode || ' ' || sqlerrm || '!!!!');
END update_pro;


--------------------------------------------------------------------------------


function fac(p_num in number) 
return number
is 
  v_result number(3) := 1;
BEGIN
  for i in 1..p_num loop
    v_result := v_result * i;
  end loop;
  return v_result;
END fac;


--------------------------------------------------------------------------------

function fac(p_char in varchar2)
return varchar2
is 
BEGIN
--  dbms_output.put_line('This is the overload for fac!');
  return 'Overload';
END fac;




end hr_pkg;    -- Attention!!!!  Give a specified name to each end


/
show errors