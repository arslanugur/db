2. Working with Distinct Values and Sets
"""Now you have a sense of the data's structure. This chapter is about dipping your toes into the pools of values for various fields. 
   You'll collect distinct values, test for membership in sets, and match values to patterns."""

2.1. Survey Distinct Values
1. The distinct() method
In this lesson, we'll learn to use the "distinct" method on Mongo collections. Using this method, we can collect the set of values assigned to a field across all documents.

2. An exceptional laureate
We found an exceptional laureate in the last chapter. This laureate has received three Nobel prizes, more than any other laureate. Here we can see that this is the International Committee of the Red Cross. You may not have known that organizations can win Nobel prizes, but they have. For example, 23 employees of Lawrence Berkeley Lab shared the Nobel Peace Prize in 2007. They were part of the Intergovernmental Panel on Climate Change. A future exercise will be about the proportion of Nobel prizes awarded to immigrants. Keep in mind that the idea of immigration doesn't apply to some laureates. In this document, I see that the "gender" field has a value of "org", presumably short for "organization". What are the values that this field stores across documents in this collection? MongoDB provides a built-in collection method for such aggregation.

3. Using .distinct()
Here, we call the "distinct" method on the laureates collection. We pass a single argument, "gender". MongoDB collects the distinct values that this field takes across the collection. We see that there are three and only three values for the "gender" field across the collection. You may be wondering where this method comes from, or how you can define a similar operation yourself. The "distinct" method is a convenience for a common aggregation. The "count_documents" method we have been using is a similar convenience. An aggregation processes data across a collection and produces a computed result. In the last chapter of this course, we'll learn how to create custom aggregations. You may be wondering about the efficiency of aggregations in MongoDB. You can register so-called "indexes" on fields for MongoDB to maintain. These indexes can ensure efficient queries and aggregations. In some cases, a query might not even need to run on a collection. We will learn how to create indexes in the next chapter. But, if we're not working with a lot of data, indexes are generally not needed. The laureates collection we're using in this course fits in memory. It weighs in at under a megabyte and has on the order of a thousand documents or fewer. It doesn't matter much if you use an inefficient algorithm to sort a list of a few hundred items. Likewise, a full collection scan isn't a big deal for this aggregation.

4. .distinct() with dot notation
You can use dot notation to specify fields embedded deeper than the root level of a document. This applies in query methods like "find" and "find_one", and it applies for aggregations as well. I notice here that each subdocument in the "prizes" array field has a "category" field. The dot-two in the filter denotes index two of an array field. Thus, this is a laureate where a third element exists in the prizes array. Let's fetch the distinct values of this field. We see, as expected, that there is a value for each category of Nobel prize.

5. Let's practice!
Let's use the distinct method to answer some questions about our Nobel Prize data.


2.2. Categorical data validation
What expression asserts that the distinct Nobel Prize categories catalogued by the "prizes" collection are the same as those catalogued by the "laureates"? Remember to explore example documents in the console via e.g. db.prizes.find_one() and db.laureates.find_one().

Instructions
Possible Answers
      assert db.prizes.distinct("category") == db.laureates.distinct("prizes.category") ---- Although <collection>.distinct returns unique values, they are returned as a list and not guaranteed to be sorted in any way.
      assert db.prizes.distinct("laureates.category") == db.laureates.distinct("prizes.category") ---- Examine the structure of a db.prizes document to see which field stores the prize category.
----> assert set(db.prizes.distinct("category")) == set(db.laureates.distinct("prizes.category"))

Hint
Although <collection>.distinct returns unique values, they are returned as a list and not guaranteed to be sorted in any way.

Converting the lists returned by <collection>.distinct to sets ensures that a check for equality is reliable.


2.3. Never from there, but sometimes there at last
There are some recorded countries of death ("diedCountry") that do not appear as a country of birth ("bornCountry") for laureates. One such country is "East Germany".

Instructions
Return a set of all such countries as countries.

Hint
Use the distinct method of the db.laureates collection.

Code:
# Countries recorded as countries of death but not as countries of birth
countries = set(db.laureates.distinct("diedCountry")) - set(db.laureates.distinct("bornCountry"))
print(countries)

Some of these countries are likely to remain in this set, as they no longer exist!

2.4. Countries of affiliation
We saw in the last exercise that countries can be associated with a laureate as their country of birth and as their country of death. For each prize a laureate received, they may also have been affiliated with an institution at the time, located in a country.

Instructions
Determine the number of distinct countries recorded as part of an affiliation for laureates' prizes. Save this as count.

Hint
Use dot notation to specify the field of interest.

Code:
# The number of distinct countries of laureate affiliation for prizes
count = len(db.laureates.distinct("prizes.affiliations.country"))
print(count)

This number is less than the number of distinct countries of death, and far less than the number of distinct countries of birth.

2.5. Distinct Values Given Filters
1. Pre-filtering distinct values
In this lesson, we're going to dip our toes into the world of aggregation pipelines. We'll use the "filter" parameter of the "distinct" method to match certain documents. The method will fetch field values only from these matching documents.

2. Awards into prize shares
Here I've found a laureate document with a value of "4" for the "share" field in one of it's "prizes" subdocuments. Pierre Curie shared the 1903 Nobel Prize in physics with his wife Marie. They also shared it with physicist Henri Becquerel. Marie and Pierre each received a quarter share of the prize. Henri received the remaining half share. The Nobel Prize API encodes prize share - in particular, the denominator of the fractional share - as a string. Thus, the document records Pierre's quarter share as the string "4".

3. High-share prize categories
Which Nobel prize categories other than physics have laureates with quarter shares? We know how to get the distinct values of prize categories from the laureates collection. We pass the dotted path "prizes-dot-category" to the "distinct" method. We also know how to find - and list - all laureate documents satisfying some criteria using a filter document. Can we compose these two ideas? Sure! The "distinct" method takes an optional filter argument. You can think of this as a two-stage pipeline. First, filter the collection for documents that match a filter. Then, collected and return distinct values of a field for these documents. In the last chapter of this course, we'll learn how to custom-build such pipelines in an explicit way. The Nobel Prize API serves its data in a denormalized way. Thus, we can answer our question from a different perspective. Here, we ask the "prizes" collection to return distinct prize categories. Given a filter on laureate shares, we return distinct values of the "category" field. The result is the same as the call above using the laureates collection.

4. Prize categories with multi-winners
Let's look at one more example of pre-filtering distinct values. Which prize categories have laureates who have won more than one prize? We'll start by counting laureates who won at least two prizes. In other words, those for which a second element exists in their document's "prizes" array. Next, we pass this filter document as a second argument to the "distinct" method. Our first argument is the dotted path to the prize category field. This returns all prize category values with laureates who have won more than one prize. Here are the corresponding prize categories for these six laureates. Notice that not all won prizes in the same category. Marie Curie, for instance, won prizes in both physics and chemistry. Linus Pauling won prizes in both chemistry and peace. We'll learn in the next chapter how to fetch only the document substructure we need. In this case, the MongoDB server returned only enough to communicate prize categories.

5. Practice time!
Now it's your turn. Let's practice enumerating distinct field values of collections given filters.

2.6. Born here, went there
In which countries have USA-born laureates had affiliations for their prizes?

Instructions
Possible Answers
---> Australia, Denmark, United Kingdom, USA --- Code: This is the output of db.laureates.distinct('prizes.affiliations.country', {'bornCountry': 'USA'})
---Australia, France, Sweden, United Kingdom, USA --- Did you use db.laureates.distinct to get 'prizes.affiliations.country' values satisfying the filter {'bornCountry': 'USA'}?
---Australia, Canada, Israel, United Kingdom, USA --- Did you use db.laureates.distinct to get 'prizes.affiliations.country' values satisfying a filter {'bornCountry': 'USA'}?

Hint
Pass a {"bornCountry": "USA"} filter document to db.laureates.distinct to get "prizes.affiliations.country" values satisfying the filter (the filter is the second parameter of distinct)


2.7. Triple plays (mostly) all around
Prizes can be shared, even by more than two laureates. In fact, all prize categories but one – literature – have had prizes shared by three or more laureates.

Instructions
Save a filter document criteria that, when passed to db.prizes.distinct, returns all prize categories shared by three or more laureates. That is, "laureates.2" must exist for such documents.
Save these prize categories as a Python set called triple_play_categories.
Confirm via an assertion that "literature" is the only prize category with no prizes shared by three or more laureates.

Hint
Recall the use of dot notation to specify array-field elements by numerical index, e.g. "laureates.2", and the operator for checking whether something is present in a document, $exists. Also, recall how to construct sets in Python -- both with set given an iterable, and with curly braces given one or more elements delimited by commas.

Code:
# Save a filter for prize documents with three or more laureates
criteria = {"laureates.2": {"$exists": True}}

# Save the set of distinct prize categories in documents satisfying the criteria
triple_play_categories = set(db.prizes.distinct("category", criteria))
assert set(db.prizes.distinct("category")) - triple_play_categories == {"literature"}


2.8. Filter Arrays using Distinct Values
1. Matching array fields
In this lesson, we'll learn more about how to query array fields and their structured values.

2. Array fields and equality
Here we see part of the laureates collection document for John Bardeen. He won two prizes, both in physics. Each prizes array in a laureate document contains subdocuments. Each subdocument has a category field. We can use dot notation to filter for and count laureates with a prize category equal to physics.

3. Array fields and equality, simplified
Here's a simpler example using a fictitious field. Let's imagine that laureate documents had an extra field, "nicknames". This field stores an array of string values. Let's now find all laureates with a nickname of "JB". We could use a filter document like this. The filter matches all documents that have at least one value in the "nicknames" array field equal to "JB". This notation is familiar. If "nicknames" was not an array, the filter would match for the field value being equal to "JB". Because "nicknames" is an array, the filter matches if any member of the array matches.

4. Array fields and operators
Let's go back to filtering on the real "category" field. This field is within subdocuments of the top-level "prizes" array field. As before, we can wrap filter document values with operators. For example, here we filter for laureates with a prize not in physics. Note that these documents may contain a prize subdocument with a category of physics. They need only also contain a prize subdocument with another category value. Another example. Here, we use the "in" operator to find laureates with at least one prize in these three categories. And here, we use the "not-in" operator to find laureates with at least one prize not in these three categories.

5. Enter $elemMatch
But what if we want to filter on more than one field within a prize subdocument? Let's try something like this to count laureates who won unshared prizes in physics. Hmm, that's not quite what we want. This filter matches prize subdocuments that have two and only two fields. No laureates have a prize subdocument that looks exactly like this. All prize subdocuments also have a year field, for instance. This next filter is better, but it's not quite what we want. This filter matches laureate documents satisfying two conditions. The first is that a prizes field has at least one subdocument with a "category" field equal to "physics". The second is that that a prizes field has at least one subdocument with a "share" field equal to "1". The prizes that match for a laureate could be different prizes. This is where the "element match" - or "elemMatch" - operator comes in. Finally, we count all laureates that have at least one unshared prize in physics. Within the "elemMatch" operation, as with any operation, we can continue to drill down. Operations can nest to make finer-grained queries. Here, we extend the last filter to include laureates only if they won a solo prize in physics before 1945.

6. Onward and array-ward!
Let's make sure you understand how to filter arrays with "elemMatch". We'll do this in concert with other operators. And we'll learn some Nobel prize statistics along the way.

2.9. Sharing in physics after World War II
What is the approximate ratio of the number of laureates who won an unshared ({"share": "1"}) prize in physics after World War II ({"year": {"$gte": "1945"}}) to the number of laureates who won a shared prize in physics after World War II?

For reference, the code below determines the number of laureates who won a shared prize in physics before 1945.

db.laureates.count_documents({
    "prizes": {"$elemMatch": {
        "category": "physics",
        "share": {"$ne": "1"},
        "year": {"$lt": "1945"}}}})

Instructions
Possible Answers
0.06 -- Although there has been significant sharing of physics prizes since World War II, the ratio isn't quite that low.
--> 0.13 -- There has been significant sharing of physics prizes since World War II
0.33 -- It turns out there has been significantly more sharing of physics prizes since World War II
0.50 -- It turns out there has been more sharing of physics prizes since World War II

Hint
Use $elemMatch to filter laureate prizes in the two different ways, pass both filters to db.laureates.count_documents, and compute the ratio.

Code:


2.10. Meanwhile, in other categories...
We learned in the last exercise that there has been significantly more sharing of physics prizes since World War II: the ratio of the number of laureates who won an unshared prize in physics in or after 1945 to the number of laureates who shared a prize in physics in or after 1945 is approximately 0.13. What is this ratio for prize categories other than physics, chemistry, and medicine?

Instructions
Save an $elemMatch filter unshared to count laureates with unshared prizes in categories other than ("not in") ["physics", "chemistry", "medicine"] in or after 1945.
Save an $elemMatch filter shared to count laureates with shared (i.e., "share" is not "1") prizes in categories other than ["physics", "chemistry", "medicine"] in or after 1945.

Hint
Both filters use the $elemMatch operator to wrap all other criteria. You'll need to use operators to express a value being "not in" a list, a value being "not equal to" another value, and a value being "greater than or equal to" another value.

Code:
# Save a filter for laureates with unshared prizes
unshared = {
    "prizes": {"$elemMatch": {
        "category": {"$nin": ["physics", "chemistry", "medicine"]},
        "share": "1",
        "year": {"$gte": "1945"},
    }}}

# Save a filter for laureates with shared prizes
shared = {
    "prizes": {"$elemMatch": {
        "category": {"$nin": ["physics", "chemistry", "medicine"]},
        "share": {"$ne": "1"},
        "year": {"$gte": "1945"},
    }}}

ratio = db.laureates.count_documents(unshared) / db.laureates.count_documents(shared)
print(ratio)

This ratio is 1.42, a ten-fold jump over the ratio for physics!

2.11. Organizations and prizes over time
How many organizations won prizes before 1945 versus in or after 1945?

Instructions
You won't need the $elemMatch operator at all for this exercise.
Save a filter before to count organization laureates with prizes won before 1945. Recall that organization status is encoded with the "gender" field, and that dot notation is needed to access a laureate's "year" field within its "prizes" array.
Save a filter in_or_after to count organization laureates with prizes won in or after 1945.

Hint
You don't need to use $elemMatch for this one. {"gender": "org"} filters for organization laureates. Use "prizes.year" to access a laureate's year field within its prizes array using dot notation.

Code:
# Save a filter for organization laureates with prizes won before 1945
before = {
    "gender": "org",
    "prizes.year": {"$lt": "1945"},
    }

# Save a filter for organization laureates with prizes won in or after 1945
in_or_after = {
    "gender": "org",
    "prizes.year": {"$gte": "1945"},
    }

n_before = db.laureates.count_documents(before)
n_in_or_after = db.laureates.count_documents(in_or_after)
ratio = n_in_or_after / (n_in_or_after + n_before)
print(ratio)

Even though fewer than two thirds of Nobel prizes were awarded in 1945 and later, over 80% of organizations won prizes then.

2.12. Distinct As You Like It
1. Distinct As You Like It: Filtering with Regular Expressions
We've seen how to construct filters comparing a field's value exactly. For string-valued fields, we may want instead to match a field's value to a pattern. We may want to match a substring. We may want to constrain that substring to appear at the start or end of a field's value. Or, we may want something more complex. Regular expressions are a powerful way to express such filters. Let's see how MongoDB supports them.

2. Finding a substring with $regex
Let's look at the laureate document for Marie Curie. Recall that she discovered a new element and named it polonium. She did this to publicize her native land's lack of independence. We see here that Poland is a substring of her document's "bornCountry". How can we filter for values of "bornCountry" that contain Poland as a substring? We can use MongoDB's regular expression operator, regex. Here I use the regex operator on the string "Poland" in a filter document. This expression gets distinct values of "bornCountry" that contain "Poland" as a substring. The results show that some laureates were born in places that at the time were not part of Poland but today are. Others were born in places that at the time were part of Poland but today are not. And finally, some were born in places that both at the time were and today are part of Poland.

3. Flag options for regular expressions
We can use the regex operator together with the options operator. This will change the conditions for matching. For example, the "i" option ensures case-insensitive matching. The string passed to regex in the second statement is "poland", all lower case. The assertion here is true - Poland is always capitalized for this field. MongoDB also supports compiled regular expression objects. The pymongo driver includes a bson package with a Regex class, which you can import and use as shown. Finally, using native Python regular expression objects is possible. I do not recommend this, though. Use of the bson Regex class is more robust for MongoDB.

4. Beginning and ending (and escaping)
The syntax of regular expressions is rich. For the exercises, though, you only need to know a few tricks. First, you need to know how to match the beginning or end of a field's value. Second, you need to know how to escape a special character so that you match the character itself. To match the beginning of a field's value, use the caret character. Anchor it to the beginning of the string you pass to regex. This expression returns distinct values of the "bornCountry" field that start with Poland. To escape a character, use a backslash. A paren functions to capture groups in regular expressions. Because we want to match a literal open paren and not use this function, we escape it with a backslash. This expression returns "bornCountry" values for countries that used to be Poland. Finally, to match the end of a field's value, use the dollar sign. Anchor it to the end of what you pass to regex. This expression returns all countries that became Poland after a laureate's birth. What you see here is all you need for the exercises. Use a caret to match the beginning of a field, a dollar sign to match the end, and a backslash to escape parentheses.

5. Let's practice!
We have new tools to answer questions about string-valued fields in MongoDB collections. Let's practice!

2.13. Glenn, George, and others in the G.B. crew
There are two laureates with Berkeley, California as a prize affiliation city that have the initials G.S. - Glenn Seaborg and George Smoot. How many laureates in total have a first name beginning with "G" and a surname beginning with "S"?

Evaluate the expression

db.laureates.count_documents({"firstname": Regex(____), "surname": Regex(____)})

in the console, filling in the blanks appropriately.

Instructions
Possible Answers
--> 9 laureates  - The filter {"firstname": Regex("^G"), "surname": Regex("^S")} gives us the right answer.
--  12 laureates - Did you forget to anchor matches to the beginning with a caret (^)? For a value to start with "G" (capital G), the regular expression to match is ^G.
--  50 laureates - For a value to start with "G" (capital G), the regular expression to match is ^G. Also, we do want to be case sensitive, so do not include an "i" flag.


Hint
For a value to start with "G" (capital G), the regular expression to match is ^G (the caret anchors a match to the beginning).

2.14. Germany, then and now
Just as we saw with Poland, there are laureates who were born somewhere that was in Germany at the time but is now not, and others born somewhere that was not in Germany at the time but now is.

Instructions 1/4
Use a regular expression object to filter for laureates with "Germany" in their "bornCountry" value.

Hint
No special characters are needed for simple substring matches.

Code:
from bson.regex import Regex

# Filter for laureates with "Germany" in their "bornCountry" value
criteria = {"bornCountry": Regex("Germany")}
print(set(db.laureates.distinct("bornCountry", criteria)))


Instructions 2/4
Use a regular expression object to filter for laureates with a "bornCountry" value starting with "Germany".

Hint
Use a caret "^" to anchor a substring match to the beginning.

Code:
from bson.regex import Regex

# Filter for laureates with a "bornCountry" value starting with "Germany"
criteria = {"bornCountry": Regex("^Germany")}
print(set(db.laureates.distinct("bornCountry", criteria)))


Instructions 3/4
Use a regular expression object to filter for laureates born in what was at the time Germany but is now another country.

Hint
Remember to escape the open paren with a backslash -- "(" -- to match an open paren literally.

Code:
from bson.regex import Regex

# Fill in a string value to be sandwiched between the strings "^Germany " and "now"
criteria = {"bornCountry": Regex("^Germany " + "\(" + "now")}
print(set(db.laureates.distinct("bornCountry", criteria)))


Instructions 4/4
Use a regular expression object to filter for laureates born in what is now Germany but at the time was another country.

Hint
Remember to escape the close paren with a backslash -- ")" -- to match a close paren literally.

Code:
from bson.regex import Regex

# Fill in a string value to be sandwiched between the strings "now" and "$"
criteria = {"bornCountry": Regex("now" + " Germany\)" + "$")}
print(set(db.laureates.distinct("bornCountry", criteria)))

Wunderbar! There are twelve distinct values that represent countries that were or became part of Germany. Also, some laureates were born in parts of modern-day Poland, France, and Russia that were at the time part of Germany. Finally, it's true – the home of Oktoberfest, Bavaria, was really its own country at one time!


2.15. The prized transistor
Three people shared a Nobel prize "for their researches on semiconductors and their discovery of the transistor effect". We can filter on "transistor" as a substring of a laureate's "prizes.motivation" field value to find these laureates.

Instructions
Save a filter criteria that finds laureates with prizes.motivation values containing "transistor" as a substring. The substring can appear anywhere within the value, so no anchoring characters are needed.
Save to first and last the field names corresponding to a laureate's first name and last name (i.e. "surname") so that we can print out the names of these laureates.

Hint
Use dot notation to access a laureate's prize motivations as prizes.motivation. Also, you don't need any anchors to search for substrings, so you can pass "transistor" directly to the Regex constructor.
Remember that you can use db.laureates.find_one() to inspect a sample laureate document. First name is stored as "firstname".

Code:
from bson.regex import Regex

# Save a filter for laureates with prize motivation values containing "transistor" as a substring
criteria = {"prizes.motivation": Regex("transistor")}

# Save the field names corresponding to a laureate's first name and last name
first, last = "firstname", "surname"
print([(laureate[first], laureate[last]) for laureate in db.laureates.find(criteria)])




