 
--integer to bin 
declare
 lcBinary varchar2(100);
 p_int number:=22;
begin
    SELECT LISTAGG(SIGN(BITAND(p_int, POWER(2, LEVEL-1))),'') WITHIN GROUP(ORDER BY LEVEL DESC)
        INTO lcBinary
        FROM dual
        CONNECT BY POWER(2, LEVEL-1) <= p_int;
    dbms_output.put_line('cislo:'||p_int||' je bin:'||lcBinary);
end;


--bin to dec
declare
ret number:=0;
binval varchar2(100):='10011';
begin
  FOR t IN 1 .. length(binval) LOOP
     ret := (ret * 2) + to_number(substr(binval, t, 1));
  END LOOP;
  dbms_output.put_line('bin:'||binval||' je dec:'||ret);
end;


-- bitor
create function bitor(p1 number, p2 number) RETURN number IS
BEGIN
  RETURN p1 - bitand(p1, p2) + p2;
END;
/


--bitxor
RETURN bitor(p1, p2) - bitand(p1, p2);


select to_number('FF','xx') from dual;
--ok
select to_char(254,'fmxxxx') from dual;
