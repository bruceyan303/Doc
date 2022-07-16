MySql
在mysql中，如果把表的主键设为auto_increment类型，数据库就会自动为主键赋值。例如：
```
create table customers(id int auto_increment primary key not null, name varchar(15));
insert into customers(name) values("name1"),("name2");
select id from customers;
```