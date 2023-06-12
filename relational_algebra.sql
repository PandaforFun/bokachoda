create database relational_algebra;

use  relational_algebra;

CREATE TABLE science(
roll INT,
name VARCHAR(30),
marks INT,
PRIMARY KEY (roll)
);
CREATE TABLE maths(
roll INT,
name VARCHAR(30),
marks INT,
PRIMARY KEY (roll)
);

INSERT INTO science VALUES
(33,'Rishav',48),
(45,'Tanishk',91),
(52,'Shreesh',65),
(57,'Aditya',82),
(40,'Pampam',52);

INSERT INTO maths VALUES
(33,'Rishav',78),
(45,'Tanishk',88),
(52,'Shreesh',45),
(57,'Aditya',69);

-- types of relational algebra
-- 1.Selection(selects rows/tuples of data to display)
SELECT * FROM science WHERE marks > 69;

-- 2.Projection(Projects/displays required attributes/columns)
SELECT roll,marks FROM science;
   
-- 3.Union(combines data between 2 tables that have same columns)
SELECT roll,name,marks FROM science
UNION
SELECT roll,name,marks FROM maths;

-- 4.Intersection(only theoritical, cant be applied in query)

-- 5.Difference(displays data not present in another table)
SELECT roll, name, marks FROM science
WHERE roll NOT IN (SELECT roll FROM maths);

-- 6.Cartesian Product(can use cross join for this)
SELECT * FROM science CROSS JOIN maths;

-- 7.Join
-- 7.1.Inner Join
SELECT science.roll, science.name, science.marks, maths.roll, maths.name, maths.marks
FROM science
INNER JOIN maths ON science.roll = maths.roll;
-- 7.2.Left Join
SELECT science.roll, science.name, science.marks, maths.roll, maths.name, maths.marks
FROM science
LEFT JOIN maths ON science.roll = maths.roll;
-- 7.3.Right Join
SELECT science.roll, science.name, science.marks, maths.roll, maths.name, maths.marks
FROM science
RIGHT JOIN maths ON science.roll = maths.roll;
-- 7.4.Full outer join
SELECT science.roll, science.name, science.marks, maths.roll, maths.name, maths.marks
FROM science
LEFT JOIN maths ON science.roll = maths.roll
UNION
SELECT science.roll, science.name, science.marks, maths.roll, maths.name, maths.marks
FROM maths
LEFT JOIN science ON science.roll = maths.roll
WHERE science.roll IS NULL;