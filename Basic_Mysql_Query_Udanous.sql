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


