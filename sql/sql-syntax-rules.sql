--Multiple Queries
      SQL allows to run multiple queries or commands at the same time.

      The following SQL statement selects the FirstName and City columns from the customers table:
SELECT FirstName FROM customers;
SELECT City FROM customers;

      Remember to end each SQL statement with a semicolon to indicate that the statement is complete and ready to be interpreted.
      In this tutorial, we will use semicolon at the end of each SQL statement.
            
      Whenever you run multiple queries, Each query must end with a semicolon.
      
--Case Sensitivity
      SQL is case insensitive.
      The following statements are equivalent and will produce the same result:
select City from customers;
SELECT City FROM customers;
sElEct City From customers;

      It is common practice to write all SQL commands in upper-case.
      
--Syntax Rules
      A single SQL statement can be placed on one or more text lines. In addition, multiple SQL statements can be combined on a single text line.

      White spaces and multiple lines are ignored in SQL.
      For example, the following query is absolutely correct.
SELECT        City

FROM customers;

      However, it is recommended to avoid unnecessary white spaces and lines.
      Combined with proper spacing and indenting, 
            breaking up the commands into logical lines will make your SQL statements much easier to read and maintain.
            
            
      Which is true about whitespaces?
      Whitespaces and line breaks are ignored



            
            
