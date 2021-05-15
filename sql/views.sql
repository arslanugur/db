--Views
      In SQL, a VIEW is a virtual table that is based on the result-set of an SQL statement.

      A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.

      Views allow us to:
      - Structure data in a way that users or classes of users find natural or intuitive.
      - Restrict access to the data in such a way that a user can see and (sometimes) modify exactly what they need and no more.
      - Summarize data from various tables and use it to generate reports.

      To create a view:
CREATE VIEW view_name AS
SELECT column_name(s)
FROM table_name
WHERE condition;

      The SELECT query can be as complex as you need it to be. It can contain multiple JOINS and other commands.
      
      Which command is used to create a view? --> CREATE VIEW
      
--Creating Views
      Consider the Employees table, which contains the following records:
      
      ID |FirstName |LastName |Age |Salary
      ------------------------------------
      1  |Emily     |Adams    |34  |5000
      2  |Chloe     |Anderson |27  |10000
      3  |Daniel    |Harris   |30  |6500
      4  |James     |Roberts  |31  |5500
      5  |John      |Smith    |35  |4500
      6  |Andrew    |Thomas   |45  |6000
      7  |David     |Williams |23  |3000
      
      
      Let's create a view that displays each employee's FirstName and Salary.
CREATE VIEW List A
SELECT FirstName, Salary
FROM  Employees

      Now, you can query the List view as you would query an actual table.
CREATE VIEW List AS
SELECT FirstName, Salary
FROM  Employees;
SELECT * FROM List;

      This would produce the following result::
      firstname	salary
      Emily	    5000
      Chloe	    10000
      Daniel	  6500
      James   	5500
      John	    4500
      Andrew  	6000
      David	    3000

      A view always shows up-to-date data! 
      The database engine uses the view's SQL statement to recreate the data each time a user queries a view.


      to create a view named ''temp'' for students with the highest marks.
CREATE VIEW temp AS 
SELECT id, name, mark 
FROM students 
ORDER BY mark DESC 
LIMIT 10;

--Updating a View
      You can update a view by using the following syntax:
CREATE OR REPLACE VIEW view_name A
SELECT column_name(s)
FROM table_name
WHERE condition

      The example below updates our List view to select also the LastName:
CREATE OR REPLACE VIEW List AS
SELECT FirstName, LastName, Salary
FROM  Employees;

      Result:
      FirstName |LastName |Salary
      ----------------------------
      Emily     |Adams    |5000
      Chloe     |Anderson |10000
      Daniel    |Harris   |6500
      James     |Roberts  |5500
      John      |Smith    |4500
      Andrew    |Thomas   |6000
      David     |Williams |3000
      
      You can delete a view with the DROP VIEW command.
DROP VIEW List

      It is sometimes easier to drop a table and recreate it instead of using the ALTER TABLE statement to change the table’s definition.
      
      Which statement in regard to views is correct? ---> Views are being updated dynamically
      
      to select all student names and university names (use left join to show all student names)
SELECT students.names, universities.names
FROM students
LEFT OUTER JOIN universities
ON students.university id = universities.id



