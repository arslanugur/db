--Updating Data
      The UPDATE statement allows us to alter data in the table.

      The basic syntax of an UPDATE query with a WHERE clause is as follows:
UPDATE table_name
SET column1=value1, column2=value2, ...
WHERE condition;

      You specify the column and its new value in a comma-separated list after the SET keyword.
      If you omit the WHERE clause, all records in the table will be updated!
      
      Consider the following table called "Employees":
      
      id |FirstName |LastName |Salary
      -----------------------------
      1  |John      |Smiths	|2000
      2  |David     |Williams |1500
      3  |Chloe     |Anderson |3000
      4  |Emily     |Adams    |4500
      
      
      To update John's salary, we can use the following query:
UPDATE Employees 
SET Salary=5000
WHERE ID=1;
SELECT * from Employees;
      
      Result:
      id	firstname	    lastname	salary
      2	  David	    Williams	1500
      3	  Chloe	    Anderson      3000
      4	  Emily	    Adams	      4500
      1	  John	    Smith	      5000
      
      
     to update the ''students'' table by changing the university's value to ''Stanford'' if the student's name is ''John''.
UPDATE students 
SET university='Stanford'
WHERE name='John';

--Updating Multiple Columns
      It is also possible to UPDATE multiple columns at the same time by comma-separating them:
UPDATE Employees 
SET Salary=5000, FirstName='Robert'
WHERE ID=1;
SELECT * from Employees;

      Result:
      id	firstname	lastname	salary
      2	David	      Williams	1500
      3	Chloe	      Anderson	3000
      4	Emily	      Adams	      4500
      1	Robert	Smith	      5000
      
      You can specify the column order any way you like in the SET clause.
      
      
      to update the ''name'' and ''age'' columns of the ''students'' table.
UPDATE students SET
name = 'Peter',
age = 32
WHERE id = 147;


--Deleting Data
      The DELETE statement is used to remove data from your table. DELETE queries work much like UPDATE queries.
DELETE FROM table_name
WHERE condition; 

      For example, you can delete a specific employee from the table:
DELETE FROM Employees
WHERE ID=1;
SELECT * from Employees;

      Result:
      id	firstname	lastname	salary
      2	David	      Williams	1500
      3	Chloe	      Anderson	3000
      4	Emily	      Adams	      4500
      
      If you omit the WHERE clause, all records in the table will be deleted!
      
      The DELETE statement removes the data from the table permanently.
      
      
       to delete a row from ''people'' in which the ids falls in the range of 5 to 10.
DELETE FROM people
WHERE id>5 AND id<10;

