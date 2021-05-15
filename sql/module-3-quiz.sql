      to insert a data item into the ''people'' table.
INSERT INTO people
VALUES('John Smith', '1', 22);

      to update the ''people'' table.
UPDATE people
SET name='Jordan' 
WHERE id=147;

      to create a table with two columns: ''id'' as a primary key integer, and ''name'' of type varchar.
CREATE TABLE(
id INT,
name varchar(30),
PRIMARY KEY(id)
);

      to remove the column ''age'' from the ''people'' table.
ALTER TABLE people
DROP COLUMN age

      Which choice is the correct command for changing the name of a table? --> RENAME
      
      to create a view named ''most_abs'' for the students with the greatest number of absences.
CREATE VIEW most_abs AS 
SELECT id, name, absences
FROM students 
ORDER BY absences DESC 
LIMIT 10;
      
      to delete the table ''students'' from the database.
DROP TABLE students

      to remove the column ''temp'' from the table ''students''.
ALTER TABLE students
DROP COLUMN temp
      
      
      
      
      
