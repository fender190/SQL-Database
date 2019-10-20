-- drop all tables, if they exists
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_managers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Create tables, load files into tables
CREATE TABLE departments(
	dept_no VARCHAR(10) NOT NULL,
	dept_name VARCHAR(20) NOT NULL,
	PRIMARY KEY (dept_no)
);
-- test loaded file
SELECT *
FROM departments

-- create remaining tables
CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	from_date DATE, to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_managers(
	dept_no VARCHAR(10) NOT NULL,
	emp_no INTEGER NOT NULL,
	from_date DATE, to_date DATE,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE employees(
	emp_no INTEGER NOT NULL,
	birth_date DATE,
	first_name VARCHAR(30),last_name VARCHAR(30),
	gender VARCHAR(6),hire_date DATE,
	PRIMARY KEY(emp_no)
);

CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary INTEGER, from_date DATE,to_date DATE,
	FOREIGN KEY(emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles(
	emp_no INTEGER NOT NULL,
	title VARCHAR(30), from_date DATE, to_date DATE,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- load csv files, test tables
SELECT *
FROM dept_emp

SELECT *
FROM dept_managers

SELECT *
FROM employees

SELECT *
FROM salaries

SELECT *
FROM titles

-- All files loaded (tables created) work properly
