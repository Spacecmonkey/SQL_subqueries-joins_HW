-- Question 1 All the customers that live in Texas 
select customer.customer_id, customer.first_name, customer.last_name
from customer
full join address on customer.address_id = address.address_id
full join city on address.city_id = city.city_id
where city = 'Texas';

-- Nothing comes back for this 


-- Question 2 getting all the payments above $6.99 WITH the full name 
select customer.first_name, customer.last_name, payment.amount
from customer
full join payment on customer.customer_id = payment.customer_id
where payment.amount > 6.99;


-- Question 3 Customers who have made payments over $175 using subqueries 
select * 
from customer 
where customer_id in (
	select customer_id 
	from payment 
	where amount> 175
);

-- Question 4 All the customers that live out in Nepal 
select customer.first_name, customer.last_name, country 
from customer 
full join address 
on customer.address_id = address.address_id 
full join city 
on address.city_id = city.city_id 
full join country 
on city.country_id = country.country_id 
where country = 'Nepal';



-- Question 5 staff member that had the most transactions 
select staff_id, COUNT(payment_id) AS transaction_count
from payment
group by staff_id
order by transaction_count desc
limit 1;

-- Question 6 How many movies of each raing are there? 
select rating, count(*) as movie_count
from movie
group by rating;

-- Question 7 Customers with a single payment above $6.99 
select customer_id, first_name, last_name
from customer 
where customer_id in(
	select customer_id 
	from payment
	where amount > 6.99
	group by customer_id having count(*) = 1
);


-- Question 8 Amount of free rentals that were given away 
select count(*) as free_rentals
from rental
full join payment on rental.customer_id = payment.customer_id
full join customer on rental.customer_id = customer.customer_id
where payment.amount = 0;












