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

SELECT s.sname
FROM Sailors s
WHERE EXISTS (
  SELECT 1
  FROM Reserves r
  JOIN Boats b ON r.bid = b.bid
  WHERE r.sid = s.sid AND b.color = 'red'
);
CREATE VIEW Sailor_Boat_View AS
SELECT s.sname, b.bname, b.color
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid;
SELECT * FROM Sailor_Boat_View;

-- Insert (if view is updatable)
INSERT INTO Sailor_Boat_View VALUES ('Tom', 'WaveRider', 'blue');

-- Update
UPDATE Sailor_Boat_View SET color = 'green' WHERE sname = 'John';

-- Delete
DELETE FROM Sailor_Boat_View WHERE sname = 'Mark';
CREATE MATERIALIZED VIEW Sailor_Boat_MV AS
SELECT s.sname, b.bname, b.color
FROM Sailors s
JOIN Reserves r ON s.sid = r.sid
JOIN Boats b ON r.bid = b.bid;

-- Refresh
REFRESH MATERIALIZED VIEW Sailor_Boat_MV;
