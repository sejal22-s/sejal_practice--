use sakila;
-- Which actors have the first name Scarlett
select * from actor where first_name like 'Scarlett%';

-- Which actors have the last name ‘Johansson’
select * from actor where last_name like '%Johansson';

-- How many distinct actors last names are there?
select count(distinct last_name) from actor;

-- Which last names are not repeated?
select last_name from actor group by last_name having count(*)=1;

-- Which last names appear more than once?
select last_name from actor group by last_name having count(*)>1;

-- Which actor has appeared in the most films?
select actor.actor_id,actor.first_name,actor.last_name,
count(actor_id) as film_count
from actor join film_actor using (actor_id)
group by actor_id
order by film_count desc
limit 1;

-- Is ‘Academy Dinosaur’ available for rent from Store 1?
select * from film
where film_id=1 in (
select film_id from inventory
where store_id in (
select store_id from store
where store_id=1));

select film.film_id, film.title, store.store_id, inventory.inventory_id
from inventory join store using (store_id) join film using (film_id)
where film.title = 'Academy Dinosaur' and store.store_id = 1;

-- Insert a record to represent Mary Smith renting 'Academy Dinosaur' from Mike Hillyer at Store 1 today .
Insert into rental (rental_date,inventory_id,customer_id,staff_id)
values(now(),1,1,1);

-- Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.
select upper(concat(first_name,' ',last_name)) as actor_name from actor;

-- You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, “Joe.” What is one query would you use to obtain this information?
select actor_id,first_name,last_name from actor
where first_name like 'joe%';

-- Find all actors whose last name contain the letters GEN
select last_name from actor where last_name like "%gen%";

 -- Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order:
 select last_name,first_name from actor where last_name like '%li%' order by first_name,last_name;
 
 -- Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China:
 select country_id from country 
 where country in ('Afghanistan','Bangladesh','China');
 
 -- Add a middle_name column to the table actor. Position it between first_name and last_name
 alter table actor
 add column middle_name varchar(30) after first_name;
 select * from actor;
 
 -- You realize that some of these actors have tremendously long last names. Change the data type of the middle_name column to blobs
alter table actor
modify column middle_name blob;
select * from actor;

-- Now delete the middle_name column.
 alter table actor
 drop column middle_name; 
 select * from actor;
 
 