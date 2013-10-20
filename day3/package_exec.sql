set serveroutput on

--exec dbms_output.put_line(hr_pkg.fac('fefe'));
--exec dbms_output.put_line(hr_pkg.private_func(1,2));
--exec dbms_output.put_line(hr_pkg.v_name || ' ' || hr_pkg.c_name);

--declare
--  v_num number;
--begin
--  v_num := 1/0;
--exception
--  when hr_pkg.e_zero_divide then
--    dbms_output.put_line('Zero divide exception.');
--end;

--begin
--  raise hr_pkg.e_my_own;
--exception
--  when hr_pkg.e_my_own then
--    dbms_output.put_line('Catch my own exception!');
--end;
  