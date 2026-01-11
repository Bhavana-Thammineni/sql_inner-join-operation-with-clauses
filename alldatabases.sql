create database bhavana; ## ctreating the database
use bhavana; # using that database
# creation of table
create table details(
sno int,
rollno bigint,
marks float,
percentage double,
age decimal(2,2),
surname varchar(2),
name char(10),
fullname text,
dob date,
brith time,
passout datetime);

desc details; # properties of tables
show tables; # show the tables list
select* from details; # table data box
# single insertion
insert  into details  values (3,401,85,85,24,'t','bhavana','tbhavana','2004-11-26','05:30:00','2004-11-26 05:30:00');

# Error Code: 1264. Out of range value for column 'age' at row 1
alter table details modify column age decimal(4,1);
# multiple insertion
insert into details values(1,410,88,83,23,'g','khushi','gkhushi','2004-12-26','10:30:00','2004-02-26 05:30:00'),
                          (2,410,88,88,23,'g','khushi','gkhushi','2004-12-26','10:30:00','2004-02-26 05:30:00');
# update command
set sql_safe_updates=0;
update details set marks = 78 where marks =88;
update details set sno = 10, rollno = 424 , marks =6 where sno = 1;
#delete command
set autocommit = 0;
delete from details where sno =1;
rollback;
delete from details where sno is null;
delete from details;

# adding the columns starting,middle and last
alter table details add column class text;
alter table details add column fathername text after name;
alter table details add column mothername text first;

#removing the column 
alter table details drop column mothername;

#chaning the dayatype in the column
alter table details modify sno varchar(4);

#3.remove the data from a table
set autocommit =0;
delete from details;
rollback;
TRUNCATE TABLE details; #permenant

#4.remove the table from database
DROP TABLE details;

#5.remove the database
DROP database bhavana;

#perform airthemetic,relational,logical,membership,identify operators on a single table
#perform airthemetic
select*,marks*100 from details;
select*,marks*age from details;
select*,marks+100 from details;
select*,marks-100 from details;
select*,marks/100 from details;
select*,marks%100 from details;

#relational
select*from details where sno = 10;
select*from details where sno <= 10;
select*from details where sno >= 10;
select*from details where sno < 10;
select*from details where sno > 10;
select*from details where sno != 10;
select*from details where sno <> 10;

#logical
select*from details where name ='khuhi' and sno = 2;
select*from details where name ='khuhi' or sno = 2;
select*from details where not name ='bhavana';

#membership
select*from details where sno in (2,3);

#identify
select*from details where fathername is null;

#constraints: 1.unique 2.not null 3.check 4.default 5.auto increment 6.primary key 7.secondary key
use bhavana;
create table department(
dept_id int primary key,
dept_name varchar(30) not null unique
);
insert into department values(1,'cse'),(2,'ece'),(3,'eee');
create table student(
stud_id int primary key auto_increment,
stud_code int unique not null,
stud_name varchar(30) not null,
age int check (age >= 18),
gender char(1) check (gender in ('m','f')),
salary decimal(8,2) check (salary >0),
join_date date default (current_date),
dept_id int,
foreign key (dept_id) references department(dept_id)
);
INSERT INTO student
(stud_code, stud_name, age, gender, salary, dept_id)
VALUES
(101, 'Bhavana', 21, 'f', 30000, 1),
(102, 'Anil', 22, 'm', 32000, 2),
(103, 'Sita', 23, 'f', 35000, 3),
(104, 'Ravi', 24, 'm', 40000, 1),
(105, 'Kiran', 22, 'm', 33000, 2);
select*from student;

-- e_commerce_orders tasks

CREATE TABLE e_commerce_orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10, 2),
    total_amount DECIMAL(10, 2),
    order_date DATE
);

-- Insert sample data (20 rows) with customer names like Ravi
INSERT INTO e_commerce_orders (order_id, customer_name, product_name, quantity, price, total_amount, order_date)
VALUES
(1, 'Ravi Kumar', 'Smartphone', 1, 699.99, 699.99, '2025-10-01'),
(2, 'Amit Sharma', 'Laptop', 1, 999.99, 999.99, '2025-10-02'),
(3, 'Raj Patel', 'Headphones', 2, 49.99, 99.98, '2025-10-03'),
(4, 'Neha Gupta', 'Smartwatch', 1, 199.99, 199.99, '2025-10-04'),
(5, 'Priya Mehta', 'Tablet', 1, 329.99, 329.99, '2025-10-05'),
(6, 'Vikram Singh', 'Keyboard', 1, 89.99, 89.99, '2025-10-06'),
(7, 'Sonia Reddy', 'Mouse', 2, 19.99, 39.98, '2025-10-07'),
(8, 'Ravi Sharma', 'Monitor', 1, 249.99, 249.99, '2025-10-08'),
(9, 'Ananya Iyer', 'Phone Case', 3, 15.99, 47.97, '2025-10-09'),
(10, 'Karan Joshi', 'Smartphone', 2, 699.99, 1399.98, '2025-10-10'),
(11, 'Maya Desai', 'Gaming Console', 1, 399.99, 399.99, '2025-10-11'),
(12, 'Rohit Kapoor', 'Speakers', 2, 79.99, 159.98, '2025-10-12'),
(13, 'Simran Chawla', 'Laptop', 1, 849.99, 849.99, '2025-10-13'),
(14, 'Amitabh Reddy', 'Smartwatch', 1, 199.99, 199.99, '2025-10-14'),
(15, 'Tanya Gupta', 'Smartphone', 1, 799.99, 799.99, '2025-10-15'),
(16, 'Harish Kaur', 'Tablet', 1, 299.99, 299.99, '2025-10-16'),
(17, 'Deepak Singh', 'Keyboard', 2, 69.99, 139.98, '2025-10-17'),
(18, 'Neelam Verma', 'Headphones', 1, 89.99, 89.99, '2025-10-18'),
(19, 'Kunal Joshi', 'Gaming Console', 1, 499.99, 499.99, '2025-10-19'),
(20, 'Pooja Shah', 'Monitor', 1, 199.99, 199.99, '2025-10-20');

-- Display all orders where the price is greater than 500
select*from e_commerce_orders where price > 500;
-- retrieve all orders placed by the customer 'Ravi Kumar'
select*from e_commerce_orders where customer_name ='ravi kumar';
-- Show all orders for the product 'Laptop'
select*from e_commerce_orders where product_name ='laptop';
-- List all orders placed between '2025-10-05' and '2025-10-15'
SELECT * FROM e_commerce_orders WHERE order_date BETWEEN '2025-10-05' AND '2025-10-15';
-- Find all distinct product names
SELECT distinct product_name from e_commerce_orders;
-- Display all unique customer names who bought a 'Smartphone'
SELECT DISTINCT customer_name FROM e_commerce_orders WHERE product_name = 'Smartphone';
-- Show all orders sorted by order_date (ascending)
select*from e_commerce_orders order by order_date;
-- Display all orders sorted by total_amount (descending) 
select*from e_commerce_orders order by order_date desc;
-- Retrieve the first 5 orders
SELECT * FROM e_commerce_orders LIMIT 5;
-- Display the last 3 orders when sorted by order_date
select*from e_commerce_orders order by order_date desc limit 3;
-- Find all orders where customer_name starts with 'R'
SELECT * FROM e_commerce_orders WHERE customer_name LIKE 'R%';
-- Show all products where the price is between 100 and 500
SELECT * FROM e_commerce_orders WHERE price BETWEEN 100 AND 500;
-- List all orders where the quantity is more than 1
SELECT * FROM e_commerce_orders WHERE quantity > 1;
-- Display all orders where the product_name is NOT 'Smartphone'
SELECT * FROM e_commerce_orders WHERE product_name <> 'Smartphone';
-- Show all distinct customers who ordered on '2025-10-10'
select DISTINCT customer_name from e_commerce_orders where order_date ='2025-10-10';

-- task practice group by,having,distinct ,aggregate functions
SELECT DISTINCT product_name
FROM e_commerce_orders;
-- Aggregate Functions (Basics)
-- Total number of orders
SELECT COUNT(*) AS total_orders
FROM e_commerce_orders;
-- Total revenue
SELECT SUM(total_amount) AS total_revenue
FROM e_commerce_orders;
-- Average order value
SELECT AVG(total_amount) AS avg_order_value
FROM e_commerce_orders;
-- Maximum & Minimum order amount
SELECT 
MAX(total_amount) AS highest_order,
MIN(total_amount) AS lowest_order
FROM e_commerce_orders;
-- GROUP BY
-- Total revenue per product
SELECT product_name, SUM(total_amount) AS total_sales
FROM e_commerce_orders
GROUP BY product_name;
-- Number of orders per customer
SELECT customer_name, COUNT(*) AS order_count
FROM e_commerce_orders
GROUP BY customer_name;
-- HAVING
-- Products with total sales greater than 1000
SELECT product_name, SUM(total_amount) AS total_sales
FROM e_commerce_orders
GROUP BY product_name
HAVING SUM(total_amount) > 1000;
-- Customers who placed more than 1 order
SELECT customer_name, COUNT(*) AS order_count
FROM e_commerce_orders
GROUP BY customer_name
HAVING COUNT(*) > 1;

-- task connection between four tables
CREATE TABLE department_hospital(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30) NOT NULL UNIQUE
);
CREATE TABLE doctor (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_name VARCHAR(30) NOT NULL,
    specialization VARCHAR(30),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);
CREATE TABLE patient (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(30) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M','F')),
    dob DATE
);
CREATE TABLE appointment (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT,
    patient_id INT,
    appointment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

-- task insert data in tables after making connection perform inner join operation with clauses
INSERT INTO department_hospital VALUES
(1,'Cardiology'),
(2,'Neurology'),
(3,'Orthopedics');

INSERT INTO doctor (doctor_name, specialization, dept_id) VALUES
('Dr. Rao','Heart Specialist',1),
('Dr. Mehta','Brain Specialist',2),
('Dr. Kumar','Bone Specialist',3);

INSERT INTO patient (patient_name, gender, dob) VALUES
('Anil','M','1995-04-10'),
('Sita','F','1998-06-15'),
('Ravi','M','2000-01-20');

INSERT INTO appointment (doctor_id, patient_id, appointment_date, status) VALUES
(1,1,'2025-03-01','Confirmed'),
(1,2,'2025-03-02','Pending'),
(2,3,'2025-03-03','Confirmed'),
(3,1,'2025-03-04','Cancelled');

select * from department_hospital;
select * from doctor;
select*from patient;
select*from appointment;
-- inner
SELECT 
    p.patient_name,
    d.doctor_name,
    a.appointment_date,
    a.status
FROM appointment a
INNER JOIN patient p ON a.patient_id = p.patient_id
INNER JOIN doctor d ON a.doctor_id = d.doctor_id
WHERE a.status = 'Confirmed';
-- join
SELECT 
    p.patient_name,
    d.doctor_name,
    a.appointment_date
FROM appointment a
INNER JOIN patient p ON a.patient_id = p.patient_id
INNER JOIN doctor d ON a.doctor_id = d.doctor_id
WHERE a.appointment_date > '2025-03-02';
-- order by
SELECT 
    p.patient_name,
    d.doctor_name,
    a.appointment_date
FROM appointment a
INNER JOIN patient p ON a.patient_id = p.patient_id
INNER JOIN doctor d ON a.doctor_id = d.doctor_id
ORDER BY a.appointment_date;

