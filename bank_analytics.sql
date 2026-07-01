CREATE DATABASE bank_analytics;
USE bank_analytics;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    city VARCHAR(50),
    account_type VARCHAR(20)
);
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2),
    transaction_type VARCHAR(20),
    transaction_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
SHOW TABLES;
INSERT INTO customers VALUES
(1,'Aman',25,'Delhi','Savings'),
(2,'Riya',30,'Chandigarh','Current'),
(3,'Karan',28,'Panchkula','Savings'),
(4,'Neha',35,'Delhi','Current'),
(5,'Raj',22,'Mohali','Savings');
INSERT INTO transactions VALUES
(101,1,5000,'Deposit','2026-01-10'),
(102,2,12000,'Withdrawal','2026-01-15'),
(103,3,7000,'Deposit','2026-02-05'),
(104,4,20000,'Deposit','2026-02-20'),
(105,5,3000,'Withdrawal','2026-03-01');
SELECT * FROM customers;
SELECT * FROM transactions;
CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_amount DECIMAL(10,2),
    loan_type VARCHAR(30),
    interest_rate DECIMAL(5,2),
    loan_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
INSERT INTO loans VALUES
(201,1,500000,'Home Loan',7.5,'Approved'),
(202,2,300000,'Personal Loan',10.5,'Approved'),
(203,3,250000,'Car Loan',8.2,'Pending'),
(204,4,700000,'Home Loan',7.1,'Approved'),
(205,5,150000,'Personal Loan',11.0,'Rejected');
SELECT * FROM customers;
SELECT * FROM transactions;
SELECT * FROM loans;
SELECT COUNT(*) AS total_customers
FROM customers;
SELECT SUM(amount) AS total_transaction_amount
FROM transactions;
SELECT COUNT(*) AS approved_loans
FROM loans
WHERE loan_status = 'Approved';
SELECT SUM(loan_amount) AS total_loan_amount
FROM loans;
SELECT 
customers.name,
customers.city,
loans.loan_type,
loans.loan_amount,
loans.loan_status
FROM customers
JOIN loans
ON customers.customer_id = loans.customer_id;


