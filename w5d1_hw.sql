-- 1. How many actors are there with the last name ‘Wahlberg’?
-- Expected output: 2
SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
-- Expected output: 5607
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- 3. What film does the store have the most of? (search in inventory)
-- Expected output: Multiple tied at 8
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

-- 4. How many customers have the last name ‘William’?
-- Expected output: 0
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';

-- 5. What store employee (get the id) sold the most rentals?
-- Expected output: 1 - 8040
SELECT staff_id, COUNT(rental_id)
FROM rental
GROUP BY staff_id
ORDER BY COUNT(rental_id) DESC
LIMIT 1;

-- 6. How many different district names are there?
-- Expected output: 378
SELECT COUNT(DISTINCT district)
FROM address;


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- Expected output: film_id 508 - 15 actors
SELECT COUNT(actor_id)as actors, film_id
FROM film_actor
GROUP BY film_id 
ORDER BY COUNT(actor_id) DESC
LIMIT 1;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- Expected output: 13
SELECT COUNT(last_name)
FROM customer
WHERE store_id = 1 and last_name LIKE '%es';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--    with ids between 380 and 430? (use group by and having > 250)
-- Expected output: 3
SELECT amount, COUNT(payment_id)
FROM payment
WHERE customer_id BETWEEN 380 and 430 
GROUP BY amount
HAVING COUNT(payment_id) > 250


-- 10. Within the film table, how many rating categories are there? And what rating has the most
--     movies total?
-- Expected output: 5 ratings, PG-13 has the most

SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;

-- or 

SELECT COUNT(DISTINCT rating)
FROM film;

SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC
LIMIT 1;