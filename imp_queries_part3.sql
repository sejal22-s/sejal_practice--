-- ntile
select 
employeenumber,
firstname,
officecode,
NTILE(6) over(order by officecode) as qartile
from employees;

SELECT 
    employeeNumber,
    firstname,
    officeCode,
    LAG(officeCode, 1,0) OVER (ORDER BY employeenumber) AS prev_salary
FROM 
    employees;


SELECT 
    employeeNumber,
    firstname,
    officeCode,
    lead(officeCode, 1,0) OVER (ORDER BY employeenumber) AS next_salary
FROM 
    employees;
    
    SELECT 
    customernumber,
    contactfirstname,
    creditlimit,
    FIRST_VALUE(creditlimit) OVER (PARTITION BY customernumber ORDER BY creditlimit DESC) AS highest_creditlimit
FROM 
    customers;
    
    SELECT 
   customernumber,
    contactfirstname,
    creditlimit,
    LAST_VALUE(creditlimit) OVER (PARTITION BY customernumber ORDER BY creditlimit DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS lowest_salary
FROM 
    customers;

SELECT 
    customerName,
    contactFirstName,
    creditLimit,
    SUM(creditLimit) OVER (PARTITION BY customerName ORDER BY contactFirstName ) AS cumulative_salary
FROM 
    customers;


SELECT 
    customerName,
    contactFirstName,
    creditLimit,
    AVG(creditLimit) OVER (PARTITION BY customerName ORDER BY contactFirstName ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS moving_avg_salary
FROM 
    customers;
