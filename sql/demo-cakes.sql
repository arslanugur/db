Cakes
      A local bakery creates unique cake sets. Each cake set contains three different cakes.
      Here is the cakes table:
      
name        |calories
---------------------
apple cake  |100
banana cake |200
pound cake  |180
sponge cake |100
genoise cake|360
chiffon cake|250
opera cake  |90
cheese cake |370
            
      Тoday a customer want a cake set that has minimal calories.
      Write a query to sort the cakes by calorie count and select the first 3 cakes from the list to offer the customer.
      
      Try to combine ORDER BY and LIMIT keywords.
      
SELECT * FROM cakes ORDER BY calories LIMIT 3;
      
