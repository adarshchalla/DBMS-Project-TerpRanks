--Use Case 1

CREATE VIEW [EmployerReputationAnalysis] AS
SELECT d.universityName,y.avgGRE,y.avgGMAT,y.avgGPA, y.employerReputation , y.rank
FROM [TerpRanks_UniversityYearRecords] y, [TerpRanks_UniversityDetails] d
WHERE y.universityId = d.universityId AND y.employerReputation  IS NOT NULL 
AND y.avgGRE IS NOT NULL 
AND y.avgGMAT IS NOT NULL 
AND y.avgGPA IS NOT NULL 
AND y.avgGPA IS NOT NULL
AND y.Rank IS NOT NULL;
