--SQL Tables
      A single database can house hundreds of tables, each playing its own unique role in the database schema.
      
      SQL tables are comprised of table rows and columns. Table columns are responsible for storing many different types of data, including numbers, texts, dates, and even files.

      The CREATE TABLE statement is used to create a new table.
      
      Creating a basic table involves naming the table and defining its columns and each column's data type.
      
      
--Creating a Table
      The basic syntax for the CREATE TABLE statement is as follows:
CREATE TABLE table_name
(
column_name1 data_type(size),
column_name2 data_type(size),
column_name3 data_type(size),
....
columnN data_type(size)
)

      - The column_names specify the names of the columns we want to create.
      - The data_type parameter specifies what type of data the column can hold. 
      For example, use int for whole numbers.
      - The size parameter specifies the maximum length of the table's column.
      
      Note the parentheses in the syntax.
      
      
      Type in the keyword used as type for integer numbers. --> INT
      
      
      
      Assume that you want to create a table called "Users" that consists of four columns: UserID, LastName, FirstName, and City.
      Use the following CREATE TABLE statement:
CREATE TABLE Users
(
   UserID int,
   FirstName varchar(100), 
   LastName varchar(100),
   City varchar(100)
); 

      varchar is the datatype that stores characters. You specify the number of characters in the parentheses after the type. 
      So in the example above, our fields can hold max 100 characters long text.

      Type in the keyword used as type for a text in the lesson: varchar  --> var char : var -> variable char -> character
      
      
--Data Types
      Data types specify the type of data for a particular column.

      If a column called "LastName" is going to hold names, 
      then that particular column should have a "varchar" (variable-length character) data type.

      The most common data types:
      Numeric
      INT -A normal-sized integer that can be signed or unsigned.
      FLOAT(M,D) - A floating-point number that cannot be unsigned. 
                   You can optionally define the display length (M) and the number of decimals (D).
      DOUBLE(M,D) - A double precision floating-point number that cannot be unsigned. 
                    You can optionally define the display length (M) and the number of decimals (D).

      Date and Time
      DATE - A date in YYYY-MM-DD format.
      DATETIME - A date and time combination in YYYY-MM-DD HH:MM:SS format.
      TIMESTAMP - A timestamp, calculated from midnight, January 1, 1970
      TIME - Stores the time in HH:MM:SS format.

      String Type
      CHAR(M) - Fixed-length character string. Size is specified in parenthesis. Max 255 bytes.
      VARCHAR(M) - Variable-length character string. Max size is specified in parenthesis.
      BLOB - "Binary Large Objects" and are used to store large amounts of binary data, such as images or other types of files.
      TEXT - Large amount of text data.

      Choosing the correct data type for your columns is the key to good database design.


      to define a column named ''some_column'' of type varchar with a size of 50.
some_column varchar(50)


--Primary Key
      The UserID is the best choice for our Users table's primary key.
      Define it as a primary key during table creation, using the PRIMARY KEY keyword.
CREATE TABLE Users
(
   UserID int,
   FirstName varchar(100),
   LastName varchar(100),
   City varchar(100),
   PRIMARY KEY(UserID)
); 

      Specify the column name in the parentheses of the PRIMARY KEY keyword.
      
      
      to make the ''id'' column a primary key.
 PRIMARY KEY(id)
 
 
      Now, when we run the query, our table will be created in the database.
      
      |UserID   |FirstName  |LastName   |City    |
      
      You can now use INSERT INTO queries to insert data into the table.
      


      to create a table with three columns: ''id'' as a primary key, username and password of type varchar.
CREATE TABLE test (
id int,
username varchar(30),
password varchar(20),
PRIMARY KEY(id)
);

