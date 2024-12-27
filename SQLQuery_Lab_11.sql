CREATE TABLE STU_INFO (
	RNo INT,
	Name VARCHAR(25),
	Branch VARCHAR(25),
);

INSERT INTO STU_INFO VALUES
(101,'Raju','CE'),
(102,'Amit','CE'),
(103,'Sanjay','ME'),
(104,'Neha','EC'),
(105,'Meera','EE'),
(106,'Mahesh','EC')

CREATE TABLE RESULT (
	RNo INT,
	SPI DECIMAL(4,2),
);

INSERT INTO RESULT VALUES
(101,8.80),
(102,9.2),
(103,7.6),
(104,8.2),
(105,7.0),
(107,8.9)


--Part � A:


--1. Combine information from student and result table using cross join or Cartesian product.
SELECT * FROM STU_INFO
CROSS JOIN RESULT

--2. Perform inner join on Student and Result tables.
SELECT * FROM STU_INFO
INNER JOIN RESULT
ON STU_INFO.RNo = RESULT.RNo

--3. Perform the left outer join on Student and Result tables.
SELECT * FROM STU_INFO
LEFT JOIN RESULT
ON STU_INFO.RNo = RESULT.RNo

--4. Perform the right outer join on Student and Result tables.
SELECT * FROM STU_INFO
RIGHT JOIN RESULT
ON STU_INFO.RNo = RESULT.RNo

--5. Perform the full outer join on Student and Result tables.
SELECT * FROM STU_INFO
FULL JOIN RESULT
ON STU_INFO.RNo = RESULT.RNo

--6. Display Rno, Name, Branch and SPI of all students.
SELECT STU_INFO.RNo ,  STU_INFO.Branch , STU_INFO.Name ,RESULT.SPI  FROM STU_INFO
LEFT JOIN RESULT 
ON STU_INFO.RNo = RESULT.RNo

--7. Display Rno, Name, Branch and SPI of CE branch�s student only.
SELECT STU_INFO.RNo,STU_INFO.Branch,STU_INFO.Name ,RESULT.SPI  FROM STU_INFO
LEFT JOIN RESULT 
ON STU_INFO.RNo = RESULT.RNo
WHERE STU_INFO.Branch = 'CE'

--8. Display Rno, Name, Branch and SPI of other than EC branch�s student only.
SELECT STU_INFO.RNo,STU_INFO.Branch,STU_INFO.Name ,RESULT.SPI  FROM STU_INFO
LEFT JOIN RESULT 
ON STU_INFO.RNo = RESULT.RNo
WHERE STU_INFO.Branch <> 'EC'

--9. Display average result of each branch.
SELECT AVG(RESULT.SPI) , STU_INFO.Branch
FROM STU_INFO FULL JOIN RESULT
ON STU_INFO.RNo = RESULT.RNo
GROUP BY STU_INFO.Branch

--10. Display average result of CE and ME branch.
SELECT AVG(RESULT.SPI) , STU_INFO.Branch
FROM STU_INFO FULL JOIN RESULT
ON STU_INFO.RNo = RESULT.RNo
GROUP BY STU_INFO.Branch
HAVING STU_INFO.Branch = 'CE' OR STU_INFO.Branch ='ME'



--Part � B:
--1. Display average result of each branch and sort them in ascending order by SPI.
SELECT AVG(RESULT.SPI) , STU_INFO.Branch
FROM STU_INFO FULL JOIN RESULT
ON STU_INFO.RNo = RESULT.RNo
GROUP BY STU_INFO.Branch
ORDER BY AVG(RESULT.SPI) ASC

--2. Display highest SPI from each branch and sort them in descending order.
SELECT MAX(RESULT.SPI) , STU_INFO.Branch
FROM STU_INFO FULL JOIN RESULT
ON STU_INFO.RNo = RESULT.RNo
GROUP BY STU_INFO.Branch
ORDER BY MAX(RESULT.SPI) DESC



--Part � C:
--1. Retrieve the names of employee along with their manager�s name from the Employee table