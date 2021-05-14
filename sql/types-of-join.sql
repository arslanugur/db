--Custom Names
      Custom names can be used for tables as well. You can shorten the join statements by giving the tables "nicknames":
SELECT ct.ID, ct.Name, ord.Name, ord.Amount
FROM customers AS ct, orders AS ord
WHERE ct.ID=ord.Customer_ID
ORDER BY ct.ID;

      As you can see, we shortened the table names as we used them in our query.
      
      to select item names and names of customers who bought the items. Use custom names to shorten the statement.
SELECT ct.name, it.name
FROM customers AS ct, items AS it 
WHERE it.seller_id= ct.id;

      Explain: 
      When we are doing a join, we will be dealing with more than one table, so we can't just use column names. 
      Instead we will have to reference columns using the format table_name.column_name. 
      But writing out customers and items every time might get annoying, so we may want to shorten the table name with a custom name. 
      On the last page we learned that this is done in the FROM portion of our statement using the AS command. 
      Now we can use ct and it to reference our tables. 
      The prompt tells us to "...select item names and names of customers..." 
      and we already have ct.name, so we need to use it.name to get the item names. 
      And usually when we perform a join on two tables, we are going to be doing some sort of comparison of IDs with a WHERE statement.
      It is a little confusing that the column is called seller_id instead of something like costumer_id
      
      
--Types of Join
      The following are the types of JOIN that can be used in MySQL:
      - INNER JOIN
      - LEFT JOIN
      - RIGHT JOIN

      INNER JOIN is equivalent to JOIN. It returns rows when there is a match between the tables.
      Syntax:
SELECT column_name(s)
FROM table1 INNER JOIN table2 
ON table1.column_name=table2.column_name;

      Note the ON keyword for specifying the inner join condition.
      The image below demonstrates how INNER JOIN works:
      
      |Table 1| INNER JOIN | Table 2 |
      
      Only the records matching the join condition are returned.
      
      
      to select the names of students and the names of the universities where those students study.
SELECT students.name, universities.name
FROM students, universities
WHERE students.university_id = universities.id



--LEFT JOIN
      The LEFT JOIN returns all rows from the left table, even if there are no matches in the right table.

      This means that if there are no matches for the ON clause in the table on the right, 
      the join will still return the rows from the first table in the result.

      The basic syntax of LEFT JOIN is as follows:
SELECT table1.column1, table2.column2...
FROM table1 LEFT OUTER JOIN table2
ON table1.column_name = table2.column_name;


      The OUTER keyword is optional, and can be omitted.
      The image below demonstrates how LEFT JOIN works:
      
      |Table 1 LEFT JOIN | Table 2 |

      Consider the following tables.
      customers:
      ID   |Name   |LastName |City
      ------------------------------
      1    |J      |E        |NY
      2    |B      |F        |LA
      3    |T      |C        |CH
      4    |F      |A        |HS
      5    |C      |X        |PH
      6    |B      |V        |NY
      7    |M      |Z        |NY

      items:
      ID   |Name    |Cost    |Seller_id
      ---------------------------------
      39   |Book    |5.9     |1
      24   |Box     |2.99    |1
      72   |Toy     |23.7    |2
      36   |Flowers |50.75   |2
      18   |T-Shirt |22.5    |3
      16   |Notebook|150.22  |4
      74   |Perfume |90.9    |6

      The following SQL statement will return all customers, and the items they might have:
SELECT customers.Name, items.Name 
FROM customers LEFT OUTER JOIN items 
ON customers.ID=items.Seller_id;

      Result:
      name	  name
      John	  Book
      John	  Box
      David	  Toy
      David  	Flowers
      Chloe	  T-Shirt
      Emily	  Notebook
      Andrew	Perfume
      James	  NULL
      Daniel	NULL
      
      The result set contains all the rows from the left table and matching data from the right table.
      
      If no match is found for a particular row, NULL is returned.
      
      
      to outer join the table ''items'' with ''customers''.
SELECT customers.name, items.name
FROM customers
LEFT OUTER JOIN items 
ON customers.id=seller_id


--RIGHT JOIN
      The RIGHT JOIN returns all rows from the right table, even if there are no matches in the left table.

      The basic syntax of RIGHT JOIN is as follows:
SELECT table1.column1, table2.column2...
FROM table1 RIGHT OUTER JOIN table2
ON table1.column_name = table2.column_name;

      Again, the OUTER keyword is optional, and can be omitted.
      
      Consider the same example from our previous lesson, but this time with a RIGHT JOIN:
SELECT customers.Name, items.Name FROM customers
RIGHT JOIN items ON customers.ID=items.Seller_id;

      Result:
      name	  name
      John	  Book
      John	  Box
      David	  Toy
      David	  Flowers
      Chloe	  T-Shirt
      Emily	  Notebook
      Andrew	Perfume

      The RIGHT JOIN returns all the rows from the right table (items), even if there are no matches in the left table (customers).
      
      There are other types of joins in the SQL language, but they are not supported by MySQL.
      
      
      to select student names and all university names (use right join to show all university names).
SELECT students.names, universities.names
FROM students
RIGHT OUTER JOIN universities
ON students.university_id = universities.id


      

