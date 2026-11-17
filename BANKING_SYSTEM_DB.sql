-- Section A: Database and Table Creation
-- 7.	Create a database named BANKING_SYSTEMDB.

CREATE DATABASE BANKING_SYSTEMDB;
USE BANKING_SYSTEMDB;

SHOW DATABASES;

-- 9.	Create the CUSTOMERS table with CUSTOMERID, FIRSTNAME, LASTNAME, EMAIL and PHONE. Select suitable data types for every column.
-- 10.	Modify the CUSTOMERS table by adding ACCOUNTCREATIONDATE as a date column.

CREATE TABLE CUSTOMERS(
	CUSTOMER_ID VARCHAR(255),
    FIRST_NAME VARCHAR(250),
    LAST_NAME VARCHAR(255),
    EMAIL VARCHAR(250),
    PHONE VARCHAR(10),
    ACCOUNT_CREATION_DATE DATE);
SELECT * FROM CUSTOMERS;
-- 11.	Create the ACCOUNTS table with ACCOUNTID, CUSTOMERID, ACCOUNTTYPE, BALANCE, ACCOUNTSTATUS and OPENINGDATE using suitable data types.
 CREATE TABLE ACCOUNTS (
    ACCOUNT_ID INT PRIMARY KEY AUTO_INCREMENT,
    CUSTOMER_ID INT ,
    ACCOUNT_TYPE VARCHAR(150) ,
    BALANCE DECIMAL(15, 2) DEFAULT 0.00,
    ACCOUNT_STATUS VARCHAR(200) DEFAULT 'Active',
    OPENING_DATE DATE );
SELECT * FROM ACCOUNTS;

-- 12.	Create the TRANSACTIONS table with TRANSACTIONID, ACCOUNTID, TRANSACTIONTYPE, AMOUNT, TRANSACTIONDATE and DESCRIPTION.
CREATE TABLE TRANSACTIONS (
    TRANSACTION_ID INT PRIMARY KEY AUTO_INCREMENT,
    ACCOUNT_ID INT ,
    TRANSACTION_TYPE VARCHAR(59) , 
    AMOUNT DECIMAL(10, 2) ,
    TRANSACTION_DATE DATETIME ,
    DESCRIPTION VARCHAR(255));
    SELECT * FROM TRANSACTIONS;
-- 13.	Create the BRANCHES table with BRANCHID, BRANCHNAME, CITY, STATE and MANAGERNAME.
CREATE TABLE BRANCHES (
    BRANCH_ID INT PRIMARY KEY AUTO_INCREMENT,
    BRANCH_NAME VARCHAR(100) ,
    CITY VARCHAR(50) ,
    STATE VARCHAR(50) ,
    MANAGER_NAME VARCHAR(100));
    
    
-- 14.	Create the ACCOUNTBRANCHES table with ACCOUNTID and BRANCHID. Define appropriate primary-key/foreign-key constraints based on the banking design.
CREATE TABLE ACCOUNT_BRANCHES (
    ACCOUNT_ID INT NOT NULL,
    BRANCH_ID INT NOT NULL,
    PRIMARY KEY (ACCOUNT_ID, BRANCH_ID),
    FOREIGN KEY (ACCOUNT_ID) REFERENCES ACCOUNTS(ACCOUNT_ID),
    FOREIGN KEY (BRANCH_ID) REFERENCES BRANCHES(BRANCH_ID));

-- Section B: Data Insertion and Data Modification
-- 15.	Insert at least 10 customer records into CUSTOMERS.
INSERT INTO CUSTOMERS (CUSTOMER_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE, ACCOUNT_CREATION_DATE) VALUES
(1, 'Janhavi', 'Thakur', 'janhavi@email.com', '9820111101', '2025-01-10'),
(2, 'Neha', 'Sardar', 'neha@email.com', '9820111102', '2025-02-15'),
(3, 'Murti', 'Sawant', 'murti@email.com', '9820111103', '2025-03-20'),
(4, 'Harsh', 'Patil', 'harsh@email.com', '9820111104', '2025-04-05'),
(5, 'Vikram', 'Joshi', 'vikram@email.com', '9820111105', '2025-05-12'),
(6, 'Ananya', 'Nair', 'ananya@email.com', '9820111106', '2025-06-18'),
(7, 'Siddharth', 'Rao', 'siddharth@email.com', '9820111107', '2025-07-22'),
(8, 'Meera', 'Iyer', 'meera@email.com', '9820111108', '2025-08-30'),
(9, 'Karan', 'Malhotra', 'karan@email.com', '9820111109', '2025-09-14'),
(10, 'Neha', 'Verma', 'neha@email.com', '9820111110', '2025-10-01');

-- 16.	Insert at least 10 account records into ACCOUNTS using customer IDs that exist in CUSTOMERS.
INSERT INTO ACCOUNTS (ACCOUNT_ID, CUSTOMER_ID, ACCOUNT_TYPE, BALANCE, ACCOUNT_STATUS, OPENING_DATE) VALUES
(101, 1, 'Savings', 25000.00, 'Active', '2025-01-10'),
(102, 1, 'Current', 85000.00, 'Active', '2025-03-15'),
(103, 2, 'Savings', 42000.50, 'Active', '2025-02-15'),
(104, 3, 'Savings', 15000.00, 'Inactive', '2025-03-20'),
(105, 4, 'Current', 120000.00, 'Active', '2025-04-05'),
(106, 5, 'Savings', 31500.75, 'Active', '2025-05-12'),
(107, 6, 'Savings', 9800.00, 'Active', '2025-06-18'),
(108, 7, 'Current', 64000.00, 'Closed', '2025-07-22'),
(109, 8, 'Savings', 53200.00, 'Active', '2025-08-30'),
(110, 9, 'Savings', 19400.00, 'Active', '2025-09-14'),
(111, 10, 'Current', 77500.00, 'Active', '2025-10-01');

-- 17.	Insert at least 20 transaction records into TRANSACTIONS containing both deposits and withdrawals.
INSERT INTO TRANSACTIONS (TRANSACTION_ID, ACCOUNT_ID, TRANSACTION_TYPE, AMOUNT, TRANSACTION_DATE, DESCRIPTION ) VALUES
(1001, 101, 'Deposit', 10000.00, '2025-09-01 09:30:00', 'Initial Deposit'),
(1002, 101, 'Withdrawal', 2000.00, '2025-09-05 14:15:00', 'ATM Cash Withdrawal'),
(1003, 102, 'Deposit', 50000.00, '2025-09-07 11:00:00', 'Client Invoice Payment'),
(1004, 102, 'Withdrawal', 12000.00, '2025-09-10 16:45:00', 'Office Rent Transfer'),
(1005, 103, 'Deposit', 15000.00, '2025-09-12 10:20:00', 'Monthly Salary Credit'),
(1006, 103, 'Withdrawal', 3500.00, '2025-09-15 18:10:00', 'Online Shopping'),
(1007, 104, 'Deposit', 5000.00, '2025-09-18 12:00:00', 'Cash Deposit'),
(1008, 104, 'Withdrawal', 1000.00, '2025-09-20 13:30:00', 'ATM Withdrawal'),
(1009, 105, 'Deposit', 75000.00, '2025-09-22 15:00:00', 'Business Revenue'),
(1010, 105, 'Withdrawal', 25000.00, '2025-09-25 17:20:00', 'Vendor Settlement'),
(1011, 106, 'Deposit', 8000.00, '2025-10-01 09:00:00', 'NEFT Credit'),
(1012, 106, 'Withdrawal', 1500.00, '2025-10-03 11:40:00', 'Utility Bill Payment'),
(1013, 107, 'Deposit', 4500.00, '2025-10-05 14:50:00', 'UPI Deposit'),
(1014, 107, 'Withdrawal', 1200.00, '2025-10-08 19:15:00', 'Grocery POS'),
(1015, 108, 'Deposit', 30000.00, '2025-10-10 10:10:00', 'Cheque Deposit'),
(1016, 108, 'Withdrawal', 30000.00, '2025-10-12 16:00:00', 'Account Closure Withdrawal'),
(1017, 109, 'Deposit', 22000.00, '2025-10-15 08:45:00', 'Salary Credit'),
(1018, 109, 'Withdrawal', 4000.00, '2025-10-18 20:30:00', 'ATM Withdrawal'),
(1019, 110, 'Deposit', 6500.00, '2025-10-20 13:15:00', 'Cash Deposit'),
(1020, 111, 'Withdrawal', 9500.00, '2025-10-25 15:40:00', 'Supplier Payment');

SELECT * FROM ACCOUNT_BRANCHES;
-- 18.	Insert at least 5 branch records into BRANCHES.
INSERT INTO BRANCHES (BRANCH_ID, BRANCH_NAME, CITY, STATE, MANAGER_NAME) VALUES
(10, 'Thane West Main', 'Thane', 'Maharashtra', 'Rajesh Kulkarni'),
(20, 'Andheri East Hub', 'Mumbai', 'Maharashtra', 'Sunita Deshpande'),
(30, 'Vashi Sector 17', 'Navi Mumbai', 'Maharashtra', 'Amitabh Joshi'),
(40, 'Kothrud Central', 'Pune', 'Maharashtra', 'Kavita Gokhale'),
(50, 'Alkapuri Branch', 'Vadodara', 'Gujarat', 'Manish Shah');

-- 19.	Insert appropriate account-to-branch records into ACCOUNTBRANCHES.
INSERT INTO ACCOUNT_BRANCHES (ACCOUNT_ID, BRANCH_ID) VALUES
(101, 10),
(102, 10),
(103, 20),
(104, 20),
(105, 30),
(106, 30),
(107, 40),
(108, 40),
(109, 50),
(110, 50),
(111, 10);

SET SQL_SAFE_UPDATES = 0;
-- 20.	Update the email address of a customer whose CUSTOMERID is provided by your instructor.
UPDATE CUSTOMERS
SET EMAIL = 'janhavithakur@email.com'
WHERE CUSTOMER_ID = 1;

SELECT * FROM CUSTOMERS
WHERE CUSTOMER_ID = 1;

-- 21.	Update the ACCOUNTSTATUS of one account from its current status to an appropriate new status.
UPDATE ACCOUNTS
SET ACCOUNT_STATUS = 'Active'
WHERE ACCOUNT_ID = 104;

SELECT ACCOUNT_ID, CUSTOMER_ID, ACCOUNT_TYPE, ACCOUNT_STATUS 
FROM ACCOUNTS 
WHERE ACCOUNT_ID = 104;

-- 22.	Increase the balance of all active accounts by 500 as a business adjustment. Verify the records before and after the update.
UPDATE ACCOUNTS
SET BALANCE = BALANCE +500
WHERE ACCOUNT_STATUS = 'Active';

SELECT ACCOUNT_ID, CUSTOMER_ID, ACCOUNT_STATUS, BALANCE AS Balance_After 
FROM ACCOUNTS 
WHERE ACCOUNT_STATUS = 'Active';

-- 23.	Delete a test customer record that you created specifically for deletion practice. Verify the record before deleting it.
-- VERIFY
SELECT * FROM CUSTOMERS 
WHERE CUSTOMER_ID = 10;

-- 2. DELETE THE TEST RECORD
DELETE FROM CUSTOMERS 
WHERE CUSTOMER_ID = 10;

SELECT * FROM CUSTOMERS 
WHERE CUSTOMER_ID = 10;

-- 24.	Create a temporary/test table from an appropriate table structure, add test records, and remove all rows using TRUNCATE. Verify that the table remains available.
-- Create a test table copying the structure of ACCOUNTS
CREATE TABLE TEST_ACCOUNTS LIKE ACCOUNTS;

-- Insert a test record
INSERT INTO TEST_ACCOUNTS (ACCOUNT_ID, CUSTOMER_ID, ACCOUNT_TYPE, BALANCE, ACCOUNT_STATUS, OPENING_DATE) 
VALUES (9999, 1, 'Savings', 500.00, 'Active', '2026-01-01');

-- Remove all rows using TRUNCATE
TRUNCATE TABLE TEST_ACCOUNTS;

-- Verify table remains available and is empty
DESCRIBE TEST_ACCOUNTS;
SELECT * FROM TEST_ACCOUNTS;

-- Section C: Basic Data Retrieval and Filtering

-- 25.	Display all records from CUSTOMERS.
SELECT * FROM CUSTOMERS;

-- 26.	Display only CUSTOMERID, FIRSTNAME, LASTNAME and EMAIL from CUSTOMERS.
SELECT CUSTOMER_ID, FIRST_NAME, LAST_NAME, EMAIL 
FROM CUSTOMERS;

-- 27.	Display customer full-name information using an alias for the relevant output columns.
SELECT CONCAT(FIRST_NAME, ' ' , LAST_NAME) AS FULL_NAME
FROM CUSTOMERS;

-- 28.	Display all unique account types available in ACCOUNTS.
SELECT DISTINCT ACCOUNT_TYPE 
FROM ACCOUNTS;

-- 29.	Display accounts having a balance greater than 50,000.
SELECT * FROM ACCOUNTS 
WHERE BALANCE > 50000;

-- 30.	Display accounts having a balance between 10,000 and 100,000.
SELECT * FROM ACCOUNTS 
WHERE BALANCE BETWEEN 10000 AND 100000;

-- 31.	Display customers whose first name starts with the letter A.
SELECT * FROM CUSTOMERS 
WHERE FIRST_NAME LIKE 'A%';

-- 32.	Display customers whose last name ends with the letter N.
SELECT * FROM CUSTOMERS 
WHERE LAST_NAME LIKE '%n';

-- 33.	Display transactions where TRANSACTIONTYPE is either Deposit or Withdrawal using an appropriate filtering operator.
SELECT * FROM TRANSACTIONS 
WHERE TRANSACTION_TYPE IN ('Deposit', 'Withdrawal');

-- 34.	Display active accounts with a balance greater than 25,000.
SELECT * FROM ACCOUNTS 
WHERE ACCOUNT_STATUS = 'Active' AND BALANCE > 25000;

-- 35.	Display transactions with amounts greater than 10,000 and transaction dates within a specified date range.
SELECT * FROM TRANSACTIONS 
WHERE AMOUNT > 10000 
  AND TRANSACTION_DATE BETWEEN '2026-09-01 00:00:00' AND '2026-10-31 23:59:59';

-- 36.	Display all customers whose phone numbers match a pattern or length requirement appropriate to your dataset.
SELECT * FROM CUSTOMERS 
WHERE LENGTH(PHONE) = 10 AND PHONE LIKE '98%';

-- 37.	Display the top 5 accounts with the highest balances.
SELECT * FROM ACCOUNTS 
ORDER BY BALANCE DESC 
LIMIT 5;

-- 38.	Display the 10 most recent transactions based on TRANSACTIONDATE.
SELECT * FROM TRANSACTIONS 
ORDER BY TRANSACTION_DATE DESC 
LIMIT 10;

-- Section D: SQL Functions and Conditional Analysis

-- 39.	Display each customer's first name in uppercase and last name in lowercase.
SELECT UPPER(FIRST_NAME) AS Upper_First_Name, 
       LOWER(LAST_NAME) AS Lower_Last_Name 
FROM CUSTOMERS;

-- 40.	Display the length of each customer's first name and last name. 
SELECT FIRST_NAME, 
       LENGTH(FIRST_NAME) AS First_Name_Length, 
       LAST_NAME, 
       LENGTH(LAST_NAME) AS Last_Name_Length 
FROM CUSTOMERS;

-- 41.	Create a display column that combines FIRSTNAME and LASTNAME into a customer-name format.
SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS Customer_Name 
FROM CUSTOMERS;

-- 42.	Display transaction descriptions after removing leading or trailing spaces where applicable.
SELECT TRANSACTION_ID, 
       TRIM(DESCRIPTION) AS Clean_Description 
FROM TRANSACTIONS;

-- 43.	Display transaction amounts rounded to the nearest whole number.
SELECT TRANSACTION_ID, AMOUNT,
       ROUND(AMOUNT, 0) AS Rounded_Amount 
FROM TRANSACTIONS;

-- 44.	Display each transaction amount rounded to two decimal places and calculate the absolute value of the amount.
SELECT TRANSACTION_ID, AMOUNT, 
       ROUND(AMOUNT, 2) AS Rounded_Amount, 
       ABS(AMOUNT) AS Absolute_Amount 
FROM TRANSACTIONS;

-- 45.	Display the year, month and day from TRANSACTIONDATE.
SELECT TRANSACTION_ID, 
       TRANSACTION_DATE, 
       YEAR(TRANSACTION_DATE) AS 'YEAR', 
       MONTH(TRANSACTION_DATE) AS 'MONTH', 
       DAY(TRANSACTION_DATE) AS 'DAY' 
FROM TRANSACTIONS;

-- 46.	Display the month name for each transaction date.
SELECT TRANSACTION_ID, 
       TRANSACTION_DATE, 
       MONTHNAME(TRANSACTION_DATE) AS MONTH_NAME 
FROM TRANSACTIONS;

-- 47.	Calculate the number of days between each transaction date and the current date.
SELECT TRANSACTION_ID, 
       TRANSACTION_DATE, 
       DATEDIFF(CURDATE(), TRANSACTION_DATE) AS Days_Beetween 
FROM TRANSACTIONS;

-- 48.	Classify accounts using CASE: balance below 10,000 = Low Balance, 10,000 to 50,000 = Medium Balance, above 50,000 = High Balance.
SELECT ACCOUNT_ID, 
       BALANCE, 
       CASE 
           WHEN BALANCE < 10000 THEN 'Low Balance'
           WHEN BALANCE BETWEEN 10000 AND 50000 THEN 'Medium Balance'
           ELSE 'High Balance'
       END AS Balance_Category 
FROM ACCOUNTS;

-- 49.	Classify transactions using CASE based on amount: below 5,000 = Small, 5,000 to 25,000 = Medium, above 25,000 = Large.
SELECT TRANSACTION_ID, 
       AMOUNT, 
       CASE 
           WHEN AMOUNT < 5000 THEN 'Small'
           WHEN AMOUNT BETWEEN 5000 AND 25000 THEN 'Medium'
           ELSE 'Large'
       END AS Transaction_Size 
FROM TRANSACTIONS;

-- Section E: Aggregation and Business Analysis

-- 50.	Calculate the total number of customers in the banking system.
SELECT COUNT(*) AS Total_Customers 
FROM CUSTOMERS;

-- 51.	Calculate the total number of accounts.
SELECT COUNT(*) AS Total_Accounts 
FROM ACCOUNTS;

-- 52.	Calculate the total balance held across all accounts.
SELECT SUM(BALANCE) AS Total_Balance 
FROM ACCOUNTS;

-- 53.	Calculate the average account balance.
SELECT AVG(BALANCE) AS Average_Balance 
FROM ACCOUNTS;

-- 54.	Find the minimum and maximum account balance.
SELECT MIN(BALANCE) AS Min_Balance, 
       MAX(BALANCE) AS Max_Balance 
FROM ACCOUNTS;

-- 55.	Calculate the total transaction amount across all transactions.
SELECT SUM(ABS(AMOUNT)) AS Total_Transaction_Amount 
FROM TRANSACTIONS;

-- 56.	Calculate the average transaction amount.
SELECT AVG(ABS(AMOUNT)) AS Average_Transaction_Amount 
FROM TRANSACTIONS;

-- 57.	Count the number of transactions by TRANSACTIONTYPE.
SELECT TRANSACTION_TYPE, 
       COUNT(*) AS Transaction_Count 
FROM TRANSACTIONS 
GROUP BY TRANSACTION_TYPE;

-- 58.	Calculate total transaction amount by TRANSACTIONTYPE.
SELECT TRANSACTION_TYPE, 
       SUM(ABS(AMOUNT)) AS Total_Amount 
FROM TRANSACTIONS 
GROUP BY TRANSACTION_TYPE;

-- 59.	Calculate the number of accounts for each ACCOUNTTYPE.
SELECT ACCOUNT_TYPE, 
       COUNT(*) AS Account_Count 
FROM ACCOUNTS 
GROUP BY ACCOUNT_TYPE;

-- 60.	Calculate the average balance for each ACCOUNTTYPE.
SELECT ACCOUNT_TYPE, 
       AVG(BALANCE) AS Average_Balance 
FROM ACCOUNTS 
GROUP BY ACCOUNT_TYPE;

-- 61.	Find account types whose average balance is greater than 25,000 using GROUP BY and HAVING.
SELECT ACCOUNT_TYPE, 
       AVG(BALANCE) AS Average_Balance 
FROM ACCOUNTS 
GROUP BY ACCOUNT_TYPE 
HAVING AVG(BALANCE) > 25000;

-- 62.	Find the top 3 account types based on total balance.
SELECT ACCOUNT_TYPE, 
SUM(BALANCE) AS TOTAL_BALANCE FROM ACCOUNTS 
GROUP BY ACCOUNT_TYPE 
ORDER BY TOTAL_BALANCE DESC LIMIT 3; 

-- 63.	Calculate the number of transactions for each account using ACCOUNTID and identify accounts having more than 3 transactions.
SELECT ACCOUNT_ID, 
       COUNT(*) AS Transaction_Count 
FROM TRANSACTIONS 
GROUP BY ACCOUNT_ID 
HAVING COUNT(*) > 3;

-- 64.	Calculate total deposits and total withdrawals separately using conditional aggregation or suitable filtering.
SELECT 
    SUM(CASE WHEN TRANSACTION_TYPE = 'Deposit' THEN ABS(AMOUNT) ELSE 0 END) AS Total_Deposits,
    SUM(CASE WHEN TRANSACTION_TYPE = 'Withdrawal' THEN ABS(AMOUNT) ELSE 0 END) AS Total_Withdrawals
FROM TRANSACTIONS;

-- 65.	Identify the month with the highest total transaction value using transaction date grouping.
SELECT YEAR(TRANSACTION_DATE) AS 'YEAR', 
       MONTH(TRANSACTION_DATE) AS 'MONTH', 
       SUM(ABS(AMOUNT)) AS Total_Monthly_Value 
FROM TRANSACTIONS 
GROUP BY YEAR(TRANSACTION_DATE), MONTH(TRANSACTION_DATE) 
ORDER BY Total_Monthly_Value DESC 
LIMIT 1;

-- 66.	Calculate the percentage contribution of each transaction type to the overall transaction amount.
SELECT TRANSACTION_TYPE, 
       SUM(ABS(AMOUNT)) AS Type_Total,
       (SUM(ABS(AMOUNT)) * 100.0 / (SELECT SUM(ABS(AMOUNT)) FROM TRANSACTIONS)) AS Percentage_Contribution
FROM TRANSACTIONS 
GROUP BY TRANSACTION_TYPE;

-- 67.	Identify high-value transactions where the amount is above the overall business threshold of 50,000, and report the transaction details.
SELECT * FROM TRANSACTIONS 
WHERE ABS(AMOUNT) > 50000;

-- 68.	Prepare a simple business summary showing total customers, total accounts, total account balance, average account balance, total transactions and average transaction amount using aggregate expressions without joins or subqueries.
SELECT 
    (SELECT COUNT(*) FROM CUSTOMERS) AS Total_Customers,
    (SELECT COUNT(*) FROM ACCOUNTS) AS Total_Accounts,
    (SELECT SUM(BALANCE) FROM ACCOUNTS) AS Total_Account_Balance,
    (SELECT AVG(BALANCE) FROM ACCOUNTS) AS Avg_Account_Balance,
    (SELECT COUNT(*) FROM TRANSACTIONS) AS Total_Transactions,
    (SELECT AVG(ABS(AMOUNT)) FROM TRANSACTIONS) AS Avg_Transaction_Amount;
