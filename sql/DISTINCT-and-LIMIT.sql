--The DISTINCT Keyword
      In situations in which you have multiple duplicate records in a table, it might make more sense to return only unique records, instead of fetching the duplicates.

      The SQL DISTINCT keyword is used in conjunction with SELECT to eliminate all duplicate records and return only unique ones.

      The basic syntax of DISTINCT is as follows:
SELECT DISTINCT column_name1, column_name2
FROM table_name;


      Note that there are duplicate City names. The following SQL statement selects only distinct values from the City column:
SELECT DISTINCT City FROM customers; 


      The DISTINCT keyword only fetches the unique values.
      
      
      to build a query to get distinct results from the ''customers'' table.
SELECT DISTINCT state 
FROM customers;



The LIMIT Keyword
      By default, all results that satisfy the conditions specified in the SQL statement are returned. 
      However, sometimes we need to retrieve just a subset of records. In MySQL, this is accomplished by using the LIMIT keyword.

      The syntax for LIMIT is as follows:
SELECT column list
FROM table_name
LIMIT [number of records];

      For example, we can retrieve the first five records from the customers table.
SELECT ID, FirstName, LastName, City
FROM customers LIMIT 5;

      By default, all results that satisfy the conditions specified in the SQL statement are returned.
      
      
      to complete the following statement, which selects five names from ''students''.
SELECT name 
FROM students LIMIT 5;
      
      You can also pick up a set of records from a particular offset.
      In the following example, we pick up four records, starting from the third position:
SELECT ID, FirstName, LastName, City
FROM customers OFFSET 3 LIMIT 4;

      The reason that it produces results starting from ID number four, 
      and not three, is that MySQL starts counting from zero, meaning that the offset of the first row is 0, not 1.


      Use LIMIT to select the ''id'' and ''name'' columns from ''customers''. Show 12 results, starting from the fifth.
SELECT id, name
FROM customers
LIMIT 4, 12
