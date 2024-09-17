-- concating the two columns
select concat(contactfirstname,'',contactlastname) as fullname from customers;
select concat('SQL ','tuitorial ','is ','fun ') as cancatstring;

-- substring
select substring('Hello World',2,5) as extractedstring;

-- uppercase and lowercase function
select upper('customername') as stringupper from customers;
select lower('CUSTOMERNAME') as stringlower from customers;

-- length
select length('customername') as lengthofstring from customers;

-- trim
select trim('  hello  ');
select trim(leading '0' from '000123');
select trim(trailing '0' from '12000');

-- replace
select replace('hello world','world','universe');

-- instr
select instr('hello world','world');

-- reverse
SELECT REVERSE('Hello');


-- left and right
SELECT LEFT('Hello World', 5);
select right('hello world',5);

-- locate
select locate("hello","hello world");

-- absolute
select abs(-4.54);

-- round
SELECT ROUND(3.14159, 3);

-- ceiling and floor
SELECT CEILING(3.2), FLOOR(3.2);

-- sqrt
select sqrt(45);

-- power
select pow(2,3);
select power(2,3);
