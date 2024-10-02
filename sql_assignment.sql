-- Prepare a list of offices sorted by country, state, city.
select * from offices order by country,state,city;

-- How many employees are there in the company?
select count(employeeNumber) from employees;

-- What is the total of payments received?
select sum(amount) from payments;

-- List the product lines that contain 'Cars'.
select * from productlines where productLine like "%Cars";

-- Report total payments for October 28, 2004.
select sum(amount) from payments where paymentDate like "2004-10-28";

-- Report those payments greater than $100,000.
select amount from payments where amount>100000;

-- List the products in each product line.
select productline from products;

-- How many products in each product line?
select count(productline) from productlines;

-- What is the minimum payment received?
select min(amount) from payments;

-- List all payments greater than twice the average payment
select * from payments WHERE amount > 2 * (SELECT AVG(amount) FROM payments);

-- What is the average percentage markup of the MSRP on buyPrice?
select avg((MSRP-buyPrice)/buyPrice*100) from products;

-- How many distinct products does ClassicModels sell?
select count(distinct(productCode))as distinctproducts from products;

-- Report the name and city of customers who don't have sales representatives?
SELECT customerName, city
FROM customers
WHERE salesRepEmployeeNumber IS NULL;

