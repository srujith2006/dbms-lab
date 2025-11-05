CREATE TABLE Students (
  StudentID INT PRIMARY KEY,
  StudentName VARCHAR(30),
  Major VARCHAR(30)
);

CREATE TABLE Courses (
  CourseID INT PRIMARY KEY,
  CourseName VARCHAR(30),
  Credits INT
);

CREATE TABLE Enrollments (
  StudentID INT REFERENCES Students(StudentID),
  CourseID INT REFERENCES Courses(CourseID),
  EnrollmentDate DATE
);
SELECT StudentName, Major FROM Students;
SELECT CourseName, Credits FROM Courses;
SELECT c.CourseName, COUNT(e.StudentID) AS NoOfStudents
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseName;
SELECT s.StudentName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.EnrollmentDate > '2024-01-01';
SELECT * FROM Students NATURAL JOIN Enrollments;
SELECT * FROM Students CROSS JOIN Courses;
