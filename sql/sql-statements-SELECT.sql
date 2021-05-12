--Basic SQL Commands
      The SQL SHOW statement displays information contained in the database and its tables. 
      This helpful tool lets you keep track of your database contents and remind yourself about the structure of your tables.

      For example, the SHOW DATABASES command lists the databases managed by the server.
SHOW DATABASES

      Throughout the tutorial we will be using the MySQL engine and the PHPMyAdmin tool to run SQL queries.
      
      The easiest way to get MySQL and PHPMyAdmin is to install free tools like XAMPP or WAMP, which include all necessary installers.
      
      
      
      The SHOW TABLES command is used to display all of the tables in the currently selected MySQL database.
      
      For our example, we have created a database, my_database, with a table called customers.
      
      to view a list of tables for the currently selected database.
SHOW TABLES


      SHOW COLUMNS displays information about the columns in a given table.

      The following example displays the columns in our customers table:
SHOW COLUMNS FROM customers

      SHOW COLUMNS displays the following values for each table column:
      Field: column name
      Type: column data type
      Key: indicates whether the column is indexed
      Default: default value assigned to the column
      Extra: may contain any additional information that is available about a given column
      The columns for the customers table have also been created using the PHPMyAdmin tool.
      
      to view the columns from the 'customers' table:
 SHOW COLUMNS FROM customers
 
 
 --SELECT Statement
      The SELECT statement is used to select data from a database.
      The result is stored in a result table, which is called the result-set.

      A query may retrieve information from selected columns or from all columns in the table.
      To create a simple SELECT statement, specify the name(s) of the column(s) you need from the table.

      Syntax of the SQL SELECT Statement:
SELECT column_list
FROM table_name

      - column_list includes one or more columns from which data is retrieved
      - table-name is the name of the table from which the information is retrieved
      
      
      The following SQL statement selects the FirstName from the customers table:
SELECT FirstName FROM customers     


      A SELECT statement retrieves zero or more rows from one or more database tables.
      
      
      
      
      
 
