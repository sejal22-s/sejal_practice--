create database sales;
show databases;
drop database sales;
use sales;
create table salestable(
product char(100),
product_id int,
price float,
total_revenue float
);
select * from salestable;

insert into salestable
values("soap",1,20.0,100.20),
("brush",2,12,90.08),
("pencil",3,7,80.2),
("pen",4,10.5,200.3);
select * from salestable;

update salestable
set product ="utensils"
where product_id=2;

delete from salestable
where total_revenue=80.2;

alter table salestable
add column loss float;

describe salestable;

alter  table salestable
rename column loss to total_loss;

alter table salestable
modify price float;

truncate salestable;


 use sakila;
 select first_name,last_name from actor;
 
 select distinct country from country;
 
 select * from payment where amount > 5.99;
 
 select * from payment where amount=10.99;
 
 select* from payment where amount<4.99;
 
 select max(amount) from payment;
 
 select * from payment order by amount desc;
 
 select * from payment where customer_id=15 order by amount desc limit 4,1;
 
 select * from address where city_id is null;
 
 select * from payment where amount between 3.99 and 7.99 ;
 
select customer_id,first_name,last_name,email from customer where last_name like 's%' ;
 
select customer_id,first_name,last_name,email from customer where last_name like '%b';
  
select country, count(contactfirstname) as total
 from customers 
 group by country 
 order by country desc; 
 
select country, min(creditLimit) as mincreditlimit 
from customers 
group by country 
order by mincreditlimit desc;


select * from customers
where customerNumber in (
select customerNumber from orders
where status="cancelled");

select * from customers
where customerNumber in(
select customerNumber from orders
where orderNumber in(
select orderNumber from orderdetails
where productCode in(
select productcode from products
where productLine="classic cars"))); 
