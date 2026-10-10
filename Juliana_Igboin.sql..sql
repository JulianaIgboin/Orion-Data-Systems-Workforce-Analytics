USE capstone; 
SELECT * FROM employees;
SELECT * FROM  departments
 JOIN employees USING (department_id);
-- Question 1
SELECT department_name, COUNT(employee_id) AS Employee_Count
FROM employees JOIN departments USING (department_id) 
GROUP BY department_name
ORDER BY Employee_Count DESC;
 -- shipping dept has the highest employee count 

-- Question 2
SELECT department_name, round(AVG(salary), 0) AS average_Salary FROM employees JOIN departments USING( department_id)
GROUP BY department_name
ORDER BY average_Salary DESC;
-- Executive dept has the highest AVG salary, Shipping has the lowest AVG salary


-- Question 3 

SELECT 
CASE
WHEN salary < 5000 THEN 'Low'
WHEN salary BETWEEN 5000 AND 10000 THEN  'Medium'
WHEN  salary > 10000 THEN  'High'
END AS Salary_Bands,
COUNT( employee_id) AS Employee_Count
FROM employees 
GROUP BY  Salary_Bands 
ORDER BY Employee_Count DESC;

SELECT * FROM countries;
SELECT * FROM employees;
SELECT * FROM departments;
SELECT * FROM jobs;


-- Question 4 

SELECT i.country_name, COUNT(DISTINCT d.department_id) AS Number_of_Departments
FROM countries AS i JOIN employees AS o ON i.country_id= o.country_id 
JOIN departments AS d ON d.department_id = o.department_id
GROUP BY i.country_name;

-- Question 5 
SELECT emp_name, salary
FROM employees WHERE salary >(SELECT AVG(salary) FROM employees AS Company_wide_Avg_salary);
SELECT AVG(salary) FROM employees;

-- Question 6 
 WITH Avg_salary AS(
 SELECT job_id, ROUND(AVG(salary), 0) AS Avge_salary FROM employees GROUP BY job_id)
SELECT j.job_title, Avge_salary FROM Avg_salary AS a JOIN jobs AS j USING(job_id)
GROUP BY j.job_title, A.Avge_salary HAVING A.Avge_salary > 12000;

-- Question7 
SELECT o.country_name, SUM(i.salary) AS Total_salaries FROM employees AS i JOIN countries AS o USING (country_id)
GROUP BY o.country_name ORDER BY Total_salaries DESC;

-- QUESTION8 

SELECT i.job_title, o.employee_id FROM jobs AS i LEFT JOIN employees AS o
 USING(job_id) WHERE o.employee_id IS NULL;


