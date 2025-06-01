CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT
);

INSERT INTO students (id, name, marks) VALUES
(1, 'Aarav', 528),
(2, 'Diya', 465),
(3, 'Vivaan', 552),
(4, 'Anaya', 390),
(5, 'Krishna', 488),
(6, 'Meera', 545),
(7, 'Ishaan', 498),
(8, 'Saanvi', 573),
(9, 'Rohan', 441),
(10, 'Kavya', 534);


-- 1.  create  a stored procedure to get  a student record  by name (use parameter)

DELIMITER //
CREATE PROCEDURE GetStudentByName(IN student_name VARCHAR(50))
BEGIN
    SELECT * FROM students WHERE name = student_name;
END //
DELIMITER ;

CALL GetStudentByName('Vivaan');


-- op:-

+----+--------+-------+
| id | name   | marks |
+----+--------+-------+
|  3 | Vivaan |   552 |
+----+--------+-------+


-- 2. create  a stored procedure to get all the student who scored more than 300 marks 

DELIMITER //
CREATE PROCEDURE GetStudentsAbove300()
BEGIN
    SELECT * FROM students WHERE marks > 300;
END //
DELIMITER ;

CALL GetStudentsAbove300();

-- op:-

+----+---------+-------+
| id | name    | marks |
+----+---------+-------+
|  1 | Aarav   |   528 |
|  2 | Diya    |   465 |
|  3 | Vivaan  |   552 |
|  4 | Anaya   |   390 |
|  5 | Krishna |   488 |
|  6 | Meera   |   545 |
|  7 | Ishaan  |   498 |
|  8 | Saanvi  |   573 |
|  9 | Rohan   |   441 |
| 10 | Kavya   |   534 |
+----+---------+-------+



-- 3. create  a stored procedure to get students who scored 90% or more marks  (total is 600)

DELIMITER //
CREATE PROCEDURE GetTopScorers()
BEGIN
    SELECT * FROM students WHERE marks >= (0.9 * 600);
END //
DELIMITER ;

CALL GetTopScorers();


-- op:-

+----+--------+-------+
| id | name   | marks |
+----+--------+-------+
|  3 | Vivaan |   552 |
|  6 | Meera  |   545 |
|  8 | Saanvi |   573 |
+----+--------+-------+