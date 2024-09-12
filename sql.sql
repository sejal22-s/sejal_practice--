create database database2;
show databases;
drop database database2;
create database employee2;
use employee2;
create table employee2(
ename char(10),
eid int,
eper float
);
drop database employee2;
create database stud;
use database1;
create table stud(
sid int,
sname char(10),
sper float
);
drop table stud;
create table stud(
sid int,
sname char(10),
sper float
);

insert into stud 
values(1,"sej",90.3),
(2,"jayesh",99.09),
(3,"shreyash",98.08),
(4,"kavita",96.09);
select * from stud;


select * from advertising;
show tables;
update stud
set sname='raju' 
where sid=4;
select * from stud;
delete from stud
where sid=4;
select * from stud;
alter table stud
add city char(20);
select * from stud;
describe stud;
alter table stud
drop column city;
select * from stud;
alter table stud
modify sname char(100);
describe stud;
alter table stud
rename column sper to percent;
alter table stud 
rename to student01;
select * from student01;

select * from customers;
select customername,contactlastname,contactfirstname from customers;
select distinct country from customers;
select * from customers where creditLimit>150000;
select * from customers order by creditlimit desc limit 3,1;

select * from customers where state is null;
select * from customers where contactFirstName like 's%';
select * from customers where country in ('usa','uk','australia');
select * from customers where creditLimit between 50000 and 100000;
select * from customers where country in ('france','japan');
select * from customers where creditLimit between 150000 and 200000;
select contactFirstName,contactLastName,addressLine1 from customers where contactFirstName like 'z%';
select contactFirstName,contactLastName from customers where contactFirstName like 'j%n';
select contactFirstName,contactLastName from customers where contactFirstName like '%h';
select contactFirstName,contactLastName from customers where contactFirstName like 'sarah%';
select contactFirstName,contactLastName from customers where contactFirstName like 'sarah';
select contactFirstName,contactLastName from customers where contactFirstName like '%no%';
select contactFirstName,contactLastName from customers where contactFirstName like 'a___';

select count(creditlimit) from customers where country='japan';
select min(creditlimit) from customers where country='japan';
select max(creditlimit) from customers where country='japan';
select sum(creditlimit) from customers where country='japan';

select country, count(contactfirstname) as custcount from customers group by country;
select country, count(contactfirstname) as custcount from customers group by country having custcount<10;
select country, sum(creditlimit) as custcredit from customers group by country having custcredit>600000; 
select country, count(contactfirstname) as custcount from customers group by country having custcount>10;
select country, count(contactfirstname) as custcount from customers group by country having custcount>10 order by country limit 1,1;
select country, max(creditlimit) as maxcredit from customers group by country order by maxcredit desc ;


select country, max(creditlimit) as maxcredit from customers group by country order by maxcredit desc limit 5;

-- find out the customers details whos credit limit is greater then avg creditlimit
select * from customers
where creditLimit >(select avg(creditlimit) from customers);

select * from orders where status='cancelled';






