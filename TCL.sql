BEGIN;

UPDATE Sailors SET rating = 10 WHERE sid = 1;

SAVEPOINT sp1;

UPDATE Sailors SET rating = 5 WHERE sid = 2;

ROLLBACK TO sp1;

COMMIT;
