create database practice
use practice
create table Customer(
customerid char(5) not null,
companyName varchar(40) not null,
contactName char(30) null,
addr varchar(60) null,
city char(15) null,
phone char(24) null,
fax char(24) null)
create table Orders(
OrderId integer not null,
customerId char(5) not null,
Orderdate datetime null,
Shippeddate datetime null,
Freight money null,
Shipname varchar(40) null,
Shipaddres varchar(60) null,
Quantity integer null)

-- add column
alter table Orders add shipregion integer null
select * from Orders
--change column datatype
alter table Orders alter column shipregion char(8)
--delete column 
alter table Orders drop column shipregion
-- insert records
insert into Orders values( '10', 'ord01', getdate(), getdate(), 100.0, 'Windstar', 'Ocean',1)
--alter datatype
alter table Orders add constraint df_orderdate default getdate() for Orderdate
--rename column
exec sp_rename 'Customer.city','Town','column'
select * from Customer
--Department
create table Department(
Dept_no varchar(5) primary key,
Dept_name varchar(20) not null,
Location varchar(20) not null)
select * from Department
insert into Department values('d1','Research','Dallas'),('d2','Accounting','Seattle'),('d3','Marketing','Dallas')
---Employee
create table Employee(
Emp_no varchar(10) primary key,
emp_fname varchar(10) not null,
emp_lname varchar(10) not null,
dept_no varchar(5) not null)
select * from Employee
insert into Employee values('25348','Matthew','Smith','d3'),('10102','Ann','Jones','d3'),('18316','John','Barrimore','d1'),
('29346','James','James','d2')
--project
create table project(
project_no varchar(10) primary key,
project_name varchar(20) not null,
Budjet varchar(20) not null)
select * from project
insert into project values('p1','Apollo','120000'),('p2','Gemini','95000'),('p3','Mercury','185600')
create table works_on(
emp_no varchar(10) not null,
project_no varchar(20) not null,
job varchar(10) null,
enter_date date not null)
--works on
insert into works_on values('10102','p1','Analyst','10.1.1997'),
('10102','p3','manager','1.1.1999'),
('25348','p2','Clerk','2.15.1998')
select * from works_on
insert into works_on(emp_no,project_no,enter_date)values('18316','p2','6.1.1998'),('29346','p2','12.15.1997')
insert into works_on(emp_no,project_no,job,enter_date)values('2581','p3','Analyst','10.15.1998'),
('9031','p1','Manager','4.15.1998')
insert into works_on(emp_no,project_no,enter_date)values('28559','p1','8.1.1998')
insert into works_on(emp_no,project_no,job,enter_date)values('28559','p2','Clerk','2.1.1992'),
('9031','p3','Clerk','11.15.1998'),('29346','p1','Clerk','1.4.1998')
select emp_no from works_on where job='clerk'
---
select emp_no from works_on where emp_no<10000 and project_no='p2'
----
select emp_no from works_on where year(enter_date)!='1998'
---
select emp_no from works_on where (job='Manager'OR job='Analyst')and project_no='p2'
--
select enter_date from works_on where job is null and project_no='p2' 
---
select Emp_no,emp_lname from Employee where emp_fname like '%tt%'
---
select Emp_no,emp_fname from Employee where emp_lname like '_o%es'or emp_lname like '_a%es'
---
select Emp_no from Employee where dept_no in(select dept_no from Department where Location='Seattle')
---
select emp_fname,emp_lname from Employee where emp_no in(select emp_no from works_on where enter_date='1.4.1998')
---
select max(emp_no) from Employee
---
select emp_no from works_on where job='clerk'or emp_no in(select emp_no from Employee where dept_no='d3')
select count(dept_no) from Department group by Location
--
select job from works_on group by job having count(*)>2;
