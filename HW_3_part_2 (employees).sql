#Блок 2. База данных «Сотрудники»:

use employees;
#1. Выбрать среднюю зарплату по отделам.
SELECT departments.dept_no, 
	departments.dept_name, 
	AVG(salaries.salary) 'Средняя зарплата по отделам'
FROM employees.employees employees
LEFT JOIN (employees.salaries salaries, employees.dept_emp dept_emp, employees.departments departments) ON
	(employees.emp_no = salaries.emp_no AND
	employees.emp_no = dept_emp.emp_no AND
	dept_emp.dept_no = departments.dept_no
)
WHERE dept_emp.to_date = '9999-01-01' AND salaries.to_date = '9999-01-01'
GROUP BY dept_no
ORDER BY dept_no
;

#2. Выбрать максимальную зарплату у сотрудника.
SELECT
  employees.emp_no,
  CONCAT(employees.first_name, ' ', employees.last_name) as name,
  MAX(salaries.salary) as 'Максимальная зарплата'
FROM employees 
  JOIN salaries ON employees.emp_no = salaries.emp_no;

#3. Удалить одного сотрудника, у которого максимальная зарплата.
DELETE FROM employees.employees WHERE emp_no = (
SELECT salaries.emp_no FROM employees.salaries salaries 
WHERE salary = (SELECT MAX(salaries.salary) FROM salaries));

#4. Посчитать количество сотрудников во всех отделах.
SELECT departments.dept_no, 
	departments.dept_name, 
	COUNT(dept_emp.emp_no) 'Численность сотрудников в отделе'
FROM employees.employees employees
LEFT JOIN (employees.salaries salaries, employees.dept_emp dept_emp, employees.departments departments) ON
	(employees.emp_no = salaries.emp_no AND
	employees.emp_no = dept_emp.emp_no AND
	dept_emp.dept_no = departments.dept_no
)
WHERE dept_emp.to_date = '9999-01-01' AND salaries.to_date = '9999-01-01'
GROUP BY dept_no
ORDER BY dept_no
;

#5. Найти количество сотрудников в отделах и посмотреть, сколько всего денег получает отдел.
SELECT departments.dept_no, 
	departments.dept_name, 
	COUNT(1) 'Число сотрудников в отделе', 
	SUM(salaries.salary) 'Сумма заплат'
FROM employees.employees employees
LEFT JOIN (employees.salaries salaries, employees.dept_emp dept_emp, employees.departments departments) ON
	(employees.emp_no = salaries.emp_no AND
	employees.emp_no = dept_emp.emp_no AND
	dept_emp.dept_no = departments.dept_no
)
WHERE dept_emp.to_date = '9999-01-01' AND salaries.to_date = '9999-01-01'
GROUP BY dept_no
ORDER BY dept_no
;
