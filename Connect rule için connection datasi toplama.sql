/* Bir DB 'de DB vault ile tüm connectionlarin log edilmesi */

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

CREATE OR REPLACE procedure DVOWNER.log_connection_data is
begin
insert into  Connection_factor_log
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
 commit;
 end;
/

grant execute on DVOWNER.log_connection_data to dvsys;

Begin DVSYS.DBMS_MACADM.CREATE_RULE_SET ( 
rule_set_name =>'Log Sessions' , 
description => 'Log Session data' , 
enabled => 'Y' , 
eval_options => 2 , 
audit_options => 0,  /* No audit  */
fail_options => 1 ,  /* Show error mesages */
fail_message => 'DB Vault rejected' , 
fail_code => 20007 , 
handler_options => 2 , /* success */
handler => 'dvowner.log_connection_data', 
is_static => FALSE);
 end;
 /

BEGIN
DBMS_MACADM.ADD_RULE_TO_RULE_SET( 
rule_set_name => 'Log Sessions',
rule_name => 'True',
rule_order => 1,
enabled => DBMS_MACUTL.G_YES);
END;
/


/* Log toplama moduna geçis */
begin
DVSYS.DBMS_MACADM.CREATE_COMMAND_RULE(
      command => 'CONNECT', 
      rule_set_name => 'Log Sessions', 
      object_owner    => '%', 
      object_name     => '%', 
      enabled         => DBMS_MACUTL.G_YES);
end;
/