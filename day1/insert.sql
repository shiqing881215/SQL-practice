--insert
set serveroutput on

--DECLARE
--  v_deptid departments.department_id%TYPE := 330;
--  v_deptname departments.department_name%TYPE := 'NEW';
--  v_ret_deptid departments.department_id%TYPE;
--BEGIN
--  INSERT INTO departments (department_id, department_name)
--  VALUES (v_deptid, v_deptname)
--  RETURNING department_id INTO v_ret_deptid;
--  dbms_output.put_line(SQL%ROWCOUNT || ' rows updated.');
--  dbms_output.put_line(v_ret_deptid);
--END;

DECLARE
  v_ret_name regions.region_name%TYPE;
BEGIN
  insert into regions (region_id, region_name)
  values (5, 'China')
  returning region_name into v_ret_name;
  dbms_output.put_line(v_ret_name);
END;




