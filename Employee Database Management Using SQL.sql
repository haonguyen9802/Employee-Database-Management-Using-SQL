#In the table “Employee”, choose all the Female employees whose employee ID is more than 10200 – list all columns and get only 50 result
SELECT *
FROM employees.employees
WHERE gender = 'F' AND emp_no > 10200
LIMIT 50;

#In the table “Employee”, choose all the employees whose name is either Denis/ Giri – list all columns
SELECT *
FROM employees.employees
WHERE (first_name = 'Denis'OR first_name = 'Giri') OR (last_name = 'Denis' or last_name = 'Giri');

#Choose all the employees whose name is “Shen” & Gender is either Males/ Females – list only first, last names and gender
SELECT first_name, last_name, gender
FROM employees.employees
WHERE (first_name = 'Shen' or last_name = 'Shen') AND (gender = 'F' or gender = 'M');

#Choose all the Female employees whose first name is either Denis/ Elvis – list all columns
SELECT *
FROM employees.employees
WHERE gender = 'F' AND (first_name = 'Denis' OR first_name = 'Elvis');

#Choose all the employees except for those whose first name is either John/ Mark/ Jacob – list all column and get only 200 results observations
SELECT *
FROM employees.employees
WHERE first_name NOT IN ('John', 'Mark', 'Jacob')
LIMIT 200;

#Retrieve a list with all employees who were born in 1950s
SELECT *
FROM employees.employees
WHERE birth_date BETWEEN '1950-01-01' AND '1959-12-31';

#Choose all individuals whose first name does not start with “M”
SELECT *
FROM employees.employees
WHERE first_name NOT LIKE '%M'; 

#In the “Titles” table, retrieve the list that has “engineer” in the title
SELECT *
FROM employees.titles
WHERE title LIKE '%engineer';

#In the “Employees” tables, retrieve a list with all employees whose employee number is written with 5 characters, and start with “100”
SELECT *
FROM employees.employees
WHERE emp_no LIKE '%100__';

#Retrieve a list with all employees who were born between Jan 1950 to Oct 1956 – select only birth_date, first, last names and gender and get only 500 results
SELECT birth_date, first_name, last_name, gender
FROM employees.employees
WHERE birth_date BETWEEN '1950-01-01' AND '1956-10-31'
LIMIT 500;

#In the “salaries” table, retrieve a list with all employees whose salary is not in 60000s
SELECT *
FROM employees.salaries
WHERE salary < 60000 OR salary >= 70000;

#In the “titles” table, retrieve the list of all the titles unduplicated which has “staff” in the title unduplicated
SELECT DISTINCT title
FROM employees.titles
WHERE title LIKE '%staff';

#Count the number of unique titles there are
SELECT count(DISTINCT title)
FROM employees.titles;

#Retrieve the average salary of first 200 employees sort this in descending order (there are multiple entries for each employee because of the yearly increments) – also, rename the average salary column to “average_sal”
SELECT emp_no, AVG(salary) AS average_sal
FROM employees.salaries
GROUP BY emp_no
ORDER BY emp_no DESC
LIMIT 200;

#Retrieve the number of Female hires on each date of the year 1986 and sort them by hire date – rename the count of female hires column to “number_of_female_hires”
SELECT hire_date, COUNT(*) AS number_of_female_hires
FROM employees.employees
WHERE gender = 'F' AND hire_date BETWEEN '1986-01-01' AND '1986-12-31'
GROUP BY hire_date
ORDER BY hire_date;