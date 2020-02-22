--Creating Tables
-- CREATE TABLE titles(
-- 	emp_no INT,
-- 	title VARCHAR(20),
-- 	from_date VARCHAR(15),
-- 	to_date VARCHAR(15));
	
-- CREATE TABLE salaries(
-- 	emp_no INT,
-- 	salary INT,
-- 	from_date VARCHAR(15),
-- 	to_date VARCHAR(15));
	
-- CREATE TABLE employees(
-- 	emp_no INT,
-- 	birth_date VARCHAR(15),
-- 	first_name VARCHAR(20),
-- 	last_name VARCHAR(20),
-- 	gender VARCHAR(1),
-- 	hire_date VARCHAR(10));	
	
-- CREATE TABLE departments(
-- 	dept_no VARCHAR(4),
-- 	dept_name VARCHAR(20));	
	
-- CREATE TABLE dept_emp(
-- 	emp_no INT,
-- 	dept_no VARCHAR(4),
-- 	from_date VARCHAR(15),
-- 	to_date VARCHAR(15));	
	
-- CREATE TABLE dept_manager(
-- 	dept_no VARCHAR(4),
-- 	emp_no INT,
-- 	from_date VARCHAR(15),
-- 	to_date VARCHAR(15));	

--Droppning tables
-- DROP TABLE IF EXISTS employees

--Data Analysis 
--Q1)
-- Joining tables & finding first and last names, gender and salary
SELECT employees.first_name, employees.last_name, employees.gender, salaries.salary, employees.emp_no
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no

--Q2)
-- Select employees where hire_date = 1986 TODO: convert hire_date to int variable type
SELECT * FROM employees WHERE hire_date == 1986


--Q3)
-- List manager of each department w/ dept_no, dept_name, manager's emp_no, last_name, first_name, hire_date & to_date

SELECT dm.dept_no, dm.emp_no, dm.to_date, d.dept_name, e.emp_no, 
e.first_name, e.last_name, e.hire_date 
FROM dept_manager as dm
INNER JOIN departments as d ON dm.dept_no = d.dept_no
INNER JOIN employees as e ON dm.emp_no = e.emp_no
