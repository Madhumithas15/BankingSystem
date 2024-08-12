CREATE DATABASE BankingSystem;
USE BankingSystem;
CREATE TABLE admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    address TEXT NOT NULL,
    mobile_no VARCHAR(15) NOT NULL,
    email_id VARCHAR(100) NOT NULL,
    account_type ENUM('Saving', 'Current') NOT NULL,
    initial_balance DECIMAL(10, 2) NOT NULL CHECK (initial_balance >= 1000),
    dob DATE NOT NULL,
    id_proof VARCHAR(100) NOT NULL,
    account_no VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    transaction_type ENUM('Deposit', 'Withdraw') NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);
select *from customer;
select *from admin;
select *from transactions;

insert into admin values('1','madhu','madhu12');