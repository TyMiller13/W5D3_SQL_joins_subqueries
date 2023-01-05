--Question 1
select first_name, last_name, district
	from customer c
	join address a
	on c.address_id  = a.address_id 
	where district = 'Texas'



--Question 2
select first_name, last_name, amount
	from customer c 
	join payment p  
	on c.customer_id = p.customer_id 
	where amount > 7;


--Question 3
select customer_id, store_id, first_name, last_name, email, address_id, activebool, create_date, last_update  
	from customer c 
	where customer_id in (
		select customer_id 
		from payment p 
		group by customer_id 
		having sum(amount) > 175
	);



--Question 4

select first_name, last_name, district, city, country
	from customer c 
	join address a 
	on c.address_id = a.address_id
	join city ci 
	on a.city_id = ci.city_id 
	join country co 
	on ci.country_id = co.country_id 
	where country = 'Argentina';


--Question 5
select c.category_id, name, count(*) as num_movies_in_cat
	from category c
	join film_category fc 
	on c.category_id = fc.category_id
	group by c.category_id 
	order by count(*) desc;	

--Question 6
select f.film_id, title, count(*) as num_actors
	from film f 
	join film_actor fa 
	on f.film_id = fa.film_id
	group by f.film_id
	order by count(*) desc
	limit 1;



--Question 7
select a.actor_id, first_name, last_name, count(*) as num_films
	from actor a 
	join film_actor fa 
	on a.actor_id  = fa.actor_id 
	group by a.actor_id 
	order by count(*)
	limit 1;



--Question 8
select c.country_id, country, count(*) as num_cities
	from country c 
	join city ci 
	on c.country_id = ci.country_id
	group by c.country_id 
	order by count(*) desc
	limit 5


--Question 9
select a.actor_id, first_name, last_name, count(*)
	from actor a 
	join film_actor fa 
	on a.actor_id = fa.actor_id 
	group by a.actor_id 
	having count(*) between 20 and 25;


