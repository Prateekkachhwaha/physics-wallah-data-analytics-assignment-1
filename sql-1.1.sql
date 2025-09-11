/* question-1. Create a table called employees with the following structure?
: emp_id (integer, should not be NULL and should be a primary key)Q
: emp_name (text, should not be NULL)Q
: age (integer, should have a check constraint to ensure the age is at least 18)Q
: email (text, should be unique for each employee)Q
: salary (decimal, with a default value of 30,000).

Write the SQL query to create the above table with all constraints.*/
-- answer :-
CREATE TABLE employees (
    emp_id INT PRIMARY KEY NOT NULL,
    emp_name VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 18),
    email VARCHAR(150) UNIQUE,
    salary DECIMAL(10,2) DEFAULT 30000
);

/* question-2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
examples of common types of constraints.*/
-- answer:- Constraints preserve data integrity by restricting invalid data.
-- PRIMARY KEY → Uniquely identifies rows (emp_id).
-- FOREIGN KEY → Maintains referential integrity (e.g., customer.address_id → address.address_id in Mavenmovies).
-- UNIQUE → Prevents duplicate values (email).
-- NOT NULL → Disallows missing values (emp_name).
-- CHECK → Validates conditions (age >= 18).
-- DEFAULT → Supplies automatic values (salary DEFAULT 30000).*/

/* question-3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify your answer.*/
-- answer:-
-- Use NOT NULL when a column must always have a value (e.g., emp_name).
-- Primary Keys cannot contain NULL values because NULL represents an unknown value—two NULLs would break uniqueness.

/* question-4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
example for both adding and removing a constraint.*/
-- answer:-
-- Add a constraint
ALTER TABLE employees
ADD CONSTRAINT fk_emp_email_unique UNIQUE (email);
-- Remove a constraint
ALTER TABLE employees
DROP INDEX fk_emp_email_unique;  -- For UNIQUE or FOREIGN KEY

/* question-5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
Provide an example of an error message that might occur when violating a constraint.*/
-- answer :-
INSERT INTO employees (emp_id, emp_name, age) VALUES (1, 'John', 15);

/* question-6.You created a products table without constraints as follows:
CREATE TABLE products (
 product_id INT,
 product_name VARCHAR(50),
 price DECIMAL(10, 2));
 
Now, you realise that?
: The product_id should be a primary keyQ
: The price should have a default value of 50.00 */
-- answer :-
CREATE TABLE products (
 product_id INT,
 product_name VARCHAR(50),
 price DECIMAL(10, 2));
ALTER TABLE products
ADD PRIMARY KEY (product_id);
ALTER TABLE products
ALTER price SET DEFAULT 50.00;

/* question-7.*/
-- answer :-
SELECT s.student_name, c.class_name
FROM students
INNER JOIN classes  ON class_id = class_id;

/* question-8.Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
listed even if they are not associated with an order */
-- answer :-
SELECT order_id, customer_name, product_name
FROM products
LEFT JOIN order_items oi ON product_id = product_id
LEFT JOIN orders  ON order_id = order_id
LEFT JOIN customers  ON customer_id = customer_id;

/* question-9. Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.*/
-- answer:-
SELECT product_name, SUM(quantity * price) AS total_sales
FROM products
join  order_items oi ON product_id = product_id
GROUP BY p.product_name;

#sql commands 
# question-2.List all details of actors
-- answer :-
use sakila;
select * from actor;

# question-3.List all customer information from DB.
-- answer :-
SELECT * FROM customer;

# question-4.List different countries.
-- answer :-
SELECT DISTINCT country FROM country;

# question-5.-Display all active customers.
-- answer:-
select * from customer
where active=1;

# question-6.-List of all rental IDs for customer with ID 1.
-- answer:-
select * from rental
where staff_id=1;

# question-7.- Display all the films whose rental duration is greater than 5.
-- answer:-
 select * from film
 where rental_duration>5;
 
 # question-8. List the total number of films whose replacement cost is greater than $15 and less than $20.
 -- answer:-
SELECT COUNT(*) AS film_count
FROM film
WHERE replacement_cost > 15 AND replacement_cost < 20;

# question-9 - Display the count of unique first names of actors.
-- answer:-
SELECT COUNT(DISTINCT first_name) AS unique_first_names
FROM actor;

# question-10- Display the first 10 records from the customer table .
-- answer:-
SELECT * FROM customer
LIMIT 10;

# question-11 - Display the first 3 records from the customer table whose first name starts with ‘b’.
-- answer:-
SELECT * FROM customer
WHERE first_name LIKE 'B%'
LIMIT 3;
# question-12 -Display the names of the first 5 movies which are rated as ‘G’.
-- answer:-
SELECT title FROM film
WHERE rating = 'G'
LIMIT 5;

# question-13-Find all customers whose first name starts with "a".
-- answer:-
SELECT * FROM customer
WHERE first_name LIKE 'A%';

# question-14- Find all customers whose first name ends with "a".
-- answer:-
SELECT * FROM customer
WHERE first_name LIKE '%a';

# question-15- Display the list of first 4 cities which start and end with ‘a’ .
-- answer:-
SELECT city  FROM city
WHERE city LIKE 'A%a' limit 4;

# question-16- Find all customers whose first name have "NI" in any position.
-- answer:-
SELECT * FROM customer
WHERE first_name LIKE '%NI%';

# question-17- Find all customers whose first name have "r" in the second position .
-- answer:-
SELECT * FROM customer
WHERE first_name LIKE '_r%';


# question-18 - Find all customers whose first name starts with "a" and are at least 5 characters in length.
-- answer:-
SELECT * FROM customer
WHERE first_name LIKE 'A%' AND LENGTH(first_name) >= 5;

# question-19- Find all customers whose first name starts with "a" and ends with "o".
-- answer:-
SELECT * FROM customer
WHERE first_name LIKE 'A%o';

# question-20 - Get the films with pg and pg-13 rating using IN operator
-- answer:-
SELECT * FROM film
WHERE rating IN ('PG', 'PG-13');

#question-21 - Get the films with length between 50 to 100 using between operator.
-- answer:-
SELECT * FROM film
WHERE length BETWEEN 50 AND 100;

#question-22 - Get the top 50 actors using limit operator.
-- answer:-
SELECT * FROM actor
LIMIT 50;

#question-23 - Get the distinct film ids from inventory table.
-- answer:-
SELECT DISTINCT film_id FROM inventory;

#Functions
#Basic Aggregate Functions:

#Question 1:Retrieve the total number of rentals made in the Sakila database.
-- answer:- 
SELECT COUNT(*) AS total_rentals
FROM rental;

#Question 2:Find the average rental duration (in days) of movies rented from the Sakila database.
-- answer:-
SELECT AVG(rental_duration) AS avg_rental_duration
FROM film;

#Question 3:Display the first name and last name of customers in uppercase.
-- answer:-
SELECT UPPER(first_name) AS first_name, 
       UPPER(last_name) AS last_name
FROM customer;



#Question 4:Extract the month from the rental date and display it alongside the rental ID.
-- answer:-
SELECT rental_id, MONTH(rental_date) AS rental_month
FROM rental;

#Question 5: Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
-- answer:-
SELECT customer_id, COUNT(*) AS rental_count
FROM rental
GROUP BY customer_id;

#Question 6: Find the total revenue generated by each store.
-- answer:-
SELECT store_id, SUM(amount) AS total_revenue
FROM payment
GROUP BY store_id;

#Question 7: Determine the total number of rentals for each category of movies.
-- answer:-
SELECT c.name AS category, COUNT(r.rental_id) AS total_rentals
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;


#Question 8:Find the average rental rate of movies in each language.
-- answer:-
SELECT l.name AS language, AVG(f.rental_rate) AS avg_rental_rate
FROM film f
JOIN language l ON f.language_id = l.language_id
GROUP BY l.name;

#joins
#Questions 9 - Display the title of the movie, customer s first name and last name who rented it.
-- answer:-
 SELECT f.title, c.first_name, c.last_name
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id;

#Question 10:Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
-- answer:-
SELECT a.first_name,
       a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f        ON fa.film_id = f.film_id
WHERE f.title = 'Gone with the Wind';



#Question 11:Retrieve the customer names along with the total amount they've spent on rentals.
-- answer:-
SELECT c.first_name,
       c.last_name,
       SUM(p.amount) AS total_spent
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;



#Question 12: List the titles of movies rented by each customer in a particular city (e.g., 'London').
-- answer:-
SELECT c.first_name,
       c.last_name,
       f.title
FROM customer c
JOIN address a  ON c.address_id = a.address_id
JOIN city ci    ON a.city_id = ci.city_id
JOIN rental r   ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f     ON i.film_id = f.film_id
WHERE ci.city = 'London'
GROUP BY c.first_name, c.last_name, f.title;

#Advanced Joins and GROUP BY:
#Question 13:Display the top 5 rented movies along with the number of times they've been rented.
-- answer:-
SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;




#Question 14:Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
-- answer:-
SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 5;


#Windows Function:

#Question 1. Rank the customers based on the total amount they've spent on rentals.
-- answer:-
SELECT c.customer_id, c.first_name, c.last_name,
       SUM(p.amount) AS total_spent,
       RANK() OVER (ORDER BY SUM(p.amount) DESC) AS spending_rank
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

#Question 2. Calculate the cumulative revenue generated by each film over time.
-- answer:-
SELECT f.title, p.payment_date, 
       SUM(p.amount) OVER (PARTITION BY f.film_id ORDER BY p.payment_date) AS cumulative_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id;

#Question 3. Determine the average rental duration for each film, considering films with similar lengths.
-- answer:-
SELECT c.name AS category, f.title,
       COUNT(r.rental_id) AS rental_count,
       RANK() OVER (PARTITION BY c.name ORDER BY COUNT(r.rental_id) DESC) AS rank_in_category
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name, f.title
HAVING RANK() OVER (PARTITION BY c.name ORDER BY COUNT(r.rental_id) DESC) <= 3;

#Question 4. Identify the top 3 films in each category based on their rental counts.
-- answer:-
SELECT c.name AS category, f.title,
       COUNT(r.rental_id) AS rental_count,
       RANK() OVER (PARTITION BY c.name ORDER BY COUNT(r.rental_id) DESC) AS rank_in_category
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name, f.title
HAVING RANK() OVER (PARTITION BY c.name ORDER BY COUNT(r.rental_id) DESC) <= 3;

#Question 5. Calculate the difference in rental counts between each customer's total rentals and the average rentals across all customers.
-- answer:-
SELECT c.customer_id, c.first_name, c.last_name,
       COUNT(r.rental_id) AS total_rentals,
       COUNT(r.rental_id) - 
       AVG(COUNT(r.rental_id)) OVER () AS diff_from_avg
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

#Question 6. Find the monthly revenue trend for the entire rental store over time.
-- answer:-
SELECT DATE_FORMAT(payment_date, '%Y-%m') AS month,
       SUM(amount) AS total_revenue,
       SUM(SUM(amount)) OVER (ORDER BY DATE_FORMAT(payment_date, '%Y-%m')) AS running_revenue
FROM payment
GROUP BY DATE_FORMAT(payment_date, '%Y-%m')
ORDER BY month;

#Question 7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.
-- answer:-
WITH ranked_customers AS (
    SELECT c.customer_id, c.first_name, c.last_name,
           SUM(p.amount) AS total_spent,
           NTILE(5) OVER (ORDER BY SUM(p.amount) DESC) AS spending_percentile
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT * FROM ranked_customers
WHERE spending_percentile = 1;

#Question 8. Calculate the running total of rentals per category, ordered by rental count.
-- answer:-
SELECT c.name AS category,
       COUNT(r.rental_id) AS rental_count,
       SUM(COUNT(r.rental_id)) OVER (ORDER BY COUNT(r.rental_id)) AS running_total
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;

#Question 9. Find the films that have been rented less than the average rental count for their respective categories.
-- answer:-
WITH film_rentals AS (
    SELECT f.film_id, f.title, c.name AS category,
           COUNT(r.rental_id) AS rental_count
    FROM film f
    JOIN inventory i ON f.film_id = i.film_id
    JOIN rental r ON i.inventory_id = r.inventory_id
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    GROUP BY f.film_id, f.title, c.name
),
category_avg AS (
    SELECT category, AVG(rental_count) AS avg_rentals
    FROM film_rentals
    GROUP BY category
)
SELECT fr.film_id, fr.title, fr.category, fr.rental_count
FROM film_rentals fr
JOIN category_avg ca ON fr.category = ca.category
WHERE fr.rental_count < ca.avg_rentals;

#Question 10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.
-- answer:-
SELECT DATE_FORMAT(payment_date, '%Y-%m') AS month,
       SUM(amount) AS revenue
FROM payment
GROUP BY DATE_FORMAT(payment_date, '%Y-%m')
ORDER BY revenue DESC
LIMIT 5;

#Normalisation & CTE

#question-5.CTE Basics:
#a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they  have acted in from the actor and the acor table.
-- answer:-
WITH actor_films AS (
    SELECT a.actor_id, a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
    FROM actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY a.actor_id, a.first_name, a.last_name
)
SELECT * FROM actor_films;

#question-6.CTE with Joins:
#a. Create a CTE that combines information from the film and language tables to display the film title,  language name, and rental rate.
-- answer:-
WITH film_lang AS (
    SELECT f.title, l.name AS language, f.rental_rate
    FROM film f
    JOIN language l ON f.language_id = l.language_id
)
SELECT * FROM film_lang;

# question-7.CTE for Aggregation:
#a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments)  from the customer and payment table.
-- answer:-
WITH customer_revenue AS (
    SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) AS total_revenue
    FROM customer c
    JOIN payment p ON c.customer_id = p.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT * FROM customer_revenue;

#question-8. CTE with Window Functions:
#a. Utilize a CTE with a window function to rank films based on their rental duration from the film table.
-- answer:-
WITH film_ranks AS (
    SELECT film_id, title, rental_duration,
           RANK() OVER (ORDER BY rental_duration DESC) AS duration_rank
    FROM film
)
SELECT * FROM film_ranks;

#question-9.CTE and Filtering:
#a. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the  customer table to retrieve additional customer details.
-- answer:-
WITH active_customers AS (
    SELECT customer_id, COUNT(rental_id) AS rental_count
    FROM rental
    GROUP BY customer_id
    HAVING COUNT(rental_id) > 2
)
SELECT ac.customer_id, c.first_name, c.last_name, ac.rental_count
FROM active_customers ac
JOIN customer c ON ac.customer_id = c.customer_id;

#question-10 CTE for Date Calculations:
#a. Write a query using a CTE to find the total number of rentals made each month, considering the  rental_date from the rental table
-- answer:-
WITH monthly_rentals AS (
    SELECT DATE_FORMAT(rental_date, '%Y-%m') AS month, COUNT(*) AS total_rentals
    FROM rental
    GROUP BY DATE_FORMAT(rental_date, '%Y-%m')
)
SELECT * FROM monthly_rentals;

#question-11' CTE and Self-Join:
#a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film together, using the film_actor table.
-- answer:-
WITH actor_pairs AS (
    SELECT fa1.actor_id AS actor1, fa2.actor_id AS actor2, fa1.film_id
    FROM film_actor fa1
    JOIN film_actor fa2 ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id
)
SELECT a1.first_name || ' ' || a1.last_name AS actor1,
       a2.first_name || ' ' || a2.last_name AS actor2,
       f.title
FROM actor_pairs ap
JOIN actor a1 ON ap.actor1 = a1.actor_id
JOIN actor a2 ON ap.actor2 = a2.actor_id
JOIN film f ON ap.film_id = f.film_id;


#question-12. CTE for Recursive Search:
#a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, considering the reports_to column
-- answer:-

