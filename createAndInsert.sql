CREATE TABLE Sailors (
  sid INT PRIMARY KEY,
  sname VARCHAR(30),
  rating INT,
  age REAL
);

CREATE TABLE Boats (
  bid INT PRIMARY KEY,
  bname VARCHAR(30),
  color VARCHAR(15)
);

CREATE TABLE Reserves (
  sid INT REFERENCES Sailors(sid),
  bid INT REFERENCES Boats(bid),
  day DATE
);

-- Insert Data
INSERT INTO Sailors VALUES
(1, 'John', 5, 25),
(2, 'Bob', 7, 30),
(3, 'Alice', 8, 29),
(4, 'Mark', 5, 22),
(5, 'Ben', 6, 35);

INSERT INTO Boats VALUES
(101, 'Sunshine', 'red'),
(102, 'Seawind', 'green'),
(103, 'WaveRider', 'blue'),
(104, 'OceanStar', 'red'),
(105, 'Coral', 'yellow');

INSERT INTO Reserves VALUES
(1, 101, '2024-05-10'),
(2, 102, '2024-05-11'),
(3, 103, '2024-05-12'),
(1, 104, '2024-05-13'),
(4, 105, '2024-05-14');



SELECT DISTINCT sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid;


SELECT sname
FROM Sailors
WHERE sid IN (
  SELECT r.sid
  FROM Reserves r
  WHERE r.bid IN (
    SELECT b.bid FROM Boats b WHERE b.color = 'red'
  )
);


SELECT s.sname, b.bname
FROM Sailors s
LEFT JOIN Reserves r ON s.sid = r.sid
LEFT JOIN Boats b ON r.bid = b.bid;


SELECT rating, sname, age
FROM Sailors s
WHERE age = (
  SELECT MAX(age)
  FROM Sailors
  WHERE rating = s.rating
);


SELECT DISTINCT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE b.color = 'red';

SELECT s.sname
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid
WHERE b.color IN ('red', 'green')
GROUP BY s.sname
HAVING COUNT(DISTINCT b.color) = 2;

SELECT * FROM Sailors
WHERE sname LIKE 'B%';
