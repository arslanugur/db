# 1. Working with Dates and Times
# 1.1 Building dates
# 1.2 Break out a date into year, month, and day
SQL Server has a number of functions dedicated to working with date types. 
We will first analyze three functions which return integers representing the year, month, and day of month, respectively.
These functions can allow us to group dates together, letting us calculate running totals by year or month-over-month comparisons of expenditures. 
We could also analyze sales by calendar day of the month to determine if there is a strong monthly cycle.

Instructions: Use the YEAR(), MONTH(), and DAY() functions to determine the year, month, and day for the current date and time.

DECLARE    
  @SomeTime DATETIME2(7) = SYSUTCDATETIME();
-- Retrieve the year, month, and day
SELECT    
  YEAR(@SomeTime) AS TheYear,    
  MONTH(@SomeTime) AS TheMonth,    
  DAY(@SomeTime) AS TheDay;
  
# 1.3 Break a date and time into component parts
Although YEAR(), MONTH(), and DAY() are helpful functions and are easy to remember, we often want to break out dates into different component parts such as the day of week, week of year, and second after the minute. This is where functions like DATEPART() and DATENAME() come into play.

Here we will use the night the Berlin Wall fell, November 9th, 1989.

Instruction 1: Using the DATEPART() function, fill in the appropriate date parts. 
For a list of parts, review https://docs.microsoft.com/en-us/sql/t-sql/functions/datepart-transact-sql

DECLARE    
  @BerlinWallFalls DATETIME2(7) = '1989-11-09 23:49:36.2294852';
-- Fill in each date part
SELECT   
  DATEPART(YEAR, @BerlinWallFalls) AS TheYear,    
  DATEPART(MONTH, @BerlinWallFalls) AS TheMonth,    
  DATEPART(DAY, @BerlinWallFalls) AS TheDay,    
  DATEPART(DY, @BerlinWallFalls) AS TheDayOfYear,    
-- Day of week is WEEKDAY    
  DATEPART(WEEKDAY, @BerlinWallFalls) AS TheDayOfWeek,   
  DATEPART(WEEK, @BerlinWallFalls) AS TheWeek,    
  DATEPART(SECOND, @BerlinWallFalls) AS TheSecond，
  DATEPART(NANOSECOND, @BerlinWallFalls) AS TheNanosecond;

Instruction 2: Using the DATENAME() function, fill in the appropriate function calls.

DECLARE    
  @BerlinWallFalls DATETIME2(7) = '1989-11-09 23:49:36.2294852';
-- Fill in the function to show the name of each date part
SELECT    
  DATENAME(YEAR, @BerlinWallFalls) AS TheYear,    
  DATENAME(MONTH, @BerlinWallFalls) AS TheMonth,    
  DATENAME(DAY, @BerlinWallFalls) AS TheDay,    
  DATENAME(DAYOFYEAR, @BerlinWallFalls) AS TheDayOfYear,    
-- Day of week is WEEKDAY    
  DATENAME(WEEKDAY, @BerlinWallFalls) AS TheDayOfWeek,     
  DATENAME(WEEK, @BerlinWallFalls) AS TheWeek,    
  DATENAME(SECOND, @BerlinWallFalls) AS TheSecond,      
  DATENAME(NANOSECOND, @BerlinWallFalls) AS TheNanosecond;
  
Instruction 3: How many DATENAME() results differ from their DATEPART() counterparts? ■ Two

The only two date parts which differ are MONTH and WEEKDAY, which return locale-sensitive string results for DATENAME() and numeric values for DATEPART().

# 1.4 Date math and leap years
Some of you may have experience using R and here we note that leap year date math can be tricky with R and the lubridate package. lubridate has two types of functions: duration and period.
lubridate::ymd(20120229) - lubridate::dyears(4) --> 2008-03-01, which is wrong.
lubridate::ymd(20120229) - lubridate::dyears(1) --> 2011-03-01, which is correct.
lubridate::ymd(20120229) - lubridate::years(4) --> 2008-02-29, which is correct.
lubridate::ymd(20120229) - lubridate::years(1) --> NA, which is unexpected behavior.

We can use the DATEADD() and DATEDIFF() functions to see how SQL Server deals with leap years to see if it has any of the same eccentricities.

Instruction 1
Fill in the date parts and intervals needed to determine how SQL Server works on February 29th of a leap year.
2012 was a leap year. The leap year before it was 4 years earlier, and the leap year after it was 4 years later.

DECLARE    
  @LeapDay DATETIME2(7) = '2012-02-29 18:00:00';
-- Fill in the date parts and intervals as needed
SELECT    
  DATEADD(DAY, -1, @LeapDay) AS PriorDay,    
  DATEADD(DAY, 1, @LeapDay) AS NextDay,    
-- For leap years, we need to move 4 years, not just 1       
  DATEADD(YEAR, -4, @LeapDay) AS PriorLeapYear,    
  DATEADD(YEAR, 4, @LeapDay) AS NextLeapYear,    
  DATEADD(YEAR, -1, @LeapDay) AS PriorYear;

Instruction 2: Fill in the date parts and intervals needed to determine how SQL Server works on days next to a leap year.

DECLARE    
  @PostLeapDay DATETIME2(7) = '2012-03-01 18:00:00';
-- Fill in the date parts and intervals as needed
SELECT    
  DATEADD(DAY, -1, @PostLeapDay) AS PriorDay,    
  DATEADD(DAY, 1, @PostLeapDay) AS NextDay,    
  DATEADD(YEAR, -4, @PostLeapDay) AS PriorLeapYear,      
  DATEADD(YEAR, 4, @PostLeapDay) AS NextLeapYear,    
  DATEADD(YEAR, -1, @PostLeapDay) AS PriorYear,    
  -- Move 4 years forward and one day back    
  DATEADD(DAY, -1, DATEADD(YEAR, 4, @PostLeapDay)) AS NextLeapDay,      
  DATEADD(DAY, -2, @PostLeapDay) AS TwoDaysAgo;

Instruction 3: Taking TwoDaysAgo from the prior step, use the DATEDIFF() function to test how it handles leap years.

DECLARE    
  @PostLeapDay DATETIME2(7) = '2012-03-01 18:00:00',   
  @TwoDaysAgo DATETIME2(7);
SELECT    
  @TwoDaysAgo = DATEADD(DAY, -2, @PostLeapDay);

SELECT   
  @TwoDaysAgo AS TwoDaysAgo,    
  @PostLeapDay AS SomeTime, 
-- Fill in the appropriate function and date types     
  DATEDIFF(DAY, @TwoDaysAgo, @PostLeapDay) AS DaysDifference,      
  DATEDIFF(HOUR, @TwoDaysAgo, @PostLeapDay) AS HoursDifference,     
  DATEDIFF(MINUTE, @TwoDaysAgo, @PostLeapDay) AS MinutesDifference;
  
# 1.5 Rounding dates
SQL Server does not have an intuitive way to round down to the month, hour, or minute. 
You can, however, combine the DATEADD() and DATEDIFF() functions to perform this rounding.

To round the date 1914-08-16 down to the year, we would call DATEADD(YEAR, DATEDIFF(YEAR, 0, '1914-08-16'), 0).
To round that date down to the month, we would call DATEADD(MONTH, DATEDIFF(MONTH, 0, '1914-08-16'), 0).
This works for several other date parts as well.

Instruction: Use DATEADD() and DATEDIFF() in conjunction with date parts to round down our time to the day, hour, and minute.

DECLARE    
  @SomeTime DATETIME2(7) = '2018-06-14 16:29:36.2248991';
-- Fill in the appropriate functions and date parts
SELECT    
  DATEADD(DAY, DATEDIFF(DAY, 0, @SomeTime), 0) AS RoundedToDay,     
  DATEADD(HOUR, DATEDIFF(HOUR, 0, @SomeTime), 0) AS RoundedToHour,    
  DATEADD(MINUTE, DATEDIFF(MINUTE, 0, @SomeTime), 0) AS RoundedToMinute;

# 1.6 Formatting dates for reporting
# 1.7 Formatting dates with CAST() and CONVERT()
We can use the CAST() function to translate data between various data types, including between date/time types and string types. 
The CONVERT() function takes three parameters: a data type, an input value, and an optional format code.

In this exercise, we will see how we can use the CAST() and CONVERT() functions 
to translate dates to strings for formatting by looking at the (late) night the Chicago Cubs won the World Series in the US in 2016. 
In the process, we will see one difference between the DATETIME and the DATETIME2 data types for CAST() and the added flexibility of CONVERT().

Instruction 1
Fill in the appropriate function, CAST(), for each example.
Using the aliases as a guide, fill in the appropriate variable for each example.
DECLARE    
  @CubsWinWorldSeries DATETIME2(3) = '2016-11-03 00:30:29.245',     
  @OlderDateType DATETIME = '2016-11-03 00:30:29.245';

SELECT    
-- Fill in the missing function calls    
  CAST(@CubsWinWorldSeries AS DATE) AS CubsWinDateForm,      
  CAST(@CubsWinWorldSeries AS NVARCHAR(30)) AS CubsWinStringForm,     
  CAST(@OlderDateType AS DATE) AS OlderDateForm,    
  CAST(@OlderDateType AS NVARCHAR(30)) AS OlderStringForm;

Instruction 2
For the inner function, turn the date the Cubs won the World Series into a DATE data type using the CAST() function.
For the outer function, reshape this date as an NVARCHAR(30) using the CAST() function.

DECLARE    
  @CubsWinWorldSeries DATETIME2(3) = '2016-11-03 00:30:29.245';
SELECT    
  CAST(CAST(@CubsWinWorldSeries AS DATE) AS NVARCHAR(30)) AS DateStringForm;


Instruction 3
Use the CONVERT() function to translate the date the Cubs won the world series into the DATE and NVARCHAR(30) data types.
The functional form for CONVERT() is CONVERT(DataType, SomeValue).
DECLARE    
  @CubsWinWorldSeries DATETIME2(3) = '2016-11-03 00:30:29.245';
  
SELECT    
  CONVERT(DATE, @CubsWinWorldSeries) AS CubsWinDateForm,      
  CONVERT(NVARCHAR(30), @CubsWinWorldSeries) AS CubsWinStringForm;

Instruction 4
Fill in the correct function call for conversion.
The UK date formats are 3 and 103, representing two-digit year (dmy) and four-digit year (dmyyyy), respectively.
The corresponding US date formats are 1 and 101.
DECLARE    
  @CubsWinWorldSeries DATETIME2(3) = '2016-11-03 00:30:29.245';
  
SELECT    
  CONVERT(NVARCHAR(30), @CubsWinWorldSeries, 0) AS DefaultForm,    
  CONVERT(NVARCHAR(30), @CubsWinWorldSeries, 3) AS UK_dmy,    
  CONVERT(NVARCHAR(30), @CubsWinWorldSeries, 1) AS US_mdy,    
  CONVERT(NVARCHAR(30), @CubsWinWorldSeries, 103) AS UK_dmyyyy,    
  CONVERT(NVARCHAR(30), @CubsWinWorldSeries, 101) AS US_mdyyyy;
  
  
# 1.8 Formatting date with FORMAT()
# 1.9 Working with calendar tables
# 1.10 The benefits of calendar tables
# 1.11 Try out a calendar table
# 1.12 Joining to a calendar table



# 2. Converting to Dates and Times
# 2.1 Building dates from parts
# 2.2 Build dates from parts
# 2.3 Build dates and times from parts
# 2.4 Build dates and times with offsets from parts
# 2.5 Translating date strings
# 2.6 Cast string to dates
# 2.7 Convert strings to dates
# 2.8 Parse string to dates
# 2.9 Working with offsets
# 2.10 Changing a date's offset
# 2.11 Using the time zone DMV to look up times
# 2.12 Converting to a date offset
# 2.13 Handling invalid dates
# 2.14 Try out type-safe date functions
# 2.15 Convert imported data to dates with time zone
# 2.16 Test type-safe conversion function performance

# 3. Aggregating Time Series Data
# 3.1 Basic aggregate functions
# 3.2 Summarise data over a time frame
# 3.3 Calculating distinct counts
# 3.4 Calculating filtered aggregates
# 3.5 Statistical aggregate functions
# 3.6 Working with statistical aggregate functions
# 3.7 Calculating median in SQL Server
# 3.8 Downsampling and upsampling data
# 3.9 Downsample to a daily grain
# 3.10 Downsample to a weekly grain
# 3.11 Downsample using a calendar table
# 3.12 Grouping by ROLLUP, CUBE, and GROUPING SETS
# 3.13 Generate a summary with ROLLUP
# 3.14 View all aggregations with CUBE
# 3.15 Generate custom groupings with GROUPING SETS
# 3.16 Combine multiple aggregations in one query


# 4. Answering Time Series Questions with Window Functions
# 4.1 Using aggregation functions over windows
# 4.2 Contrasting ROW_NUMBER(), RANK(), and DENSE_RANK()
# 4.3 Aggregate window functions
# 4.4 Calculating running totals and moving averages
# 4.5 Running totals with SUM()
# 4.6 Investigating window frames
# 4.7 Calculating moving averages
# 4.8 Working with LAG() and LEAD()
# 4.9 Seeing prior and future periods
# 4.10 Seeing the prior three periods
# 4.11 Calculating days elapsed between incidents
# 4.12 Finding maximum levels of overlap
# 4.13 Analyse client data for potential fraud
# 4.14 Build a stream of events
# 4.15 Complete the fraud analysis
# 4.16 Wrapping up
