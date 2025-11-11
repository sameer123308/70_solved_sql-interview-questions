CREATE database sql_questions;
USE sql_questions;

CREATE TABLE employees1 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    manager_id INT,
    hire_date DATE
);

INSERT INTO employees1 (emp_id, emp_name, department, salary, manager_id, hire_date) VALUES
(1, 'Adam', 'HR', 55000, NULL, '2018-03-15'),
(2, 'Bella', 'Finance', 72000, 1, '2019-06-21'),
(3, 'Chris', 'IT', 85000, 1, '2020-02-10'),
(4, 'David', 'Finance', 72000, 2, '2021-04-12'),
(5, 'Ella', 'IT', 95000, 3, '2022-08-23'),
(6, 'Fiona', 'HR', 60000, 1, '2020-11-30'),
(7, 'George', 'IT', 95000, 3, '2023-07-15'),
(8, 'Alicia', 'Finance', 65000, 2, '2020-05-09'),
(9, 'Hank', 'IT', 85000, 3, '2019-10-04'),
(10, 'Ian', 'Finance', 72000, 2, '2020-09-19');

SELECT * FROM employees1;


-- 1 How to retrive second highest salary of an employee (without subquery)
SELECT distinct salary FROM employees1
ORDER BY salary desc
LIMIT 1
OFFSET 1;

-- with subquery
SELECT MAX(salary) AS second_highest_salary
FROM employees1
WHERE salary < (SELECT MAX(salary) FROM employees1);

-- 2 How do you fetch all emplloyees whose salary is greater than average salary (using subquery)
SELECT * FROM employees1
WHERE salary > (SELECT avg(salary) FROM employees1);

-- 3 Write a query to display current date and time
SELECT current_date() as current_date;
SELECT current_time() as current_time;
SELECT current_timestamp() as current_date_time;  
SELECT NOW() as current_date_time;

-- 4 How do you find duplicate records in table?
SELECT department, COUNT(*) AS count
FROM employees1
GROUP BY department
HAVING COUNT(*) > 1;

-- 5 How do you retrieve the last 10 records from a table?
SELECT * FROM employees1
ORDER BY emp_id DESC
LIMIT 10;

-- 6 How do you fetch the top 5 employees with highest salaries?
SELECT * FROM employees1
ORDER BY salary DESC
LIMIT 5;

-- 7 How do you calculate the total salary of all employees?
SELECT SUM(salary) as total_salary 
FROM employees1;

-- 8 How to write a query to find all employees who joined in the year 2020?
SELECT * FROM employees1
WHERE YEAR(hire_date) = '2020';

-- 9 How to write a query to find employees whose name starts with 'A'
SELECT * FROM employees1
WHERE emp_name LIKE 'A%';

-- 10 How can you find the employees name who do not have any manager?
SELECT * FROM employees1
WHERE manager_id IS NULL;

-- 11 Find the departments with the highest number of employees.
SELECT department, COUNT(*) AS total_emp
FROM employees1
GROUP BY  department
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 12 How to get the count of employees in each department
SELECT department, COUNT(*) AS total_employee_in_each_department
FROM employees1
GROUP BY department;

-- 13 Write a query to update the salary of all employees by 10%
UPDATE employeess1
SET salary = salary * 1.10;

-- 14 How can you find employees whose salary is between 50,000 and 1 lakh.
SELECT * FROM employees1
WHERE salary BETWEEN 50000 AND 100000;

-- 15 How to find the youngest employee in the organization.
SELECT * FROM employees1
ORDER BY hire_date DESC
LIMIT 1;

-- 16 Write a query to find all employees who report to a specific manager
SELECT * FROM employees1
WHERE manager_id = 1;

-- 17 Find total number of departments in the company.
SELECT COUNT(DISTINCT department) as total_department FROM employees1;

-- 18 How to find the department with the lowest average salary.
SELECT department, AVG(salary) as lowest_average_salary_per_dpt
FROM employees1
GROUP BY department 
ORDER BY lowest_average_salary_per_dpt ASC
LIMIT 1;

-- 19 How to delete all employees from a department in a query?
DELETE FROM employees1
WHERE department = 'IT';

-- 20 How to write a query to remove all records from a table but keep the table structure?
TRUNCATE TABLE employees1;

-- 21 How to write a SQL query to display the current month name?
SELECT MONTHNAME(CURDATE());

-- 22 How to convert a string to lowercase?
SELECT LOWER(emp_name) as lower_name FROM employees1;

-- 23 Write a query to fetch employees whose salary is a multiple of 10,000.
SELECT * FROM employees1
WHERE salary % 10000 = 0;

-- 24 How to fetch records where a column has null values?
SELECT * FROM employees1 
WHERE manager_id IS NULL;

-- 25 Write a query to fetch all employees whose name starts with 'n'
SELECT * FROM employees1
WHERE emp_name LIKE '%n';

-- 26 How to write a query to list all employees without a department?
SELECT * FROM employees1
WHERE department IS NULL;

-- 27 Write a query to find the maximum and minimum salary in each department.
SELECT department,
     max(salary) as maximum_salary,
     min(salary) as minimum_salary
 FROM employees1
 GROUP BY department;
     
-- 28 Write a query to display department-wise total salary and average salary.
SELECT department,
     sum(salary) as total_salary,
     avg(salary) as average_salary
 FROM employees1
 GROUP BY department;
 
CREATE TABLE employees11 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    manager_id INT,
    hire_date DATE
);

INSERT INTO employees11 (emp_id, emp_name, department, salary, manager_id, hire_date) VALUES
(1, 'Adam', 'HR', 55000, NULL, '2018-03-15'),
(2, 'Bella', 'Finance', 75000, 6, '2022-01-12'),
(3, 'Chris', 'Finance', 90000, 6, '2020-08-19'),
(4, 'Daisy', 'IT', 120000, 8, '2019-06-11'),
(5, 'Evan', 'IT', 85000, 8, '2024-07-01'),
(6, 'Fiona', 'Finance', 95000, NULL, '2017-09-05'),
(7, 'George', 'HR', 50000, 1, '2021-05-22'),
(8, 'Henry', 'IT', 150000, NULL, '2016-02-13'),
(9, 'Ivy', 'HR', 55000, 1, '2023-03-17'),
(10, 'Jack', 'Sales', 60000, 11, '2020-04-02'),
(11, 'Kate', 'Sales', 100000, NULL, '2017-11-28'),
(12, 'Liam', 'Sales', 60000, 11, '2023-10-01'),
(13, 'Mia', 'Finance', 90000, 6, '2021-03-09'),
(14, 'Nina', 'IT', 120000, 8, '2022-08-20'); 

SELECT * FROM employees11;

-- 29 Write a query to fetch employees having highest salary in each department.

/* First, find the maximum salary per department.
Then, compare each employee’s salary with that max using subquery. */

SELECT emp_name, department, salary
FROM employees11 e
WHERE salary = (
    SELECT MAX(salary) 
    FROM employees11 d
    WHERE d.department = e.department
);

-- 30 How to find the second largest value from a table?

/* Find the maximum salary that is smaller than the overall highest salary.
Inner query gets highest salary.
Outer query finds the next maximum below that (i.e., second highest). */

SELECT MAX(salary) as second_highest_salary
FROM employees11
WHERE salary < (
    SELECT MAX(salary) as highest_salary 
    FROM employees11
    );
    
-- 31 How to find employees who do nothave ant subordinates(manager, supervisior)?
/*
1. Inner query: find all manager_ids (people who have subordinates)
2. Outer query: pick employees whose emp_id is NOT in that list
Result: employees with no subordinates
*/

SELECT emp_id, emp_name
FROM employees11
WHERE emp_id NOT IN (
    SELECT DISTINCT manager_id
    FROM employees11
    WHERE manager_id IS NOT NULL
);

-- 32 Write a query to fetch the details of employees with the same salary (salary occurs more than once)
/*
Step 1: Think in words
1. Identify salaries that appear more than once.
Use GROUP BY salary and HAVING COUNT(*) > 1.
2. Get all employees whose salary is in that list.
*/

-- 1. Inner query: find salaries occurring more than once
-- 2. Outer query: fetch employee details whose salary matches these repeated salaries
-- Result: employees sharing the same salary

SELECT *
FROM employees11
WHERE salary IN (
    SELECT salary
    FROM employees11
    GROUP BY salary
    HAVING COUNT(*) > 1
);

-- 33 Write a query to get employees who belongs to departments with less than 3 employees.

/* 
Step 1: Think in words
1. Count employees in each department → GROUP BY department.
2. Find departments with count < 3 → HAVING COUNT(*) < 3.
3. Fetch all employees who belong to those departments.
*/

SELECT *
FROM employees11
WHERE department IN (
    SELECT department
    FROM employees11
    GROUP BY department
    HAVING COUNT(*) < 3
);

-- 33 How to write a query to find employees with the same first name? 

-- (this only works when our table have separate first_name column) our table does not have so query will show error

SELECT *
FROM employees11
WHERE first_name IN (
    SELECT first_name
    FROM employees11
    GROUP BY first_name
    HAVING COUNT(*) > 1
);



-- 34 How to list all employees in departments that have not hired in past 2 years?
-- problem: Find all employees who belong to departments that haven’t hired anyone in the past 2 years.

-- Inner query:
--   Groups employees by department and finds the latest hire date per department.
--   Keeps only those departments where the latest hire date is older than 2 years.
-- Outer query:
--   Fetches all employees belonging to those departments.
-- Result:
--   Employees working in departments that haven’t hired anyone in the last 2 years.
-- HAVING filters departments based on their most recent hire date.
-- It keeps only those where the last hire was more than 2 years ago.

SELECT *
FROM employees11
WHERE department IN (
    SELECT department
    FROM employees11
    GROUP BY department
    HAVING MAX(hire_date) < DATE_SUB(CURDATE(), INTERVAL 2 YEAR)
);

-- 35 Write a query to find all employees who earn more than the average salary of their department.

-- Step 1: Think in words
-- For each employee, calculate the average salary of their department.
-- Then check if the employee’s salary > that department’s average.

/*
Correlated subquery: inner query depends on outer query's department.
For each employee, inner query calculates the average salary of that department.
Outer query compares employee's salary with that average.
Result: employees earning more than their department's average salary.
*/

SELECT emp_id, emp_name, department, salary
FROM employees11 e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees11 d
    WHERE d.department = e.department
);

-- 36 How to list all managers who have more than 5 subordinates?

/*
Step 1: What does it mean?
Let’s understand the terms first:
Term	Meaning
Manager	A person who supervises or manages other employees.
Subordinate	An employee who reports to a manager (their manager_id = that manager’s emp_id).
So basically:
Each employee has a manager_id.
That manager_id is the emp_id of another employee (the manager).
If many employees have the same manager_id, that means they all report to the same manager.
We need to find all managers who have more than 5 people reporting to them.
*/

-- Inner query groups employees by manager_id and counts subordinates.
-- HAVING COUNT(*) > 5 filters managers with more than 5 subordinates.
-- Outer query finds names of those managers using emp_id IN (subquery).

SELECT emp_name, emp_id
FROM employees11
WHERE emp_id IN (
    SELECT manager_id
    FROM employees11
    WHERE manager_id IS NOT NULL
    GROUP BY manager_id
    HAVING COUNT(*) > 5
);

-- 37 How to find employees whose salary is in top 10%  (classic N% problem)


-- =========================================================
-- 🧾 SQL DATASET SCRIPT FOR EMPLOYEE QUERIES
-- =========================================================

DROP TABLE IF EXISTS Employees1;

CREATE TABLE Employees1 (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BirthDate DATE,
    HireDate DATE,
    Salary DECIMAL(10, 2),
    DepartmentID INT
);

INSERT INTO Employees1 (FirstName, LastName, BirthDate, HireDate, Salary, DepartmentID)
VALUES
('Ajay', 'Kumar', '1998-01-15', '2010-06-01', 60000.28, 1),
('Ashish', 'Tyagi', '1985-02-20', '2012-09-15', 75000.60, 2),
('Sachin', 'Dixit', '1979-03-10', '2011-04-20', 80000.01, 1),
('Richa', 'Mittal', '1990-07-12', '2015-01-05', 70000.90, 3),
('Aditi', 'Bhardwaj', '1988-11-30', '2013-10-10', 68000.10, 2),
('Rohit', 'Sharma', '1994-05-22', '2019-07-19', 72000.50, 3),
('Priya', 'Singh', '1996-11-05', '2021-09-23', 56000.00, 1),
('Vikas', 'Mehta', '1980-04-02', '2008-02-11', 95000.75, 4),
('Neha', 'Rao', '1992-03-14', '2020-10-25', 63000.20, 4),
('Deepak', 'Patel', '1999-08-19', '2023-05-15', 40000.00, 2),
('Sunita', 'Verma', '1983-12-22', '2007-11-28', 105000.00, 4),
('Ankit', 'Gupta', '1990-09-30', '2018-03-10', 67000.00, 1),
('Meena', 'Chopra', '1987-06-18', '2016-02-05', 89000.50, 3),
('Rahul', 'Nair', '1993-01-09', '2020-01-22', 64000.40, 2),
('Tanya', 'Kaur', '1997-12-01', '2024-04-17', 52000.00, 4);

SELECT * FROM Employees1;

-- 38. Write a query to find the employees who joined in the year 2020.
SELECT FirstName, LastName, HireDate
FROM Employees1
WHERE YEAR(HireDate) = 2020;

--  39 Write a query to display all employees who have been in the company for more than 5 years.

-- preferred way
SELECT *
FROM Employees1
WHERE TIMESTAMPDIFF(YEAR, HireDate, CURDATE()) > 5;

-- other way
SELECT *
FROM Employees1
WHERE DATEDIFF(CURDATE(), HireDate) > 1825;

-- 40 Write a query to list employees hired in the last 6 months.

-- DATE_SUB(CURDATE(), INTERVAL 6 MONTH) returns the date six months ago

SELECT *
FROM Employees1
WHERE HireDate >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);


-- 41 Count employees whose names start and end with the same letter
-- LEFT() and RIGHT() extract first and last characters of the first name

SELECT COUNT(*) AS Same_Start_End_Name
FROM Employees1
WHERE LOWER(LEFT(FirstName, 1)) = LOWER(RIGHT(FirstName, 1));


-- 42 Retrieve employees’ names and salaries in a single string
-- CONCAT() merges first name, last name, and salary into one field

SELECT CONCAT(FirstName, ' ', LastName, ' earns ₹', Salary) AS EmployeeSalary
FROM Employees1;


-- 43 write a query to Delete employees who have been in the company for more than 15 years
-- Be cautious: this permanently removes rows

DELETE FROM Employees1
WHERE TIMESTAMPDIFF(YEAR, HireDate, CURDATE()) > 15;

-- other way
DELETE FROM Employees1
WHERE DATEDIFF(CURDATE(), hire_date) > 5475;


-- 44 List employees with more than 5 years of experience in each department
-- GROUP BY DepartmentID to categorize by department




-- 45 Display employees grouped by their age (20–30, 30–40, etc.)

-- when we have column named age so we can use this query.

/*
SELECT CASE
  WHEN age BETWEEN 20 AND 30 THEN '20-30'
  WHEN age BETWEEN 31 AND 40 THEN '31-40'
  ELSE '41+'
END AS age_bracket,
COUNT(*)
FROM employees1
GROUP BY age_bracket;
*/

/* TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) calculates the age in years by comparing the birth date with the current date.
It doesn’t depend on an existing age column.
This is more dynamic and accurate, especially when ages change every year.
Works perfectly even if your table only has BirthDate.
Automatically updates with time — no need to update age manually. 
*/

-- TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) calculates age

SELECT 
    CASE
        WHEN TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) BETWEEN 20 AND 29 THEN '20-29'
        WHEN TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) BETWEEN 30 AND 39 THEN '30-39'
        WHEN TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50+'
    END AS AgeRange,
    COUNT(*) AS TotalEmployees
FROM Employees1
GROUP BY AgeRange;


-- 46 write a query to Display the hire date and day of the week for each employee
-- DAYNAME() returns the weekday name (e.g., Monday)
SELECT 
    FirstName, LastName, 
    HireDate,
    DAYNAME(HireDate) AS day_of_week
FROM Employees1;


-- 47 how to Find employees who are older than 30 years

-- preferred way 
-- Use TIMESTAMPDIFF to compute current age

SELECT *
FROM Employees1
WHERE TIMESTAMPDIFF(YEAR, BirthDate, CURDATE()) > 30;

-- another way it doesnt handle leap years
SELECT *
FROM employees
WHERE DATEDIFF(CURDATE(), birth_date) / 365 > 30;



--  48 Display employees grouped by salary range (e.g., 0–20k, 20k–50k, etc.)

-- Salary grouping done via CASE expressions

SELECT 
    CASE
        WHEN Salary BETWEEN 0 AND 20000 THEN '0-20K'
        WHEN Salary BETWEEN 20001 AND 50000 THEN '20K-50K'
        WHEN Salary BETWEEN 50001 AND 100000 THEN '50K-100K'
        ELSE '100K+'
    END AS SalaryRange,
    COUNT(*) AS EmployeeCount
FROM Employees1
GROUP BY SalaryRange;

-- 49 Write a query to display employee names and hire dates in the format "Name - MM/DD/YYYY".

SELECT CONCAT(Firstname, ' ',  DATE_FORMAT(hiredate, '%m/%d/%Y')) AS Employee_info
FROM Employees1;

-- if we have to combine first_name, last_name(two different columns)

SELECT 
    CONCAT(Firstname, ' ', Lastname, ' - ', DATE_FORMAT(hiredate, '%m/%d/%Y')) AS Employee_Info
FROM Employees1;


-- 50 How to fetch the first and last record from a table?
-- 51 Write a query to calculate the total sales per customer in a sales table.
-- 52 Write a query to find the total number of employees in each job title.
-- 53 Write a query to update salaries of employees based on their department.
-- 54 Write a query to list all employees working under the same manager.
-- 55 Write a query to find all employees whose email contains the domain @example.com.
-- 56 Write a query to list all employees who do not have a bonus.
-- 57 Write a query to display the highest, lowest, and average salary for each job title.


DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Sales;
SET SQL_SAFE_UPDATES = 0;

-- =========================================================
-- Create Sales Table (for total sales per customer)
-- =========================================================
CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2)
);

INSERT INTO Sales (customer_id, amount) VALUES
(1, 250.00),
(1, 150.50),
(2, 400.00),
(2, 75.25),
(3, 500.00),
(3, 120.75);

SELECT * FROM Sales;

-- =========================================================
-- Create Employees Table (for all other queries)
-- =========================================================
CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    job_title VARCHAR(50),
    department VARCHAR(50),
    manager_id INT,
    email VARCHAR(100),
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2)
);

INSERT INTO Employees (name, job_title, department, manager_id, email, salary, bonus) VALUES
('Alice', 'Data Analyst', 'IT', 5, 'alice@example.com', 55000, 5000),
('Bob', 'Data Analyst', 'IT', 5, 'bob@example.com', 52000, NULL),
('Charlie', 'HR Executive', 'HR', 6, 'charlie@companymail.com', 45000, 0),
('David', 'HR Manager', 'HR', NULL, 'david@example.com', 70000, 8000),
('Evelyn', 'IT Manager', 'IT', NULL, 'evelyn@example.com', 85000, 10000),
('Frank', 'Sales Executive', 'Sales', 7, 'frank@example.com', 48000, NULL),
('Grace', 'Sales Manager', 'Sales', NULL, 'grace@example.com', 90000, 12000),
('Hannah', 'Developer', 'IT', 5, 'hannah@example.com', 60000, 0),
('Ivy', 'Developer', 'IT', 5, 'ivy@companymail.com', 61000, 2000);

SELECT * FROM Employees;

-- 50 How to fetch the first and last record from a table?

-- First record (based on employee_id)
SELECT *
FROM Employees
ORDER BY employee_id ASC
LIMIT 1;

-- Last record (based on employee_id)
SELECT *
FROM Employees
ORDER BY employee_id DESC
LIMIT 1;

-- Both together
(SELECT * FROM Employees ORDER BY employee_id ASC LIMIT 1)
UNION ALL
(SELECT * FROM Employees ORDER BY employee_id DESC LIMIT 1);

-- 51 Write a query to calculate the total sales per customer in a sales table.

SELECT 
  customer_id, 
  SUM(amount) AS total_sales
FROM Sales
GROUP BY customer_id;

-- 52 Write a query to find the total number of employees in each job title.

SELECT 
  job_title, 
  COUNT(*) AS total_employees
FROM Employees
GROUP BY job_title;

-- 53 Write a query to update salaries of employees based on their department.
-- Example: 10% raise for IT, 5% for HR, no change for others.

UPDATE Employees
SET salary =
  CASE 
    WHEN department = 'IT' THEN salary * 1.10
    WHEN department = 'HR' THEN salary * 1.05
    ELSE salary
  END;
  
  -- see updated records
  SELECT * FROM  Employees;

-- 54 Write a query to list all employees working under the same manager. (example working under the manager who has id 5)

SELECT *
FROM Employees
WHERE manager_id = 5;


-- 55 Write a query to find all employees whose email contains the domain @example.com.

SELECT *
FROM Employees
WHERE email LIKE '%@example.com';

-- 56 Write a query to list all employees who do not have a bonus.
-- Returns all employees missing a bonus (NULL or 0).

-- one way
SELECT *
FROM Employees
WHERE bonus IS NULL;

-- other way both depends on column
SELECT *
FROM Employees
WHERE bonus = 0;

-- 57 Write a query to display the highest, lowest, and average salary for each job title.

SELECT 
  job_title,
  MAX(salary) AS highest_salary,
  MIN(salary) AS lowest_salary,
  AVG(salary) AS average_salary
FROM Employees
GROUP BY job_title;


--  Q58. How to get the nth highest salary? 
--  Q59. How can you delete duplicate rows? 
--  Q60. How to find the second highest salary for each department? 
--  Q61. How to find the top 3 highest paid employees in each department? 
--  Q62. How to find the average salary of top 5 highest paid employees in each department? 

-- Create table
CREATE TABLE employees2 (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);

-- Insert sample records
INSERT INTO employees2 (emp_id, emp_name, department, salary, hire_date) VALUES
(101, 'John Smith', 'IT', 90000, '2020-01-10'),
(102, 'Alice Brown', 'IT', 85000, '2019-11-02'),
(103, 'Robert King', 'IT', 75000, '2021-03-22'),
(104, 'Emma Jones', 'HR', 65000, '2018-06-12'),
(105, 'Olivia Davis', 'HR', 70000, '2020-08-09'),
(106, 'Liam Miller', 'Finance', 95000, '2019-02-19'),
(107, 'Noah Wilson', 'Finance', 85000, '2021-09-14'),
(108, 'Ava Taylor', 'IT', 90000, '2018-07-30'),
(109, 'Sophia White', 'HR', 65000, '2019-05-03'),
(110, 'Mason Lee', 'Finance', 90000, '2022-05-25');

SELECT * FROM employees2;

-- --  Q58. How to get the nth highest salary? (3rd highest salary)

-- USING LIMIT/OFFSET
SELECT DISTINCT salary
FROM employees2
ORDER BY salary DESC
LIMIT 1
OFFSET 2;


-- USING DENSE_RANK() WINDOW FUNCTION + SUBQUERY
SELECT salary
FROM (
SELECT salary,
      DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
FROM employees2      
) ranked
WHERE rnk = 3;


-- USING CTE WITH DENSE_RANK()
WITH salary_ranks AS (
    SELECT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employees2
)
SELECT salary  -- USE DISTINCT IF WANT UNIQUE SALARY WHERE PEOPLE SHARE SAME SALARY
FROM salary_ranks
WHERE rnk = 3;


-- Q59 how can you delete duplicate rows

-- Q60. How to find the second highest salary for each department? 
-- IF WE HAVE TO FIND HIGHEST-PAID EMPLOYEE PER DEPARTMENT JUST WRITE- (WHERE rnk = 1)

-- USING SUBQUERY + DENSE_RANK()
SELECT department, salary
FROM (
    SELECT department,
           salary,
           DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM employees2
) AS ranked_salaries
WHERE rnk = 2;


-- USING CTE + DENSE_RANK()
WITH ranked_salaries AS (
    SELECT department,
           emp_name,
           salary,
           DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
    FROM employees2
)
SELECT department, emp_name, salary
FROM ranked_salaries
WHERE rnk = 2;

--  Q61. How to find the top 3 highest paid employees in each department? 

SELECT *
FROM (
  SELECT *,
         DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
  FROM employees
) AS ranked_employees
WHERE rnk <= 3;

--  Q62. How to find the average salary of top 5 highest paid employees in each department? 



-- Goal: Find the average salary of the top 5 highest-paid employees in each department
-- Step 1: Assign a DENSE_RANK to each employee within their department
-- based on salary in descending order (highest first)
WITH ranked_employees AS (
    SELECT 
        department,
        salary,
        DENSE_RANK() OVER (
            PARTITION BY department           -- restart ranking for each department
            ORDER BY salary DESC                 -- rank highest salary as 1
        ) AS rnk
    FROM employees2
)

-- Step 2: Filter only top 5 salaries (rank <= 5) in each department
-- Step 3: Group by department and calculate the average of those top salaries
SELECT 
    department,
    AVG(salary) AS avg_top_5_salary
FROM ranked_employees
WHERE rnk <= 5
GROUP BY department;

-- Logic Summary:
-- 1. DENSE_RANK() assigns ranks like 1,2,3 per department, skipping duplicates correctly.
-- 2. WHERE rank <= 5 keeps only top 5 unique salary levels per department.
-- 3. AVG(salary) then computes the mean salary of those top 5 salaries per department.


-- complete query
SELECT department,
AVG(salary) AS avg_top_5_salary
FROM (
SELECT department,
salary,
DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rnk
FROM employees2
) AS ranked_employees
WHERE rnk <= 5
GROUP BY department;

-- Q63 How to get the common records from two tables.
-- (we could have used set operator INTERSECT to get common records from two tables but it does not work in MYSQL we can use INNER JOIN)

-- Create first table: table1
CREATE TABLE table1 (
  id INT,
  name VARCHAR(50),
  department VARCHAR(50),
  salary INT
);

-- Create second table: table2
CREATE TABLE table2 (
  id INT,
  name VARCHAR(50),
  department VARCHAR(50),
  salary INT
);

-- Insert sample data into table1
INSERT INTO table1 (id, name, department, salary) VALUES
(1, 'Sameer', 'IT', 50000),
(2, 'Ayesha', 'HR', 60000),
(3, 'Ravi', 'Finance', 55000),
(4, 'Neha', 'IT', 50000);

-- Insert sample data into table2
INSERT INTO table2 (id, name, department, salary) VALUES
(2, 'Ayesha', 'HR', 60000),
(3, 'Ravi', 'Finance', 55000),
(5, 'John', 'IT', 40000),
(6, 'Ali', 'Marketing', 45000);

-- Using INNER JOIN to find records that exist in both tables
SELECT 
    t1.*                         -- Select all columns from table1
FROM 
    table1 t1                    -- Alias 't1' represents table1
INNER JOIN 
    table2 t2                    -- Alias 't2' represents table2
ON  
    t1.id = t2.id                -- Match based on id column
    AND t1.name = t2.name        -- Match based on name column
    AND t1.department = t2.department  -- Match based on department
    AND t1.salary = t2.salary;   -- Match based on salary

-- Explanation:
-- 1. INNER JOIN returns only rows that exist in BOTH tables.
-- 2. The ON condition checks equality for each column that defines a "common record".
-- 3. t1.* means "show all columns from table1" (not from both).
-- 4. You can add or remove AND conditions depending on how many columns should match.
-- 5. This query works as an INTERSECT equivalent in MySQL.

-- Expected Output:
-- id | name  | department | salary
--  2 | Ayesha | HR        | 60000
--  3 | Ravi   | Finance   | 55000


-- Q64 How to write a query to check if a table is empty or not?
-- (method one preferred)

SELECT 
    CASE 
        WHEN COUNT(*) = 0 THEN 'Table is empty'
        ELSE 'Table has data'
    END AS status
FROM table1;

-- Explanation:
-- COUNT(*) counts all rows in table1.
-- If the count is 0, that means the table has no data.
-- The CASE expression returns a human-readable message.

-- (method two) Simple check using LIMIT

-- If you just want to know whether at least one record exists (without counting all rows):

SELECT 1 
FROM table1 
LIMIT 1;

-- If this returns one row (1) → table has data.
-- If it returns no rows → table is empty.
-- This is faster than counting, especially for big tables, because MySQL stops scanning after finding one record.


-- Q65 How to find all employees who work in both departments 101 and 102?

-- GOAL: Find employees who work in BOTH departments 101 and 102

-- Step 1: Create a sample table for demonstration
CREATE TABLE employeesN (
    employee_id INT,
    department_id INT
);

-- Step 2: Insert sample data
INSERT INTO employeesN (employee_id, department_id) VALUES
(1, 101),
(1, 102),
(2, 101),
(3, 102),
(4, 103),
(5, 101),
(5, 102),
(6, 101);


SELECT employee_id                            -- Select employee_id to identify employees
FROM employeesN
WHERE department_id IN (101, 102)            -- Step 4: Consider only departments 101 and 102
GROUP BY employee_id                            -- Step 5: Group all records by each employee
HAVING COUNT(DISTINCT department_id) = 2;     -- Step 6: Keep only employees who appear in BOTH departments
                                           
-- LOGIC EXPLANATION:
-- 1. The WHERE clause filters records to only departments 101 and 102.
-- 2. GROUP BY groups all rows belonging to the same employee together.
-- 3. COUNT(DISTINCT department_id) counts how many unique departments each employee belongs to.
-- 4. If that count = 2 (both 101 and 102), the employee qualifies.
-- 5. Output shows only employees working in BOTH departments.
-- =====================================================

-- Expected Output:
-- +--------------+
-- | employee_id  |
-- +--------------+
-- |      1       |
-- |      5       |
-- +--------------+

-- Q66 How to find employees who joined the company in the same month and year as their manager?
-- (we have to use self join if employees and manager are in same table) even if we have two tables for employee and manager query will be same

-- GOAL: Find employees who joined in the same month and year as their manager

-- Step 1: Create the employees table
CREATE TABLE employees111 (
    employee_id INT,
    name VARCHAR(50),
    manager_id INT,
    join_date DATE
);

-- Step 2: Insert sample data
INSERT INTO employees111 (employee_id, name, manager_id, join_date) VALUES
(1, 'Ravi', NULL, '2020-05-10'),   -- Manager (no manager_id)
(2, 'Neha', 1, '2020-05-25'),      -- Same month/year as Ravi (May 2020)
(3, 'Amit', 1, '2020-06-12'),      -- Different month
(4, 'Priya', 2, '2020-05-15'),     -- Same as her manager Neha
(5, 'Sameer', 1, '2021-05-05');    -- Different year

SELECT * FROM employees111;
-- =====================================================
-- Step 3: Self JOIN to compare employees and their managers
-- =====================================================

SELECT
	e.name AS employee_name,
	m.name AS manager_name,
    e.join_date AS employee_join_date,
    m.join_date AS manager_join_date
FROM employees111 e
JOIN employees111 m 
ON 
    e.manager_id = m.employee_id                   -- Match employee with their manager
    AND MONTH(e.join_date) = MONTH(m.join_date)    -- Same joining month
    AND YEAR(e.join_date) = YEAR(m.join_date);     -- Same joining year

-- =====================================================
-- LOGIC EXPLANATION:
-- 1. 'e' represents employees, 'm' represents managers (both from the same table).
-- 2. e.manager_id = m.employee_id links each employee to their manager.
-- 3. MONTH() and YEAR() functions extract month and year parts of the join date.
-- 4. Only employees whose joining month and year match their manager’s are returned.
-- =====================================================

-- Expected Output:
-- +---------------+--------------+-------------------+-------------------+
-- | employee_name | manager_name | employee_join_date| manager_join_date |
-- +---------------+--------------+-------------------+-------------------+
-- | Neha          | Ravi         | 2020-05-25        | 2020-05-10        |
-- | Priya         | Neha         | 2020-05-15        | 2020-05-25        |
-- +---------------+--------------+-------------------+-------------------+

-- Q67 How to find employees whose salary is higher than their managers salary?

CREATE TABLE employees22 (
    employee_id INT,
    name VARCHAR(50),
    manager_id INT,
    salary DECIMAL(10,2)
);

INSERT INTO employees22 (employee_id, name, manager_id, salary) VALUES
(1, 'Ravi', NULL, 90000),   -- Manager (no manager)
(2, 'Neha', 1, 85000),
(3, 'Amit', 1, 95000),      -- Higher than manager Ravi
(4, 'Priya', 2, 80000),
(5, 'Sameer', 1, 87000);

SELECT * FROM employees22;

-- Find employees whose salary is higher than their manager's salary

SELECT
    e.name AS employee_name,       -- Employee's name
    e.salary AS employee_salary,   -- Employee's salary
    m.name AS manager_name,        -- Manager's name (from same table)
    m.salary AS manager_salary     -- Manager's salary
FROM employees22 e                   -- 'e' is alias for employee table
JOIN employees22 m                    -- 'm' is alias for same table (manager side)
    ON e.manager_id = m.employee_id -- Match each employee to their manager
WHERE e.salary > m.salary;          -- Filter: only employees earning more than their manager

-- Q68 How to calculate the percentage of employees in each department?

CREATE TABLE employees0 (
    employee_id INT,
    name VARCHAR(50),
    department VARCHAR(50)
);

INSERT INTO employees0 (employee_id, name, department) VALUES
(1, 'Ravi', 'HR'),
(2, 'Neha', 'IT'),
(3, 'Amit', 'IT'),
(4, 'Priya', 'Finance'),
(5, 'Sameer', 'IT'),
(6, 'Kiran', 'Finance'),
(7, 'Anjali', 'HR');

SELECT * FROM employees0;

SELECT 
    department,
    COUNT(*) AS total_employees, -- Step 1: Count how many employees are in each department
    
    -- Step 2: Calculate percentage of total employees
    -- (department count ÷ total employees) × 100
    ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employees)), 2)
        AS percentage_of_total
FROM employees0
GROUP BY department; -- Step 3: Group by department to aggregate counts

--  we could have solve this without using round() function

-- Step 1: Count total employees in each department using GROUP BY
-- Step 2: Divide department count by total employees × 100 to get percentage
-- Step 3: No ROUND() used — showing full decimal result as in notes

SELECT 
    department,
    COUNT(*) AS total_employees,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM employees)) AS percentage_of_total
FROM employees0
GROUP BY department;

-- Q69 How to retrieve the year-to-date sales from each customer?

CREATE TABLE sales1 (
    sale_id INT,
    customer_id INT,
    sale_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO sales1 (sale_id, customer_id, sale_date, amount) VALUES
(1, 101, '2025-01-15', 1200.00),
(2, 101, '2025-03-12', 800.00),
(3, 102, '2025-02-05', 1500.00),
(4, 103, '2024-12-20', 950.00),   -- Previous year (not part of 2025 YTD)
(5, 102, '2025-05-25', 700.00),
(6, 103, '2025-04-02', 400.00);

SELECT * FROM sales1;


SELECT 
    customer_id, 
    SUM(amount) AS year_to_date_sales  -- Step 1: Sum all sales for the year per customer
FROM sales1
WHERE YEAR(sale_date) = YEAR(CURDATE()) -- Step 2: Include only records from the current year
GROUP BY customer_id;                   -- Step 3: Group by customer to get total per person


-- less dynamic because we are mentoning year manually (24-01-01)
SELECT 
    customer_id, 
    SUM(amount)
FROM sales1
WHERE sale_date BETWEEN '2024-01-01' AND CURDATE()
GROUP BY customer_id;


-- Q70 Write a query to get all employee records in XML format

-- Q70: Retrieve all employee records in XML format
-- Step 1: Select the required columns from the employees table
-- Step 2: Use FOR XML AUTO to automatically convert the result into XML
-- Note: FOR XML is supported in SQL Server, not MySQL

SELECT 
    employee_id, 
    name, 
    salary
   FROM employees
-- FOR  XML AUTO;   # XML keyword is not supported in MYSQL thats why i commented it
