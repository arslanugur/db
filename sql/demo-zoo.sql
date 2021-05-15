Zoo
      You manage a zoo. Each animal in the zoo comes from a different country. 
      Here are the tables you have: 
      
      Animals:
      name   |type      |country_id
      -----------------------------
      Candy  |Elephant  |3  
      Pop    |Horse     |1
      Vova   |Bear      |2
      Merlin |Lion      |1
      Bert   |Tiger     |3

      Countries:
      id |country
      ------------
      1  |USA  
      2  |Russia  
      3  |India
      
      
      1) A new animal has come in, with the following details:
      name - "Slim", type - "Giraffe", country_id - 1
      
      Add him to the Animals table.
      2) You want to make a complete list of the animals for the zoo’s visitors. 
         Write a query to output a new table with each animal's name, type and country fields, sorted by countries.

      Recall INSERT and INNER JOIN keywords.
      
/* name - "Slim", type - "Giraffe", country_id - 1 */
INSERT INTO Animals VALUES('Slim', 'Giraffe', 1);
SELECT name, type, country 
FROM Animals INNER JOIN Countries 
ON Animals.country_id = Countries.id 
ORDER BY country ;




