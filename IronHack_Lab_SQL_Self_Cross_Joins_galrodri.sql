-- Question 1 
select t3.film_id
	, concat(t4.first_name, ' ', t4.last_name) as Actor_1
	, concat(t5.first_name, ' ', t5.last_name) as Actor_2
from sakila.film_actor t1
	inner join sakila.film_actor t2
		on t1.actor_id <> t2.actor_id
        AND t1.film_id = t2.film_id
	inner join sakila.film t3
		on t1.film_id = t3.film_id
	inner join sakila.actor t4
		on t1.actor_id = t4.actor_id
	inner join sakila.actor t5
		on t2.actor_id = t5.actor_id
        
-- Question 2
with rentals AS
(select distinct customer_id
, inventory_id
, count(rental_id) as rental_count
from sakila.rental
group by 1
having rental_count > 3)

select distinct t1.inventory_id
, t1.customer_id
, t2.customer_id
, t1.rental_count
, t2.rental_count
from rentals t1
inner join rentals t2
on t1.inventory_id = t2.inventory_id 
and t1.customer_id <> t2.customer_id
order by t1.rental_count desc;

-- Question 3
select
	CONCAT(t2.first_name,' ',t2.last_name) as actor_full_name
    , t3.title as Film_Title
from sakila.film_actor t1
	inner join sakila.actor t2
		on t1.actor_id = t2.actor_id 
	inner join sakila.film t3
		on t1.film_id = t3.film_id