--The Like Operator
      The LIKE keyword is useful when specifying a search condition within your WHERE clause.
SELECT column_name(s)
FROM table_name
WHERE column_name LIKE pattern;

      SQL pattern matching enables you to use "_" to match any single character and "%" to match an arbitrary number of characters 
      (including zero characters).

      For example, to select employees whose FirstNames begin with the letter A, you would use the following query:
SELECT * FROM employees 
WHERE FirstName LIKE 'A%';


      As another example, the following SQL query selects all employees with a LastName ending with the letter "s":
SELECT * FROM employees 
WHERE LastName LIKE '%s';

      The % wildcard can be used multiple times within the same pattern.
      
      
      to search ''boxes'' in the ''name'' column of the ''items'' table.
SELECT seller_id FROM items
WHERE name LIKE '%boxes'


--The MIN Function
      The MIN function is used to return the minimum value of an expression in a SELECT statement.
      For example, you might wish to know the minimum salary among the employees.
SELECT MIN(Salary) AS Salary FROM employees;

      All of the SQL functions can be combined together to create a single expression.
      
      
      to complete the statement, which selects ''name'' and minimum of the "cost'' from ''items'', filtering by name and seller id.
SELECT name, MIN(cost) 
FROM items WHERE name 
LIKE '%boxes of frogs' AND 
seller_id IN(68, 6, 18)
