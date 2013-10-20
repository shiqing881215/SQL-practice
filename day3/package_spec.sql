create or replace package hr_pkg is 


-- All declare here can be considered as global, which can be access by
-- calling hr_pkg.sth


-- declare procedure and function

procedure emp_info (p_dept_id in employees.department_id%type);
procedure insert_pro (p_job_id in jobs.job_id%type, p_job_title in jobs.job_title%type);
procedure say_hello 
(p_name in varchar2 := 'defaultValue',
 p_id in employees.employee_id%type,
 p_lastname out employees.last_name%type,
 p_inout_date in out date);
procedure update_pro
(p_job_title jobs.job_title%type,
 p_job_id jobs.job_id%type);
function fac(p_num in number) return number;
function fac(p_char in varchar2) return varchar2;

function private_wrapper(p_num in number) return number;

-- declarte variable and constant

v_name varchar2(30) := 'This is a vriable.';
c_name varchar2(30) := 'This is a constant.';


-- declare exception

e_zero_divide exception;
pragma exception_init (e_zero_divide, -01476);
e_my_own exception;
pragma exception_init (e_my_own, -20100);


-- declare type



end hr_pkg;

/
show errors