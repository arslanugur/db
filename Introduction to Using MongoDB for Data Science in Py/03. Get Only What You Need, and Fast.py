3. Get Only What You Need, and Fast
"""You can now query collections with ease and collect documents to examine and analyze with Python. 
    But this process is sometimes slow and onerous for large collections and documents. 
    This chapter is about various ways to speed up and simplify that process."""

3.1. Projection
1. Projection: Getting only what you need
In this chapter, we're going to learn about getting only what you need, and fast. We'll start with what MongoDB calls "projection".

2. What is "projection"?
The term "projection" is about reducing multidimensional data. In cartography, it's about getting what you need to make a reasonable image from a 3D earth. You can also think about asking a certain part of your data to project its voice, to "speak up"! With a table of data, it's about selecting columns. With MongoDB, it's about selecting substructure.

3. Projection in MongoDB
In MongoDB, we fetch projections by specifying what document fields interest us. We can do this by passing a dictionary as a second argument to the "find" method of a collection. For each field that we want to include in the projection, we give a value of 1. Fields that we don't include in the dictionary are not included in the projection. The exception is a document's "_id" field. The "_id" field is always included in a projection by default. We must assign it the value 0 in the projection dictionary to leave it out. Here I try to collect the prize affiliation data for all laureates - my filter document is empty. What I get back is not the data itself, but a so-called cursor, an iterable that I can fetch documents from, one at a time.

4. Projection in MongoDB
In Python, we can collect from an iterable into a list. We do this by passing it to the "list" function. I don't want to print out hundreds of laureate documents. Thus, I also use slicing syntax to get only the first three elements of the resulting list. We can see that our projections contain only document data about prize affiliations. We also retained the structure of that data. Remember how to project fields this way: it’s going to be very useful in the rest of the course.

5. Missing fields
What happens when you try to project out fields that are not present in some documents? Rather than raise an error, MongoDB returns the documents without those fields. This expression projects the bornCountry field. This field isn't present for organization laureates, though. Only the firstName and id fields get returned. Notice that I formatted a projection as a list of fields. When a projection doesn't involve excluding fields, the pymongo driver accepts this format.

6. Missing fields
Also, it's okay if a projected field isn't in any of a collection's documents. Here, because there is no favoriteIceCreamFlavor field, the projection returns only object IDs.

7. Simple aggregation
We're going to learn about MongoDB's aggregation framework in the next chapter. But already we have a new tool to fetch less data, only what we need. For example, let's count the total number of prize medals awarded. That is, the total number of elements in prizes arrays across all laureates. We can iterate over a cursor of all laureates with only the prizes field projected out. In this way, we avoid having to download the other data in each laureate document. This can definitely affect performance for very large collections. We can even, in this case, use a comprehension to reduce memory overhead in Python. We can leverage Python's built-in tools for iterables and dictionaries. And we can use projection to slim down these dictionaries to contain only what we need for our analysis.


3.2. Shares of the 1903 Prize in Physics
You want to examine the laureates of the 1903 prize in physics and how they split the prize. Here is a query without projection:

db.laureates.find_one({"prizes": {"$elemMatch": {"category": "physics", "year": "1903"}}})

Which projection(s) will fetch ONLY the laureates' full names and prize share info? I encourage you to experiment with the console and re-familiarize yourself with the structure of laureate collection documents.

Instructions
Possible Answers
["firstname", "surname", "prizes"]  -- This definitely catches all prize information. However, you can also use dot notation to project out just prize share info.This definitely catches all prize information. However, you can also use dot notation to project out just prize share info.
["firstname", "surname", "prizes.share"] --- This is a great way to project out just prize share info. However, we can also remove the '_id' field from the projection.
{"firstname": 1, "surname": 1, "prizes.share": 1, "_id": 0} -- This represents the minimal projection to get the info we need.
All of the above -- While all of the options will fetch the laureate's full names and prize share info, two of them also fetch extraneous data.

Hint
Call db.laureates.find_one() with each of the solutions and examine the printed output. Which projection gives only the information requested?


3.3. Rounding up the G.S. crew
In chapter 2, you used a regular expression object Regex to find values that follow a pattern. We can also use the regular expression operator $regex for the same purpose. For example, the following query:

{ "name": {$regex: "^Py"}    }

will fetch documents where the field 'name' starts with "Py". Here the caret symbol ^ means "starts with".

In this exercise, you will use regular expressions, projection, and list comprehension to collect the full names of laureates whose initials are "G.S.".

Instructions 1/3
First, use regular expressions to fetch the documents for the laureates whose "firstname" starts with "G" and whose "surname" starts with "S".

Hint
You can select a field according to a pattern using "$regex". For example, using 'firstname' : {"$regex" : '^G'} (note the caret symbol ^) will fetch all the laureates whose last names start with "G". Now apply the same principle to surname!

Code:
# Find laureates whose first name starts with "G" and last name starts with "S"
docs = db.laureates.find(
       filter= {"firstname" : {"$regex" : "^G"},
                "surname" : {"$regex" : "^S"}  })

# Print the first document 
print(docs[0])

Instructions 2/3
In the previous step, we fetched all the data for all the laureates with initials G.S. This is unnecessary if we only want their full names!

Use projection and adjust the query to select only the "firstname" and "surname" fields.

Hint
You can simply specify the list of fields to keep. For example, projection = ["bornCountry", "diedCountry"] will only keep the data in the fields "bornCountry" and "diedCountry" (and, of course, the "_id" field).

Code:
# Use projection to select only firstname and surname
docs = db.laureates.find(
       filter= {"firstname" : {"$regex" : "^G"},
                "surname" : {"$regex" : "^S"}  },
   projection= ["firstname", "surname"]  )

# Print the first document 
print(docs[0])

Instructions 3/3
Now the documents you fetched contain only the relevant information!

Iterate over the documents, and for each document, concatenate the first name and the surname fields together with a space in between to obtain full names.

Hint
.find() returns an iterable object, so you can iterate over it just like you would iterate over any list.
You can access a field of a document by doc["my_field"].

Code:
# Use projection to select only firstname and surname
docs = db.laureates.find(
       filter= {"firstname" : {"$regex" : "^G"},
                "surname" : {"$regex" : "^S"}  },
   projection= ["firstname", "surname"]  )

# Iterate over docs and concatenate first name and surname
full_names = [doc["firstname"] + " " + doc["surname"]  for doc in docs]

# Print the full names
print(full_names)


3.4. Doing our share of data validation
In our Nobel prizes collection, each document has an array of laureate subdocuments "laureates", each containing information such as the prize share for a laureate:

{'_id': ObjectId('5bc56145f35b634065ba1997'),
 'category': 'chemistry',
 'laureates': [{'firstname': 'Frances H.',
   'id': '963',
   'motivation': '"for the directed evolution of enzymes"',
   'share': '2',
   'surname': 'Arnold'},
  {'firstname': 'George P.',
   'id': '964',
   'motivation': '"for the phage display of peptides and antibodies"',
   'share': '4',
   'surname': 'Smith'},
 {...

Each "laureates.share" value appears to be the reciprocal of a laureate's fractional share of that prize, encoded as a string. 
For example, a laureate "share" of "4" means that this laureate received a 1/4 share of the prize. Let's check that for each prize, all the shares of all the laureates add up to 1!

Notice the quotes around the values in the "share" field: these values are actually given as strings! You'll have to convert then to numbers before you find the reciprocals and add up the shares.

Instructions
Save a list of prizes (prizes), projecting out only the "laureates.share" values for each prize.
For each prize, compute the total share as follows:
Initialize the variable total_share to 0.
Iterate over the laureates for each prize, converting the "share" field of the "laureate" to float and adding the reciprocal of it (that is, 1 divided by it) to total_share.

Hint
Use dot notation to project out just the "share" field each prize's "laureates" array, i.e. "laureates.share". Remember that projection has to be wither a list or a dictionary!
You can access the value in the "share" field of each laureate by laureate["share"]. You want to convert this value to float, and then divide 1 by the result.

Code:
# Save documents, projecting out laureates share
prizes = db.prizes.find({}, ['laureates.share'])

# Iterate over prizes
for prize in prizes:
    # Initialize total share
    total_share = 0
    
    # Iterate over laureates for the prize
    for laureate in prize["laureates"]:
        # convert the laureate's share to float and add the reciprocal to total_share
        total_share += 1 / float(laureate["share"])
        
    # Print the total share    
    print(total_share)    
    
It seems like all the shares add up to 1 for all the prizes!
 
3.5. Sorting
1. Sorting
We've learned how to project out only the fields we need from a query. There are other conditions we can give to MongoDB about the data returned. In this lesson, we'll learn how to sort results on the server before they get returned to us.

2. Sorting post-query with Python
First, its useful to review how we can sort a list of retrieved documents with only Python. This may be plenty performant, especially for small datasets. After all, we can store a local cache of our data and try many different operations on it. Let's get a list of all physics prize documents, with the year field projected. I'm not interested in printing out the full projected documents with the document ids. So, I'll use a list comprehension to collect the year values, slice out the first five values, and print them. It looks like the documents are in reverse chronological order, but we get no guarantee of this. To sort the documents in ascending order of year, I use the built-in Python "sorted" function. I also import the "itemgetter" function from Python's standard library. Given a key, it fetches the value for that key in a dictionary. To sort in reverse - or descending - order, we can pass True as the "reverse" keyword argument to the "sorted" function.

3. Sorting in-query with MongoDB
We can also ask Mongo to do simple sorting by field values on the server and yield results in sorted order. Here, we pass a "sort" argument to the "find" method, giving a list of field-direction pairs. In this case, we want to sort on the "year" field, and in the ascending direction. I don't need the documents beyond the print statement, so I pass the cursor to the list comprehension. To sort by year in descending order, we use negative one as the second element of the sort pair. Why is a list passed to the sort keyword argument? This is because you can sort first by one field and then by others. Let's see how.

4. Primary and secondary sorting
Let's sort prize documents first by ascending year and then by descending category. To do this, we provide the corresponding pairs in order as a list. Here, we also query for prizes awarded between 1966 and 1970, exclusive. We project out only the data we need, the category and year values. Notice that we could sort by fields that we do not project - in this case, we happen to be also projecting the sort fields. For each projection yielded by the cursor, we format a string with the year and category value. To do this, we use Python's double-star dictionary unpacking syntax. The output shows years increasing and, for each year, categories decreasing. In both cases, the order is alphabetical because the fields are both string-valued. For the four-digit-year strings, sorting produces the same result as numerical sorting. We can see that there was no award for economics in 1967 or 1968, and there was no award for peace in 1967.

5. Sorting with pymongo versus MongoDB shell
One last thing: the command-line shell for MongoDB uses JavaScript. You specify a sort using the form of a JavaScript object, which looks like a Python dictionary. This works because JavaScript objects in the console keep their key order as entered. In Python 3-point-6 and below, though, there is no similar guarantee with dictionaries. The order of keys may not be preserved as entered. This is why pymongo requires a list of tuples.

6. Let's get sorted!
Let's get some practice with sorting.


3.6. What the sort?
This block prints out the first five projections of a sorted query. What "sort" argument fills the blank?

docs = list(db.laureates.find(
    {"born": {"$gte": "1900"}, "prizes.year": {"$gte": "1954"}},
    {"born": 1, "prizes.year": 1, "_id": 0},
    sort=____))
for doc in docs[:5]:
    print(doc)
{'born': '1916-08-25', 'prizes': [{'year': '1954'}]}
{'born': '1915-06-15', 'prizes': [{'year': '1954'}]}
{'born': '1901-02-28', 'prizes': [{'year': '1954'}, {'year': '1962'}]}
{'born': '1913-07-12', 'prizes': [{'year': '1955'}]}
{'born': '1911-01-26', 'prizes': [{'year': '1955'}]}

Instructions
Possible Answers
[("prizes.year", 1), ("born", -1)] --- Does the 'prizes.year' field sort like you expect?
{"prizes.year": 1, "born": -1}   --- Dictionaries are not ordered in Python, so this will not ensure that 'prizes.year' gets ordered before 'born'.
None ---  This is the same as passing no 'sort' argument at all.
[("prizes.year", 1)]  --- Results for the same year are also sorted by 'born'.

Hint
"sort" takes a list of pairs. Is there a secondary sort on "born"? Try executing the different options.

3.7. Sorting together: MongoDB + Python
In this exercise you'll explore the prizes in the physics category.You will use Python to sort laureates for one prize by last name, and then MongoDB to sort prizes by year:

1901: Röntgen
1902: Lorentz and Zeeman
1903: Becquerel and Curie and Curie, née Sklodowska

You'll start by writing a function that takes a prize document as an argument, extracts all the laureates from that document, arranges them in alphabetical order, and returns a string containing the last names separated by " and ".

The Nobel database is again available to you as db. We also pre-loaded a sample document sample_doc so you can test your laureate-extracting function.

(Remember that you can always type help(function_name) in console to get a refresher on functions you might be less familiar with, e.g. help(sorted)!)

Instructions 1/3
Complete the definition of all_laureates(prize). Within the body of the function:

Sort the "laureates" list of the prize document according to the "surname" key.
For each of the laureates in the sorted list, extract the "surname" field.
The code for joining the last names into a single string is already written for you.
Take a look at the console to make sure the output looks like what you'd expect!


Hint
The sorted() function takes two arguments: an iterable to sort, and the rule to sort by. You want to sort the laureates for a prize (prize["laureates"]).
Sorting rule can be specified using the itemgetter function. For example, sorted(my_list_of_dictionaries, key=itemgetter('my_key')) will sort my_list_of_dictionaries by the value of 'my_key' in each dictionary.

Code:
from operator import itemgetter

def all_laureates(prize):  
  # sort the laureates by surname
  sorted_laureates = sorted(prize["laureates"], key=itemgetter("surname"))
  
  # extract surnames
  surnames = [laureate["surname"] for laureate in sorted_laureates]
  
  # concatenate surnames separated with " and " 
  all_names = " and ".join(surnames)
  
  return all_names

# test the function on a sample doc
print(all_laureates(sample_prize))


Instructions 2/3
Find the documents for the prizes in the physics category, sort them in chronological order (by "year", ascending), and only fetch the "year", "laureates.firstname", and "laureates.surname" fields.

Hint
Use the filter argument of .find() to select "category":"physics", "projection" to restrict to only the necessary fields, and sort to sort.

To specify the sorting rule, you need to pass a list of pairs to the sort argument of find(): the first element of the pair is the name of the column, and the second argument is 1 or -1, depending on whether you're sorting in ascending or descending order.

Code:
from operator import itemgetter

def all_laureates(prize):  
  # sort the laureates by surname
  sorted_laureates = sorted(prize["laureates"], key=itemgetter("surname"))
  
  # extract surnames
  surnames = [laureate["surname"] for laureate in sorted_laureates]
  
  # concatenate surnames separated with " and " 
  all_names = " and ".join(surnames)
  
  return all_names

# find physics prizes, project year and name, and sort by year
docs = db.prizes.find(
           filter= {"category": "physics"}, 
           projection= ["year", "laureates.firstname", "laureates.surname"], 
           sort= [("year", 1)])
           
           
Instructions 3/3
Now that you have the prizes, and the function to extract laureates from a prize, print the year and the names of the laureates (use your all_laureates() function) for each prize document.

Hint
You can access the "year" attribute of a prize document by doc["year"], and get the names of all the laureates for the prize by calling all_laureates(doc).

Code:
from operator import itemgetter

def all_laureates(prize):  
  # sort the laureates by surname
  sorted_laureates = sorted(prize["laureates"], key=itemgetter("surname"))
  
  # extract surnames
  surnames = [laureate["surname"] for laureate in sorted_laureates]
  
  # concatenate surnames separated with " and " 
  all_names = " and ".join(surnames)
  
  return all_names

# find physics prizes, project year and name, and sort by year
docs = db.prizes.find(
           filter= {"category": "physics"}, 
           projection= ["year", "laureates.firstname", "laureates.surname"], 
           sort= [("year", 1)])

# print the year and laureate names (from all_laureates)
for doc in docs:
  print("{year}: {names}".format(year=doc["year"], names=all_laureates(doc)))
  
You worked through stages of filtering, projecting, sorting, adding a derived field ("names"), and producing formatted output for each document.


3.8. Gap years
The prize in economics was not added until 1969. There have also been many years for which prizes in one or more of the original categories were not awarded.

In this exercise, you will utilize sorting by multiple fields to see which categories are missing in which years.

For now, you will just print the list of all documents, but in the next chapter, you'll learn how to use MongoDB to group and aggregate data to present this information in a more convenient format.

Instructions
Find the original prize categories established in 1901 by looking at the distinct values of the "category" field for prizes from year 1901.
Fetch ONLY the year and category from all the documents (without the "_id" field).
Sort by "year" in descending order, then by "category" in ascending order.

Hint
Use the .distinct("field_name", criteria) method of a collection to find distinct values of "field_name" among documents satisfying criteria.
To specify the sorting rule, you need to pass a list of pairs to the sort argument of find(), for example sort=[("field1", -1), ("field2", 1)], where the second element of each pair specifies the direction of sorting.
To exclude the _id field from the projection, you need to specify projection as a dictionary, and include "_id":0 in it.

Code:
# original categories from 1901
original_categories = db.prizes.distinct("category", {"year": "1901"})
print(original_categories)

# project year and category, and sort
docs = db.prizes.find(
        filter={},
        projection={"year":1, "category":1, "_id":0},
        sort=[("year", -1), ("category", 1)]
)

#print the documents
for doc in docs:
  print(doc)
  
We can see that, for example, 'literature' is mising from 2018 prizes. Also, there were few prizes were awarded between 1914 and 1920. Why do you think that is?We can see that, for example, 'literature' is mising from 2018 prizes. Also, there were few prizes were awarded between 1914 and 1920. Why do you think that is?

3.9. What are indexes?
1. What are indexes?
It's time to speed up our queries. Enter indexes.

2. What are indexes?
An index in MongoDB is like a book's index. Let's say I grab a textbook on materials science. I want information on eutectic temperatures. I could flip through the book. I could also try narrowing down to a chapter from skimming the table of contents.

3. What are indexes?
Instead, I go to the index in back. I see an alphabetical ordering of terms, with page numbers for each. I find "eutectic temperature", which directs me to page 314. I go there, and violà!

4. What are indexes?
With MongoDB, imagine each collection as a book, each document as a page, and each field as a type of content. Imagine an ordered index for temperatures. This means you can find all pages that list temperatures in a range of interest. This is hard to do with an actual book. But, MongoDB structures documents with fields. Thus, you can index fields using the values of those fields.

5. When to use indexes?
When are indexes useful? First, when you expect to get only one or a few documents back. If your typical queries fetch most if not all documents, you might as well scan the whole collection. Making Mongo maintain an index is a waste of time. Second, when you have very large documents or very large collections. Rather than load these into memory from disk, Mongo can use much-smaller indexes.

6. Gauging performance before indexing
How long does it take to collect prize documents using certain queries? Let's measure. I use here the "timeit" module of Python, via the Jupyter notebook's "timeit" magic. Fetching prizes from 1901 takes half a millisecond on my laptop. Fetching all prizes sorted by year takes over five milliseconds.

7. Adding a single-field index
Let's now create an ascending index on prize years using the create_index method. Mongo can read a single-field index in reverse. For a multi-field index, though, direction matters. After creating this index, query performance improves. The first query's runtime drops by 30%, the second by 20%. These gains surprise me - not because they are low, but because they are high! Our prizes collection is under a quarter megabyte uncompressed. It has fewer than a thousand documents. Imagine the performance gain on a much larger collection. Especially if the working set doesn't fit in RAM.

8. Adding a compound (multiple-field) index
Here we create a compound index on ascending category and then ascending year. Thus, Mongo maintains an index by ascending year for each category. Here we list all years of economics prizes. We involve only the category and year fields. Thus, Mongo never has to examine the collection itself to execute the query - the query is "covered" by the index. We see only a minor speedup, but indexes can take up far less space than their collections. Defining indexes that cover common queries can be huge for performance. Here is another query, fetching the first award year for the prize in economics. Once again, our compound index covers the query.

9. Learn more: ask your collection and your queries
Finally, I want to show you some tools to troubleshoot query performance. We won't cover these tools in the exercises. The first is the "index information" method. This helps confirm which indexes exist for a collection. The second tool is the "explain" method of a cursor. MongoDB provides output from its query plan detailing how a given query will execute. Filtering, projecting, sorting, and fetching all happen in stages. Here we see a full collection scan, or collscan, preceding projection. After creating an appropriate index, we see that an index scan, or ixscan, happens instead.


3.10. High-share categories
In the year 3030, everybody wants to be a Nobel laureate. Over the last thousand years, many new categories have been added. You serve a MongoDB prizes collection with the same schema as we've seen. Many people theorize that they have a better chance in "high-share" categories. They are hitting your server with similar, long-running queries. It's time to cover those queries with an index.

Which of the following indexes is best suited to speeding up the operation db.prizes.distinct("category", {"laureates.share": {"$gt": "3"}})?

Answer the question
Possible Answers
[("category", 1)] -- Recall that for a distinct query the filter argument is passed as a second argument, whereas the projected field is passed first.
[("category", 1), ("laureates.share", 1)] 
[("laureates.share", 1)] -- This index does indeed speed up the query, but we can do better by covering the projection of the category field as well.
---> [("laureates.share", 1), ("category", 1)] --- For a distinct query the filter argument is passed as a second argument, whereas the projected field is passed first.

Hint
Recall that for a distinct query the filter argument is passed as a second argument, whereas the projected field is passed first. For an index to cover a query that filters and projects, we want a compound index on the filter field and then on the projection field (if it's different than the filter field).

3.11. Recently single?
A prize might be awarded to a single laureate or to several. For each prize category, report the most recent year that a single laureate -- rather than several -- received a prize in that category. As part of this task, you will ensure an index that speeds up finding prizes by category and then sorting results by decreasing year

Instructions
Specify an index model that indexes first on category (ascending) and second on year (descending).
Save a string report for printing the last single-laureate year for each distinct category, one category per line. To do this, for each distinct prize category, find the latest-year prize (requiring a descending sort by year) of that category (so, find matches for that category) with a laureate share of "1".

Hint
An index model is a list of (field, direction) pairs, where direction is either 1 (ascending) or -1 (descending). Recall that the argument passed to find or find_one's sort parameter is formatted similarly. Thus, to obtain latest-year prize documents, you sort by [("year", -1)]. Use <collection>.distinct to find distinct values of a field such as "category".

Code:
# Specify an index model for compound sorting
index_model = [("category", 1), ("year", -1)]
db.prizes.create_index(index_model)

# Collect the last single-laureate year for each category
report = ""
for category in sorted(db.prizes.distinct("category")):
    doc = db.prizes.find_one(
        {"category": category, "laureates.share": "1"},
        sort=[("year", -1)]
    )
    report += "{category}: {year}\n".format(**doc)

print(report)

Simply singular! It seems that physics is the most consistently shared prize category in modern times.

3.12. Born and affiliated
Some countries are, for one or more laureates, both their country of birth ("bornCountry") and a country of affiliation for one or more of their prizes ("prizes.affiliations.country"). You will find the five countries of birth with the highest counts of such laureates.

Instructions
Create an index on country of birth ("bornCountry") for db.laureates to ensure efficient gathering of distinct values and counting of documents
Complete the skeleton dictionary comprehension to construct n_born_and_affiliated, the count of laureates as described above for each distinct country of birth. For each call to count_documents, ensure that you use the value of country to filter documents properly.

Hint
For a given country of birth country, you want to count the number of laureates documents for which that country is both the "bornCountry" and a "prizes.affiliations.country" for the laureate.

Code:
from collections import Counter

# Ensure an index on country of birth
db.laureates.create_index([("bornCountry", 1)])

# Collect a count of laureates for each country of birth
n_born_and_affiliated = {
    country: db.laureates.count_documents({
        "bornCountry": country,
        "prizes.affiliations.country": country
    })
    for country in db.laureates.distinct("bornCountry")
}

five_most_common = Counter(n_born_and_affiliated).most_common(5)
print(five_most_common)

As you may guess, simple string matching of country names for this dataset is problematic, but this is a solid first pass.



3.13. Limits
1. Limits and Skips with Sorts, Oh My!
In this lesson we will learn about the limit and skip parameters of Mongo queries. They can help us inspect a few documents at a time and page through a collection. In concert with sorting, they can help us get documents with extreme values.

2. Limiting our exploration
Let's say I want to get prize category and year information for a few prizes split three ways. First, I check that for all prizes, either all laureates have a one-third share, or none have a one-third share. I verify my assumption with this for-loop of assertions. Now, I can print information on prizes split three ways. I filter for laureate share equal to three, and I get a long iterator: tens of lines fill my screen. Can I fetch only a few documents to examine before I decide how to proceed next in my analysis? Yes. Mongo provides a convenient limit option as an extra parameter to the find method. There we go.

3. Skips and paging through results
Besides limiting the number of results, we can also skip results server-side. When you use the "skip" parameter in conjunction with limits, you can get pagination, with the number of results per page set by the limit parameter.

4. Using cursor methods for {sort, skip, limit}
You can also chain methods to a cursor. This is an alternative to passing extra parameters to the "find" method. Here's what this looks like in the case of setting limits. I don't pass "limit" as a keyword argument to the find method. Rather, I chain the limit method, with an argument of three, to the cursor. And here's how to amend a cursor by chaining both skip and limit methods to it. Finally, I can even alter the sorting on a cursor by chaining a call to the sort method. Here, I sort by ascending year.

5. Simpler sorts of sort
One last thing. When sorting using the chained method, pymongo allows a couple of shortcuts. Here we specify sorting as before with a list of (field, direction) pairs. There is only one pair because we are sorting by only one field. In this case, we can destructure that single pair. Here I specify the sort with the field as the first argument and the direction as the second argument. Furthermore, pymongo will take the default direction to be ascending. Thus, we can sort by ascending year as a chained call with a single argument, "year". All these cursors yield the same sequence of documents. Finally, note that using the "find_one" method is different. It's like a call to "find" with the limit set to one and with automatic fetching from the cursor. Thus, in this case, you cannot use cursor methods - you need to pass skip and sort requirements as arguments.

6. Limit or Skip Practice? Exactly.
Before you skip ahead, let's test some limits. Especially after getting some things sorted.


3.14. Setting a new limit?
How many documents does the following expression return?

list(db.prizes.find({"category": "economics"},
                    {"year": 1, "_id": 0})
     .sort("year")
     .limit(3)
     .limit(5))

Instructions
Possible Answers
---  3: the first call to limit takes precedence --- Try evaluating the given expression in your console
---> 5: the second call to limit overrides the first ---  You can think of the query parameters as being updated like a dictionary in Python: 
            d = {'limit': 3}; d.update({'limit': 5}); print(d) 
                                                   will print "{'limit': 5}"
---  none: instead, an error is raised  -- 


Hint
Try evaluating the given expression in your console.



3.15. The first five prizes with quarter shares
Find the first five prizes with one or more laureates sharing 1/4 of the prize. Project our prize category, year, and laureates' motivations.

Instructions
Save to filter_ the filter document to fetch only prizes with one or more quarter-share laureates, i.e. with a "laureates.share" of "4".
Save to projection the list of field names so that prize category, year and laureates' motivations ("laureates.motivation") may be fetched for inspection.
Save to cursor a cursor that will yield prizes, sorted by ascending year. Limit this to five prizes, and sort using the most concise specification.

Hint
Evaluate db.prizes.find_one() in the console to refresh your memory of prize-document fields and how their values are formatted. Recall that <cursor>.sort(<field>) will sort a cursor by

Code:
from pprint import pprint

# Fetch prizes with quarter-share laureate(s)
filter_ = {'laureates.share': '4'}

# Save the list of field names
projection = ['category', 'year', 'laureates.motivation']

# Save a cursor to yield the first five prizes
cursor = db.prizes.find(filter_, projection).sort("year").limit(5)
pprint(list(cursor))

For all of these prizes, there were two laureates with quarter shares for their work together, and there was a third laureate with a half share for separate work (as evidenced by the motivation fields).


3.16. Pages of particle-prized people

You and a friend want to set up a website that gives information on Nobel laureates with awards relating to particle phenomena. You want to present these laureates one page at a time, with three laureates per page. You decide to order the laureates chronologically by award year. When there is a "tie" in ordering (i.e. two laureates were awarded prizes in the same year), you want to order them alphabetically by surname.

Instructions
Complete the function get_particle_laureates that, given page_number and page_size, retrieves a given page of prize data on laureates who have the word "particle" (use $regex) in their prize motivations ("prizes.motivation"). Sort laureates first by ascending "prizes.year" and next by ascending "surname".
Collect and save the first nine pages of laureate data to pages.

Hint
The MongoDB query operator $regex helps with substring matching, so that {"prizes.motivation": {"$regex": "particle"}} will find laureates who have the word "particle" in any of their prize motivations. Note that you will need both the skip and limit methods of a cursor to implement pagination on it.

Code:
from pprint import pprint

# Write a function to retrieve a page of data
def get_particle_laureates(page_number=1, page_size=3):
    if page_number < 1 or not isinstance(page_number, int):
        raise ValueError("Pages are natural numbers (starting from 1).")
    particle_laureates = list(
        db.laureates.find(
            {"prizes.motivation": {"$regex": "particle"}},
            ["firstname", "surname", "prizes"])
        .sort([("prizes.year", 1), ("surname", 1)])
        .skip(page_size * (page_number - 1))
        .limit(page_size))
    return particle_laureates

# Collect and save the first nine pages
pages = [get_particle_laureates(page_number=page) for page in range(1,9)]
pprint(pages[0])

Particles may be small, but discoveries related to them have made quite an impact!


