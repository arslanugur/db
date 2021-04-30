4. Aggregation Pipelines: Let the Server Do It For You
"""You've used projection, sorting, indexing, and limits to speed up data fetching. 
   But there are still annoying performance bottlenecks in your analysis pipelines. 
   You still need to fetch a ton of data. Thus, network bandwidth and downstream processing and memory capacity still impact performance. 
   This chapter is about using MongoDB to perform aggregations for you on the server."""

4.1. Intro to Aggregation
1. Intro to Aggregation: From Query Components to Aggregation Stages
There are cases where you may want to avoid having to fetch and iterate over lots of data client-side. In this chapter, we'll learn how MongoDB can do a good chunk of your data analysis and aggregation for you. In this first lesson, we'll reproduce what we already know how to do with the "find" method of a collection. By doing so, we'll see how the implicit stages of a query can map to explicit stages of an aggregation pipeline.

2. Queries have implicit stages
Here, we iterate over a cursor to yield prize-year information for a few USA-born laureates. I used indentation in this code to demarcate implicit stages. Also, I passed the arguments to "find" as keyword arguments to name these stages. The first stage filters for documents that match an expression. The second stage projects out fields I need downstream for output. Finally, the last stage limits the number of documents retrieved. With an aggregation pipeline, I make these stages explicit. An aggregation pipeline is a list, a sequence of stages, and it looks like this. Each stage involves a stage operator. Here's an aggregation that produces the same result as our call to "find" on the left. To filter for documents matching an expression, I use the match operator. To project fields, I use project. And to limit results, I use limit. This pipeline, in particular, has three stages. It matches documents for USA-born laureates. It strips the documents of all but prize years. And it yields only the first three.

3. Adding sort and skip stages
Sorting and skipping are also available as pipeline stages. Here, we project prize years for USA-born laureates. We yield them in chronological order. Furthermore, we skip the first year and collect only the second, third, and fourth. One quirk of the sort stage in pymongo is that it requires a dictionary-like object. We can use the OrderedDict class in Python's included collections module. This class yields field-direction pairs in the order they are input. In the case of sorting by only one key, we can of course use a plain dictionary. I use the more general form here so that you know how to ensure compound indices.

4. But can I count?
Finally, we can use a "count" stage to count the number of documents passed in from the previous stage. This count gets assigned to a field of your choosing. Here, I count the number of USA-born laureates. This aggregation, of course, is the same as the "count_documents" method of a collection. The other convenience method we know about for aggregation is "distinct". This method has a counterpart aggregation stage as well, which we'll cover in the next lesson.

5. Let's practice!
You can now translate collection and cursor methods to aggregation pipeline stages. You've seen how to do this for all but the "distinct" method, which we'll cover later. Let's practice doing these translations before we learn about more-advanced aggregation capabilities.

4.2. Sequencing stages
Here is a cursor, followed by four aggregation pipeline stages:

cursor = (db.laureates.find(
    projection={"firstname": 1, "prizes.year": 1, "_id": 0},
    filter={"gender": "org"})
 .limit(3).sort("prizes.year", -1))

project_stage = {"$project": {"firstname": 1, "prizes.year": 1, "_id": 0}}
match_stage = {"$match": {"gender": "org"}}
limit_stage = {"$limit": 3}
sort_stage = {"$sort": {"prizes.year": -1}}

What sequence pipeline of the above four stages can produce a cursor db.laureates.aggregate(pipeline) equivalent to cursor above?

Instructions
Possible Answers
    [project_stage, match_stage, limit_stage, sort_stage] -- the projection stage happens before the match stage, and because the 'gender' field is not projected, {'gender': 'org'} will not match any documents at the match stage
    [project_stage, match_stage, sort_stage, limit_stage] -- projection stage happens before the match stage, and because the 'gender' field is not projected, {'gender': 'org'} will not match any documents at the match stage
    [match_stage, project_stage, limit_stage, sort_stage] -- With the limit stage preceding the sort stage, the sorting only happens on the first three documents inserted in the collection
--> [match_stage, project_stage, sort_stage, limit_stage] -- Note that you may need to put a $sort stage before a $project stage if you are sorting on a field left out in that projection (not the case in this exercise).

Hint
Try evaluating list(db.laureates.aggregate(pipeline)) in the console for each pipeline option.


4.3. Aggregating a few individuals' country data
The following query cursor yields birth-country and prize-affiliation-country information for three non-organization laureates:

cursor = (db.laureates.find(
    {"gender": {"$ne": "org"}},
    ["bornCountry", "prizes.affiliations.country"]
).limit(3))

Instructions
Translate the above cursor cursor to an equivalent aggregation cursor, saving the pipeline stages to pipeline. Recall that the find collection method's "filter" parameter maps to the "$match" aggregation stage, its "projection" parameter maps to the "$project" stage, and the "limit" parameter (or cursor method) maps to the "$limit" stage.

Hint
For aggregation, you can't use the list syntax for projection. Instead, you must use the dictionary syntax, i.e. {<field1>: 1, <field2>: 1} to project fields

Code:
# Translate cursor to aggregation pipeline
pipeline = [
    {"$match": {"gender": {"$ne": "org"}}},
    {"$project": {"bornCountry": 1, "prizes.affiliations.country": 1}},
    {"$limit": 3}  
]

for doc in db.laureates.aggregate(pipeline):
    print("{bornCountry}: {prizes}".format(**doc))
    
Note that the specification(s) of a '$project' stage must be in the form of a dictionary, whereas they can be passed as a list to <collection>.find.    

4.4. Passing the aggregation baton to Python
Construct an aggregation pipeline to collect, in reverse chronological order (i.e., descending year), prize documents for all original categories (that is, $in categories awarded in 1901). Project only the prize year and category (including document _id is fine).

The aggregation cursor will be fed to Python's itertools.groupby function to group prizes by year. For each year that at least one of the original prize categories was missing, a line with all missing categories for that year will be printed.

Instructions
Save to pipeline an aggregation pipeline to collect prize documents as detailed above. Use Python's collections.OrderedDict to specify any sorting.

Hint
How do we restrict prize documents to only those with a category "$in" a list of original categories? How do we project fields in a pipeline? And how do we specify a sequence of field-direction pairs for sorting?

Code:
from collections import OrderedDict
from itertools import groupby
from operator import itemgetter

original_categories = set(db.prizes.distinct("category", {"year": "1901"}))

# Save an pipeline to collect original-category prizes
pipeline = [
    {"$match": {"category": {"$in": list(original_categories)}}},
    {"$project": {"category": 1, "year": 1}},
    {"$sort": OrderedDict([("year", -1)])}
]
cursor = db.prizes.aggregate(pipeline)
for key, group in groupby(cursor, key=itemgetter("year")):
    missing = original_categories - {doc["category"] for doc in group}
    if missing:
        print("{year}: {missing}".format(year=key, missing=", ".join(sorted(missing))))
        
Perfect pipelining! We will learn in the next lesson how Mongo can do grouping for us in a $group stage.

4.5. Aggregation Operators and Grouping
1. Back to Counting:
In the last lesson, we learned how to translate the implicit stages of a query to aggregation stages. Now, let's dip our toes into more-advanced aggregation capabilities.

2. Field paths
Aggregation stages can use expressions that contain field paths. To see this in action, first let's clarify some terminology. An expression object has the form "field1, expression1, dot dot dot". It's what you pass to an aggregation stage. Here, we pass an expression object to a "project" stage. The object has one key, "prizes-dot-share", with a corresponding expression value of 1. In contrast, here we project a field that we call "n_prizes". The field takes the value of the expression "dollar-size maps to dollar-prizes". The string dollar-prizes is a field path. It takes the value of the prizes field for each document processed at that stage by the pipeline. Note that you can create new fields, or overwrite old ones, during aggregation.

3. Operator expressions
The other new concept here is the operator expression, which treats an operator as a function. The expression applies the operator to one or more arguments and returns a value. Here, the size operator take the field path dollar-prizes as an argument. Thus, the expression object assigns the field n-prizes to the size of the prizes array. We could also write the operator expression as taking a list of one element, and we get the same result. For convenience, when an operator only has one parameter, we can omit the brackets as above.

4. One more example: a multi-parameter operator
Many operators available in query filters have counterparts for aggregation. For example, here I use the dollar-in operator, which takes two parameters. To get the array of prize shares for a laureate, I use a field path. I then project a new field, "solo winner", which is true if and only if the array of prize shares contains the string value "1".

5. Implementing .distinct()
Now we know a bit about expressions and field paths. Let's translate the "distinct" collection method to an aggregation. Here I use a new stage, dollar-group. A group stage takes an expression object that must map the underscore-id field. As for any MongoDB document, the underscore-id field must be unique. In this case, each output document will have as its id a distinct value of the bornCountry field. All bornCountry values get captured because no match stage precedes the group stage. Thus, our list comprehension collecting id values collects all distinct bornCountry values. This includes the value None, which happens when a field is not present in a document.

6. How many prizes have been awarded in total?
Let's combine a group stage with a project stage. How many prizes has the Nobel committee awarded? The project stage is familiar to us from a few slides back, but what about this group stage? The underscore-id gets mapped to None for every document. This means one and only one document will emerge from the group stage. This one document maps a new field, n-prizes-total, to an operator expression. Some operators, like dollar-sum here, act as accumulators in a group stage. This means they don't operate only on one document. Rather, they have state and will accumulate a value as one document after another of a group gets passed to it. Here, we compute the sum of lengths of all prizes arrays across all laureates. We do this without sending a single laureate document down the wire. Aggregations like this can save a lot of time and bandwidth for very large collections.

7. Let's practice!
Okay, time to practice using field paths, operator expressions, and group stages for aggregation.


4.6. Field Paths and Sets
Previously, we confirmed -- via a Python loop -- that for each prize, either all laureates have a 1/3 share, or none do. Now, let's do this via an aggregation (result should be an empty list):

list(db.prizes.aggregate([
    {"$project": {"allThree": {"$setEquals": [____, ____]},
                  "noneThree": {"$not": {"$setIsSubset": [____, ____]}}}},
    {"$match": {"$nor": [{"allThree": True}, {"noneThree": True}]}}]))

Which values fill the blanks?

Instructions
Possible Answers
---> "$laureates.share", ["3"], ["3"], "$laureates.share" --- Field paths in operator expressions are prepended by "$" to distinguish them from literal string values, and JSON/MongoDB "sets" are delimited by square brackets, just like lists.
---  "laureates.share", ["3"], ["3"], "laureates.share"  --- How does MongoDB distinguish between the literal string "foo" and the value of the document field "foo" (a field path) in an operator expression?
---  "laureates.share", {"3"}, {"3"}, "laureates.share"  --- Python has separate syntax for sets and lists, but JSON, and by extension MongoDB, does not. Also, how does MongoDB distinguish between the literal string "foo" and the value of the document field "foo" (a field path) in an operator expression?
---  "$laureates.share", {"3"}, {"3"}, "$laureates.share" --- Python has separate syntax for sets and lists, but JSON, and by extension MongoDB, does not.

Hint
Python has separate syntax for sets and lists, but JSON, and by extension MongoDB, does not. Also, how does MongoDB distinguish between the literal string "foo" and the value of the document field "foo" (a field path) in an operator expression?


4.7. Organizing prizes
In the slides at the beginning of this lesson, we saw a two-stage aggregation pipeline to determine the number of prizes awarded in total. How many prizes were awarded (at least partly) to organizations?

Instructions
Fill out pipeline to determine the number of prizes awarded (at least partly) to organizations. To do this, you'll first need to $match on the "gender" that designates organizations.
Then, use a field path to project the number of prizes for each organization as the "$size" of the "prizes" array. Recall that to specify the value of a field "<my_field>", you use the field path "$<my_field>".
Finally, use a single group {"_id": None} to sum over the values of all organizations' prize counts.

Hint
Be sure to $match on organizations -- that is, "gender" should be "org". To specify the field path to "<field1>", you use the notation "$<field1>", so e.g. "$prizes" will substitute for the (array) value of the "prizes" field.

Code:
# Count prizes awarded (at least partly) to organizations as a sum over sizes of "prizes" arrays.
pipeline = [
    {"$match": {"gender": "org"}},
    {"$project": {"n_prizes": {"$size": "$prizes"}}},
    {"$group": {"_id": None, "n_prizes_total": {"$sum": "$n_prizes"}}}
]

print(list(db.laureates.aggregate(pipeline)))

You can envision iteratively building and rebuilding an aggregation pipeline to drill down into and ask related questions about MongoDB data collections.

4.8. Gap years, aggregated
In a previous exercise, you collected instances of prize categories not being awarded in particular years. You implemented this using a for loop in Python. You will now implement this as an aggregation pipeline that:

Filters for original prize categories (i.e. sans economics),
Projects category and year,
Groups distinct prize categories awarded by year,
Projects prize categories not awarded by year,
Filters for years with missing prize categories, and
Returns a cursor of documents in reverse chronological order, one per year, each with a list of missing prize categories for that year.
Remember to use field paths (precede field names with "$") to extract field values in expressions.

Instructions
Make the $group stage output a document for each prize year (set "_id" to the field path for year) with the set of categories awarded that year.
Given your intermediate collection of year-keyed documents, $project a field named "missing" with the (original) categories not awarded that year. Again, mind your field paths!
Use a $match stage to only pass through documents with at least one missing prize category.
Finally, add sort documents in descending order.

Hint
Remember to use field paths (prepend field names with "$") when appropriate in expressions. Note that, as you proceed in a pipeline, documents at a given stage may have different/overwritten fields than those of previous stages; some fields may even have been created by previous stages. Finally, recall that {"$exists": True} asserts the presence of a field.

Code:
from collections import OrderedDict

original_categories = sorted(set(db.prizes.distinct("category", {"year": "1901"})))
pipeline = [
    {"$match": {"category": {"$in": original_categories}}},
    {"$project": {"category": 1, "year": 1}},
    
    # Collect the set of category values for each prize year.
    {"$group": {"_id": "$year", "categories": {"$addToSet": "$category"}}},
    
    # Project categories *not* awarded (i.e., that are missing this year).
    {"$project": {"missing": {"$setDifference": [original_categories, "$categories"]}}},
    
    # Only include years with at least one missing category
    {"$match": {"missing.0": {"$exists": True}}},
    
    # Sort in reverse chronological order. Note that "_id" is a distinct year at this stage.
    {"$sort": OrderedDict([("_id", -1)])},
]
for doc in db.prizes.aggregate(pipeline):
    print("{year}: {missing}".format(year=doc["_id"],missing=", ".join(sorted(doc["missing"]))))
    
MongoDB has a rich library of aggregation operators, so it is possible to refactor a variety of client-side analyses into server-side aggregations depending on your performance requirements.

4.9. Zoom into Array Fields
1. Zoom into Array Fields with $unwind
Documents can have array-valued fields, and aggregation stages can introduce them. In this lesson, we'll learn a tool to access array elements during aggregation.

2. Sizing and summing
Let's say we want the number of laureates for each prize. One way to do this is to project a field using the dollar-size operator. We can then add a stage to group by prize category, producing a count of laureates per category. I remove the projection of year in this second pipeline, as there is no need for it. Then, I reset the n_laureates field to be the sum of n_laureates values over each category. Finally, I sort by descending count.

3. How to $unwind
How might we use individual elements of the laureates array? One powerful option is the dollar-unwind stage. This outputs one pipeline document per array element. Here, we unwind the laureates field across three documents.

4. Renormalization, anyone?
We can use stages following an unwind to recompress data. What if we want to normalize our data and track only laureate ids for each prize? After all, we can fetch more information from the laureates collection. Here, we get a list of laureate ids for each prize. After unwinding the laureates array, we project year, category, and laureate id. Year and category together identify a prize. So, we can group by a concatenation of those values. I use the addToSet operator in the group stage to collect laureate ids for each prize, and there you have it. I could also have grouped by underscore-id. But, the category-year combo is more readable, and I introduced you to a new operator!

5. $unwind and count 'em, one by one
Here's another way to understand the unwind operator. Before, we used the size operator to project the number of laureates per prize. This projection fed into a group stage to output counts by category. Instead of projecting sizes and summing over them, we can unwind and count documents. The group stage here counts the documents per category fed to it by the unwind stage. The two pipelines shown produce the same result.

6. $lookup
Finally, let's see a stage that often accompanies unwinding: dollar-lookup. This stage pulls in documents from another collection via what's termed a left outer join. Let's collect countries of birth for economics laureates. From the prizes collection, we first unwind the laureates array. Each pipeline document now has a single laureates-dot-id. Then, we query the laureates collection for documents with the same value for id. For each one we find, we push it into an array we name "laureate bios". Next, we collect the distinct laureate bornCountry values. We want to feed single bornCountry values, not arrays, to the $addToSet operator. Hence, we unwind before the group stage. Is there an easier way to do this? Sure! MongoDB doesn't enforce a normalized schema. Thus, you can tailor a collection's schema to support query simplicity and efficiency. We know the laureates collection stores info on prize categories as well. So, this one-liner produces the same result as the five-stage aggregation pipeline above. Even so, it's good to know that you can perform server-side joins in a pinch.

7. Time to unwind... with exercises!
Sometimes, it feels good to unwind. Let's practice.


4.10. Embedding aggregation expressions
The $expr operator allows embedding of aggregation expressions in a normal query (or in a $match stage). Which of the following expressions counts the number of laureate documents with string-valued bornCountries when passed to db.laureates.count_documents?

You can assume (and check!) that the following is true:

assert all(isinstance(v, str) for v in db.laureates.distinct("bornCountry"))

Instructions
Possible Answers

--- {"bornCountry": {"$in": db.laureates.distinct("bornCountry")}} --- This produces the correct count, but so do the other options.
--- {"$expr": {"$in": ["$bornCountry", db.laureates.distinct("bornCountry")]}} 
--- {"$expr": {"$eq": [{"$type": "$bornCountry"}, "string"]}} 
--- {"bornCountry": {"$type": "string"}} 
--->All of the above  --- Though aggregation expressions different in syntax, they often correspond to familiar query expressions.

Hint
Try passing each option as an argument to db.laureates.count_documents. Though aggregation expressions different in syntax, they often correspond to familiar query expressions.


4.11. Here and elsewhere
What proportion of laureates won a prize while affiliated with an institution in their country of birth? Build an aggregation pipeline to get the count of laureates who either did or did not win a prize with an affiliation country that is a substring of their country of birth -- for example, the prize affiliation country "Germany" should match the country of birth "Prussia (now Germany)".

Instructions
Use $unwind stages to ensure a single prize affiliation country per pipeline document.
Filter out prize-affiliation-country values that are "empty" (null, not present, etc.) -- ensure values are "$in" the list of known values.
Produce a count of documents for each value of "affilCountrySameAsBorn" (a field we've projected for you using the $indexOfBytes operator) by adding 1 to the running sum.

Hint
Unwind one array at a time using field paths and dot notation -- laureates have an array of prizes, each of which has an array of affiliations. You then need to detect whether a field value is a member (is "$in") a distinct array of values. Finally, ensure that you add 1 to the running total for a group as each document flows into the last stage.

Code:
key_ac = "prizes.affiliations.country"
key_bc = "bornCountry"
pipeline = [
    {"$project": {key_bc: 1, key_ac: 1}},

    # Ensure a single prize affiliation country per pipeline document
    {"$unwind": "$prizes"},
    {"$unwind": "$prizes.affiliations"},

    # Ensure values in the list of distinct values (so not empty)
    {"$match": {key_ac: {"$in": db.laureates.distinct(key_ac)}}},
    {"$project": {"affilCountrySameAsBorn": {
        "$gte": [{"$indexOfBytes": ["$"+key_ac, "$"+key_bc]}, 0]}}},

    # Count by "$affilCountrySameAsBorn" value (True or False)
    {"$group": {"_id": "$affilCountrySameAsBorn",
                "count": {"$sum": 1}}},
]
for doc in db.laureates.aggregate(pipeline): print(doc)


Over a third of leaureates have no detected affiliation in their recorded country of birth.

4.12. Countries of birth by prize category
Some prize categories have laureates hailing from a greater number of countries than do other categories. You will build an aggregation pipeline for the prizes collection to collect these numbers, using a $lookup stage to obtain laureate countries of birth.

Instructions
$unwind the laureates array field to output one pipeline document for each array element.
After pulling in laureate bios with a $lookup stage, unwind the new laureate_bios array field (each laureate has only a single biography document).
Collect the set of bornCountries associated with each prize category.
Project out the size of each category's set of bornCountries.

Hint
Remember to specify field paths as field names prepended by a "$". Recall that the "_id" field, the same field that is guaranteed to be unique for every document in a collection, is used to group documents in a $group stage.

Code:
pipeline = [
    # Unwind the laureates array
    {"$unwind": "$laureates"},
    {"$lookup": {
        "from": "laureates", "foreignField": "id",
        "localField": "laureates.id", "as": "laureate_bios"}},

    # Unwind the new laureate_bios array
    {"$unwind": "$laureate_bios"},
    {"$project": {"category": 1,
                  "bornCountry": "$laureate_bios.bornCountry"}},

    # Collect bornCountry values associated with each prize category
    {"$group": {"_id": "$category",
                "bornCountries": {"$addToSet": "$bornCountry"}}},

    # Project out the size of each category's (set of) bornCountries
    {"$project": {"category": 1,
                  "nBornCountries": {"$size": "$bornCountries"}}},
    {"$sort": {"nBornCountries": -1}},
]
for doc in db.prizes.aggregate(pipeline): print(doc)

It seems that economics laureates hail from the smallest number of countries than any other category, and literature laureates hail from the largest.


4.13. Something Extra: $addFields to Aid Analysis
1. Something Extra: $addFields to Aid Analysis
It's time to round out our aggregation know-how and wrap up the course. In this lesson, we'll learn how to add fields in a pipeline without having to project existing fields.

2. A somber $project
For Nobel laureates that have died, I want to know the number of years they were alive. I can start a pipeline to compute this by projecting out the "died" and "born" fields. Skimming the MongoDB documentation, I found a handy operator, dateFromString. This will help us subtract the date of birth from the date of death. But wait! Some laureate documents have an invalid date of all zeroes. Why? This encodes that their date of birth is not recorded. To overcome this, let's insert a match stage at the start of our pipeline. Now, we include only laureates with reasonable years of both birth and death. Darn! It looks like some laureates have only their year of birth recorded. How can we accommodate this?

3. $split and $cond-itionally correct (with $concat)
Here's one way we can choose to accommodate a date of birth that is only a year. First, we can use a new stage, addFields, to provide new array fields split on the hyphen in the date strings. This gives us year, month, and day as the array elements. Why use addFields rather than project? Simple. We do not need to specify all the other fields we want to pass along in the pipeline. This enables us to use the existing born field in this next stage, also an addFields stage. Here, I re-write the born field if the string value zero-zero is in the bornArray. I fix it to be a real date by concatenating the year element of bornArray with the string suffix for January 1st. The conditional expression operator, cond, is a ternary operator. It evaluates the first expression, and, if it's true, returns the value of the next expression. Otherwise, it returns the value of the third expression. Now, at last, we are able to compute the number of years each laureate was alive.

4. A $bucket list
Now, let's compute the number of years between the died and born dates. I show only the last stage of our pipeline so far. First, we subtract the dates. This produces a value in milliseconds. Next, we divide by the approximate number of milliseconds in an average year. Finally, we floor the value to the nearest integer. At this point I'd verify that this stage works. I may add a limit stage to inspect a few output documents. I want to show you one last operator to get a sense of the distribution of "year" values across laureates. MongoDB's bucket operator groups values into buckets defined by a sequence of boundaries. Here, we see that one laureate died before the age of 40, and two lived to be over a hundred years old!

5. Practice $addFields
Let's solidify your understanding of the addFields stage. I'll be sure to fold in some of what you learned before.

4.14. "...it's the life in your years"
For the pipeline we developed in the last slide deck, I want you to replace the last ($bucket) stage with one such that, given the documents docs collected, we can get the following output:

from operator import itemgetter

print(max(docs, key=itemgetter("years")))
print(min(docs, key=itemgetter("years")))
{'firstname': 'Rita', 'surname': 'Levi-Montalcini', 'years': 103.0}
{'firstname': 'Martin Luther', 'surname': 'King Jr.', 'years': 39.0}

You may assume that any earlier $project stage has been replaced by an equivalent $addFields stage.

Answer the question
Possible Answers

---> {"$project": {"years": 1, "firstname": 1, "surname": 1, "_id": 0}}  --- You projected the three needed fields are explicitly excluded the _id field. 
---  {"$addFields": {"firstname": 1, "surname": 1}}  --- This resets the "firstname" and "surname" fields to have values of 1 (!) and includes all other document fields in the output.
---  {"$project": {"firstname": 1, "surname": 1}}   --- This stage projects the _id field, which we do not wish to include.
---  {"$project": {"firstname": 1, "surname": 1, "_id": 0}} --- This stage does not project the years field, which we want to include.

Hint
Recall that the _id is included by default; it needs to be explicitly excluded in a projection.

4.15. How many prizes were awarded to immigrants?
How many prizes were awarded to people who had no affiliation in their country of birth at the time of the award?

Instructions
In your aggregation pipeline pipeline, use the "gender" field to limit results to people (that is, not organizations).
Count prizes for which the laureate's "bornCountry" is not also the "country" of any of their affiliations for the prize. Be sure to use field paths (precede a field name with "$") when appropriate.

Hint
Run db.laureates.distinct("gender") to recall the field value used to denote organizations, and run db.laureates.find_one() to re-familiarize yourself with the (dotted) field paths in an example laureate document. Remember to precede field names with a "$" to supply field paths to operator expressions. Note that you can have multiple stages of any type.

Code:
pipeline = [
    # Limit results to people; project needed fields; unwind prizes
    {"$match": {"gender": {"$ne": "org"}}},
    {"$project": {"bornCountry": 1, "prizes.affiliations.country": 1}},
    {"$unwind": "$prizes"},
  
    # Count prizes with no country-of-birth affiliation
    {"$addFields": {"bornCountryInAffiliations": {"$in": ["$bornCountry", "$prizes.affiliations.country"]}}},
    {"$match": {"bornCountryInAffiliations": False}},
    {"$count": "awardedElsewhere"},
]

print(list(db.laureates.aggregate(pipeline)))

Note that because we ended up using only the "bornCountryInAffiliations" field after the $addFields stage, we could refactor that stage to be a $project stage instead.


4.16. Refinement: filter out "unaffiliated" people
In the previous exercise, we counted prizes awarded to people without an affiliation in their "bornCountry". However, hundreds of prizes were awarded to people without recorded affiliations; sure, their "bornCountry" is technically not the "country" of any of their affiliations, but there are no "country" values to compare against!

Instructions
Construct a stage added_stage that filters for laureate "prizes.affiliations.country" values that are non-empty, that is, are $in a list of the distinct values that the field takes in the collection.
Insert this stage into the pipeline so that it filters out single prizes (not arrays) and precedes any test for membership in an array of countries. Recall that the first parameter to <list>.insert is the (zero-based) index for insertion.

Hint
An array of prizes are listed in a laureate document. The stage to filter prizes, in this case, should happen immediately after only a single prize inhabits each pipeline document. Recall that the $in query operator tests for membership in an array of values.

Code:
pipeline = [
    {"$match": {"gender": {"$ne": "org"}}},
    {"$project": {"bornCountry": 1, "prizes.affiliations.country": 1}},
    {"$unwind": "$prizes"},
    {"$addFields": {"bornCountryInAffiliations": {"$in": ["$bornCountry", "$prizes.affiliations.country"]}}},
    {"$match": {"bornCountryInAffiliations": False}},
    {"$count": "awardedElsewhere"},
]

# Construct the additional filter stage
added_stage = {"$match": {"prizes.affiliations.country": {"$in": db.laureates.distinct("prizes.affiliations.country")}}}

# Insert this stage into the pipeline
pipeline.insert(3, added_stage)
print(list(db.laureates.aggregate(pipeline)))

Note that further refinements are possible. For example, substring matching could mark certain countries as equivalent. When it comes to assumptions, explicit is better than implicit (import this).

4.17. Wrap-Up
1. Wrap-Up
Congratulations on completing this course!

2. You know know how to...
You now know how to work with MongoDB databases and collections. You've created and composed query filters with operators. You've used dot notation to query substructure. You've fetched distinct values, queried arrays, and used regular expressions. You've projected, sorted, and ensured performant queries with indexes. And finally, you've constructed aggregation pipelines for flexible and powerful analyses. You now have the vocabulary and experience you need to resolve issues you encounter in the wild. The official MongoDB documentation is a great resource. The pymongo driver also has great documentation. And of course, search engines are your friend.
