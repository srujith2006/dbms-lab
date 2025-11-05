CREATE TABLE Sailors (
  sid INT PRIMARY KEY,
  sname VARCHAR(30),
  rating INT,
  age REAL
);
INSERT INTO Sailors VALUES
(1, 'John', 5, 25),
(2, 'Bob', 7, 30),
(3, 'Alice', 8, 29),
(4, 'Mark', 5, 22),
(5, 'Ben', 6, 35);

SELECT
  COUNT(*) AS TotalSailors,
  AVG(age) AS AvgAge,
  MAX(age) AS Oldest,
  MIN(age) AS Youngest
FROM Sailors;

CREATE USER student_user IDENTIFIED BY 'student123';

GRANT SELECT, INSERT ON Sailors TO student_user;

-- Revoke INSERT privilege
REVOKE INSERT ON Sailors FROM student_user;
