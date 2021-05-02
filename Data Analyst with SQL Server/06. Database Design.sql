Database Design
"""A good database design is crucial for a high-performance application. 
   Just like you wouldn't start building a house without the benefit of a blueprint, 
   you need to think about how your data will be stored beforehand. 
   Taking the time to design a database saves time and frustration later on, 
   and a well-designed database ensures ease of access and retrieval of information. 
   While choosing a design, a lot of considerations have to be accounted for. 
   In this course, you'll learn how to process, store, and organize data in an efficient way. 
   You'll see how to structure data through normalization and present your data with views. 
   Finally, you'll learn how to manage your database 
   and all of this will be done on a variety of datasets from book sales, car rentals, to music reviews."""
   
1. Processing, Storing, and Organizing Data
Start your journey into database design by learning about the two approaches to data processing, OLTP and OLAP. 
In this first chapter, you'll also get familiar with the different forms data can be stored in and learn the basics of data modeling.

1.1. OLTP and OLAP
1. OLTP and OLAP
Hello! My name is Lis, I'm a Curriculum Manager here at DataCamp. 
In this course, we'll be talking about database design. So, what does that entail exactly?

2. How should we organize and manage data?
To put it simply, in this course we're asking the question: How should we organize and manage data? 
To answer this, we have to consider the different schemas, management options, and objects that make up a database. 
Some examples are listed here, and they are covered throughout the course. 
These topics all affect the way data is stored and accessed. Some enable faster query speeds. 
Some take up less memory than others. And notably, some cost more money than others.

3. How should we organize and manage data?
And as we will soon find out in this course, there is no one right answer to this motivating question. 
It will come down to how the data will be used.

4. Approaches to processing data
Okay, let's dive in. OLTP and OLAP are approaches to processing data, and they will be referenced throughout this course. 
They help define the way data is going to flow, be structured, and stored. 
If you figure out which fits your business case, designing your database will be much easier. 
OLTP stands for Online Transaction Processing. OLAP stands for Online Analytical Processing. 
As the names hint, the OLTP approach is oriented around transactions, while the other is oriented around analytics.

5. Some concrete examples
Before going into formal definitions, let's look at some use cases of each. Say you are in charge of data management at a bookstore. 
You would use an OLTP approach to keep track of the prices of books, 
while to analyze the most profitable books, an OLAP approach would be more appropriate. 
To keep track of all customer transactions, you would use an OLTP approach to insert sales as customers finish paying. 
However, if you wanted to do sophisticated analysis on sales, like most loyal customers - you would use OLAP. 
An OLTP database would be used to track when employees have worked, while to run an analysis on who deserves employee of the month, 
you would need to switch over to OLAP. Are you starting to see their differences? OLTP focus on supporting day-to-day operations, 
while OLAP tasks are vaguer and focus on business decision making.

6. OLAP vs. OLTP
This is a nice summary of OLAP and OLTP. The OLTP systems are application-oriented, like for bookkeeping for example. 
OLAP systems are oriented around a certain subject that's under analysis, like last quarter's book sales. 
The data in OLTP systems can be seen as a current snapshot of transactions that are archived often. 
The data in OLAP systems tend to be data from over a large period of time that has been consolidated for long-term analysis. 
This means OLAP tends to have more data than OLTP. 
As we saw in the bookstore example, the commonly executed OLTP queries are simpler and require a quick query or update. 
On the other hand, OLAP systems used for analysis require more complex queries. 
In terms of how these approaches are being used, OLTP systems are used by more people throughout a company and even a company's customers, 
while OLAP systems are typically used by only analysts and data scientists at a company.

7. Working together
OLAP and OLTP systems work together; in fact, they need each other. 
OLTP data is usually stored in an operational database that is pulled and cleaned to create an OLAP data warehouse. 
We'll get more into data warehouses and other storage solutions in the next video. 
Without transactional data, no analyses can be done in the first place. 
Analyses from OLAP systems are used to inform business practices and day-to-day activity, thereby influencing the OLTP databases.

8. Takeaways
To wrap up, here's what you should take away from this video: Before implementing anything, 
figure out your business requirements because there are many design decisions you'll have to make. 
The way you set up your database now will affect how it can be effectively used in the future. 
Start by figuring out if you need an OLAP or OLTP approach, or perhaps both! 
You should now be comfortable with the differences between both. These are the two most common approaches. 
However, they are not exhaustive, but they are an excellent start to get you on the right path to designing your database. 
In later videos, we'll learn more about the technical differences between both approaches.

1.2. OLAP vs. OLTP

OLAP = analytics
Queries a larger amount of data
Helps businesses with decision making and problem solving
Typically uses a data warehouse

OLTP = transactions
Data is inserted and updated more often
Most likely to have data from the past hour
Typically uses an operational database

Hint
Remember OLAPs are used by data scientists and analyst.
The queries done on an OLTP system are for simpler day-to-day tasks.


1.3. Which is better?
The city of Chicago receives many 311 service requests throughout the day. 
311 service requests are non-urgent community requests, ranging from graffiti removal to street light outages. 
Chicago maintains a data repository of all these services organized by type of requests. 
In this exercise, Potholes has been loaded as an example of a table in this repository. 
It contains pothole reports made by Chicago residents from the past week.

Explore the dataset. What data processing approach is this larger repository most likely using?
---> OLTP because this table's structure appears to require frequent updates.

1.4. Storing data
1. Storing data
Let's discuss the different ways you can store data.

2. Structuring data
Data can be stored in three different levels. The first is structured data, which is usually defined by schemas. 
Data types and tables are not only defined, but relationships between tables are also defined, using concepts like foreign keys. 
The second is unstructured data, which is schemaless and data in its rawest form, meaning it's not clean. 
Most data in the world is unstructured. Examples include media files and raw text. 
The third is semi-structured data, which does not follow a larger schema, rather it has an ad-hoc self-describing structure. 
Therefore, it has some structure. 
This is an inherently vague definition as there can be a lot of variation between structured and unstructured data. 
Examples include NoSQL, XML, and JSON, which is shown here on the right.

3. Structuring data
Because its clean and organized, structured data is easier to analyze. 
However, it's not as flexible because it needs to follow a schema, which makes it less scalable. 
These are trade-offs to consider as you move between structured and unstructured data.

1 Flower by Sam Oth and Database Diagram by Nick Jenkins via Wikimedia Commons https://commons.wikimedia.org/wiki/File:Languages_xml.png
4. Storing data beyond traditional databases
You should already be familiar with traditional databases. They generally follow relational schemas. 
Operational databases, which are used for OLTP, are an example of traditional databases. 
Decades ago, traditional databases used to be enough for data storage. 
Then as data analytics took off, data warehouses were popularized for OLAP approaches. 
And, now in the age of big data, we need to analyze and store even more data, which is where the data lake comes in. 
I use the term "traditional databases" because many people consider data warehouses and lakes to be a type of database.

5. Data warehouses
Data warehouses are optimized for read-only analytics. 
They combine data from multiple sources and use massively parallel processing for faster queries. 
In their database design, they typically use dimensional modeling and a denormalized schema. 
We will walk through both of these terms later in the course. 
Amazon, Google, and Microsoft all offer data warehouse solutions, known as Redshift, Big Query, and Azure SQL Data Warehouse, respectively. 
A data mart is a subset of a data warehouse dedicated to a specific topic. 
Data marts allow departments to have easier access to the data that matters to them.

6. Data lakes
Technically, traditional databases and warehouses can store unstructured data, but not cost-effectively. 
Data Lake storage is cheaper because it uses object storage as opposed to the traditional block or file storage. 
This allows massive amounts of data to be stored effectively of all types, from streaming data to operational databases. 
Lakes are massive because they store all the data that might be used. 
Data lakes are often petabytes in size - that's 1,000 terabytes! Unstructured data is the most scalable, which permits this size. 
Lakes are schema-on-read, meaning the schema is created as data is read. 
Warehouses and traditional databases are classified as schema-on-write because the schema is predefined. 
Data lakes have to be organized and cataloged well; otherwise, it becomes an aptly named "data swamp." 
Data lakes aren't only limited to storage. It's becoming popular to run analytics on data lakes. 
This is especially true for tasks like deep learning and data discovery, which needs a lot of data that doesn't need to be that "clean." 
Again, the big three cloud providers all offer a data lake solution.

7. Extract, Transform, Load or Extract, Load, Transform
When we think about where to store data, we have to think about how data will get there and in what form. 
Extract Transform Load and Extract Load Transform are two different approaches for describing data flows. 
They get into the intricacies of building data pipelines, which we will not get into. 
ETL is the more traditional approach for warehousing and smaller-scale analytics. 
But, ELT has become common with big data projects. 
In ETL, data is transformed before loading into storage - usually to follow the storage's schema, as is the case with warehouses. 
In ELT, the data is stored in its native form in a storage solution like a data lake. 
Portions of data are transformed for different purposes, from building a data warehouse to doing deep learning.

1.5. Name that data type!
In the previous video, you learned about structured, semi-structured, and unstructured data. 
Structured data is the easiest to analyze because it is organized and cleaned. 
On the other hand, unstructured data is schemaless, but scales well. 
In the middle we have semi-structured data for everything in between.

Hint
Semi-structured data have some organized, but it is self-described. There are several popular file formats like this.
Databases tend to enforce a schema before data can be written into it.
Unstructured data has usually not been cleaned or processed.


1.6. Ordering ETL Tasks
You have been hired to manage data at a small online clothing store. 
Their system is quite outdated because their only data repository is a traditional database to record transactions.

You decide to upgrade their system to a data warehouse after hearing that different departments would like to run their own business analytics. You reason that an ELT approach is unnecessary because there is relatively little data (< 50 GB).

Hint
Python scripts are often used to transform data to match a specified schema.
Data marts are a subset of data warehouses.
In ETL, you need to clean data before writing it to a data warehouse.

In ETL, raw data is cleaned before being stored. This makes it accessible and ready to use.

1.7. Recommend a storage solution
When should you choose a data warehouse over a data lake?

To create accessible and isolated data repositories for other analysts

Analysts will appreciate working in a data warehouse more because of its organization of structured data that make analysis easier.

1.8. Database design
1. Database design
Now, let's learn more about what database design means.

2. What is database design?
Database design determines how data is logically stored. 
This is crucial because it affects how the database will be queried, whether for reading data or updating data. 
There are two important concepts to know when it comes to database design: Database models and schemas. 
Database models are high-level specifications for database structure. 
The relational model, which is the most popular, is the model used to make relational databases. 
It defines rows as records and columns as attributes. It calls for rules such as each row having unique keys. 
There are other models that exist that do not enforce the same rules. A schema is a database's blueprint. 
In other words, the implementation of the database model. 
It takes the logical structure more granularly by defining the specific tables, fields, relationships, indexes, and views a database will have. 
Schemas must be respected when inserting structured data into a relational database.

3. Data modeling
The first step to database design is data modeling. This is the abstract design phase, where we define a data model for the data to be stored. 
There are three levels to a data model: 
A conceptual data model describes what the database contains, such as its entities, relationships, and attributes. 
A logical data model decides how these entities and relationships map to tables. 
A physical data model looks at how data will be physically stored at the lowest level of abstraction. 
These three levels of a data model ensure consistency and provide a plan for implementation and use.

1 https://en.wikipedia.org/wiki/Data_model
4. An example
Here is a simplified example of where we want to store songs. 
In this case, the entities are songs, albums, and artists with various pink attributes. 
Their relationships are denoted by blue rhombuses. Here we have a conceptual idea of the data we want to store. 
Here is a corresponding schema using the relational model. The fastest way to create a schema is to translate the entities into tables. 
But just because it's the easiest, doesn't mean it's the best. Let's look at some other ways this ER diagram could be converted.

5. Other database design options
For example, you could opt to have one table because you don't want to have to run so many joins to get song information. 
Or, you could add tables for genre and label. Many songs share these attributes, and having one place for them helps with data integrity. 
The biggest difference here is how the tables are determined. There are different pros and cons to these three examples I've shown. 
The next chapter on normalization and denormalization will expand on this.

6. Beyond the relational model
From the prerequisites, you should be familiar with the relational model. 
Dimensional modeling is an adaptation of the relational model specifically for data warehouses. 
It's optimized for OLAP type of queries that aim to analyze rather than update. To do this, it uses the star schema. 
In the next chapter, we'll delve into that more. As we will see in the next slide, 
the schema of a dimensional model tends to be easy to interpret and extend. 
This is a big plus for analysts working on the warehouse.

7. Elements of dimensional modeling
Dimensional models are made up of two types of tables: fact and dimension tables. 
What the fact table holds is decided by the business use-case. 
It contains records of a key metric, and this metric changes often. Fact tables also hold foreign keys to dimension tables. 
Dimension tables hold descriptions of specific attributes and these do not change as often. So what does that mean? 
Let's bring back our example, where we're analyzing songs. The turquoise table is a fact table called songs. 
It contains foreign keys to purple dimension tables. 
These dimension tables expand on the attributes of a fact table, such as the album it is in and the artist who made it. 
The records in fact tables often change as new songs get inserted. 
Albums, labels, artists, and genres will be shared by more than one song - hence records in dimension tables won't change as much. 
Summing it up, to decide the fact table in a dimensional model, consider what is being analyzed and how often entities change.


1.9. Classifying data models
In the previous video, we learned about three different levels of data models: conceptual, logical, and physical.

Hint
Database design is a step in determining the logical structure of a database.
Entity-Relation diagrams are useful creating conceptual data models.
Physical data models focus on how data will be physically stored.

1.10. Deciding fact and dimension tables
Imagine that you love running and data. It's only natural that you begin collecting data on your weekly running routine. 
You're most concerned with tracking how long you are running each week. You also record the route and the distances of your runs. 
You gather this data and put it into one table called Runs with the following schema:

runs

duration_mins - float
week - int
month - varchar(160)
year - int
park_name - varchar(160)
city_name - varchar(160)
distance_km - float
route_name - varchar(160)

After learning about dimensional modeling, you decide to restructure the schema for the database. Runs has been pre-loaded for you.

Instructions 1/2
Question: Out of these possible answers, what would be the best way to organize the fact table and dimensional tables?
--- A fact table holding duration_mins and foreign keys to dimension tables holding route details and week details, respectively.

Instructions 2/2
Create a dimension table called route that will hold the route information.
Create a dimension table called week that will hold the week information.

Code:
-- Create a route dimension table
CREATE TABLE route (
	route_id INTEGER PRIMARY KEY,
    park_name VARCHAR(160) NOT NULL,
    city_name VARCHAR(160) NOT NULL,
    distance_km FLOAT NOT NULL,
    route_name VARCHAR(160) NOT NULL
);
-- Create a week dimension table
CREATE TABLE week(
	week_id INTEGER PRIMARY KEY,
    week INTEGER NOT NULL,
    month VARCHAR(160) NOT NULL,
    year INTEGER NOT NULL
);

The primary keys route_id and week_id you created will be foreign keys in the fact table.


1.11. Querying the dimensional model
Let's try to run a query based on this schema. How about we try to find the number of minutes we ran in July, 2019? 
We'll break this up in two steps. First, we'll get the total number of minutes recorded in the database. 
Second, we'll narrow down that query to week_id's from July, 2019.

Instructions 1/2
Calculate the sum of the duration_mins column.

Code:
SELECT 
	-- Get the total duration of all runs
	SUM(duration_mins)
FROM 
	runs_fact;
  
Instructions 2/2
Join week_dim and runs_fact.
Get all the week_id's from July, 2019.

Code:
SELECT 
	-- Get the total duration of all runs
	SUM(duration_mins)
FROM 
	runs_fact
-- Get all the week_id's that are from July, 2019
INNER JOIN week_dim ON week_dim.week_id = runs_fact.week_id
WHERE month = 'July' and year = '2019';

Because of its structure, the dimensional model usually require queries involving more than one table.

2. Database Schemas and Normalization
"""In this chapter, you will take your data modeling skills to the next level. 
   You'll learn to implement star and snowflake schemas, recognize the importance of normalization 
   and see how to normalize databases to different extents."""

2.1. Star and snowflake schema
1. Star and snowflake schema
Congrats on finishing the first chapter! We're now going to jump in where we left off with the star schema.

2. Star schema
The star schema is the simplest form of the dimensional model. 
Some use the terms "star schema" and "dimensional model" interchangeably. 
Remember that the star schema is made up of two tables: fact and dimension tables. 
Fact tables hold records of metrics that are described further by dimension tables. 
Throughout this chapter, we are going to use another bookstore example. 
However, this time, you work for a company that sells books in bulk to bookstores across the US and Canada. 
You have a database to keep track of book sales. Let's take a look at the star schema for this database.

3. Star schema example
Excluding primary and foreign keys, the fact table holds the sales amount and quantity of books. 
It's connected to dimension tables with details on the books sold, the time the sale took place, and the store buying the books. 
You may notice the lines connecting these tables have a special pattern. These lines represent a one-to-many relationship. 
For example, a store can be part of many book sales, but one sale can only belong to one store. 
The star schema got its name because it tends to look like a star with its different extension points.

4. Snowflake schema (an extension)
Now that we have a good grasp of the star schema, let's look at the snowflake schema. 
The snowflake schema is an extension of the star schema. Off the bat, we see that it has more tables. 
You may not be able to see all the details in this slide, but don't worry it will be broken down in later slides. 
The information contained in this schema is the same as the star schema. 
In fact, the fact table is the same, but the way the dimension tables are structured is different. 
We see that they extend more, hence it's namesake.

5. Same fact table, different dimensions
The star schema extends one dimension, while the snowflake schema extends over more than one dimension. 
This is because the dimension tables are normalized.

6. What is normalization?
So what is normalization? Normalization is a technique that divides tables into smaller tables and connects them via relationships.

7. What is normalization?
The goal is to reduce redundancy and increase data integrity. So how does this happen? 
There are several forms of normalization, which we'll delve into later. 
But the basic idea is to identify repeating groups of data and create new tables for them. 
Let's go back to our example and to see how these tables were normalized.

8. Book dimension of the star schema
Here's the book dimension in the star schema. What could be repeating here? Primary keys are inherently unique. 
For book titles, although there is possible repeat here, it is not common. 
On the other hand, authors often publish more than one book, publishers definitely publish many books, and a lot of books share genres. 
We can create new tables for them, and it results in the following snowflake schema:

9. Book dimension of the snowflake schema
Do you see how these repeating groups now have their own table?

10. Store dimension of the star schema
On to the store dimension! City, states, and countries can definitely have more than one book stores within them.

11. Store dimension of the snowflake schema
Here are the normalized dimension tables representing the book stores. 
Do you notice that the way we structure these repeating groups is a bit different from the book dimension? 
An author can have published in different genres and with various publishers, hence why they were different dimensions. 
However, a city stays in the same state and country; thus, they extend each other over three dimensions.

12. Time dimension
The same is done for the time dimension. A day is part of a month that is part of a quarter, and so on!

13. Snowflake schema
And here we put all the normalized dimensions together to get the snowflake schema.

2.2. Running from star to snowflake
After learning about the snowflake schema, you convert the current star schema into a snowflake schema. 
To do this, you normalize route_dim and week_dim. Which option best describes the resulting new tables after doing this?

The tables runs_fact, route_dim, and week_dim have been loaded.

week_dim is extended two dimensions with new tables for month and year. 
route_dim is extended two dimensions with new tables for city and park.

Hint
Look through the tables route_dim and week_dim to see what columns hold repeated information.
Remember how dimensions can connect to each other via foreign keys, like the city, state, and country variables in the slides?

2.3. Adding foreign keys
Foreign key references are essential to both the snowflake and star schema. 
When creating either of these schemas, correctly setting up the foreign keys is vital because they connect dimensions to the fact table. 
They also enforce a one-to-many relationship, 
because unless otherwise specified, a foreign key can appear more than once in a table and primary key can appear only once.

The fact_booksales table has three foreign keys: book_id, time_id, and store_id. 
In this exercise, the four tables that make up the star schema below have been loaded. However, the foreign keys still need to be added.

Instructions
In the constraint called sales_book, set book_id as a foreign key.
In the constraint called sales_time, set time_id as a foreign key.
In the constraint called sales_store, set store_id as a foreign key.

Hint
The table that has the foreign keys is the one that will be altered.
The primary keys of the dimension tables need to be referenced as foreign keys.
The (___) holds the column name that will serve as the foreign key.

Code:
-- Add the book_id foreign key
ALTER TABLE fact_booksales ADD CONSTRAINT sales_book
    FOREIGN KEY (book_id) REFERENCES dim_book_star (book_id);
    
-- Add the time_id foreign key
ALTER TABLE fact_booksales ADD CONSTRAINT sales_time
   FOREIGN KEY (time_id) REFERENCES dim_time_star (time_id);
    
-- Add the store_id foreign key
ALTER TABLE fact_booksales ADD CONSTRAINT sales_store
   FOREIGN KEY (store_id) REFERENCES dim_store_star (store_id);
   
The foreign keys have been added so now we can ensure data consistency whenever new data is inserted to the database.

2.4. Extending the book dimension
In the video, we saw how the book dimension differed between the star and snowflake schema. 
The star schema's dimension table for books, dim_book_star, has been loaded and below is the snowflake schema of the book dimension.

In this exercise, you are going to extend the star schema to meet part of the snowflake schema's criteria. 
Specifically, you will create dim_author from the data provided in dim_book_star.

Instructions 1/2
Create dim_author with a column for author.
Insert all the distinct authors from dim_book_star into dim_author.

Code:
-- Create a new table for dim_author with an author column
CREATE TABLE dim_author (
    author varchar(256)  NOT NULL
);

-- Insert authors 
INSERT INTO dim_author
SELECT DISTINCT author FROM dim_book_star;

Instructions 2/2
Alter dim_author to have a primary key called author_id.
Output all the columns of dim_author.

Code:
-- Create a new table for dim_author with an author column
CREATE TABLE dim_author (
    author varchar(256)  NOT NULL
);

-- Insert authors 
INSERT INTO dim_author
SELECT DISTINCT author FROM dim_book_star;

-- Add a primary key 
ALTER TABLE dim_author ADD COLUMN author_id SERIAL PRIMARY KEY;

-- Output the new table
SELECT * FROM dim_author;

You've created a dimension table that succesfully meets the schema criteria - it has all the authors with no repeats and unique author_ids. 
If we were to continue completing the star schema, we would need to create tables for the other dimensions using similar code.

2.5. Normalized and denormalized databases
1. Normalized and denormalized databases
Welcome back! Now that we have a grasp on normalization, let's talk about why we would want to normalize a database.

2. Back to our book store example
You should be familiar with these two schemas by now. 
They're both storing fictional company data on the sales of books in bulk to stores across the US and Canada. 
On the left, you have the star schema with denormalized dimension tables. 
On the right, you have the snowflake schema with normalized dimension tables. 
The normalized database looks way more complicated. And it is in some ways. 
For example, let's say you wanted to get the quantity of all books by Octavia E. Butler sold in Vancouver in Q4 of 2018.

3. Denormalized query
Based on the denormalized schema, you can run the following query to accomplish this. 
It's composed of 3 joins, which makes sense based on the three dimension tables in the star schema.

4. Normalized query
What would the query look like on the normalized schema? A lot longer. It doesn't even fit one slide!

5. Normalized query (continued)
There's a total of 8 inner joins. This makes sense based on the snowflake schema diagram. 
The normalized snowflake schema has considerably more tables. This means more joins, which means slower queries. 
So why would we want to normalize a database?

6. Normalization saves space
Normalization saves space. This isn't intuitive seeing how normalized databases have more tables. 
Let's take a look at the store table in our denormalized database. 
Here we see a lot of repeated information in bold - such as USA, California, New York, and Brooklyn. 
This type of denormalized structure enables a lot of data redundancy.

7. Normalization saves space
If we normalize that previous schema, we get this: We see that although we are using more tables, there is no data redundancy. 
The string, Brooklyn, is only stored once. 
And the state records are stored separately because many cities share the same state, and country. 
We don't need to repeat that information, instead, we can have one record holding the string California. 
Here we see how normalization eliminates data redundancy.

8. Normalization ensures better data integrity
Normalization ensures better data integrity through its design. First, it enforces data consistency. 
Data entry can get messy, and at times people will fill out fields differently. 
For example, when referring to California, someone might enter the initials "CA". 
Since the states are already entered in a table, we can ensure naming conventions through referential integrity. 
Secondly, because duplicates are reduced, modification of any data becomes safer and simpler. 
Say in the previous example, you wanted to update the spelling of a state - 
you wouldn't have to find each record referring to the state, instead, you could make that change in the states table by altering one record. 
From there, you can be confident that the new spelling will be enacted for all stores in that state. 
Lastly, since tables are smaller and organized more by object, its easier to alter the database schema. 
You can extend a smaller table without having to alter a larger table holding all the vital data.

9. Database normalization
To recap, here are the pros and cons of normalization. Now normalization seems appealing, especially for database maintenance. 
However, normalization requires a lot more joins making queries more complicated, which can make indexing and reading of data slower. 
Deciding between normalization and denormalization comes down to how read- or write- intensive your database is going to be.

10. Remember OLTP and OLAP?
Remember OLTP and OLAP? Can you guess which prefers normalization? Take a pause and think about it. Did you get it right? 
OLTP is write-intensive meaning we're updating and writing often. 
Normalization makes sense because we want to add data quickly and consistently. 
OLAP is read-intensive because we're running analytics on the data. 
This means we want to prioritize quicker read queries. 
Remember how much more joins the normalized query had over the denormalized query? OLAP should avoid that.

2.6. Querying the star schema
The novel genre hasn't been selling as well as your company predicted. 
To help remedy this, you've been tasked to run some analytics on the novel genre to find which areas the Sales team should target. 
To begin, you want to look at the total amount of sales made in each state from books in the novel genre.

Luckily, you've just finished setting up a data warehouse with the following star schema:

The tables from this schema have been loaded.

Instructions
Select state from the appropriate table and the total sales_amount.
Complete the JOIN on book_id.
Complete the JOIN to connect the dim_store_star table
Conditionally select for books with the genre novel.
Group the results by state.

Hint
The JOINs are done on the shared foreign keys between tables. In this schema, these keys end with _id.
The fact_booksales table needs to be joined with dim_store_star and dim_book_star.
The values of genre and state are held in dim_book_star and dim_store_star, respectively.

Code:
-- Output each state and their total sales_amount
SELECT dim_store_star.state, sum(sales_amount)
FROM fact_booksales
	-- Join to get book information
    JOIN dim_book_star on fact_booksales.book_id = dim_book_star.book_id
	-- Join to get store information
    JOIN dim_store_star on fact_booksales.store_id = dim_store_star.store_id
-- Get all books with in the novel genre
WHERE  
    dim_book_star.genre = 'novel'
-- Group results by state
GROUP BY
    dim_store_star.state;
    
We now have a nice list of the amount of money made from novels in each state. Note that it took only two joins to run this query.


2.7. Querying the snowflake schema
Imagine that you didn't have the data warehouse set up. 
Instead, you'll have to run this query on the company's operational database, which means you'll have to rewrite the previous query with the following snowflake schema:

The tables in this schema have been loaded. Remember, our goal is to find the amount of money made from the novel genre in each state.

Instructions
Select state from the appropriate table and the total sales_amount.
Complete the two JOINS to get the genre_id's.
Complete the three JOINS to get the state_id's.
Conditionally select for books with the genre novel.
Group the results by state.

Hint
The JOINs are done on the shared foreign keys between tables. In this schema, these keys end with _id.
To get the store information, we need to connect fact_booksales with dim_store_sf, dim_city_sf, and dim_state_sf.
The actual values of genre and state are held in dim_genre_sf and dim_state_sf, respectively.

Code:
-- Output each state and their total sales_amount
SELECT dim_state_sf.state, sum(sales_amount)
FROM fact_booksales
    -- Joins for the genre
    JOIN dim_book_sf on fact_booksales.book_id = dim_book_sf.book_id
    JOIN dim_genre_sf on dim_book_sf.genre_id = dim_genre_sf.genre_id
    -- Joins for the state 
    JOIN dim_store_sf on fact_booksales.store_id = dim_store_sf.store_id 
    JOIN dim_city_sf on dim_store_sf.city_id = dim_city_sf.city_id
	JOIN dim_state_sf on  dim_city_sf.state_id = dim_state_sf.state_id
-- Get all books with in the novel genre and group the results by state
WHERE  
    dim_genre_sf.genre = 'novel'
GROUP BY
   dim_state_sf.state;
   
This query was definitely more work than the previous one. 
It wouldn't be practical to have to think about all these joins if you're doing a lot of analytics.


2.8. Updating countries
Going through the company data, you notice there are some inconsistencies in the store addresses. 
These probably occurred during data entry, where people fill in fields using different naming conventions. 
This can be especially seen in the country field, and you decide that countries should be represented by their abbreviations. 
The only countries in the database are Canada and the United States, which should be represented as USA and CA.

In this exercise, you will compare the records that need to be updated in order to do this task on the star and snowflake schema. 
dim_store_star and dim_country_sf have been loaded.

Instructions 1/2
Output all the records that need to be updated in the star schema so that countries are represented by their abbreviations.

-- Output records that need to be updated in the star schema
SELECT * FROM dim_store_star
WHERE country != 'USA' AND country !='CA';

Only one record needs to be changed - Canada to CA. 
Updating is typically simpler in a snowflake schema 
because there are less records to update because redundant values are minimized to their own table 
(e.g., countries have their own table, dim_country_sf). 
Snowflake schemas are also better at enforcing naming conventions due to referential integrity. 
Note how there weren't any variations in how Canada and USA were referred to in the snowflake schema.


2.9. Extending the snowflake schema
The company is thinking about extending their business beyond bookstores in Canada and the US. 
Particularly, they want to expand to a new continent. 
In preparation, you decide a continent field is needed when storing the addresses of stores.

Luckily, you have a snowflake schema in this scenario. 
As we discussed in the video, the snowflake schema is typically faster to extend while ensuring data consistency. 
Along with dim_country_sf, a table called dim_continent_sf has been loaded. 
It contains the only continent currently needed, North America, and a primary key. 
In this exercise, you'll need to extend dim_country_sf to reference dim_continent_sf.

Instructions
Add a continent_id column to dim_country_sf with a default value of 1. 
Note thatNOT NULL DEFAULT(1) constrains a value from being null and defaults its value to 1.
Make that new column a foreign key reference to dim_continent_sf's continent_id.

Hint
Because there are only stores in Canada and the US, we can default the value to be 1.
All the alterations are being done to dim_country_sf.
dim_country_sf needs to have a foreign key reference to dim_continent_sf's continent_id.

-- Add a continent_id column with default value of 1
ALTER TABLE dim_country_sf
ADD continent_id int NOT NULL DEFAULT(1);

-- Add the foreign key constraint
ALTER TABLE dim_country_sf ADD CONSTRAINT country_continent
   FOREIGN KEY (continent_id) REFERENCES dim_continent_sf(continent_id);
   
-- Output updated table
SELECT * FROM dim_country_sf;

We have successfully extended the snowflake schema to have continents. 
That wasn't too bad as it only required altering one table and we can be sure of data consistency. 
This type of extension is a big benefit of the snowflake schema.

2.10. Normal forms
2. Normalization
Earlier, I introduced the concept of normalization. I gave this simplified definition. 
Here is a more formal definition provided by Adrienne Watt. Pause to read it. So what are these levels?

1 Database Design, 2nd Edition by Adrienne Watt
3. Normal forms (NF)
There are different extents to which you can normalize. These are called normal forms. 
Below is a list of them from least to most normalized. 
Each has its own set of rules, and some build on top of each other. We'll only cover the first three normal forms.

1 https://en.wikipedia.org/wiki/Database_normalization
4. 1NF rules
Let's begin with the first normal form. 
To comply with 1NF, each record must be unique and each cell must hold one value. 
Here's a simple table with student ids and emails, along with courses completed. 
All these rows are unique, but the courses_completed column has more than one course in two records.

5. In 1NF form
To rectify this, we can split the original table as such. Now, all the records are unique and each column has one value.

6. 2NF
Next is 2NF, which must satisfy 1NF. Beyond that, if the primary key is one column, then the table is 2NF. 
A composite primary key is when a primary key is made up of two or more columns. 
If the table has a composite primary key, then each non-key column must be dependent on all the keys. 
Let's look at a concrete example. In this table, we have the student and course id as a composite primary key. 
We then review the other columns and their dependence on these two keys. 
First is the instructor, which isn't dependent on the student_id - only the course_id. 
Meaning an instructor solely depends on the course, not the students who take the course. 
The same goes for the instructor_id column. However, the percent completed is dependent on both the student and the course id.

7. In 2NF form
To convert it, we can create two new tables that satisfy the conditions of 2NF.

8. 3NF
On to 3NF, where you might've correctly guessed requires 2NF to be satisfied. 3NF doesn't allow transitive dependencies. 
This means that non-primary key columns can't depend on other non-primary key columns. Let's take a look at an example. 
Course_id is the primary key so we can ignore this column. Instructor_id and Instructor definitely depend on each other. 
Tech does not depend on the instructor as an instructor can teach different technologies.

9. In 3NF
We can replace the table from before into these two tables to meet 3NF criteria. 
These tables have no transitive dependencies and they also meet 2NF as there are no composite primary keys.

10. Data anomalies
We've covered these first three normal forms that increase in normalization. 
It's time to consider why we would want to put effort into normalizing a database even more? Why isn't 1NF enough? 
A database that isn't normalized enough is prone to three types of anomaly errors: update, insertion, and deletion.

11. Update anomaly
An update anomaly is a data inconsistency that can arise when updating a database with redundancy. 
For example, take this simple table. It holds the id's and email of students, and their enrolled courses. 
If we want to update the email of student 520, we would have to update multiple records. 
It may sound easy to update multiple records, 
but it's risky because it depends on the user updating- if they remember this redundancy.
And this is a simple example - as we scale, it's harder to keep track of these redundancies.

12. Insertion anomaly
An insertion anomaly is when you are unable to add a new record due to missing attributes. 
For example, if a student signs up for DataCamp, but doesn't start any courses, they cannot be put into this database. 
The only exception is if the enrolled_in column can accept nulls. 
The dependency between columns in the same table unintentionally restricts what can be inserted into the table.

13. Deletion anomaly
A deletion anomaly happens when you delete a record and unintentionally delete other data. 
For example, if you were to delete any of these students, 
you would lose the course information provided in the columns enrolled_in and taught_by. 
This could be resolved if we put that information in another table.

14. Data anomalies
The more normalized the database, the less prone it will be to these anomalies. 
For example, most 3NF tables can't have an update, insertion, and deletion anomalies. This makes normalization sound great. 
But, don't forget the downsides of normalization from the last video! Remember those long queries?

2.11. Converting to 1NF
In the next three exercises, you'll be working through different tables belonging to a car rental company. 
Your job is to explore different schemas and gradually increase the normalization of these schemas through the different normal forms. 
At this stage, we're not worried about relocating the data, but rearranging the tables.

A table called customers has been loaded, which holds information about customers and the cars they have rented.

Instructions 1/2
Question: Does the customers table meet 1NF criteria?
--- No, because there are multiple values in cars_rented and invoice_id

Instructions 2/2
cars_rented holds one or more car_ids and invoice_id holds multiple values. 
Create a new table to hold individual car_ids and invoice_ids of the customer_ids who've rented those cars.
Drop two columns from customers table to satisfy 1NF

Hint
Remember that it is the cars_rented and invoice_id columns that violate 1NF.

Code:
-- Create a new table to hold the cars rented by customers
CREATE TABLE cust_rentals (
  customer_id INT NOT NULL,
  car_id VARCHAR(128) NULL,
  invoice_id VARCHAR(128) NULL
);

-- Drop a column from customers table to satisfy 1NF
ALTER TABLE customers
DROP COLUMN cars_rented,
DROP COLUMN invoice_id;

We now have two tables: (1) customers which holds customer information 
and (2) cust_rentals which holds the car_ids rented by different customer_ids. 
This satisfies 1NF. In a real situation, we would need to fill the new table before dropping any columns.


2.12. Converting to 2NF
Let's try normalizing a bit more. In the last exercise, you created a table holding customer_ids and car_ids. 
This has been expanded upon and the resulting table, customer_rentals, has been loaded for you. 
Since you've got 1NF down, it's time for 2NF.

Instructions 1/2
Question: Why doesn't customer_rentals meet 2NF criteria?
---> Because there are non-key attributes describing the car that only depend on one primary key, car_id.

Instructions 2/2
Create a new table for the non-key columns that were conflicting with 2NF criteria.
Drop those non-key columns from customer_rentals.

Code:
-- Create a new table to satisfy 2NF
CREATE TABLE cars (
  car_id VARCHAR(256) NULL,
  model VARCHAR(128),
  manufacturer VARCHAR(128),
  type_car VARCHAR(128),
  condition VARCHAR(128),
  color VARCHAR(128)
);

-- Drop columns in customer_rentals to satisfy 2NF
ALTER TABLE customer_rentals
DROP COLUMN model,
DROP COLUMN manufacturer, 
DROP COLUMN type_car,
DROP COLUMN condition,
DROP COLUMN color;

model, manufacturer, type_car, conditions, and colors depend on car_id, 
but are independent of the other two primary keys, customer_id and start_date. 
The customer or start date cannot change these attributes. 
Hence, we have put these columns in a new table and dropped them from customer_rentals.


2.13. Converting to 3NF
Last, but not least, we are at 3NF. In the last exercise, you created a table holding car_idss and car attributes. 
This has been expanded upon. For example, car_id is now a primary key. The resulting table, rental_cars, has been loaded for you.

Instructions 1/2
Question: Why doesn't rental_cars meet 3NF criteria?
---> Because there are two columns that depend on the non-key column, model.

Instructions 2/2
Create a new table for the non-key columns that were conflicting with 3NF criteria.
Drop those non-key columns from rental_cars.

Code:
CREATE TABLE car_model(
  model VARCHAR(128),
  manufacturer VARCHAR(128),
  type_car VARCHAR(128)
);

-- Drop columns in rental_cars to satisfy 3NF
ALTER TABLE rental_cars
DROP COLUMN manufacturer, 
DROP COLUMN type_car;

You did it - the first three normal forms! Can you see how these 3NF tables help reduce data redundancy and potential data anomalies?

3. Database Views
"""Get ready to work with views! In this chapter, you will learn how to create and query views. On top of that, 
   you'll master more advanced capabilities to manage them and end by identifying the difference 
   between materialized and non-materialized views."""

3.1. Database views
2. Database views
So, what are views? Wikipedia provides the following definition. Pause to read it. 
Essentially, views are virtual tables that are not part of the physical schema. 
A view isn't stored in physical memory; instead, the query to create the view is. 
The data in a view comes from data in tables of the same database. 
Once a view is created, you can query it like a regular table. 
The benefit of a view is that you don't need to retype common queries. 
It allows you to add virtual tables without altering the database's schema.

1 https://en.wikipedia.org/wiki/View_(SQL)
3. Creating a view (syntax)
Views are simple to create. You take the query of interest and add a line before it to name the view, as such.

4. Creating a view (example)
Here's an example. This is part of last chapter's snowflake schema. 
Let's say analysts at your company are often running analytics on the science fiction genre. 
To help their workflow, you want to create a view specifically dedicated to the science fiction genre and its associated book titles and authors.

5. Creating a view (example)
The query would look something like this. To convert this query into a view, you would add a CREATE VIEW statement like so.

6. Querying a view (example)
After executing the code from the last slide, you can query the view.

7. Behind the scenes
scifi_books isn't a real table with physical memory. When we run this select statement, the following query is actually being run.

8. Viewing views
It's important to keep track of the views in your database. 
To get all the views in your database, you can run a query on the INFORMATION_SCHEMA.views table. 
Note that this command is specific to PostgreSQL. 
If you are using another DBMS, look at its documentation to find the equivalent command. 
If you run this command, you will get a long list of views. That's because DBMS's have their own built-in views. 
To exclude system views and to get to views you've created, use this query. 
It excludes views from pg_catalog and information_schema which are built-in view categories.

9. Benefits of views
Can you see why views are useful? First off, a view doesn't take up any storage except for the query statement, which is minimal. 
Views act as a form of access control. 
For example, instead of giving a user access to columns that may have sensitive information, you can restrict what they can see via a view. 
Perhaps most importantly, views mask the complexity of queries. 
Remember those snowflake schemas from the last chapter and their joins? 
Views are handy for views normalized past the 2NF. You can make those common joins - such as aggregating dates or genres - into views. 
The users of your database will thank you for views because they won't have to spend as much time thinking about how to join tables.

10. Exercises
In this chapter's exercises, we'll be using a database of Pitchfork reviews from Kaggle. Pitchfork is a music magazine that publishes reviews. 
The database schema looks like this. 
The main table Reviews holds the url of the review, the title of the work being reviewed, and the score it received. 
It has more information on the author of the review and date of publication. 
The reviewid field is a foreign key to tables: content, genres, artist, and labels. Content holds the text of the review.

https://www.kaggle.com/nolanbconaway/pitchfork-data


3.2. Tables vs. views
Views have been described as "virtual tables". It's true that views are similar to tables in certain aspects, but there are key differences. 
In this exercise, you will organize these differences and similarities.

Instructions
Organize these characteristics into the category that they describe best.

Only Tables
-Part of the physical schema of a database

Views and Tables
-Has access control
-Contains rows and columns
-Can be queried

Only Views
-Always defined by a query
-Takes up less memory


3.3. Viewing views
Because views are very useful, it's common to end up with many of them in your database. 
It's important to keep track of them so that database users know what is available to them.

The goal of this exercise is to get familiar with viewing views within a database and interpreting their purpose. 
This is a skill needed when writing database documentation or organizing views.

Instructions 1/3
Query the information schema to get views.
Exclude system views in the results.

-- Get all non-systems views
SELECT * FROM information_schema.views
WHERE table_schema NOT IN ('pg_catalog', 'information_schema');

Instructions 2/3
Question: What does view1 do?
---> Returns the content records that have reviews of more than 4000 characters.

Instructions 3/3
Question: What does view2 do?
---> Returns the top 10 highest scored reviews published in 2017.

Did view1 and view2 give you more ideas of how views can be used? 
Note that unlike this exercise, you should always give views descriptive names for views!


3.4. Creating and querying a view
Have you ever found yourself running the same query over and over again? 
Maybe, you used to keep a text copy of the query in your desktop notes app, but that was all before you knew about views!

In these Pitchfork reviews, we're particularly interested in high-scoring reviews 
and if there's a common thread between the works that get high scores. 
In this exercise, you'll make a view to help with this analysis 
so that we don't have to type out the same query often to get these high-scoring reviews.

Instructions 1/2
Create a view called high_scores that holds reviews with scores above a 9.

Code:
-- Create a view for reviews with a score above 9
CREATE VIEW high_scores AS
SELECT * FROM REVIEWS
WHERE score > 9;

Instructions 2/2
Count the number of records in high_scores that are self-released in the label field of the labels table.

Code:
-- Create a view for reviews with a score above 9
CREATE VIEW high_scores AS
SELECT * FROM REVIEWS
WHERE score > 9;

-- Count the number of self-released works in high_scores
SELECT COUNT(*) FROM high_scores
INNER JOIN labels ON high_scores.reviewid = labels.reviewid
WHERE label = 'self-released';

you've just created and queried a view!


3.5. Managing views
2. Creating more complex views
We've kept our views simple. It's worth pointing out that views can get as complicated and creative as you choose. 
Think of the aggregation, join, and conditional functions and clauses available to you in SQL. 
Of course, the query to create the view still has to run, so you need to be aware of long query execution time.

3. Granting and revoking access to a view
In the last video, we talked about how views are helpful for access control. 
To give and remove user permissions, we use the SQL GRANT and REVOKE command. 
The syntax is as follows. First, you list the relevant privileges after the GRANT and the REVOKE command. 
There are several types of privileges users can execute, and here I list the most common. 
Then you indicate on which object and for which role. You use the TO clause and FROM clause, respectively, for grant and revoke. 
In chapter 4, we'll go more in-depth about different types of roles and privileges. For now, we just need a high-level understanding.

4. Granting and revoking example
Here's an example. The update privilege on an object called ratings is being granted to public. 
PUBLIC is a SQL term that encompasses all users. All users can now use the UPDATE command on the ratings object. 
In the second line, the user db_user will no longer be able to INSERT on the object films.

5. Updating a view
A user can update a view if they have the necessary privilege. If you need a refresher, here's a simple example of the UPDATE command. 
You may be wondering, how is it even possible to update a view? 
That's a good question because if you remember correctly, a view isn't a physical table. 
Therefore, when you run an update, you are updating the tables behind the view. Hence, only particular views are updatable. 
There are criteria for a view to be considered updatable. The criteria depend on the type of SQL being used. 
Generally, the view needs to be made up of one table and can't rely on a window or aggregate function.

1 https://www.postgresql.org/docs/9.5/sql-update.html
6. Inserting into a view
The INSERT command is in a similar case as the UPDATE command. 
When you run an insert command into a view, you're again really inserting into the table behind it. 
The criteria for inserting is usually very similar to updatable views.

1 https://www.postgresql.org/docs/9.5/sql-insert.html
7. Inserting into a view
Generally, avoid modifying data through views. It's usually a good idea to use views for read-only purposes only.

1 https://www.postgresql.org/docs/9.5/sql-insert.html
8. Dropping a view
Dropping a view is straightforward with the DROP command. There are two useful parameters to know about: CASCADE and RESTRICT. 
Sometimes there are SQL objects that depend on views. 
For example, it's not unusual for views to build off of other views in larger databases. 
The RESTRICT parameter is the default and returns an error when you try to drop a view that other objects depend on. 
The CASCADE parameter will drop the view and any object that depends on that view.

9. Redefining a view
Say you want to change the query a view is defined by. To do this, you can use the CREATE OR REPLACE command. 
If a view_name exists, it is replaced by the new_query specified. However, there are limitations to this. 
The new query must generate the same column names, column order, and column data types as the existing query. 
The column output may be different, as long as those conditions are met. New columns may be added at the end. 
If this criteria can't be met, the solution is to drop the existing view and create a new one.

1 https://www.postgresql.org/docs/9.2/sql-createview.html
10. Altering a view
Last but not least, the auxiliary properties of a view can be altered. I list the various options here. 
This includes changing the name, owner, and schema of a view.

https://www.postgresql.org/docs/9.2/sql-alterview.html


3.6. Creating a view from other views
Views can be created from queries that include other views. 
This is useful when you have a complex schema, potentially due to normalization, because it helps reduce the JOINS needed. 
The biggest concern is keeping track of dependencies, specifically how any modifying or dropping of a view may affect other views.

In the next few exercises, we'll continue using the Pitchfork reviews data. There are two views of interest in this exercise. 
top_15_2017 holds the top 15 highest scored reviews published in 2017 with columns reviewid,title, and score. 
artist_title returns a list of all reviewed titles and their respective artists with columns reviewid, title, and artist. 
From these views, we want to create a new view that gets the highest scoring artists of 2017.

Instructions 1/2
Create a view called top_artists_2017 with one column artist holding the top artists in 2017.
Join the views top_15_2017 and artist_title.
Output top_artists_2017.

Code:
-- Create a view with the top artists in 2017
CREATE VIEW top_artists_2017 AS
-- with only one column holding the artist field
SELECT artist_title.artist FROM artist_title
INNER JOIN top_15_2017
ON artist_title.reviewid = top_15_2017.reviewid;

-- Output the new view
SELECT * FROM top_artists_2017;

Instructions 2/2
Question: Which is the DROP command that would drop both top_15_2017 and top_artists_2017?
---> DROP VIEW top_15_2017 CASCADE;

Because top_artists_2017 depends on top_15_2017, the CASCADE parameter indicates both should be dropped.

3.7. Granting and revoking access
Access control is a key aspect of database management. 
Not all database users have the same needs and goals, from analysts, clerks, data scientists, to data engineers. 
As a general rule of thumb, write access should never be the default and only be given when necessary.

In the case of our Pitchfork reviews, we don't want all database users to be able to write into the long_reviews view. 
Instead, the editor should be the only user able to edit this view.

Instructions
Revoke all database users' update and insert privileges on the long_reviews view.
Grant the editor user update and insert privileges on the long_reviews view.

Hint
Use PUBLIC to indicate all database users.
REVOKE and GRANT use different clauses, TO and FROM, to indicate which role's privilege is being modified.

Code:
-- Revoke everyone's update and insert privileges
REVOKE UPDATE, INSERT ON long_reviews FROM PUBLIC; 

-- Grant editor update and insert privileges 
GRANT UPDATE, INSERT ON long_reviews TO editor;

The editor user is now the only person who can UPDATE and INSERT on the long_reviews view


3.8. Updatable views
In a previous exercise, we've used the information_schema.views to get all the views in a database. 
If you take a closer look at this table, you will notice a column that indicates whether the view is updatable.

Which views are updatable?
---> long_reviews

Hint
In a previous exercise called "Viewing views", you ran a command that returned a table with information on existing views.
Remember that views are virtual tables and any update has to comply with the table(s) that make up the view.

long_reviews is updatable because it's made from one table and doesn't have any special clauses.


3.9. Redefining a view
Unlike inserting and updating, redefining a view doesn't mean modifying the actual data a view holds. 
Rather, it means modifying the underlying query that makes the view. 
In the last video, we learned of two ways to redefine a view: 
(1) CREATE OR REPLACE and 
(2) DROP then CREATE. CREATE OR REPLACE can only be used under certain conditions.

The artist_title view needs to be appended to include a column for the label field from the labels table.

Instructions 1/2
Question: Can the CREATE OR REPLACE statement be used to redefine the artist_title view?
---> Yes, as long as the label column comes at the end.

Instructions 2/2
Redefine the artist_title view to include a column for the label field from the labels table.

Code:
-- Redefine the artist_title view to have a label column
CREATE OR REPLACE VIEW artist_title AS
SELECT reviews.reviewid, reviews.title, artists.artist, labels.label
FROM reviews
INNER JOIN artists
ON artists.reviewid = reviews.reviewid
INNER JOIN labels
ON labels.reviewid = reviews.reviewid;

SELECT * FROM artist_title;

You redefined the artist_title succesfully using the CREATE OR REPLACE statement. 
If we had wanted to change the order of the columns completely, we would have had to drop the table and then create a new one using the same name.

3.10. Materialized views
2. Two types of views
There are two types of views. When you come across the term "view" plainly, it is most likely referring to non-materialized views. 
Accordingly, in the past two videos covering views, I defined views as non-materialized views.

3. Two types of views
In this video, we will look into materialized views. 
As the names begin to hint, materialized views are physically materialized, while non-materialized remain virtual. What does this mean?

4. Materialized views
Instead of storing a query, a materialized view stores the query results. These query results are stored on disk. 
This means the query becomes precomputed via the view. 
When you query a materialized view, it accesses the stored query results on the disk, 
rather than running the query like a non-materialized view and creating a virtual table. 
Materialized views are refreshed or rematerialized when prompted. 
By refreshed or rematerialized, I mean that the query is run and the stored query results are updated. 
This can be scheduled depending on how often you expect the underlying query results are changing. 
At Datacamp, some of our views are refreshed once-a-day during non-working hours, and others are refreshed every hour.

5. When to use materialized views
Materialized views are great if you have queries with long execution time. 
Some queries take hours to complete if you are crunching a lot of data or have complex joins. 
Materialized views allow data scientists and analysts to run long queries and get results very quickly. 
The caveat is the data is only as up-to-date as the last time the view was refreshed. 
So, you shouldn't use materialized views on data that is being updated often, because then analyses will be run too often on out-of-date data. 
Materialized views are particularly useful in data warehouses. 
Data warehouses are typically used for OLAP, meaning more for analysis than writing to data. 
This means less worry about out-of-date data. 
Furthermore, the same queries are often run in data warehouses, and the computational cost of them can add up.

6. Implementing materialized views
Creating materialized views is very similar to creating non-materialized views, except that you specify "Materialized" in the SQL statement. 
You use the "REFRESH MATERIALIZED VIEW" syntax to refresh a view. There isn't a PostgresSQl command to schedule refreshing views. 
However, there are several ways to do so, like using cron jobs. 
I won't get into the details of cron as it is outside of the scope of the course, but cron is a UNIX based job scheduler.

7. Managing dependencies
As we learned in the last video, it's common to build views from other views. The same can be said about materialized views. 
Unlike non-materialized views, you need to manage when you refresh materialized views when you have dependencies.

8. Dependency example
For example, let's say you have two materialized views: X and Y. Y uses X in its query; meaning Y depends on X. 
X doesn't depend on Y as it doesn't use Y in its query. Let' s say X has a more time-consuming query. 
If Y is refreshed before X's refresh is completed, then Y now has out-of-date data.

9. Managing dependencies
This creates a dependency chain when refreshing views. Scheduling when to refresh is not trivial. 
Refreshing them all at the same time is not the most efficient when you consider query time and dependencies.

10. Tools for managing dependencies
Companies that have many materialized views, 
use directed acyclic graphs to track dependencies and pipeline scheduler tools, like Airflow and Luigi, to schedule and run REFRESH statements. 
A directed acyclic graph, also known as a DAG, is a finite directed graph with no cycles. 
Here, you can see an example where the directed arrows reflect a dependency in a certain direction where one node depends on another. 
The no cycles part is important because two views can't depend on each other - only one can rely on another.


3.11. Materialized versus non-materialized
Materialized and non-materialized are two distinct categories of views. 
In this exercise, you will organize their differences and similarities.

Instructions
Organize these characteristics into the category that they describe best.

Hint
Materialized views are physically materialized, meaning the data it contains is stored on disk

Non-Materialized Views
-Better to use on write-intensive databases
-Always returns up-to-date data

Non-Materialized and Materialized Views
-Helps reduce the overhead of writing queries
-Can be used in a data warehouse

Materilized Views
-Stores the query result on disk
-Consume more storage


3.12. Creating and refreshing a materialized view
The syntax for creating materialized and non-materialized views are quite similar because they are both defined by a query. 
One key difference is that we can refresh materialized views, while no such concept exists for non-materialized views. 
It's important to know how to refresh a materialized view, otherwise the view will remain a snapshot of the time the view was created.

In this exercise, you will create a materialized view from the table genres. A new record will then be inserted into genres. 
To make sure the view has the latest data, it will have to be refreshed.

Instructions
Create a materialized view called genre_count that holds the number of reviews for each genre.
Refresh genre_count so that the view is up-to-date.

Hint
Creating a materialized view is similar to creating a non-materialized view (CREATE VIEW view_name AS), except with an addition.
The statement for refreshing a materialized view begins with REFRESH.

Code:
-- Create a materialized view called genre_count 
CREATE MATERIALIZED VIEW genre_count AS
SELECT genre, COUNT(*) 
FROM genres
GROUP BY genre;

INSERT INTO genres
VALUES (50000, 'classical');

-- Refresh genre_count
REFRESH MATERIALIZED VIEW genre_count;

SELECT * FROM genre_count;


3.13. Managing materialized views
Why do companies use pipeline schedulers, such as Airflow and Luigi, to manage materialized views?
--> To refresh materialized views with consideration to dependences between views.
Hint
Pipeline schedulers are used to automatically execute reoccurring tasks.

These pipeline schedulers help visualize dependencies and create a logical order for refreshing views.

4. Database Management
"""This final chapter ends with some database management-related topics. 
    You will learn how to grant database access based on user roles, how to partition tables into smaller pieces, what to keep in mind 
    when integrating data, and which DBMS fits your business needs best."""

4.1. Database roles and access control
1. Database roles and access control
In this chapter, we're going to cover different topics within database management, beginning with database roles and access control.

2. Granting and revoking access to a view
In the last chapter, we learned how views are helpful for access control. We granted and revoked a user's access to a view (or any object!). 
We also briefly discussed roles and privileges in the context of access control.

3. Database roles
Now we'll dive deeper. First, database roles. Roles are used to manage database access permissions. 
A database role is an entity that contains information that 
Firstly, define its privileges, like whether that role can login, create databases, and many more, 
and Secondly, interact with the client authentication system, like what the role's password is. Roles can be assigned to one or more users. 
Since roles are global, you can reference roles across all individual databases in your cluster.

4. Create a role
Say you are about to hire a bunch of data analysts. You can create the data_analyst role with the CREATE ROLE SQL command. 
The information that defines what the data_analyst role can do is currently empty. 
We can also set some, but not all, of this information when creating a role, too. 
Say you're hiring an intern whose internship ends at the end of the year. 
You create the role intern, specifying the password attribute and valid until date attribute. 
One second into 2020, the password is no longer valid. 
Say you want to create an admin role with the ability to create databases: create role admin with the attribute CREATEDB. 
For now, just know that attributes define some (but, again, not all) of what your roles can do. 
To change an attribute for an already created role, you use the ALTER keyword, here allowing the admin role to create roles too.

1 http://bit.ly/postgresql_attributes
5. GRANT and REVOKE privileges from roles
To grant specific access control privileges on objects, like tables, views, and schemas, you use GRANT and REVOKE. 
Say you want all of your data analysts to be able to update the ratings table. Grant that role update access. 
Don't need it anymore? Revoke it. Here is list of privileges for roles in PostgreSQL. You'll only use the first few in this course.

1 http://bit.ly/postgresql_privileges
6. Users and groups (are both roles)
Now, a common misunderstanding: a role can be a user role or a group role. 
A role may be a member of other roles, and we call the larger role a group. 
As this graphic shows, the concept of roles encompasses the concepts of “users” and “groups”. Database roles - 
that is, user roles AND group roles - are conceptually completely separate from operating system users. 
Sometimes you will create a user role that belongs to one specific user, but that's not required.

7. Users and groups (are both roles)
Think of the data_analyst role as a group role: you want all of your data analysts to have the same level of access. 
Think of the intern role as a user role. Sometimes you'll use the actual user's name.

8. Users and groups (are both roles)
Say Alex is hired as an intern to support the data analysts, so you want them to have the same level of access. 
In PostgreSQL, to add the user role alex to the group role data_analyst, you write GRANT data_analyst TO alex.
Alex can do data analyst work now! If Alex no longer needs to do that type of work, use REVOKE to remove them from the group.

9. Common PostgreSQL roles
PostgreSQL has a set of default roles which provide access to commonly needed privileged capabilities and information. 
These are beyond the scope of this course.

http://bit.ly/default_roles_postgresql
10. Benefits and pitfalls of roles
Roles are great because while employees come and go; roles live on. They can even be created before those employees get accounts. 
By grouping together common access levels, database administrators save time. 
One common pitfall: sometimes a role gives an individual too much access. 
You need to be careful and mindful of your roles and their access levels.

4.2. Create a role
A database role is an entity that contains information that define the role's privileges and interact with the client authentication system. 
Roles allow you to give different people (and often groups of people) that interact with your data different levels of access.

Imagine you founded a startup. You are about to hire a group of data scientists. 
You also hired someone named Marta who needs to be able to login to your database. 
You're also about to hire a database administrator. In this exercise, you will create these roles.

Instructions 1/3
Create a role called data_scientist.

CREATE ROLE data_scientist;

Instructions 2/3
Create a role called marta that has one attribute: the ability to login (LOGIN).

CREATE ROLE marta LOGIN;

Instructions 3/3
Create a role called admin with the ability to create databases (CREATEDB) and to create roles (CREATEROLE).

CREATE ROLE admin WITH CREATEDB CREATEROLE;

You created a group role, data_scientist, that you can populate later with whatever access level you deem appropriate. 
Marta can login. The admin, whoever holds that role, has the ability to create databases and manage roles. 
You now know how to create roles to specify different levels of access for individuals and groups of individuals, 
which is good database management practice.

4.3. GRANT privileges and ALTER attributes
Once roles are created, you grant them specific access control privileges on objects, like tables and views. 
Common privileges being SELECT, INSERT, UPDATE, etc.

Imagine you're a cofounder of that startup and you want all of your data scientists to be able to update 
and insert data in the long_reviews view. 
In this exercise, you will enable those soon-to-be-hired data scientists by granting their role (data_scientist) those privileges. 
Also, you'll give Marta's role a password.

Instructions
Grant the data_scientist role update and insert privileges on the long_reviews view.
Alter Marta's role to give her the provided password.

Hint
For the first bullet, you'll need the GRANT, UPDATE, and INSERT keywords.
For the second bullet, you'll need the ALTER, WITH, and PASSWORD keywords.

Code:
-- Grant data_scientist update and insert privileges
GRANT UPDATE, INSERT ON long_reviews TO data_scientist;

-- Give Marta's role a password
ALTER ROLE marta WITH PASSWORD 's3cur3p@ssw0rd';

Everyone in the data_scientist role (which is currently no one, 
though you're hiring shortly) is now able to update data and insert data in the long_reviews view. 
This view has business-critical data that's updated often so these privileges are key to your startup's success. 
Marta is happy because she has a password now, too!

4.4. Add a user role to a group role
There are two types of roles: user roles and group roles. 
By assigning a user role to a group role, a database administrator can add complicated levels of access to their databases with one simple command.

For your startup, your search for data scientist hires is taking longer than expected. 
Fortunately, it turns out that Marta, your recent hire, has previous data science experience and she's willing to chip in the interim. 
In this exercise, you'll add Marta's user role to the data scientist group role. 
You'll then remove her after you complete your hiring process.

Instructions
Add Marta's user role to the data scientist group role.
Celebrate! You hired multiple data scientists.
Remove Marta's user role from the data scientist group role.

Hint
For this first bullet, Marta's user role is called marta and the data scientist group role is called data_scientist. 
You'll need the GRANT and TO keywords.
For the second bullet, you'll need to do a little dance.
For the third bullet, you'll need the REVOKE and FROM keywords.

Code:
-- Add Marta to the data scientist group
GRANT data_scientist TO marta;

-- Celebrate! You hired data scientists.

-- Remove Marta from the data scientist group
REVOKE data_scientist FROM marta;


4.5. Table partitioning
1. Table partitioning
Welcome back! Now that we've covered access control of databases, it's time for something completely different: database partitioning.

2. Why partition?
Before we talk about what table partitioning, let's talk a bit about the why. 
When tables grow — we're talking hundreds of gigabytes or even terabytes here — queries tend to become slow. 
Even when we've set indices correctly, these indices can become so large they don't fit into memory. 
At a certain point, it can make sense to split a table up into multiple smaller parts. We call the process of doing this 'partitioning'.

3. Data modeling refresher
Note that, looking at the data modeling layers we saw in the first chapter, partitioning fits into the physical data model. 
Indeed, logically, the data you'll access or update is still the same. 
The difference is we distribute the data over several physical entities.

4. Vertical partitioning
When we talk about partitioning, there are two different types of partitioning. The first one we'll introduce is vertical partitioning. 
You saw in the second chapter that to normalize a table, you can use foreign keys and create new tables. 
As you saw, it can help you reduce redundant data. 
Vertical partitioning goes one step further and splits up a table vertically by its columns, even when it's already fully normalized.

5. Vertical partitioning: an example
In this example, you start with a table containing product data. It has four columns. 
After vertical partitioning, you could end up with two tables: one for the first three columns, and another for the last column. 
We can link them through a shared key. Let's say the fourth column, containing a long description, is retrieved very rarely. 
We could store the second table on a slower medium. 
Doing this would improve query time for the first table, as we need to scan less data for search queries.

6. Horizontal partitioning
For the remainder of this video, let's focus on the second type of partitioning: horizontal partitioning. 
Instead of splitting tables up over the columns, you can also split up tables over the rows. For example, you could split up data according to a timestamp. Specifically, all records related to 2019 could be in a separate partition from the ones of 2018.

7. Horizontal partitioning: an example
Let's look at an example. Let's say you have the following table where every row is a book sale. 
We could decide to partition the table according to the timestamp.

8. Horizontal partitioning: an example
You could create partitions according to the timestamp, and partition them by quarter. 
Different SQL dialects have different ways of creating partitioned tables. 
In this example, we'll look at PostgreSQL, where you can use something called declarative partitioning since PostgreSQL 10. 
First, you add the PARTITION BY clause to your table creation statement. 
You pass it the column you want to partition by, 'timestamp' in our case. 
Next, you have to create the partitions. 
To do this, use the PARTITION OF clause to create tables for the specific partitions. 
You can specify rules to partition by in the same statement. 
For a timestamp, you could use particular ranges of values, like this. 
Finally, it's advised to add an index to the column you used for partitioning.

9. Pros/cons of horizontal partitioning
Horizontal partitioning can help by optimizing indices, increasing the chance heavily-used parts of the index fit in memory. 
You could also move rarely accessed partitions to a slower medium. Both OLAP as OLTP can benefit from partitioning. 
There are some downsides though, as partitioning an existing table can be a hassle: you have to create a new table and copy over the data. 
Additionally, we can not always set the same type of constraints on a partitioned table, for example, the PRIMARY KEY constraint.

10. Relation to sharding
We can take partitioning one step further and distribute the partitions over several machines. 
When horizontal partitioning is applied to spread a table over several machines, it's called sharding. 
You can see how this relates to massively parallel processing databases, where each node, or machine, can do calculations on specific shards.

4.6. Reasons to partition
which one wouldn't be a good reason to use partitioning?
--Improve data integrity
Save records from 2017 or earlier on a slower medium
Easily extend partitioning to sharding, and thus making use of parallelization

4.7. Partitioning and normalization
In the video, you saw the differences between the two types of partitioning: vertical and horizontal partitioning. 
As you'd expect, the names suggest how these different strategies work.

It might be a bit challenging to distinguish normalization, which you saw in previous chapters, from partitioning.

Instructions
Can you classify the characteristics in the correct bucket?

Hint
Columns are vertically oriented.
Normalization, in contrast to partitioning, changes the logical model of the data.

Normalization
reduce redundancy in table
changes the logical data model

Vertical Partitioning
move specific columns to slower medium
move the third and fpurth column to separate table

Horizontal Partitioning
sharding is an extension on this, using multiple machines
use the time stamp to move rows from q4 in a specific table


4.8. Creating vertical partitions
In the video, you learned about vertical partitioning and saw an example.

For vertical partitioning, there is no specific syntax in PostgreSQL. 
You have to create a new table with particular columns and copy the data there. 
Afterward, you can drop the columns you want in the separate partition. 
If you need to access the full table, you can do so by using a JOIN clause.

In this exercise and the next one, you'll be working with the example database called pagila. 
It's a database that is often used to showcase PostgreSQL features. The database contains several tables. 
We'll be working with the film table. In this exercise, we'll use the following columns:

     film_id: the unique identifier of the film
     long_description: a lengthy description of the film

Instructions 1/2
Create a new table film_descriptions containing 2 fields: film_id, which is of type INT, and long_description, which is of type TEXT.
Occupy the new table with values from the film table.

Code:
-- Create a new table called film_descriptions
CREATE TABLE film_descriptions (
    film_id INT,
    long_description TEXT
);

-- Copy the descriptions from the film table
INSERT INTO film_descriptions
SELECT film_id, long_description FROM film;

Instructions 2/2
Drop the field long_description from the film table.
Join the two resulting tables to view the original table.

-- Create a new table called film_descriptions
CREATE TABLE film_descriptions (
    film_id INT,
    long_description TEXT
);

-- Copy the descriptions from the film table
INSERT INTO film_descriptions
SELECT film_id, long_description FROM film;
    
-- Drop the column in the original table
ALTER TABLE film DROP COLUMN long_description;

-- Join to create the original table
SELECT * FROM film 
JOIN film_descriptions USING(film_id);


Now you know how to CREATE, INSERT and ALTER statements!

4.9. Creating horizontal partitions
In the video, you also learned about horizontal partitioning.

The example of horizontal partitioning showed the syntax necessary to create horizontal partitions in PostgreSQL. 
If you need a reminder, you can have a look at the slides.

In this exercise, however, you'll be using a list partition instead of a range partition. 
For list partitions, you form partitions by checking whether the partition key is in a list of values or not.

To do this, we partition by LIST instead of RANGE. When creating the partitions, you should check if the values are IN a list of values.

We'll be using the following columns in this exercise:

film_id: the unique identifier of the film
title: the title of the film
release_year: the year it's releasedfilm_id: the unique identifier of the film
title: the title of the film
release_year: the year it's released

Instructions 1/3
Create the table film_partitioned, partitioned on the field release_year.

Code:
-- Create a new table called film_partitioned
CREATE TABLE film_partitioned (
  film_id INT,
  title TEXT NOT NULL,
  release_year TEXT
)
PARTITION BY LIST (release_year);

Instructions 2/3
Create three partitions: one for each release year: 2017, 2018, and 2019. Call the partition for 2019 film_2019, etc.

Code:
-- Create a new table called film_partitioned
CREATE TABLE film_partitioned (
  film_id INT,
  title TEXT NOT NULL,
  release_year TEXT
)
PARTITION BY LIST (release_year);

-- Create the partitions for 2019, 2018, and 2017
CREATE TABLE film_2019
	PARTITION OF film_partitioned FOR VALUES IN ('2019');

CREATE TABLE film_2018
	PARTITION OF film_partitioned FOR VALUES IN ('2018');

CREATE TABLE film_2017
	PARTITION OF film_partitioned FOR VALUES IN ('2017');


Instructions 3/3
Occupy the new table the three fields required from the film table.

Code:
-- Create a new table called film_partitioned
CREATE TABLE film_partitioned (
  film_id INT,
  title TEXT NOT NULL,
  release_year TEXT
)
PARTITION BY LIST (release_year);

-- Create the partitions for 2019, 2018, and 2017
CREATE TABLE film_2019
	PARTITION OF film_partitioned FOR VALUES IN ('2019');

CREATE TABLE film_2018
	PARTITION OF film_partitioned FOR VALUES IN ('2018');

CREATE TABLE film_2017
	PARTITION OF film_partitioned FOR VALUES IN ('2017');

-- Insert the data into film_partitioned
INSERT INTO film_partitioned
SELECT film_id, title, release_year FROM film;

-- View film_partitioned
SELECT * FROM film_partitioned;

As you can see, the data is not changed in the partitioned table. 
However, you might notice PostgreSQL orders the partitioned table differently by default.


4.10. Data integration
1. Data integration
You're now familiar with tables, databases, schemas and permissions. 
But what if your data is spread across different databases, formats, schemas and technologies? 
That's where data integration comes into play.

2. What is data integration
Data Integration combines data from different sources, formats, technologies to provide users with a translated and unified view of that data. 
Let's look at some examples.

3. Business case examples
A company could want a 360-degree customer view, to see all information departments have about a customer in a unified place. 
Another example is one company acquiring another, and needs to combine their respective databases. 
Legacy systems are also a common case of data integration. 
An insurance company with claims in old and new systems, would need to integrate data to query all claims at once.

4. Unified data model
There are a few things to consider when integrating data. What is your final goal? 
Your unified data model could be used to create dashboards, like graphs of daily sales, or data products, such as a recommendation engine. 
The final data model needs to be fast enough for your use-case.

5. Data sources
The necessary information is held in these data sources.

6. Data sources format
Which formats is each data source stored in? For example, it could be PostgreSQL, MongoDB or a CSV. 
You'll learn more about database management systems in the next lesson.

7. Unified data model format
Which format should the unified data model take? For example, Redshift, a data warehouse service offered by AWS.

8. Example: DataCamp
Say DataCamp is launching a skill assessment module. Marketing wants to know which customers to target. 
They need information from sales, stored in PostgreSQL, to see which customers can afford the new product. 
They also need information from the product department, stored in MongoDB to identify potential early adopters.

9. Update cadence - sales
Next, how often do you want to update the data? Updating daily would probably be sufficient for sales data.

10. Update cadence - air traffic
For a scenario like air traffic, you want real time updates.

11. Different update cadences
Your data sources can have different update cadences.

12. So simple?
So that’s it? You just plug your sources to the unified data model?

13. Not really
Not really. Your sources are in different formats, you need to make sure they can be assembled together.

14. Transformations
Enter transformations. 
A transformation is a program that extracts content from the table and transforms it into the chosen format for the unified model. 
These transformations can be hand-coded, but you would have to make and maintain a transformation for each data source.

15. Transformation - tools
You can also use a data integration tool, which provides the needed ETL. For example Apache Airflow or Scriptella.

16. Choosing a data integration tool
When choosing your tool, you must ensure that it's flexible enough to connect to all of your data sources. 
Reliable, so that it can still be maintained in a year. And it should scale well, anticipating an increase in data volume and sources.

17. Automated testing and proactive alerts
You should have automated testing and proactive alerts. 
If any data gets corrupted on its way to the unified data model, the system lets you know. 
For example, you could aggregate sales data after each transformation and ensure that the total amount remains the same.

18. Security
Security is also a concern: if data access was originally restricted, it should remain restricted in the unified data model.

19. Security - credit card anonymization
For example, business analysts using the unified data model should not have access to the credit card numbers. 
You should anonymize the data during ETL so that analysts can only access the first four numbers, to identify the type of card being used.

20. Data governance - lineage
For data governance purposes, you need to consider lineage: for effective auditing, 
you should know where the data originated and where it is used at all times.


4.11. Data integration do's and dont's

Hint
Data sources can be in any format, database management system or location.
Don't throw all you data together and make the integration in real-time without a business goal in mind.
You can easily reference the video by clicking the video icon in the top right corner.


4.12. Analyzing a data integration plan
You're a data analyst in a hospital that wants to make sure there is enough cough medicine should an epidemic break out. 
For this, you need to combine the historical health records with the upcoming appointments to see 
if you can detect a pattern similar to the last cold epidemic. 
Then, you need to make sure there is sufficient stock available or if the stock should be increased. 
To help tackle this problem, you created a data integration plan.

Which risk is not clearly indicated on the data integration plan?
---> You should indicate that you plan to anonymize patient health records.

Hint
This plan summarizes everything you have seen about data integration:

You know which departments own the original data.
You took lineage into account and showed that you can track where the patient data originates from.
You took data integrity into account and have automated tests before and after ETL.
You know the data is coming from PostgreSQL, MongoDB and a CSV file.

When working with sensitive data it is important to think about permissions. 
By default you should have the same access rights before and after data integration. 
If part of the data is essential, it should be anonymized, in this case you can keep the illnesses but remove identifying information.


4.13. Picking a Database Management System (DBMS)
1. Picking a Database Management System (DBMS)
In this final video, you will learn about Database Management Systems.

2. DBMS
DBMS stands for Database Management System. A DBMS is a system software for creating and maintaining databases. 
The DBMS manages three important aspects: the data, the database schema which defines the database’s logical structure, 
and the database engine that allows data to be accessed, locked and modified. 
Essentially, the DBMS serves as an interface between the database and end users or application programs.

3. DBMS types
Your choice of DBMS is informed by the type of database you need, which depends largely on the kind of data you have and how you want to use it. 
There are two common types of DBMSs: SQL DBMSs, and NoSQL DBMSs. Let's take a closer look.

4. SQL DBMS
A SQL DBMS, also called a Relational DataBase Management System, is a kind of DBMS based on the relational data model. 
This is what's been used in the course so far. 
RDBMSs typically employ SQL for managing and accessing data. 
Some examples of RDBMSs include SQL Server, PostgreSQL, and Oracle SQL. There are two reasons why you might consider an RDBMS. 
It's a good option when working with structured, unchanging data that will benefit from a predefined schema. 
Or if all data must be consistent without leaving room for error, such as with accounting systems for example.

5. NoSQL DBMS
Non-relational DBMSs are called NoSQL DBMSs. 
They’re much less structured than relational databases, and are document-centered, rather than table-centered. 
Data in NoSQL databases don’t have to fit into well-defined rows and columns. 
NoSQL is a good choice for those companies experiencing rapid data growth with no clear schema definitions. 
NoSQL offers much more flexibility than a SQL DBMS and is a solid option for companies who must analyze large quantities of data or manage data structures that vary. 
NoSQL DBMSs are generally classified as one of four types: key-value store, document store, columnar, or graph databases.

6. NoSQL DBMS - key-value store
A key-value database stores combinations of keys and values. The key serves as a unique identifier to retrieve an associated value. 
Values can be anything from simple objects, like integers or strings, to more complex objects, like JSON structures. 
They are most frequently used for managing session information in web applications. 
For example, managing shopping carts for online buyers. An example DBMS is Redis.

7. NoSQL DBMS - document store
Document stores are similar to key-value in that they consist of keys, each corresponding to a value. 
The difference is that the stored values, referred to as documents, provide some structure and encoding of the managed data. 
That structure can be used to do more advanced queries on the data instead of just value retrieval. 
A document database is a great choice for content management applications such as blogs and video platforms. 
Each entity that the application tracks can be stored as a single document. An example of a document store DBMS is mongoDB.

8. NoSQL DBMS - columnar database
Rather than grouping columns together into tables, columnar databases store each column in a separate file in the system’s storage. 
This allows for databases that are more scalable, and faster at scale. 
Use a columnar database for big data analytics where speed is important. An example is Cassandra.

9. NoSQL DBMS - graph database
Here, the data is interconnected and best represented as a graph. This method is capable of lots of complexity. 
Graph databases are used by most social networks and pretty much any website that recommends anything based on your behavior. 
An example of a graph DBMS is Neo4j.

10. Choosing a DBMS
So, the choice of the database depends on the business need. 
If your application has a fixed structure and doesn’t need frequent modifications, a SQL DBMS is preferable. 
Conversely, if you have applications where data is changing frequently and growing rapidly, like in big data analytics, 
NoSQL is the best option for you.


4.14. SQL versus NoSQL
Deciding when to use a SQL versus NoSQL DBMS depends on the kind of information you’re storing and the best way to store it. 
Both types store data, they just store data differently.

When is it better to use a SQL DBMS?
---> You are concerned about data consistency and 100% data integrity is your top goal.

Hint
SQL DBMSs excel at handling highly structured data and provide support for consistent data.
NoSQL DBMSs are a schema-less alternative to SQL DBMSs and are designed to store, 
process and analyze extremely large amounts of unstructured data.

The strength of SQL DBMSs lies in using integrity constraints to maintain data consistency across multiple tables.

4.15. Choosing the right DBMS
As you saw in the video, there are lots of different options when choosing a DBMS. The choice depends on the business need. 
In this exercise, you are given a list of cards describing different scenarios 
and it's your job to pick the DBMS type that fits the project best. Remember the different DBMS types:

SQL: RDBMS
NoSQL: key-value store, document store, columnar database, graph database

Hint
An RDBMS is an excellent choice when data must be consistent without leaving room for error.
Key-value DBMSs are great for managing session information, like shopping carts, in web applications.
Due to their flexible schema, document DBMSs are perfect for collecting and storing any type of data.
Columnar DBMSs are great for big data analytics where speed is important.
A graph DBMS's purpose is to make it easy to build and run applications that work with highly connected datasets, like networks.


SQL
A banking application where it's extremely important that data integrity s ensured

NoSQL
A blog that needs to create and incorporate new types of content, such as images, comments, and videos.
Data warehousing on big data
A social media tool that provides users with the opportunities to grow their networks via connections
During the holiday shopping season, an e-commmerce website needs to keep track of millions of shopping carts.

As you can see there are many different DBMS types and you need to carefully consider the business needs before making your decision.
