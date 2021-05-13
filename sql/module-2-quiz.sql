      to select all values from the ''students'' table in which the field ''university'' equals ''MIT''.
SELECT * FROM students
WHERE university = 'MIT';


      to select students from MIT and Stanford, and order the results by the ''university'' column.
SELECT name, university
FROM students WHERE university
IN ('Stanford', 'MIT')
ORDER BY university;


      Which keyword is the correct one for custom columns? --> AS
      
      
      What is the name of the aggregate function for calculating the sum? --> SUM
      
      
      to select name and age from ''students'', where age is greater than the average of all ages. 
      Use a subquery to calculate the average value of age.
SELECT name, age 
FROM students
WHERE age >
(SELECT AVG(age)
FROM students)

