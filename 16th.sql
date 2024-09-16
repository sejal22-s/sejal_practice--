create database table1;
show databases;
drop database table1;
create table customers10(
cid int,
cname char(100),
ordernumber int);
select * from customers10;

insert into customers10 
values(1,"sejal",2),
(2,"jay",3),
(3,"shreyash",4);
select * from customers10;
update customers10
set cname="jaesh"
where cid=3;

delete from customers10
where cid=1;

alter table customers10
add iteam char(10);

describe customers10;
alter table customers10
drop column iteam;

alter table customers10
modify cname char(150);

alter table customers10
rename column cname to name;

alter table customers10
rename to orders;

select distinct country from customers;
select * from customers order by country desc;
select * from customers order by country limit 3,2;
select * from customers order by creditLimit desc limit 3,1;
select * from customers where contactFirstName like '%s';
select * from customers where country in ('usa','uk');
select * from customers where creditLimit between 50000 and 100000;
select count(creditlimit) from customers where country='usa';

-- find out the customers details whos credit limit is greater then avg creditlimit
select * from customers where creditlimit >(select avg(creditLimit) from customers);

-- find out the cust details purchase classic cars

select * from customers
where customerNumber in(
select customerNumber from orders
where orderNumber in(
select orderNumber from orderdetails
where productCode in(
select productCode from products
where productline='classic cars')));

-- customer details whoes status is cancelled
select * from customers
where customernumber in(
select customerNumber from orders
where status='cancelled');