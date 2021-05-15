--Inserting Data
      SQL tables store data in rows, one row after another. The INSERT INTO statement is used to add new rows of data to a table in the database.
      The SQL INSERT INTO syntax is as follows:
INSERT INTO table_name
VALUES (value1, value2, value3,...);

      Make sure the order of the values is in the same order as the columns in the table.
      Consider the following Employees table:
      
      id |FirstName |LastName  |Age
      -----------------------------
      1  |Emily     |Adams     |34
      2  |Chloe     |Anderson  |27
      3  |Daniel    |Harris    |30
      4  |James     |Roberts   |31
      5  |John      |Smith     |35
      6  |Andrew    |Thomas    |45
      7  |David     |Williams  |23
      
      to insert a new row:
INSERT INTO Employees 
VALUES (8, 'Anthony', 'Young', 35);
SELECT * from Employees;

      The values are comma-separated and their order corresponds to the columns in the table.
      Result:
      id	firstname	lastname	age
      1	  Emily	    Adams   	34
      2	  Chloe	    Anderson	27
      3	  Daniel	  Harris  	30
      4	  James	    Roberts	  31
      5	  John	    Smith	    35
      6	  Andrew	  Thomas	  45
      7	  David	    Williams	23
      8	  Anthony	  Young   	35
      
      When inserting records into a table using the SQL INSERT statement, 
      you must provide a value for every column that does not have a default value, or does not support NULL.
      
      
       to insert the data into the ''students'' table.
INSERT INTO students
VALUES ('John Smith', 'MIT');


      Alternatively, you can specify the table's column names in the INSERT INTO statement:
INSERT INTO table_name (column1, column2, column3, ...,columnN)  
VALUES (value1, value2, value3,...valueN);

      column1, column2, ..., columnN are the names of the columns that you want to insert data into.
INSERT INTO Employees (ID, FirstName, LastName, Age)
VALUES (8, 'Anthony', 'Young', 35);
SELECT * FROM Employees; 

      This will insert the data into the corresponding columns:
      Result:
      id	firstname	lastname	age
      1  	Emily	    Adams   	34
      2	  Chloe	    Anderson	27
      3	  Daniel	  Harris	  30
      4	  James	    Roberts	  31
      5	  John	    Smith   	35
      6	  Andrew	  Thomas  	45
      7	  David	    Williams	23
      8	  Anthony	  Young	    35
      
      You can specify your own column order, as long as the values are specified in the same order as the columns.
      
      to insert the data into the ''student'' table, using actual column names.
INSERT INTO students (name, university)
VALUES  ('Peter Parker', 'Stanford');
      
      It is also possible to insert data into specific columns only.
INSERT INTO Employees (ID, FirstName, LastName) 
VALUES (9, 'Samuel', 'Clark');
SELECT * from Employees;

      Result:
      id	firstname	lastname	age
      1	  Emily	    Adams   	34
      2	  Chloe	    Anderson	27
      3	  Daniel	  Harris  	30
      4	  James	    Roberts 	31
      5	  John	    Smith	    35
      6	  Andrew	  Thomas  	45
      7	  David	    Williams	23
      8	  Anthony	  Young   	35
      9	  Samuel	  Clark	    0
      
      The Age column for that row automatically became 0, as that is its default value.
      
      When inserting data into a table:  We don't have to insert values for all columns in the table
      
      

      
