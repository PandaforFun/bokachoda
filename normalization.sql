create database college;
use college;
CREATE TABLE Course (
CourseCode CHAR(10) PRIMARY KEY,
CourseTitle VARCHAR(50),
Enrollment INT,
Instructor VARCHAR(50),
Students VARCHAR(50)
);
-- here we can see that multiple students can enroll into a single course under single instructor, so converting to 1NF
drop table course;
CREATE TABLE Course (
CourseCode CHAR(10) PRIMARY KEY,
CourseTitle VARCHAR(50),
Enrollment INT,
Instructor VARCHAR(50),
Student1 VARCHAR(50),
Student2 VARCHAR(50),
Student3 VARCHAR(50),
Student4 VARCHAR(50),
Student5 VARCHAR(50)
); -- this will solve the issue of multiple atomic values
-- But now, all attributes are not dependent on the primary key, so creating 2NF
drop table course;
CREATE TABLE Course (
CourseCode CHAR(10) PRIMARY KEY,
CourseTitle VARCHAR(50),
Enrollment INT,
Instructor VARCHAR(50)
);
CREATE TABLE Student (
StudentID INT PRIMARY KEY,
StudentName VARCHAR(50)
);
CREATE TABLE Enrollment (
EnrollmentID INT PRIMARY KEY,
CourseCode CHAR(10),
StudentID INT,
FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode),
FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);
CREATE TABLE Instructor (
InstructorID INT PRIMARY KEY,
InstructorName VARCHAR(50),
CourseCode CHAR(10),
FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode)
); -- Now, every table's attributes are dependent on their primary key
-- But, there are transitive dependencies, so converting to 3NF
CREATE TABLE Course (
CourseCode CHAR(10) PRIMARY KEY,
CourseTitle VARCHAR(50),
Enrollment INT,
InstructorID INT,
FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);
CREATE TABLE Student (
StudentID INT PRIMARY KEY,
StudentName VARCHAR(50)
);
CREATE TABLE Enrollment (
EnrollmentID INT PRIMARY KEY,
CourseCode CHAR(10),
StudentID INT,
FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode),
FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);
CREATE TABLE Instructor (
InstructorID INT PRIMARY KEY,
InstructorName VARCHAR(50)
);
CREATE TABLE CourseInstructor (
CourseCode CHAR(10),
InstructorID INT,
PRIMARY KEY (CourseCode, InstructorID),
FOREIGN KEY (CourseCode) REFERENCES Course(CourseCode),
FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);
-- now the tables are successfully normalized