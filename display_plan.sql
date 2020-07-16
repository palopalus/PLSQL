

explain plan for;
select * from (select id,nazov from sklad_karta order by nazov ) where rownum<10;
select * from table (dbms_xplan.display(null, null,      'all' ));



--treba granty
grant select on  V_$SQL_PLAN_STATISTICS_ALL to b2016601;
grant select on       V_$SQL to b2016601;
grant select on    V$SQL_PLAN to b2016601;

select t.*
from v$session s,
table(dbms_xplan.display_cursor(s.prev_sql_id,s.prev_child_number,'ALLSTATS LAST')) t
where s.sid=599;
select * from v$sql_plan_statistics_all;

select * from v$session where sid=599;




--na dbms_xplan.display_cursor
--treba granty
GRANT SELECT ON v_$session TO pharmos;
GRANT SELECT ON v_$sql TO pharmos;
GRANT SELECT ON v_$sql_plan TO pharmos;
GRANT SELECT ON v_$sql_plan_statistics_all TO pharmos;



select * from v$active_session_history where session_id=599;

select sample_time, session_state, event, consumer_group_id
from v$active_session_history
where  sample_time between
    to_date('2.6.2016 14:00:00','dd.mm.yyyy hh24:mi:ss')
    and
   to_date('2.6.2016 16:00:00','dd.mm.yyyy hh24:mi:ss')
and session_id = 599
order by 1;

select sample_time, session_state,session_id, blocking_session,
owner||'.'||object_name||':'||nvl(subobject_name,'-') obj_name
    /*dbms_ROWID.ROWID_create (
        1,
        o.data_object_id,
        current_file#,
        current_block#,
        current_row#
    ) row_id
    */
from dba_hist_active_sess_history s, dba_objects o
where --user_id = 92 and 
sample_time between
    to_date('1.5.2016 14:00:00','dd.mm.yyyy hh24:mi:ss')
    and
   to_date('2.6.2016 16:00:00','dd.mm.yyyy hh24:mi:ss')
and event = 'enq: TX - row lock contention'
and o.data_object_id = s.current_obj#
order by 1,2;


