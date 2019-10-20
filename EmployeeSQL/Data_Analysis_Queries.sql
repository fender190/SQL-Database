-- Data Analysis

-- Query #1 List the following details of each employee: 
--employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.first_name, employees.last_name, 
employees.gender, salaries.salary
FROM employees 
JOIN salaries 
ON employees.emp_no = salaries.emp_no;

-- Query #2 List employees who were hired in 1986 (hire_date listed as Y-M-D).
SELECT *
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- Query #3 List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, 
-- first name, and start and end employment dates.
SELECT departments.dept_no,departments.dept_name,dept_managers.emp_no,
employees.emp_no,employees.first_name,employees.last_name,dept_managers.from_date,dept_managers.to_date
FROM departments
JOIN dept_managers ON departments.dept_no = dept_managers.dept_no
JOIN employees ON dept_managers.emp_no = employees.emp_no

-- Query #4 List the department of each employee with the following information: 
--employee number, last name, first name, and department name
SELECT employees.emp_no,employees.first_name,employees.last_name,departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no;

-- Query #5 List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Query #6 List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT employees.emp_no, employees.first_name,employees.last_name,departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

-- Query #7 List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.first_name,employees.last_name,departments.dept_name
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development';

-- Query #8 In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name
SELECT last_name, COUNT(last_name) AS Last_Name_Frequency
FROM employees
GROUP BY last_name
ORDER BY Last_Name_Frequency DESC;

