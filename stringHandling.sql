SELECT UPPER(sname) AS UpperName,
       LOWER(sname) AS LowerName,
       LENGTH(sname) AS NameLength,
       SUBSTRING(sname, 1, 3) AS First3Chars
FROM Sailors;
