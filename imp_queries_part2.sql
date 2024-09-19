-- Now
select now();
select now()+1;

-- current_date
SELECT CURRENT_DATE();
SELECT CURRENT_DATE() + 1;

-- current_time
select current_time();
select current_time()+1;

-- date_add
select date_add('2024-05-19',interval 1 year);

-- date_diff
select datediff(month, '2017/08/25', '2011/08/25');

-- date_formate
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d'); 
SELECT DATE_FORMAT(NOW(), '%d-%m-%Y');
SELECT DATE_FORMAT(NOW(), '%m-%d-%Y');

-- weekday
select weekday('2024-06-16');
select weekday('2002-11-22');


select employeeNumber,
       firstname,
       officeCode,
       row_number() 
       over(partition by officecode order by employeenumber)
       as row_num
       from employees;
       
       select firstname,
       lastname,
       officecode,
       employeenumber,
       row_number()
       over(partition by officecode order by lastname)
       as row_num
       from employees;
       
       SELECT 
    contactFirstName,
    country,
    creditlimit,
    RANK() OVER 
    (ORDER BY creditlimit DESC) 
    AS rnk
FROM 
    customers;
    
    SELECT 
   contactFirstName,
    country,
    creditlimit,
    DENSE_RANK() OVER (partition by country order by creditlimit ) AS dnsrk,
    RANK() OVER (partition by country order by creditlimit ) AS rnk
FROM 
    customers;