--The IN Operator
      The IN operator is used when you want to compare a column with more than one value.

      For example, you might need to select all customers from New York, Los Angeles, and Chicago.
      With the OR condition, your SQL would look like this:
SELECT * FROM customers 
WHERE City = 'New York'
OR City = 'Los Angeles'
OR City = 'Chicago';

      The IN operator is used when you want to compare a column with more than one value.
      
      to select users from NY and CA:
SELECT * FROM users
WHERE state = 'NY'
OR state = 'CA'

      You can achieve the same result with a single IN condition, instead of the multiple OR conditions:
SELECT * FROM customers 
WHERE City IN ('New York', 'Los Angeles', 'Chicago');

      Note the use of parentheses in the syntax.
      
      
      Select customers from NY, CA, or NC, using the IN statement.
SELECT name, state 
FROM customers 
WHERE state IN ('CA', 'NY', 'NC');



--The NOT IN Operator
      The NOT IN operator allows you to exclude a list of specific values from the result set.

      If we add the NOT keyword before IN in our previous query, customers living in those cities will be excluded:
SELECT * FROM customers 
WHERE City NOT IN ('New York', 'Los Angeles', 'Chicago');

      The NOT IN operator allows you to exclude a list of specific values from the result set.

      to exclude customers from the states CA, NY.
SELECT name, state 
FROM customers
WHERE state NOT IN ('CA', 'NY');
 
 
