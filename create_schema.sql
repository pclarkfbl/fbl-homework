-- create database syntax is not consistent from one vendor to another.
-- You'll need to make sure you're using a default character encoding that supports unicode.
-- for postgres, use: CREATE DATABASE rosters with encoding 'unicode';
-- for mysql, use: CREATE DATABASE rosters CHARACTER SET utf8 COLLATE utf8;
-- for SQL Server, you'll probably be creating the table from within the SQL Server Management Studio.
-- for SQL Server, alter the 'char' and 'varchar' data types below to be 'nchar' or 'nvarchar'

CREATE TABLE student (
	id numeric(24) NOT NULL,
	state_id varchar(255),
	first_name varchar(255),
	last_name varchar(255),
	gender char(1),
	birthdate date,
	race char(2),
	meal_status char(2),
	english_proficiency char(2),
	native_language char(5),
	service_code char(2),
	primary_disability_type char(2),
	iep_reading boolean,
	iep_math boolean,
	iep_behavior boolean,
	gifted_talented boolean,
	section504 boolean,
	mobility boolean
);

create table teacher (
	id numeric(24) NOT NULL,
	first_name varchar(255),
	last_name varchar(255),
	email varchar(255),
	school varchar(255)
);

create table enrollment (
	student_id numeric(24) NOT NULL,
	teacher_id numeric(24) NOT NULL,
	grade char(2),
	course varchar(64),
	section varchar(16)
);
