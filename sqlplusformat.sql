!rm -rf /home/oracle/COLX.sql
!rm -rf /home/oracle/COLY.sql
set serveroutput on
create or replace procedure COLX as
begin

for x in (
select column_name from
    all_tab_columns where data_type <> 'NUMBER')
loop
DBMS_OUTPUT.PUT_LINE('column ' || x.column_name ||  ' format a15 justify left' );

end loop;
end;
/

create or replace procedure COLY as
begin
for y in (
select column_name from
    all_tab_columns where data_type='NUMBER')
loop
DBMS_OUTPUT.PUT_LINE('column ' || y.column_name ||  ' format 999999999 justify center' );

end loop;
end;
/


set heading off
set termout off
set echo off
spool COLX.sql
exec COLX
spool off
spool COLY.sql
exec COLY
spool off
set lines 500
set pages 1000
set numwidth 50
set long 1000000000
set heading on
@COLX.sql
@COLY.sql
