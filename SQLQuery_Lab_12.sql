-- Creating the DEPT table first as it is referenced in the PERSON table
CREATE TABLE DEPT (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50) NOT NULL
);

-- Insert data into DEPT table
INSERT INTO DEPT (DepartmentID, DepartmentName, DepartmentCode, Location) VALUES 
(1, 'Admin', 'Adm', 'A-Block'),
(2, 'Computer', 'CE', 'C-Block'),
(3, 'Civil', 'CI', 'G-Block'),
(4, 'Electrical', 'EE', 'E-Block'),
(5, 'Mechanical', 'ME', 'B-Block');

-- Create the PERSON table with a FOREIGN KEY constraint
CREATE TABLE PERSON (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    DepartmentID INT FOREIGN KEY REFERENCES DEPT(DepartmentID),
    Salary DECIMAL(8,2) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    City VARCHAR(100) NOT NULL
);

-- Insert data into PERSON table
INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City) VALUES 
(101, 'Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot'),
(102, 'Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad'),
(103, 'Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda'),
(104, 'Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot'),
(105, 'Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar'),
(106, 'Priya Menpara', NULL, 9000, '2000-10-18', 'Ahmedabad'),
(107, 'Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot'),
(108, 'Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot'),
(109, 'Mehul Bhundiya', 4, 13500, '2005-01-09', 'Baroda'),
(110, 'Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar');

-- Part A Queries

-- 1. Find all persons with their department name & code.
SELECT p.PersonName, d.DepartmentName, d.DepartmentCode
FROM PERSON p
LEFT JOIN DEPT d ON p.DepartmentID = d.DepartmentID;

-- 2. Find the person's name whose department is in C-Block.
SELECT p.PersonName
FROM PERSON p
JOIN DEPT d ON p.DepartmentID = d.DepartmentID
WHERE d.Location = 'C-Block';

-- 3. Retrieve person name, salary & department name who belongs to Jamnagar city.
SELECT p.PersonName, p.Salary, d.DepartmentName
FROM PERSON p
LEFT JOIN DEPT d ON p.DepartmentID = d.DepartmentID
WHERE p.City = 'Jamnagar';

-- 4. Retrieve person name, salary & department name who does not belong to Rajkot city.
SELECT p.PersonName, p.Salary, d.DepartmentName
FROM PERSON p
LEFT JOIN DEPT d ON p.DepartmentID = d.DepartmentID
WHERE p.City != 'Rajkot';

-- 5. Retrieve person’s name of the person who joined the Civil department after 1-Aug-2001.
SELECT p.PersonName
FROM PERSON p
JOIN DEPT d ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Civil'
AND p.JoiningDate > '2001-08-01';

-- 6. Find details of all persons who belong to the Computer department.
SELECT p.*
FROM PERSON p
JOIN DEPT d ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer';

-- 7. Display all the person's name with the department whose joining date difference with the current date is more than 365 days.
SELECT p.PersonName, d.DepartmentName
FROM PERSON p
JOIN DEPT d ON p.DepartmentID = d.DepartmentID
WHERE DATEDIFF(DAY, p.JoiningDate, GETDATE()) > 365;

-- 8. Find department-wise person counts.
SELECT d.DepartmentName, COUNT(p.PersonID) AS PersonCount
FROM DEPT d
LEFT JOIN PERSON p ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- 9. Give department-wise maximum & minimum salary with department name.
SELECT d.DepartmentName, MAX(p.Salary) AS MaxSalary, MIN(p.Salary) AS MinSalary
FROM PERSON p
JOIN DEPT d ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

-- 10. Find city-wise total, average, maximum and minimum salary.
SELECT p.City, SUM(p.Salary) AS TotalSalary, AVG(p.Salary) AS AvgSalary, MAX(p.Salary) AS MaxSalary, MIN(p.Salary) AS MinSalary
FROM PERSON p
GROUP BY p.City;

-- 11. Find the average salary of a person who belongs to Ahmedabad city.
SELECT AVG(Salary) AS AvgSalary
FROM PERSON
WHERE City = 'Ahmedabad';

-- 12. Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department.
SELECT CONCAT(p.PersonName, ' lives in ', p.City, ' and works in ', d.DepartmentName, ' Department.') AS PersonInfo
FROM PERSON p
JOIN DEPT d ON p.DepartmentID = d.DepartmentID;

-- Part B Queries

-- 1. Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly.
SELECT CONCAT(p.PersonName, ' earns ', p.Salary, ' from ', d.DepartmentName, ' department monthly.') AS PersonEarnings
FROM PERSON p
JOIN DEPT d ON p.DepartmentID = d.DepartmentID;

-- 2. Find city & department-wise total, average & maximum salaries.
SELECT p.City, d.DepartmentName, SUM(p.Salary) AS TotalSalary, AVG(p.Salary) AS AvgSalary, MAX(p.Salary) AS MaxSalary
FROM PERSON p
JOIN DEPT d ON p.DepartmentID = d.DepartmentID
GROUP BY p.City, d.DepartmentName;

-- 3. Find all persons who do not belong to any department.
SELECT PersonName
FROM PERSON
WHERE DepartmentID IS NULL;

-- 4. Find all departments whose total salary is exceeding 100000.
SELECT d.DepartmentName, SUM(p.Salary) AS TotalSalary
FROM PERSON p
JOIN DEPT d ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING SUM(p.Salary) > 100000;

-- Part C Queries

-- 1. List all departments who have no person.
SELECT d.DepartmentName
FROM DEPT d
LEFT JOIN PERSON p ON d.DepartmentID = p.DepartmentID
WHERE p.PersonID IS NULL;

-- 2. List out department names in which more than two persons are working.
SELECT d.DepartmentName
FROM PERSON p
JOIN DEPT d ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(p.PersonID) > 2;

-- 3. Give a 10% increment in the computer department employee’s salary.
UPDATE PERSON
SET Salary = Salary * 1.10
WHERE DepartmentID = (SELECT DepartmentID FROM DEPT WHERE DepartmentName = 'Computer');
