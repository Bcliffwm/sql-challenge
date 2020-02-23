--Creating Tables
-- CREATE TABLE titles(
-- 	emp_no INT,
-- 	title VARCHAR(20),
-- 	from_date DATE,
-- 	to_date DATE);

-- CREATE TABLE salaries(
-- 	emp_no INT,
-- 	salary INT,
-- 	from_date DATE,
-- 	to_date DATE);
	
-- CREATE TABLE employees(
-- 	emp_no INT,
-- 	birth_date VARCHAR(15),
-- 	first_name VARCHAR(20),
-- 	last_name VARCHAR(20),
-- 	gender VARCHAR(1),
-- 	hire_date DATE);	
	
-- CREATE TABLE departments(
-- 	dept_no VARCHAR(4),
-- 	dept_name VARCHAR(20));	
	
-- CREATE TABLE dept_emp(
-- 	emp_no INT,
-- 	dept_no VARCHAR(4),
-- 	from_date DATE,
-- 	to_date DATE);	
	
CREATE TABLE dept_manager(
	dept_no VARCHAR(4),
	emp_no INT,
	from_date DATE,
	to_date DATE);	

-- Droppning tables
DROP TABLE IF EXISTS dept_manager

--Data Analysis 
--Q1)
-- Joining tables & finding first and last names, gender and salary
SELECT employees.first_name, employees.last_name, employees.gender, salaries.salary, employees.emp_no
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no

--Q2)
-- Select employees where hire_date = 1986 TODO: convert hire_date to int variable type
SELECT * FROM employees WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--Q3)
-- List manager of each department w/ dept_no, dept_name, manager's emp_no, last_name, first_name, hire_date & to_date
SELECT dm.dept_no, dm.emp_no, dm.to_date, d.dept_name, e.emp_no, 
e.first_name, e.last_name, e.hire_date 
FROM dept_manager as dm
INNER JOIN departments as d ON dm.dept_no = d.dept_no
INNER JOIN employees as e ON dm.emp_no = e.emp_no;

--Q4) list department of each employee w/ emp_no, first_name, last_name and dept_name
SELECT d.dept_name, de.dept_no, de.emp_no, e.emp_no, e.first_name, e.last_name
FROM departments as d
INNER JOIN dept_emp as de ON d.dept_no = de.dept_no
INNER JOIN employees as e ON de.emp_no = e.emp_no;

--Q5) List all employees named Hercules w/ last name starting with "B"
SELECT first_name, last_name FROM employees
WHERE first_name = 'Hercules' AND last_name = 'B%';

--Q6) List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT d.dept_name, e.first_name, e.last_name, e.emp_no
	FROM employees as e 
	INNER JOIN dept_emp as de 
		ON (de.emp_no = e.emp_no)
	INNER JOIN departments as d 
		ON (de.dept_no = d.dept_no)
	WHERE d.dept_name = 'Sales'; 

