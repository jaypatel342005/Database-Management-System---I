--SUBQUERY



-- Create STUDENT_DATA table
CREATE TABLE STUDENT_DATA (
    no INT PRIMARY KEY,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT
);

-- Create ACADEMIC table
CREATE TABLE ACADEMIC (
    Rno INT PRIMARY KEY,
    SPI DECIMAL(3,1),
    Bklog INT
);

-- Create DEPARTMENT table
CREATE TABLE DEPARTMENT (
    DID INT PRIMARY KEY,
    DName VARCHAR(50)
);

-- Step 2: Insert data into tables

-- Insert data into STUDENT_DATA table
INSERT INTO STUDENT_DATA (no, Name, City, DID) VALUES
(101, 'Raju', 'Rajkot', 10),
(102, 'Amit', 'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda', 40),
(104, 'Neha', 'Rajkot', 20),
(105, 'Meera', 'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda', 10);

-- Insert data into ACADEMIC table
INSERT INTO ACADEMIC (Rno, SPI, Bklog) VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);

-- Insert data into DEPARTMENT table
INSERT INTO DEPARTMENT (DID, DName) VALUES
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical'),
(40, 'Civil');

-- Step 3: Write Queries

-- Part – A:

-- 1. Display details of students who are from the computer department
SELECT *
FROM STUDENT_DATA
WHERE DID = (SELECT DID FROM DEPARTMENT WHERE DName = 'Computer');

-- 2. Display names of students whose SPI is more than 8
SELECT Name
FROM STUDENT_DATA
WHERE no IN (SELECT Rno FROM ACADEMIC WHERE SPI > 8);

-- 3. Display details of students from the computer department who belong to Rajkot city
SELECT *
FROM STUDENT_DATA
WHERE City = 'Rajkot' AND DID = (SELECT DID FROM DEPARTMENT WHERE DName = 'Computer');

-- 4. Find the total number of students in the electrical department
SELECT COUNT(*) AS Total_Students
FROM STUDENT_DATA
WHERE DID = (SELECT DID FROM DEPARTMENT WHERE DName = 'Electrical');

-- 5. Display the name of the student who has the maximum SPI
SELECT Name
FROM STUDENT_DATA
WHERE no = (SELECT Rno FROM ACADEMIC WHERE SPI = (SELECT MAX(SPI) FROM ACADEMIC));

-- 6. Display details of students having more than 1 backlog
SELECT *
FROM STUDENT_DATA
WHERE no IN (SELECT Rno FROM ACADEMIC WHERE Bklog > 1);

-- Part – B:

-- 1. Display names of students who are either from the computer department or the mechanical department
SELECT Name
FROM STUDENT_DATA
WHERE DID IN (SELECT DID FROM DEPARTMENT WHERE DName IN ('Computer', 'Mechanical'));

-- 2. Display names of students who are in the same department as the student with Rno 102
SELECT Name
FROM STUDENT_DATA
WHERE DID = (SELECT DID FROM STUDENT_DATA WHERE no = 102);

-- Part – C:

-- 1. Display names of students whose SPI is more than 9 and who are from the electrical department
SELECT Name
FROM STUDENT_DATA
WHERE no IN (SELECT Rno FROM ACADEMIC WHERE SPI > 9)
AND DID = (SELECT DID FROM DEPARTMENT WHERE DName = 'Electrical');

-- 2. Display the name of the student who has the second-highest SPI
SELECT Name
FROM STUDENT_DATA
WHERE no = (
    SELECT Rno FROM ACADEMIC
    WHERE SPI = (
        SELECT MAX(SPI) FROM ACADEMIC
        WHERE SPI < (SELECT MAX(SPI) FROM ACADEMIC)
    )
);

-- 3. Display city names whose students' branch-wise SPI is 9.2
SELECT DISTINCT City
FROM STUDENT_DATA
WHERE no IN (SELECT Rno FROM ACADEMIC WHERE SPI = 9.2);



-- SET Operators 



-- Part – A: 


-- Create the COMPUTER table
CREATE TABLE COMPUTER (
    RollNo INT,
    Name VARCHAR(50)
);

-- Insert data into the COMPUTER table
INSERT INTO COMPUTER (RollNo, Name) VALUES (101, 'Ajay');
INSERT INTO COMPUTER (RollNo, Name) VALUES (109, 'Haresh');
INSERT INTO COMPUTER (RollNo, Name) VALUES (115, 'Manish');

-- Create the ELECTRICAL table
CREATE TABLE ELECTRICAL (
    RollNo INT,
    Name VARCHAR(50)
);

-- Insert data into the ELECTRICAL table
INSERT INTO ELECTRICAL (RollNo, Name) VALUES (105, 'Ajay');
INSERT INTO ELECTRICAL (RollNo, Name) VALUES (107, 'Mahesh');
INSERT INTO ELECTRICAL (RollNo, Name) VALUES (115, 'Manish');

-- 1. Display the names of students who are either in Computer or in Electrical.
SELECT Name FROM COMPUTER
UNION
SELECT Name FROM ELECTRICAL;

-- 2. Display the names of students who are either in Computer or in Electrical, including duplicate data.
SELECT Name FROM COMPUTER
UNION ALL
SELECT Name FROM ELECTRICAL;

-- 3. Display the names of students who are in both Computer and Electrical.
SELECT Name FROM COMPUTER
INTERSECT
SELECT Name FROM ELECTRICAL;

-- 4. Display the names of students who are in Computer but not in Electrical.
SELECT Name FROM COMPUTER
EXCEPT
SELECT Name FROM ELECTRICAL;

-- 5. Display the names of students who are in Electrical but not in Computer.
SELECT Name FROM ELECTRICAL
EXCEPT
SELECT Name FROM COMPUTER;

-- 6. Display all the details of students who are either in Computer or in Electrical.
SELECT RollNo, Name FROM COMPUTER
UNION
SELECT RollNo, Name FROM ELECTRICAL;

-- 7. Display all the details of students who are in both Computer and Electrical.
SELECT COMPUTER.RollNo, COMPUTER.Name 
FROM COMPUTER
JOIN ELECTRICAL ON COMPUTER.RollNo = ELECTRICAL.RollNo;





-- Part – B: 



-- Create the EMP_DATA table
CREATE TABLE EMP_DATA (
    EID INT,
    Name VARCHAR(50)
);

-- Insert data into the EMP_DATA table
INSERT INTO EMP_DATA (EID, Name) VALUES (1, 'Ajay');
INSERT INTO EMP_DATA (EID, Name) VALUES (9, 'Haresh');
INSERT INTO EMP_DATA (EID, Name) VALUES (5, 'Manish');

-- Create the CUSTOMER table
CREATE TABLE CUSTOMER (
    CID INT,
    Name VARCHAR(50)
);

-- Insert data into the CUSTOMER table
INSERT INTO CUSTOMER (CID, Name) VALUES (5, 'Ajay');
INSERT INTO CUSTOMER (CID, Name) VALUES (7, 'Mahesh');
INSERT INTO CUSTOMER (CID, Name) VALUES (5, 'Manish');

-- 1. Display the names of persons who are either Employee or Customer.
SELECT Name FROM EMP_DATA
UNION
SELECT Name FROM CUSTOMER;

-- 2. Display the names of persons who are either Employee or Customer, including duplicate data.
SELECT Name FROM EMP_DATA
UNION ALL
SELECT Name FROM CUSTOMER;

-- 3. Display the names of persons who are both Employee as well as Customer.
SELECT Name FROM EMP_DATA
INTERSECT
SELECT Name FROM CUSTOMER;

-- 4. Display the names of persons who are Employee but not Customer.
SELECT Name FROM EMP_DATA
EXCEPT
SELECT Name FROM CUSTOMER;

-- 5. Display the names of persons who are Customer but not Employee.
SELECT Name FROM CUSTOMER
EXCEPT
SELECT Name FROM EMP_DATA;

-- Part C 


-- Perform all the queries of Part B but display only ID and Name

-- 1. Display the ID and names of persons who are either Employee or Customer.
SELECT EID AS ID, Name FROM EMP_DATA
UNION
SELECT CID AS ID, Name FROM CUSTOMER;

-- 2. Display the ID and names of persons who are either Employee or Customer, including duplicate data.
SELECT EID AS ID, Name FROM EMP_DATA
UNION ALL
SELECT CID AS ID, Name FROM CUSTOMER;

-- 3. Display the ID and names of persons who are both Employee as well as Customer.
SELECT EID AS ID, Name FROM EMP_DATA
JOIN CUSTOMER ON EMP_DATA.Name = CUSTOMER.Name;

-- 4. Display the ID and names of persons who are Employee but not Customer.
SELECT EID AS ID, Name FROM EMP_DATA
WHERE Name NOT IN (SELECT Name FROM CUSTOMER);

-- 5. Display the ID and names of persons who are Customer but not Employee.
SELECT CID AS ID, Name FROM CUSTOMER
WHERE Name NOT IN (SELECT Name FROM EMP_DATA);
