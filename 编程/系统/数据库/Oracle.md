## 自增长

在Oracle中，可以为每张表的主键创建一个单独的序列，然后从这个序列中获取自动增加的标识符，把它赋值给主键。例如一下语句创建了一个名为customer_id_seq的序列，这个序列的起始值为1，增量为2。

```create sequence customer_id_seq increment by 2 start with 1```
一旦定义了customer_id_seq序列，就可以访问序列的curval和nextval属性。

curval：返回序列的当前值
nextval：先增加序列的值，然后返回序列值
以下sql语句先创建了customers表，然后插入两条记录，在插入时设定了id和name字段的值，其中id字段的值来自于customer_id_seq序列。最后查询customers表中的id字段。

```
create table customers(id int primary key not null, name varchar(15));
insert into customers values(customer_id_seq.nextval, 'name1');
insert into customers values(customer_id_seq.nextval, 'name2');
select id from customers;
```


## 扩充数据库
### 添加一列：   
```  
alter   table   A   add( CFYJSNR  varchar2(20));     
```
### 修改列： 
```    
alter  table A  rename   column   CFYJSNR   to   CFJYSNR;  
```    
### 修改列的类型：     
```
alter table A modify cfyj varchar(200);     
```
### 删除数据库一列     
```
alter table A drop column CFYJSNR   
```

## 建表
```
create table MARKET.CfgInfo
(
  id number primary key,
  host_mac VARCHAR2(200),
  host_ip  VARCHAR2(64),
  wdate          DATE,
  cfg     BLOB,
  username      VARCHAR2(200) default '工程',
  workno      VARCHAR2(200)

);
```
```
create table MARKET.RfTest
(
  id number primary key,
  host_mac VARCHAR2(64),
  host_ip  VARCHAR2(64),
  wdate          DATE,
  failno     NUMBER,
  workno      VARCHAR2(200),
  target   VARCHAR2(64),

);
```

## 多表联合查询
```
select e.empno, e.ename, d.deptno, d.dname
  from emp e, dept d
 where e.deptno = d.deptno;
 ```

 ## 查询服务端字符集：
AL32UTF8 -- SIMPLIFIED CHINESE_CHINA.AL32UTF8
```
select userenv('language') from dual
```