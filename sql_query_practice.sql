CREATE TABLE Worker (
    WORKER_ID INT NOT NULL PRIMARY KEY,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);
INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    (1, 'Monika', 'Arora', 100000, '2021-02-20 09:00:00', 'HR'),
    (2, 'Niharika', 'Verma', 80000, '2021-06-11 09:00:00', 'Admin'),
    (3, 'Vishal', 'Singhal', 300000, '2021-02-20 09:00:00', 'HR'),
    (4, 'Amitabh', 'Singh', 500000, '2021-02-20 09:00:00', 'Admin'),
    (5, 'Vivek', 'Bhati', 500000, '2021-06-11 09:00:00', 'Admin'),
    (6, 'Vipul', 'Diwan', 200000, '2021-06-11 09:00:00', 'Account'),
    (7, 'Satish', 'Kumar', 75000, '2021-01-20 09:00:00', 'Account'),
    (8, 'Geetika', 'Chauhan', 90000, '2021-04-11 09:00:00', 'Admin');
    
    CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT,
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
    (1, 5000, '2023-02-20'),
    (2, 3000, '2023-06-11'),
    (3, 4000, '2023-02-20'),
    (1, 4500, '2023-02-20'),
    (2, 3500, '2023-06-11');
    
    CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
    (1, 'Manager', '2023-02-20 00:00:00'),
    (2, 'Executive', '2023-06-11 00:00:00'),
    (8, 'Executive', '2023-06-11 00:00:00'),
    (5, 'Manager', '2023-06-11 00:00:00'),
    (4, 'Asst. Manager', '2023-06-11 00:00:00'),
    (7, 'Executive', '2023-06-11 00:00:00'),
    (6, 'Lead', '2023-06-11 00:00:00'),
    (3, 'Lead', '2023-06-11 00:00:00');
    
    
-- Q-1. Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.
select FIRST_NAME as Worker_name
from worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.
select upper(First_name) from worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.
select distinct(department) from worker;

-- Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table.
select substring(first_name,1,3) as threechar from worker;

-- Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.
select position("a" in "Amitabh") from worker;

-- Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side.
select rtrim(first_name) as rigthtrim from worker;
  
-- Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side.
select ltrim(department) as lefttrim from worker;

-- Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.
select distinct(department),length(department)
from worker;

-- Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.
select replace(first_name,'a' ,'A' ) from worker;

-- Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME. A space char should separate them.
select concat(first_name,' ',last_name)as COMPLETE_NAME from worker;

-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
select * from worker order by FIRST_NAME asc;

-- Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from worker order by FIRST_NAME ,department desc ;

-- Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.
select * from worker where first_name in ("vipul","satish");

-- Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.
select * from worker where first_name not in ("vipul","satish");

-- Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.
select * from worker where DEPARTMENT="admin";

-- Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’
select * from worker where FIRST_NAME like "%a%";

-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’
select * from worker where FIRST_NAME like "%a";

-- Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
select * from worker where FIRST_NAME like "_____h" And length(first_name)=6;

-- Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
select * from worker where salary between 100000 and 500000;

-- Write an SQL query to print details of the Workers who joined in Feb 2021.
select * from worker where JOINING_DATE="2021-02";