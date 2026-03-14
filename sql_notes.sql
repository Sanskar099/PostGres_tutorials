SELECT * FROM payment;

select date(payment_date) as DATE, SUM(amount) as sales FROM payment
GROUP BY DATE
ORDER BY sales DESC;

-- Question: 2 staff members 1 and 2, want to give bonus to staff member
-- that handled most payments (in terms of number of payments processed)
-- Who gets the bonus

SELECT * FROM payment;

SELECT staff_id, COUNT(customer_id) as customers FROM payment
WHERE staff_id in (1,2)
GROUP BY staff_id
ORDER BY staff_id DESC;




/* study relationship between replacement_cost and movie rating
eg G PG R etc , what is the average replacement cost as per rating
*/
SELECT * FROM film;

SELECT ROUND(AVG(replacement_cost),2), rating FROM film
GROUP BY rating;



/* running promotion to reward top 5 customers with coupons, what are the
customer ids of top 5 customers by total spend? */

Select * from payment;

SELECT customer_id, SUM(amount) as total_purchase FROM payment
GROUP BY customer_id
ORDER BY total_purchase DESC LIMIT 5;




/* HAVING CLAUSE QUESTIONS

Q1) we are launching a platinum service for our most loyal customers, will assign platinum 
	to customers who have 40 or more payments. What customer_ids are eligible for platinum?

*/

SELECT * FROM payment limit 1;

Select customer_id, COUNT(payment_id) from payment
GROUP BY customer_id
HAVING COUNT(payment_id) >= 40;



/* 
Q2) what are the customer ids of customers who have paid more than 100$
in transactions with our staff_id 2;

*/


SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100;



SELECT * FROM film;

SELECT COUNT(*) FROM film
where title LIKE 'J%';


SELECT * FROM customer LIMIT 1;

SELECT customer_id, first_name, address_id from customer
WHERE first_name ILIKE 'E%' AND address_id < 500
ORDER BY address_id DESC LIMIT 1;




/* JOINS */



/* 
Q1) california sales tax laws have changed and we need to alert our customers through
email what are the emails of customers who live in california?
*/
SELECT * FROM customer limit 1;
SELECT * FROM address where district = 'California';


SELECT customer.customer_id, email, district FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'California';


/* Q2) A cusotmer walks in and he wants to know which movies is Nick Wahlberg in
get a list of all the movies where Nick Wahlberg is in
*/

SELECT * FROM film;
SELECT * FROM actor;

SELECT film.title, first_name, last_name FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film.film_id = film_actor.film_id
WHERE actor.first_name = 'Nick' AND actor.last_name = 'Wahlberg';






