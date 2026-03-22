


select * from Hospital

-- This query counts total Patients 
select count(*) as TotalPatients  from Hospital 

-- This query shows gender distribution
select  Patient_Gender  , count(*) as Total from Hospital 
group by Patient_Gender 

-- Race wise Patient Count
SELECT Patient_Race ,  count(*) as Total from Hospital 
group by Patient_Race
 -- Department - Wise Patient Count
select Department_Referral , count(*) as total_Patients from Hospital
group by Department_Referral
order by total_Patients

-- Admission Rate 
select Patient_Admission_Flag , count(*) as Total from Hospital
group by  Patient_Admission_Flag 
order by Total

-- Avg Waiting Time 
select avg(Patient_Waittime) as AvgWaitingTime from Hospital

-- Avg Waiting Time VS Admission
select Patient_Admission_Flag , avg(Patient_Waittime) as AvgWaitingTime from Hospital
group  by Patient_Admission_Flag

--Avg Stisfaction Score
Select avg(Patient_Satisfaction_Score) as AvgSatisfactionScore from Hospital
where Patient_Satisfaction_Score IS NOT NULL;


---AGE wise Admission Trend
Select Patient_Age , count(*) as total_patients from Hospital
group by Patient_Age
order by total_patients DESC;

-- Top Departemmts with Highest Admissions
Select Department_Referral , count(*) as total_Admmison from Hospital
where Patient_Admission_Flag = 1 and Department_Referral <> 'None'
Group by department_referral 
ORDER BY total_Admmison Desc;

-- Top Rank Department with highest Patients
Select Department_Referral , count(*) as total_patinets, 
RANK() OVER (order by COUNT(*) DESC) as dept_rank from Hospital
where Department_Referral <> 'None'
group by Department_Referral
