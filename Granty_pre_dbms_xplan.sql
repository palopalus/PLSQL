--explain plan for
 select /*+ gather_plan_statistics */  sk.int_kod,bu.skratka from sklad_karta  sk ,b_kod_u bu where sk.id=bu.kod_id and sk.id<100 ;

alter session set statistics_level='ALL';

SELECT *
FROM table(DBMS_XPLAN.DISPLAY(FORMAT=>'ALL'));


SELECT *
FROM table(DBMS_XPLAN.DISPLAY_CURSOR(FORMAT=>'ALL +OUTLINE'));

SELECT *
FROM table(DBMS_XPLAN.DISPLAY_CURSOR(FORMAT=>'ALLSTATS LAST ALL +OUTLINE'));

--potrebne pre DBMS_XPLAN.DISPLAY_CURSOR
----------------------------------------
grant select on V_$SQL_PLAN to b2020001;
grant select on  V_$SQL_PLAN_STATISTICS_ALL to b2020001;
grant select on  V_$SQL to b2020001;


select * from V$SQL_PLAN_STATISTICS_ALL;
select * from v$sql;
--touch30.7.2025

