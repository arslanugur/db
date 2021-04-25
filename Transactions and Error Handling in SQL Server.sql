1. Starting with error handling
</> The TRY…CATCH syntax
</> Nesting TRY…CATCH constructs
</> Anatomy review
</> Correcting compilation errors
</> Error function syntax
</> Using error functions
</> Using error functions in a nested TRY…CATCH
2. Raising, throwing and customizing your errors
</> RAISERROR syntax
</> CATCHING the RAISERROR
</> THROW with or without parameters
</> THROW without parameters
</> Executing a stored procedure that throws an error
</> THROW with parameters
</> Ways of customizing error messages
</> Concatenating the message
</> FORMATMESSAGE with message string
</> FORMATMESSAGE with message number
3. Transactions in SQL Server
</> Transaction statements
</> Correcting a transaction
</> Rolling back a transaction if there is an error
</> Choosing when to commit or rollback a transaction
</> Modifiers of the @@TRANCOUNT value
</> Checking @@TRANCOUNT in a TRY…CATCH construct
</> Using savepoints
</> XACT_ABORT behavior
</> XACT_ABORT and THROW
</> Doomed transactions
4. Controlling the concurrency: Transaction isolation levels
</> Concurrency phenomena
</> Using the READ UNCOMMITTED isolation level
</> Choosing the correct isolation level
</> Prevent dirty reads
</> Preventing non-repeatable reads
</> Prevent phantom reads in a table
</> Prevent phantom reads just in some rows
</> Setting READ COMMITTED SNAPSHOT to ON
</> Comparing WITH (NOLOCK) & READ UNCOMMITTED
</> Avoid being blocked


1. Starting with error handling
</> The TRY…CATCH syntax

BEGIN TRY
    INSERT INTO products (product_name, stock, price)
        VALUES ('Trek Powerfly 5 - 2018', 10, 3499.99);
    SELECT 'Product inserted correctly!';

    BEGIN CATCH
        SELECT 'An error occurred! You are in the CATCH block';   
    END CATCH
END TRY


Which of the following is true about the syntax?
--->This script isn’t correct because the CATCH block must start after the end of the TRY block


</> Your first error-handling script
Surround the constraint with a TRY block.
Add the constraint to the products table.
Surround the error message with a CATCH block.

BEGIN TRY
	ALTER TABLE products
		ADD CONSTRAINT CHK_Stock CHECK (stock >= 0);
END TRY
BEGIN CATCH
	SELECT 'An error occurred!';
END CATCH


</> Nesting TRY…CATCH constructs
Surround the INSERT INTO buyers statement with a TRY block.
Surround the error handling with a CATCH block.
Surround the INSERT INTO errors statement with another TRY block.
Surround the nested error handling with another CATCH block.

BEGIN TRY
	INSERT INTO buyers (first_name, last_name, email, phone)
		VALUES ('Peter', 'Thompson', 'peterthomson@mail.com', '555000100');
END TRY
BEGIN CATCH
	SELECT 'An error occurred inserting the buyer! You are in the first CATCH block';
    BEGIN TRY
    	INSERT INTO errors 
        	VALUES ('Error inserting a buyer');
        SELECT 'Error inserted correctly!';
	END TRY
    BEGIN CATCH
    	SELECT 'An error occurred inserting the error! You are in the nested CATCH block';
    END CATCH 
END CATCH


</> Anatomy review
When you execute the following script:

INSERT INTO products (product_name, stock, price)
    VALUES ('Trek Powerfly 5 - 2018', 10, 3499.99);
    
The console of your SQL Server shows this:
Msg 2627, Level 14, State 1, Line 1
Violation of UNIQUE KEY constraint 'unique_name'. 
Cannot insert duplicate key in object 'dbo.products'. 
The duplicate key value is (Trek Powerfly 5 - 2018).


What are the different parts of the error you get, from left to right?
--->  Error number, severity level, state, line, and message text.


</> Correcting compilation errors
Note: Error messages in DataCamp have different anatomy than in SQL Server, but as they show the error message, you won’t have any problem.
Run the code to verify there are compilation errors.
Correct every compilation error.
Run the code to get the final output: An error occurred inserting the product!

START TRY
	INSERT INTO products (product_name, stock, price)
		VALUES ('Sun Bicycles ElectroLite - 2017', 10, 1559.99);
FINISH TRY
START CACH
	SELECT 'An error occurred inserting the product!';
    START TRY
    	INSERT INTO errors
        	VALUES ('Error inserting a product');
    FINISH TRY    
    BEGIN CACH
    	SELECT 'An error occurred inserting the error!';
    FINISH CACH    
FINISH CACH

('42000', "[42000] [Microsoft][ODBC Driver 17 for SQL Server][SQL Server]Incorrect syntax near 'FINISH'. (102) (SQLExecDirectW)")



BEGIN TRY
	INSERT INTO products (product_name, stock, price)
		VALUES ('Sun Bicycles ElectroLite - 2017', 10, 1559.99);
END TRY
BEGIN CATCH
	SELECT 'An error occurred inserting the product!';
    BEGIN TRY
    	INSERT INTO errors
        	VALUES ('Error inserting a product');
    END TRY    
    BEGIN CATCH
    	SELECT 'An error occurred inserting the error!';
    END CATCH    
END CATCH

An error occurred inserting the product!


</> Error function syntax
Which of the following is true about the functions ERROR_NUMBER(), ERROR_SEVERITY(), ERROR_STATE(), ERROR_PROCEDURE(), ERROR_LINE(), and ERROR_MESSAGE()?
---> These functions must be placed within the CATCH block. If an error occurs within the TRY block, they return information about the error.


</> Using error functions
Surround the operation with a TRY block.
Surround the functions with a CATCH block.
Select the error information.
BEGIN TRY  	
	SELECT 'Total: ' + SUM(price * quantity) AS total
	FROM orders  
END TRY
BEGIN CATCH  
	SELECT  ERROR_NUMBER() AS number,  
        	ERROR_SEVERITY() AS severity_level,  
        	ERROR_STATE() AS state,
        	ERROR_LINE() AS line,  
        	ERROR_MESSAGE() AS message; 	
END CATCH 

number	severity_level	state	line	message
8114	16				5		3		Error converting data type varchar to numeric.


</> Using error functions in a nested TRY…CATCH
Surround the error handling with a CATCH block.
Insert ‘Error inserting a product’ in the errors table and surround this insertion with another TRY block.
Surround the nested error handling with another CATCH block.
Select the error line and the error message in the inner CATCH block.

BEGIN TRY
    INSERT INTO products (product_name, stock, price) 
    VALUES	('Trek Powerfly 5 - 2018', 2, 3499.99),   		
    		('New Power K- 2018', 3, 1999.99)		
END TRY
BEGIN CATCH
	SELECT 'An error occurred inserting the product!';
    BEGIN TRY
    	INSERT INTO errors 
        	VALUES ('Error inserting a product');
    END TRY    
    BEGIN CATCH
    	SELECT 
        	ERROR_LINE() AS line,	   
			ERROR_MESSAGE() AS message; 
    END CATCH    
END CATCH

An error occurred inserting the product!


2. Raising, throwing and customizing your errors
</> RAISERROR syntax
Given this RAISERROR statement?
RAISERROR(‘You cannot apply a 50%% discount on %s number %d’, 6, 1, ‘product’, 5);
---> “You cannot apply a 50% discount on product number 5”


</> CATCHING the RAISERROR
Set @product_id to 5.
Use the RAISERROR statement with a severity of 11, a state of 1 and the given @product_id.

DECLARE @product_id INT = 5;

IF NOT EXISTS (SELECT * FROM products WHERE product_id = @product_id)
	RAISERROR('No product with id %d.', 11, 1, @product_id);
ELSE 
	SELECT * FROM products WHERE product_id = @product_id;

product_id	product_name			stock	price
5			Trek CrossRip+ - 2018	12		4499.99


Catch the error generated by the RAISERROR statement you coded.
Select the error message using the appropriate function.

BEGIN TRY
    DECLARE @product_id INT = 5;
    IF NOT EXISTS (SELECT * FROM products WHERE product_id = @product_id)
        RAISERROR('No product with id %d.', 11, 1, @product_id);
    ELSE 
        SELECT * FROM products WHERE product_id = @product_id;
END TRY
BEGIN CATCH
	SELECT ERROR_MESSAGE();
END CATCH  

product_id	product_name			stock	price
5			Trek CrossRip+ - 2018	12		4499.99


</> THROW with or without parameters
Which of the following is true about the THROW statement?
---> The THROW statement without parameters should be placed within a CATCH

</> THROW without parameters
Surround the error handling with a CATCH block.
Insert the error in the errors table.
End the insert statement with a semicolon.
Re-throw the original error.

CREATE PROCEDURE insert_product
  @product_name VARCHAR(50),
  @stock INT,
  @price DECIMAL

AS

BEGIN TRY
	INSERT INTO products (product_name, stock, price)
		VALUES (@product_name, @stock, @price);
END TRY
BEGIN CATCH
    INSERT INTO errors VALUES ('Error inserting a product');
	THROW; 
END CATCH



