--The CONCAT Function
      The CONCAT function is used to concatenate two or more text values and returns the concatenating string.
      Let's concatenate the FirstName with the City, separating them with a comma:
SELECT CONCAT(FirstName, ', ' , City) FROM customers;

      The CONCAT() function takes two or more parameters.
      
      
--The AS Keyword to create custom columns.
      A concatenation results in a new column. The default column name will be the CONCAT function.
      You can assign a custom name to the resulting column using the AS keyword:
SELECT CONCAT(FirstName,', ', City) AS new_column 
FROM customers;

      A concatenation results in a new column.
      
--Arithmetic Operators
      Arithmetic operators perform arithmetical operations on numeric operands. 
      The Arithmetic operators include addition (+), subtraction (-), multiplication (*) and division (/).
      
      The example below adds 500 to each employee's salary and selects the result:
SELECT ID, FirstName, LastName, Salary+500 AS Salary
FROM employees;

      Parentheses can be used to force an operation to take priority over any other operators. 
      They are also used to improve code readability.
      
      
      
      to select concatenated ''city'' and ''state'' columns, represented with a new custom column named ''new_address''.
SELECT CONCAT(city, ', ', state)
AS new_address
FROM customers;
      
      
