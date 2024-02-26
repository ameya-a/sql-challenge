

-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT f.emp_no, f.last_name, f.first_name, f.sex, i.salary
FROM salaries i
JOIN employees f
ON (i.emp_no = f.emp_no);

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
 
select (first_name) as "First Name", (last_name) as "Last Name",(hire_date) as "Hire Date"
from employees
where extract(year from hire_date) = 1986;


-- 3. List the manager of each department along with their 
-- department number, department name, employee number, last name, and first name.

SELECT f.dept_no, f.dept_name, i.emp_no, s.last_name, s.first_name
FROM dept_manager i
JOIN departments f
ON (i.dept_no = f.dept_no)
JOIN employees AS s
ON (s.emp_no = i.emp_no)

-- 4. List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.

SELECT i.dept_no, s.emp_no, s.last_name, s.first_name, f.dept_name
FROM dept_emp i
JOIN departments f
ON (i.dept_no = f.dept_no)
JOIN employees AS s
ON (s.emp_no = i.emp_no)

-- 5. List first name, last name, and sex of each employee whose first name is 
-- Hercules and whose last name begins with the letter B.

select (first_name) as "First Name", (last_name) as "Sex Name",(sex) as "Sex"
from employees
where first_name = 'Hercules' and last_name like 'B%'

-- *think, goes something "like"

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.

SELECT i.emp_no, s.last_name, s.first_name, f.dept_name
FROM dept_emp i
JOIN departments f
ON (i.dept_no = f.dept_no)
JOIN employees AS s
ON (s.emp_no = i.emp_no)
where dept_name = 'Sales'

-- 7. List each employee in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.

SELECT i.emp_no, s.last_name, s.first_name, f.dept_name
FROM dept_emp i
JOIN departments f
ON (i.dept_no = f.dept_no)
JOIN employees AS s
ON (s.emp_no = i.emp_no)
where dept_name in ('Sales','Development')

-- 8. List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name).

select last_name, COUNT(*) as frequency
from employees
GROUP BY last_name
ORDER BY frequency DESC, last_name;
