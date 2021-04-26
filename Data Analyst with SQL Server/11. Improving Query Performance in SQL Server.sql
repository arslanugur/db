1. Introduction, Review and The Order of Things
In this chapter, students will learn how SQL code formatting, commenting, and aliasing is used to make queries easy to read and understand. 
Students will also be introduced to query processing order in the database versus the order of the SQL syntax in a query.

1.1. Introduction - Video
1.2. Formatting - player BMI
In this exercise, you are working with a team on a data analytics project, 
which has been asked to provide some statistics on NBA players to a health care company. 
You want to create a query that returns the Body Mass Index (BMI) for each player from North America

BMI = Weight(kg)/Height(cm)^2

A colleague has passed you a query he was working on:

select PlayerName, Country,
round(Weight_kg/SQUARE(Height_cm/100),2) BMI 
from Players Where Country = 'USA' 
Or Country = 'Canada'
order by BMI

To make some sense of the code, you want to structure and format it in a way that is consistent and easy to read.

Instructions
Change all SQL syntax (clauses, operators, and functions) to UPPERCASE.
Make sure all SQL syntax begins on a new line.
Add an indent to the calculated BMI column and OR statement.

the same code above

1.3. Commenting - player BMI
Adding comments is a good way to convey what the query is about or information about certain parts of the query.

The sample code is a query on the Players table that returns player name, country of origin and a calculated Body Mass Index (BMI). 
The WHERE condition is filtering for only players from North America.
You will add the following comment.

> Returns the Body Mass Index (BMI) for all North American players from the 2017-2018 NBA season

Also, you believe that ORDER BY is unnecessary in this query 
so it will be commented out and a comment added on the same line indicating it is not required.

Instructions
Create a comment block on lines 1 and 4.
Add the above comment to the block.
Comment out the ORDER BY statement and add Order by not required comment on the same line.
Add ; directly after 'Canada' to indicate the new ending of the query.

/*
Returns the Body Mass Index (BMI) for all North American players 
from the 2017-2018 NBA season
*/

SELECT PlayerName, Country,
    ROUND(Weight_kg/SQUARE(Height_cm/100),2) BMI
FROM Players 
WHERE Country = 'USA'
    OR Country = 'Canada';
--ORDER BY BMI; Order by not required


1.4. Commenting - how many Kiwis in the NBA?
You and a friend would like to know how many New Zealanders (affectionately known as Kiwis) play in the NBA. 
Your friend attempts to write a query, but it is not very well formatted and contains several errors. 
You re-write the query, but you want to keep his original for comparison and future reference.
This exercise requires you to create line comments and comment out blocks of code

Instructions
Add the line comment First attempt, contains errors and inconsistent formatting on line 2.
Block comment out your friend's query on lines 3 and 11.
Add the line comment Second attempt - errors corrected and formatting fixed on line 14.
Remove the block comment syntax from your query on lines 15 and 23.

-- Your friend's query
/*
select PlayerName, p.Country,sum(ps.TotalPoints) 
AS TotalPoints  
FROM PlayerStats ps inner join Players On ps.PlayerName = p.PlayerName
WHERE p.Country = 'New Zeeland'
Group 
by PlayerName, Country
order by Country;
*/
-- Your query
-- Second attempt - errors corrected and formatting fixed

SELECT p.PlayerName, p.Country,
	   SUM(ps.TotalPoints) AS TotalPoints  
FROM PlayerStats ps 
INNER JOIN Players p
	ON ps.PlayerName = p.PlayerName
WHERE p.Country = 'New Zealand'
GROUP BY p.PlayerName, p.Country;


1.5. Aliasing -Video 
1.6. Ambiguous column names

1.7. Aliasing - team BMI
When joining tables, we use aliases in the SELECT statement to indicate the source tables of the selected columns, 
with each column name prefixed with the table name alias.
The following query joins the Players and PlayerStats tables to return total points by PlayerName and Country for all players from Australia.

SELECT PlayerName, p.Country,
         SUM(ps.TotalPoints) AS TotalPoints  
FROM PlayerStats ps
INNER JOIN Players p
   ON ps.PlayerName = p.PlayerName
WHERE p.Country = 'Australia'
GROUP BY p.PlayerName, p.Country

Copy and paste the query into the console and select Run Code to view the results. 
The query returns an error which includes the words ... Ambiguous column name...

Fix the query and run it. What was wrong with the original query?

Instructions
---> PlayerName is in both the Players and PlayerStats tables. It requires an alias prefix.

Situation 2: 
A basketball statistician would like to know the average Body Mass Index (BMI) per NBA team, 
in particular, any team with an average BMI of 25 or more. 
To include Team in the query, you will need to join the Players table to the PlayerStats table. The query will require aliasing to:

- Easily identify joined tables and associated columns.
- Identify sub-queries.
- Avoid ambiguity in column names.
- Identify new columns.

Instructions
Alias the new average BMI column as AvgTeamBMI.
Alias the PlayerStats table as ps.
Alias the sub-query as p.
The PlayerStats table and sub-query are joining on the column PlayerName. Add the aliases to the joining PlayerName columns.

SELECT Team, 
   ROUND(AVG(BMI),2) AS AvgTeamBMI -- Alias the new column
FROM PlayerStats AS ps -- Alias PlayerStats table
INNER JOIN
		(SELECT PlayerName, Country,
			Weight_kg/SQUARE(Height_cm/100) BMI
		 FROM Players) AS p -- Alias the sub-query    
    -- Alias the joining columns
	ON p.PlayerName = ps.PlayerName 
GROUP BY Team
HAVING AVG(BMI) >= 25;


1.8. Query order - Video
1.9. Processing order
The following query returns earthquakes with a magnitude higher than 8, and at a depth of more than 500km.

SELECT Date, Country, Place, Depth, Magnitude
FROM Earthquakes
WHERE Magnitude > 8
    AND Depth > 500
ORDER BY Depth DESC;

Copy and paste the query into the console and select Run Code to view the results.
In which order is the SQL syntax processed in this query?
---> FROM, WHERE, SELECT, ORDER BY


1.10. Syntax order - New Zealand earthquakes
When executing a query, the processing order of the main SQL syntax is different from the written order in the query.
You want a simple query that returns all the recorded earthquakes in New Zealand that had a magnitude of 7.5 or higher. 
You think the query out in a sentence before creating it.

"From the Earthquakes table, filter for only rows where Country equals 'NZ' and Magnitude greater than or equal to 7.5. 
Then, select the columns Date, Place, NearestPop, and Magnitude. 
Order the final results from the largest Magnitude to the smallest Magnitude."

The sample code is arranged in the order that matches the above sentence, which is the same as the SQL syntax processing order in the database. 
You will need to reorder it so that it runs without error.

Instructions
Complete the required query using FROM, WHERE, SELECT and ORDER BY.
Rearrange the query so that the syntax is in the order that it will run without error.

/*
Returns earthquakes in New Zealand with a magnitude of 7.5 or more
*/
SELECT Date, Place, NearestPop, Magnitude
FROM Earthquakes
WHERE Country = 'NZ'
	AND Magnitude >= 7.5
ORDER BY Magnitude DESC;


1.11. Syntax order - Japan earthquakes
Your friend is impressed by your querying skills. 
She decides to create a query on her own that shows all earthquakes in Japan that were a magnitude of 8 or higher. 
She has constructed a query based on how she thought about what she requires. 
Her query will produce an error because of the incorrect ordering of the syntax. 
Also, the code requires reformatting to make it easy to read.

FROM Earthquakes 
WHERE Country = 'JP' 
AND Magnitude >= 8 
SELECT Date, Place ,NearestPop, Magnitude 
ORDER BY Magnitude DESC;

You will fix the query for her with a better coding format and correct the SQL syntax order.

Instructions
Rearrange the query with the correct syntax order in the format provided.

-- Your query
SELECT Date, 
       Place,
       NearestPop, 
       Magnitude
FROM Earthquakes
WHERE Country = 'JP' 
	AND Magnitude >= 8
ORDER BY Magnitude DESC;


1.12. Syntax order - very large earthquakes
When a query is executed it will stop at the first error it encounters and will return an error message. 
Because a query is processed in a stepped order the first error it stops at will be related to the processing order.

FROM is processed first and checks that the queried table(s) exist in the database.
WHERE is always processed after FROM if a row filtering condition is specified. Column(s) having the filtering condition applied must exist.
SELECT is only processed once the data is ready to be extracted and displayed or returned to the user.

This exercise has three queries—each contains errors. Your job is to find the errors and fix them.
Note that the red text below the query result tab is a description of the error.

Instructions 1/3
Select Run Code and look at the error produced. Fix the error and select Submit Answer.

/*
Returns the location of the epicenter of earthquakes with a 9+ magnitude
*/
-- FIXED CODE
-- Replace Countries with the correct table name
SELECT n.CountryName AS Country
	,e.NearestPop AS ClosestCity
    ,e.Date
    ,e.Magnitude
FROM Nations AS n
INNER JOIN Earthquakes AS e
	ON n.Code2 = e.Country
WHERE e.Magnitude >= 9
ORDER BY e.Magnitude DESC;

Hint
FROM cannot process a table that does not exist. 
It should be one of the three tables listed to the right of the query result tab.

Instructions 2/3
Select Run Code and look at the error produced. Fix the error and select Submit Answer.

/*
Returns the location of the epicenter of earthquakes with a 9+ magnitude
*/

-- FIXED CODE
-- Replace Magnatud with the correct column name
SELECT n.CountryName AS Country
	,e.NearestPop AS ClosestCity
    ,e.Date
    ,e.Magnitude
FROM Nations AS n
INNER JOIN Earthquakes AS e
	ON n.Code2 = e.Country
WHERE e.Magnitude >= 9
ORDER BY e.Magnitude DESC;

Hint
WHERE cannot process the column Magnatud. See the Earthquakes table for the correct column name.

Instructions 3/3
Select Run Code and look at the error produced. Fix the error and select Submit Answer.

/*
Location of the epicenter of earthquakes with a 9+ magnitude
*/
-- FIXED CODE
-- Replace City with the correct column name
SELECT n.CountryName AS Country
	,e.NearestPop AS ClosestCity
    ,e.Date
    ,e.Magnitude
FROM Nations AS n
INNER JOIN Earthquakes AS e
	ON n.Code2 = e.Country
WHERE e.Magnitude >= 9
ORDER BY e.Magnitude DESC;

Hint
SELECT cannot process the column City. See the Earthquakes table for the correct column name.


2. Filtering and Data Interrogation
This chapter introduces filtering with WHERE and HAVING and some best practices for how (and how not) to use these keywords. 
Next, it explains the methods used to interrogate data and the effects these may have on performance. 
Finally, the chapter goes over the roles of DISTINCT() and UNION in removing duplicates and their potential effects on performance.

2.1. Filtering with WHERE - Video
2.2. Column does not exist
When using WHERE as a filter condition, it is important to think about the processing order in the query. 
In this exercise, you want a query that returns NBA players with average total rebounds of 12 or more per game. 
The following formula calculates average total rebounds from the PlayerStats table;

AverageTotalRebounds = (DefenseiveRebounds + OffensiveRebounds) / GamesPlayed)

The first query in Step 1 returns an error. Select Run Code to view the error. 
The second query, in Step 2, will give you the results you want, without error, by using a sub-query.

Note that GamesPlayed is CAST AS numeric to ensure we get decimal points in our output, as opposed to whole numbers.

Instructions 1/2
Try to understand what the error is telling you when you run the first query, then comment out the query block on lines 2 and 9.
-- First query
/*
SELECT PlayerName, 
    Team, 
    Position,
    (DRebound+ORebound)/CAST(GamesPlayed AS numeric) AS AvgRebounds
FROM PlayerStats
WHERE AvgRebounds >= 12;
*/

Instructions 2/2
In the sub-query calculate average total rebounds in a new column, AvgRebounds.
Add the new column to the SELECT statement.
Apply a filter condition for 12 or more average total rebounds.

-- Second query
-- Add the new column to the select statement
SELECT PlayerName, 
       Team, 
       Position, 
       AvgRebounds -- Add the new column
FROM
     -- Sub-query starts here                             
	(SELECT 
      PlayerName, 
      Team, 
      Position,
      -- Calculate average total rebounds
     (ORebound+DRebound)/CAST(GamesPlayed AS numeric) AS AvgRebounds
	 FROM PlayerStats) tr
WHERE AvgRebounds >= 12; -- Filter rows

Hint: The columns to sum for Offensive Rebounds and Defensive Rebounds are ORebound and DRebound respectively.

2.3. Functions in WHERE
You want to know which players from the 2017-2018 NBA season went to college in Louisiana. 
You ask a friend to make the query for you. 
It looks like he overcomplicated the WHERE filter condition by unnecessarily applying string functions and, 
also, it does not give you precisely what you want because he forgot how to spell Louisiana. 
You will simplify his query to return exactly what you require.

Instructions
Select Run Code to see what your friend's query returns.
Think about why his query is not giving you exactly what you require then comment out his filter on line 7.
Add a new wildcard filter condition - Louisiana%

Hint: The WHERE filter condition is applied to the College column.

SELECT PlayerName, 
      Country, 
      College, 
      DraftYear, 
      DraftNumber 
FROM Players
-- WHERE UPPER(LEFT(College,5)) LIKE 'LOU%'
WHERE College LIKE 'Louisiana%'; -- Add the wildcard filter


2.4. Test your knowledge of WHERE
Which of the following statements regarding WHERE is FALSE?
---  Applying functions to columns in the WHERE filter condition could increase query times.
---> WHERE is processed before SELECT and FROM.
---  Calculations on columns in the WHERE filter condition could increase query times.
---  WHERE is processed before SELECT and after FROM.

2.5. Filtering with HAVING - Video
2.6. Row filtering with HAVING
In some cases, using HAVING, instead of WHERE, as a filter condition will produce the same results. 
If filtering individual or ungrouped rows then it is more efficient to use WHERE.

In this exercise, you want to know the number of players from Latin American countries playing in the 2017-2018 NBA season.

Question
Copy the following query to the console and select Run Code to view the results. 
Why should HAVING not be used as a filter condition in this query?

SELECT Country, COUNT(*) CountOfPlayers 
FROM Players
GROUP BY Country
HAVING Country 
    IN ('Argentina','Brazil','Dominican Republic'
        ,'Puerto Rico');SELECT Country, COUNT(*) CountOfPlayers 
FROM Players
GROUP BY Country
HAVING Country 
    IN ('Argentina','Brazil','Dominican Republic'
        ,'Puerto Rico');

Possible Answers
---  An aggregate function must enclose the Country column in the HAVING filter.
---> The filter is on individual rows. Using HAVING here, for filtering, could increase the time a query takes to run.
---  The query returns an error because HAVING is processed before GROUP BY.
---  If a query is using HAVING for filtering it must also use WHERE.

Instructions 2/2
Add the WHERE filter condition.
Fill in the missing two Latin American countries in the IN statement.

SELECT Country, COUNT(*) CountOfPlayers
FROM Players
-- Add the filter condition
WHERE Country
-- Fill in the missing countries
	IN ('Argentina','Brazil','Dominican Republic'
        ,'Puerto Rico')
GROUP BY Country;


2.7. Filtering with WHERE and HAVING
WHERE and HAVING can be used as filters in the same query. 
But how we use them, where we use them and what we use them for is quite different.
You want a query that returns the total points contribution of a teams Power Forwards where their total points contribution is greater than 3000.

Instructions
Apply a filter condition for only rows where position equals Power Forward (PF).
Apply a grouped row filter for total points greater than 3000.

SELECT Team, 
	SUM(TotalPoints) AS TotalPFPoints
FROM PlayerStats
-- Filter for only rows with power forwards
WHERE Position = 'PF'
GROUP BY Team
-- Filter for total points greater than 3000
HAVING SUM(TotalPoints) > 3000;

Hint:
HAVING is always processed after GROUP BY.
Use the SUM() function on the TotalPoints column for the grouped rows filter condition.

2.8. Test your knowledge of HAVING
The following query from the NBA Season 2017-2018 database returns the total points contribution, 
of a teams Centers, where total points are greater than 2500.

SELECT Team, 
    SUM(TotalPoints) AS TotalCPoints
FROM PlayerStats
WHERE Position = 'C'
GROUP BY Team
HAVING SUM(TotalPoints) > 2500;

Copy and paste the above query into the query console and select Run Code to check the results.
When using HAVING in a query which one of the following statements is FALSE?

---  When filtering a numeric column, HAVING must be used with an aggregate function, for example: SUM(), COUNT(), AVG()...
---  WHERE and HAVING can be used in the same query.
---  Use HAVING with, and after, GROUP BY.
---> HAVING and WHERE produce the same output, so it doesn't matter which one you use.

2.9. Interrogation after SELECT - Video
2.10. SELECT what you need
Your friend is a seismologist, and she is doing a study on earthquakes in South East Asia. 
She asks you for a query that returns coordinate locations, strength, depth and nearest city of all earthquakes in Papua New Guinea and Indonesia.

All the information you need is in the Earthquakes table, and your initial interrogation of the data tells you 
that the column for the country code is Country and that the Codes for Papua New Guinea and Indonesia are PG and ID respectively.

Instructions 1/2
SELECT all rows and columns from the Earthquakes table.
Look at the results of the query to determine which other columns to select.

Hint: One of the first things you learn when taking a course in SQL is SELECT star from a table.

SELECT *
FROM Earthquakes;

Instructions 2/2
Complete the query to select only the required columns and filter for only the requested countries.

Hint
In geographic information systems, Y is latitude, and X is longitude.
Earthquake strength and magnitude can be considered the same thing in this exercise.

SELECT Latitude, -- Y location coordinate column
       Longitude, -- X location coordinate column
	   Magnitude, -- Earthquake strength column
	   Depth, -- Earthquake depth column
	   NearestPop -- Nearest city column
FROM Earthquakes
WHERE Country = 'PG' -- Papua New Guinea country code
	OR Country = 'ID'; -- Indonesia country code
	
	
2.11. Limit the rows with TOP
Your seismologist friend that is doing a study on earthquakes in South East Asia has asked you to subset a query that you provided her. 
She wants two additional queries for earthquakes recorded in Indonesia and Papua New Guinea. 
The first returning the ten shallowest earthquakes and the second the upper quartile of the strongest earthquakes.

Instructions 1/2
Limit the number of rows to ten.
Order the results from shallowest to deepest.

Hint
The Depth column indicates how deep, from the earth’s surface, the earthquake is centered — the lower the number, the shallower the depth.

SELECT TOP 10 -- Limit the number of rows to ten
      Latitude,
      Longitude,
	  Magnitude,
	  Depth,
	  NearestPop
FROM Earthquakes
WHERE Country = 'PG'
	OR Country = 'ID'
ORDER BY Depth; -- Order results from shallowest to deepest

Instructions 2/2
Limit rows to the upper quartile.
Order the results from strongest to weakest earthquake.

Hint
A quartile is 25 percent
The default for ORDER BY is ASC (ascending) use DESC for descending.

SELECT TOP 25 PERCENT -- Limit rows to the upper quartile
       Latitude,
       Longitude,
	   Magnitude,
	   Depth,
	   NearestPop
FROM Earthquakes
WHERE Country = 'PG'
	OR Country = 'ID'
ORDER BY Magnitude DESC; -- Order the results


2.12. Should I use ORDER BY?
Which of the following statements is FALSE, when considering using ORDER BY in a query?
---  ORDER BY is processed after SELECT.
---  ORDER BY is useful for data interrogation and unless there is a good reason to sort the data in a query, try to avoid using it.
---> ORDER BY is only supported by Microsoft SQL Server and none of the other major database vendors.
---  ORDER BY can be used in conjunction with the TOP operator.

2.13. Managing duplicates -Video
2.14. Remove duplicates with DISTINCT()
You want to know the closest city to earthquakes with a magnitude of 8 or higher. 
You can get this information from the Earthquakes table. 
However, a simple query returns duplicate rows because some cities have experienced more than one magnitude 8 or higher earthquake.
You can remove duplicates by using the DISTINCT() clause. 
Once you have your results, you would like to know how many times each city has experienced an earthquake of magnitude 8 or higher.
Note that IS NOT NULL is being used because many earthquakes do not occur near any populated area, thankfully.

Instructions 1/3
Add the closest city and view the output of the query to confirm duplicated rows.
Hint: The column representing the closest city is neither called ClosestCity or City.

SELECT NearestPop, -- Add the closest city
        Country 
FROM Earthquakes
WHERE Magnitude >= 8
	AND NearestPop IS NOT NULL
ORDER BY NearestPop;

Instructions 2/3
Add DISTINCT() to the column representing the closest city to remove duplicates.
Add the filtering condition for earthquakes with a magnitude of 8 or more.
Hint: The >= operator is used in a WHERE filter condition to filter for values greater than or equal.

SELECT DISTINCT(NearestPop),-- Remove duplicate city
		Country
FROM Earthquakes
WHERE Magnitude >= 8 -- Add filter condition
	AND NearestPop IS NOT NULL
ORDER BY NearestPop; 

Instructions 3/3
Get the number of cities near earthquakes of magnitude 8 or more.
Add column groupings.

Hints:
The aggregate function used to get the number of earthquakes is not SUM().
DISTINCT() is not required.
The query is grouped by two columns.

SELECT NearestPop, 
       Country, 
       COUNT(NearestPop) NumEarthquakes -- Number of cities
FROM Earthquakes
WHERE Magnitude >= 8
	AND Country IS NOT NULL
GROUP BY NearestPop, Country -- Group columns
ORDER BY NumEarthquakes DESC;

2.15. UNION and UNION ALL
You want a query that returns all cities listed in the Earthquakes database. It should be an easy query on the Cities table. 
However, to be sure you get all cities in the database you will append the query to the Nations table to include capital cities as well. 
You will use UNION to remove any duplicate rows.

Out of curiosity, you want to know if there were any duplicate rows. 
If you do the same query but append with UNION ALL instead, 
and compare the number of rows returned in each query, UNION ALL will return more rows if there are duplicates.

Instructions 1/3
Add the city column from the Cities table to the first query.
Append queries using UNION
Add the column for the Nation capital to the second query.
Check how many rows were returned

Hint: The column CityName does not appear in the Nations table. Look for another column that contains the names of cities.

SELECT CityName AS NearCityName, -- City name column
	   CountryCode
FROM Cities

UNION -- Append queries

SELECT Capital AS NearCityName, -- Nation capital column
       Code2 AS CountryCode
FROM Nations;

Instructions 2/3
Now append the same queries using UNION ALL.
Add the column for the country code to the second query.

Hint: The column names for the two-digit country code are different in the Cities and Nations tables.

SELECT CityName AS NearCityName,
	   CountryCode
FROM Cities

UNION ALL -- Append queries

SELECT Capital AS NearCityName,
       Code2 AS CountryCode  -- Country code column
FROM Nations;

Instructions 3/3
Which of the following is true concerning using UNION ALL and UNION on the queries in Step 1 and Step 2. 
Run the code in the console and experiment appending queries with UNION and UNION ALL.
---  Using UNION and UNION ALL returns the same number of rows.
---  From looking at the tables, I would not expect any duplicate rows with UNION ALL.
---> More rows are returned with UNION ALL therefore, UNION must be removing duplicates.
---  More rows are returned with UNION therefore, UNION must be adding duplicates.


2.16. UNION or DISTINCT()?
When deciding whether to use DISTINCT() or UNION in a query to remove duplicate rows, 
which of the following questions would you NOT ask yourself?
---  Is there an alternative method to using DISTINCT()?
---  Will appending queries produce duplicate rows?
---  Is there an aggregate function in the SELECT statement?
---> Should I be thinking about duplicate rows because my queries never produce duplicate rows?
Hint: counting or applying another aggregate function? If so, DISTINCT() is not required. 
Use GROUP BY to return the unique rows for the aggregate column.

3. Sub-queries and presence or absence
This chapter is an introduction to sub-queries and their potential impacts on query performance. It also examines the different methods used to determine if the data in one table is present, or absent, in a related table.

3.1. Sub-queries - Video
3.2. Uncorrelated sub-query
A sub-query is another query within a query. The sub-query returns its results to an outer query to be processed.

You want a query that returns the region and countries that have experienced earthquakes centered at a depth of 400km or deeper. 
Your query will use the Earthquakes table in the sub-query, and Nations table in the outer query.

Instructions 1/2
Add the country code column to the outer query.
Add the country code column to the sub-query.
Filter for a depth of 400km or more.

Hint: The names of the country code columns in Nations and Earthquakes tables are not the same.

SELECT UNStatisticalRegion,
       CountryName 
FROM Nations
WHERE Code2 -- Country code for outer query
         IN (SELECT Country -- Country code for sub-query
             FROM Earthquakes
             WHERE Depth >= 400) -- Depth filter
ORDER BY UNStatisticalRegion;


Instructions 2/2
Question: Why is the query from Step 1 an example of an uncorrelated sub-query?
---> The sub-query does not reference the outer query.
---  The sub-query cannot be run independently of the outer query.
---  The outer query is referenced in the sub-query.
---  The sub-query is used as a WHERE filter condition for the outer query. Only uncorrelated sub-queries can be used like this.

3.3. Correlated sub-query
Sub-queries are used to retrieve information from another table, or query, that is separate to the main query.

A friend is working on a project looking at earthquake hazards around the world. 
She requires a table that lists all countries, their continent and the average magnitude earthquake by country. 
This query will need to access data from the Nations and Earthquakes tables.

Instructions 1/2
Add the average magnitude column in the sub-query.
Add the Nations country code column reference in the sub-query.

Hint:
The names of the country code columns in Nations and Earthquakes tables are not the same.
Average magnitude requires an aggregate function.

SELECT UNContinentRegion,
       CountryName, 
        (SELECT AVG(Magnitude) -- Add average magnitude
        FROM Earthquakes e 
         	  -- Add country code reference
        WHERE n.Code2 = e.Country) AS AverageMagnitude 
FROM Nations n
ORDER BY UNContinentRegion DESC, 
         AverageMagnitude DESC;
	 
Instructions 2/2
Question: Why is the query from Step 1 an example of a correlated sub-query?
---  The sub-query can be run independently of the outer query.
---  The sub-query does not reference the outer query.
---> The sub-query references the outer query.
---  ORDER BY is used to sort the results by a column in the outer query.

3.4. Sub-query vs INNER JOIN
Often the results from a correlated sub-query can be replicated using an INNER JOIN. 
Depending on what your requirements are, using an INNER JOIN may be more efficient 
because it only makes one pass through the data whereas the correlated sub-query must execute for each row in the outer query.

You want to find out the 2017 population of the biggest city for every country in the world. 
You can get this information from the Earthquakes database with the Nations table as the outer query and Cities table in the sub-query.

You will first create this query as a correlated sub-query then rewrite it using an INNER JOIN.

Instructions 1/2
Add the 2017 population column from the Cities table.
Add the outer query country code column to the sub-query.
Add the outer query table.

Hint: The country code from the Nations table is a two digit code.

SELECT
	n.CountryName,
	 (SELECT MAX(c.Pop2017) -- Add 2017 population column
	 FROM Cities AS c 
                       -- Outer query country code column
	 WHERE c.CountryCode = n.Code2) AS BiggestCity
FROM Nations AS n; -- Outer query tableSELECT
	n.CountryName,
	 (SELECT MAX(c.Pop2017) -- Add 2017 population column
	 FROM Cities AS c 
                       -- Outer query country code column
	 WHERE c.CountryCode = n.Code2) AS BiggestCity
FROM Nations AS n; -- Outer query table

Instructions 2/2
Join the Nations table to the sub-query.
Add the joining country code columns from the Nations table and sub-query.

Hint: Use an INNER JOIN between the Nations table and sub-query.

SELECT n.CountryName, 
       c.BiggestCity 
FROM Nations AS n
INNER JOIN -- Join the Nations table and sub-query
    (SELECT CountryCode, 
     MAX(Pop2017) AS BiggestCity 
     FROM Cities
     GROUP BY CountryCode) AS c
ON n.Code2 = c.CountryCode; -- Add the joining columns


3.5. Presence and absence - Video
3.6. INTERSECT
INTERSECT is one of the easier and more intuitive methods used to check if data in one table is present in another.

You want to know which, if any, country capitals are listed as the nearest city to recorded earthquakes. 
You can get this information by comparing the Nations table with the Earthquakes table.

Instructions
Add the table with country capital cities to the left query.
Add the operator that compares the two queries.
Add the city name column from the Earthquakes table.

SELECT Capital
FROM Nations -- Table with capital cities

INTERSECT -- Add the operator to compare the two queries

SELECT NearestPop -- Add the city name column
FROM Earthquakes;


3.7. EXCEPT
EXCEPT does the opposite of INTERSECT. It is used to check if data, present in one table, is absent in another.
You want to know which countries have no recorded earthquakes. 
You can get this information by comparing the Nations table with the Earthquakes table.

Instructions
Add the country code column from the Nations table.
Add the operator that compares the two queries.
Add the table with country codes to the right query.

SELECT Code2 -- Add the country code column
FROM Nations

EXCEPT -- Add the operator to compare the two queries

SELECT Country 
FROM Earthquakes; -- Table with capital cities

3.8. Interrogating with INTERSECT
INTERSECT and EXCEPT are very useful for data interrogation.

The Earthquakes and NBA Season 2017-2018 databases both contain information on countries and cities. 
You are interested to know which countries are represented by players in the 2017-2018 NBA season and 
you believe you can get the results you require by querying the relevant tables across these two databases.

Use the INTERSECT operator between queries, but be careful and think about the results. 
Although both tables contain a country name column to compare, these are separate databases and the data may be stored differently.

Instructions 1/2
INTERSECT CountryName from a table in the Earthquakes database and Country from a table in the NBA Season 2017-2018 database.

Hint
The right query table is Players from the NBA Season 2017-2018 database.
The Earthquakes table, from the Earthquakes database, is not required for this exercise.

SELECT CountryName 
FROM Nations -- Table from Earthquakes database

INTERSECT -- Operator for the intersect between tables

SELECT Country
FROM Players; -- Table from NBA Season 2017-2018 database

Instructions 2/2
Question
With one exception, all NBA teams are USA based, so why does USA not appear in the results? Are there no Americans playing in the NBA?
To help get your answer, use the two queries below;

- Delete the query in the query console.
- Copy and paste one of the queries into the query console.
- Select Run Code to view the results.
- Repeat steps 1 to 4 for the other query.

SELECT * 
FROM Nations
WHERE CountryName LIKE 'U%'

SELECT *
FROM Players
WHERE Country LIKE 'U%'SELECT *
FROM Players
WHERE Country LIKE 'U%'

---  The outer query should be using the Code3 column from the Nations table, not CountryName.
---> The values do not match. In the Nations table, the value for country name is stored as United States of America, and in the Players table, the value is stored as USA.
---  The original query contains filters on the Nations and Players tables for countries other than the USA.
---  INTERSECT is not the correct operator to use. The correct operator to use for this question is EXCEPT.

3.9. Alternative methods 1 - Video
3.10. IN and EXISTS
You want to know which, if any, country capitals are listed as the nearest city to recorded earthquakes. 
You can get this information using INTERSECT and comparing the Nations table with the Earthquakes table. 
However, INTERSECT requires that the number and order of columns in the SELECT statements must be the same between queries and 
you would like to include additional columns from the outer query in the results.

You attempt two queries, each with a different operator that gives you the results you require.

Instructions 1/2
Add the 2017 country population and capital city name columns to the outer query.
Add the operator to compare the outer query with the sub-query.

Hint: The outer query is on the Nations table.

-- First attempt
SELECT CountryName,
	   Pop2017, -- 2017 country population
	   Capital, -- Capital city
	   WorldBankRegion
FROM Nations
WHERE Capital IN -- Add the operator to compare queries
       (SELECT NearestPop 
	    FROM Earthquakes);
	    
Instructions 2/2
Update the query with the 2016 population instead of the 2017 population.
Add the operator to compare the outer query with the sub-query.
Add the two city name columns, being compared, in the sub-query.

Hint
The Earthquakes table is aliased as e and the column containing city names is NearestPop.
The two columns being compared contain city names and not country codes.

-- Second attempt
SELECT CountryName,   
	   Capital,
       Pop2016, -- 2016 country population
       WorldBankRegion
FROM Nations AS n
WHERE EXISTS -- Add the operator to compare queries
	  (SELECT 1
	   FROM Earthquakes AS e
	   WHERE n.Capital = e.NearestPop); -- Columns being compared
	   
	   
3.11. NOT IN and NOT EXISTS
NOT IN and NOT EXISTS do the opposite of IN and EXISTS respectively. 
They are used to check if the data present in one table is absent in another.

You are interested to know if there are some countries in the Nations table that do not appear in the Cities table. 
There may be many reasons for this. For example, all the city populations from a country may be too small to be listed,
or there may be no city data for a particular country at the time the data was compiled.

You will compare the queries using country codes.

Instructions 1/2
Add the operator to compare the outer query with the sub-query.
Add the country code column to the sub-query.

SELECT WorldBankRegion,
       CountryName
FROM Nations
WHERE Code2 NOT IN -- Add the operator to compare queries
	(SELECT CountryCode -- Country code column
	 FROM Cities);

Instructions 2/2
Add the country capital column to the outer query.
Add the operator to compare the outer query with the sub-query.
Add the two country code columns being compared in the sub-query.

Hint: The Nations table is aliased as n and the column containing country code is Code2.

SELECT WorldBankRegion,
       CountryName,
	   Code2,
       Capital, -- Country capital column
	   Pop2017
FROM Nations AS n
WHERE NOT EXISTS -- Add the operator to compare queries
	(SELECT 1
	 FROM Cities AS c
	 WHERE n.Code2 = c.CountryCode); -- Columns being compared
	 

3.12. NOT IN with IS NOT NULL
You want to know which country capitals have never been the closest city to recorded earthquakes. 
You decide to use NOT IN to compare Capital from the Nations table, in the outer query, with NearestPop, from the Earthquakes table, in a sub-query.

Instructions 1/2
Add the country capital name column to the outer query.
Add the city name column to the sub-query.
Check how many rows the query returns. Does this mean that earthquakes have been recorded near every capital city in the world?

Hint: The column name for cities nearest to recorded earthquakes is NearestPop.

SELECT WorldBankRegion,
       CountryName,
       Capital -- Capital city name column
FROM Nations
WHERE Capital NOT IN
	(SELECT NearestPop -- City name column
	 FROM Earthquakes);

Instructions 2/2
The column in the SELECT statement of the sub-query contains NULL values and will require a filter to remove the NULL values from the query.

Add the WHERE filter condition to the sub-query to get the query working correctly.

Hint: The column in the WHERE filter condition is the same as the column specified in the SELECT statement of the sub-query.

SELECT WorldBankRegion,
       CountryName,
       Capital
FROM Nations
WHERE Capital NOT IN
	(SELECT NearestPop
     FROM Earthquakes
     WHERE NearestPop IS NOT NULL); -- filter condition
     
3.13. Alternative methods 2 - Video
3.14. INNER JOIN
An insurance company that specializes in sports franchises has asked you to assess the geological hazards of cities hosting NBA teams. 
You believe you can get this information by querying the Teams and Earthquakes tables across the Earthquakes and NBA Season 2017-2018 databases respectively. ,
Your initial query will use EXISTS to compare tables. The second query will use a more appropriate operator.

Instructions 1/3
Add the table for the outer query.
Add the operator to compare the outer query with the sub-query.
Add the table for the sub-query.
Check the results. Only columns from the Teams table are returned.

Hint: Which methods use a WHERE filter condition to check for the presence of data in two related tables?

-- Initial query
SELECT TeamName,
       TeamCode,
	   City
FROM Teams AS t -- Add table
WHERE EXISTS -- Operator to compare queries
      (SELECT 1 
	  FROM Earthquakes AS e -- Add table
	  WHERE t.City = e.NearestPop);
	  
	  
Instructions 2/3
Something doesn't look right. You'll need columns from the Earthquakes and Teams tables to makes sense of the results.

Add the place description and country code where the earthquake occurred.
Add the operator to compare the tables.

Hint:
Which operator allows you to return columns from any of the tables being compared?
The place description column provides additional information about the location of the earthquake, such as if it was near the coastline of a certain region or country.

-- Second query
SELECT t.TeamName,
       t.TeamCode,
	   t.City,
	   e.Date,
	   e.Place, -- Place description
	   e.Country -- Country code
FROM Teams AS t
INNER JOIN Earthquakes AS e -- Operator to compare tables
	  ON t.City = e.NearestPop
	  
	  
Instructions 3/3
Question: In this exercise, what does the INNER JOIN help you to determine that EXISTS could not?
---  Queries that use EXISTS are slower than queries that use INNER JOIN.
---  The INNER JOIN returned two rows, so there must be duplicate rows in the Teams table.
---  The NBA team based in San Antonio, USA has a high risk of earthquake hazards.
---> The earthquakes occurred in San Antonio, Chile, not San Antonio, USA.


3.15. Exclusive LEFT OUTER JOIN
An exclusive LEFT OUTER JOIN can be used to check for the presence of data in one table that is absent in another table. 
To create an exclusive LEFT OUTER JOIN the right query requires an IS NULL filter condition on the joining column.

Your sales manager is concerned that orders from French customers are declining. 
He wants you to compile a list of French customers that have not placed any orders so he can contact them.

Instructions 1/2
Add the joining operator between the Customers and Orders tables.
Add the joining columns from the Customers and Orders tables.

-- First attempt
SELECT c.CustomerID,
       c.CompanyName,
	   c.ContactName,
	   c.ContactTitle,
	   c.Phone 
FROM Customers c
LEFT OUTER JOIN Orders o -- Joining operator
	ON c.CustomerID = o.CustomerID -- Joining columns
WHERE c.Country = 'France';


Instructions 2/2
Add the filter condition to turn the query into an exclusive LEFT OUTER JOIN

Hint
If the filter condition is IS NOT NULL, you would be checking for customers present in the orders table, 
but the requirement is for customers absent from the orders table.

-- Second attempt
SELECT c.CustomerID,
       c.CompanyName,
	   c.ContactName,
	   c.ContactTitle,
	   c.Phone 
FROM Customers c
LEFT OUTER JOIN Orders o
	ON c.CustomerID = o.CustomerID
WHERE c.Country = 'France'
	AND o.CustomerID IS NULL; -- Filter condition
	

3.16. Test your knowledge
The Venn diagram below describes which method used to check whether the data in one table is present, or absent, in a related table?

>         Left Query or Outer Query   V   Right Query or Sub-Query

The Earthquakes database is available for you to test scenarios in the query console.

Instructions
Possible Answers
---  EXISTS
---  inclusive LEFT OUTER JOIN
---  INTERSECT
---> exclusive LEFT OUTER JOIN

EXISTS checks for data in one table that is present in a related table. In a Venn diagram, the intersection of the two circles would be highlighted.
The results of an inclusive LEFT OUTER JOIN would contain all rows from the left query regardless of whether there is a match in the right query. In a Venn diagram, the entire left circle would be highlighted.
INTERSECT checks for data in one table that is present in a related table. In a Venn diagram, the intersection of the two circles would be highlighted.

An exclusive LEFT OUTER JOIN checks for data in one table that is absent in a related table. It does this by using IS NULL in a WHERE filter condition of the right query to restrict it to rows that do not match in the left query.An exclusive LEFT OUTER JOIN checks for data in one table that is absent in a related table. 
It does this by using IS NULL in a WHERE filter condition of the right query to restrict it to rows that do not match in the left query.


4. Query performance tuning
Students are introduced 
to how STATISTICS TIME, STATISTICS IO, indexes, and executions plans can be used in SQL Server to help analyze and tune query performance.

4.1. Time statistics - Video
In this final chapter, we'll introduce some tools and commands available in SQL Server to help analyze and tune query performance.

SQL Server Management Studio
Most SQL Server practitioners use SQL Server Management Studio, or SSMS for short, for creating and editing queries. 
The tools and commands discussed in this chapter are accessed within SSMS. 
The SSMS graphics are from the 2017 version and may vary slightly from other releases.

-STATISTICS TIME in SSMS
Throughout this course, we’ve heard terms like “increase the time it takes for a query to run.” 
In SQL Server there are many tools and commands available to quantify and measure performance. 
One way to measure query time is with the command STATISTICS TIME which reports the milliseconds, required to parse, compile, 
and execute a query. In SSMS, if settings are set to Results to Grid, the statistics are displayed in the Messages tab to the right of the Results tab.

-SQL Server Execution Times
The output contains several time statistics, However, we’ll only discuss CPU time and elapsed time under the heading SQL Server Execution Times. 
"CPU time" is the actual time taken up by the database server processors 
to process the query and "elapsed time" is the total duration of the query from execution to returning the complete results to back to us.

-Example: query 1
Let’s look at STATISTICS TIME in action. 
In this example, our query returns Region, Country, and Capital, where the 2017 population of a capital city is more than one million. 
This query uses two sub-queries in a WHERE filter condition -- first, to check for the presence of the capital city in the Cities table, 
and second, to return cities with populations of more than one million.

To get the time statistics, we first need to run SET STATISTICS TIME ON before executing our query. 
Looking at the statistics output both CPU and elapsed time are close to 400 milliseconds.

-Example: query 2
We can re-write the query and replace the two sub-queries in the WHERE filter condition with EXISTS and one sub-query. 
Because STATISTICS TIME is already on, we do not need to rerun it.

-Example: query 2
The output shows a significant improvement in the time. The database processors spent less than one millisecond on the query and total execution time was only two milliseconds. Once we’ve completed our assessment of the time statistics, we turn it off by running SET STATISTICS TIME OFF.

-Comparing queries
When we compare our two examples, the first query was slower than the second because of the two sub-queries in the WHERE filter condition. In the first query, each sub-query must collect all the results first before further processing whereas the second query uses EXISTS which stops searching the sub-query when there is a match -- much more efficient.

-Elapsed time vs. CPU time
When analyzing query time statistics, the elapsed time may vary because it is sensitive to several factors, 
including the load on the server and network bandwidth between the database server and a query editing application like SSMS. 
The CPU time is less sensitive and will generally show little variation. 
One issue with using the CPU time is when the server processors are running in parallel. 
In this case, it is possible that the CPU time is multiplied 
by the number of processors making it appear significantly higher than the elapsed time 
and therefore making it less useful for query performance tuning. 
In most cases, the desired outcome is to tune a query to return the results to us as fast as possible. 
Therefore, the elapsed time is the best measure to use.

-Taking an average
Because of variability, particularly in the elapsed time, 
it is good practice to execute a query multiple times and take an average of time measurements.

4.2. STATISTICS TIME in queries
A friend is writing a training course on how the command STATISTICS TIME can be used to tune query performance 
and asks for your help to complete a presentation. He requires two queries 
that return NBA team details where the host city had a 2017 population of more than two million.

NBA team details can be queried from the NBA Season 2017-2018 database 
and city populations can be queried by adding in tables from the Earthquakes database.

Each query uses a different filter on the Teams table.

Query 1: Filters the Teams table using IN and three sub-queries
Query 2: Filters the Teams table using EXISTS

Instructions 1/4
Turn on STATISTICS TIME.

SET STATISTICS TIME ON -- Turn the time command on

Instructions 2/4
For Query 1:
Add the filter operator for each sub-query.
Add the table from the Earthquakes database to the first query.

Hint: Which table from the Earthquakes database contains city names and their 2017 populations?
-- Query 1
SELECT * 
FROM Teams
-- Sub-query 1
WHERE City IN -- Sub-query filter operator
      (SELECT CityName 
       FROM Cities) -- Table from Earthquakes database
-- Sub-query 2
   AND City IN -- Sub-query filter operator
	   (SELECT CityName 
	    FROM Cities
		WHERE CountryCode IN ('US','CA'))
-- Sub-query 3
    AND City IN -- Sub-query filter operator
        (SELECT CityName 
         FROM Cities
	     WHERE Pop2017 >2000000);
	     

Instructions 3/4
For Query 2:
Add the filter operator for the sub-query.
Add the two city name columns being compared to the sub-query.

Hint: The column in the Teams table containing city names is City

-- Query 2
SELECT * 
FROM Teams AS t
WHERE EXISTS -- Sub-query filter operator
	(SELECT 1 
     FROM Cities AS c
     WHERE t.City = c.CityName -- Columns being compared
        AND c.CountryCode IN ('US','CA')
          AND c.Pop2017 > 2000000);
	  
Instructions 4/4
Turn off STATISTICS TIME.

SET STATISTICS TIME OFF -- Turn the time command off

4.3. STATISTICS TIME results
In the previous exercise, the STATISTICS TIME command was used on two different queries. 
The following table summarizes an analysis of the elapsed time statistics for each query.

Query	Details							Average elapsed time (ms)
1	Filters the Teams table using IN and three sub-queries	20
2	Filters the Teams table using EXISTS			3

What conclusion can you make from this summary?
---  None. CPU time is a better measure to compare queries.
---> The second query that uses EXISTS is more efficient.
---  None. Elapsed time should be reported as a minimum, not an average.
---  The database server processors must be running in parallel.

Hints:
-Generally, elapsed time is the best measure to compare query times because it reports the total duration of the query, 
from execution to returning the complete results. 
CPU time measures the time the database server processors spent on the query only.
-The WHERE filter condition on the Teams table requires all three sub-queries to be processed whereas EXISTS only processes one.
-Elapsed time will vary because it is sensitive to several factors including load on the server and network bandwidth; 
therefore it is good practice to take an average.
-CPU time, and not elapsed time, may indicate if server processors are running in parallel.

4.4. Page read statistics - Video
4.5. STATISTICS IO: Example 1
Your sales company has just taken on a new regional manager for Western Europe. 
He has asked you to provide him daily updates on orders shipped to some key Western Europe capital cities. 
As this data is time sensitive, you want a robust query that is tuned to return the results as quickly as possible.

You initially decide on a query that uses two sub-queries: 
one in the SELECT statement to get the count of orders and one using a filter condition with an IN operator.

You will turn on the STATISTICS IO command to review the page read statistics.

SET STATISTICS IO ON -- Turn the IO command on

Instructions 2/3
Add the table used to count the number of orders.
Add the filter operator for the second sub-query.

-- Example 1
SELECT CustomerID,
       CompanyName,
       (SELECT COUNT(*) 
	    FROM Orders AS o -- Add table
		WHERE c.CustomerID = o.CustomerID) CountOrders
FROM Customers AS c
WHERE CustomerID IN -- Add filter operator
       (SELECT CustomerID 
	    FROM Orders 
		WHERE ShipCity IN
            ('Berlin','Bern','Bruxelles','Helsinki',
			'Lisboa','Madrid','Paris','London'));
			
Question
From the STATISTICS IO output below, how many data pages from the Orders table were read from memory to complete the query?

Table 'Customers'. Scan count 1, logical reads 2, physical reads 0,...
Table 'Orders'. Scan count 2, logical reads 32, physical reads 0,...

---> 22

4.6. STATISTICS IO: Example 2
In the previous exercise, you were asked you to provide a new regional manager daily updates on orders shipped to Western Europe capital cities. You initially created a query that contained two sub-queries. You decide to do a rewrite and use an INNER JOIN.

The STATISTICS IO command is turned on. You will need to turn it off after completing the query.

Instructions 1/3
Add the join operator.
Add the shipping destination city column in the filter condition.

-- Example 2
SELECT c.CustomerID,
       c.CompanyName,
       COUNT(o.CustomerID)
FROM Customers AS c
INNER JOIN Orders AS o -- Join operator
    ON c.CustomerID = o.CustomerID
WHERE o.ShipCity IN -- Shipping destination column
     ('Berlin','Bern','Bruxelles','Helsinki',
	 'Lisboa','Madrid','Paris','London')
GROUP BY c.CustomerID,
         c.CompanyName;
	 
	 
SET STATISTICS IO OFF -- Turn the IO command off


Instructions 3/3
Question:
From the STATISTICS IO output below, how many data pages from the Orders table were read from memory to complete the query?

Table 'Customers'. Scan count 1, logical reads 2, physical reads 0,...
Table 'Orders'. Scan count 2, logical reads 16, physical reads 0,...
---> 16


4.7. STATISTICS IO comparison
Using the STATISTICS IO outputs from the example queries in the previous two exercises, what might you conclude?

Example 1
Table 'Customers'. Scan count 1, logical reads 2, physical reads 0,....
Table 'Orders'. Scan count 2, logical reads 32, physical reads 0,...

Example 2
Table 'Customers'. Scan count 1, logical reads 2, physical reads 0,....
Table 'Orders'. Scan count 2, logical reads 16, physical reads 0,...

---> The Example 2 query will run faster than the Example 1 query.
Logical reads are a measure of the number of the 8-kilobyte pages read from memory to process and return the results of your query. 
In general, the more pages that need to be read the slower your query will run.

4.8. Indexes - Video
4.9. Test your knowledge of indexes
Which of the following statements about indexes is FALSE?
---  Clustered and nonclustered indexes are applied to table columns.
---  Indexes are used to locate data quickly without having to scan the entire table.
---> Clustered and nonclustered indexes are applied to table rows.
---  A dictionary is a good analogy for a clustered index.

Hints: 
A query that uses an index on a table will go directly to the data pages that meet a filter condition, 
and An entire table will be scanned if it does not have an index.


4.10. Clustered index
Clustered indexes can be added to tables to speed up search operations in queries. 
You have two copies of the Cities table from the Earthquakes database: one copy has a clustered index on the CountryCode column. 
The other is not indexed.

You have a query on each table with a different filter condition:

Query 1: Returns all rows where the country is either Russia or China.
Query 2: Returns all rows where the country is either Jamaica or New Zealand.

Instructions 1/3
Add the two country codes to the filter condition for Query 1.

Hint:
The country code for Russia is RU.
Use this example query to find a two digit country code from the Nations table; 
SELECT Code2 
FROM Nations
WHERE CountryName = 'Russia'

-- Query 1
SELECT *
FROM Cities
WHERE CountryCode = 'RU'  -- Country code
		OR CountryCode = 'CN'  -- Country code
		
-- Query 2
SELECT *
FROM Cities
WHERE CountryCode IN ('JM','NZ')  -- Country codes

Instructions 3/3
Question: For these two queries, what conclusion could you make using the following output from the STATISTICS IO command?

Query 1
4694 results returned
Table 'Cities'. ..., logical reads 274, ... ,

Query 2
212 results returned
Table 'Cities'. ..., logical reads 10, ... ,

---> Query 2 accesses a clustered index because logical reads indicates fewer data pages were accessed compared to Query 1
A clustered index will reduce the number of logical reads because the index will direct the query to the table data pages 
that meet the filter condition. Without a clustered index, all pages are scanned.

A query that does not access a clustered index will make the same number of logical reads regardless of how many rows are returned.
A query that does not access a clustered index will make the same number of logical reads regardless of the filter condition.
A query that is accessing a clustered index will likely have fewer logical reads than one that is not regardless of how many rows are returned.

4.11. Execution plans - Video
4.12. Sort operator in execution plans
Execution plans can tell us if and where a query used an internal sorting operation. 
Internal sorting is often required when using an operator in a query that checks for and removes duplicate rows.

You are given an execution plan of a query that returns all cities listed in the Earthquakes database. 
The query appends queries from the Nations and Cities tables. 
Use the following execution plan to determine if the appending operator used is UNION or UNION ALL

Instructions
Add the operator that the execution plan indicates was used to append the queries.

Hint: Apart from two Table Scans, what other operators does the execution plan show was used?

SELECT CityName AS NearCityName,
	   CountryCode
FROM Cities

UNION -- Append queries

SELECT Capital AS NearCityName,
       Code2 AS CountryCode
FROM Nations;


4.13. Test your knowledge of execution plans
Which one of the following is NOT information you can get from an execution plan in SQL Server?
---  If the query used a table with an index
---> The total duration of the query, in milliseconds, from execution to returning the complete results
---  The location and relative costs of sorting operations
---  The types of joins used

Hints:
-Execution plans can indicate if a query used an index on a table.
-An execution plan does not provide information about the total duration a query takes to complete. 
You can, however, get this information from other SQL query performance tuning tools and commands, such as STATISTICS TIME.
-Execution plans can indicate if and where sort operations are used and their relative costs.
-Execution plans can indicate if and where join operations are used and the type of join.

4.14. Query performance tuning: final notes
1. Query performance tuning: final notes
We'll complete this chapter with some final notes on tools and commands that are available with SQL Server to help analyze and tune query performance.

2. Final notes
In SQL Server time statistics are commonly reported in milliseconds. In the examples and exercises presented in this chapter, 
we compared queries and said that based on the differences in time one would likely run slower or faster than the other. 
In reality, the time differences reported in the examples and exercises would be unnoticeable. 
In the real world, it would not be uncommon to work with large complex queries that run for ten minutes, one hour or more. 
This is where utilizing time statistics for query tuning performance is invaluable.

3. Final notes
This chapter provided a brief overview of query statistics, indexes, and execution plans. 
All of these are advanced topics with many entire books and websites devoted to each of these and other query performance tuning tools and commands. 
The use of SQL Server tools and commands discussed in this chapter may require elevated levels of database permissions. 
We recommend communicating with your database administrator about your requirements before starting a project that may require analyzing query performance. 
When trying to tune query performance with any of the tools and commands available in SQL Server, don’t just rely on one. 
Each one can provide a different insight, and often they complement one another.

