CREATE DATABASE temp1;
DROP DATABASE temp1;

CREATE DATABASE college;
USE college;
CREATE TABLE student(
  id INT PRIMARY KEY,
  name VARCHAR(50),
  age INT NOT NULL
);
INSERT INTO student VALUES(1,"ABCD",24);
INSERT INTO student VALUES(2,"PQRS",25);

SELECT * FROM student;

CREATE DATABASE IF NOT EXISTS college;

DROP DATABASE IF EXISTS company; 

SHOW DATABASES;
SHOW TABLES;

CREATE TABLE student1
(
   rollno INT PRIMARY KEY,
   name VARCHAR(50)
);
SELECT * FROM student1;

INSERT INTO student1
(rollno,name)
VALUES
(101,"AB"),
(102,"CD");
SELECT * FROM student1;

INSERT INTO student1 VALUES(103,"EF");
SELECT * FROM student1;

CREATE DATABASE companyXYZ;
USE companyXYZ;
CREATE TABLE employeeINFO
(
  id INT PRIMARY KEY,
  name VARCHAR(50),
  salary INT NOT NULL
);
INSERT INTO employeeINFO VALUES(101,"ABCD",24000);
INSERT INTO employeeINFO VALUES(102,"PQRS",30000);
INSERT INTO employeeINFO VALUES(103,"MNO",40000);

SELECT * FROM employeeINFO;
CREATE TABLE emp
(
 id INT,
 salary INT DEFAULT 25000
);
INSERT INTO emp (id) VALUES(101);
SELECT * FROM emp;

USE college;
CREATE TABLE student_details(
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);
INSERT INTO student_details
(rollno,name,marks,grade,city)
VALUES
(101,"anil",79,"B","Pune"),
(102,"bhumi",63,"C","Mumbai"),
(103,"chetan",94,"A","Mumbai"),
(104,"druv",89,"B","Delhi"),
(105,"eni",58,"D","Delhi"),
(106,"fenil",98,"A","Delhi");

SELECT name,marks FROM student_details;
SELECT * FROM student_details;
SELECT city FROM student_details;
SELECT distinct city FROM student_details;

USE college;
SELECT * FROM student_details WHERE marks > 80;
SELECT * FROM student_details WHERE city = "Mumbai";
SELECT * FROM student_details WHERE marks > 80 AND city = "Mumbai";
SELECT * FROM student_details;
SELECT * FROM student_details WHERE marks > 80 OR city = "Mumbai";
SELECT * FROM student_details WHERE marks BETWEEN 80 AND 90;
SELECT * FROM student_details WHERE city IN ("Delhi","Mumbai");
SELECT * FROM student_details WHERE city IN ("Gujarat");
SELECT * FROM student_details WHERE city IN ("Gujarat");
SELECT * FROM student_details WHERE city NOT IN ("Delhi","Mumbai");
SELECT * FROM student_details LIMIT 3;
SELECT * FROM student_details WHERE marks > 75 LIMIT 3;
SELECT * FROM student_details ORDER BY marks DESC LIMIT 3;
SELECT MAX(marks) FROM student_details;
SELECT AVG(marks) FROM student_details;
SELECT COUNT(rollno) FROM student_details;
SELECT city, COUNT(rollno) FROM student_details GROUP BY city;
SELECT city,name, COUNT(rollno) FROM student_details GROUP BY city,name;

SELECT city, AVG(marks) FROM student_details GROUP BY city ORDER BY AVG(marks) ASC;
SELECT city, AVG(marks) FROM student_details GROUP BY city ORDER BY city ASC;

CREATE DATABASE temp1;
USE temp1;
CREATE TABLE Payment
(
Customer_id INT PRIMARY KEY,
Customer VARCHAR(50),
mode VARCHAR(50),
City VARCHAR(30)
);
USE temp1;
INSERT INTO Payment
(Customer_id,Customer,mode,City)
VALUES
(101,"abc","Netbanking","Portland"),
(102,"efg","Credit Card","Miami"),
(103,"hij","Credit Card","Seattle"),
(104,"tyj","Netbanking","Denver"),
(105,"lkj","Credit Card","New Orieans"),
(106,"DFT","Debit Card","Minneapolis"),
(107,"ABD","Debit Card","Phoenix"),
(108,"smith","Netbanking","Boston"),
(109,"head","Netbanking","Portland"),
(110,"jackson","Credit Card","Boston");

SELECT mode,count(customer) FROM Payment GROUP BY mode;

Select * from Payment;

USE college;
SELECT grade,count(rollno) from student_details GROUP BY grade;

SELECT count(rollno),city
FROM student_details
GROUP BY city
HAVING max(marks) > 90;

SELECT * FROM student_details;

SELECT city
FROM student_details
WHERE grade="A"
GROUP BY city
HAVING max(marks) > 90
ORDER BY city DESC;

SET SQL_SAFE_UPDATES=0;

UPDATE student_details
SET grade= "O"
WHERE grade="A";

SELECT * FROM student_details;

UPDATE student_details
SET marks= "100"
WHERE rollno=105;

SELECT * FROM student_details;

UPDATE student_details
SET grade= "O"
WHERE grade="A";

UPDATE student_details
SET grade="O"
WHERE rollno=105;

UPDATE student_details
SET marks=marks-1;

UPDATE student_details
SET marks= "33"
WHERE rollno=106;

DELETE FROM student_details
WHERE MARKS <40;

SELECT * FROM student_details;
INSERT INTO student_details
(rollno,name,marks,grade,city)
VALUES
(101,"anil",79,"B","Pune"),
(102,"bhumi",63,"C","Mumbai"),
(103,"chetan",94,"A","Mumbai"),
(104,"druv",89,"B","Delhi"),
(105,"eni",58,"D","Delhi"),
(106,"fenil",98,"A","Delhi");

SELECT * FROM student_details;

UPDATE student_details
SET marks= "33"
WHERE rollno=106;

DELETE FROM student_details;

CREATE TABLE dept(
id INT PRIMARY KEY,
name VARCHAR(50)
);
USE college;
CREATE TABLE teacher_details(
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);
INSERT INTO dept
VALUES
(101,"english"),
(102,"IT");

SELECT * FROM dept;
INSERT INTO teacher_details
VALUES
(101,"ABCD",101),
(102,"XYZ",102);
SELECT * FROM teacher_details;

DROP TABLE teacher_details;
UPDATE dept
SET id = 103
WHERE id = 102;

SELECT * FROM student_details;

ALTER TABLE student_details
ADD COLUMN age INT;

ALTER TABLE student_details
DROP COLUMN age;

ALTER TABLE student_details
ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE student_details
MODIFY COLUMN age VARCHAR(2);

ALTER TABLE student_details
CHANGE age STU_age INT;

SELECT * FROM student_details;

DELETE FROM student_details 
WHERE marks < 80;

INSERT INTO student_details
(rollno,name,marks,grade,city,STU_age)
VALUES
(107,"bob",85,"C","Pune",100);

ALTER TABLE student_details
CHANGE name full_name VARCHAR(50);

ALTER TABLE student_details
DROP COLUMN grade;

USE temp1;

CREATE TABLE student(
Student_id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO student
(Student_id,name)
VALUES
(101,"adam"),
(102,"bob"),
(103,"casey");

SELECT * FROM student;

CREATE TABLE student(
Student_id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE course(
Student_id INT PRIMARY KEY,
course VARCHAR(50),
FOREIGN KEY (Student_id) REFERENCES student(Student_id)
);
DROP TABLE course;
SELECT * FROM course;

CREATE TABLE course(
Student_id INT PRIMARY KEY,
course VARCHAR(50)
);

CREATE TABLE Result(
Student_id INT PRIMARY KEY,
name VARCHAR(50),
course VARCHAR(50)
);
DROP TABLE Result;

INSERT INTO course
(Student_id,course)
VALUES
(102,"english"),
(105,"math"),
(103,"science"),
(107,"computer science");

INSERT INTO Result
(Student_id,name,course)
VALUES
(102,"bob","english"),
(103,"casey","science");

SELECT * FROM Result;

SELECT * FROM student INNER JOIN course ON student.Student_id = course.Student_id;

SELECT * FROM student LEFT JOIN course ON student.Student_id = course.Student_id;

SELECT * FROM student as a Right JOIN course as b ON a.Student_id = b.Student_id;

SELECT * FROM student as a LEFT JOIN course as b ON a.Student_id = b.Student_id
UNION
SELECT * FROM student as a Right JOIN course as b ON a.Student_id = b.Student_id;



SELECT * FROM student;
SELECT * FROM course;

DROP TABLE Result;
#left exclusive join
SELECT * 
FROM student as a 
LEFT JOIN course as b 
ON a.Student_id = b.Student_id
WHERE b.Student_id IS NOT NULL;

SELECT * 
FROM student as a 
RIGHT JOIN course as b 
ON a.Student_id = b.Student_id
WHERE a.Student_id IS NULL;

CREATE TABLE employee(
id INT PRIMARY KEY,
name VARCHAR(50),
manager_id INT
);

INSERT INTO employee
(id,name,manager_id)
VALUES
(101,"adam",103),
(102,"bob",104),
(103,"casey",NULL),
(104,"donald",103);

SELECT * FROM employee;

SELECT a.name as manger_name,b.name
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

USE college;
SELECT * FROM student_details;

USE temp1;
CREATE TABLE student_details(
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL
);
INSERT INTO student_details
(rollno,name,marks)
VALUES
(101,"anil",79),
(102,"bhumi",63),
(103,"chetan",94),
(104,"druv",89),
(105,"eni",58),
(106,"fenil",98);

SELECT * FROM student_details;
SELECT avg(marks) FROM student_details;

SELECT name,marks
FROM student_details
WHERE marks > 80.1667;

SELECT name,marks
FROM student_details
WHERE marks > (SELECT avg(marks) FROM student_details);

SELECT rollno
FROM student_details
WHERE rollno % 2 = 0;


SELECT name,rollno
FROM student_details
WHERE rollno IN (
SELECT rollno
FROM student_details
WHERE rollno % 2 = 0);

CREATE VIEW view1 AS
SELECT rollno,name FROM student_details;
SELECT * FROM view1;
DROP  VIEW view1;
SELECT * FROM view1;