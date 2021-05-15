--ALTER TABLE
      The ALTER TABLE command is used to add, delete, or modify columns in an existing table.
      You would also use the ALTER TABLE command to add and drop various constraints on an existing table.

      Consider the following table called People:
      ID |FirstName |LastName |City
      -----------------------------
      1  |John      |Smith    |NY
      2  |David     |Williams |LA
      3  |Chloe     |Anderson |CH
      
      The following SQL code adds a new column named DateOfBirth
ALTER TABLE People ADD DateOfBirth date;
SELECT * from People;

      Result:
      ID |FirstName |LastName |City |DateOfBirth
      ---------------------------------------
      1  |John      |Smith    |NY   |NULL
      2  |David     |Williams |LA   |NULL
      3  |Chloe     |Anderson |CH   |NULL
      
      All rows will have the default value in the newly added column, which, in this case, is NULL.
      
      to add a new column entitled ''specialty'' to the table ''students''.
ALTER TABLE students 
ADD specialty varchar(50);
 
 
--Dropping
      The following SQL code demonstrates how to delete the column named DateOfBirth in the People table.
ALTER TABLE People 
DROP COLUMN DateOfBirth;
SELECT * from People;

      The People table will now look like this(Result):
      id	firstname 	lastname	city
      1	  John      	Smith	    New York
      2	  David     	Williams	Los Angeles
      3	  Chloe     	Anderson	Chicago
      
      The column, along with all of its data, will be completely removed from the table.
      To delete the entire table, use the DROP TABLE command:
DROP TABLE People

      Be careful when dropping a table. Deleting a table will result in the complete loss of the information stored in the table!      
      
      Which choice is the correct command for deleting a table? --> DROP TABLE
      
      
--Renaming
      The ALTER TABLE command is also used to rename columns:
ALTER TABLE People
RENAME FirstName TO name;
SELECT * from People;

      This query will rename the column called FirstName to name.
      
      Result:
      id	name	lastname	city
      1	John	Smith	New York
      2	David	Williams	Los Angeles
      3	Chloe	Anderson	Chicago
      
      
      Renaming Tables
      You can rename the entire table using the RENAME command:
RENAME TABLE People TO Users

      This will rename the table People to Users.


      to rename the table ''people'' as ''humans''.
RENAME TABLE people
TO humans
 
 
 
 
 
 

