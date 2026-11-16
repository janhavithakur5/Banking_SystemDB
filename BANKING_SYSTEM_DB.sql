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

-- 11.	Create the ACCOUNTS table with ACCOUNTID, CUSTOMERID, ACCOUNTTYPE, BALANCE, ACCOUNTSTATUS and OPENINGDATE using suitable data types.
 CREATE TABLE ACCOUNTS (
    ACCOUNT_ID INT PRIMARY KEY AUTO_INCREMENT,
    CUSTOMER_ID INT ,
    ACCOUNT_TYPE VARCHAR(150) ,
    BALANCE DECIMAL(15, 2) DEFAULT 0.00,
    ACCOUNT_STATUS VARCHAR(200) DEFAULT 'Active',
    OPENING_DATE DATE );

-- 12.	Create the TRANSACTIONS table with TRANSACTIONID, ACCOUNTID, TRANSACTIONTYPE, AMOUNT, TRANSACTIONDATE and DESCRIPTION.
CREATE TABLE TRANSACTIONS (
    TRANSACTION_ID INT PRIMARY KEY AUTO_INCREMENT,
    ACCOUNT_ID INT ,
    TRANSACTION_TYPE VARCHAR(59) , 
    AMOUNT DECIMAL(10, 2) ,
    TRANSACTION_DATE DATETIME ,
    DESCRIPTION VARCHAR(255));
    
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

-- 20.	Update the email address of a customer whose CUSTOMERID is provided by your instructor.


-- 21.	Update the ACCOUNTSTATUS of one account from its current status to an appropriate new status.
-- 22.	Increase the balance of all active accounts by 500 as a business adjustment. Verify the records before and after the update.
-- 23.	Delete a test customer record that you created specifically for deletion practice. Verify the record before deleting it.
-- 24.	Create a temporary/test table from an appropriate table structure, add test records, and remove all rows using TRUNCATE. Verify that the table remains available.
