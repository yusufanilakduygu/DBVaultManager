drop table connection_factor_log;

Create table Connection_factor_log (
opdate date,
SESSION_USER varchar2(500),
OS_USER varchar2(500),
HOST varchar2(500),
MODULE varchar2(500),
IP_ADDRESS varchar2(500),
SERVICE_NAME varchar2(500),
SERVER_HOST varchar2(500),
DATABASE_ROLE  varchar2(500),
ENTERPRISE_IDENTITY varchar2(500 )
);

Select * from Connection_factor_log order by opdate desc;
select * from DVSYS.AUDIT_TRAIL$  order by timestamp desc;


 dvowner.log_connection_data;
 
 select * from DBA_DV_SIMULATION_LOG
 
 grant execute on dvowner.log_connection_data to dvsys;



select 
sysdate,
sys_context('USERENV','SESSION_USER'),
sys_context('USERENV','OS_USER') ,
sys_context('USERENV','HOST'),
sys_context('USERENV','MODULE') ,
sys_context('USERENV','IP_ADDRESS'),
sys_context('USERENV','SERVICE_NAME'),
sys_context('USERENV','SERVER_HOST'),
sys_context('USERENV','DATABASE_ROLE'),
sys_context('USERENV','ENTERPRISE_IDENTITY')
 from dual;



BEGIN
DVSYS.DBMS_MACADM.CREATE_RULE_SET(
rule_set_name =>'Log Sessions',
description => 'Log Session data',
enabled => 'Y',
eval_options => DBMS_MACUTL.G_RULESET_EVAL_ANY,
audit_options => DBMS_MACUTL.G_RULESET_AUDIT_OFF,
fail_options => DBMS_MACUTL.G_RULESET_FAIL_SHOW,
fail_message => 'DB Vault rejected',
fail_code => 20007,
handler_options =>DBMS_MACUTL.G_RULESET_HANDLER_FAIL,
handler => 'dvowner.log_connection_data',
is_static => FALSE);
commit;
END;
/


BEGIN
DVSYS.DBMS_MACADM.UPDATE_RULE_SET(
rule_set_name =>'Log Sessions',
description => 'Log Session data',
enabled => 'Y',
eval_options => DBMS_MACUTL.G_RULESET_EVAL_ANY,
audit_options => DBMS_MACUTL.G_RULESET_AUDIT_OFF,
fail_options => DBMS_MACUTL.G_RULESET_FAIL_SHOW,
fail_message => 'DB Vault rejected',
fail_code => 20007,
handler_options =>DBMS_MACUTL.G_RULESET_HANDLER_FAIL,
handler => 'dvowner.log_connection_data',
is_static => FALSE);
commit;
END;
/


BEGIN
DBMS_MACADM.ADD_RULE_TO_RULE_SET( 
rule_set_name => 'Log Sessions',
rule_name => 'True',
rule_order => 1,
enabled => DBMS_MACUTL.G_YES);
END;
/



begin
DVSYS.DBMS_MACADM.CREATE_COMMAND_RULE(
      command => 'CONNECT', 
      rule_set_name => 'Log Sessions', 
      object_owner    => '%', 
      object_name     => '%', 
      enabled         => DBMS_MACUTL.G_YES);
end;
/

begin
DVSYS.DBMS_MACADM.UPDATE_COMMAND_RULE(
      command => 'CONNECT', 
      rule_set_name => 'Log Sessions', 
      object_owner    => '%', 
      object_name     => '%', 
      enabled         => DBMS_MACUTL.G_YES);
end;
/




commit;

CREATE OR REPLACE procedure DVOWNER.deneme ( p_operand  varchar2 ) is

v_check varchar2(1) ;
v_sql varchar2(1000);
begin
v_check:='F';

v_sql := 'begin  if '||p_operand ||' then :v_check := ''T'' ; END IF ; end;';
v_sql := REPLACE(REPLACE(REPLACE(v_sql,CHR(10),' '),CHR(13),' '),CHR(9),' ');
dbms_output.put_line(v_sql );
EXECUTE IMMEDIATE v_sql using out v_check ;
dbms_output.put_line(v_check );
end;
/