--SQL Constraints
      SQL constraints are used to specify rules for table data.

      The following are commonly used SQL constraints:
      NOT NULL - Indicates that a column cannot contain any NULL value.
      UNIQUE - Does not allow to insert a duplicate value in a column. 
               The UNIQUE constraint maintains the uniqueness of a column in a table. More than one UNIQUE column can be used in a table.
      PRIMARY KEY - Enforces the table to accept unique data for a specific column 
                    and this constraint create a unique index for accessing the table faster.
      CHECK - Determines whether the value is valid or not from a logical expression.
      DEFAULT - While inserting data into a table, if no value is supplied to a column, then the column gets the value set as DEFAULT.

      For example, the following means that the name column disallows NULL values.
name varchar(100) NOT NULL

      During table creation, specify column level constraint(s) after the data type of that column.
      
      the column ''username'' disallows empty values.
username varchar(50) 
NOT NULL

--AUTO INCREMENT
      Auto-increment allows a unique number to be generated when a new record is inserted into a table.

      Often, we would like the value of the primary key field to be created automatically every time a new record is inserted.

      By default, the starting value for AUTO_INCREMENT is 1, and it will increment by 1 for each new record.
      Let's set the UserID field to be a primary key that automatically generates a new value:
UserID int NOT NULL AUTO_INCREMENT,
PRIMARY KEY (UserID)

      Auto-increment allows a unique number to be generated when a new record is inserted into a table.
      
      
      to have the ''id'' column auto increment by one each time a new row is inserted.
id int NOT NULL
AUTO_INCREMENT

--Using Constraints
      The example below demonstrates how to create a table using constraints.
CREATE TABLE Users (
id int NOT NULL AUTO_INCREMENT,
username varchar(40) NOT NULL, 
password varchar(10) NOT NULL,
PRIMARY KEY(id)
);

      The following SQL enforces that the "id", "username", and "password" columns do not accept NULL values. 
      We also define the "id" column to be an auto-increment primary key field.

      Here is the result:
      #  |Column   |Type        |Null  |Default |Extra
      --------------------------------------------------------
      1  |id       |int(11)     |No    |None    |AUTO_INCREMENT
      2  |username |varchar(40) |No    |None    |
      3  |password |varchar(10) |No    |None    |

      When inserting a new record into the Users table, it's not necessary to specify a value for the id column; 
      a unique new value will be added automatically.
      
      
      to create a table with an auto incremented and not empty primary key ''id''.
CREATE TABLE test (
id int NOT NULL AUTO_INCREMENT,
name varchar(30) NOT NULL,
PRIMARY KEY(id)
);


