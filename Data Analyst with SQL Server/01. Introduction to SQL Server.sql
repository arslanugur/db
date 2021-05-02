"""A mission critical assignment is depending on your SQL coding skills. 
   You’ve been given some code to fix. 
   It is giving the results you need but it’s running too slow, and it’s poorly formatted making it hard to read. 
   The deadline is tomorrow. You’ll need to reformat the code and try different methods to improve performance. 
   The pressure is on!!! 
   In this course we’ll be using SQL on real world datasets, from sports and geoscience, to look at good coding practices 
   and different ways how we can can improve the performance of queries to achieve the same outcome."""

# 1. SELECTion Box
SQL
Most of the world's data live in databases, so learning how to access 
and extract insights from these data is an essential skill for any data scientist. 
SQL, or S-Q-L, stands for Structured Query Language, and is the native language for working with databases.

3. SQL Server & Transact-SQL
SQL Server is a popular relational database system developed by Microsoft. 
Transact-SQL, or T-SQL, is Microsoft's implementation of SQL, with additional functionality. 
In this course, you will master the fundamentals of T-SQL and become prepared to work with SQL Server databases. 
You'll do this by writing queries, or statements.

4. Let's get started!
Let's get started!

5. Querying 101
Think of going to the supermarket - we have a store full of goods - that's our database. 
We want to fill our cart with products, and those products are our query results. 
Unlike the supermarket, we can't physically retrieve our data and manipulate it, so we write queries to make this happen. 
The key term when retrieving data from tables is SELECT.

6. Anatomy of a simple SELECT query
SELECT statements specify what we want to retrieve from a table. The simplest query selects one column, from one table. 
In this query, we select the description column, from the table 'grid'. Note the semicolon which denotes the end of the query. 
The other keyword you will always need is FROM - to specify the location of the source table. 
Here are the results. By default, the query returns every row in the selected column.

7. Selecting more than one column
You can select multiple columns, separating each column name with a comma. 
However,you don't need a comma for the final column selected before 'FROM'.

8. Query formatting
Here are 2 similar queries, with different layouts. The top query shows all the columns to be selected in one line. 
The bottom query shows each selected column on a new line. The results of both queries will be identical. 
We will mainly use the bottom layout throughout the course. 
Keeping keywords such as SELECT and FROM in uppercase, and table and column names in lower case, makes queries easier to read.

9. Select TOP ()
Instead of returning every row, we can use TOP() to limit the number of rows returned. 
Specify the number of rows to return between the brackets. 
You can also specify a percentage of rows to return using TOP N PERCENT, where N is the percent of rows to return. 
Using SELECT with TOP is a good way to get a quick view of the contents of a table.

10. Select DISTINCT
Use SELECT DISTINCT to return a list of unique values from a column. 
If you use SELECT DISTINCT with two or more columns, you'll return each unique combination of values.

11. Select *
Use SELECT, followed by the star, or asterisk key, to return all the rows and columns in a table. 
This is fine for quick exploration of small tables, but not for very large tables or production code. 
It's better to explicitly SELECT columns so that your queries produce reliable outputs.

12. Aliasing column names with AS
You can rename, or ALIAS, a column to make your results more meaningful. 
Simply select the column, followed by AS, and then your desired column name. 
Note how demand_loss_mw is returned as lost_demand, while description is returned as cause_of_outage.

# 1.2 Simple selections
It’s time to begin writing your own queries! 
In this first coding exercise, you will use SELECT statements to retrieve columns from a database table. 
You’ll be working with the eurovision table, 
which contains data relating to individual country performance at the Eurovision Song Contest from 1998 to 2012.
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
Now that you’ve practiced how to select one column at a time, it’s time to practice selecting more than one column. 
You’ll continue working with the eurovision table.

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
1. Ordering and Filtering
We've seen how to limit the number of rows returned using TOP. 
Now, we'll learn more advanced filtering and sorting, using WHERE and ORDER BY.

2. Order! Order!
Tables comprise of rows and columns, and you will usually see your query results displayed in a tabular format. 
But we should bear in mind that queries return specific SETS of data that meet the conditions we specify, and that sets have no default order.
There is no guarantee our query will return the results in the same order each time. However, we can make this happen using ORDER BY.

3. Order by - ascending order
To order our query results, we write ORDER BY below FROM, then list the columns we want to sort by. 
Here, we sort by year_intro, then the product_id column. 
Notice rows 4-6, and 9 -10, have the same values in the year_intro column, so the product_id column determines their final row position 
We can ORDER BY any column - including columns that do not appear in the SELECT part of the query.

4. Order by - descending order
Here we add DESC after the year_intro column in the ORDER BY clause. This sorts the results in descending order.

5. Order by - multiple columns, different directions
We can sort by multiple columns. 
On the left,the columns are first sorted by year_intro in descending order, and then channels in ascending order. 
Year_intro is listed first in the ORDER BY clause, so it takes precedence when sorting the rows. 
Then the channels column is sorted in ascending order, for each year. On the right, both columns are sorted in descending order.

6. Ordering text
We can also order string or text fields. On the left we see name_alias sorted from A-Z, and from Z-A on the right.

7. Applying criteria to filter results
You won't usually want to return all the rows in your table. You will have specific information you need to extract. 
For this, you need to use the WHERE clause, which we place underneath the FROM section of the query.

8. The WHERE clause
We use the WHERE clause to ensure we only return rows that meet our desired criteria, as shown in the following examples. 
We can filter based on numeric values, and also strings or dates. 
We use single quotes to specify the text or date value we want to use as our filtering criteria. 
As with ORDER BY, we can use a column that is not in the main SELECT statement, as part of our WHERE clause.

9. Not equal
You can test for non-equality using the left and right arrows together.

10. Between
You can use BETWEEN to return values in a range. This is inclusive - this query will return every available value from 20 right through to 30. 
You can negate this by prefacing BETWEEN with 'NOT', meaning these values will be excluded from the results.

11. What is NULL?
NULLs occur when there is no value for a particular field, for one or more records. 
Some columns are not allowed to have missing values. However, it may be perfectly valid for other columns to contain NULLs. 
A missing value is not necessarily a zero value, and we may need to be aware of the 'missingness' of the record - NULLS help highlight gaps in our data.

12. Working with NULLs
It's very useful to know how to retrieve NULLS, using IS NULL and how to filter them out, using IS NOT NULL.



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
You won’t usually want to retrieve every row in your database. 
You’ll have specific information you need in order to answer questions from your boss or colleagues.
The WHERE clause is essential for selecting, updating (and deleting!) data from your tables. 
You’ll continue working with the grid dataset for this exercise.

Instructions
Select the description and event_year columns.  Return rows WHERE the description is 'Vandalism'.

-- Select description and event_year
SELECT description, event_year 
FROM grid   
-- Filter the results
WHERE description = 'Vandalism';

# 1.7 Where again
When filtering strings, you need to wrap your value in ‘single quotes’, as you did in the previous exercise. 
You don’t need to do this for numeric values, but you DO need to use single quotes for date columns.
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
A NULL value could mean ‘zero’ - if something doesn’t happen, it can’t be logged in a table. 
However, NULL can also mean ‘unknown’ or ‘missing’. So consider if it is appropriate to replace them in your results. 
NULL values provide feedback on data quality. 
If you have NULL values, and you didn’t expect to have any, then you have an issue with either how data is captured or how it’s entered in the database.
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
1. WHERE the wild things are
2. Multiple WHERE conditions
You might need to apply more than one WHERE condition to your query. 
With AND, OR, and the correct use of parentheses, we can write queries to meet requirements and really impress our colleagues.

3. AND
On the left hand, the query returns records from the songlist table where the artist is AC/DC, giving us 29 rows in total. 
On the right-hand side, we add a further condition using `AND` after the WHERE clause, limiting records to those released prior to 1980. 
This reduces the number of rows that are returned to 9.

4. AND again
Here's another example. By adding an additional AND statement, we reduce the number of rows returned from 3, to 1.

5. OR
Can you guess what this query might return? That's right - it will retrieve songs released in 1994.

6. OR(2)
What about now? That's right, it also returns any song released after 2000. 
Using OR, we specify an alternate condition, and if a record meets either of the conditions, it is returned.

7. OR (3)
Let's try another example. The top query returns Green Day songs from 1994 - a total of 3 rows. 
The middle query returns Green Days songs released after the year 2000. This also returns 3 rows.

8. OR (4)
Now, if I ask for songs by Green Day, released in 1994 OR after 2000, how many rows will I retrieve? Six? 
Let's see the results... Whoa. That's not good. We've got more than 6 rows. Why do you think this happened?

9. What went wrong?
Let's figure this out. We asked for songs by Green Day, released in 1994 or after 2000. 
But, actually, we specified 2 completely different sets. The OR keyword specifies a different condition. 
So we actually asked for either songs by Green Day and released in 1994. OR any song, by any artist, released after 2000. 
So how do we fix this?

10. Parentheses for the win..
By wrapping parentheses around the 2 release_year clauses, we make it clearer that we want songs by Green Day, 
(and only Green Day) with a release_year of 1994 or greater than 2000). 
You could also write a slightly longer query, as shown on the bottom left. 
The top query avoids repeating the artist condition, but the bottom query is perhaps even clearer. AND / OR combinations can be tricky. 
You want one or more common conditions, and one or more varying conditions. 
Use parentheses to ensure the common conditions (in this case, the artist) stay common to both subsets, 
while the different conditions are also applied. 
If you are not getting the results you expect, don't be afraid to write out a longer query, 
using additional parentheses to make the meaning of the query clearer.

11. IN it to win it
We've seen how to use BETWEEN to select a range of numerical values. 
We can use IN to perform a similar selection for either text or numeric values. 
On the left, we filter for various artists, and on the right, for various release_years.

12. I LIKE it
You can use LIKE, along with the percent sign (%) to perform wildcard searches on text fields. 
To filter songs beginning with the letter 'A', you would type LIKE, then an apostrophe,then the letter a, the percent sign,and finally, another apostrophe.
Likewise, to filter for artists beginning with 'f', you would write the query on the top right.


# 1.10 Exploring classic rock songs
It’s time to rock and roll! In this set of exercises, 
you’ll use the songlist table, which contains songs featured on the playlists of 25 classic rock radio stations.
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
Herein, you'll learn how to use important SQL Server aggregate functions such as SUM, COUNT, MIN, MAX, and AVG. 
Following that, you'll learn how to manipulate text fields. 
To round out the chapter, you'll power up your queries using GROUP BY and HAVING, which will enable you to perform more meaningful aggregations.

# 2.1 Aggregating Data
1. Aggregating Data
To start to get an understanding of a new data set, it's common to count the number of observations and summarise any numeric columns. 
In this lesson, we will learn how to perform this using T-SQL. The examples use the grid database.

2. SUM - single column
It's straightforward to obtain the sum of a single column. 
Starting with SELECT, type SUM, then open parentheses, then type the column name, then close the parentheses. 
You should also provide a meaningful alias, otherwise the results will be returned as (No column name), which will get confusing very quickly

3. SUM - two or more columns
Here is our original SUM query. We want to sum another column. Any ideas on how we should do this? 
We need to add an additional SUM statement, wrapping our extra column in parentheses, and aliased as before. 
You need to repeat this for each additional column you want to sum.

4. The wrong way...
If you don't prefix the second column with SUM, you get an error message. 
What this means, is that when you are using aggregate functions like SUM, 
every column you SELECT either needs to be used in an aggregate function, or it needs to be used as a grouping column, which we will cover later.

5. Use aliases
So what's wrong here? That's right, I forgot to provide an ALIAS for my column names, and so I get these less than helpful defaults. 
You probably aren't going to remember what these columns are, so don't forget to use AS to provide a meaningful name for your results.

6. COUNT
The simplest COUNT query will return a count of the number of rows in that particular column.

7. COUNT Distinct
By itself, a simple count may not be that useful. 
However, using DISTINCT to obtain a count of unique values, or adding a WHERE clause, can make the results much more meaningful.

8. MIN
To return the minimum value from a column, we use the MIN function, again with parenthesis and providing a column alias. 
You may need to amend this query, in case there are data quality issues. 
For example, if there are many zero values - you may want to exclude them from the results.

9. MAX
We can use the MAX function to obtain the maximum column value.

10. Average
Finally, you can use the AVG function, to return the average value of a column.

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
1. Strings
This lesson will be a gentle introduction to working with text values, or strings, in SQL Server.

2. LEN
We can find the length of a text column (which means the number of characters, including spaces) using the LEN function. 
In this example, we first select the description column, and then the length of the description column, with a column alias. 
It's useful to know the total length of a string, as a starting point for use in other string calculations.

3. LEFT
If we want to extract a number of characters from the beginning of a string, use the LEFT function. 
The function syntax is LEFT,open parentheses, the column name, a comma, the number of characters to extract, then the closing parentheses. 
In this example, we select the description column, and then the first 20 characters from the description column, aliased as first_20_left.

4. RIGHT
The RIGHT function starts from the right hand side of the string and works back to extract the number of characters we specify. 
In this example, we again SELECT the description column, then extract the last 20 characters from the right hand side of the string.

5. CHARINDEX
The CHARINDEX function helps us find a specific character within a string. 
In this example, we're going to find the first underscore within the url column, from the courses table. 
The syntax is SELECT CHARINDEX,open parenthesis, then a single quote, then the character we want to find, 
in this case the underscore, a closing single quote, the name of the column we want to find the character within, then the closing parenthesis. 
Of course, we provide a column alias, and, for comparison purposes, we retrieve the url column so we can check that it works as expected.

6. SUBSTRING
Sometimes we need to extract from the middle portion of a string, as opposed to from the left or right edges. 
That's a job for SUBSTRING. 
The syntax is SELECT SUBSTRING, open parenthesis, the column name, the number of the character to start from, 
then the number of characters to extract, then the closing parenthesis. 
Here we extract the string "datacamp.com", which,as we can see, begins a few characters in from the left hand edge.

7. REPLACE
Finding and replacing text is a common task, so let's see how we can do this in T-SQL. 
We've seen how to find, using CHARINDEX, but, we don't need to use it for this task. 
Instead, the REPLACE function does the hard work for us. In this example, we replace all underscores in the url column with hyphens. 
We don't need to specify the positions of the character, or even that there are more than one - REPLACE does the job for us 
and all instances of an underscore are replaced.

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
We could manually count the number of characters, but, for longer strings, this is more work, 
especially when we can also find the length with LEN.

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


# Grouping and Having
1. Grouping and Having
In this lesson, we'll learn to turbo charge our aggregate queries using GROUP BY, and apply additional filters to our results with HAVING.

2. A simple SELECT
Here is a simple query, returning one value, representing the total SUM of the demand_loss column from the grid table. 
We'll almost always need to dig deeper below a headline figure. 
If we wanted a breakdown by the individual power outage descriptions - how could we achieve this?

3. Grouping error
We might try adapting the previous query by adding the description field to the SELECT statement. But no, we get an error message. 
The error is telling us that the description field is invalid.
It either needs to have an aggregate function applied to it, or it needs to appear in a GROUP BY clause.

4. Add A GROUP BY clause
It wouldn't make sense to try and aggregate the description field as it is not a numeric column. 
However, by using the GROUP BY clause, which splits the data up into groups according to the values within the chosen column, 
and then applies the aggregation function, the query now works. 
We return a total sum for each description, including rows where the demand_loss value is NULL.

5. Tidying up the GROUP BY query
Here's a slightly modified version of the query. 
We've filtered out NULL values from the demand_loss column, and restricted the description to fields that end with 'storm'. 
This gives us 7 separate groups, with total lost demand for each.

6. HAVING
Let's recap what we've learned so far. 
We know we can use aggregate functions in our SELECT statement, and that we should provide a meaningful column alias. 
We apply filters to the data using WHERE. And we now know we can split the data into groups using GROUP BY. 
When we write a WHERE clause, the filtering takes place on the row level - that is, within the data. 
But, for example, what if we want to sum values based on groups, and then filter on those sums?

7. Having in action
As a reminder, here is our existing query and result set. 
If we wanted to filter the lost_demand column of our results, how would we do it? We've already applied a WHERE clause. 
We could try adding an additional WHERE clause, 
but that would only affect the underlying row values, and NOT our overall grouped lost_demand values. 
How can we filter the results of this query to restrict the results to those where the sum of demand_loss_mw was greater than 1000?

8. Having in action (II)
The answer is by adding a HAVING clause, after the GROUP BY clause. By typing HAVING, 
then SUM, then our desired column name in brackets, and then the condition we want to apply, we arrive at the final result set we need.

9. Summary
Here's a quick overview of what we've covered. 
The main things to remember are that GROUP BY splits your results up into combinations of 1 or more columns - 
so for example if you wanted to break sales by territory, you would group by territory. 
Our chosen aggregation functions are then applied to those groups HAVING clauses are applied after the GROUP BY, 
and are used to either filter on the groups, or to filter using aggregate values such as SUM or AVG (average).


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
This chapter covers the basics of joining tables, using INNER, LEFT, and RIGHT joins, 
so that you can confidently retrieve data from multiple sources.

# 3.1 Joining tables
1. Joining tables
In this chapter, we'll look some of the most common ways of joining tables to create more expansive queries.

2. Relational Databases
SQL Server is a relational database management system. 
One of the key principles of a relational database is that data is stored across multiple tables. 
We'll need to be able to join tables together in order to extract the data we need.

3. Primary Keys
We use PRIMARY and FOREIGN keys to join tables. A primary key is a column that is used to uniquely identify each row in a table. 
This uniqueness can be achieved by using a sequential integer as an identity column. 
Or, sometimes, existing columns naturally contain unique values and they can be used. 
Here we can see the first few rows from the artist table. It has 2 columns, artist_id and name. 
The artist_id column acts as the primary key for this table. It is an integer column, and each value is different.

4. Foreign Keys
Now let's look at the album table. Can you spot the primary key? Yes, it's the album_id column. 
It's common for the primary key to be named "table-name underscore id". But, you'll have noticed there is also an artist_id column. 
That also consists of integers, and has the same name as the artist_id column in the artist table. What does this mean?

5. Foreign keys
Well, the artist_id in the album table, acts as a FOREIGN KEY to the artist table. 
What this means, is that when the artist_id in the album table MATCHES the artist_id in the artist table, those rows can be linked using a JOIN.

6. Joining album and artist
Rows 1 and 4 of the album table have an artist_id of 1. The artist_id 1 in the artist table is AC/DC.

7. Joining album and artist
So, when we join the two tables together, we return the album details from the album table, 
and the corresponding artist details from the artist table - joined using the artist_id field, which is common to both tables.

8. INNER JOIN
We just saw the results of an INNER JOIN.
We join the album and artist tables by matching the artist_id from the artist table to the artist_id in the album table. 
When selecting columns with the same name from different tables, you must fully qualify the column name. 
Otherwise, SQL Server will not know which table to SELECT the column from. 
To fully qualify a column, you have to prefix it with the relevant table name, followed by a period.

9. INNER JOIN syntax
Here's a generic example to remind you of the syntax. 
We select the relevant columns from the main table, - table_A in this case, 
then SELECT any additional columns from the table we want to join to, which in this case is table_B. 
Then we specify the join using the keywords INNER JOIN and ON, providing the necessary key columns from both tables.

10. INNER JOIN - No WHERE clause
In this example, we don't specify a WHERE clause, so we return ALL combinations of ALL matches between the artist and album tables, again, 
based on the artist_id column which is common to both.

11. Multiple INNER JOINS
You can join more than 2 tables using INNER JOINS.You simply provide an additional INNER JOIN for each combination of tables. 
In our code above, we join tables A and B, and also B and C. 
We'll work through an example of joining 3 tables with INNER JOINs later in this chapter.

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
In this exercise, you’ll join all three tables to pull together a more complete result set. 
You’ll continue using INNER JOIN, but you need to specify more than one.
Here, note that because both track and artist contain a name column, 
you need to qualify where you are selecting the columns by prefixing the column name with the table name.

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
1. Mix n match - LEFT & RIGHT joins
We've seen how to find rows which have exact matches using INNER JOINs. Now let's look at some other common joins - LEFT and RIGHT joins.

2. The rationale for LEFT and RIGHT joins
Why do we need LEFT and RIGHT joins? Here are some examples of where rows in one table may not have an exact match in another.

3. The rationale for LEFT and RIGHT joins
Let's look at the last example in more detail.

4. The rationale for LEFT and RIGHT joins (II)
We have a table of patient admissions and another showing patient discharges. 
The admissions table has 5 rows, and the discharges table has 3. 
An INNER JOIN on those 2 tables shows the patients who had been admitted AND discharged - patients 1,3 and 4. 
But that doesn't tell us about current patients. 
In order to get the complete picture in one result set, we need a LEFT JOIN. 
We need all the rows from the admissions table, so that becomes the table on the left-hand side of the join. 
We also want to return all matches and identify non-matches from the discharges table. 
Any non-matches will return a NULL value in the discharge column. 
Now we have a complete result set showing patients who have been both admitted and discharged, 
and those who have been admitted but not yet discharged.

5. LEFT JOIN SYNTAX
Here's how we would perform a LEFT join with these tables. We can also see a pictorial representation of the join below. 
The 'Admitted' table is on the LEFT of the join, 'Discharged' is on the right, and they are joined by the Patient_ID. 
The symbol on the connecting line indicates that ALL rows will be returned from the Admitted table.

6. LEFT JOIN results
Here we see the final results of the query. We can clearly see the matching records. 
Patients 2 and 5, who have not yet been discharged, are identified by NULLs in the Discharged column.

7. RIGHT JOIN
RIGHT JOINS are similar to LEFT joins. 
The difference is that all rows from the right hand table are returned, plus any matches from the left hand table. 
Any non-matched rows in the left hand table will return a NULL value.

8. RIGHT JOIN results
AS before, the query returns all rows from the Admitted table, the matches from the Discharged table, and NULLS for any non-matching rows.

9. Summary
Let's recap what we covered: 
The difference between INNER joins and LEFT or RIGHT joins is that INNER JOINS only ever return matching rows from both tables. 
LEFT or RIGHT joins return ALL the rows from the main query table, plus any matches from the joining table. 
If a row in the main table doesn't have a match in the joining table, 
then a NULL value will appear in any columns you select from the joining table. 
LEFT and RIGHT joins can be interchangeable - we can re-write a LEFT to a RIGHT and a RIGHT to a LEFT. 
LEFT joins are more common, but we should be aware of RIGHT joins as they are often useful when multiple tables need to be joined together.

10. JOINING Overview...
Finally, here's a simple visual summary of INNER, LEFT and RIGHT joins, 
showing which rows get returned from either side of the join, for each join type.

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
In addition to performing a RIGHT join, 
you’ll also learn how to avoid problems when different tables have the same column names, 
by fully qualifying the column in your select statement. 
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
1. UNION & UNION ALL
In this lesson we'll discover how to combine the results of multiple queries using UNION, and UNION ALL.

2. Two queries
Here's a query which returns a small result set from the album table. We're selecting all three columns, 
but only where the artist_id is 1 or 3, and the query returns three rows. 
Here we have a similar query, returning the same three columns, from a similar table, but only where the artist_id is 1, 4 or 5. 
This returns 4 rows. 
Notice that this query, and the query before it, both return rows for the artist_id of 1. 
Our first query returned 3 rows, and the second query returned 4 rows. 
While the example is querying the same table, in real life we may have data in separate tables, which share the same structure, 
that we need to combine into one result set. What do we mean by the same structure? 
It means we expect that both tables have the same number of columns, the columns are listed in the same order and have similar data types. 
How could we combine their results?

3. Combining results
The answer is to use UNION. We write the first query, then UNION on a new line, then we write the second query below it. 
How many rows will this query return? The query only returns 5 rows, not the 7 we might have expected. Why? 
Well, UNION excludes duplicate rows, and as both queries contained the data for artist_id 1, we only retrieve 2 , 
and not 4 rows for that artist_id.

4. UNION ALL
Here's a slightly different version of the UNION query we saw previously. Can you spot the difference? 
Instead of UNION to join the two queries, it uses UNION ALL. How many rows might be returned now? 
This time, we return all 7 rows. UNION ALL returns all the rows from both queries, including duplicates.

5. Creating new column names for final results
In this final example, we show the same UNION ALL query as before, but we provide a new alias for each column. 
If we have 2 different tables, with different column names, but the same datatypes in the same order, 
then we can still combine the results , while providing new common column names for our final result set.

6. Summary
Let's recap. We can combine queries from the same table, or from different tables, using UNION or UNION ALL. 
If we're combining data from different tables, our queries need to SELECT the same number of columns, 
in the same order, and have the same data types, so that the results can be combined. 
If our source tables have different column names,
we can ALIAS the column names in our SELECT queries so that the final results share the same column names. 
UNION combines results but discards duplicates. 
This means it can be slower to run, whereas UNION ALL returns all results including duplicates, so it is faster.

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
In this final chapter, you'll get really hands on! 
You've worked with existing tables, but in this chapter, 
you'll get to CREATE and INSERT data into them. You'll also UPDATE existing records and practice DELETE statements in a safe environment. 
This chapter ensures the course gives you a thorough introduction to the key aspects of working with data in SQL Server.

# 4.1 Creator
1. You've got the power
In this final chapter, we'll add to our knowledge by learning to create and update tables, and also how to insert and delete rows. 
These are commonly described as CRUD operations, and we'll briefly cover what we mean by that acronym. 
Then, we'll mainly focus on creating tables. In order to do that, we need to think about the type of data we want to store in each column.

2. CRUD operations
The acronym CRUD describes the 4 main type of operations you can carry out on a database. 
First, we can CREATE - in a data sense, that could be tables or views, 
but in addition, database administrators can also create users, permissions and security groups. Next, we perform READ operations. 
When we perform a SELECT query, we are reading from the database. We can amend existing database records using UPDATE statements. 
Finally, we can DELETE records, although this depends on having sufficient access permissions to carry this out. 
Let's look at CREATE in more detail.

3. CREATE
We can create a table by using the keywords CREATE TABLE and then proving a table name. Each table name within a database should be unique. 
Then, we open parenthesis and type the column name, a comma, then the data type for that column, 
and if appropriate, the size, length or format of that data type in brackets. 
Each column is defined on a separate line, before closing the parenthesis. For example, we can create a table named `test_table`. 
This table has 3 columns, test_date, which is a date column, test_name which has the datatype varchar, and test_int which is an integer column. Notice that test_name has the varchar datatype with the value 20 in brackets immediately after. This value refers to the maximum number of characters that can be stored in this column. So in this case, we can store anything up to 20 characters.

4. A few considerations when creating a table
Creating a table is straightforward, but we should spend some time planning it beforehand. 
As well as table and column names, we'll need to think about the type of data each column will store, 
and where appropriate, the size or amount of data stored in the column.

5. Data types
Here are some of the more common data types used in SQL Server. We can store dates, times or combined datetime values. 
The default date format is YYYY-MM-DD. 
Numeric values can be stored as integers, decimals, or bit, which stores either a 1 or 0, relating to TRUE or FALSE. 
For strings, common types include char, varchar, and nvarchar. 
I encourage you to research these and the other data types available, so you are aware of which best suits your needs.

# 4.2 CRUD operations
# 4.3 Create tables
Say you want to create a table to consolidate some useful track information into one table. 
This will consist of the track name, the artist, and the album the track came from. 
You also want to store the track length in a different format to how it is currently stored in the track table. 
How can you go about doing this? Using CREATE TABLE. Recall the example from the video:

CREATE TABLE test_table(
  test_date DATE, 
  test_name VARCHAR(20), 
  test_int INT
)

Instruction 1: Create a table named ‘results’ with 3 VARCHAR columns called track, artist, 
and album, with lengths 200, 120, and 160, respectively.

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
Got It!
1. Insert, Update, Delete
In this lesson we'll look at inserting, updating and deleting records

2. INSERT
Once we've created a table, we'll need to enter some data into it. One way to do this is to use an INSERT statement. 
This begins with the keywords INSERT INTO, followed by the table name. 
We then type the column names we want to insert data into, inside parenthesis. 
We must separate each column name with a comma. Next, we type the keyword VALUES, before opening parentheses again, 
and typing the individual values you want to enter, again, each separated by a comma. 
Then we close the parenthesis, to complete the INSERT statement.

3. INSERT SELECT
Another method we might use to populate a table is to perform an INSERT SELECT. 
This starts off similar to an INSERT - we use INSERT INTO followed by the table name and column names. 
Instead of typing VALUES, we type SELECT, then the names of the columns we want to select, and the name of the source table. 
We can also apply any WHERE conditions at this stage. 
It's always a good idea to be specific about the names of the columns we want to insert into, 
and the corresponding names of the columns we want to SELECT from. 
Also, we should take care that the source and destination column names are in the correct order.

4. UPDATE
We can amend records using an UPDATE statement. This begins with the keyword UPDATE, followed by the table name. 
This is followed by the SET keyword, the column we want to update, the value we want to change the record to, 
and, most importantly, a WHERE clause with the conditions that identify the specific rows we want to update. 
Don't forget the WHERE clause, otherwise, we'll update ALL the values in the column. 
If we want to update more than one column at a time,we simply list the additional columns and their respective new values

5. DELETE
It's very easy to DELETE in SQL Server. Be aware though, we won't get asked to confirm - there are no "are you sure?" prompts, 
so when we run a delete statement, it will take place immediately. 
The syntax is simply DELETE FROM, the table name, and the WHERE clause to specify the records for deletion. 
Be sure to test the WHERE clause first. Another method is to use the TRUNCATE TABLE statement. 
This does not accept or require a WHERE clause - it will remove all data from all columns at once.

6. Let's INSERT, UPDATE, and DELETE!
You may not have permissions to make changes to tables, but we have a safe learning environment here 
so let's try our hand at inserting, updating and deleting records.

# 4.5 Insert
This exercise consists of two parts: 
In the first, you’ll create a new table very similar to the one you created in the previous interactive exercise. 
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
Always ensure you test with a SELECT and WHERE in a separate query to ensure you are selecting and deleting the correct records. 
If you forget so specify a WHERE condition, you will delete ALL rows from the table.

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
1. Declare yourself
In this lesson we'll look at the use of variables - why they are useful, how to create them and assign values to them. 
We'll also look at creating temporary tables, which can help us carry out analysis tasks when we don't have access or permissions to other tables.

2. Variables
First of all, what do we mean by a variable? 
It's helpful to think of it as a placeholder for a specific value, of a specific data type. Why is that useful? 
Well, it means we write less repetitive code. Let's imagine our boss wants all the information from the artist table about AC/DC. 
That could happen, right? So we write a query and give them the results. Now they want to know about U2. So we write another query. 
Then they want to know about another artist. And another. Do we really want to write a new query each time? 
A better way is to create a variable. Variable names begin with the 'at' sign , so we could perhaps call this variable "@my_artist". 
Then, in the query, rather than writing the artist name, we refer to "@my_artist". 
And then all we need to do is update the variable each time we run the query. One query, easily modified, for repetitive use. 
Let's see how to do it.

3. DECLARE
We use the DECLARE keyword to create a variable. Then we type the variable name, beginning with the 'at' symbol. 
Here are a couple of examples. First, we can define a variable, @test_int, which is an integer. 
Or, following on from the previous slide, we can create @my_artist, 
which has the varchar datatype, accepting anything up to 100 characters in length. 
So that creates a variable, but how do we pass a value to it?

4. SET
In order to assign a value to a variable, we use the keyword 'SET', immediately after the DECLARE statement. 
Here we see our previous integer variable, @test_int, which we have declared, and now SET to a value of 5 by typing SET, 
then the variable name, the equals sign, then the chosen value, in this case, 5. 
Similarly, we can assign the value 'AC/DC' to our @artist variable as shown. Then we can refer to these variables in a WHERE clause.

5. Declaring more than one variable
Here's an example of declaring two variables, in this case and @my_artist, and @my_album. 
We DECLARE them both first, then SET the values, and then finally we write our SELECT query. 
We can see that in the WHERE clause, the artist should equal @my_artist, and the album should equal @my_album. 
If we then need to change the artist and album combination, we simply update the SET section of the query, and run it again.

6. Temporary tables
Imagine we've written a query, joining information from different tables, with nicely aliased column names. 
It would be great if this was a table that we could use for further work. The good news is, we can create a temporary table. 
And once we've created it, it's available for further querying for the remainder of our session. 
How? We write our SELECT query, but in between SELECT and FROM, we use the keyword INTO, 
and then type our desired table name, prefaced by the hash (#) sign. 
The table will exist either until our connection or session ends, or we manually remove it with the 'DROP TABLE' statement.

# 4.9 DECLARE and SET a variable
Using variables makes it easy to run a query multiple times, with different values, 
without having to scroll down and amend the WHERE clause each time. 
You can quickly update the variable at the top of the query instead.
This also helps provide greater security, but that is out of scope of this course.

Let’s go back to the now very familiar grid table for this exercise, 
and use it to practice extracting data according to your newly defined variable.

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
You’ve seen how to DECLARE and SET set 1 variable. Now, you’ll DECLARE and SET multiple variables. 
There is already one variable declared, however you need to overwrite this and declare 3 new ones. 
The WHERE clause will also need to be modified to return results between a range of dates.

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
In this final exercise, 
you’ll select the longest track from every album and add that into a temporary table which you’ll create as part of the query.

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



