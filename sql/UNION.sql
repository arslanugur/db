--Set Operation
      Occasionally, you might need to combine data from multiple tables into one comprehensive dataset. This may be for tables with similar data within the same database or maybe there is a need to combine similar data across databases or even across servers.

      To accomplish this, use the UNION and UNION ALL operators.

      UNION combines multiple datasets into a single dataset, and removes any existing duplicates.
      UNION ALL combines multiple datasets into one dataset, but does not remove duplicate rows.
      
      UNION ALL is faster than UNION, as it does not perform the duplicate removal operation over the data set.
      
      to select name, cost, and bids from the ''items'' table. Select only those items whose bids are greater than 123.
SELECT name, cost, bids
FROM items 
WHERE bids>123;

      The UNION operator is used to combine the result-sets of two or more SELECT statements.

      All SELECT statements within the UNION must have the same number of columns. 
      The columns must also have the same data types. Also, the columns in each SELECT statement must be in the same order.
      The syntax of UNION is as follows:
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;

      Here is the First of two tables:
      id	firstname	lastname	city
      1	  John	    Smith	    New York
      2	  David	    Williams	Los Angeles
      
      And here is the Second:
      id	firstname	lastname	city
      1	  James	    Roberts   Philadelphia
      2	  David	    Williams	Los Angeles      
      
SELECT ID, FirstName, LastName, City FROM First
UNION
SELECT ID, FirstName, LastName, City FROM Second;

      Result:
      id	firstname	lastname	city
      1	  John	    Smith	    New York
      1	  James	    Roberts	  Philadelphia
      2	  David	    Williams	Los Angeles
      
      
      As you can see, the duplicates have been removed.
      TIP:
      If your columns don't match exactly across all queries, you can use a NULL (or any other) value such as:
SELECT FirstName, LastName, Company FROM businessContacts
UNION
SELECT FirstName, LastName, NULL FROM otherContacts;

      The UNION operator is used to combine the result-sets of two or more SELECT statements.
      
      
      To perform a union operation: Columns in queries must be the same

--UNION ALL
      UNION ALL selects all rows from each table and combines them into a single table.
      
      The following SQL statement uses UNION ALL to select data from the First and Second tables:
SELECT ID, FirstName, LastName, City FROM First
UNION ALL
SELECT ID, FirstName, LastName, City FROM Second;

      Result:
      id	firstname	lastname	city
      1 	John	    Smith	    New York
      2	  David	    Williams	Los Angeles
      1	  James	    Roberts	  Philadelphia
      2	  David	    Williams	Los Angeles
      
      As you can see, the result set includes the duplicate rows as well.
      
      to unite the query results without removing the duplicates. --> UNION ALL
      
      
      
      
