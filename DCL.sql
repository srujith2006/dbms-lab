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
