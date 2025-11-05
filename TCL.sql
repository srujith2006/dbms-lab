BEGIN;

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

UPDATE Sailors SET rating = 10 WHERE sid = 1;

SAVEPOINT sp1;

UPDATE Sailors SET rating = 5 WHERE sid = 2;

ROLLBACK TO sp1;

COMMIT;
