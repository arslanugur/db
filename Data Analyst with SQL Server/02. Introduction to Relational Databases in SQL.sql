Course Description
      You’ve already used SQL to query data from databases. 
      But did you know that there's a lot more you can do with databases? 
      You can model different phenomena in your data, as well as the relationships between them. 
      This gives your data structure and consistency, which results in better data quality. 
      In this course, you'll experience this firsthand by working with a real-life dataset that 
      was used to investigate questionable university affiliations. 
      Column by column, table by table, you'll get to unlock and admire the full potential of databases. 
      You'll learn how to create tables and specify their relationships, as well as how to enforce data integrity. 
      You'll also discover other unique features of database systems, such as constraints.

1. Your first database
      In this chapter, you'll create your very first database with a set of simple SQL commands. 
      Next, you'll migrate data from existing flat tables into that database. 
      You'll also learn how meta-information about a database can be queried.

1.1. Introduction to relational databases
1.2. Attributes of relational databases
1.3. Query information_schema with SELECT
1.4. Tables: At the core of every database
1.5. CREATE your first few TABLEs
1.6. ADD a COLUMN with ALTER TABLE
1.7. Update your database as the structure changes
1.8. RENAME and DROP COLUMNs in affiliations
1.9. Migrate data with INSERT INTO SELECT DISTINCT
1.10. Delete tables with DROP TABLE



2. Enforce data consistency with attribute constraints
      After building a simple database, it's now time to make use of the features. 
      You'll specify data types in columns, enforce column uniqueness, and disallow NULL values in this chapter.

2.1. Better data quality with constraints
2.2. Types of database constraints
2.3. Conforming with data types
2.4. Type CASTs
2.5. Working with data types
2.6. Change types with ALTER COLUMN
2.7. Convert types USING a function
2.8. The not-null and unique constraints
2.9. Disallow NULL values with SET NOT NULL
2.10. What happens if you try to enter NULLs?
2.11. Make your columns UNIQUE with ADD CONSTRAINT



3. Uniquely identify records with key constraints
      Now let’s get into the best practices of database engineering. It's time to add primary and foreign keys to the tables. These are two of the most important concepts in databases, and are the building blocks you’ll use to establish relationships between tables.

3.1. Keys and superkeys
3.2. Get to know SELECT COUNT DISTINCT
3.3. Identify keys with SELECT COUNT DISTINCT
3.4. Primary keys
3.5. Identify the primary key
3.6. ADD key CONSTRAINTs to the tables
3.7. Surrogate keys
3.8. Add a SERIAL surrogate key
3.9. CONCATenate columns to a surrogate key
3.10. Test your knowledge before advancing


4. Glue together tables with foreign keys
      In the final chapter, you'll leverage foreign keys to connect tables and establish relationships that will greatly benefit your data quality. And you'll run ad hoc analyses on your new database.


4.1. Model 1:N relationships with foreign keys
4.2. REFERENCE a table with a FOREIGN KEY
4.3. Explore foreign key constraints
4.4. JOIN tables linked by a foreign key
4.5. Model more complex relationships
4.6. Add foreign keys to the "affiliations" table
4.7. Populate the "professor_id" column
4.8. Drop "firstname" and "lastname"
4.9. Referential integrity
4.10. Referential integrity violations
4.11. Change the referential integrity behavior of a key
4.12. Roundup
4.13. Count affiliations per university
4.14. Join all the tables together
