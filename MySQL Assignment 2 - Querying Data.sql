USE employee ;                                     -- Select database                             
SELECT DISTINCT salary                             -- Distinct Values: Retrieve unique salaries from Employees table
FROM Employees;

SELECT age AS Employee_Age, salary AS Employee_Salary   -- Alias: Provide aliases for age and salary columns
FROM Employees;

SELECT * FROM Employees                                           -- Where Clause: Retrieve employees with salary > 50000 and hired before 2016-01-01 
WHERE salary > 50000 AND hire_date < '2016-01-01';

SET SQL_SAFE_UPDATES = 0;                    -- Disable safe update mode to allow mass updates

UPDATE Employees                             -- Fill missing designation with 'Data Scientist'
SET designation = 'Data Scientist' 
WHERE designation IS NULL OR designation = '';

SET SQL_SAFE_UPDATES = 1;                     -- Re-enable safe update mode

SELECT * FROM Employees                                      -- Sorting Data: Sort employees by department_id ASC and salary DESC
ORDER BY department_id ASC, salary DESC;

SELECT * FROM Employees                       -- Row Limiting: Display first 5 employees hired in the year 2018
WHERE YEAR(hire_date) = 2018 
ORDER BY hire_date ASC 
LIMIT 5 ;

SELECT SUM(e.salary) AS Total_Finance_Salary   -- Aggregate Function: Total salary in Finance department
FROM Employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Finance';

SELECT MIN(age) AS Minimum_Age                  -- Aggregate Function: Minimum age among employees
FROM Employees;

SELECT location_id, MAX(salary) AS Max_Salary   -- Group By: Maximum salary for each location
FROM Employees
GROUP BY location_id;

SELECT designation, AVG(salary) AS Avg_Salary   -- Group By: Average salary for designations containing 'Analyst'
FROM Employees
WHERE designation LIKE '%Analyst%'
GROUP BY designation;

SELECT department_id, COUNT(employee_id) AS Employee_Count    -- Having: Departments with less than 3 employees
FROM Employees
GROUP BY department_id
HAVING COUNT(employee_id) < 3;

SELECT location_id, AVG(age) AS Avg_Age     -- Having: Locations with female employees whose average age is below 30
FROM Employees
WHERE gender = 'F'
GROUP BY location_id
HAVING AVG(age) < 30;


SELECT e.employee_name, e.designation, d.department_name     -- Inner Join: List employee names, designations, and department names
FROM Employees e
INNER JOIN Departments d ON e.department_id = d.department_id;


SELECT d.department_name, COUNT(e.employee_id) AS Total_Employees  -- Left Join: List all departments and total employees in each
FROM Departments d
LEFT JOIN Employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;

SELECT l.location_name, e.employee_name             -- Right Join: Display all locations with employee names
FROM Employees e
RIGHT JOIN locations l ON e.location_id = l.location_id;

SELECT d.department_name, l.location_name          -- Cross Join: Show all combinations of departments and locations   
FROM departments d
CROSS JOIN locations l;

SELECT e1.employee_name AS Employee_1, e2.employee_name AS Employee_2, e1.department_id   -- Self Join: Pairs of employees in the same department
FROM Employees e1
JOIN Employees e2 ON e1.department_id = e2.department_id AND e1.employee_id <> e2.employee_id;


SELECT employee_id, employee_name, salary,              -- Window Function: Rank employees by salary overall
RANK() OVER (ORDER BY salary DESC) AS Salary_Rank
FROM Employees;

SELECT employee_id, employee_name, department_id, salary,     -- Window Function: Rank employees by salary within each department
DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS Dept_Salary_Rank
FROM Employees;


SELECT employee_id, employee_name, department_id, salary,     -- Window Function: Running total salary by department  
SUM(salary) OVER (PARTITION BY department_id ORDER BY employee_id) AS Running_Total_Salary
FROM Employees;
