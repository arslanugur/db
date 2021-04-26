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

2.1. Filtering with WHERE
2.2. Column does not exist
2.3. Functions in WHERE
2.4. Test your knowledge of WHERE
2.5. Filtering with HAVING
2.6. Row filtering with HAVING
2.7. Filtering with WHERE and HAVING
2.8. Test your knowledge of HAVING
2.9. Interrogation after SELECT
2.10. SELECT what you need
2.11. Limit the rows with TOP
2.12. Should I use ORDER BY?
2.13. Managing duplicates
2.14. Remove duplicates with DISTINCT()
2.15. UNION and UNION ALL
2.16. UNION or DISTINCT()?



3. Sub-queries and presence or absence
This chapter is an introduction to sub-queries and their potential impacts on query performance. It also examines the different methods used to determine if the data in one table is present, or absent, in a related table.

3.1. Sub-queries
3.2. Uncorrelated sub-query
3.3. Correlated sub-query
3.4. Sub-query vs INNER JOIN
3.5. Presence and absence
3.6. INTERSECT
3.7. EXCEPT
3.8. Interrogating with INTERSECT
3.9. Alternative methods 1
3.10. IN and EXISTS
3.11. NOT IN and NOT EXISTS
3.12. NOT IN with IS NOT NULL
3.13. Alternative methods 2
3.14. INNER JOIN
3.15. Exclusive LEFT OUTER JOIN
3.16. Test your knowledge

4. Query performance tuning
Students are introduced 
to how STATISTICS TIME, STATISTICS IO, indexes, and executions plans can be used in SQL Server to help analyze and tune query performance.

4.1. Time statistics
4.1. STATISTICS TIME in queries
4.1. STATISTICS TIME results
4.1. Page read statistics
4.1. STATISTICS IO: Example 1
4.1. STATISTICS IO: Example 2
4.1. STATISTICS IO comparison
4.1. Indexes
4.1. Test your knowledge of indexes
4.1. Clustered index
4.1. Execution plans
4.1. Sort operator in execution plans
4.1. Test your knowledge of execution plans
4.1. Query performance tuning: final notes
