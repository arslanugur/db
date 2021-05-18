1. Flexibly Structured Data
"""This chapter is about getting a bird's-eye view of the Nobel Prize data's structure. 
   You will relate MongoDB documents, collections, and databases to JSON and Python types. 
   You'll then use filters, operators, and dot notation to explore substructure."""

1.1. Intro to MongoDB and the Nobel Prize dataset
1. Welcome
Welcome to my intro to MongoDB with Python. 
MongoDB is a tool that helps you explore data without requiring it to have a strict, known structure. 
Because of this, you can handle diverse data together and unify analytics. 
You can also keep improving and fix issues as your requirements evolve. 
Most application programming interfaces - or APIs - on the web today expose a certain data format. 
If you can express your data in this format, then you can get started with MongoDB. Here's what I mean:

2. JavaScript Object Notation (JSON)
Javascript is the language of web browsers. 
JavaScript Object Notation, or JSON, is a common way that web services and client code pass data. 
JSON is also the basis of MongoDB's data format. So, what is JSON? JSON has two collection structures. 
Objects map string keys to values, and arrays order values. Values, in turn, are one of a few things.

3. JavaScript Object Notation (JSON)
Values, in turn, are one of a few things. 
Values are strings, numbers, the value "true", the value "false", the value "null", or another object or array. That's it.

4. JSON <> Python
These JSON data types have equivalents in Python. JSON objects are like Python dictionaries with string-type keys. 
Arrays are like Python lists. And the values I mentioned also map to Python. For example, null in JSON maps to None in Python.

5. JSON <> Python <> MongoDB
Now, how are these JSON/Python types expressed in MongoDB? A database maps names to collections. 
You can access collections by name the same way you would access values in a Python dictionary. 
A collection, in turn, is like a list of dictionaries, called "documents" by MongoDB. 
When a dictionary is a value within a document, that's a subdocument. 
Values in a document can be any of the types I mentioned. 
MongoDB also supports some types native to Python but not to JSON. Two examples are dates and regular expressions.

6. The Nobel Prize API data(base)
Let's make concrete how JSON maps to Python and in turn to MongoDB. 
Here is how I accessed the Nobel Prize API and collected its data into a Mongo database for you. 
First, I import the requests library, which will get the data from the API. 
I also import the MongoClient class from pymongo. Pymongo is the official Python driver for MongoDB. 
Then, I connect to my local database server. I say that I want a database with the name "nobel", and MongoDB creates it. 
Finally, I gather JSON responses for the "prize" and "laureate" endpoints. 
I insert them into the "prizes" and "laureates" collections, which Mongo also creates for me.

7. Accessing databases and collections
Now, let's go over how to count documents in a collection, and how to find one to inspect. 
First, a note on accessing databases and collections from a client object. 
One way is square bracket notation, as if a client is a dictionary of databases, with database names as keys. 
A database in turn is like a dictionary of collections, with collection names as keys. 
Another way to access things is dot notation. Databases are attributes of a client, and collections are attributes of a database.

8. Count documents in a collection
To count documents, use the "count_documents " collection method. Pass a filter document to limit what you count. 
In this case, I want an unfiltered total count, so I pass an empty document as the filter. 
Finally, you can fetch a document and infer the schema of the raw JSON data given by the Nobel Prize API. 
Use the find_one method, again with no filter, to grab a document from the collection.


1.2. Count documents in a collection
In the video, you learned that a MongoDB database can consist of several collections. 
Collections, in turn, consist of documents, which store the data.

You will be working with the Nobel laureates database which we have retrieved as nobel. 
The database has two collections, prizes and laureates. 
In the prizes collection, every document correspond to a single Nobel prize, and in the laureates collection - to a single Nobel laureate.

Recall that 
you can access databases by name as attributes of the client, like client.my_database (a connected client is already provided to you as client). 
Similarly, collections can be accessed by name as attributes of databases (my_database.my_collection).

Use the console on the right 
to compare the number of laureates and prizes using the .count_documents() method on a collection 
(don't forget to specify an empty filter document as the argument!), and pick a statement that is TRUE.


Instructions
Laureates outnumber prizes.

Hint
You can access the nobel database as client.nobel, and e.g. the prizes collection as client.nobel.prizes.
Remember that you need to pass an empty filter document ({}) to the .count_documents() method of a collection.

Many laureates have shared prizes!



1.3. Listing databases and collections
Our MongoClient object is not actually a dictionary, so we can't call keys() to list the names of accessible databases. 
 The same is true for listing collections of a database. 
 Instead, we can list database names by calling .list_database_names() on a client instance, 
 and we can list collection names by calling .list_collection_names() on a database instance.

Instructions
Save a list, called db_names, of the names of the databases managed by our connected client.
Similarly, save a list, called nobel_coll_names, of the names of the collections managed by the "nobel" database.

Hint
You can access a database instance by name as an attribute of a connected client instance. 
Remember to use the .list_*_names() methods -- there are special bookkeeping databases and collections that MongoDB creates on its own.

Code:
# Save a list of names of the databases managed by client
db_names = client.list_database_names()
print(db_names)

# Save a list of names of the collections managed by the "nobel" database
nobel_coll_names = client.nobel.list_collection_names()
print(nobel_coll_names)

Did you notice any strange database/collection names? 
Every Mongo host has 'admin' and 'local' databases for internal bookkeeping, 
and every Mongo database has a 'system.indexes' collection to store indexes that make searches faster.


1.4. List fields of a document
The .find_one() method of a collection can be used to retrieve a single document. 
This method accepts an optional filter argument that specifies the pattern that the document must match. 
You will learn more about filters in the next lesson, 
but for now, you can specify no filter or an empty document filter ({}), in which case MongoDB will return the document 
that is first in the internal order of the collection.

This method is useful when you want to learn the structure of documents in the collection.

In Python, the returned document takes the form of a dictionary:

    sample_doc = {'id' : 12345, 'name':'Donny Winston', 'instructor': True}
    
The keys of the dictionary are the (root-level) "fields" of the document, e.g. 'id', 'name','instructor'.

Instructions 1/3
Connect to the nobel database.

Hint
You can connect to a database by name as an attribute of the client object.

Code:
# Connect to the "nobel" database
db = client.nobel

Instructions 2/3
Fetch one document from each of the prizes and laureates collections, 
and then take a look at the output in the console to see the format and type of the documents in Python.

Hint
You can call <collection>.find_one() to retrieve a document from that collection, as a dictionary.

Code:
# Connect to the "nobel" database
db = client.nobel

# Retrieve sample prize and laureate documents
prize = db.prizes.find_one()
laureate = db.laureates.find_one()

# Print the sample prize and laureate documents
print(prize)
print(laureate)
print(type(laureate))

Instructions 3/3
Since prize and laureate are dictionaries, you can use the .keys() method to return the keys (i.e. the field names). 
But it's often more convenient to work with lists of fields.

Use the list() constructor to save a list of the fields present in the prize and laureate documents.

Hint
You can call keys() on a dictionary to get a new view of its keys. 
You will need to pass this view to Python's list constructor, list, to obtain a list.

Code:
# Connect to the "nobel" database
db = client.nobel

# Retrieve sample prize and laureate documents
prize = db.prizes.find_one()
laureate = db.laureates.find_one()

# Print the sample prize and laureate documents
print(prize)
print(laureate)
print(type(laureate))

# Get the list of fields present in each type of document
prize_fields = list(prize.keys())
laureate_fields = list(laureate.keys())

print(prize_fields)
print(laureate_fields)

Notice that the prize documents contains a laureates field that stores the information on all the laureates sharing the prize, 
and the laureate document contains a prizes field, that stores the info on all the prizes they won.

1.5. Finding documents
1. Finding documents
In the last lesson, we learned about databases, collections, and documents. 
We also learned how data structures in MongoDB relate to those of JSON and Python. 
In this lesson, we will learn how to query a collection to find documents of interest.

2. An example "laureates" document
Here we have an example document in the laureates collection. 
Finding documents in MongoDB reminds me of the work of this particular laureate. 
The remarkable rays named after him are today called x-rays.

3. Filters as (sub)documents
To find documents satisfying some criteria, we express those criteria as a document. 
This filter document mirrors the structure of documents to match in the collection.
Imagine a filter document as an x-ray image like the one on the right. 
This image is one of the first x-ray images ever recorded.
Imagine you use it to filter by eye a collection of color photos of people's hands. 
You might keep ones with five fingers and a ring on the ring finger.

4. The Walrus is Out
Here's another way to think about filter documents. Hold a pair of pants up to a collection of mammals, one at a time. 
The pants fit a part of the structure of human beings, but not that of a walrus. Sorry, Wally.

5. Simple filters
Filter documents can be small. For example, there are 48 laureate documents with a value for the field gender equal to female. 
We can do the same for other fields, like country of death and city of birth. Also, we can merge criteria into a single filter document.

6. Composing filters
This filter document will have the same form as matching documents. 
In this case, the filter matches Marie Curie. 
She discovered the element polonium, named after her native land.
Poland was under Russian rule at the time. She hoped that naming an element after it would publicize its lack of independence. 
Many immigrants won Nobel Prizes, but in what proportion? Later exercises in the course will explore this question.

7. Query operators
We've seen filters that match exact values in a document. What about satisfying other constraints? 
Query operators are like different ways to input values on a website form. 
Some values you select from options, like countries; some you select with a range slider. 
All operators on fields wrap around their corresponding values. 
You might operate a drop-down menu to select a country and a slider to pick a value in a range. 
Query operators in MongoDB work the same way. You place an operator in a filter document to wrap around a field and its acceptable values.

8. Query operators
For example, let's find documents where the field 'diedCountry' is either France or USA. 
We use the "in" operator to wrap around acceptable values. Operators in MongoDB have a dollar-sign prefix. 
Another example. To find documents where 'diedCountry' is not equal to a certain string, 
we can use the not-equal - or en ee - operator We can compose query operators for a field.

9. Query operators
For example, here we query for documents with 'diedCountry' greater than - or gee tee - the string 'Belgium'. 
At the same time, we query for 'diedCountry' less than or equal to - or el tee ee - the string 'USA'. 
How rude that MongoDB considers some countries to be greater than or less than others! 
Actually, this highlights MongoDB's loose requirements for comparisons. 
Comparison operators order values in lexicographic order, meaning alphabetical order for non-numeric values. 
This behavior is something to keep in mind when working with raw, unprocessed data.

10. Let's Practice!
Let's practice constructing filter documents, including those with query operators.

1.6. "born" approximation
The "born" field in a laureate collection document records the date of birth of that laureate. 
"born" values are of the form "YYYY-MM-DD", also known as ISO 8601 format. 
An example value is "1937-02-01", for February 1st, 1937. 
This format is convenient for lexicographic comparison. For example, the query

db.laureates.count_documents({"born": {"$lt": "1900"}})

returns the number of laureates with recorded dates of birth earlier than the year 1900 ("$lt" is for "less than"). 
Using the query format above, what is the number of laureates born prior to 1800? What about prior to 1700?


Instructions
Possible Answers
---  38 prior to 1800, and 0 prior to 1700 --- More than zero laureates have "born" values less than "1700".
---  324 prior to 1800, and 35 prior to 1700 --- Did you run the query for "1800" and "1700"?
---> 38 prior to 1800, and 38 prior to 1700

Hint
You will need to check for 1800 as "1800" and 1700 as "1700".

The first Nobel Prize was awarded in 1901, they are not awarded posthumously, so...some laureates lived to be more than 200 years old?? 
It turns out that a laureate's date of birth is recorded as '0000-00-00' when it is not known. Check your assumptions when working with data!


1.7. Composing filters
It is often useful to incrementally build up a filter document in order to see the effect of adding constraints one at a time. 
In this exercise, we will count the number of laureate documents matching some criteria, and we will gradually add criteria.

Instructions 1/3
Create a filter criteria to count laureates who died ("diedCountry") in the USA ("USA"). Save the document count as count.

Hint
The form {"field": "value"} can be used to match documents with field "field" having the exact string value "value".

Code: 
# Create a filter for laureates who died in the USA
criteria = {"diedCountry": "USA"}

# Save the count of these laureates
count = db.laureates.count_documents(criteria)
print(count)


Instructions 2/3
Create a filter to count laureates who died in the United States but were born ("bornCountry") in Germany.

Hint
You can express that two criteria {"field1": "value1"} and {"field2": "value2"} need to be satisfied 
by including both criteria in the same filter document.

Code:
# Create a filter for laureates who died in the USA but were born in Germany
criteria = {'diedCountry': 'USA', 
            'bornCountry': 'Germany'}

# Save the count
count = db.laureates.count_documents(criteria)
print(count)


Instructions 3/3
Count laureates who died in the USA, were born in Germany, and whose first name ("firstname") was "Albert".

Hint
You can express that multiple criteria {"field1": "value1"}, {"field2": "value2"}, etc. 
need to be satisfied by include all criteria in the same filter document.

Code:
# Create a filter for Germany-born laureates who died in the USA and with the first name "Albert"
criteria = {'diedCountry': 'USA', 
            'bornCountry': 'Germany', 
            'firstname': 'Albert'}

# Save the count
count = db.laureates.count_documents(criteria)
print(count)


1.8. We've got options
Sometimes, we wish to find documents where a field's value matches any of a set of options. 
We saw that the $in query operator can be used for this purpose. 
For example, how many laureates were born in any of "Canada", "Mexico", or "USA"?

If we wish to accept all but one option as a value for a field, we can use the $ne (not equal) operator. 
For example, how many laureates died in the USA but were not born in the USA?

Instructions 1/2
How many laureates were born in "USA", "Canada", or "Mexico"? Save a filter as criteria and your count as count.

Hint
The field for country of birth is "bornCountry". The $in operator should be followed by a list of options, e.g. $in : ["option1", "option2"]

Code:
# Save a filter for laureates born in the USA, Canada, or Mexico
criteria = { "bornCountry": 
                { "$in": ["USA", "Canada", "Mexico"]}
             }

# Count them and save the count
count = db.laureates.count_documents(criteria)
print(count)

Instructions 2/2
How many laureates died in the USA but were not born there? Save your filter as criteria and your count as count.

Hint
Operators wrap around values, so {"field": {"$ne": "value"}} indicates that the field "field" can take on all but "value" as its value.

Code:
# Save a filter for laureates who died in the USA and were not born there
criteria = { 'diedCountry': 'USA',
               'bornCountry': { "$ne": 'USA'},
             }

# Count them
count = db.laureates.count_documents(criteria)
print(count)

$ne is great when you don't want to have to list all other options to $in.


1.9. Dot notation: reach into substructure
1. Dot notation: reach into substructure
In the last lesson, we learned how to construct and compose filter documents. 
We also learned about query operators to express criteria other than simple equality. 
In this lesson, we are going to learn how to query arrays and subdocuments using dot notation. 
Dot notation is how MongoDB allows us to query document substructure.

2. A functional density
Let's use the find_one method to retrieve one of my favorite laureates. 
Walter Kohn co-developed an important technique for computational chemistry. 
Notice that the "prizes" field is an array. 
In this case, the array has one element with data on Kohn's two-way share of the 1998 prize in chemistry. 
Note also that a laureate may have many affiliations for a prize. The affiliations field of each prize subdocument is an array. 
To fit text on this slide, I use parentheses to form multiline strings, and I show only part of the document. 
MongoDB allows you to query document substructure using dot notation. Here's a count of laureates. 
We reach into the prizes array to query on the affiliations field across prizes. 
From there, we reach again, this time to query on the name field across affiliations. 
We count laureates with at least one prize affiliation name as specified. 
The dot notation gives a full path to a field from the document root. 
I'm curious how many laureates had an affiliation in Berkeley, CA when they received a prize. Here's my query. Go Bears!

3. No Country for Naipaul
MongoDB allows you to specify and enforce a schema for a collection, but this is not required. 
For example, fields do not need to have the same type of value across documents in a collection. 
In the case of this laureate, there is an "empty" affiliation associated with his prize. 
Another accommodation in MongoDB is that of field presence.
Even root-level fields don't need to be present in all documents. In this document, for example, the "bornCountry" field is absent. 
Using the "exists" operator, We can query for the existence, or non-existence of fields. 
Here, we see that many laureates documents do not have a "bornCountry" field.

4. Multiple prizes
Do all laureates have a prizes field? With the help of the exists operator, we see that, in fact, they do. 
But are any of those prizes fields empty arrays? I hope not. We can check using dot notation to access array elements. 
This borrows from javascript syntax. 
Here we see a filter document for the criteria that a value exists for the field "0" within the "prizes" field. 
You can reference an array element by its numerical index using dot notation. 
Thus, this expression counts documents that have a non-empty prizes array. 
We see, to our relief, that all laureate documents contain at least one prize. 
Are there laureates with more than one prize? Yes! 
We see that Marie Curie is in this group, along with a few other people you may recognize.

5. On to exercises!
We've learned about dot notation to query array and subdocument fields. 
We've also learned about the "exists" operator to check for the presence of fields. Now, let's explore our data some more.


1.10. Choosing tools
We saw from his laureate document that Walter Kohn's country of birth was "Austria" and that his prize affiliation country was "USA". 
If we want to count the number of laureates born in Austria with a prize affiliation country that is not also Austria, what MongoDB concepts/tools should we use?

(The nobel database is available in the console as db, and the Walter's Kohn document is available to you as doc. 
Feel free to examine the structure of the document doc in the console, and play around with database queries!)

Instructions
Possible Answers
---> dot notation and the $ne operator
--- dot notation and the $exists operator - $exists helps us know if a field is present or not, but it does not help us filter for certain values of a field.
--- dot notation and the $in operator - $in helps to specify that one of a set of values is the value of a field, but we need to specify that a certain value is not used.
--- dot notation is not needed here, a query operator will suffice - While the country of birth is a root-level field and can be accessed directly, the country of affiliation is actually is in a subdocument in the "affiliations" array, which, in turn, is in the "prizes" subdocument.

Hint
The "country" field is in a subdocument in an "affiliations" array, 
where "affiliations" in turn is a field of a subdocument in a root-level "prizes" array. 
To reach into this substructure, we use MongoDB dot notation.

We will need dot notation to specify criteria for the prize affiliation country. We will need $ne to exclude the value "Austria".


1.11. Starting our ascent
Throughout this course, we will gradually build up a set of tools to examine the proportion of Nobel prizes that were awarded to immigrants. 
In this exercise, you will answer a limited but related question using tools we have introduced so far.

We saw from his laureate document that Walter Kohn's country of birth was "Austria" and that his prize affiliation country was "USA". 
Count the number of laureates born in Austria with a prize affiliation country that is not also Austria.

Instructions
Save a filter criteria for laureates born in (bornCountry) "Austria" with a non-Austria prizes.affiliations.country.
Save your count of laureates as count.

Hint
Use dot notation and the not-equal ($ne) operator to specify a query constraint for the prize affiliation country, prizes.affiliations.country. 
Also, recall that the "bornCountry" field stores a laureate's country of birth.

Code:
# Filter for laureates born in Austria with non-Austria prize affiliation
criteria = {"bornCountry": "Austria", 
              "prizes.affiliations.country": {"$ne": "Austria"}}

# Count the number of such laureates
count = db.laureates.count_documents(criteria)
print(count)


1.12. Our 'born' approximation, and a special laureate
We saw earlier that the laureates collection encodes uncertainty about birthdate in a special way. 
When a birthdate is unknown, the "born" field has the value "0000-00-00". Thus,

db.laureates.count_documents({"born": "0000-00-00"})

counts the number of such laureates. Or does it?

We also saw that the total number of laureate prizes is more than the number of laureates -- some were awarded more than one prize. 
There is one in particular with a whopping three prizes, 
and this laureate holds key information to aid our quest to determine the proportion of prizes awarded to immigrants.

Instructions 1/2
Use a filter document (criteria) to count the documents that don't have a "born" field.

Hint
The $exists operator determines if a field such as "born" is present (True) or not (False).

Code:
# Filter for documents without a "born" field
criteria = {"born": {"$exists": False}}

# Save the count
count = db.laureates.count_documents(criteria)
print(count)

Instructions 2/2
Use a filter document (criteria) to find a document for a laureate with at least three elements in its "prizes" array.
In other words, does a third element exist for the array? Remember about the zero-based indexing!

Hint
Use $exists and dot notation to query for the presence of an element at (zero-based) index 2 of the prizes array, "prizes.2".
Use the .find_one() with an appropriate filter (the criteria you defined) to find one document.

Code:
# Filter for laureates with at least three prizes
criteria = {"prizes.2": {"$exists": True}}

# Find one laureate with at least three prizes
doc = db.laureates.find_one(criteria)

# Print the document
print(doc)

Take a look at the document in the counsole. 
What about this laureate presents a challenge to our goal of partitioning laureates into immigrant and non-immigrant Prize recipients?

 
