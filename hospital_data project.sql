DROP TABLE IF EXISTS Hospital_data;

CREATE TABLE Hospital_data(Hospital_Name varchar(100),Location varchar(50),
 Department varchar(100),Doctors_Count int,Patients_Count int,
 Admission_Date date,Discharge_Date date,Medical_Expenses decimal(10,2));

SELECT*FROM Hospital_data;

1) Total Number of Patients

SELECT SUM (patients_count) as Total_patients
FROM Hospital_data;

2)Average Number of Doctors per Hospital

SELECT Hospital_name, AVG (doctors_count) AS Avg_doctors
FROM hospital_data
GROUP BY hospital_name;

3)Top Departments with the Highest Number of Patients

SELECT department,SUM (patients_count) AS Total_patients
FROM hospital_data
GROUP BY department
ORDER BY total_patients desc LIMIT 3;

4)Hospital with the Maximum Medical Expenses 

SELECT hospital_name,SUM (medical_expenses) AS Total_expenses
FROM hospital_data
GROUP BY hospital_name
ORDER BY Total_expenses DESC
LIMIT 1;

5)Daily Average Medical Expenses

SELECT hospital_name, ROUND (AVG (medical_expenses),2) AS Avg_daily_expenses
FROM hospital_data
GROUP by hospital_name
ORDER BY Avg_daily_expenses;
 
6)Total Patients Treated Per City
 
SELECT location AS city,SUM(patients_count) AS Total_patients
FROM hospital_data
GROUP BY location;


7) Identify the Department with the Lowest Number of Patients

SELECT department ,sum(patients_count) AS total_patients
FROM hospital_data
GROUP BY Department
ORDER BY Total_patients ASC 
limit 1;

8) Monthly Medical Expenses Report
SELECT TO_CHAR(Admission_Date, 'YYYY-MM') AS Month,
SUM(Medical_Expenses)
FROM Hospital_Data
GROUP BY TO_CHAR(Admission_Date, 'YYYY-MM')
ORDER BY Month;

9)Find the department with the highest total medical expenses across all hospitals.

SELECT  Department,
SUM(Medical_Expenses) AS Total_Expenses
FROM Hospital_Data
GROUP BY Department
ORDER BY Total_Expenses DESC
LIMIT 1;

10)Find the top 5 hospitals with the highest patient count.

SELECT hospital_name,
SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY hospital_name
ORDER BY total_patients DESC
LIMIT 5;

11)Longest Hospital Stay

SELECT hospital_name,location,department,admission_date, discharge_date, (discharge_date - admission_date) AS stay_days
FROM hospital_data
ORDER BY stay_days DESC
LIMIT 1;

12)Average Length of Stay Per Department

SELECT department,
AVG(discharge_date - admission_date) AS avg_stay_days
FROM hospital_data
GROUP BY department
ORDER BY avg_stay_days DESC;



    
	











