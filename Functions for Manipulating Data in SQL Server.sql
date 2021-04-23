# 


# Types of character strings
ALTER TABLE voters 
ADD last_vote_date date;

ALTER TABLE voters 
ADD last_vote_time time;

ALTER TABLE voters 
ADD last_login datetime2;


# Implicit conversion between data types
SELECT first_name, last_name, total_votes FROM voters WHERE total_votes > 120


# Data type precedence
SELECT 
	bean_type,
	rating
FROM ratings
WHERE rating > 3;


# CASTing data
SELECT 
	-- Transform the year part from the birthdate to a string
	first_name + ' ' + last_name + ' was born in ' + CAST(YEAR(birthdate) AS nvarchar) + '.' 
FROM voters;

/////

SELECT 
	-- Transform to int the division of total_votes to 5.5
	CAST(total_votes/5.5 AS int) AS DividedVotes
FROM voters;

/////

SELECT 
	first_name,
	last_name,
	total_votes
FROM voters
-- Transform the total_votes to char of length 10
WHERE CAST(total_votes AS char(10)) LIKE '5%';

# CONVERTing data
SELECT 
	email,
    -- Convert birthdate to varchar show it like: "Mon dd,yyyy" 
    CONVERT(varchar, birthdate, 107) AS birthdate
FROM voters;

/////

SELECT 
	company,
    bean_origin,
    -- Convert the rating column to an integer
    CONVERT(int, rating) AS rating
FROM ratings;

/////

SELECT 
	company,
    bean_origin,
    rating
FROM ratings
-- Convert the rating to an integer before comparison
WHERE CONVERT(int, rating) = 3;


# Working with the correct data types
SELECT 
	first_name,
	last_name,
	gender,
	country
FROM voters
WHERE country = 'Belgium'
	-- Select only the female voters
	AND gender='F'
    -- Select only people who voted more than 20 times   
    AND total_votes>20;
    
/////

 SELECT 
	first_name,
    last_name,
	-- Convert birthdate to varchar(10) and show it as yy/mm/dd. This format corresponds to value 11 of the "style" parameter.
	CONVERT(varchar(10), birthdate, 11) AS birthdate,
    gender,
    country
FROM voters
WHERE country = 'Belgium' 
    -- Select only the female voters
	AND gender = 'F'
    -- Select only people who voted more than 20 times  
    AND total_votes > 20;

/////

SELECT
	first_name,
    last_name,
	-- Convert birthdate to varchar(10) to show it as yy/mm/dd
	CONVERT(varchar(10), birthdate, 11) AS birthdate,
    gender,
    country,
    -- Convert the total_votes number to nvarchar
    'Voted ' + CAST(total_votes AS nvarchar) + ' times.' AS comments
FROM voters
WHERE country = 'Belgium'
    -- Select only the female voters
	AND gender = 'F'
    -- Select only people who voted more than 20 times
    AND total_votes > 20;  







