create database PracticeDB
--change db
use PracticeDB
--create table
create table project(
pid varchar(20) primary key,
pname varchar(20) unique not null,
sdate date default getdate(),
edate date null)
--insert record
insert into project values('P0001','Healthcare','12.23.2019','11.20.2020')
select * from project
insert into project(pid,pname) values('P0002','Insurance')
create table employee(eid int identity(1,100) primary key,
ename varchar(10),
joindate date,
designation varchar(20),
salary int check(salary>0),
pid varchar(20) foreign key references project(pid))

insert into employee(ename,joindate,designation,salary,pid)values ('Rohan',getdate(),'PAT',23000,'P0001')
select * from employee
insert into employee(ename,joindate,designation,salary) values('Rohan','10.23.2018','PAT',40000)