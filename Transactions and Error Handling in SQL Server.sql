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
DECLARE @product_name AS NVARCHAR(50) = 'Trek CrossRip+ - 2018';
-- Set the number of sold bikes
DECLARE @sold_bikes AS INT = 10;
DECLARE @current_stock INT;

SELECT @current_stock = stock FROM products WHERE product_name = @product_name;

DECLARE @my_message NVARCHAR(500) =
	-- Customize the error message
	FORMATMESSAGE('There are not enough %s bikes. You have %d in stock.', @product_name, @current_stock);

IF (@current_stock - @sold_bikes < 0)
	-- Throw the error
	THROW 50000, @my_message, 1;
	
</> FORMATMESSAGE with message number
-- Pass the variables to the stored procedure 
EXEC sp_addmessage @msgnum = 50002, @severity = 16, @msgtext = 'There are not enough %s bikes. You only have %d in stock.', @lang = N'us_english';

EXEC sp_addmessage @msgnum = 50002, @severity = 16, @msgtext = 'There are not enough %s bikes. You only have %d in stock.', @lang = N'us_english';

DECLARE @product_name AS NVARCHAR(50) = 'Trek CrossRip+ - 2018';
DECLARE @sold_bikes AS INT = 10;
DECLARE @current_stock INT;

SELECT @current_stock = stock FROM products WHERE product_name = @product_name;

DECLARE @my_message NVARCHAR(500) =
	-- Prepare the error message
	FORMATMESSAGE(50002, @product_name, @current_stock);

IF (@current_stock - @sold_bikes < 0)
	-- Throw the error
	THROW 50000, @my_message, 1;
	
	
3. Transactions in SQL Server
</> Transaction statements
</> Correcting a transaction
BEGIN TRY  
	BEGIN TRAN; 
		UPDATE accounts SET current_balance = current_balance - 100 WHERE account_id = 1;
		INSERT INTO transactions VALUES (1, -100, GETDATE());
        
		UPDATE accounts SET current_balance = current_balance + 100 WHERE account_id = 5;
		INSERT INTO transactions VALUES (5, 100, GETDATE());
	COMMIT TRAN;     
END TRY
BEGIN CATCH  
	ROLLBACK TRAN;
END CATCH

</> Rolling back a transaction if there is an error
BEGIN TRY  
	BEGIN TRAN;
		UPDATE accounts SET current_balance = current_balance - 100 WHERE account_id = 1;
		INSERT INTO transactions VALUES (1, -100, GETDATE());
        
		UPDATE accounts SET current_balance = current_balance + 100 WHERE account_id = 5;
		INSERT INTO transactions VALUES (5, 100, GETDATE());
	COMMIT TRAN;
END TRY
BEGIN CATCH  
	ROLLBACK TRAN;
END CATCH

</> Choosing when to commit or rollback a transaction
BEGIN TRAN; 
	UPDATE accounts set current_balance = current_balance + 100
		WHERE current_balance < 5000;
	IF @@ROWCOUNT > 200 
		BEGIN 
			ROLLBACK TRAN; 
			SELECT 'More accounts than expected. Rolling back'; 
		END
	ELSE
		BEGIN 
			COMMIT TRAN; 
			SELECT 'Updates commited'; 
		END
		
</> Modifiers of the @@TRANCOUNT value
</> Checking @@TRANCOUNT in a TRY…CATCH construct
BEGIN TRY
	BEGIN TRAN;
		UPDATE accounts SET current_balance = current_balance + 200
			WHERE account_id = 10;
		IF @@TRANCOUNT > 0     
			COMMIT TRAN;
     
	SELECT * FROM accounts
    	WHERE account_id = 10;      
END TRY
BEGIN CATCH  
    SELECT 'Rolling back the transaction'; 
    IF @@TRANCOUNT > 0   	
        ROLLBACK TRAN;
END CATCH

</> Using savepoints
BEGIN TRAN;
	-- Mark savepoint1
	SAVE TRAN savepoint1;
	INSERT INTO customers VALUES ('Mark', 'Davis', 'markdavis@mail.com', '555909090');

	-- Mark savepoint2
    SAVE TRAN savepoint2;
	INSERT INTO customers VALUES ('Zack', 'Roberts', 'zackroberts@mail.com', '555919191');

	-- Rollback savepoint2
	ROLLBACK TRAN savepoint2;
    -- Rollback savepoint1
	ROLLBACK TRAN savepoint1;

	-- Mark savepoint3
	SAVE TRAN savepoint3;
	INSERT INTO customers VALUES ('Jeremy', 'Johnsson', 'jeremyjohnsson@mail.com', '555929292');
-- Commit the transaction
COMMIT TRAN;


</> XACT_ABORT behavior
</> XACT_ABORT and THROW
-- Use the appropriate setting
SET XACT_ABORT ON;
-- Begin the transaction
BEGIN TRAN; 
	UPDATE accounts set current_balance = current_balance - current_balance * 0.01 / 100
		WHERE current_balance > 5000000;
	IF @@ROWCOUNT <= 10	
    	-- Throw the error
		THROW 55000, 'Not enough wealthy customers!', 1;
	ELSE		
    	-- Commit the transaction
		COMMIT TRAN; 
		
</> Doomed transactions
SET XACT_ABORT ON;
BEGIN TRY
	BEGIN TRAN;
		INSERT INTO customers VALUES ('Mark', 'Davis', 'markdavis@mail.com', '555909090');
		INSERT INTO customers VALUES ('Dylan', 'Smith', 'dylansmith@mail.com', '555888999');
	COMMIT TRAN;
END TRY
BEGIN CATCH
	IF XACT_STATE() <> 0
		ROLLBACK TRAN;
    SELECT ERROR_MESSAGE() AS Error_message;
END CATCH


4. Controlling the concurrency: Transaction isolation levels
</> Concurrency phenomena
</> Using the READ UNCOMMITTED isolation level
-- Set the appropriate isolation level
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
-- Select first_name, last_name, email and phone
	SELECT
    	first_name, 
        last_name, 
        email,
        phone
    FROM customers;
    
</> Choosing the correct isolation level
</> Prevent dirty reads
-- Set the appropriate isolation level
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
-- Count the accounts
SELECT COUNT(*) AS number_of_accounts
FROM accounts
WHERE current_balance >= 50000;

</> Preventing non-repeatable reads
-- Set the appropriate isolation level
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

-- Begin a transaction
BEGIN TRAN;

SELECT * FROM customers;

-- some mathematical operations, don't care about them...

SELECT * FROM customers;

-- Commit the transaction
COMMIT TRAN;

</> Prevent phantom reads in a table
-- Set the appropriate isolation level
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

-- Begin a transaction
BEGIN TRAN;

SELECT * FROM customers;

-- After some mathematical operations, we selected information from the customers table.
SELECT * FROM customers;

-- Commit the transaction
COMMIT TRAN;

</> Prevent phantom reads just in some rows
-- Set the appropriate isolation level
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

-- Begin a transaction
BEGIN TRAN

-- Select customer_id between 1 and 10
SELECT * 
FROM customers
WHERE customer_id BETWEEN 1 AND 10;

-- After completing some mathematical operation, select customer_id between 1 and 10
SELECT * 
FROM customers
WHERE customer_id BETWEEN 1 AND 10;

-- Commit the transaction
COMMIT TRAN


</> Setting READ COMMITTED SNAPSHOT to ON
</> Comparing WITH (NOLOCK) & READ UNCOMMITTED
</> Avoid being blocked
SELECT *
	FROM transactions WITH (NOLOCK)
WHERE account_id = 1

-------------------------------------------------------------------------------

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



