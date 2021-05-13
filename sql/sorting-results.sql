--Fully Qualified Names
      In SQL, you can provide the table name prior to the column name, by separating them with a dot.
      The following statements are equivalent:
SELECT City FROM customers;

SELECT customers.City FROM customers;


      The term for the above-mentioned syntax is called the "fully qualified name" of that column.
      This form of writing is especially useful when working with multiple tables that may share the same column names.
      
      
      to select the ''address'' from ''customers'', using the fully qualified name for the ''address'' column.
SELECT customers.address
FROM customers;

--Order By
      ORDER BY is used with SELECT to sort the returned data.
      The following example sorts our customers table by the FirstName column.
SELECT * FROM customers
ORDER BY FirstName;

      The rows are ordered alphabetically by the FirstName column.
      By default, the ORDER BY keyword sorts the results in ascending order.
      
      
      Build a query to select ''name'' and ''city'' from the ''people'' table, and order by the ''id''.
SELECT name, city
FROM people ORDER BY id;


--Sorting Multiple Columns
      ORDER BY can sort retrieved data by multiple columns. 
      When using ORDER BY with more than one column, separate the list of columns to follow ORDER BY with commas.

      To order by LastName and Age:
SELECT * FROM customers 
ORDER BY LastName, Age;

      As we have two Smiths, they will be ordered by the Age column in ascending order.
      The ORDER BY command starts ordering in the same sequence as the columns. 
      It will order by the first column listed, then by the second, and so on.
      
      
      to order the query results by ''name'', and then by ''state''.
SELECT name, state, address
FROM customers 
ORDER BY name, state;

