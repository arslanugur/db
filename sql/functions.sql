--The UPPER Function
      The UPPER function converts all letters in the specified string to uppercase.
      The LOWER function converts the string to lowercase.

      The following SQL query selects all LastNames as uppercase:
SELECT FirstName, UPPER(LastName) AS LastName 
FROM employees;

      If there are characters in the string that are not letters, this function will have no effect on them.
      
      LOWER is the name of the function that converts the text to lowercase?
      
      
--SQRT and AVG
      The SQRT function returns the square root of given value in the argument.
      Let's calculate the square root of each Salary:
SELECT Salary, SQRT(Salary) 
FROM employees;

      Similarly, the AVG function returns the average value of a numeric column:
SELECT AVG(Salary) FROM employees;

      Another way to do the SQRT is to use POWER with the 1/2 exponent. However, SQRT seems to work faster than POWER in this case.
      
      to select the average cost from the ''items'' table.
SELECT AVG(cost) 
FROM items;


--The SUM function
      The SUM aggregate function is used to calculate the sum for a column's values.
      For example, to get the sum of all of the salaries in the employees table, our SQL query would look like this:
SELECT SUM(Salary) FROM employees;SELECT SUM(Salary) FROM employees;

      The sum of all of the employees' salaries is 31000.
      
