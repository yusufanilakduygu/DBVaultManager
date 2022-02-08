--------------------------------------------------------
--  File created - Tuesday-February-08-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View COMMANDS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "W_DBVAULT"."COMMANDS" ("COMMAND", "CLAUSE_NAME", "PARAMETER_NAME", "EVENT_NAME", "COMPONENT_NAME", "ACTION_NAME", "RULE_SET_NAME", "OBJECT_OWNER", "OBJECT_NAME", "ENABLED", "PRIVILEGE_SCOPE", "COMMON", "INHERITED", "ORACLE_SUPPLIED", "PL_SQL_STACK") AS 
  Select
        command ,  clause_name, parameter_name,  event_name,  component_name , action_name, rule_set_name, object_owner,object_name,enabled,privilege_scope,
        common,  inherited , oracle_supplied, null PL_SQL_STACK  from dvsys.DBA_DV_COMMAND_RULE@dbvaultlink ;
--------------------------------------------------------
--  DDL for View DBA_DV_SIMULATION_LOG_REMOTE
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "W_DBVAULT"."DBA_DV_SIMULATION_LOG_REMOTE" ("REALM_NAME", "RULE_SET_NAME") AS 
  select REALM_NAME,RULE_SET_NAME from DBA_DV_SIMULATION_LOG@DBVAULTLINK;
--------------------------------------------------------
--  DDL for View POLICIES
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "W_DBVAULT"."POLICIES" ("POLICY_NAME", "DESCRIPTION", "STATE", "ID#", "ORACLE_SUPPLIED", "PL_SQL_STACK") AS 
  Select  POLICY_NAME, DESCRIPTION , STATE , ID# , ORACLE_SUPPLIED ,  NULL PL_SQL_STACK  from DBA_DV_POLICY@dbvaultlink;
--------------------------------------------------------
--  DDL for View REALMS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "W_DBVAULT"."REALMS" ("NAME", "DESCRIPTION", "ENABLED", "AUDIT_OPTIONS", "REALM_TYPE", "COMMON", "INHERITED", "ORACLE_SUPPLIED", "PL_SQL_STACK") AS 
  select name, description,enabled,audit_options, realm_type ,COMMON,  INHERITED , ORACLE_SUPPLIED, null PL_SQL_STACK from DVSYS.DBA_DV_REALM@dbvaultlink ;
--------------------------------------------------------
--  DDL for View REALM_AUTHS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "W_DBVAULT"."REALM_AUTHS" ("REALM_NAME", "GRANTEE", "AUTH_RULE_SET_NAME", "AUTH_OPTIONS", "COMMON_REALM", "INHERITED_REALM", "COMMON_AUTH", "INHERITED_AUTH") AS 
  select realm_name,grantee,auth_rule_set_name,auth_options ,common_realm, inherited_realm ,common_auth, inherited_auth from dvsys.DBA_DV_REALM_AUTH@dbvaultlink ;
--------------------------------------------------------
--  DDL for View REALM_OBJECTS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "W_DBVAULT"."REALM_OBJECTS" ("REALM_NAME", "OWNER", "OBJECT_NAME", "OBJECT_TYPE", "COMMON_REALM", "INHERITED_REALM") AS 
  select realm_name, owner,object_name,object_type , Common_realm,  inherited_realm  from dvsys.DBA_DV_REALM_OBJECT@dbvaultlink ;
--------------------------------------------------------
--  DDL for View RULES
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "W_DBVAULT"."RULES" ("NAME", "RULE_EXPR", "COMMON", "INHERITED", "ORACLE_SUPPLIED") AS 
  Select
       NAME,RULE_EXPR,
        common,  inherited , oracle_supplied from dvsys.dba_DV_Rule@dbvaultlink ;
--------------------------------------------------------
--  DDL for View RULE_SETS
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "W_DBVAULT"."RULE_SETS" ("RULE_SET_NAME", "DESCRIPTION", "ENABLED", "EVAL_OPTIONS_MEANING", "AUDIT_OPTIONS", "FAIL_OPTIONS_MEANING", "FAIL_MESSAGE", "FAIL_CODE", "HANDLER", "HANDLER_OPTIONS", "COMMON", "INHERITED", "ORACLE_SUPPLIED") AS 
  Select
       rule_set_name,description,enabled ,eval_options_meaning,audit_options,Fail_options_meaning,Fail_message,Fail_code,handler,Handler_options,
        common,  inherited , oracle_supplied from dvsys.dba_DV_Rule_Set@dbvaultlink ;
--------------------------------------------------------
--  DDL for View RULE_SET_RULES
--------------------------------------------------------

  CREATE OR REPLACE FORCE EDITIONABLE VIEW "W_DBVAULT"."RULE_SET_RULES" ("RULE_SET_NAME", "RULE_NAME", "RULE_EXPR", "ENABLED", "RULE_ORDER", "COMMON", "INHERITED") AS 
  Select
       RULE_SET_NAME , RULE_NAME,RULE_EXPR,ENABLED,RULE_ORDER, COMMON,  INHERITED from dvsys.DBA_DV_RULE_SET_RULE@dbvaultlink ;
--------------------------------------------------------
--  DDL for DB Link DBVAULTLINK.LOCALDOMAIN
--------------------------------------------------------

  CREATE DATABASE LINK "DBVAULTLINK.LOCALDOMAIN"
   CONNECT TO "DVOWNER" IDENTIFIED BY VALUES ':1'
   USING '192.168.56.106:1524/db4';
--------------------------------------------------------
--  DDL for DB Link OPER.KFS.LOCAL
--------------------------------------------------------

  CREATE DATABASE LINK "OPER.KFS.LOCAL"
   CONNECT TO "U003475" IDENTIFIED BY VALUES ':1'
   USING 'KBLIVE';
--------------------------------------------------------
--  DDL for DB Link X.KFS.LOCAL
--------------------------------------------------------

  CREATE DATABASE LINK "X.KFS.LOCAL"
   CONNECT TO "U005886" IDENTIFIED BY VALUES ':1'
   USING 'CONFLIVE';
--------------------------------------------------------
--  DDL for Table APP_AUDIT
--------------------------------------------------------

  CREATE TABLE "W_DBVAULT"."APP_AUDIT" 
   (	"OP_DATE" DATE, 
	"USERNAME" VARCHAR2(250 BYTE), 
	"HOST" VARCHAR2(250 BYTE), 
	"KOMUT" VARCHAR2(2500 BYTE), 
	"SQLCODE" VARCHAR2(2500 BYTE), 
	"SQLERRM" VARCHAR2(2500 BYTE), 
	"ID#" NUMBER, 
	"REASON" CHAR(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 0 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 MAXSIZE UNLIMITED
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX" ;
--------------------------------------------------------
--  DDL for Table CONNECTION
--------------------------------------------------------

  CREATE TABLE "W_DBVAULT"."CONNECTION" 
   (	"CONNECTION_NAME" VARCHAR2(100 BYTE), 
	"USERNAME" VARCHAR2(100 BYTE), 
	"CONNECTION_STRING" VARCHAR2(500 BYTE), 
	"DESCRIPTION" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table CONNECTION_HISTORY
--------------------------------------------------------

  CREATE TABLE "W_DBVAULT"."CONNECTION_HISTORY" 
   (	"USERNAME" VARCHAR2(200 BYTE), 
	"TNS" VARCHAR2(200 BYTE), 
	"LOGON_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 0 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 MAXSIZE UNLIMITED
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX" ;
--------------------------------------------------------
--  DDL for Table DBVAULT_OPERATION_LOG
--------------------------------------------------------

  CREATE TABLE "W_DBVAULT"."DBVAULT_OPERATION_LOG" 
   (	"OPERTIME" DATE, 
	"DBNAME" VARCHAR2(250 BYTE), 
	"OS_USER" VARCHAR2(250 BYTE), 
	"OPERATION" VARCHAR2(250 BYTE), 
	"PARAMETER" VARCHAR2(500 BYTE), 
	"REASON" VARCHAR2(500 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 0 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 MAXSIZE UNLIMITED
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX" ;
--------------------------------------------------------
--  DDL for Table LAST_CONNECTION
--------------------------------------------------------

  CREATE TABLE "W_DBVAULT"."LAST_CONNECTION" 
   (	"USERNAME" VARCHAR2(200 BYTE), 
	"TNS" VARCHAR2(200 BYTE), 
	"LOGON_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 0 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 MAXSIZE UNLIMITED
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX" ;
--------------------------------------------------------
--  DDL for Table REASON
--------------------------------------------------------

  CREATE TABLE "W_DBVAULT"."REASON" 
   (	"REASON_CODE" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 0 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 MAXSIZE UNLIMITED
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "APEX" ;
--------------------------------------------------------
--  DDL for Sequence APP_AUDIT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "W_DBVAULT"."APP_AUDIT_SEQ"  MINVALUE 0 MAXVALUE 999999999 INCREMENT BY 1 START WITH 1426 CACHE 2 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Trigger APP_AUDIT_REASON_CODE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "W_DBVAULT"."APP_AUDIT_REASON_CODE" 
BEFORE INSERT
ON W_DBVAULT.APP_AUDIT
REFERENCING NEW AS NEW OLD AS OLD
FOR EACH ROW
Begin
Select reason_code into :new.reason from reason;

end;
/
ALTER TRIGGER "W_DBVAULT"."APP_AUDIT_REASON_CODE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TRG_APP_AUDIT
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "W_DBVAULT"."TRG_APP_AUDIT" 
BEFORE INSERT
ON W_DBVAULT.APP_AUDIT
REFERENCING NEW AS New OLD AS Old
FOR EACH ROW
BEGIN
  :new.ID# := APP_AUDIT_SEQ.nextval;
END TRG_APP_AUDIT;
/
ALTER TRIGGER "W_DBVAULT"."TRG_APP_AUDIT" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ADD_FACTOR_LINK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."ADD_FACTOR_LINK" 
(parent_factor_name IN VARCHAR2,
child_factor_name   IN VARCHAR2,
label_indicator     IN VARCHAR2)
is
komut varchar2(1000);
begin

 komut:='Begin
 DVSYS.DBMS_MACADM.ADD_FACTOR_LINK@dbvaultlink( '||
  'parent_factor_name  => '||''''||parent_factor_name||''''||' , '||
  'child_factor_name   => '||''''||child_factor_name||''''||' , '||
  'label_indicator     => '||''''|| label_indicator||''''||' );
  end;
  ';
  


begin
       EXECUTE immediate (komut);

exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;
end;

/
--------------------------------------------------------
--  DDL for Procedure ADD_RULE_TO_RULE_SET
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."ADD_RULE_TO_RULE_SET" 
(
  P_RULE_SET_NAME IN VARCHAR2 ,
  P_RULE_NAME IN VARCHAR2 ,
  P_RULE_ORDER IN NUMBER,
  P_ENABLED  IN VARCHAR2
) is

komut varchar2(500);

begin


komut:='Begin
DVSYS.DBMS_MACADM.ADD_RULE_TO_RULE_SET@dbvaultlink(
rule_set_name => '||''''||P_rule_set_name ||''''||',
rule_name => '    ||''''||P_rule_name    ||''''||',
rule_order => '   ||    to_char(P_rule_order)||',
enabled =>  '     ||''''||P_enabled      ||''''||');
end;
';

begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;


null;


END ADD_RULE_TO_RULE_SET;

/
--------------------------------------------------------
--  DDL for Procedure AUDIT_DBVAULT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."AUDIT_DBVAULT" ( p_komut varchar2,p_sqlcode varchar2,p_sqlerrm varchar2) is
v_username varchar2(250);
v_host varchar2(250);
begin
select username,host into v_username,v_host from user_db_links where db_link like 'DBVAULTLINK%';
insert into app_audit( OP_DATE,USERNAME,HOST,KOMUT,SQLCODE,SQLERRM) values ( sysdate,v_username,v_host,p_komut,p_sqlcode,p_sqlerrm);
end;

/
--------------------------------------------------------
--  DDL for Procedure CHECK_DB_LINK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."CHECK_DB_LINK" (  dbname varchar2 ) is
x number;
begin
execute immediate ('insert into check_connection select 1 from dual@'||dbname) ;
commit;
end;

/
--------------------------------------------------------
--  DDL for Procedure CMD_CHK_RULE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."CMD_CHK_RULE" ( Rule varchar2 )
is
komut  varchar2(1000);
begin

komut:='Select 2 from dual@dbvaultlink where '||Rule;
EXECUTE immediate (komut);
end ;

/
--------------------------------------------------------
--  DDL for Procedure CMD_CREATE_COMMAND_RULE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."CMD_CREATE_COMMAND_RULE" (command IN VARCHAR2, rule_set_name IN VARCHAR2, object_owner  IN VARCHAR2, enabled IN varchar2,object_name varchar2 ) IS
komut varchar2(500);
BEGIN


komut:=
 'Begin
  DVSYS.DBMS_MACADM.CREATE_COMMAND_RULE@dbvaultlink(
  command    => '||''''||command||''''||',
  rule_set_name   => '||''''||rule_set_name||''''||',
  enabled       => '||''''||enabled||''''||',
  object_name       => '||''''||object_name||''''||',
  object_owner => '||''''||object_owner ||''''||');
  end;
  ';


begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure CMD_CREATE_COMMAND_RULE_122
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."CMD_CREATE_COMMAND_RULE_122" (command IN VARCHAR2, rule_set_name IN VARCHAR2, object_owner  IN VARCHAR2, enabled IN varchar2,object_name varchar2 ) IS
komut varchar2(500);
BEGIN


komut:=
 'Begin
  DVSYS.DBMS_MACADM.CREATE_COMMAND_RULE@dbvaultlink(
  command    => '||''''||command||''''||',
  rule_set_name   => '||''''||rule_set_name||''''||',
  enabled       => '||''''||enabled||''''||',
  object_name       => '||''''||object_name||''''||',
  scope => 1,'||'
  object_owner => '||''''||object_owner ||''''||');
  end;
  ';


begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure CMD_DELETE_COMMAND_RULE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."CMD_DELETE_COMMAND_RULE" 
(command IN VARCHAR2,
object_owner IN VARCHAR2,
object_name IN VARCHAR2)
is
komut varchar2(500);
begin
komut:=
 'Begin
  DVSYS.DBMS_MACADM.DELETE_COMMAND_RULE@dbvaultlink(
  command    => '||''''||command||''''||',
  object_name       => '||''''||object_name||''''||',
  object_owner => '||''''||object_owner ||''''||');
  end;
  ';


begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
end;

/
--------------------------------------------------------
--  DDL for Procedure CMD_DELETE_COMMAND_RULE_122
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."CMD_DELETE_COMMAND_RULE_122" 
(command IN VARCHAR2,
object_owner IN VARCHAR2,
object_name IN VARCHAR2)
is
komut varchar2(500);
begin
komut:=
 'Begin
  DVSYS.DBMS_MACADM.DELETE_COMMAND_RULE@dbvaultlink(
  command    => '||''''||command||''''||',
  object_name       => '||''''||object_name||''''||',
  scope => 1,'||'
  object_owner => '||''''||object_owner ||''''||');
  end;
  ';


begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
end;

/
--------------------------------------------------------
--  DDL for Procedure CMD_UPDATE_COMMAND_RULE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."CMD_UPDATE_COMMAND_RULE" (command IN VARCHAR2, rule_set_name IN VARCHAR2, object_owner  IN VARCHAR2, enabled IN varchar2,object_name varchar2 ) IS
komut varchar2(500);
BEGIN


komut:=
 'Begin
  DVSYS.DBMS_MACADM.UPDATE_COMMAND_RULE@dbvaultlink(
  command    => '||''''||command||''''||',
  rule_set_name   => '||''''||rule_set_name||''''||',
  enabled       => '||''''||enabled||''''||',
  object_name       => '||''''||object_name||''''||',
  object_owner => '||''''||object_owner ||''''||');
  end;
  ';


begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure CMD_UPDATE_COMMAND_RULE_122
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."CMD_UPDATE_COMMAND_RULE_122" (command IN VARCHAR2, rule_set_name IN VARCHAR2, object_owner  IN VARCHAR2, enabled IN varchar2,object_name varchar2 ) IS
komut varchar2(500);
BEGIN


komut:=
 'Begin
  DVSYS.DBMS_MACADM.UPDATE_COMMAND_RULE@dbvaultlink(
  command    => '||''''||command||''''||',
  rule_set_name   => '||''''||rule_set_name||''''||',
  enabled       => '||''''||enabled||''''||',
  object_name       => '||''''||object_name||''''||',
  scope => 1,'||'
  object_owner => '||''''||object_owner ||''''||');
  end;
  ';


begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure CMD_UPDATE_COMMAND_RULE_18
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."CMD_UPDATE_COMMAND_RULE_18" (command IN VARCHAR2, rule_set_name IN VARCHAR2, object_owner  IN VARCHAR2, enabled IN varchar2,object_name varchar2,PL_SQL_STACK varchar2 ) IS
komut varchar2(500);
BEGIN


komut:=
 'Begin
  DVSYS.DBMS_MACADM.UPDATE_COMMAND_RULE@dbvaultlink(
  command    => '||''''||command||''''||',
  rule_set_name   => '||''''||rule_set_name||''''||',
  enabled       => '||''''||enabled||''''||',
  object_name       => '||''''||object_name||''''||',
  scope => 1,'||'
  object_owner => '||''''||object_owner ||''''||',
  pl_sql_stack =>'||pl_sql_stack||');
  end;
  ';


begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure CREATE_FACTOR
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."CREATE_FACTOR" (
  factor_name       IN VARCHAR2,
  factor_type_name  IN VARCHAR2,
  description       IN VARCHAR2,
  rule_set_name     IN VARCHAR2,
  get_expr          IN VARCHAR2,
  validate_expr     IN VARCHAR2,
  identify_by       IN NUMBER,
  labeled_by        IN NUMBER,
  eval_options      IN NUMBER,
  audit_options     IN NUMBER,
  fail_options      IN NUMBER)
  is

komut varchar2(2000);
v_get_expr          varchar(500);
v_validate_expr     varchar2(500);

begin


komut:='
 Begin
 DVSYS.DBMS_MACADM.CREATE_FACTOR@dbvaultlink( 
 factor_name       => '||''''||factor_name||''''||',
 factor_type_name  => '||''''||factor_type_name||''''||',
  description  => '||''''||description||''''||',
  rule_set_name => '||''''||rule_set_name||''''||',
  get_expr => '     ||''''||replace(get_expr,'''','''''')||''''||',
  validate_expr => '||''''||replace(validate_expr,'''','''''')||''''||',
  identify_by  => ' ||to_char(identify_by)  ||',
  labeled_by  => '||to_char(labeled_by) ||',
  eval_options => '||to_char(eval_options)||',
  audit_options  => '||to_char(audit_options)||',
  fail_options => '||to_char(fail_options)||');
  end;
 ';
  
  
begin

       EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;
  end;

/
--------------------------------------------------------
--  DDL for Procedure CREATE_IDENTITY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."CREATE_IDENTITY" (
  factor_name  IN VARCHAR2,
  value        IN VARCHAR2,
  trust_level  IN NUMBER)
is
komut varchar2(1000);
begin

 komut:='Begin
 DVSYS.DBMS_MACADM.CREATE_IDENTITY@dbvaultlink( 
  factor_name  => '||''''||factor_name||''''||',
  value        => '||''''||value||''''||',
  trust_level  => '||trust_level||');
  end;
  ';


begin

       EXECUTE immediate (komut);

exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;
  end;

/
--------------------------------------------------------
--  DDL for Procedure CREATE_IDENTITY_MAP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."CREATE_IDENTITY_MAP" 
(identity_factor_name IN VARCHAR2,
identity_factor_value IN VARCHAR2,
parent_factor_name IN VARCHAR2,
child_factor_name IN VARCHAR2,
operation IN VARCHAR2,
operand1 IN VARCHAR2,
operand2 IN VARCHAR2)
is
komut varchar2(1000);
begin

 komut:='
 Begin
 DVSYS.DBMS_MACADM.CREATE_IDENTITY_MAP@dbvaultlink( 
  identity_factor_name  => '||''''||identity_factor_name||''''||' ,  
  identity_factor_value => '||''''||identity_factor_value||''''||' ,  
  parent_factor_name    => '||''''||parent_factor_name||''''||' ,  
  child_factor_name     => '||''''||child_factor_name||''''||' , 
  operation             => '||''''||operation||''''||' ,  
  operand1              => '||''''||replace(operand1,'''','''''')||''''||' ,  
  operand2              => '||''''||replace(operand2,'''','''''')||''''||' ) 
  end;
  ';
  
begin
       EXECUTE immediate (komut);

exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;
end;

/
--------------------------------------------------------
--  DDL for Procedure DBVAULTOPER_CMD_UPDATE_11
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."DBVAULTOPER_CMD_UPDATE_11" (command IN VARCHAR2, rule_set_name IN VARCHAR2, object_owner  IN VARCHAR2, enabled IN varchar2,object_name varchar2 ) IS
/*
Bu Procedure yaln?zca YKB için kullan?l?yor.
*/

komut varchar2(500);
BEGIN


komut:=
 'Begin
  DVSYS.DBMS_MACADM.UPDATE_COMMAND_RULE@oper(
  command    => '||''''||command||''''||',
  rule_set_name   => '||''''||rule_set_name||''''||',
  enabled       => '||''''||enabled||''''||',
  object_name       => '||''''||object_name||''''||',
  object_owner => '||''''||object_owner ||''''||');
  end;
  ';

    EXECUTE immediate (komut);


END;

/
--------------------------------------------------------
--  DDL for Procedure DBVAULTOPER_CMD_UPDATE_12
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."DBVAULTOPER_CMD_UPDATE_12" (command IN VARCHAR2, rule_set_name IN VARCHAR2, object_owner  IN VARCHAR2, enabled IN varchar2,object_name varchar2 ) IS
/*
Bu Procedure yaln?zca YKB için kullan?l?yor.
*/
komut varchar2(500);
BEGIN

komut:=
 'Begin
  DVSYS.DBMS_MACADM.UPDATE_COMMAND_RULE@oper(
  command    => '||''''||command||''''||',
  rule_set_name   => '||''''||rule_set_name||''''||',
  enabled       => '||''''||enabled||''''||',
  object_name       => '||''''||object_name||''''||',
  scope => 1,'||'
  object_owner => '||''''||object_owner ||''''||');
  end;
  ';

EXECUTE immediate (komut);


END;

/
--------------------------------------------------------
--  DDL for Procedure DELETE_FACTOR
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."DELETE_FACTOR" (
  factor_name       IN VARCHAR2)
  is

komut varchar2(1000);
begin

 komut:='  Begin
 DVSYS.DBMS_MACADM.DELETE_FACTOR@dbvaultlink(
 factor_name       => '||''''||factor_name||''''||'); 
 end ;
 ';


begin
       EXECUTE immediate (komut);

exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;
  end;

/
--------------------------------------------------------
--  DDL for Procedure DELETE_IDENTITY_MAP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."DELETE_IDENTITY_MAP" (
identity_factor_name IN VARCHAR2,
identity_factor_value  IN VARCHAR2,
parent_factor_name IN VARCHAR2,
child_factor_name IN VARCHAR2,
operation  IN VARCHAR2,
operand1 IN VARCHAR2,
operand2 IN VARCHAR2
) IS
komut varchar2(500);
BEGIN


if ( operand2 is not NULL ) or ( operand2 <> '' )
then
komut:=
 'Begin
  DVSYS.DBMS_MACADM.DELETE_IDENTITY_MAP@dbvaultlink(
  identity_factor_name   => '||''''||identity_factor_name||''''||',
  identity_factor_value    => '||''''||identity_factor_value||''''||',
  parent_factor_name   => '||''''||parent_factor_name||''''||',
  child_factor_name       => '||''''||child_factor_name||''''||',
  operation       => '||''''||operation||''''||',
  operand1       => '||''''||operand1||''''||',
  operand2       => '||''''||operand2||''''||'
  );
  end;
  ';
end if;


if ( operand2 is  NULL ) or  (operand2 ='') Then

komut:=
 'Begin
  DVSYS.DBMS_MACADM.DELETE_IDENTITY_MAP@dbvaultlink(
  identity_factor_name   => '||''''||identity_factor_name||''''||',
  identity_factor_value    => '||''''||identity_factor_value||''''||',
  parent_factor_name   => '||''''||parent_factor_name||''''||',
  child_factor_name       => '||''''||child_factor_name||''''||',
  operation       => '||''''||operation||''''||',
  operand1       => '||''''||operand1||''''||',
  operand2       => '||'NULL'||'
  );
  end;
  ';
end if;

begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure DELETE_RULE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."DELETE_RULE" 
(
  P_RULE_NAME IN VARCHAR2
) is

komut varchar2(500);

begin


komut:='
Begin
DVSYS.DBMS_MACADM.DELETE_RULE@dbvaultlink(
rule_name =>' || ''''||P_rule_name||''''||');
end;
';

begin
       EXECUTE immediate (komut);

exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END DELETE_RULE;

/
--------------------------------------------------------
--  DDL for Procedure DELETE_RULE_FROM_RULE_SET
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."DELETE_RULE_FROM_RULE_SET" 
(
  P_RULE_SET_NAME IN VARCHAR2 ,
  P_RULE_NAME IN VARCHAR2
) is

komut varchar2(500);

begin

komut:='Begin
DVSYS.DBMS_MACADM.DELETE_RULE_FROM_RULE_SET@dbvaultlink(
rule_set_name =>' ||''''|| P_rule_set_name||''''||',
rule_name =>' ||''''|| P_rule_name ||''''||');
end;
';


begin
EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;


END DELETE_RULE_FROM_RULE_SET;

/
--------------------------------------------------------
--  DDL for Procedure DELETE_RULE_SET
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."DELETE_RULE_SET" 
(
  P_RULE_SET_NAME IN VARCHAR2
) is

komut varchar2(500);

begin

komut:='Begin
DVSYS.DBMS_MACADM.DELETE_RULE_SET@dbvaultlink(
rule_set_name =>' ||''''|| P_rule_set_name||''''||');
end;
';

begin

       EXECUTE immediate (komut);

exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;


END DELETE_RULE_SET;

/
--------------------------------------------------------
--  DDL for Procedure FACTOR_DELETE_FACTOR_LINK
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."FACTOR_DELETE_FACTOR_LINK" 
(parent_factor_name IN VARCHAR2,
child_factor_name   IN VARCHAR2)
is
komut varchar2(1000);
begin

komut:='
Begin
DVSYS.DBMS_MACADM.DELETE_FACTOR_LINK@dbvaultlink( '||
  'parent_factor_name  => '||''''||parent_factor_name||''''||' , '||
  'child_factor_name   => '||''''|| child_factor_name||''''||');
end;
 ';


begin
EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;
end;

/
--------------------------------------------------------
--  DDL for Procedure FACTOR_DELETE_IDENTITY
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."FACTOR_DELETE_IDENTITY" 
(factor_name IN VARCHAR2,
value   IN VARCHAR2)
is
komut varchar2(1000);
begin

komut:='
Begin
DVSYS.DBMS_MACADM.DELETE_IDENTITY@dbvaultlink( '||
  'factor_name  => '||''''||factor_name||''''||' , '||
  'value   => '||''''||value||''''||');
end;
 ';


begin
EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;
end;

/
--------------------------------------------------------
--  DDL for Procedure FAC_ADD_IDENTITY_MAP_VALUE_OP
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."FAC_ADD_IDENTITY_MAP_VALUE_OP" (P_IDENTITY_VALUE varchar2, P_OPERATION_CODE varchar2, P_OPERAND1 varchar2) AS

/* 
BU Procedure yaln?zca YKB için kullan?l?yor.
kullanmak için komut de?i?kenini düzeltmek gerekir 
Bu ?ekilde duzgun calismaz
   
*/
c1                      number;
v_factor_name           varchar2(250);
v_parent_factor_name    varchar2(250);
v_child_factor_name     varchar2(250);
komut varchar2(500);

BEGIN

c1 := 0;

Select nvl(count(distinct factor_name||parent_factor_name||child_factor_name ),0)  into c1
   from dvsys.DBA_DV_IDENTITY_MAP@dbvaultlink where identity_value=P_IDENTITY_VALUE;

if c1 = 0
    then
        RAISE_APPLICATION_ERROR (-20201,  'Please Define Factor Link');
    end if;

if c1 > 1
    then
        RAISE_APPLICATION_ERROR (-20201,  'More Than one Factor Definition Found');
    end if;

Select distinct factor_name,parent_factor_name,child_factor_name into
  v_factor_name,v_parent_factor_name,v_child_factor_name from dvsys.DBA_DV_IDENTITY_MAP@dbvaultlink where identity_value=P_IDENTITY_VALUE;


komut:='DVSYS.DBMS_MACADM.CREATE_IDENTITY_MAP@dbvaultlink(
identity_factor_name =>   '||v_factor_name||'
identity_factor_value =>  '||P_IDENTITY_VALUE||'
parent_factor_name =>     '||v_parent_factor_name||'
child_factor_name =>      '||v_child_factor_name||'
operation =>              '||P_OPERATION_CODE||'
operand1 =>               '||P_OPERAND1||'
operand2 =>               NULL)';



begin

   EXECUTE immediate (komut);

exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;


END FAC_ADD_IDENTITY_MAP_VALUE_OP;

/
--------------------------------------------------------
--  DDL for Procedure PREPARE_VIEWS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."PREPARE_VIEWS" ( p_version varchar2) is
begin

/* DVSYS.DBA_DV_REALM --> Realms */

if P_version not in ('11.2','12.1','12.2','18.0','19.0' ) Then
 Raise_Application_Error (-20001, 'Program does not support this version  >> '||P_version);
end if;

if p_version='11.2' then
    execute immediate ('create or replace view realms as select name, description,enabled,audit_options, null realm_type , NULL COMMON , null INHERITED , null ORACLE_SUPPLIED , null PL_SQL_STACK from DVSYS.DBA_DV_REALM@dbvaultlink ' );
end if;

if p_version='12.1' then
    execute immediate ('create or replace view realms as select name, description,enabled,audit_options, realm_type , NULL COMMON, null INHERITED ,  null ORACLE_SUPPLIED , null PL_SQL_STACK  from DVSYS.DBA_DV_REALM@dbvaultlink ' );
end if;

if p_version='12.2' then
    execute immediate ('create or replace view realms as select name, description,enabled,audit_options, realm_type ,COMMON,  INHERITED , ORACLE_SUPPLIED, null PL_SQL_STACK from DVSYS.DBA_DV_REALM@dbvaultlink ' );
end if;

if p_version like '18%' or  p_version like '19%' then
    execute immediate ('create or replace view realms as select name, description,enabled,audit_options, realm_type ,COMMON,  INHERITED , ORACLE_SUPPLIED, PL_SQL_STACK from DVSYS.DBA_DV_REALM@dbvaultlink ' );
end if;

/* dvsys.DBA_DV_REALM_OBJECT --> Realm_objects */

if p_version='11.2'  or p_version='12.1' then
    execute immediate ('create or replace view realm_objects  as select realm_name, owner,object_name,object_type , NULL Common_realm, NULL inherited_realm  from dvsys.DBA_DV_REALM_OBJECT@dbvaultlink ');
end if;

if p_version='12.2' OR p_version like '18%'  or  p_version like '19%' then
    execute immediate ('create or replace view realm_objects  as select realm_name, owner,object_name,object_type , Common_realm,  inherited_realm  from dvsys.DBA_DV_REALM_OBJECT@dbvaultlink ');
end if;


/*
  dvsys.DBA_DV_REALM_AUTH --> Realm_auths    */

if p_version='11.2' OR  p_version='12.1'
then
    execute immediate ('create or replace view realm_auths as select realm_name,grantee,auth_rule_set_name,auth_options , NULL common_realm, NULL inherited_realm , NULL common_auth, NULL inherited_auth from dvsys.DBA_DV_REALM_AUTH@dbvaultlink ');
end if;

if p_version='12.2' OR p_version like '18%' or  p_version like '19%'   then
    execute immediate ('create or replace view realm_auths as select realm_name,grantee,auth_rule_set_name,auth_options ,common_realm, inherited_realm ,common_auth, inherited_auth from dvsys.DBA_DV_REALM_AUTH@dbvaultlink ');
end if;


/*
  dvsys.DBA_DV_COMMAND_RULE --> Commands    */

if p_version='11.2' OR  p_version='12.1'
then
    execute immediate ('create or replace view commands as Select
        command , null clause_name, null parameter_name, null event_name, null component_name , null action_name, rule_set_name, object_owner,object_name,enabled,privilege_scope,
        null common, null inherited , null oracle_supplied , null PL_SQL_STACK from dvsys.DBA_DV_COMMAND_RULE@dbvaultlink ');
end if;

if p_version='12.2' then
   execute immediate ('create or replace view commands as Select
        command ,  clause_name, parameter_name,  event_name,  component_name , action_name, rule_set_name, object_owner,object_name,enabled,privilege_scope,
        common,  inherited , oracle_supplied, null PL_SQL_STACK  from dvsys.DBA_DV_COMMAND_RULE@dbvaultlink ');end if;

if p_version like '18%' or  p_version like '19%' then
   execute immediate ('create or replace view commands as Select
        command ,  clause_name, parameter_name,  event_name,  component_name , action_name, rule_set_name, object_owner,object_name,enabled,privilege_scope,
        common,  inherited , oracle_supplied,  PL_SQL_STACK  from dvsys.DBA_DV_COMMAND_RULE@dbvaultlink ');end if;

/* dba_dv_rule_set */

if p_version='11.2' OR  p_version='12.1'
then
    execute immediate ('create or replace view rule_sets as Select
       rule_set_name,description,enabled ,eval_options_meaning,audit_options,Fail_options_meaning,Fail_message,Fail_code,handler,Handler_options,
        null common, null inherited , null oracle_supplied from dvsys.dba_DV_Rule_Set@dbvaultlink ');
end if;

if p_version='12.2'  OR p_version like '18%' or  p_version like '19%'  then
   execute immediate ('create or replace view rule_sets as Select
       rule_set_name,description,enabled ,eval_options_meaning,audit_options,Fail_options_meaning,Fail_message,Fail_code,handler,Handler_options,
        common,  inherited , oracle_supplied from dvsys.dba_DV_Rule_Set@dbvaultlink ');end if;


/* dba_dv_rule  */

if p_version='11.2' OR  p_version='12.1'
then
    execute immediate ('create or replace view rules as Select
       NAME,RULE_EXPR,
        null common, null inherited , null oracle_supplied from dvsys.dba_DV_Rule@dbvaultlink ');
end if;

if p_version='12.2' OR p_version like '18%' or  p_version like '19%' then
   execute immediate ('create or replace view rules as Select
       NAME,RULE_EXPR,
        common,  inherited , oracle_supplied from dvsys.dba_DV_Rule@dbvaultlink ');end if;



/* dba_dv_rule_set_rule  */

if p_version='11.2' OR  p_version='12.1'
then
    execute immediate ('create or replace view rule_set_rules as Select
       RULE_SET_NAME , RULE_NAME,RULE_EXPR,ENABLED,RULE_ORDER, NULL COMMON, NULL INHERITED from dvsys.DBA_DV_RULE_SET_RULE@dbvaultlink ');
end if;

if p_version='12.2' OR p_version like '18%' or  p_version like '19%' then
   execute immediate ('create or replace view rule_set_rules as Select
       RULE_SET_NAME , RULE_NAME,RULE_EXPR,ENABLED,RULE_ORDER, COMMON,  INHERITED from dvsys.DBA_DV_RULE_SET_RULE@dbvaultlink ');
       end if;



/* Policy views */

if p_version='12.2' Then
execute immediate (' create or replace view policies as Select  POLICY_NAME, DESCRIPTION , STATE , ID# , ORACLE_SUPPLIED ,  NULL PL_SQL_STACK  from DBA_DV_POLICY@dbvaultlink' );
end if;

if p_version  like '18%' or  p_version like '19%'
Then
execute immediate (' create or replace view policies as Select  POLICY_NAME, DESCRIPTION , STATE , ID# , ORACLE_SUPPLIED ,  PL_SQL_STACK  from DBA_DV_POLICY@dbvaultlink' );
end if;

end;

/
--------------------------------------------------------
--  DDL for Procedure REA_ADD_AUTH_TO_REALM
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."REA_ADD_AUTH_TO_REALM" (realm_name IN VARCHAR2, grantee  IN VARCHAR2, rule_set_name IN VARCHAR2, auth_options  IN NUMBER ) IS
komut varchar2(500);
BEGIN

if rule_set_name is not NULL
then
komut:=
 'Begin
  DVSYS.DBMS_MACADM.ADD_AUTH_TO_REALM@dbvaultlink(
  realm_name    => '||''''||REALM_NAME||''''||',
  grantee    => '||''''||grantee||''''||',
  rule_set_name   => '||''''||rule_set_name||''''||',
  auth_options       => '||auth_options||');
  end;
  ';
else
komut:=
 'Begin
  DVSYS.DBMS_MACADM.ADD_AUTH_TO_REALM@dbvaultlink(
  realm_name    => '||''''||REALM_NAME||''''||',
  grantee    => '||''''||grantee||''''||',
  auth_options       => '||auth_options||');
  end;
  ';
end if;


begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure REA_ADD_AUTH_TO_REALM18
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."REA_ADD_AUTH_TO_REALM18" (realm_name IN VARCHAR2, grantee  IN VARCHAR2, rule_set_name IN VARCHAR2, auth_options  IN NUMBER ) IS
komut varchar2(500);
BEGIN

if rule_set_name is not NULL
then
komut:=
 'Begin
  DVSYS.DBMS_MACADM.ADD_AUTH_TO_REALM@dbvaultlink(
  realm_name    => '||''''||REALM_NAME||''''||',
  grantee    => '||''''||grantee||''''||',
  rule_set_name   => '||''''||rule_set_name||''''||',
  auth_options       => '||auth_options||',
  auth_scope  => 1  );
  end;
  ';
else
komut:=
 'Begin
  DVSYS.DBMS_MACADM.ADD_AUTH_TO_REALM@dbvaultlink(
  realm_name    => '||''''||REALM_NAME||''''||',
  grantee    => '||''''||grantee||''''||',
  auth_options       => '||auth_options||',
  auth_scope  => 1  );
  end;
  ';
end if;


begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure REA_ADD_OBJECT_TO_REALM
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."REA_ADD_OBJECT_TO_REALM" (realm_name IN VARCHAR2, object_owner IN VARCHAR2, object_name IN VARCHAR2, object_type IN VARCHAR2 ,P_role IN varchar2) IS
komut varchar2(500);
BEGIN

if  object_type='ROLE'
then
komut:=
 'Begin
  DVSYS.DBMS_MACADM.ADD_OBJECT_TO_REALM@dbvaultlink(
  realm_name    => '||''''|| REALM_NAME||''''||',
  object_owner    => '||''''||'%'||''''||',
  object_name   => '||''''||P_role||''''||',
  object_type   => '||''''||object_type||''''||');
  end;
  ';
else
komut:=
 'Begin
  DVSYS.DBMS_MACADM.ADD_OBJECT_TO_REALM@dbvaultlink(
  realm_name    => '||''''||REALM_NAME||''''||',
  object_owner    => '||''''||OBJECT_OWNER||''''||',
  object_name   => '||''''||object_name||''''||',
  object_type   => '||''''||object_type||''''||');
  end;
  ';
end if;

begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure REA_CREATE_REALM
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."REA_CREATE_REALM" (realm_name IN VARCHAR2, description IN VARCHAR2, enabled  IN VARCHAR2, audit_options IN NUMBER ) IS
komut varchar2(500);
BEGIN

komut:=
 'Begin
  DVSYS.DBMS_MACADM.CREATE_REALM@dbvaultlink(
  realm_name    => '||''''||REALM_NAME||''''||',
  description   => '||''''||description||''''||',
  enabled       => '||''''||enabled||''''||',
  audit_options => '||audit_options||');
  end;
  ';

begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure REA_CREATE_REALM_121
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."REA_CREATE_REALM_121" (realm_name IN VARCHAR2, description IN VARCHAR2, enabled  IN VARCHAR2, audit_options IN NUMBER,realm_type number ) IS
komut varchar2(500);
BEGIN

komut:=
 'Begin
  DVSYS.DBMS_MACADM.CREATE_REALM@dbvaultlink(
  realm_name    => '||''''||REALM_NAME||''''||',
  description   => '||''''||description||''''||',
  enabled       => '||''''||enabled||''''||',
  audit_options => '||audit_options||',
  realm_type    => '||realm_type||');
  end;
  ';

begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure REA_CREATE_REALM_122
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."REA_CREATE_REALM_122" (realm_name IN VARCHAR2, description IN VARCHAR2, enabled  IN VARCHAR2, audit_options IN NUMBER,realm_type number , realm_scope number) IS
komut varchar2(500);
BEGIN

komut:=
 'Begin
  DVSYS.DBMS_MACADM.CREATE_REALM@dbvaultlink(
  realm_name    => '||''''||REALM_NAME||''''||',
  description   => '||''''||description||''''||',
  enabled       => '||''''||enabled||''''||',
  audit_options => '||audit_options||',
  realm_scope   => '||realm_scope||',
  realm_type    => '||realm_type||');
  end;
  ';

begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure REA_CREATE_REALM_18
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."REA_CREATE_REALM_18" (realm_name IN VARCHAR2, description IN VARCHAR2, enabled  IN VARCHAR2, audit_options IN NUMBER,realm_type number , realm_scope number,PL_SQL_STACK varchar2) IS
komut varchar2(500);
BEGIN

komut:=
 'Begin
  DVSYS.DBMS_MACADM.CREATE_REALM@dbvaultlink(
  realm_name    => '||''''||REALM_NAME||''''||',
  description   => '||''''||description||''''||',
  enabled       => '||''''||enabled||''''||',
  audit_options => '||audit_options||',
  realm_scope   => '||realm_scope||',
  realm_type    => '||realm_type||',
  pl_sql_stack  => '||PL_SQL_STACK||');
  end;
  ';

begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure REA_DELETE_AUTH_FROM_REALM
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."REA_DELETE_AUTH_FROM_REALM" (realm_name IN VARCHAR2,grantee    IN VARCHAR2) IS
komut varchar2(500);
BEGIN

komut:='Begin
DVSYS.DBMS_MACADM.DELETE_AUTH_FROM_REALM@dbvaultlink(
realm_name    => '||''''||realm_name||''''||',
grantee => '||''''||grantee||''''||');
end;
';

begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure REA_DELETE_AUTH_FROM_REALM122
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."REA_DELETE_AUTH_FROM_REALM122" (realm_name IN VARCHAR2,grantee    IN VARCHAR2, auth_scope IN number ) IS
komut varchar2(500);
BEGIN

komut:='Begin
DVSYS.DBMS_MACADM.DELETE_AUTH_FROM_REALM@dbvaultlink(
realm_name    => '||''''||realm_name||''''||',
grantee => '||''''||grantee||''''||',
auth_scope  => 1 );
end;
';

begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure REA_DELETE_OBJECT_FROM_REALM
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."REA_DELETE_OBJECT_FROM_REALM" (  realm_name   IN VARCHAR2,
  object_owner IN VARCHAR2,
  object_name  IN VARCHAR2,
  object_type  IN VARCHAR2) IS
komut varchar2(500);
BEGIN
komut:=
 'Begin
  DVSYS.DBMS_MACADM.DELETE_OBJECT_FROM_REALM@dbvaultlink(
  realm_name    => '||''''|| REALM_NAME||''''||',
  object_owner    => '||''''||object_owner||''''||',
  object_name   => '||''''||object_name||''''||',
  object_type   => '||''''||object_type||''''||');
  end;
  ';

begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure REA_DELETE_REALM
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."REA_DELETE_REALM" (realm_name IN VARCHAR2) IS
komut varchar2(500);
BEGIN

komut:=
'Begin
DVSYS.DBMS_MACADM.DELETE_REALM@dbvaultlink(
realm_name    => '||''''||realm_name||''''||');
end;
';

begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure REA_UPDATE_REALM
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."REA_UPDATE_REALM" (realm_name IN VARCHAR2, description IN VARCHAR2, enabled  IN VARCHAR2, audit_options IN NUMBER ) IS
komut varchar2(500);
BEGIN

komut:=
 'Begin
  DVSYS.DBMS_MACADM.UPDATE_REALM@dbvaultlink(
  realm_name    => '||''''||REALM_NAME||''''||',
  description   => '||''''||description||''''||',
  enabled       => '||''''||enabled||''''||',
  audit_options => '||audit_options||');
  end;
  ';

begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure REA_UPDATE_REALM_121
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."REA_UPDATE_REALM_121" (realm_name IN VARCHAR2, description IN VARCHAR2, enabled  IN VARCHAR2, audit_options IN NUMBER , realm_type number ) IS
komut varchar2(500);
BEGIN

komut:=
 'Begin
  DVSYS.DBMS_MACADM.UPDATE_REALM@dbvaultlink(
  realm_name    => '||''''||REALM_NAME||''''||',
  description   => '||''''||description||''''||',
  enabled       => '||''''||enabled||''''||',
  audit_options => '||audit_options||',
  realm_type    => '||realm_type||');
  end;
  ';

begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure REA_UPDATE_REALM_18
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."REA_UPDATE_REALM_18" (realm_name IN VARCHAR2, description IN VARCHAR2, enabled  IN VARCHAR2, audit_options IN NUMBER , realm_type number,pl_sql_stack varchar2 ) IS
komut varchar2(500);
BEGIN

komut:=
 'Begin
  DVSYS.DBMS_MACADM.UPDATE_REALM@dbvaultlink(
  realm_name    => '||''''||REALM_NAME||''''||',
  description   => '||''''||description||''''||',
  enabled       => '||''''||enabled||''''||',
  audit_options => '||audit_options||',
  realm_type    => '||realm_type||',
  pl_sql_stack  => '||PL_SQL_STACK||');
  end;
  ';

begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure RULESET_CREATE_RULE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."RULESET_CREATE_RULE" 
(P_rule_name IN VARCHAR2,
P_rule_expr IN VARCHAR2
)
is
komut varchar2(500);
v_is_static boolean;

begin

komut:='
Begin
DVSYS.DBMS_MACADM.CREATE_RULE@dbvaultlink(
rule_name =>' || ''''||P_rule_name||''''||' ,
rule_expr => '||''''||replace(P_rule_expr,'''','''''')||''''||');
end;
';

begin
       EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;
end;

/
--------------------------------------------------------
--  DDL for Procedure RULESET_CREATE_RULE_122
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."RULESET_CREATE_RULE_122" 
(P_rule_name IN VARCHAR2,
P_rule_expr IN VARCHAR2,
P_scope IN number
)
is
komut varchar2(500);
v_is_static boolean;

begin

komut:='
Begin
DVSYS.DBMS_MACADM.CREATE_RULE@dbvaultlink(
rule_name =>' || ''''||P_rule_name||''''||' ,
rule_expr => '||''''||replace(P_rule_expr,'''','''''')||''''||',
scope => '||to_char(P_scope)||');
end;
';

begin
       EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;


null;

end;

/
--------------------------------------------------------
--  DDL for Procedure RULESET_CREATE_RULE_SET
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."RULESET_CREATE_RULE_SET" 
(P_rule_set_name IN VARCHAR2,
P_description IN VARCHAR2,
P_enabled IN VARCHAR2,
P_eval_options IN NUMBER,
P_audit_options IN NUMBER,
P_fail_options IN NUMBER,
P_fail_message IN VARCHAR2,
P_fail_code IN NUMBER,
P_handler_options IN NUMBER,
P_handler IN VARCHAR2,
P_is_static varchar2)
is
komut varchar2(500);
v_is_static boolean;

begin

/*
if
 P_is_static = 'TRUE' then
     v_is_static:=TRUE ;
  Else
     v_is_static:=FALSE;
  end if;
 */

komut:='
Begin
DVSYS.DBMS_MACADM.CREATE_RULE_SET@dbvaultlink(
rule_set_name =>' ||''''||P_rule_set_name||''''||' ,
description => '||''''||P_description||''''||' ,
enabled => '||''''||P_enabled||''''||' ,
eval_options => '||to_char(P_eval_options)||' ,
audit_options => '||to_char(P_audit_options)||',
fail_options => '||to_char(P_fail_options)||' ,
fail_message => '||''''||P_fail_message||''''||' ,
fail_code => '||to_char(P_fail_code)||' ,
handler_options => '||to_char(P_handler_options)||' ,
handler => '||''''||P_handler||''''|| ',
is_static => ' ||P_is_static||');
end;
';




begin
EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;


null;

end;

/
--------------------------------------------------------
--  DDL for Procedure RULESET_CREATE_RULE_SET_122
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."RULESET_CREATE_RULE_SET_122" 
(P_rule_set_name IN VARCHAR2,
P_description IN VARCHAR2,
P_enabled IN VARCHAR2,
P_eval_options IN NUMBER,
P_audit_options IN NUMBER,
P_fail_options IN NUMBER,
P_fail_message IN VARCHAR2,
P_fail_code IN NUMBER,
P_handler_options IN NUMBER,
P_handler IN VARCHAR2,
P_is_static varchar2,
P_scope  number)
is
komut varchar2(500);
v_is_static boolean;

begin

/*
if
 P_is_static = 'TRUE' then
     v_is_static:=TRUE ;
  Else
     v_is_static:=FALSE;
  end if;
 */

komut:='
Begin
DVSYS.DBMS_MACADM.CREATE_RULE_SET@dbvaultlink(
rule_set_name =>' ||''''||P_rule_set_name||''''||' ,
description => '||''''||P_description||''''||' ,
enabled => '||''''||P_enabled||''''||' ,
eval_options => '||to_char(P_eval_options)||' ,
audit_options => '||to_char(P_audit_options)||',
fail_options => '||to_char(P_fail_options)||' ,
fail_message => '||''''||P_fail_message||''''||' ,
fail_code => '||to_char(P_fail_code)||' ,
handler_options => '||to_char(P_handler_options)||' ,
handler => '||''''||P_handler||''''|| ',
is_static => ' ||P_is_static||',
scope => '|| P_scope||');
end;
';




begin
EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;


null;

end;

/
--------------------------------------------------------
--  DDL for Procedure RULESET_UPDATE_RULE_SET
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."RULESET_UPDATE_RULE_SET" 
(P_rule_set_name IN VARCHAR2,
P_description IN VARCHAR2,
P_enabled IN VARCHAR2,
P_eval_options IN NUMBER,
P_audit_options IN NUMBER,
P_fail_options IN NUMBER,
P_fail_message IN VARCHAR2,
P_fail_code IN NUMBER,
P_handler_options IN NUMBER,
P_handler IN VARCHAR2,
P_is_static varchar2)
is
komut varchar2(500);
v_is_static boolean;

begin

/*
if
 P_is_static = 'TRUE' then
     v_is_static:=TRUE ;
  Else
     v_is_static:=FALSE;
  end if;
 */

komut:='
Begin
DVSYS.DBMS_MACADM.UPDATE_RULE_SET@dbvaultlink(
rule_set_name =>' ||''''||P_rule_set_name||''''||' ,
description => '||''''||P_description||''''||' ,
enabled => '||''''||P_enabled||''''||' ,
eval_options => '||to_char(P_eval_options)||' ,
audit_options => '||to_char(P_audit_options)||',
fail_options => '||to_char(P_fail_options)||' ,
fail_message => '||''''||P_fail_message||''''||' ,
fail_code => '||to_char(P_fail_code)||' ,
handler_options => '||P_handler_options||' ,
handler => '||''''||P_handler||''''|| ',
is_static => ' ||P_is_static||');
end;
';




begin
EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;


null;

end;

/
--------------------------------------------------------
--  DDL for Procedure UPDATE_FACTOR
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."UPDATE_FACTOR" (
  factor_name       IN VARCHAR2,
  factor_type_name  IN VARCHAR2,
  description       IN VARCHAR2,
  rule_set_name     IN VARCHAR2,
  get_expr          IN VARCHAR2,
  validate_expr     IN VARCHAR2,
  identify_by       IN NUMBER,
  labeled_by        IN NUMBER,
  eval_options      IN NUMBER,
  audit_options     IN NUMBER,
  fail_options      IN NUMBER)
  is

komut varchar2(1000);
begin
komut:='
 Begin
 DVSYS.DBMS_MACADM.UPDATE_FACTOR@dbvaultlink( 
 factor_name       => '||''''||factor_name||''''||',
 factor_type_name  => '||''''||factor_type_name||''''||',
  description  => '||''''||description||''''||',
  rule_set_name => '||''''||rule_set_name||''''||',
  get_expr => '     ||''''||replace(get_expr,'''','''''')||''''||',
  validate_expr => '||''''||replace(validate_expr,'''','''''')||''''||',
  identify_by  => ' ||to_char(identify_by)  ||',
  labeled_by  => '||to_char(labeled_by) ||',
  eval_options => '||to_char(eval_options)||',
  audit_options  => '||to_char(audit_options)||',
  fail_options => '||to_char(fail_options)||');
  end;
 ';
  
  
begin

       EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;
  end;

/
--------------------------------------------------------
--  DDL for Procedure UPDATE_POLICY_STATE_122
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."UPDATE_POLICY_STATE_122" (policy_name IN VARCHAR2, policy_state IN number ) IS
komut varchar2(500);
BEGIN


komut:=
 'Begin
  DVSYS.DBMS_MACADM.UPDATE_POLICY_STATE@dbvaultlink(
  policy_name    => '||''''||policy_name ||''''||',
  policy_state   => '||policy_state||');
  end;
  ';


begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure UPDATE_POLICY_STATE_18
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."UPDATE_POLICY_STATE_18" (policy_name IN VARCHAR2, policy_state IN number, pl_sql_stack  IN VARCHAR2) IS
komut varchar2(500);
BEGIN


komut:=
 'Begin
  DVSYS.DBMS_MACADM.UPDATE_POLICY_STATE@dbvaultlink(
  policy_name    => '||''''||policy_name ||''''||',
  policy_state   => '||policy_state||',
  pl_sql_stack => '||pl_sql_stack||');
  end;
  ';


begin
    EXECUTE immediate (komut);
exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;

END;

/
--------------------------------------------------------
--  DDL for Procedure UPDATE_RULE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "W_DBVAULT"."UPDATE_RULE" 
(
  P_RULE_NAME IN VARCHAR2 ,
  P_RULE_EXPR IN VARCHAR2
) is

komut varchar2(2500);

begin


komut:='
Begin
DVSYS.DBMS_MACADM.UPDATE_RULE@dbvaultlink(
rule_name =>' || ''''||P_rule_name||''''||' ,
rule_expr => '||''''||replace(P_rule_expr,'''','''''')||''''||');
end;
';

begin
       EXECUTE immediate (komut);

exception
    when others THEN
    audit_dbvault(komut,sqlcode,sqlerrm);
    COMMIT;
    raise ;
end;

audit_dbvault(komut,'Successful','Successful');
COMMIT;



END UPDATE_RULE;

/
