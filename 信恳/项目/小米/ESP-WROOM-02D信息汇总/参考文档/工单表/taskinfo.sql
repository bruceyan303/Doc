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
  version                 VARCHAR2(120) default '无',
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
  produce_state1          VARCHAR2(10) default '待产',
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
  is '生产订单(排产单)信息表';
comment on column ADMIN.MES_DEP_TASK_INFO.id
  is 'test';
comment on column ADMIN.MES_DEP_TASK_INFO.task_no
  is '工单单号';
comment on column ADMIN.MES_DEP_TASK_INFO.board_item
  is '产品品号';
comment on column ADMIN.MES_DEP_TASK_INFO.version
  is '产品版本';
comment on column ADMIN.MES_DEP_TASK_INFO.plan_qty
  is '预计产量';
comment on column ADMIN.MES_DEP_TASK_INFO.complete_qty
  is '已生产量';
comment on column ADMIN.MES_DEP_TASK_INFO.down_time
  is '下载时间';
comment on column ADMIN.MES_DEP_TASK_INFO.plan_begin_time
  is '计划开始时间';
comment on column ADMIN.MES_DEP_TASK_INFO.plan_finish_time
  is '计划结束时间';
comment on column ADMIN.MES_DEP_TASK_INFO.real_finish_time
  is '实际完工时间';
comment on column ADMIN.MES_DEP_TASK_INFO.produce_state
  is '生产状态(待产\生产\挂起\完工)';
comment on column ADMIN.MES_DEP_TASK_INFO.data_from
  is '数据来源';
comment on column ADMIN.MES_DEP_TASK_INFO.real_begin_time
  is '实际开工时间';
comment on column ADMIN.MES_DEP_TASK_INFO.board_name
  is '产品名称';
comment on column ADMIN.MES_DEP_TASK_INFO.qc_mode
  is '检验模式(全检\抽检)';
comment on column ADMIN.MES_DEP_TASK_INFO.hang_up
  is '是否挂起';
comment on column ADMIN.MES_DEP_TASK_INFO.subinventory_code
  is '仓库编号';
comment on column ADMIN.MES_DEP_TASK_INFO.create_by
  is '创建人';
comment on column ADMIN.MES_DEP_TASK_INFO.create_date
  is '创建时间';
comment on column ADMIN.MES_DEP_TASK_INFO.lastupdate_by
  is '更新人';
comment on column ADMIN.MES_DEP_TASK_INFO.lastupdate_date
  is '更新时间';
comment on column ADMIN.MES_DEP_TASK_INFO.memo
  is '备注';
comment on column ADMIN.MES_DEP_TASK_INFO.discard_qty
  is '报废数量';
comment on column ADMIN.MES_DEP_TASK_INFO.first_item_receipt_time
  is '始收料时间';
comment on column ADMIN.MES_DEP_TASK_INFO.first_item_ready_time
  is '始齐料时间';
comment on column ADMIN.MES_DEP_TASK_INFO.customer_no
  is '客户编号';
comment on column ADMIN.MES_DEP_TASK_INFO.bill_no_pack
  is '生产订单打包单据号【长度与生产订单相同】';
comment on column ADMIN.MES_DEP_TASK_INFO.softversion
  is '软件版本';
comment on column ADMIN.MES_DEP_TASK_INFO.pack_ship_type
  is '出货包装方式';
comment on column ADMIN.MES_DEP_TASK_INFO.pack_ship_memo
  is '包装注意事项';
comment on column ADMIN.MES_DEP_TASK_INFO.isscheme
  is '是否已排产';
comment on column ADMIN.MES_DEP_TASK_INFO.barcode_type_id
  is '条码类型ID';
comment on column ADMIN.MES_DEP_TASK_INFO.sale_no
  is '销售订单';
comment on column ADMIN.MES_DEP_TASK_INFO.item_name
  is 'PCB品号';
comment on column ADMIN.MES_DEP_TASK_INFO.spec
  is '产品规格';
comment on column ADMIN.MES_DEP_TASK_INFO.issue
  is '发布状态';
comment on column ADMIN.MES_DEP_TASK_INFO.flag
  is '状态（0=排产未发布、1=排产已发布、2=已领料、3=已生产、4=暂停、8=已完工、9=异常）';
comment on column ADMIN.MES_DEP_TASK_INFO.mat_date
  is '领料时间';
comment on column ADMIN.MES_DEP_TASK_INFO.bom_no
  is 'BOM编号';
comment on column ADMIN.MES_DEP_TASK_INFO.schedule_zj_id
  is 'mes_schedule_zj表的ID号';
comment on column ADMIN.MES_DEP_TASK_INFO.unit
  is '单位';
comment on column ADMIN.MES_DEP_TASK_INFO.factory_no
  is '生产工厂';
comment on column ADMIN.MES_DEP_TASK_INFO.workcenter_no
  is '工作中心';
comment on column ADMIN.MES_DEP_TASK_INFO.down_flag
  is '已下载订单标识Y-已下载,N-未下载';
comment on column ADMIN.MES_DEP_TASK_INFO.pcblog
  is '主板标识';
comment on column ADMIN.MES_DEP_TASK_INFO.asn
  is '批次号';
comment on column ADMIN.MES_DEP_TASK_INFO.rohse_code
  is '环保代码';
comment on column ADMIN.MES_DEP_TASK_INFO.verify
  is '审核状态';
comment on column ADMIN.MES_DEP_TASK_INFO.assessor
  is '审核人';
comment on column ADMIN.MES_DEP_TASK_INFO.verify_date
  is '审核日期';
comment on column ADMIN.MES_DEP_TASK_INFO.backup_qty
  is '备损数量';
comment on column ADMIN.MES_DEP_TASK_INFO.task_qty
  is '工单数量';
comment on column ADMIN.MES_DEP_TASK_INFO.task_type
  is '工单类别';
comment on column ADMIN.MES_DEP_TASK_INFO.country
  is '国家';
comment on column ADMIN.MES_DEP_TASK_INFO.color
  is '颜色';
comment on column ADMIN.MES_DEP_TASK_INFO.sx_model
  is '分类';
comment on column ADMIN.MES_DEP_TASK_INFO.customer_po
  is '客户PO';
comment on column ADMIN.MES_DEP_TASK_INFO.proc_print_value
  is '产品打印固定值';
comment on column ADMIN.MES_DEP_TASK_INFO.line
  is '线体';
comment on column ADMIN.MES_DEP_TASK_INFO.line_txt
  is '线体名称';
comment on column ADMIN.MES_DEP_TASK_INFO.ban
  is '班次';
comment on column ADMIN.MES_DEP_TASK_INFO.bom_id
  is 'BOM的ID';
comment on column ADMIN.MES_DEP_TASK_INFO.delete_flag
  is '删除标识';
comment on column ADMIN.MES_DEP_TASK_INFO.dep001
  is '销售订单号';
comment on column ADMIN.MES_DEP_TASK_INFO.dep002
  is '任务单表主键FINTERID（K3）';
comment on column ADMIN.MES_DEP_TASK_INFO.dep003
  is '生产车间';
comment on column ADMIN.MES_DEP_TASK_INFO.dep004
  is '机型类别';
comment on column ADMIN.MES_DEP_TASK_INFO.dep005
  is '客户订单号';
comment on column ADMIN.MES_DEP_TASK_INFO.dep006
  is '工单审核日期(K3)';
comment on column ADMIN.MES_DEP_TASK_INFO.dep007
  is '审核人id';
comment on column ADMIN.MES_DEP_TASK_INFO.isplan
  is '0:工单 1:排产单';
comment on column ADMIN.MES_DEP_TASK_INFO.plan_taskno
  is '归属工单';
comment on column ADMIN.MES_DEP_TASK_INFO.ver_no
  is '生产方案版本';
comment on column ADMIN.MES_DEP_TASK_INFO.dep008
  is '客户机型';
comment on column ADMIN.MES_DEP_TASK_INFO.dep009
  is '下达日期';
comment on column ADMIN.MES_DEP_TASK_INFO.hardware_vers
  is '硬件版本';
comment on column ADMIN.MES_DEP_TASK_INFO.special_case
  is '专案号';
comment on column ADMIN.MES_DEP_TASK_INFO.vendor_code
  is '厂商代码';
comment on column ADMIN.MES_DEP_TASK_INFO.barcode_rules
  is '条码规则';
comment on column ADMIN.MES_DEP_TASK_INFO.barcode_rules_id
  is '条码规则ID';
comment on column ADMIN.MES_DEP_TASK_INFO.fnote
  is '供方料号';
comment on column ADMIN.MES_DEP_TASK_INFO.trace_back_flag
  is '是否追溯（0不追溯；1追溯）';
comment on column ADMIN.MES_DEP_TASK_INFO.route_id
  is '工单工艺路线表id';
comment on column ADMIN.MES_DEP_TASK_INFO.technology_type
  is '工艺路线类型';
comment on column ADMIN.MES_DEP_TASK_INFO.panel_num
  is '拼板数';
comment on column ADMIN.MES_DEP_TASK_INFO.monorail_num
  is '单轨已发数';
comment on column ADMIN.MES_DEP_TASK_INFO.double_track_num
  is '双轨已发数';
comment on column ADMIN.MES_DEP_TASK_INFO.real_hangup_time
  is '挂起时间';
comment on column ADMIN.MES_DEP_TASK_INFO.collage_num
  is '合拼已发数';
comment on column ADMIN.MES_DEP_TASK_INFO.produce_state1
  is '测试段状态(待产\生产\完工)';
comment on column ADMIN.MES_DEP_TASK_INFO.test_begin_date
  is '测试开始时间';
comment on column ADMIN.MES_DEP_TASK_INFO.test_end_date
  is '测试结束时间';
comment on column ADMIN.MES_DEP_TASK_INFO.zs_task
  is '正式订单号';
comment on column ADMIN.MES_DEP_TASK_INFO.zs_dep005
  is '正式客户号';
comment on column ADMIN.MES_DEP_TASK_INFO.cy_qty
  is '差异数';
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
