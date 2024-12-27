
CREATE TABLE EMP(
	EID INT,
	EName VARCHAR(25),
	Department VARCHAR(25),
	Salary INT,
	JoiningDate DATE,
	City VARCHAR(25)
	
);

INSERT INTO EMP VALUES
(101,'Rahul','Admin',56000,'1990-01-01','Rajkot'),
(102,'Hardik','IT',18000,'1990-09-25','Ahmedabad'),
(103,'Bhavin','HR',25000,'1991-05-14','Baroda'),
(104,'Bhoomi','Admin',39000,'1991-02-08','Rajkot'),
(105,'Rohit','IT',17000,'1990-07-23','Jamnagar'),
(106,'Priya','IT',9000,'1990-10-18','Ahmedabad'),
(107,'Bhoomi','HR',34000,'1991-12-23','Rajkot')

SELECT * FROM EMP

--Part – A:


--1. Display the Highest, Lowest, Label the columns Maximum, Minimum respectively.
SELECT MAX(Salary) as Highest , MIN(Salary) as Lowest from EMP

--2. Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal,respectively.
SELECT COUNT(Salary) as Total_sal , AVG(Salary) as Avrage_sal from EMP

--3. Find total number of employees of EMPLOYEE table.
SELECT COUNT(*) FROM EMP

--4. Find highest salary from Rajkot city.
SELECT MAX(Salary)  FROM EMP WHERE City = 'Rajkot'

--5. Give maximum salary from IT department.
SELECT MAX(Salary)  FROM EMP WHERE Department = 'IT'

--6. Count employee whose joining date is after 8-feb-91.
SELECT COUNT(*)  FROM EMP WHERE JoiningDate > '1991-2-8'

--7. Display average salary of Admin department.
SELECT AVG(Salary)  FROM EMP WHERE Department = 'Admin'

--8. Display total salary of HR department.
SELECT COUNT(Salary)  FROM EMP WHERE Department = 'HR'

--9. Count total number of cities of employee without duplication.
SELECT COUNT(Distinct City)  FROM EMP 

--10. Count unique departments.
SELECT COUNT(Distinct Department)  FROM EMP 

--11. Give minimum salary of employee who belongs to Ahmedabad.
SELECT MIN(Salary)  FROM EMP WHERE City = 'Ahmedabad'

--12. Find city wise highest salary.
SELECT MAX(Salary)  FROM EMP GROUP BY City

--13. Find department wise lowest salary.
SELECT MIN(Salary)  FROM EMP GROUP BY Department

--14. Display city with the total number of employees belonging to each city.
SELECT COUNT(*)  FROM EMP GROUP BY City

--15. Give total salary of each department of EMP table.
SELECT COUNT(Salary)  FROM EMP GROUP BY Department

--16. Give average salary of each department of EMP table without displaying the respective department name.
SELECT AVG(Salary)  FROM EMP GROUP BY Department




--Part – B:

--1. Count the number of employees living in Rajkot.
SELECT COUNT(*) FROM EMP  WHERE CITY = 'Rajkot'

--2. Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
SELECT MAX(Salary)-MIN(Salary) AS DIFFERENCE  FROM EMP

--3. Display the total number of employees hired before 1st January, 1991.
SELECT COUNT(*)  FROM EMP WHERE JoiningDate < '1991-01-01'




--Part – C:
--1. Count the number of employees living in Rajkot or Baroda.
SELECT COUNT(*) FROM EMP WHERE City IN ('Rajkot','Baroda')

--2. Display the total number of employees hired before 1st January, 1991 in IT department.
SELECT COUNT(*)  FROM EMP WHERE JoiningDate < '1991-01-01'

--3. Find the Joining Date wise Total Salaries.
SELECT JoiningDate , COUNT(Salary) FROM EMP GROUP BY JoiningDate

--4. Find the Maximum salary department & city wise in which city name starts with ‘R’.
