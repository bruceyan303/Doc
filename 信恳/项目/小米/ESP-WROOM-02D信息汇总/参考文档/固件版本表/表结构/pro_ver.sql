------------------------------------------------------
-- Export file for user ADMIN                       --
-- Created by Administrator on 2020-11-26, 11:37:10 --
------------------------------------------------------

set define off
spool pro_ver.log

prompt
prompt Creating table MES_BASE_PRODUCT_VER
prompt ===================================
prompt
create table ADMIN.MES_BASE_PRODUCT_VER
(
  id          NUMBER not null,
  pro_type    VARCHAR2(100),
  pro_ver     VARCHAR2(100),
  fnote       VARCHAR2(100),
  pro_ver2    VARCHAR2(100),
  pro_ver3    VARCHAR2(100),
  plotno      VARCHAR2(100),
  pro_ver4    VARCHAR2(100),
  create_by   VARCHAR2(10),
  create_date DATE
)
tablespace XINKEN
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column ADMIN.MES_BASE_PRODUCT_VER.pro_type
  is '产品机型';
comment on column ADMIN.MES_BASE_PRODUCT_VER.pro_ver
  is '固件版本';
comment on column ADMIN.MES_BASE_PRODUCT_VER.fnote
  is '备注';
comment on column ADMIN.MES_BASE_PRODUCT_VER.pro_ver2
  is '固件版本2';
comment on column ADMIN.MES_BASE_PRODUCT_VER.pro_ver3
  is '固件版本3';
comment on column ADMIN.MES_BASE_PRODUCT_VER.plotno
  is '客户批次';
comment on column ADMIN.MES_BASE_PRODUCT_VER.pro_ver4
  is '固件版本4';
comment on column ADMIN.MES_BASE_PRODUCT_VER.create_by
  is '创建人';
comment on column ADMIN.MES_BASE_PRODUCT_VER.create_date
  is '创建日期';
alter table ADMIN.MES_BASE_PRODUCT_VER
  add constraint PK_MES_BASE_PRODUCT_VER primary key (ID)
  using index 
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


spool off
