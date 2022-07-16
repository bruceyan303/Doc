------------------------------------------------------
-- Export file for user ADMIN                       --
-- Created by Administrator on 2020-11-30, 11:22:12 --
------------------------------------------------------

set define off
spool taskinfo.log

prompt
prompt Creating table MES_DEP_TASK_INFO
prompt ================================
prompt
create table ADMIN.MES_DEP_TASK_INFO
(
  id                      NUMBER(22) not null,
  task_no                 VARCHAR2(50) not null,
  board_item              VARCHAR2(200),
  version                 VARCHAR2(120) default '��',
  plan_qty                NUMBER(22) default 0,
  complete_qty            NUMBER(22) default 0,
  down_time               DATE,
  plan_begin_time         DATE,
  plan_finish_time        DATE,
  real_finish_time        DATE,
  produce_state           VARCHAR2(10),
  data_from               VARCHAR2(10),
  real_begin_time         DATE,
  board_name              VARCHAR2(200),
  qc_mode                 VARCHAR2(10),
  hang_up                 VARCHAR2(10) default '0',
  subinventory_code       VARCHAR2(20),
  create_by               VARCHAR2(30),
  create_date             DATE default sysdate,
  lastupdate_by           VARCHAR2(30),
  lastupdate_date         DATE,
  memo                    VARCHAR2(255),
  discard_qty             NUMBER(22) default 0,
  first_item_receipt_time DATE,
  first_item_ready_time   DATE,
  customer_no             VARCHAR2(100),
  bill_no_pack            VARCHAR2(20) default '0',
  softversion             VARCHAR2(50),
  pack_ship_type          VARCHAR2(20),
  pack_ship_memo          VARCHAR2(255),
  isscheme                NUMBER(1) default 0,
  barcode_type_id         NUMBER(20),
  sale_no                 VARCHAR2(100),
  item_name               VARCHAR2(200),
  spec                    VARCHAR2(50),
  issue                   NUMBER(1) default 0,
  flag                    NUMBER(1) default 0,
  mat_date                DATE,
  bom_no                  VARCHAR2(50),
  schedule_zj_id          NUMBER(20),
  unit                    VARCHAR2(20),
  factory_no              VARCHAR2(20),
  workcenter_no           VARCHAR2(20),
  down_flag               NUMBER(1),
  pcblog                  VARCHAR2(20),
  asn                     VARCHAR2(50),
  rohse_code              VARCHAR2(20),
  verify                  NUMBER(1) default 0,
  assessor                VARCHAR2(30),
  verify_date             DATE,
  backup_qty              NUMBER(20) default 0,
  task_qty                NUMBER(20) default 0,
  task_type               VARCHAR2(20),
  country                 VARCHAR2(20),
  color                   VARCHAR2(20),
  sx_model                VARCHAR2(30),
  customer_po             VARCHAR2(50),
  proc_print_value        VARCHAR2(50),
  line                    VARCHAR2(32),
  line_txt                VARCHAR2(50),
  ban                     VARCHAR2(32),
  bom_id                  VARCHAR2(50),
  delete_flag             NUMBER(1) default 0,
  dep001                  VARCHAR2(100),
  dep002                  VARCHAR2(100),
  dep003                  VARCHAR2(100),
  dep004                  VARCHAR2(100),
  dep005                  VARCHAR2(100),
  dep006                  DATE,
  dep007                  NUMBER,
  marking                 VARCHAR2(50),
  copyicchange            VARCHAR2(50),
  zxbiaozhunhao           VARCHAR2(100),
  checkcode               VARCHAR2(100),
  innetcode               VARCHAR2(100),
  eancode                 VARCHAR2(100),
  machcode                VARCHAR2(100),
  isplan                  NUMBER(1) default 0,
  plan_taskno             VARCHAR2(50),
  ver_no                  VARCHAR2(50),
  dep008                  VARCHAR2(100),
  dep009                  DATE,
  hardware_vers           VARCHAR2(50),
  special_case            VARCHAR2(50),
  vendor_code             VARCHAR2(50),
  barcode_rules           VARCHAR2(50),
  barcode_rules_id        NUMBER,
  fnote                   VARCHAR2(500),
  trace_back_flag         NUMBER default 0,
  route_id                NUMBER,
  technology_type         VARCHAR2(50),
  panel_num               NUMBER default 0,
  monorail_num            NUMBER default 0,
  double_track_num        NUMBER default 0,
  real_hangup_time        DATE,
  collage_num             NUMBER default 0,
  produce_state1          VARCHAR2(10) default '����',
  test_begin_date         DATE,
  test_end_date           DATE,
  fstand_output           NUMBER(20,2),
  zs_task                 VARCHAR2(200),
  zs_dep005               VARCHAR2(100),
  cy_qty                  NUMBER(10)
)
tablespace XINKEN
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 8M
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table ADMIN.MES_DEP_TASK_INFO
  is '��������(�Ų���)��Ϣ��';
comment on column ADMIN.MES_DEP_TASK_INFO.id
  is 'test';
comment on column ADMIN.MES_DEP_TASK_INFO.task_no
  is '��������';
comment on column ADMIN.MES_DEP_TASK_INFO.board_item
  is '��ƷƷ��';
comment on column ADMIN.MES_DEP_TASK_INFO.version
  is '��Ʒ�汾';
comment on column ADMIN.MES_DEP_TASK_INFO.plan_qty
  is 'Ԥ�Ʋ���';
comment on column ADMIN.MES_DEP_TASK_INFO.complete_qty
  is '��������';
comment on column ADMIN.MES_DEP_TASK_INFO.down_time
  is '����ʱ��';
comment on column ADMIN.MES_DEP_TASK_INFO.plan_begin_time
  is '�ƻ���ʼʱ��';
comment on column ADMIN.MES_DEP_TASK_INFO.plan_finish_time
  is '�ƻ�����ʱ��';
comment on column ADMIN.MES_DEP_TASK_INFO.real_finish_time
  is 'ʵ���깤ʱ��';
comment on column ADMIN.MES_DEP_TASK_INFO.produce_state
  is '����״̬(����\����\����\�깤)';
comment on column ADMIN.MES_DEP_TASK_INFO.data_from
  is '������Դ';
comment on column ADMIN.MES_DEP_TASK_INFO.real_begin_time
  is 'ʵ�ʿ���ʱ��';
comment on column ADMIN.MES_DEP_TASK_INFO.board_name
  is '��Ʒ����';
comment on column ADMIN.MES_DEP_TASK_INFO.qc_mode
  is '����ģʽ(ȫ��\���)';
comment on column ADMIN.MES_DEP_TASK_INFO.hang_up
  is '�Ƿ����';
comment on column ADMIN.MES_DEP_TASK_INFO.subinventory_code
  is '�ֿ���';
comment on column ADMIN.MES_DEP_TASK_INFO.create_by
  is '������';
comment on column ADMIN.MES_DEP_TASK_INFO.create_date
  is '����ʱ��';
comment on column ADMIN.MES_DEP_TASK_INFO.lastupdate_by
  is '������';
comment on column ADMIN.MES_DEP_TASK_INFO.lastupdate_date
  is '����ʱ��';
comment on column ADMIN.MES_DEP_TASK_INFO.memo
  is '��ע';
comment on column ADMIN.MES_DEP_TASK_INFO.discard_qty
  is '��������';
comment on column ADMIN.MES_DEP_TASK_INFO.first_item_receipt_time
  is 'ʼ����ʱ��';
comment on column ADMIN.MES_DEP_TASK_INFO.first_item_ready_time
  is 'ʼ����ʱ��';
comment on column ADMIN.MES_DEP_TASK_INFO.customer_no
  is '�ͻ����';
comment on column ADMIN.MES_DEP_TASK_INFO.bill_no_pack
  is '��������������ݺš�����������������ͬ��';
comment on column ADMIN.MES_DEP_TASK_INFO.softversion
  is '����汾';
comment on column ADMIN.MES_DEP_TASK_INFO.pack_ship_type
  is '������װ��ʽ';
comment on column ADMIN.MES_DEP_TASK_INFO.pack_ship_memo
  is '��װע������';
comment on column ADMIN.MES_DEP_TASK_INFO.isscheme
  is '�Ƿ����Ų�';
comment on column ADMIN.MES_DEP_TASK_INFO.barcode_type_id
  is '��������ID';
comment on column ADMIN.MES_DEP_TASK_INFO.sale_no
  is '���۶���';
comment on column ADMIN.MES_DEP_TASK_INFO.item_name
  is 'PCBƷ��';
comment on column ADMIN.MES_DEP_TASK_INFO.spec
  is '��Ʒ���';
comment on column ADMIN.MES_DEP_TASK_INFO.issue
  is '����״̬';
comment on column ADMIN.MES_DEP_TASK_INFO.flag
  is '״̬��0=�Ų�δ������1=�Ų��ѷ�����2=�����ϡ�3=��������4=��ͣ��8=���깤��9=�쳣��';
comment on column ADMIN.MES_DEP_TASK_INFO.mat_date
  is '����ʱ��';
comment on column ADMIN.MES_DEP_TASK_INFO.bom_no
  is 'BOM���';
comment on column ADMIN.MES_DEP_TASK_INFO.schedule_zj_id
  is 'mes_schedule_zj���ID��';
comment on column ADMIN.MES_DEP_TASK_INFO.unit
  is '��λ';
comment on column ADMIN.MES_DEP_TASK_INFO.factory_no
  is '��������';
comment on column ADMIN.MES_DEP_TASK_INFO.workcenter_no
  is '��������';
comment on column ADMIN.MES_DEP_TASK_INFO.down_flag
  is '�����ض�����ʶY-������,N-δ����';
comment on column ADMIN.MES_DEP_TASK_INFO.pcblog
  is '�����ʶ';
comment on column ADMIN.MES_DEP_TASK_INFO.asn
  is '���κ�';
comment on column ADMIN.MES_DEP_TASK_INFO.rohse_code
  is '��������';
comment on column ADMIN.MES_DEP_TASK_INFO.verify
  is '���״̬';
comment on column ADMIN.MES_DEP_TASK_INFO.assessor
  is '�����';
comment on column ADMIN.MES_DEP_TASK_INFO.verify_date
  is '�������';
comment on column ADMIN.MES_DEP_TASK_INFO.backup_qty
  is '��������';
comment on column ADMIN.MES_DEP_TASK_INFO.task_qty
  is '��������';
comment on column ADMIN.MES_DEP_TASK_INFO.task_type
  is '�������';
comment on column ADMIN.MES_DEP_TASK_INFO.country
  is '����';
comment on column ADMIN.MES_DEP_TASK_INFO.color
  is '��ɫ';
comment on column ADMIN.MES_DEP_TASK_INFO.sx_model
  is '����';
comment on column ADMIN.MES_DEP_TASK_INFO.customer_po
  is '�ͻ�PO';
comment on column ADMIN.MES_DEP_TASK_INFO.proc_print_value
  is '��Ʒ��ӡ�̶�ֵ';
comment on column ADMIN.MES_DEP_TASK_INFO.line
  is '����';
comment on column ADMIN.MES_DEP_TASK_INFO.line_txt
  is '��������';
comment on column ADMIN.MES_DEP_TASK_INFO.ban
  is '���';
comment on column ADMIN.MES_DEP_TASK_INFO.bom_id
  is 'BOM��ID';
comment on column ADMIN.MES_DEP_TASK_INFO.delete_flag
  is 'ɾ����ʶ';
comment on column ADMIN.MES_DEP_TASK_INFO.dep001
  is '���۶�����';
comment on column ADMIN.MES_DEP_TASK_INFO.dep002
  is '���񵥱�����FINTERID��K3��';
comment on column ADMIN.MES_DEP_TASK_INFO.dep003
  is '��������';
comment on column ADMIN.MES_DEP_TASK_INFO.dep004
  is '�������';
comment on column ADMIN.MES_DEP_TASK_INFO.dep005
  is '�ͻ�������';
comment on column ADMIN.MES_DEP_TASK_INFO.dep006
  is '�����������(K3)';
comment on column ADMIN.MES_DEP_TASK_INFO.dep007
  is '�����id';
comment on column ADMIN.MES_DEP_TASK_INFO.isplan
  is '0:���� 1:�Ų���';
comment on column ADMIN.MES_DEP_TASK_INFO.plan_taskno
  is '��������';
comment on column ADMIN.MES_DEP_TASK_INFO.ver_no
  is '���������汾';
comment on column ADMIN.MES_DEP_TASK_INFO.dep008
  is '�ͻ�����';
comment on column ADMIN.MES_DEP_TASK_INFO.dep009
  is '�´�����';
comment on column ADMIN.MES_DEP_TASK_INFO.hardware_vers
  is 'Ӳ���汾';
comment on column ADMIN.MES_DEP_TASK_INFO.special_case
  is 'ר����';
comment on column ADMIN.MES_DEP_TASK_INFO.vendor_code
  is '���̴���';
comment on column ADMIN.MES_DEP_TASK_INFO.barcode_rules
  is '�������';
comment on column ADMIN.MES_DEP_TASK_INFO.barcode_rules_id
  is '�������ID';
comment on column ADMIN.MES_DEP_TASK_INFO.fnote
  is '�����Ϻ�';
comment on column ADMIN.MES_DEP_TASK_INFO.trace_back_flag
  is '�Ƿ�׷�ݣ�0��׷�ݣ�1׷�ݣ�';
comment on column ADMIN.MES_DEP_TASK_INFO.route_id
  is '��������·�߱�id';
comment on column ADMIN.MES_DEP_TASK_INFO.technology_type
  is '����·������';
comment on column ADMIN.MES_DEP_TASK_INFO.panel_num
  is 'ƴ����';
comment on column ADMIN.MES_DEP_TASK_INFO.monorail_num
  is '�����ѷ���';
comment on column ADMIN.MES_DEP_TASK_INFO.double_track_num
  is '˫���ѷ���';
comment on column ADMIN.MES_DEP_TASK_INFO.real_hangup_time
  is '����ʱ��';
comment on column ADMIN.MES_DEP_TASK_INFO.collage_num
  is '��ƴ�ѷ���';
comment on column ADMIN.MES_DEP_TASK_INFO.produce_state1
  is '���Զ�״̬(����\����\�깤)';
comment on column ADMIN.MES_DEP_TASK_INFO.test_begin_date
  is '���Կ�ʼʱ��';
comment on column ADMIN.MES_DEP_TASK_INFO.test_end_date
  is '���Խ���ʱ��';
comment on column ADMIN.MES_DEP_TASK_INFO.zs_task
  is '��ʽ������';
comment on column ADMIN.MES_DEP_TASK_INFO.zs_dep005
  is '��ʽ�ͻ���';
comment on column ADMIN.MES_DEP_TASK_INFO.cy_qty
  is '������';
create unique index ADMIN.IX_MES_DEP_TASK_INFO_1 on ADMIN.MES_DEP_TASK_INFO (TASK_NO)
  tablespace XINKEN
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 384K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ADMIN.MES_DEP_TASK_INFO_UX on ADMIN.MES_DEP_TASK_INFO (BOARD_ITEM)
  tablespace XINKEN
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 448K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ADMIN.MES_DEP_TASK_INFO_UX2 on ADMIN.MES_DEP_TASK_INFO (DEP002)
  tablespace XINKEN
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ADMIN.MES_DEP_TASK_INFO_UX3 on ADMIN.MES_DEP_TASK_INFO (PRODUCE_STATE)
  tablespace XINKEN
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ADMIN.MES_DEP_TASK_INFO_UX4 on ADMIN.MES_DEP_TASK_INFO (PLAN_TASKNO)
  tablespace XINKEN
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ADMIN.MES_DEP_TASK_INFO_UX5 on ADMIN.MES_DEP_TASK_INFO (ISPLAN)
  tablespace XINKEN
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 256K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ADMIN.MES_DEP_TASK_INFO_UX6 on ADMIN.MES_DEP_TASK_INFO (DEP005)
  tablespace XINKEN
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index ADMIN.MES_DEP_TASK_INFO_UX7 on ADMIN.MES_DEP_TASK_INFO (CREATE_DATE)
  tablespace XINKEN
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ADMIN.MES_DEP_TASK_INFO
  add constraint MES_DEP_TASK_INFO_P1 primary key (ID)
  using index 
  tablespace XINKEN
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 2M
    next 1M
    minextents 1
    maxextents unlimited
  );


spool off
