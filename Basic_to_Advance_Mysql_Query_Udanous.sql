-- --------------------------------------------------------19-02-2025--------------------------------------------------------------
#Create Database
create database udanous;

use udanous;
#Create Table
create table interns(id int auto_increment primary key, First_name varchar(50), Last_name varchar(50), city varchar(50), email_id varchar(100) unique);

select * from interns;
#Insert into table
insert into interns values(1,'Roshan','Qureshi','Nagpur','Ros@123'),(2,'Pradyumna','Dhomne','Delhi','Prad@123'),(3,'Mayur','Padore','Mumbai','May@123');

#Alter table to modify data types
ALTER TABLE interns 
MODIFY First_Name varchar(150) Not null,modify Last_name varchar(150) not null,modify city varchar(150) not null,modify email_id VARCHAR(150) NOT NULL;

select * from interns;

ALTER TABLE interns 
MODIFY First_Name varchar(150) Not null,modify Last_name varchar(150) not null,modify city varchar(150) not null,modify email_id VARCHAR(150) unique;

#Updata Table
update interns set First_Name = 'Megha',Last_Name = 'Mahajan',email_id = 'meg@123' where id =3;

#Delete 
delete from interns where id=3;

#Using Check constraints
create table Check_table(Gender varchar(50) not null,Age int,Salary int check(Salary < 10000));

Select * from Check_table;

#Adding Column in Existing Table

alter table Check_table add First_Name varchar(150);

select * from Check_table;

#Modify Column Data type

alter table Check_table modify column First_Name varchar(150) not null;

#Rename column
alter table Check_table rename column First_Name to Full_Name;
select * from Check_table;

#Drop Column
alter table Check_table drop column Full_name;

alter table Check_table add constraint Salary primary key(Salary);

#Create Table For Adding Constraints Primary Key
Create table table_constraint(StudentID int, StudentNames varchar(255), Age int);

insert into table_constraint values(1, "Alex", 18.43) ,(2, "Akash", 27.56),(3, "Ramisha", 21.45) ;
select * from table_constraint;
alter table table_constraint add constraint StudentID primary key(StudentID);


#Assingment

create table table_fk(CourseID int,CourseNames varchar(225));
insert into table_fk values(11, "English"),(12, "Math"),(13, "Language");
select * from table_fk;

create table table_pk(StudentID int, CourseID int, StudentNames varchar(255), Age int);
insert into table_pk values(1, 11, "Alex", 18.43),(2, 12, "Akash", 27.56),(3, 13, "Ramisha", 21.45);
select * from table_pk;

alter table table_pk add constraint CourseID foreign key(CourseID) references table_fk (CourseID);
alter table table_pk add constraint StudentID primary key(StudentID);
alter table table_fk add constraint CourseID primary key(CourseID);


#Assingment2
use udanous;
create table drop_constraint(StudentID int, StudentNames varchar(255), Age int);
insert into drop_constraint values(1, "Alex", 18.43),(2, "Akash", 27.56),(3, "Ramisha", 21.45);
#inserting the values which does not contains age values
insert into drop_constraint(StudentID,StudentNames) values(1, "Alex");
insert into drop_constraint(StudentID,Age) values(1, 33);

select * from drop_constraint;
alter table drop_constraint add constraint primary key(StudentID);
alter table drop_constraint drop primary key;

#Is Null
select * from drop_constraint where (select Age is null);
select * from drop_constraint where Age is null or StudentNames is null;
select * from drop_constraint where Age is null and StudentNames is null;

select * 
from drop_constraint 
where(Age is null and StudentNames is not null)
or (Age is not null and StudentNames is null);

#SELECT * 
#FROM table_name 
#WHERE (column1 IS NULL AND column2 IS NOT NULL) 
#OR (column1 IS NOT NULL AND column2 IS NULL);

-- ----------------------------------------------------20-02-2025-----------------------------------------------------------------

# And OR statement with where clause
select * 
from drop_constraint;

select * 
from drop_constraint 
where StudentNames='Akash' 
and Age=28;

select * 
from drop_constraint 
where StudentNames='Akash' 
or Age=28

select * 
from drop_constraint 
where StudentNames='Akash' 
and Age=22;

#Not and Between

select * 
from drop_constraint 
where not StudentNames='Akash';

select * 
from drop_constraint 
where age 
between 18 
and 22;

#Like

select * 
from drop_constraint 
where StudentNames 
like 'a%';
select * 
from drop_constraint 
where StudentNames 
like '%a';
select * 
from drop_constraint 
where StudentNames 
like '%m%';
select * 
from drop_constraint 
where StudentNames 
like 'a%h';

#in
-- Create Database
create database filtering_database;

use filtering_database;
-- Create the table 

CREATE TABLE cust_info ( 

    CustomersID INT AUTO_INCREMENT PRIMARY KEY, 

    CustomersNames VARCHAR(100), 

    Address VARCHAR(255), 

    Spending DECIMAL(10, 2) 

); 

-- Insert 10 values for each variable 

INSERT INTO cust_info (CustomersNames, Address, Spending) VALUES 

('John Doe', '123 Main St', 100.50), 

('Alice Smith', '456 Elm St', 200.75), 

('Bob Johnson', '789 Oak St', 150.25), 

('Emily Brown', '321 Pine St', 75.00), 

('Michael Davis', '654 Maple St', 300.00), 

('Sarah Wilson', '987 Cedar St', 50.50), 

('David Lee', '741 Birch St', 180.25), 

('Jessica Taylor', '852 Walnut St', 220.75), 

('Chris Evans', '369 Spruce St', 125.00), 

('Emma Thompson', '159 Fir St', 350.25); 

select * from cust_info;

-- Write necessary code to filter the given data table for the customers who have a customer id of 1, 2, and 4. 

select * from cust_info where CustomersID in (1,2,4);

#Limit

select * from drop_constraint where StudentID in (1,2,3,4) limit 2;

#Assignment

use filtering_database;
select * From cust_info;

select CustomersID, CustomersNames from cust_info;
select *,length(CustomersNames) as LengthCustomersNames from cust_info where CustomersID=1;

select concat('Customer_Name : ',CustomersNames,' , ',' Spendings : ',Spending) as ConcatenatedString from cust_info;


#Assignment

-- Create the table 

CREATE TABLE cust_info_2 ( 

    CustomersID INT AUTO_INCREMENT PRIMARY KEY, 

    FirstNames VARCHAR(50), 

    LastNames VARCHAR(50), 

    Address VARCHAR(255), 

    Spending DECIMAL(10, 2) 

); 



-- Insert 10 values for each variable 

INSERT INTO cust_info_2 (FirstNames, LastNames, Address, Spending) VALUES 

('John', 'Doe', '123 Main St', 100.50), 

('Alice', 'Smith', '456 Elm St', 200.75), 

('Bob', 'Johnson', '789 Oak St', 150.25), 

('Emily', 'Brown', '321 Pine St', 75.00), 

('Michael', 'Davis', '654 Maple St', 300.00), 

('Sarah', 'Wilson', '987 Cedar St', 50.50), 

('David', 'Lee', '741 Birch St', 180.25), 

('Jessica', 'Taylor', '852 Walnut St', 220.75), 

('Chris', 'Evans', '369 Spruce St', 125.00), 

('Emma', 'Thompson', '159 Fir St', 350.25); 

-- Write necessary code to add the FirstNames and LastNames into a new column NewCustomersNames. 

select * from cust_info_2;

select concat( FirstNames,' ', LastNames ) as NewCustomersNames from cust_info_2;

#Lower

select lower(concat( FirstNames,' ', LastNames )) as NewCustomersNames from cust_info_2;

#Upper

select upper(concat( FirstNames,' ', LastNames )) as NewCustomersNames from cust_info_2;

#Trim

select trim('  John Doe  ') as Trimmed_String;

#Replace

select replace(concat( FirstNames,' ', LastNames ),FirstNames,'Rahul') as Replaced_Name from cust_info_2 where Spending=100.50;
select * from cust_info_2;
#Max
select max(Spending) from cust_info_2;
#sum
select sum(Spending) from cust_info_2;
#div
select Spending div 2 from cust_info_2;
#avg
select avg(Spending) from cust_info_2;
#abs
select abs(-10);
#Count
select count(Spending) from cust_info_2;
#min
select min(Spending) from cust_info_2;

-- -------------------------------------------------21-02-2025------------------------------------------------------------------

#Power

#Assignment
-- Create the table 

CREATE TABLE exam_info ( 

    StudentID INT AUTO_INCREMENT PRIMARY KEY, 

    FirstNames VARCHAR(50), 

    LastNames VARCHAR(50), 

    Scores integer 

); 

  

-- Insert 10 values for each variable 

INSERT INTO exam_info (FirstNames, LastNames, Scores) VALUES 

('John', 'Doe',  80), 

('Alice', 'Smith',  75), 

('Bob', 'Johnson',  78), 

('Emily', 'Brown',  60), 

('Michael', 'Davis', 86), 

('Sarah', 'Wilson', 90), 

('David', 'Lee', 75), 

('Jessica', 'Taylor', 75), 

('Chris', 'Evans',  55), 

('Emma', 'Thompson',  67); 

-- Write necessary code to calculate the cube of the Scores column. Store the output in CubeScores. 

select * from exam_info;
select power(Scores,3) from exam_info;

#Round

SELECT ROUND(Spending,2)
FROM cust_info_2;

#Assignment(Round)
-- Create the table 

CREATE TABLE exam_info_2 ( 

    StudentID INT AUTO_INCREMENT PRIMARY KEY, 

    FirstNames VARCHAR(50), 

    LastNames VARCHAR(50), 

    Scores float 

); 

  

-- Insert 10 values for each variable 

INSERT INTO exam_info_2 (FirstNames, LastNames, Scores) VALUES 

('John', 'Doe',  80.345544), 

('Alice', 'Smith',  75.6355), 

('Bob', 'Johnson',  78.5364565), 

('Emily', 'Brown',  60.3565), 

('Michael', 'Davis', 86.5353656), 

('Sarah', 'Wilson', 90.535464), 

('David', 'Lee', 75.567765), 

('Jessica', 'Taylor', 75.34242), 

('Chris', 'Evans',  55.09098), 

('Emma', 'Thompson',  67.34535); 

-- Write necessary code to round up the values of Scores column up to 2 decimal points. Store the output in RoundedScores. 

select * from exam_info_2;

SELECT ROUND(Scores,2)
FROM exam_info_2;

#SQRT

SELECT Spending, round(SQRT(Spending),2) as SQRT_Spending
FROM cust_info_2;

#Log

SELECT Spending, round(LOG(Spending),2) as Log_Spending
FROM cust_info_2;

#Assignment(SQRT)
-- Create the table 

CREATE TABLE exam_info_3 ( 

    StudentID INT AUTO_INCREMENT PRIMARY KEY, 

    FirstNames VARCHAR(50), 

    LastNames VARCHAR(50), 

    Scores float 

); 

  

-- Insert 10 values for each variable 

INSERT INTO exam_info_3 (FirstNames, LastNames, Scores) VALUES 

('John', 'Doe',  80.345544), 

('Alice', 'Smith',  75.6355), 

('Bob', 'Johnson',  78.5364565), 

('Emily', 'Brown',  60.3565), 

('Michael', 'Davis', 86.5353656), 

('Sarah', 'Wilson', 90.535464), 

('David', 'Lee', 75.567765), 

('Jessica', 'Taylor', 75.34242), 

('Chris', 'Evans',  55.09098), 

('Emma', 'Thompson',  67.34535); 

-- Write necessary code to transform the values of Scores into square root format. Store the output in TransformedScores. 

select * from exam_info_3;

SELECT Scores, round(sqrt(Scores),2) as TransformedScores
FROM exam_info_3;

#Date Format

-- SELECT DATE_FORMAT(date_column, format)
-- FROM table_name;

-- Format Description
-- %b Abbreviated month name (Jan to Dec)
-- %c Numeric month name (0 to 12)
-- %M Month name in full (January to December)
-- %Y Year as a numeric, 4-digit value
-- %y Year as a numeric, 2-digit value
-- %W Day as a , Monday Tuesday,....
select date_format(now(),'%b-%Y') as Date_Today;

#Assignment(Date_Fromat)
-- Create the table 

CREATE TABLE purchases ( 

    CustomerID INT, 

    PurchaseDate DATE, 

    ReturnDate DATE 

); 


-- Insert values 

INSERT INTO purchases (CustomerID, PurchaseDate, ReturnDate) VALUES 

(1, '2024-01-01', '2024-01-05'), 

(2, '2024-01-02', '2024-01-06'), 

(3, '2024-01-03', '2024-01-07'), 

(4, '2024-01-04', '2024-01-08'), 

(5, '2024-01-05', '2024-01-09'), 

(6, '2024-01-06', '2024-01-10'), 

(7, '2024-01-07', '2024-01-11'), 

(8, '2024-01-08', '2024-01-12'), 

(9, '2024-01-09', '2024-01-13'), 

(10, '2024-01-10', '2024-01-14'); 

--  Write necessary code to format the dates in PurchaseDate column like this "24-January-1st". Store the output in FormatedDate. 

select * from purchases;

select date_Format(PurchaseDate,'%y-%M-%cst') from purchases;
select date_Format(PurchaseDate,'%y-%M-%dst') from purchases;

#Datedif
SELECT abs(DATEDIFF(PurchaseDate, ReturnDate))
FROM purchases;

#Assignment

-- Create the table 

CREATE TABLE purchases1 ( 

    CustomerID INT, 

    PurchaseDate DATE, 

    ReturnDate DATE 

); 



-- Insert values 

INSERT INTO purchases1 (CustomerID, PurchaseDate, ReturnDate) VALUES 

(1, '2024-01-01', '2024-01-09'), 

(2, '2024-01-02', '2024-01-16'), 

(3, '2024-01-03', '2024-01-11'), 

(4, '2024-01-04', '2024-01-08'), 

(5, '2024-01-05', '2024-01-09'), 

(6, '2024-01-06', '2024-01-10'), 

(7, '2024-01-07', '2024-01-21'), 

(8, '2024-01-08', '2024-01-29'), 

(9, '2024-01-09', '2024-01-13'), 

(10, '2024-01-10', '2024-01-24'); 

-- Write necessary code to find the difference between PurchaseDate and ReturnDate columns. Store the output in . 

select * from purchases1;

SELECT abs(DATEDIFF(PurchaseDate, ReturnDate)) as DateDifference
FROM purchases1;

#Day-Month-Year

SELECT DAY(PurchaseDate)
FROM purchases1;

SELECT MONTH(PurchaseDate)
FROM purchases1;

SELECT YEAR(PurchaseDate)
FROM purchases1;

SELECT DAY(PurchaseDate) as Day, MONTH(PurchaseDate) as Month, YEAR(PurchaseDate) as Year
FROM purchases1;

select ReturnDate, year(ReturnDate) as years_date from purchases;

select * from purchases1;

-- ---------------------------------------------24-02-2025----------------------------------------------------------------------------------------

#Order By clause
use filtering_database;
select * from exam_info_3 order by Scores desc;

select * from exam_info_3 order by Scores asc;

#Group By
create table Group_By_Analysis(City varchar(100), CustomersID int,Total_Spending int);
insert into Group_By_Analysis values
('New York', 55, 545656),
('Chicago', 75 ,784365),
('Las Vegas', 67 ,874569);
select * from Group_By_Analysis;

SELECT City, Avg(Total_Spending)
FROM Group_By_Analysis
GROUP BY City


#Inner Join
use sample_schema;
SELECT Student_ID,Semester,Grade,Credits
FROM enrollments_data e
INNER JOIN courses_data c 
ON e.Course_ID = c.Course_ID;

#Left Join
SELECT *
FROM enrollments_data e
LEFT JOIN courses_data c 
ON e.Course_ID = c.Course_ID;

#Right Join
SELECT *
FROM enrollments_data e
RIGHT JOIN courses_data c 
ON e.Course_ID = c.Course_ID;

#Cross Join
SELECT *
FROM enrollments_data e
CROSS JOIN courses_data c 
ON e.Course_ID = c.Course_ID;

#Having Clause
use filtering_database;
select * from cust_info;

SELECT CustomersNames,Avg(Spending)
FROM cust_info
WHERE CustomersNames like 'A%'
GROUP BY CustomersNames
HAVING Avg(Spending);

#Exists
use sample_schema;

SELECT Course_ID
FROM enrollments_data e
WHERE EXISTS (SELECT Course_ID FROM courses_data c WHERE c.Course_ID=e.Course_ID);

SELECT 'Employee Exists' as Result
FROM dual
WHERE EXISTS (
    SELECT 1 FROM courses_data WHERE Course_Name = 'B'
);

#Any

SELECT Grade,Course_ID
FROM enrollments_data
WHERE Course_ID > ANY (SELECT Course_ID FROM courses_data WHERE Course_Name='Biology');

-- Assignment

-- Create the table 

CREATE TABLE student_info ( 

    StudentID INT PRIMARY KEY, 

    FirstNames VARCHAR(50), 

    LastNames VARCHAR(50) 

); 

  

-- Insert 10 values for each variable 

INSERT INTO student_info (StudentID, FirstNames, LastNames) VALUES 

(1, 'John', 'Doe'), 

(2, 'Alice', 'Smith'), 

(3, 'Bob', 'Johnson'), 

(4, 'Emily', 'Brown'), 

(5, 'Michael', 'Davis'), 

(6, 'Sarah', 'Wilson'), 

(7, 'David', 'Lee'), 

(8, 'Jessica', 'Taylor'), 

(9, 'Chris', 'Evans'), 

(10, 'Emma', 'Thompson'); 

-- Create the table 

CREATE TABLE exam_info_std ( 

    StudentID INT PRIMARY KEY, 

    Subjects VARCHAR(50), 

    Scores integer 

); 

  

-- Insert 10 values for each variable 

INSERT INTO exam_info_std (StudentID, Subjects, Scores) VALUES 

(1, 'Math',  80), 

(2, 'English',  75), 

(3, 'Science',  78), 

(4, 'Math',  60), 

(5, 'English', 86), 

(6, 'Science', 90), 

(7, 'Science', 75), 

(8, 'English', 75), 

(9, 'Math',  55), 

(10, 'Math',  67); 

select * from student_info;
select * from exam_info_std;
-- 1:Write necessary code to filter all the columns of student_info table where StudentID from both tables equals to each other 
-- AND Scores is greater than 75. That means you are finding the information of the students who scored more than 75 in the exam.

select * from student_info s
inner join exam_info_std e
on s.StudentID=e.StudentID
where Scores>75;

-- 2: Write necessary code to filter all the columns of student_info table where StudentID from student_info table equals to that 
-- of exam_info table WHERE Scores is greater than 75. That means you are finding the information of the students who scored more 
-- than 75 in the exam but using ANY sql method. 

select * from student_info where StudentID = any (select StudentID from exam_info_std where Scores>75);

#Case

SELECT *,
CASE
WHEN Scores>=90 THEN 'Grade_A'
WHEN Scores>=80 and Scores<90 THEN 'Grade_B'
WHEN Scores>=70 and Scores<80 THEN 'Grade_C'

ELSE 'Needs_Improvement'
END AS Performance_category
FROM exam_info_std;

#Comments
/* The necessary SQL code
Selecting students information who got Grade A */
SELECT *
FROM student_information
WHERE Student_ID = ANY(SELECT Student_ID FROM enrollments_data WHERE Grade = "A");

USE Sample_Schema;

-- SQL code for deriving students exam outcome
SELECT *,
CASE
 WHEN GPA > 3 THEN 'PASSED'
 WHEN GPA BETWEEN 2.5 AND 3 THEN 'HOLD'
 ELSE 'FAILED'
END AS Outcome
FROM student_information;

#Procedures

DELIMITER //
CREATE PROCEDURE student_outcomes()
  BEGIN
    SELECT *,
      CASE
        WHEN GPA > 3 THEN 'PASSED'
        WHEN GPA BETWEEN 2.5 AND 3 THEN 'HOLD'
	  ELSE 'FAILED'
	END AS Outcome
    FROM student_information;
END//
DELIMITER ; 

CALL student_outcomes()

-- ------------------------------------25-02-2025---------------------------------------------------------------------------------------------

use sample_schema;
select * from order_details;
select * from orders;
select * from pizza_types;
select * from pizzas;

-- 1: Retrieve the total number of orders placed. 
select * from orders;
select count(order_id) from orders;

-- 2: Calculate the total revenue generated from pizza sales.
select * from pizza_types;
select * from pizzas;
SELECT DISTINCT size AS Distinct_Sizes,count(size) as Count, SUM(price) AS Total_Revenue 
FROM pizzas
GROUP BY size;

-- 3: Identify the highest-priced pizza.
SELECT DISTINCT size AS Distinct_Sizes, max(price) AS Highest_price 
FROM pizzas
GROUP BY size;

-- 4: Identify the most common pizza size ordered.
select distinct size as Distinct_Sizes , count(size) as Size_Ordered 
from pizzas 
group by size;

-- 5: List the top 5 most ordered pizza types along with their quantities.
select * from pizzas;
select * from pizza_types;
select * from order_details;

SELECT *
FROM pizza_types p
INNER JOIN pizzas pi 
ON p.pizza_type_id = pi.pizza_type_id;

SELECT *
FROM pizzas pi
INNER JOIN order_details o 
ON pi.pizza_id = o.pizza_id

SELECT p.name, SUM(o.quantity) AS total_quantity
FROM pizza_types p
INNER JOIN pizzas pi ON p.pizza_type_id = pi.pizza_type_id
INNER JOIN order_details o ON pi.pizza_id = o.pizza_id
GROUP BY p.name
order by total_quantity desc
limit 5;


-- 6: Join the necessary tables to find the total quantity of each pizza category ordered.

SELECT pt.category, SUM(od.quantity) AS total_quantity
FROM pizza_types pt
INNER JOIN pizzas p ON pt.pizza_type_id = p.pizza_type_id
INNER JOIN order_details od ON p.pizza_id = od.pizza_id
GROUP BY pt.category
ORDER BY total_quantity DESC;

 

-- 7: Determine the distribution of orders by hour of the day. 
select * from orders;
SELECT 
    EXTRACT(HOUR FROM o.time) AS order_hour,
    COUNT(o.order_id) AS total_orders
FROM orders o
GROUP BY order_hour
ORDER BY order_hour;


-- 8: Join relevant tables to find the category-wise distribution of pizzas. 

SELECT pt.category, COUNT(p.pizza_id) AS total_pizzas
FROM pizza_types pt
INNER JOIN pizzas p ON pt.pizza_type_id = p.pizza_type_id
GROUP BY pt.category
ORDER BY total_pizzas DESC;


-- 9: Group the orders by date and calculate the average number of pizzas ordered per day. 

SELECT 
    DATE(o.time) AS order_date,
    SUM(od.quantity) AS total_pizzas_ordered,
    AVG(SUM(od.quantity)) OVER () AS avg_pizzas_per_day
FROM orders o
INNER JOIN order_details od ON o.order_id = od.order_id
GROUP BY order_date
ORDER BY order_date;


-- 10: Determine the top 3 most ordered pizza types based on revenue. 

SELECT pt.name AS pizza_type, 
       SUM(od.quantity * p.price) AS total_revenue
FROM order_details od
INNER JOIN pizzas p ON od.pizza_id = p.pizza_id
INNER JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_revenue DESC
LIMIT 3;

-- ------------------------------26-02-2025---------------------------------------------------------------------------------------------------

-- 11: Calculate the percentage contribution of each pizza type to total revenue. 

SELECT 
    pt.name AS pizza_type, 
    SUM(od.quantity * p.price) AS total_revenue,
    (SUM(od.quantity * p.price) / (SELECT SUM(od.quantity * p.price) 
                                   FROM order_details od
                                   INNER JOIN pizzas p ON od.pizza_id = p.pizza_id)) * 100 AS percentage_contribution
FROM order_details od
INNER JOIN pizzas p ON od.pizza_id = p.pizza_id
INNER JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY percentage_contribution DESC;


-- 12: Analyze the cumulative revenue generated over time. 

SELECT 
    DATE(o.time) AS order_date, 
    SUM(od.quantity * p.price) AS daily_revenue,
    SUM(SUM(od.quantity * p.price)) OVER (ORDER BY DATE(o.time)) AS cumulative_revenue
FROM orders o
INNER JOIN order_details od ON o.order_id = od.order_id
INNER JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY order_date
ORDER BY order_date;


-- 13: Determine the top 3 most ordered pizza types based on revenue for each pizza category. 

WITH PizzaRevenue AS (
    SELECT 
        pt.category, 
        pt.name AS pizza_type, 
        SUM(od.quantity * p.price) AS total_revenue,
        RANK() OVER (PARTITION BY pt.category ORDER BY SUM(od.quantity * p.price) DESC) AS rank_order
    FROM order_details od
    INNER JOIN pizzas p ON od.pizza_id = p.pizza_id
    INNER JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY pt.category, pt.name
)
SELECT category, pizza_type, total_revenue
FROM PizzaRevenue
WHERE rank_order <= 3
ORDER BY category, rank_order;






