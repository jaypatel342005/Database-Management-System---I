-- 1. Display person name and their department name.
SELECT P.name, D.deptName
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode;

-- 2. Display person's department location.
SELECT P.name, D.location
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode;

-- 3. Display Person's name, Dept name, salary, and city.
SELECT P.name, D.deptName, P.salary, P.city
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode;

-- 4. Display person name, salary, and dept code.
SELECT P.name, P.salary, P.deptCode
FROM Person P;

-- 5. Display personID, name, joining date, and dept name.
SELECT P.personID, P.name, P.joiningDate, D.deptName
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode;

-- 6. Display person name and dept who belongs to Rajkot.
SELECT P.name, D.deptName
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
WHERE P.city = 'Rajkot';

-- 7. Display person name who is sitting in 'C-Block'.
SELECT P.name
FROM Person P
WHERE P.block = 'C-Block';

-- 8. Display person name, dept whose salary is more than 20000.
SELECT P.name, D.deptName
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
WHERE P.salary > 20000;

-- 9. Display person name, dept code who does not belong to Baroda.
SELECT P.name, P.deptCode
FROM Person P
WHERE P.city <> 'Baroda';

-- 10. Display person name who works in the Computer department.
SELECT P.name
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
WHERE D.deptName = 'Computer';

-- 11. Display person's name who joined the Civil department after 1-Aug-2001.
SELECT P.name
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
WHERE D.deptName = 'Civil' AND P.joiningDate > '2001-08-01';

-- 12. Display person's name whose name starts with 'B' in the Electrical department.
SELECT P.name
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
WHERE P.name LIKE 'B%' AND D.deptName = 'Electrical';

-- 13. Display person's name and dept who lives in Ahmedabad and salary less than 20000.
SELECT P.name, D.deptName
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
WHERE P.city = 'Ahmedabad' AND P.salary < 20000;

-- 14. Display person's name whose personID is less than 105 and dept code is 'Cl'.
SELECT P.name
FROM Person P
WHERE P.personID < 105 AND P.deptCode = 'Cl';

-- 15. Display person's name who belongs to Computer or Civil Dept.
SELECT P.name
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
WHERE D.deptName IN ('Computer', 'Civil');

-- 16. Display average salary of the Computer department.
SELECT AVG(P.salary) AS AvgSalary
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
WHERE D.deptName = 'Computer';

-- 17. Display total salary of a department located in 'A-Block'.
SELECT SUM(P.salary) AS TotalSalary
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
WHERE P.block = 'A-Block';

-- 18. Display department-wise highest salary.
SELECT D.deptName, MAX(P.salary) AS MaxSalary
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
GROUP BY D.deptName;

-- 19. Display total salaries in each department.
SELECT D.deptName, SUM(P.salary) AS TotalSalary
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
GROUP BY D.deptName;

-- 20. Count employees per department.
SELECT D.deptName, COUNT(P.personID) AS EmployeeCount
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
GROUP BY D.deptName;

-- 21. Display average salary for employees in 'Rajkot'.
SELECT AVG(P.salary) AS AvgSalary
FROM Person P
WHERE P.city = 'Rajkot';

-- 22. Count of employees per department who joined after the year 2000.
SELECT D.deptName, COUNT(P.personID) AS EmployeeCount
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
WHERE P.joiningDate > '2000-12-31'
GROUP BY D.deptName;

-- 23. Average salary of employees in 'Computer' department grouped by city.
SELECT P.city, AVG(P.salary) AS AvgSalary
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
WHERE D.deptName = 'Computer'
GROUP BY P.city;

-- 24. Sum of salaries for employees who joined before 2001, in each department.
SELECT D.deptName, SUM(P.salary) AS TotalSalary
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
WHERE P.joiningDate < '2001-01-01'
GROUP BY D.deptName;

-- 25. Count of employees per department with salaries above 25000.
SELECT D.deptName, COUNT(P.personID) AS EmployeeCount
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
WHERE P.salary > 25000
GROUP BY D.deptName;

-- 26. Total salary for each department, with departments having more than 2 employees.
SELECT D.deptName, SUM(P.salary) AS TotalSalary
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
GROUP BY D.deptName
HAVING COUNT(P.personID) > 2;

-- 27. Find all departments whose total salary is exceeding 100000.
SELECT D.deptName
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
GROUP BY D.deptName
HAVING SUM(P.salary) > 100000;

-- 28. List all departments that have no person.
SELECT D.deptName
FROM Department D
LEFT JOIN Person P ON P.deptCode = D.deptCode
WHERE P.personID IS NULL;

-- 29. Count of employees in each city per department.
SELECT D.deptName, P.city, COUNT(P.personID) AS EmployeeCount
FROM Person P
JOIN Department D ON P.deptCode = D.deptCode
GROUP BY D.deptName, P.city;