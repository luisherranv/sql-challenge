-- 1. Salary matched to each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM public."Employees" as e
LEFT JOIN public."Salaries" as s ON e.emp_no = s.emp_no;

-- 2. Employees hired in 1986
SELECT first_name, last_name, hire_date
FROM public."Employees"
WHERE EXTRACT(YEAR FROM hire_date) = 1986

-- 3. Manager of each department
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM public."Dept_Manager" as dm
LEFT JOIN public."Departments" as d ON dm.dept_no = d.dept_no
LEFT JOIN public."Employees" as e ON dm.emp_no = e.emp_no

-- 4. Employe matched department
CREATE VIEW emp_depts as
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM public."Department_Employees" as de
LEFT JOIN public."Departments" as d ON de.dept_no = d.dept_no
LEFT JOIN public."Employees" as e ON de.emp_no = e.emp_no

SELECT * FROM public.emp_depts

-- 5. Employees named Hercules B.
SELECT first_name, last_name, sex
FROM public."Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6. Employees in Sales Dept;
SELECT emp_no, first_name, last_name
FROM public.emp_depts
WHERE dept_name = 'Sales'

-- 7. Employees in Sales and Development Dept;
SELECT emp_no, first_name, last_name, dept_name
FROM public.emp_depts
WHERE dept_name IN ('Sales', 'Development')

-- 8. Last Name frequency
SELECT last_name, 
COUNT(*) as no_emp
FROM public."Employees"
GROUP BY last_name
ORDER BY no_emp DESC

