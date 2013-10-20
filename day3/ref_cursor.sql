set serveroutput on

-- Ref cursor

DECLARE
  -- define the cursor type
  type ref_cur_type is ref cursor
  return locations%rowtype;
  -- define the ref cursor variable
  ref_rec ref_cur_type;
  v_rec locations%rowtype;
BEGIN
  -- open cursor
  open ref_rec for SELECT * FROM locations;
  -- fetch data
  loop
    fetch ref_rec into v_rec;
    dbms_output.put_line(v_rec.location_id || ' ' || v_rec.city);
    exit when ref_rec%notfound;
  end loop;
  -- close cursor
  close ref_rec;
END;



