set serveroutput on

create or replace function fac(p_num in number) 
return number
is 
  v_result number(3) := 1;
BEGIN
  for i in 1..p_num loop
    v_result := v_result * i;
  end loop;
  return v_result;
END;
/
show errors