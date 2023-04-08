
-- Select all the actors with the first name ‘Scarlett’.
SELECT First_name, Last_name FROM actor
WHERE first_name='Scarlett';

-- How many physical copies of movies are available for rent in the store's inventory? 
SELECT count(*) FROM rental
WHERE NOT isnull(return_date);

-- How many unique movie titles are available?
SELECT count(DISTINCT f.title) AS 'Total Movie titles for rent' FROM rental r 
JOIN inventory i
ON r.inventory_ID=i.inventory_ID
JOIN film f
ON i.film_id=f.film_id
WHERE NOT isnull(return_date);

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT max(length)  AS max_duration, min(length) AS min_duration FROM film;

-- What's the average movie duration expressed in format (hours, minutes)?
SELECT concat('(',avg(length) div 60,'hour, ',round(avg(length) % 60,0),' minutes)') 
as 'Average Duration' 
FROM film;

-- How many distinct (different) actors' last names are there?
SELECT count(distinct last_name) as 'Distinct Last Names' from actor;

-- How many days was the company operating? Assume the last rental date was their closing date. (check DATEDIFF() function)

SELECT datediff(max(rental_date), min(rental_date)) as days_operating from rental;

-- Show rental info with additional columns month and weekday. Get 20 results.
select *, month(rental_date) as 'month', weekday(rental_date) as 'weekday' from rental
limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.

select *, month(rental_date) as 'month', weekday(rental_date) as 'weekday', 
case when weekday(rental_date) > 4 
then 'weekend' 
else 'workday' end  
from rental
limit 20;

-- Get release years.

select distinct release_year from film;

-- Get all films with ARMAGEDDON in the title.

select title from film
where title like '%ARMAGEDDON%';

-- Get all films which title ends with APOLLO.
select title from film
where title like'%APOLLO';

-- Get 10 the longest films.
select title, length from film
order by length desc
limit 10;

-- How many films include Behind the Scenes content?
select count(*) as 'Films with Behind the scenes content' from film
where special_features like '%Behind the scenes%';