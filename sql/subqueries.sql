--Subquery
      A subquery is a query within another query.

      Let's consider an example. We might need the list of all employees whose salaries are greater than the average.
      First, calculate the average:
SELECT AVG(Salary) FROM employees;

      As we already know the average, we can use a simple WHERE to list the salaries that are greater than that number.
      
      The DESC keyword sorts results in descending order.
      Similarly, ASC sorts the results in ascending order.
      
      
      to select all items from the ''items'' table for which cost is greater than 463. Order the result by cost in descending order.
SELECT * FROM items 
WHERE cost > 463 
ORDER BY cost DESC

      A single subquery will return the same result more easily.
SELECT FirstName, Salary FROM employees 
WHERE  Salary > (SELECT AVG(Salary) FROM employees) 
ORDER BY Salary DESC;

      Enclose the subquery in parentheses.
      Also, note that there is no semicolon at the end of the subquery, as it is part of our single query.
      
      
      to select all items from the ''items'' table for which the cost is greater than the average of costs. 
      Use a subquery to calculate the average cost.
SELECT * FROM items 
WHERE cost > 
(SELECT AVG(cost) 
FROM items)
