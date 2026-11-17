
-- ==========================================
-- EMPLOYEE ATTENDANCE ANALYSIS PROJECT
-- ==========================================

-- 1. Create Employee Attendance Table

CREATE TABLE employees (
    EmployeeID VARCHAR(10),
    EmployeeName VARCHAR(50),
    Department VARCHAR(30),
    AttendanceDate DATE,
    Status VARCHAR(20),
    WorkingHours INT
);

-- 2. Insert 40 Employee Attendance Records

INSERT INTO employees
(EmployeeID, EmployeeName, Department, AttendanceDate, Status, WorkingHours)
VALUES
('E106','Anil','IT','2026-01-01','Present',8),
('E107','Divya','HR','2026-01-01','Present',7),
('E108','Naveen','Sales','2026-01-01','Absent',0),
('E109','Meena','Finance','2026-01-01','Present',8),
('E110','Suresh','Marketing','2026-01-01','Present',9),

('E106','Anil','IT','2026-01-02','Present',8),
('E107','Divya','HR','2026-01-02','Absent',0),
('E108','Naveen','Sales','2026-01-02','Present',8),
('E109','Meena','Finance','2026-01-02','Present',7),
('E110','Suresh','Marketing','2026-01-02','Present',8),

('E106','Anil','IT','2026-01-03','Absent',0),
('E107','Divya','HR','2026-01-03','Present',8),
('E108','Naveen','Sales','2026-01-03','Present',7),
('E109','Meena','Finance','2026-01-03','Present',8),
('E110','Suresh','Marketing','2026-01-03','Absent',0),

('E106','Anil','IT','2026-01-04','Present',8),
('E107','Divya','HR','2026-01-04','Present',8),
('E108','Naveen','Sales','2026-01-04','Present',8),
('E109','Meena','Finance','2026-01-04','Absent',0),
('E110','Suresh','Marketing','2026-01-04','Present',8),

('E101','Rahul','IT','2026-01-05','Present',8),
('E102','Priya','HR','2026-01-05','Present',8),
('E103','Arun','Sales','2026-01-05','Present',9),
('E104','Sneha','Finance','2026-01-05','Absent',0),
('E105','Kiran','IT','2026-01-05','Present',8),
('E106','Anil','IT','2026-01-05','Present',7),
('E107','Divya','HR','2026-01-05','Present',8),
('E108','Naveen','Sales','2026-01-05','Absent',0),
('E109','Meena','Finance','2026-01-05','Present',8),
('E110','Suresh','Marketing','2026-01-05','Present',8),

('E101','Rahul','IT','2026-01-06','Absent',0),
('E102','Priya','HR','2026-01-06','Present',7),
('E103','Arun','Sales','2026-01-06','Present',8),
('E104','Sneha','Finance','2026-01-06','Present',8),
('E105','Kiran','IT','2026-01-06','Present',9),
('E106','Anil','IT','2026-01-06','Present',8),
('E107','Divya','HR','2026-01-06','Absent',0),
('E108','Naveen','Sales','2026-01-06','Present',8),
('E109','Meena','Finance','2026-01-06','Present',8),
('E110','Suresh','Marketing','2026-01-06','Present',7);


-- ==========================================
-- SQL ANALYSIS QUERIES
-- ==========================================

-- 1. Display All Records

SELECT *
FROM employees;


-- 2. Check Total Records

SELECT COUNT(*) AS Total_Records
FROM employees;


-- 3. Display Selected Columns

SELECT EmployeeName, Department, WorkingHours
FROM employees;


-- 4. Display IT Department Employees

SELECT *
FROM employees
WHERE Department = 'IT';


-- 5. Display Present Employees

SELECT *
FROM employees
WHERE Status = 'Present';


-- 6. Employees Working More Than 7 Hours

SELECT *
FROM employees
WHERE WorkingHours > 7;


-- 7. Employees Working Less Than 8 Hours

SELECT *
FROM employees
WHERE WorkingHours < 8;


-- 8. Employees From HR and Finance

SELECT *
FROM employees
WHERE Department IN ('HR', 'Finance');


-- 9. Employees Working Between 7 and 9 Hours

SELECT *
FROM employees
WHERE WorkingHours BETWEEN 7 AND 9;


-- 10. Employee Names Starting With A

SELECT *
FROM employees
WHERE EmployeeName LIKE 'A%';


-- 11. Sort Employees by Working Hours

SELECT *
FROM employees
ORDER BY WorkingHours DESC;


-- 12. Count Total Attendance Records

SELECT COUNT(*) AS Total_Records
FROM employees;


-- 13. Count Present and Absent Records

SELECT Status, COUNT(*) AS Total
FROM employees
GROUP BY Status;


-- 14. Department-wise Attendance Count

SELECT Department, COUNT(*) AS Total_Records
FROM employees
GROUP BY Department;


-- 15. Department-wise Average Working Hours

SELECT Department, AVG(WorkingHours) AS Average_Hours
FROM employees
GROUP BY Department;


-- 16. Department-wise Total Working Hours

SELECT Department, SUM(WorkingHours) AS Total_Hours
FROM employees
GROUP BY Department;


-- 17. Departments Having More Than 5 Records

SELECT Department, COUNT(*) AS Total_Records
FROM employees
GROUP BY Department
HAVING COUNT(*) > 5;


-- 18. Employee-wise Total Working Hours

SELECT EmployeeID, EmployeeName,
       SUM(WorkingHours) AS Total_Hours
FROM employees
GROUP BY EmployeeID, EmployeeName
ORDER BY EmployeeID;


-- 19. Employee-wise Attendance Count

SELECT EmployeeID, EmployeeName,
       COUNT(*) AS Attendance_Days
FROM employees
GROUP BY EmployeeID, EmployeeName
ORDER BY EmployeeID;


-- 20. Department-wise Present Count

SELECT Department, COUNT(*) AS Present_Count
FROM employees
WHERE Status = 'Present'
GROUP BY Department;


-- 21. Department-wise Absent Count

SELECT Department, COUNT(*) AS Absent_Count
FROM employees
WHERE Status = 'Absent'
GROUP BY Department;


-- 22. Highest Working Hours

SELECT MAX(WorkingHours) AS Highest_Hours
FROM employees;


-- 23. Lowest Working Hours

SELECT MIN(WorkingHours) AS Lowest_Hours
FROM employees;


-- 24. Overall Average Working Hours

SELECT AVG(WorkingHours) AS Average_Hours
FROM employees;


-- 25. Date-wise Attendance Count

SELECT AttendanceDate, COUNT(*) AS Total_Records
FROM employees
GROUP BY AttendanceDate
ORDER BY AttendanceDate;


-- 26. Employee Attendance Summary

SELECT
    EmployeeID,
    EmployeeName,
    COUNT(*) AS Total_Days,
    SUM(CASE WHEN Status = 'Present' THEN 1 ELSE 0 END) AS Present_Days,
    SUM(CASE WHEN Status = 'Absent' THEN 1 ELSE 0 END) AS Absent_Days
FROM employees
GROUP BY EmployeeID, EmployeeName
ORDER BY EmployeeID;
