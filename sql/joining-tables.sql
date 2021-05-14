--Joining Tables
      All of the queries shown up until now have selected from just one table at a time.
      
      One of the most beneficial features of SQL is the ability to combine data from two or more tables.
      
      In the two tables that follow, the table named customers stores information about customers:
      ID   |Name   |City   |Age
      -------------------------
      1    |A      |NY     |35
      2    |B      |CA     |23
      3    |C      |CH     |27
      4    |D      |PH     |34
      5    |E      |TX     |31
      
      
      The orders table stores information about individual orders with their corresponding amount:
      ID   |Name   |Customer_ID |Age
      ------------------------------
      1    |Book   |3     	    |35
      2    |Box    |5     	    |23
      3    |Toy    |2     	    |27
      4    |Flowers|4           |34
      5    |Cake   |1     	    |31
      
      In SQL, "joining tables" means combining data from two or more tables. 
      A table join creates a temporary table showing the data from the joined tables.
      
      
      What does the Table Join do? ---> Creates a temporary table with the joined tables' data

      Rather than storing the customer name in both tables, 
      the orders table contains a reference to the customer ID that appears in the customers table. 
      This approach is more efficient, as opposed to storing the same text values in both tables.
      In order to be able to select the corresponding data from both tables, we will need to join them on that condition.
      
      to select ''id'' from ''students''. Order the results by id, in descending order.
 SELECT id FROM students
 ORDER BY id DESC
 
 
      To join the two tables, specify them as a comma-separated list in the FROM clause:
SELECT customers.ID, customers.Name, orders.Name, orders.Amount
FROM customers, orders
WHERE customers.ID=orders.Customer_ID
ORDER BY customers.ID;

Result:
      id	name	name	  amount
      1	  John	Cake	  6700
      2	  David	Toy	    4500
      3	  Chloe	Book	  5000
      4	  Emily	Flowers	1800
      5	  James	Box	    3000
      
      
      Each table contains "ID" and "Name" columns, so in order to select the correct ID and Name, fully qualified names are used.
      Note that the WHERE clause "joins" the tables on the condition that the ID 
      from the customers table should be equal to the customer_ID of the orders table.

      The returned data shows customer orders and their corresponding amount.
      
      Specify multiple table names in the FROM by comma-separating them.
      
      to complete the following statement, which shows item names and the names of customers who bought the items.
SELECT customers.name, items.names 
FROM customers, items
WHERE items.seller_id =
customers.id
 
      
      
      
      
      
