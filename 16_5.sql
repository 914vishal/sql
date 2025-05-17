CREATE TABLE Students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    grade CHAR(1),
    city VARCHAR(50)
);

INSERT INTO Students (id, name, age, grade, city) VALUES
(1, 'Alice', 19, 'A', 'Mumbai'),
(2, 'Bob', 21, 'B', 'Delhi'),
(3, 'Charlie', 18, 'C', 'Jaipur'),
(4, 'David', 20, 'A', 'Hyderabad'),
(5, 'Eva', 22, 'B', 'Bhopal'),
(6, 'Frank', 17, 'C', 'Chandigarh'),
(7, 'Grace', 19, 'A', 'Chennai');


-- ==>Retrieve all students whose age is greater than 18.

select *from students where age>18;

-- ==>Retrieve students whose grade is not equal to 'A'.

select *from students where grade !='a';

-- ==>Retrieve students whose age is greater than 18 AND grade is 'A'.

select *from students where age between 18 and 21;

-- ==>Retrieve students from Delhi OR Jaipur.

select *from students where city="delhi" or city="jaipur";

-- ==>Retrieve students who are NOT from Mumbai.

select *from students where not city="mumbai";

-- ==>Display each student’s name and their age increased by 1.

select name,age+1 from students;

-- ==>Retrieve students whose age multiplied by 2 is greater than 40.

select *from students where age*2>40;

-- ==>Retrieve students whose name starts with 'A'.

select *from students where name like "a%";

-- ==>Retrieve students whose city ends with 'pur'.

select *from students where city like "%pur";

-- ==>Retrieve students whose name contains the letter 'a' (case-insensitive).

select *from students where name like "%a%";
