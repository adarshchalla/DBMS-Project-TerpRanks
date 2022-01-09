CREATE VIEW [AverageScoresBschools] AS
SELECT d.universityName , AVG(y.avgGRE) AS 'Average_GRE',AVG(y.avgGMAT) AS 'Average_GMAT',AVG(y.avgGPA) AS 'Average_GPA', AVG(y.rank) AS 'Rank'
FROM [TerpRanks_UniversityYearRecords] y, [TerpRanks_UniversityDetails] d
WHERE y.universityId = d.universityId 
GROUP BY d.universityName
HAVING AVG(y.avgGRE) IS NOT NULL 
AND AVG(y.avgGMAT) IS NOT NULL 
AND AVG(y.avgGPA) IS NOT NULL
AND AVG(y.Rank) IS NOT NULL;