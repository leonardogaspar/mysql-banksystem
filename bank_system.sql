/* Creating a database to store banking data */
CREATE DATABASE bank_system;
USE bank_system;

/* Creating the tables */
CREATE TABLE bank_branch (
	branch_id INT PRIMARY KEY NOT NULL,
    branch_state CHAR(2) NOT NULL,
    branch_city VARCHAR(255) NOT NULL,
    branch_street VARCHAR(255) NOT NULL,
	branch_number INT NOT NULL,
    branch_zip_code VARCHAR(30) NOT NULL,
    branch_telephone VARCHAR(30) NOT NULL
);

CREATE TABLE customers (
    customer_ssn CHAR(11) PRIMARY KEY NOT NULL,
    customer_name VARCHAR(255) NOT NULL,
    customer_state VARCHAR(2) NOT NULL,
    customer_city VARCHAR(255) NOT NULL,
    customer_street VARCHAR(255) NOT NULL,
    customer_number INT NOT NULL,
    customer_address_line_2 VARCHAR(255),
    customer_zip_code VARCHAR(30) NOT NULL,
    customer_email VARCHAR(255),
    customer_telephone VARCHAR(30)
);

CREATE TABLE bank_account (
    account_id INT PRIMARY KEY NOT NULL,
    balance DECIMAL(10,2) NOT NULL,
    account_type VARCHAR(255) NOT NULL,
    branch_id INT NOT NULL,
    customer_ssn CHAR(11) NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES bank_branch(branch_id),
    FOREIGN KEY (customer_ssn) REFERENCES customers(customer_ssn)
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY NOT NULL,
    transaction_type VARCHAR(255) NOT NULL,
    transaction_value DECIMAL(10,2) NOT NULL,
    transaction_date_time DATETIME NOT NULL,
    account_id INT NOT NULL,
    FOREIGN KEY (account_id) REFERENCES bank_account(account_id)
);

CREATE TABLE employee (
    employee_id INT PRIMARY KEY NOT NULL,
    employee_name VARCHAR(255) NOT NULL,
    employee_position VARCHAR(255) NOT NULL,
    employee_salary DECIMAL(10,2) NOT NULL,
    branch_id INT NOT NULL,
    FOREIGN KEY (branch_id) REFERENCES bank_branch(branch_id)
);

/* Inserting values into bank_branch table */
INSERT INTO bank_branch (branch_id, branch_state, branch_city, branch_street, branch_number, branch_zip_code, branch_telephone) VALUES
(1, 'CA', 'Anytown', 'Main St', 123, '90001', '+1 555-123-4567'),
(2, 'CA', 'Anytown', 'Oak St', 456, '90002', '+1 555-987-6543'),
(3, 'CA', 'Los Angeles', 'Pine St', 789, '90003', '+1 555-456-7890'),
(4, 'IL', 'Chicago', 'Birch St', 321, '60601', '+1 555-654-3210'),
(5, 'TX', 'Houston', 'Cedar St', 654, '77001', '+1 555-789-0123'),
(6, 'FL', 'Miami', 'Maple St', 987, '33101', '+1 555-321-0987'),
(7, 'WA', 'Seattle', 'Willow St', 246, '98101', '+1 555-876-5432'),
(8, 'CO', 'Denver', 'Ash St', 135, '80201', '+1 555-432-1098'),
(9, 'MA', 'Boston', 'Spruce St', 864, '02101', '+1 555-210-8765'),
(10, 'NY', 'New York', 'Broadway', 123, '10001', '+1 212-555-7890');

/* Inserting values into customers table */
INSERT INTO customers (customer_ssn, customer_name, customer_state, customer_city, customer_street, customer_number, customer_address_line_2, customer_zip_code, customer_email, customer_telephone) VALUES
('123-45-6789', 'John Doe', 'CA', 'Anytown', 'Elm St', 789, 'Unit B', '90002', 'john@example.com', '5559876543'),
('987-65-4321', 'Jane Smith', 'CA', 'Anytown', 'Maple Ave', 789, 'Apt C', '90003', 'jane@example.com', '5551234567'),
('234-56-7890', 'Alice Brown', 'CA', 'Los Angeles', 'Maple St', 159, '', '90010', 'alice@example.com', '5556547890'),
('876-54-3210', 'Bob White', 'IL', 'Chicago', 'Oak St', 753, '', '60602', 'bob@example.com', '5553216547'),
('345-67-8901', 'Charlie Green', 'TX', 'Houston', 'Pine St', 951, '', '77002', 'charlie@example.com', '5559873210'),
('765-43-2109', 'Diana Black', 'FL', 'Miami', 'Cedar St', 852, '', '33102', 'diana@example.com', '5551230987'),
('456-78-9012', 'Evan Blue', 'WA', 'Seattle', 'Willow St', 357, 'Apt 1', '98102', 'evan@example.com', '5557896543'),
('654-32-1098', 'Fiona Gray', 'CO', 'Denver', 'Ash St', 951, 'Unit A', '80202', 'fiona@example.com', '5554325678'),
('567-89-0123', 'George Red', 'MA', 'Boston', 'Spruce St', 159, '', '02102', 'george@example.com', '5558764321'),
('890-12-3456', 'Olivia Brown', 'NY', 'New York', 'Park Ave', 456, 'Apt 10B', '10022', 'olivia@example.com', '2125551234');

/* Inserting values into bank_account table */
INSERT INTO bank_account (account_id, balance, account_type, branch_id, customer_ssn) VALUES
(101, 5000.00, 'Savings', 1, '123-45-6789'),
(102, 3500.00, 'Checking', 2, '987-65-4321'),
(103, 7000.00, 'Savings', 3, '234-56-7890'),
(104, 2500.00, 'Checking', 4, '876-54-3210'),
(105, 8000.00, 'Savings', 5, '345-67-8901'),
(106, 4000.00, 'Checking', 6, '765-43-2109'),
(107, 5500.00, 'Savings', 7, '456-78-9012'),
(108, 3000.00, 'Checking', 8, '654-32-1098'),
(109, 4500.00, 'Savings', 9, '567-89-0123'),
(110, 6000.00, 'Savings', 10, '890-12-3456');

/*Inserting values into transactions table */
INSERT INTO transactions (transaction_id, transaction_type, transaction_value, transaction_date_time, account_id) VALUES
(1001, 'Deposit', 1000.00, '2024-08-31 10:00:00', 101),
(1002, 'Withdrawal', 500.00, '2024-08-31 11:30:00', 102),
(1003, 'Deposit', 1500.00, '2024-08-31 12:00:00', 103),
(1004, 'Withdrawal', 700.00, '2024-08-31 13:30:00', 104),
(1005, 'Deposit', 2000.00, '2024-08-31 14:00:00', 105),
(1006, 'Withdrawal', 1200.00, '2024-08-31 15:00:00', 106),
(1007, 'Deposit', 1800.00, '2024-08-31 16:00:00', 107),
(1008, 'Withdrawal', 900.00, '2024-08-31 17:30:00', 108),
(1009, 'Deposit', 2300.00, '2024-08-31 18:00:00', 109),
(1010, 'Deposit', 3000.00, '2024-08-31 19:00:00', 110);

/* Inserting values into employee table */
INSERT INTO employee (employee_id, employee_name, employee_position, employee_salary, branch_id) VALUES
(201, 'Emily Rodriguez', 'Branch Manager', 60000.00, 1),
(202, 'Carlos Oliveira', 'Teller', 40000.00, 2),
(203, 'Hannah Johnson', 'Teller', 40000.00, 3),
(204, 'Ian Smith', 'Customer Service', 38000.00, 4),
(205, 'Jack Wilson', 'Branch Manager', 62000.00, 5),
(206, 'Kelly Thompson', 'Loan Officer', 45000.00, 6),
(207, 'Leo Davis', 'Security Officer', 37000.00, 7),
(208, 'Mia Lopez', 'Teller', 40000.00, 8),
(209, 'Nina Scott', 'Branch Manager', 61000.00, 9),
(210, 'Sophia Martinez', 'Branch Manager', 63000.00, 10);

/* Viewing the tables */
SELECT * FROM bank_account;
SELECT * FROM bank_branch;
SELECT * FROM customers;
SELECT * FROM employee;
SELECT * FROM transactions;

/* 
Function to drop the created tables
DROP TABLE bank_branch, bank_account, customers, transactions, employee;
*/
