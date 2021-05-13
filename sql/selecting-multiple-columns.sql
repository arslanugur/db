--Selecting Multiple Columns
      As previously mentioned, the SQL SELECT statement retrieves records from tables in your SQL database.

      You can select multiple table columns at once.
      Just list the column names, separated by commas
SELECT FirstName, LastName, City 
FROM customers;

      Do not put a comma after the last column name.

      to select name and city from the ''people'' table.
SELECT name, city FROM people;

--Selecting All Columns
      To retrieve all of the information contained in your table, 
      place an asterisk (*) sign after the SELECT command, rather than typing in each column names separately.

      The following SQL statement selects all of the columns in the customers table:
SELECT * FROM customers;

