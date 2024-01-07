#HR DATA ASSESSMENT SOLUTIONS
USE hr_analysis;

#1)Retrieve the total number of employees in the dataset.
SELECT COUNT(EmployeeID) AS "Total Employees" FROM general_data;

#2)List all unique job roles in the dataset.
SELECT DISTINCT(JobRole) AS JobRole FROM general_data;

#3)Find the average age of employees.
SELECT AVG(Age) FROM general_data;

#4)Retrieve the names and ages of employees who have worked at the company for more than 5 years.
SELECT Emp_Name,Age,YearsAtCompany FROM general_data WHERE YearsAtCompany > 5;

#5)Get a count of employees grouped by their department.
SELECT COUNT(EmployeeID),Department FROM general_data GROUP BY department;

#6)List employees who have 'High' Job Satisfaction.
SELECT general_data.Emp_Name FROM general_data JOIN employee_survey ON general_data.EmployeeID= employee_survey.EmployeeID WHERE employee_survey.JobSatisfaction =3;

#7)Find the highest Monthly Income in the dataset.
SELECT MAX(MonthlyIncome) FROM general_data;

#8)List employees who have 'Travel_Rarely' as their BusinessTravel type.
SELECT Emp_Name,BusinessTravel FROM general_data WHERE BusinessTravel="Travel_Rarely";

#9)Retrieve the distinct MaritalStatus categories in the dataset. 
SELECT DISTINCT(MaritalStatus) FROM general_data;

#10)Get a list of employees with more than 2 years of work experience but less than 4 years in their current role.
SELECT Emp_Name, TotalWorkingYears,YearsWithCurrManager FROM general_data WHERE TotalWorkingYears >2 AND YearsWithCurrManager<4; 

#11)List employees who have changed their job roles within the company (JobLevel and JobRole differ from their previous job).
SELECT Emp_Name,JobRole FROM general_data WHERE JobLevel=5;

#12)Find the average distance from home for employees in each department.
SELECT AVG(DistanceFromHome),Department FROM general_data GROUP BY Department;

#13)Retrieve the top 5 employees with the highest MonthlyIncome.
SELECT Emp_Name,MonthlyIncome FROM general_data ORDER BY MonthlyIncome DESC LIMIT 5;

#14)Calculate the percentage of employees who have had a promotion in the last year.
SELECT COUNT(YearsSinceLastPromotion)*100/(SELECT COUNT(EmployeeID) FROM general_data) FROM general_data WHERE YearsSinceLastPromotion=1;

#15)List the employees with the highest and lowest EnvironmentSatisfaction.
SELECT gd.Emp_Name,es.EnvironmentSatisfaction FROM general_data gd JOIN employee_survey es ON gd.EmployeeID= es.EmployeeID WHERE es.EnvironmentSatisfaction= (SELECT MAX(EnvironmentSatisfaction) FROM employee_survey) UNION SELECT gd.Emp_Name,es.EnvironmentSatisfaction FROM general_data gd JOIN employee_survey es ON gd.EmployeeID= es.EmployeeID WHERE es.EnvironmentSatisfaction= (SELECT MIN(EnvironmentSatisfaction) FROM employee_survey); 

#16)Find the employees who have the same JobRole and MaritalStatus.
SELECT Emp_Name,JobRole,MaritalStatus FROM general_data WHERE JobRole IN (SELECT JobRole FROM general_data gd WHERE general_data.EmployeeID <> gd.EmployeeID) AND MaritalStatus IN (SELECT MaritalStatus FROM general_data gd WHERE general_data.EmployeeID <> gd.EmployeeID) ORDER BY JobRole,MaritalStatus ASC;

#17)List the employees with the highest TotalWorkingYears who also have a PerformanceRating of 4.
SELECT gd.Emp_Name,gd.TotalWorkingYears, ms.PerformanceRating FROM general_data gd JOIN manager_survey ms ON gd.EmployeeID= ms.EmployeeID WHERE ms.PerformanceRating=4 ORDER BY gd.TotalWorkingYears DESC LIMIT 3;

#18)Calculate the average Age and JobSatisfaction for each BusinessTravel type.
SELECT AVG(gd.Age),gd.BusinessTravel,AVG(es.JobSatisfaction)FROM general_data gd JOIN employee_survey es ON gd.EmployeeID= es.EmployeeID GROUP BY gd.BusinessTravel;

#19)Retrieve the most common EducationField among employees.
SELECT EducationField,COUNT(*) AS EF_count FROM general_data GROUP BY EducationField ORDER BY EF_count DESC LIMIT 1;

#20)List the employees who have worked for the company the longest but haven't had a Promotion.
SELECT Emp_Name,YearsAtCompany,YearsSinceLastPromotion FROM general_data WHERE YearsAtCompany= (SELECT MAX(YearsAtCompany) FROM general_data WHERE YearsSinceLastPromotion=0 ) AND YearsSinceLastPromotion=0;