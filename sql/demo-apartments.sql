Apartments
      You want to rent an apartment and have the following table named Apartments:
      
      |id   |city        |address      |price   |status      |
      --------------------------------------------------------
      1     |Las Vegas   |A            |1000    |not rented    
      2     |Marlboro    |B            |800     |not rented
      3     |Moretown    |C            |700     |not rented
      4     |Owatonna    |D            |500     |rented
      5     |Grayslake   |E            |600     |rented
      6     |Great Neck  |F            |900     |not rented
      
      
      Write a query to output the apartments whose prices are greater than the average and are also not rented, sorted by the 'Price' column.

      Recall the AVG keyword.
SELECT * FROM Apartments 
WHERE price >
(SELECT AVG(price) FROM Apartments)
AND status = 'Not rented'
ORDER BY price;


      
