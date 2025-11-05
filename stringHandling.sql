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

SELECT UPPER(sname) AS UpperName,
       LOWER(sname) AS LowerName,
       LENGTH(sname) AS NameLength,
       SUBSTRING(sname, 1, 3) AS First3Chars
FROM Sailors;
