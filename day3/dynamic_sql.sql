set serveroutput on

-- creat a table using dynamic sql

--create or replace procedure create_table 
--(p_table_name varchar2, p_col_name varchar2)
--is
--
--begin
--  execute immediate 'CREATE TABLE ' || p_table_name || '(' || p_col_name || ')';
--end;


-- insert a row, using binding variable :1  :2

--create or replace procedure add_row(p_table_name varchar2, p_id number, p_value varchar2) is
--begin 
--  execute immediate 'INSERT INTO ' || p_table_name || ' VALUES(:1, :2)'
--  using p_id, p_value;
--end add_row;



-- single row query

create or replace function get_row(p_emp_id number) 
return employees%rowtype
is
v_stmt varchar2(100);
v_rec employees%rowtype;
begin 
  -- into is the plsql, if we put in the v_stmt, it will cause the compile error
  -- when you want to execute sql in the plsql
  -- : is the global symbol for binding variable, we don't care what's after :
  v_stmt := 'select * from employees where employee_id = :1';   
  execute immediate v_stmt into v_rec using p_emp_id;
  return v_rec;
end get_row;

/   
-- indicatet the end of a block, without it, compiler will get confused by seeing multiple declare
declare
  v_row employees%rowtype := get_row(100);
begin
  dbms_output.put_line(v_row.last_name);
end;















--/
--show errors
