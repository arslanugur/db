--SQL Operators
      Comparison Operators and Logical Operators are used in the WHERE clause to filter the data to be selected.

      For example, we can display all customers names listed in our table, with the exception of the one with ID 5.
SELECT * FROM customers
WHERE ID != 5;

      As you can see, the record with ID=5 is excluded from the list.
    
    
      to select student names whose id is greater than or equal to 12.
SELECT id, name 
FROM students WHERE id >= 12;


--The BETWEEN Operator
      The BETWEEN operator selects values within a range. The first value must be lower bound and the second value, the upper bound.

      The syntax for the BETWEEN clause is as follows:
SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;

      The following SQL statement selects all records with IDs that fall between 3 and 7:
SELECT * FROM customers 
WHERE ID BETWEEN 3 AND 7;

      the lower bound and upper bound are both included in the range.
      
      
      to build a query to select the names of students whose ids are between 13 and 45.
SELECT id, name
FROM students 
WHERE id
BETWEEN 13 AND 45;


--Text Values
      When working with text columns, surround any text that appears in the statement with single quotation marks (').
      The following SQL statement selects all records in which the City is equal to 'New York'.
SELECT ID, FirstName, LastName, City 
FROM customers
WHERE City = 'New York';

      If your text contains an apostrophe (single quote), 
      you should use two single quote characters to escape the apostrophe. For example: 'Can''t'.
      
      to select all values from the ''people'' table where the city equals to ''Boston''.
SELECT *
FROM people
WHERE
city = 'Boston'


--Logical Operators
      Logical operators can be used to combine two Boolean values and return a result of true, false, or null.
      
      When retrieving data using a SELECT statement, use logical operators in the WHERE clause to combine multiple conditions.
      If you want to select rows that satisfy all of the given conditions, use the logical operator, AND.
      
      To find the names of the customers between 30 to 40 years of age, set up the query as seen here:
SELECT ID, FirstName, LastName, Age
FROM customers
WHERE Age >= 30 AND Age <= 40;

      You can combine as many conditions as needed to return the desired results.
      
      to select customers who live in Hollywood, CA.
SELECT * FROM customers 
WHERE state = 'CA'
AND city = 'Hollywood'
   
--OR
      If you want to select rows that satisfy at least one of the given conditions, you can use the logical OR operator.
      
      For example, if you want to find the customers who live either in New York or Chicago, the query would look like this:
SELECT * FROM customers 
WHERE City = 'New York' OR City = 'Chicago';

      You can OR two or more conditions.
      
      to select customers who live either in CA or in Boston.
SELECT name, state, city 
FROM customers 
WHERE state = 'CA' 
OR city = 'Boston';


--Combining AND & OR
      The SQL AND and OR conditions may be combined to test multiple conditions in a query.
      These two operators are called conjunctive operators.

      When combining these conditions, it is important to use parentheses, so that the order to evaluate each condition is known.
      
      The statement below selects all customers from the city "New York" AND with the age equal to "30" OR “35":
SELECT * FROM customers
WHERE City = 'New York'
AND (Age=30 OR Age=35);

      You can nest as many conditions as you need.
      
      to select customers whose ids are either 1 or 2, and whose city is ''Boston''.
SELECT * FROM customers
WHERE (id = 1 OR id = 2)
AND city = 'Boston'
