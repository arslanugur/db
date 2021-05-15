      --In the "users" table of website logins and passwords, select the first 10 records in the table.
SELECT * FROM users
LIMIT 10

       --to create the table "users" to store website user logins and passwords.
CREATE TABLE users (
id INT NOT NULL 
AUTO_INCREMENT,
login VARCHAR(100),
password VARCHAR(100) );

      --to select all students under age 21. The result should be sorted according to the students' names.
SELECT * FROM students
WHERE age < 21
ORDER BY name

      --to print the list of the first one hundred customers who have balances greater than $1000 or who are from NY.
SELECT * FROM customers
WHERE balance > 1000 
OR city = 'NY'
LIMIT 100

      --You need the ages of all bears and lions. 
      --The first query shows the ages of bears and birds from zoo1, the other shows the ages of lions and crocodiles from zoo2.
SELECT age FROM zoo1
WHERE animal IN('bear', 'bird')
UNION
SELECT age FROM zoo2
WHERE animal IN('lion', 'crocodile')

      --to create a list of customers in the form "name is from city".
SELECT
CONCAT(name, ' is from ', city)
FROM customers;

      --The zoo administration wants a list of animals whose age is greater than the average age of all of the animals. 
SELECT * FROM zoo
WHERE age >
(SELECT AVG(age)
FROM zoo)

      --There are many wolves in the zoo: black wolf, white wolf, lucky wolf, little wolf. They all have 'wolf' at the end of their names. Print the ages of all of the wolves.
SELECT age FROM zoo
WHERE animal LIKE '%wolf'

      -- to retrieve all students between the ages of 18 and 22.
SELECT name FROM students 
WHERE age 
BETWEEN 18 AND 22;
 
      --to update the "students" table to set Jake's university to MIT. His id is 682.
UPDATE students 
SET university='MIT'
WHERE id=682

      --When you inserted "elephant" as a new animal, you forgot to include the elephant's age. 
      --Correct this mistake by updating the "zoo" table.
UPDATE zoo 
SET age=14
WHERE animal='elephant'

      --to update the food_balance to 23 for animals whose age is greater than the average age of the animals.
UPDATE zoo
SET food_balance=23 
WHERE age > 
(SELECT AVG(age)
FROM zoo);

      --You need your customer's names, along with the names of the cities in which they live. 
      --The names of the cities are stored in a separate table called "cities".
SELECT customers.name, cities.name
FROM customers
RIGHT
OUTER JOIN cities
ON cities.id = customers.city_id;

      --In the university's table containing student data, the students' last names have been omitted. 
      --Correct this by adding a new column to the table.
ALTER TABLE students
ADD last_name VARCHAR(100);

      --to retrieve from MIT, Stanford, and Harvard the names of all students whose first name is Jake.
SELECT name FROM students
WHERE university
IN ('MIT', 'Stanford', 'Harvard') 
AND name='Jake';



