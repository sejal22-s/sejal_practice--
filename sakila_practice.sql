-- List the last names of actors, as well as how many actors have that last name.
select last_name as 'last_name', count(last_name) as 'last_name_count'
from actor
group by last_name;

-- List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actorsList last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors
select last_name as 'last_name', count(last_name) as 'last_name_count'
from actor
group by last_name
having count(last_name)>1;

-- Oh, no! The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS, the name of Harpo’s second cousin’s husband’s yoga teacher. Write a query to fix the record.
select last_name,first_name from actor 
where first_name='Groucho'and last_name='Williams';
update actor
set first_name='Harpo'
where first_name='Groucho'and last_name='Williams';
 select last_name,first_name from actor where last_name='Williams';
 
 
-- Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out that GROUCHO was the correct name after all! In a single query, if the first name of the actor is currently HARPO, change it to GROUCHO. Otherwise, change the first name to MUCHO GROUCHO, as that is exactly what the actor will be with the grievous error. BE CAREFUL NOT TO CHANGE THE FIRST NAME OF EVERY ACTOR TO MUCHO GROUCHO, HOWEVER!
 select last_name,first_name from actor
 where first_name='harpo' ;
 
 update actor
 set first_name='Groucho'
 where first_name='harpo';
 
 update actor
 set first_name=case
           when first_name='harpo' then 'Groucho'
           when first_name='Groucho'then 'MUCHO GROUCHO'
else first_name
end;
 select first_name,last_name from actor where first_name='Groucho' or first_name='MUCHO GROUCHO';
 
 
-- Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address
select s.first_name as 'First name',s.last_name as 'Last name',a.address as 'Address' 
from staff as s
join address as a
on s.address_id=a.address_id;

-- List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.
select f.title as'Films',count(fa.actor_id)as 'Number of actors'
from film as f
join film_actor as fa
on f.film_id =fa.film_id
group by f.title;


-- How many copies of the film Hunchback Impossible exist in the inventory system?
select f.title as 'Film', count(i.inventory_id) as 'count'
from film as f 
join inventory as i
on f.film_id=i.film_id
where f.title='Hunchback Impossible'
group by f.title;

select*from payment;
-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name:
select concat(c.first_name,' ',c.last_name) as 'full name', sum(p.amount) as 'total paid'
from customer as c
join payment as p
on c.customer_id=p.customer_id
group by p.customer_id
order by last_name;


-- Use subqueries to display all actors who appear in the film Alone Trip.
select CONCAT(first_name,' ',last_name) as 'Actors in Alone Trip'
	from actor
	where actor_id in 
	(select actor_id from film_actor where film_id = 
	(select film_id from film where title = 'Alone Trip'));