set serveroutput on


--create or replace procedure emp_info
--(p_dept_id in employees.department_id%type)
--is
--  cursor emp_cur is
--  select last_name, salary, job_id, department_id, phone_number
--  from employees
--  where department_id = p_dept_id;     -- ignore this record, here we just display instead of returning
----  type emp_rec_type is record
----  (name employees.last_name%type,
----   salary employees.salary%type,
----   job_id employees.job_id%type,
----   dept_id employees.department_id%type,
----   phone employees.phone_number%type);
--BEGIN
--  for emp_rec in emp_cur loop
--    dbms_output.put_line(emp_rec.last_name || ' ' ||
--    emp_rec.salary || ' ' || emp_rec.job_id || ' ' || 
--    emp_rec.department_id || ' ' || emp_rec.phone_number);
--  end loop;
--END;



-- insert with the specified job title and job id
--create or replace procedure insert_pro
--(p_job_id in jobs.job_id%type,
-- p_job_title in jobs.job_title%type)
--is
--  v_job_id jobs.job_id%type;
--  v_job_title jobs.job_title%type;
--BEGIN
--  insert into jobs (job_id, job_title)
--  values (p_job_id, p_job_title)
--  returning job_id, job_title into v_job_id, v_job_title;
--  dbms_output.put_line(v_job_id);
--  dbms_output.put_line(v_job_title);
--  dbms_output.put_line(sql%rowcount || ' rows affected.');
--END;


-- update the job table for job title with job id specified
create or replace procedure update_pro
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
END;



/ 
show errors
    
  