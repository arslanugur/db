MongoDB is a tool to explore data structured as you see fit. 
As a NoSQL database, it doesn't follow the strict relational format imposed by SQL. 
By providing capabilities that typically require adding layers to SQL, it collapses complexity. 
With dynamic schema, you can handle vastly different data together and consolidate analytics. 
The flexibility of MongoDB empowers you to keep improving and fix issues as your requirements evolve. 
In this course, you will learn the MongoDB language and apply it to search and analytics. 
Working with unprocessed data from the official nobelprize.org API, you will explore and answer questions about Nobel Laureates and prizes.

1. Flexibly Structured Data
"""This chapter is about getting a bird's-eye view of the Nobel Prize data's structure. 
   You will relate MongoDB documents, collections, and databases to JSON and Python types. 
   You'll then use filters, operators, and dot notation to explore substructure."""

1.1. Intro to MongoDB and the Nobel Prize dataset
1.2. Count documents in a collection
1.3. Listing databases and collections
1.4. List fields of a document
1.5. Finding documents
1.6. "born" approximation
1.7. Composing filters
1.8. We've got options
1.9. Dot notation: reach into substructure
1.10. Choosing tools
1.11. Starting our ascent
1.12. Our 'born' approximation, and a special laureate


2. Working with Distinct Values and Sets
"""Now you have a sense of the data's structure. This chapter is about dipping your toes into the pools of values for various fields. 
   You'll collect distinct values, test for membership in sets, and match values to patterns."""

2.1. Survey Distinct Values
2.2. Categorical data validation
2.3. Never from there, but sometimes there at last
2.4. Countries of affiliation
2.5. Distinct Values Given Filters
2.6. Born here, went there
2.7. Triple plays (mostly) all around
2.8. Filter Arrays using Distinct Values
2.9. Sharing in physics after World War II
2.10. Meanwhile, in other categories...
2.11. Organizations and prizes over time
2.12. Distinct As You Like It
2.13. Glenn, George, and others in the G.B. crew
2.14. Germany, then and now
2.15. The prized transistor


3. Get Only What You Need, and Fast
"""You can now query collections with ease and collect documents to examine and analyze with Python. 
    But this process is sometimes slow and onerous for large collections and documents. 
    This chapter is about various ways to speed up and simplify that process."""

3.1. Projection
3.2. Shares of the 1903 Prize in Physics
3.3. Rounding up the G.S. crew
3.4. Doing our share of data validation
3.5. Sorting
3.6. What the sort?
3.7. Sorting together: MongoDB + Python
3.8. Gap years
3.9. What are indexes?
3.10. High-share categories
3.11. Recently single?
3.12. Born and affiliated
3.13. Limits
3.14. Setting a new limit?
3.15. The first five prizes with quarter shares
3.16. Pages of particle-prized people


4. Aggregation Pipelines: Let the Server Do It For You
"""You've used projection, sorting, indexing, and limits to speed up data fetching. 
   But there are still annoying performance bottlenecks in your analysis pipelines. 
   You still need to fetch a ton of data. Thus, network bandwidth and downstream processing and memory capacity still impact performance. 
   This chapter is about using MongoDB to perform aggregations for you on the server."""

4.1. Intro to Aggregation
4.2. Sequencing stages
4.3. Aggregating a few individuals' country data
4.4. Passing the aggregation baton to Python
4.5. Aggregation Operators and Grouping
4.6. Field Paths and Sets
4.7. Organizing prizes
4.8. Gap years, aggregated
4.9. Zoom into Array Fields
4.10. Embedding aggregation expressions
4.11. Here and elsewhere
4.12. Countries of birth by prize category
4.13. Something Extra: $addFields to Aid Analysis
4.14. "...it's the life in your years"
4.15. How many prizes were awarded to immigrants?
4.16. Refinement: filter out "unaffiliated" people
4.17. Wrap-Up
