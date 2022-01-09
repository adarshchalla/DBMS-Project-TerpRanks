USE BUDT703_Project_0506_01
--Use Case 1

--create view table for this application is created separately
--Application 1
SELECT TOP 20 universityName,avgGRE,avgGMAT,avgGPA, employerReputation
FROM [EmployerReputationAnalysis]
ORDER BY rank


--Use Case 2

--create view table is created separately
-- Application 2
SELECT TOP 10 *
FROM [AverageScoresBschools]
WHERE Average_GMAT > 720
ORDER BY Rank



--1 What are the number of applicants for the respective B-School when the application fee is greater than $200?
SELECT d.universityName, y.noOfApplicants 
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId AND y.applicationFee>200 and y.noOfApplicants IS NOT NULL
ORDER BY noOfApplicants DESC




--2 What are the number of applicants for the respective B-School when the application fee is less than $200?
SELECT d.universityName, y.noOfApplicants 
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId AND y.applicationFee<200 and y.noOfApplicants IS NOT NULL
ORDER BY noOfApplicants DESC

--3 What are the rankings of the B-Schools with application fee greater than $200?
SELECT y.rank, d.universityName, y.noOfApplicants 
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId AND y.applicationFee>200  and y.noOfApplicants IS NOT NULL AND y.rank is not null
ORDER BY y.rank 

--4 As per the students ratings of program content, which ones are the top-5 B schools in 2021?
SELECT  TOP 5 d.universityName, AVG(y.studentRatingsOfProgramme) AS ' Average Student Ratings Of Programme'
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.studentRatingsOfProgramme  IS NOT NULL 
GROUP BY d.universityName
ORDER BY avg(y.studentRatingsOfProgramme) DESC

--5 What are the Top-5 B-Schools as per the rankings in 2021?
SELECT  TOP 5 d.universityName, AVG(y.rank) AS 'Average Rank'
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.rank  IS NOT NULL 
GROUP BY d.universityName
ORDER BY avg(y.rank) ASC

--6 As per the employement rate at graduation, which ones are the top-5 B schools in 2021?

SELECT  TOP 5 d.universityName, AVG(y.empRateAtGraduation) AS 'Employment Rate At Graduation'
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.empRateAtGraduation  IS NOT NULL 
GROUP BY d.universityName
ORDER BY avg(y.empRateAtGraduation) DESC

--7 As per the student ratings of faculty, which ones are the top-5 B schools in 2021?
SELECT  TOP 5 d.universityName, AVG(y.studentRatingsOfFaculty) AS 'Student Rating of Faculty'
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.studentRatingsOfFaculty  IS NOT NULL 
GROUP BY d.universityName
ORDER BY avg(y.studentRatingsOfFaculty) DESC




--8 Rank vs Faculty Student Ratio for 2021
SELECT d.universityName, y.rank, y.facultyStudentRatio
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.facultyStudentRatio  IS NOT NULL  AND y.rank  IS NOT NULL AND y.year = 2021
ORDER BY y.facultyStudentRatio DESC



--9 Ranking Vs Average GRE for 2021

SELECT d.universityName, y.rank, y.avgGRE
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.avgGRE  IS NOT NULL  AND y.rank  IS NOT NULL AND y.year = 2021
ORDER BY y.rank ASC

--10Rank vs Average GMAT for 2021
SELECT d.universityName, y.rank, y.avgGMAT
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.avgGMAT  IS NOT NULL  AND y.rank  IS NOT NULL AND y.year = 2021
ORDER BY y.rank ASC

--11Rank vs Average GPA for 2021

SELECT d.universityName, y.rank, y.avgGPA
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.avgGPA  IS NOT NULL  AND y.rank  IS NOT NULL AND y.year = 2021
ORDER BY y.rank ASC

--12 Rank vs Faculty Student Ratio for 2021

SELECT d.universityName, y.rank, y.facultyStudentRatio
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.facultyStudentRatio  IS NOT NULL  AND y.rank  IS NOT NULL AND y.year = 2021
ORDER BY y.rank ASC


--13 Rank Vs Learning

SELECT   d.universityName, round(AVG(y.learning),0) AS 'Student Rating of Faculty'
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.learning  IS NOT NULL 
GROUP BY d.universityName
ORDER BY avg(y.learning) DESC


--14 Rank for Employment After 3 months for 2021
SELECT d.universityName, y.rank, y.empRateAfterThreeMonths
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.empRateAfterThreeMonths  IS NOT NULL  AND y.rank  IS NOT NULL AND y.year = 2021
ORDER BY y.rank ASC

--15 Rank vs Work Experience for 2021

SELECT d.universityName, y.rank, y.avgWorkExperience
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.avgWorkExperience  IS NOT NULL  AND y.rank  IS NOT NULL AND y.year = 2021
ORDER BY y.rank ASC

--16 Tuition Fee vs Income for 2021

SELECT d.universityName, y.avgOfferedIncome, y.avgTuitionFees
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.avgOfferedIncome IS NOT NULL AND y.avgTuitionFees  IS NOT NULL  AND y.rank  IS NOT NULL AND y.year = 2021
ORDER BY y.avgOfferedIncome ASC


--17 Location vs 30 Top Ranked Schools
SELECT x.addressState, count(x.addressState) AS 'Count of Top 30 Universities in a State'
FROM(
SELECT  TOP 30 d.universityName, avg(y.rank) AS 'RANK', l.addressState
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d, TerpRanks_Location l
WHERE y.universityId=d.universityId  AND y.avgWorkExperience  IS NOT NULL  AND y.rank  IS NOT NULL AND y.year = 2021 
AND l.locationId = d.locationId
GROUP BY d.universityName, l.addressState
ORDER BY avg(y.rank) ASC ) x
group by x.addressState
ORDER BY count(x.addressState) DESC


--18 Rank vs Acceptance Ratio

SELECT d.universityName, y.rank, y.acceptanceRatio
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.acceptanceRatio  IS NOT NULL  AND y.rank  IS NOT NULL AND y.year = 2021
ORDER BY y.rank ASC

--19 Rank vs Employer Reputation

SELECT d.universityName, y.rank, y.employerReputation
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.employerReputation  IS NOT NULL  AND y.rank  IS NOT NULL AND y.year = 2021
ORDER BY y.rank ASC

--20 Rank vs Class Size

SELECT d.universityName, y.rank, y.classSize
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.classSize  IS NOT NULL  AND y.rank  IS NOT NULL AND y.year = 2021
ORDER BY y.rank ASC


--21 Rank vs Networking

SELECT d.universityName, y.rank, y.networking
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.networking  IS NOT NULL  AND y.rank  IS NOT NULL AND y.year = 2021
ORDER BY y.rank ASC




--22 Rank vs PhD Faculty

SELECT d.universityName, y.rank, y.percentageOfFacultyWithPhD
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.percentageOfFacultyWithPhD  IS NOT NULL  AND y.rank  IS NOT NULL AND y.year = 2021
ORDER BY y.rank ASC




--23 Rank vs Avg International Student Ratio

SELECT d.universityName, y.rank, y.internationalStudentRatio
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.internationalStudentRatio  IS NOT NULL  AND y.rank  IS NOT NULL AND y.year = 2021
ORDER BY y.rank ASC

--24 Rank vs Student Rating of Programme

SELECT d.universityName, y.rank, y.studentRatingsOfProgramme
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.studentRatingsOfProgramme  IS NOT NULL  AND y.rank  IS NOT NULL AND y.year = 2021
ORDER BY y.rank ASC

--25 Rank vs Student Rating of Facilities
SELECT d.universityName, y.rank, y.studentRatingsOfFacilities
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.studentRatingsOfFacilities  IS NOT NULL  AND y.rank  IS NOT NULL AND y.year = 2021
ORDER BY y.rank ASC

--26 Rank vs Average Work Experience
SELECT d.universityName, y.rank, y.avgWorkExperience
FROM TerpRanks_UniversityYearRecords y, TerpRanks_UniversityDetails d
WHERE y.universityId=d.universityId  AND y.avgWorkExperience  IS NOT NULL  AND y.rank  IS NOT NULL AND y.year = 2021
ORDER BY y.rank ASC






