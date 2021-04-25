# 1. SELECTion Box
# 1.2 Simple selections
It’s time to begin writing your own queries! In this first coding exercise, you will use SELECT statements to retrieve columns from a database table. You’ll be working with the eurovision table, which contains data relating to individual country performance at the Eurovision Song Contest from 1998 to 2012.
After selecting columns, you’ll also practice renaming columns, and limiting the number of rows returned.

Instruction 1
SELECT the country column FROM the eurovision table.

SELECT country 
FROM eurovision

Instruction 2
Amend your query to return the points column instead of the countrycolumn.

-- Select the points column
SELECT points 
FROM eurovision;

Instruction 3
Use TOP to change the existing query so that only the first 50 rows are returned.

-- Limit the number of rows returned
SELECT TOP(50) points 
FROM eurovision;

Instruction 4
Return a list of unique countries using DISTINCT. Give the results an alias of unique_country.

-- Return unique countries and use an alias
SELECT DISTINCT country AS unique_country 
FROM eurovision;

# 1.3 More selections
Now that you’ve practiced how to select one column at a time, it’s time to practice selecting more than one column. You’ll continue working with the eurovision table.

Instruction 1
SELECT the country and event_year columns from the eurovision table.

-- Select country and event_year from eurovision
SELECT country, event_year 
FROM eurovision;

Instruction 2
Use a shortcut to amend the current query, returning ALL rows from ALL columns in the table.

-- Amend the code to select all rows and columns
SELECT *
FROM eurovision;

Instruction 3
This time, restrict the rows to the first half using ‘PERCENT’, using the same shortcut as before to return all columns.

-- Return all columns, restricting the percent of rows returned
SELECT TOP (50) PERCENT * 
FROM eurovision;

# 1.4 Ordering and filtering
# 1.5 Order by
In this exercise, you’ll practice the use of ORDER BY using the grid dataset. It’s loaded and waiting for you! 
It contains a subset of wider publicly available information on US power outages.

Some of the main columns include:
description: The reason/ cause of the outage.
nerc_region: The North American Electricity Reliability Corporation was formed to ensure the reliability of the grid and comprises several regional entities).
demand_loss_mw: How much energy was not transmitted/consumed during the outage.

Instruction 1
Select description and event_date from grid. Your query should return the first 5 rows, ordered by event_date.

-- Select the first 5 rows from the specified columns
SELECT TOP(5) description, event_date 
FROM grid   
-- Order your results by the event_date column
ORDER BY event_date;

Instruction 2
Modify your code based on the comments provided on the right.

-- Select the top 20 rows from description, nerc_region and event_date
SELECT TOP(20) description, nerc_region, event_date
FROM grid   
-- Order by nerc_region, affected_customers & event_date  
-- Event_date should be in descending order
ORDER BY nerc_region, affected_customers, event_date DESC;

# 1.6 Where
You won’t usually want to retrieve every row in your database. You’ll have specific information you need in order to answer questions from your boss or colleagues.
The WHERE clause is essential for selecting, updating (and deleting!) data from your tables. You’ll continue working with the grid dataset for this exercise.

Instructions
Select the description and event_year columns.  Return rows WHERE the description is 'Vandalism'.

-- Select description and event_year
SELECT description, event_year 
FROM grid   
-- Filter the results
WHERE description = 'Vandalism';

# 1.7 Where again
When filtering strings, you need to wrap your value in ‘single quotes’, as you did in the previous exercise. You don’t need to do this for numeric values, but you DO need to use single quotes for date columns.
In this course, dates are always represented in the YYYY-MM-DD format (Year-Month-Day), which is the default in Microsoft SQL Server.

Instruction 1
Select the nerc_region and demand_loss_mw columns, limiting the results to those where affected_customers is greater than or equal to 500000.

-- Select nerc_region and demand_loss_mw
SELECT nerc_region, demand_loss_mw 
FROM grid 
-- Retrieve rows where affected_customers is >= 500000  
WHERE affected_customers >= 500000;

Instruction 2
Update your code to select description and affected_customers, returning records where the event_date was the 22nd December, 2013.

-- Select description and affected customers
SELECT description, affected_customers 
FROM grid   
-- Retrieve rows where the event_date was the 22nd December, 2013 
WHERE event_date = '2013-12-22';

Instruction 3
Limit the results to those where the affected_customers is BETWEEN 50000 and 150000, and order in descending order of event_date.

-- Select description, affected_customers and event date
SELECT description, affected_customers, event_date
FROM grid  
 -- The affected_customers column should be >= 50000 and <=150000   
WHERE affected_customers BETWEEN 50000  AND 150000   
-- Define the order  
ORDER BY event_date DESC;

# 1.8 Working with NULL values
A NULL value could mean ‘zero’ - if something doesn’t happen, it can’t be logged in a table. However, NULL can also mean ‘unknown’ or ‘missing’. So consider if it is appropriate to replace them in your results. NULL values provide feedback on data quality. If you have NULL values, and you didn’t expect to have any, then you have an issue with either how data is captured or how it’s entered in the database.
In this exercise, you’ll practice filtering for NULL values, excluding them from results, and replacing them with alternative values.

Instruction 1
Use a shortcut to select all columns from grid. Then filter the results to only include rows where demand_loss_mw is unknown or missing.

-- Retrieve all columns
SELECT * 
FROM grid   
-- Return only rows where demand_loss_mw is missing or unknown  
WHERE demand_loss_mw is NULL;

Instruction 2
Adapt your code to return rows where demand_loss_mw is not unknown or missing.

-- Retrieve all columns
SELECT * 
FROM grid   
-- Return rows where demand_loss_mw is not missing or unknown  
WHERE demand_loss_mw IS NOT NULL;

# 1.9 WHERE the wild things are

# 1.10 Exploring classic rock songs
It’s time to rock and roll! In this set of exercises, you’ll use the songlist table, which contains songs featured on the playlists of 25 classic rock radio stations.
First, let’s get familiar with the data.

Instruction 1
Retrieve the song, artist, and release_year columns from the songlist table.

-- Retrieve the song, artist and release_year columns
SELECT song, artist, release_year
FROM  songlist

Instruction 2
Make sure there are no NULL values in the release_year column.

-- Retrieve the song, artist and release_year columns
SELECT song, artist, release_year 
FROM songlist   
-- Ensure there are no missing or unknown values in the release_year column
WHERE release_year IS NOT NULL

Instruction 3
Order the results by artist and release_year

-- Retrieve the song,artist and release_year columns
SELECT song, artist, release_year 
FROM songlist   
-- Ensure there are no missing or unknown values in the release_year column
WHERE release_year IS NOT NULL   
-- Arrange the results by the artist and release_year columns
ORDER BY artist, release_year;

# 1.11 Exploring classic rock songs - AND/OR
Having familiarized yourself with the songlist table, you’ll now extend your WHERE clause from the previous exercise.

Instruction 1
Extend the WHERE clause so that the results are those with a release_year greater than or equal to 1980 and less than or equal to 1990.

SELECT song, artist, release_year
FROM songlist 
-- Retrieve records greater than and including 1980 
WHERE release_year >= 1980   
-- Also retrieve records up to and including 1990  
AND release_year <= 1990 
ORDER BY artist, release_year;

Instruction 2
Update your query to use an OR instead of an AND.

SELECT song, artist, release_year
FROM songlist 
-- Retrieve records greater than and including 1980 
WHERE release_year >= 1980   
-- Replace AND with OR  
OR release_year <= 1990 
ORDER BY artist, release_year;


# 1.12 Using parentheses in your queries
You can use parentheses to make the intention of your code clearer. 
This becomes very important when using AND and OR clauses, to ensure your queries return the exact subsets you need.

Instructions
Select all artists beginning with B who released tracks in 1986, but also retrieve any records where the release_year is greater than 1990.

SELECT artist, release_year, song 
FROM songlist   
-- Choose the correct artist and specify the release year
WHERE   
(artist LIKE 'B%' AND release_year = 1986)   
-- Or return all songs released after 1990  OR 
release_year > 1990   
-- Order the results
ORDER BY release_year, artist, song;


# 2. Group, strings, and counting things
# 2.1 Aggregating Data
# 2.2 Summing
Summing and counting are key ways of aggregating data, 
regardless of whether you are using a database, manipulating a spreadsheet, or using a programming language such as Python or R. 
Let’s see how to do it in T-SQL using the grid table from Chapter 1.

You’ll start by obtaining overall sums, focusing specifically on the 'MRO'region.

Instructions
Obtain a grand total of the demand_loss_mw column by using the SUM function, and alias the result as MRO_demand_loss.
Only retrieve rows WHERE demand_loss_mw is not NULL and nerc_region is 'MRO'.

-- Sum the demand_loss_mw column
SELECT SUM(demand_loss_mw) AS MRO_demand_loss 
FROM grid 
WHERE  
-- demand_loss_mw should not contain NULL values  
demand_loss_mw IS NOT NULL   
-- and nerc_region should be 'MRO';  
AND nerc_region = 'MRO';

# 2.3 Counting
Having explored the 'MRO' region, let’s now explore the 'RFC'region in more detail while learning how to use the COUNT aggregate function.

Instruction 1: Return the COUNT of the grid_id column, aliasing the result as grid_total.

-- Obtain a count of 'grid_id'
SELECT COUNT(grid_id) AS grid_total 
FROM grid;

Instruction 2: Make the count more meaningful by restricting it to records where the nerc_region is 'RFC'. Name the result RFC_count

-- Obtain a count of 'grid_id'
SELECT COUNT(grid_id) AS RFC_count
FROM grid
-- Restrict to rows where the nerc_region is 'RFC'
WHERE nerc_region = 'RFC';


# 2.4 MIN, MAX, and AVG
Along with summing and counting, you’ll frequently need to find the minimum, maximum, and average of column values. 
Thankfully, T-SQL has functions you can use to make the task easier!

Instruction 1: Find the minimum value from the affected_customers column, but only for rows where demand_loss_mw has a value. 
Name the result min_affected_customers.

-- Find the minimum number of affected customers
SELECT MIN(affected_customers) AS min_affected_customers 
FROM grid
-- Only retrieve rows where demand_loss_mw has a value
WHERE demand_loss_mw IS NOT NULL;

Instruction 2
Amend the query to return the maximum value from the same column, this time aliasing as max_affected_customers.

-- Find the maximum number of affected customers
SELECT MAX(affected_customers) AS max_affected_customers 
FROM grid
-- Only retrieve rows where demand_loss_mw has a value
WHERE demand_loss_mw IS NOT NULL;

Instruction 3
Return the average value from the affected_customers column, this time aliasing as avg_affected_customers.

-- Find the average number of affected customers
SELECT AVG(affected_customers) AS avg_affected_customers 
FROM grid
-- Only retrieve rows where demand_loss_mw has a value
WHERE demand_loss_mw IS NOT NULL;


# 2.5 Strings
# 2.6 LEN'gth of a string
Knowing the length of a string is key to being able to manipulate it further using other functions, so what better way to start the lesson?

Instructions
Retrieve the length of the description column, returning the results as description_length.

-- Calculate the length of the description column
SELECT LEN(description) AS description_length 
FROM grid;


# 2.7 Left and right
We can retrieve portions of a string from either the start of the string, using LEFT, or working back from the end of the string, using RIGHT.

Instruction 1
Retrieve the first 25 characters from the description column in the grid table. Name the results first_25_left.

-- Select the first 25 characters from the left of the description column
SELECT LEFT(description, 25) AS first_25_left 
FROM grid;

Instruction 2
Amend the query to retrieve the last 25 characters from the description. Name the results last_25_right.

-- Amend the query to select 25 characters from the right of the description column
SELECT RIGHT(description, 25) AS last_25_right 
FROM grid;

# 2.8 Stuck in the middle with you
You might be fortunate, and find that the interesting parts of your strings are at either end. 
However, chances are, you’ll want to retrieve characters from somewhere around the middle.
Let’s see how to use RIGHT, LEN, CHARINDEX AND SUBSTRING to extract the interior portion of a text string. 
The description column can contain multiple reasons for power outages in each row. 
We want to extract any additional causes of outage whenever Weather appears in the description column.

Instruction 1
You can use CHARINDEX to find a specific character or pattern within a column. 
Edit the query to return the CHARINDEX of the string 'Weather' whenever it appears within the description column.

-- Complete the query to find `Weather` within the description column
SELECT description, CHARINDEX('Weather', description) 
FROM grid
WHERE description LIKE '%Weather%';

Instruction 2
We now know where 'Weather' begins in the description column. But where does it end? 
We could manually count the number of characters, but, for longer strings, this is more work, especially when we can also find the length with LEN.

-- Complete the query to find the length of `Weather'
SELECT 
  description, 
  CHARINDEX('Weather', description) AS start_of_string,  
  LEN('Weather') AS length_of_string 
FROM grid
WHERE description LIKE '%Weather%'; 

Instruction 3
Now we use SUBSTRING to return everything after Weather for the first ten rows. 
The start index here is 15, because the CHARINDEX for each row is 8, and the LEN of Weather is 7.

-- Complete the substring function to begin extracting from the correct character in the description column
SELECT 
  TOP(10) description,   
  CHARINDEX('Weather', description) AS start_of_string,   
  LEN('Weather') AS length_of_string,   
  SUBSTRING(description,     
            15,     
            LEN(description)) AS additional_description 
FROM grid
WHERE description LIKE '%Weather%';

# 2.9 Group BY
In an earlier exercise, you wrote a separate WHERE query to determine the amount of demand lost for a specific region. 
We wouldn’t want to have to write individual queries for every region. 
Fortunately,you don’t have to write individual queries for every region. 
With GROUP BY, you can obtain a sum of all the unique values for your chosen column, all at once.

You’ll return to the grid table here and calculate the total lost demand for all regions.

Instructions
Select nerc_region and the sum of demand_loss_mw for each region.
Exclude values where demand_loss_mw is NULL.
Group the results by nerc_region.
Arrange in descending order of demand_loss.

-- Select the region column
SELECT 
  nerc_region,  
-- Sum the demand_loss_mw column  
  SUM(demand_loss_mw) AS demand_loss
FROM grid  
-- Exclude NULL values of demand_loss
WHERE demand_loss_mw IS NOT NULL  
-- Group the results by nerc_region
GROUP BY nerc_region  
-- Order the results in descending order of demand_loss
ORDER BY demand_loss DESC;


# 2.10 Having
WHERE is used to filter rows before any grouping occurs. 
Once you have performed a grouping operation, you may want to further restrict the number of rows returned. This is a job for HAVING.
In this exercise, you will modify an existing query to use HAVING, so that only those results with a sum of over 10000 are returned.

Instructions
Modify the provided query to remove the WHERE clause.
Replace it with a HAVING clause so that only results with a total demand_loss_mw of greater than 10000 are returned.

SELECT nerc_region, SUM(demand_loss_mw) AS demand_loss 
FROM grid   
-- Remove the WHERE clause
WHERE demand_loss_mw  IS NOT NULL
GROUP BY nerc_region   
-- Enter a new HAVING clause so that the sum of demand_loss_mw is greater than 10000
HAVING SUM(demand_loss_mw) > 10000
ORDER BY demand_loss DESC;


# 2.11 Grouping together
In this final exercise, you will combine GROUP BY with aggregate functions such as MIN that you’ve seen earlier in this chapter.
To conclude this chapter, we’ll return to the eurovision table from the first chapter.

Instruction 1
Use MIN and MAX to retrieve the minimum and maximum values for the place and points columns respectively.

-- Retrieve the minimum and maximum place values
SELECT 
  MIN(place) AS min_place,   
  MAX(place) AS max_place,  
  -- Retrieve the minimum and maximum points values  
  MIN(points) AS min_points,   
  MAX(points) AS max_points 
FROM eurovision;

Instruction 2: Let’s obtain more insight from our results by adding a GROUP BY clause. Group the results by country.

-- Retrieve the minimum and maximum place values
SELECT 
  MIN(place) AS min_place,   
  MAX(place) AS max_place,   
-- Retrieve the minimum and maximum points values  
  MIN(points) AS min_points,   
  MAX(points) AS max_points 
FROM eurovision  
-- Group by country
  GROUP BY country;

Instruction 3
The previous query results did not identify the country. 
Let’s amend the query, returning the count of entries per country and the country column. 
Complete the aggregate section by finding the average place for each country.

-- Obtain a count for each country
SELECT   
  COUNT(country) AS country_count,   
-- Retrieve the country column  
  country,   
-- Return the average of the Place column   
  AVG(place) AS average_place,   
  AVG(points) AS avg_points,   
  MIN(points) AS min_points,   
  MAX(points) AS max_points 
FROM eurovision 
GROUP BY country;

Instruction 4
Finally, our results are skewed by countries who only have one entry. 
Apply a filter so we only return rows where the country_count is greater than 5. 
Then arrange by avg_place in ascending order, and avg_points in descending order.

SELECT   
  country,   
  COUNT(country) AS country_count,   
  AVG(place) AS avg_place,   
  AVG(points) AS avg_points,   
  MIN(points) AS min_points,   
  MAX(points) AS max_points 
FROM eurovision 
GROUP BY country   
-- The country column should only contain those with a count greater than 5
HAVING COUNT(country) > 5   
-- Arrange columns in the correct order
ORDER BY avg_place, avg_points DESC;


# 3. Joining tables
# 3.1 Joining tables
# 3.2 Inner joins - a perfect match
Let’s use the Chinook database, which consists of tables related to an online store, to understand how inner joins work. 
The album table lists albums by multiple artists. 
The track table lists individual songs, each with a unique identifier, but also, an album_id column that links each track to an album.
Let’s find the tracks that belong to each album.

Instructions
Perform an inner join between album and track using the album_id column.

SELECT 
  track_id,  
  name AS track_name,  
  title AS album_title
FROM track  
-- Complete the join type and the common joining column
INNER JOIN album 
ON album.album_id = track.album_id;


# 3.3 Inner Join (II)
Here, you’ll continue to practice your INNER JOIN skills. 
We’ll use the album table as last time, but will join it to a new table - artist - which consists of two columns: artist_id and name.

Instructions
Select the album_id and title columns from album (the main source table name).
Select the name column from artist and alias it as artist.
Identify a common column between the album and artist tables and perform an inner join.

-- Select album_id and title from album, and name from artist
SELECT   
  album_id,  
  title,  
  artist.name AS artist  
-- Enter the main source table name
FROM album  
-- Perform the inner join
INNER JOIN artist 
ON artist.artist_id = album.artist_id;


# 3.4 Inner Join (III) - Join 3 tables
We’ve seen how to join 2 tables together - album with track, and album with artist. 
In this exercise, you’ll join all three tables to pull together a more complete result set. You’ll continue using INNER JOIN, but you need to specify more than one.
Here, note that because both track and artist contain a name column, you need to qualify where you are selecting the columns by prefixing the column name with the table name.

Instructions
Qualify the name column by specifying the correct table prefix in both cases.
Complete both INNER JOIN clauses to join album with track, and artist with album.

SELECT 
  track_id,
-- Enter the correct table name prefix when retrieving the name column from the track table  
  track.name AS track_name,  
  title as album_title, 
-- Enter the correct table name prefix when retrieving the name column from the artist table  
artist.name AS artist_name
FROM track  
-- Complete the matching columns to join album with track, and artist with album
INNER JOIN album ON album.album_id = track.album_id
INNER JOIN artist ON artist.artist_id = album.artist_id;


# 3.5 LEFT & RIGHT JOIN
# 3.6 LEFT join
An INNER JOIN shows you exact matches. What about when you want to compare all the values in one table with another, to see which rows match? 
That’s when you can use a LEFT JOIN.
A LEFT JOIN will return ALL rows in the first table, and any matching rows in the right table. 
If there aren’t any matches in the right table for a particular row, then a NULL is returned. 
This quickly lets you assess the gaps in your data, and how many you have.

Instructions
Complete the LEFT JOIN, returning all rows from the specified columns from invoiceline and any matches from invoice.

SELECT invoiceline_id, unit_price, quantity, billing_state  
-- Specify the source table
FROM invoiceline  
-- Complete the join to the invoice table
LEFT JOIN invoice
ON invoiceline.invoice_id = invoice.invoice_id;

# 3.7 RIGHT JOIN
Let’s now try some RIGHT joins. A RIGHT join will return all rows from the right hand table, plus any matches from the left hand side table.
In addition to performing a RIGHT join, you’ll also learn how to avoid problems when different tables have the same column names, by fully qualifying the column in your select statement. 
Remember, we do this by prefixing the column name with the table name.
For this exercise, we’ll return to the Chinook database from earlier in the chapter.

Instruction 1
SELECT the fully qualified column names album_id from album and name from artist. 
Then, join the tables so that only matching rows are returned (non-matches should be discarded).

-- SELECT the fully qualified album_id column from the album table
SELECT 
  album_id, 
  title, 
  album.artist_id,  
-- SELECT the fully qualified name column from the artist table  
  artist.name as artist
FROM album
-- Perform a join to return only rows that match from both tables
INNER JOIN artist ON album.artist_id = artist.artist_id
WHERE album.album_id IN (213,214)

Instruction 2
To complete the query, join the album table to the track table using the relevant fully qualified album_id column. 
The album table is on the left-hand side of the join, and the additional join should return all matches or NULLs.

SELECT   
  album.album_id,  
  title, 
   album.artist_id,  
   artist.name as artist
FROM album
INNER JOIN artist ON album.artist_id = artist.artist_id
-- Perform the correct join type to return matches or NULLS from the track table
LEFT JOIN track ON track.album_id = album.album_id
WHERE album.album_id IN (213,214)


# 3.8 UNION & UNION ALL
# 3.9 UNION ALL Check
# 3.10 Join the UNION
You can write 2 or more SELECT statements and combine the results using UNION. 
For example, you may have two different tables with similar column types. 
If you wanted to combine these into one set of results, you’d use UNION. 
You’ll see how to do this using the artist and album tables. 
In this exercise, you’ll SELECT two common columns, and then add a description column so you can tell which table the columns originated from.

Instructions
Make the first selection from the album table. Then join the results by providing the relevant keyword and selecting from the artist table.

SELECT   
  album_id AS ID,  
  title AS description,  
  'Album' AS Source  
-- Complete the FROM statement
FROM album 
-- Combine the result set using the relevant keyword
UNION
SELECT 
  artist_id AS ID,  
  name AS description,  
  'Artist'  AS Source  
-- Complete the FROM statement
FROM artist;


# 4. You've got the power
# 4.1 Creator
# 4.2 CRUD operations
# 4.3 Create tables
Say you want to create a table to consolidate some useful track information into one table. This will consist of the track name, the artist, and the album the track came from. You also want to store the track length in a different format to how it is currently stored in the track table. How can you go about doing this? Using CREATE TABLE. Recall the example from the video:

CREATE TABLE test_table(
  test_date DATE, 
  test_name VARCHAR(20), 
  test_int INT
)

Instruction 1: Create a table named ‘results’ with 3 VARCHAR columns called track, artist, and album, with lengths 200, 120, and 160, respectively.

-- Create the table
CREATE TABLE results (    
  -- Create track column    
  track VARCHAR(200),    
  -- Create artist column    
  artist VARCHAR(120),    
  -- Create album column    
  album VARCHAR(160),    
  );

Instruction 2: Create one integer column called track_length_mins.

-- Create the table
CREATE TABLE results (    
  -- Create track column    
  track VARCHAR(200),    
  -- Create artist column    
  artist VARCHAR(120),    
  -- Create album column    
  album VARCHAR(160),    
  -- Create track_length_mins    
  track_length_mins INT,    
  );

Instruction 3
SELECT all the columns from your new table. No rows will be returned, but you can confirm that the table has been created.

-- Create the table
CREATE TABLE results (  
  -- Create track column  
  track VARCHAR(200),    
  -- Create artist column  
  artist VARCHAR(120),    
  -- Create album column  
  album VARCHAR(160),  
  -- Create track_length_mins  
  track_length_mins INT,  
  );
  
-- Select all columns from the table
SELECT track, artist, album, track_length_mins 
FROM results;


# 4.4 Insert, Update, Delete
# 4.5 Insert
This exercise consists of two parts: In the first, you’ll create a new table very similar to the one you created in the previous interactive exercise. 
After that, you’ll insert some data and retrieve it.

You’ll continue working with the Chinook database here.

Instruction 1
Create a table called tracks with 2 VARCHAR columns named track and album, and one integer column named track_length_mins. 
Then, select all columns from the new table using the * notation.

-- Create the table
CREATE TABLE tracks(    
  -- Create track column    
  track VARCHAR(200),    
  -- Create album column    
  album VARCHAR(160),    
  -- Create track_length_mins column    
  track_length_mins INT
  );
-- Select all columns from the new table
SELECT * 
FROM tracks;


Instruction 2
Insert the track 'Basket Case', from the album 'Dookie', with a track length of 3, into the appropriate columns.

-- Create the table
CREATE TABLE tracks(  
  -- Create track column  
  track VARCHAR(200),   
  -- Create album column  
  album VARCHAR(160),   
  -- Create track_length_mins column  
  track_length_mins INT);
-- Complete the statement to enter the data to the table        
INSERT INTO tracks
-- Specify the destination columns
(track, album, track_length_mins)
-- Insert the appropriate values for track, album and track length
VALUES ('Basket Case', 'Dookie', 3);
-- Select all columns from the new table
SELECT *
FROM tracks;


# 4.6 Update
You may sometimes have to update the rows in a table. 
For example, in the album table, there is a row with a very long album title, and you may want to shorten it.
You don’t want to delete the record - you just want to update it in place. 
To do this, you need to specify the album_id to ensure that only the desired row is updated and all others are not modified.

Instruction 1
Select the title column from the album table where the album_id is 213.

-- Select the album
SELECT title 
FROM album 
WHERE album_id = 213;

Instruction 2
That’s a very long album title, isn’t it? Use an UPDATE statement to modify the title to 'Pure Cult: The Best Of The Cult'

-- Run the query
SELECT title 
FROM album 
WHERE album_id = 213;
-- UPDATE the album table
UPDATE album
-- SET the new title    
SET title = 'Pure Cult: The Best Of The Cult'
WHERE album_id = 213;

Instruction 3: Hit ‘Submit Answer’ to see whether or not the album title was shortened!

-- Select the album
SELECT title 
FROM album 
WHERE album_id = 213;
-- UPDATE the title of the album
UPDATE album 
SET title = 'Pure Cult: The Best Of The Cult' 
WHERE album_id = 213;
-- Run the query again
SELECT title 
FROM album ;

# 4.7 Delete
You may not have permissions to delete from your database, but it is safe to practice it here in this course!
Remember - there is no confirmation before deleting. When you execute the statement, the record(s) are deleted immediately.
Always ensure you test with a SELECT and WHERE in a separate query to ensure you are selecting and deleting the correct records. If you forget so specify a WHERE condition, you will delete ALL rows from the table.

Instruction 1: Hit ‘Submit Answer’ to run the query and view the existing data.

-- Run the query
SELECT * 
FROM album

Instruction 2: DELETE the record from album where album_id is 1 and then hit ‘Submit Answer’.

-- Run the query
SELECT * 
FROM album   
-- DELETE the record
DELETE FROM  album 
WHERE album_id = 1   
-- Run the query again
SELECT * 
FROM album;


# 4.8 Declare yourself
# 4.9 DECLARE and SET a variable
Using variables makes it easy to run a query multiple times, with different values, without having to scroll down and amend the WHERE clause each time. 
You can quickly update the variable at the top of the query instead.
This also helps provide greater security, but that is out of scope of this course.

Let’s go back to the now very familiar grid table for this exercise, and use it to practice extracting data according to your newly defined variable.

Instruction 1: DECLARE the variable @region, which has a data type of VARCHAR and length of 10.

-- Declare the variable @region, and specify the data type of the variable
DECLARE @region VARCHAR(10)

Instruction 2: SET your newly defined variable to 'RFC'.

-- Declare the variable @region
DECLARE @region VARCHAR(10)
-- Update the variable value
SET @region = 'RFC'

Instruction 3: Hit ‘Submit Answer’ to see the results!

-- Declare the variable @region
DECLARE @region VARCHAR(10)
-- Update the variable valueSET @region = 'RFC'
SELECT
  description,       
  nerc_region,       
  demand_loss_mw,      
   affected_customers
FROM grid
WHERE nerc_region = @region;


# 4.10 Declare multiple variables
You’ve seen how to DECLARE and SET set 1 variable. Now, you’ll DECLARE and SET multiple variables. There is already one variable declared, however you need to overwrite this and declare 3 new ones. The WHERE clause will also need to be modified to return results between a range of dates.

Instruction 1: Declare a new variable called @start of type DATE.

-- Declare @start
DECLARE @start DATE
-- SET @start to '2014-01-24'
SET @start = '2014-01-24'

Instruction 2: Declare a new variable called @stop of type DATE.

-- Declare @start
DECLARE @start DATE
-- Declare @stop
DECLARE @stop DATE
-- SET @start to '2014-01-24'
SET @start = '2014-01-24'
-- SET @stop to '2014-07-02'
SET @stop = '2014-07-02'

Instruction 3: Declare a new variable called @affected of type INT.

-- Declare @start
DECLARE @start DATE
-- Declare @stop
DECLARE @stop DATE
-- Declare @affected
DECLARE @affected INT
-- SET @start to '2014-01-24'
SET @start = '2014-01-24'
-- SET @stop to '2014-07-02'
SET @stop  = '2014-07-02'
-- Set @affected to 5000
SET @affected = 5000

Instruction 4
Retrieve all rows where event_date is BETWEEN @start and @stop and affected_customers is greater than or equal to @affected.

-- Declare your variables
DECLARE @start DATE
DECLARE @stop DATE
DECLARE @affected INT;
-- SET the relevant values for each variable
SET @start = '2014-01-24'
SET @stop  = '2014-07-02'
SET @affected =  5000 ;
SELECT   
  description,  
  nerc_region,  
  demand_loss_mw,  
  affected_customers
FROM grid
-- Specify the date range of the event_date and the value for @affected
WHERE event_date BETWEEN @start AND @stop
AND affected_customers >= @affected;


# 4.11 Ultimate Power
Sometimes you might want to ‘save’ the results of a query so you can do some more work with the data.
You can do that by creating a temporary table that remains in the database until SQL Server is restarted. 
In this final exercise, you’ll select the longest track from every album and add that into a temporary table which you’ll create as part of the query.

Instructions
Create a temporary table called maxtracks. Make sure the table name starts with #.
Join album to artist using artist_id, and track to album using album_id.
Run the final SELECT statement to retrieve all the columns from your new table.

SELECT  
  album.title AS album_title,  
  artist.name AS artist,  
  MAX(track.milliseconds / (1000 * 60) % 60 ) AS max_track_length_mins
-- Name the temp table #maxtracks
INTO #maxtracks
FROM album
-- Join album to artist using artist_id
INNER JOIN artist ON album.artist_id = artist.artist_id
-- Join track to album using album_id
INNER JOIN track ON album.album_id = track.album_id 
GROUP BY artist.artist_id, album.title, artist.name,album.album_id
-- Run the final SELECT query to retrieve the results from the temporary table
SELECT album_title, artist, max_track_length_mins
FROM  #maxtracks
ORDER BY max_track_length_mins DESC, artist;



