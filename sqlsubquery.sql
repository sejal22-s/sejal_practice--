
-- find the customer details who purchesed classic cars
select * from customers
where customernumber in(
select customernumber from orders
where orderNumber in(
select orderNumber from orderdetails
where productcode in( 
select productcode from products
where productLine = 'classic cars')));


-- find the customer details who cancelled the orders
select * from customers
where customerNumber in(
select customerNumber from orders
where status='cancelled');

-- find the customers details who purchesed trucks and buses
select * from customers
where customerNumber in(
select customerNumber from orders
where ordernumber in(
select ordernumber from orderdetails
where productCode in(
select productCode from products
where productLine ='trucks and buses')));

-- find such employees whoes ofc is in sydneny
select * from employees
where officecode in(
select officecode from offices
where city='sydney');


-- find thr cust details whoes payment is greater than 50000
select * from customers
where customerNumber in(
select customerNumber from payments
where amount>50000);

