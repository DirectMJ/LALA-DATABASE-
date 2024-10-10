use EmpManagementDB_Pattaguan;

/*Q1*/
SELECT Birthdate, Address
FROM Employee
WHERE FName = 'Martyn' AND MInit = 'D' AND LName = 'Campbell';

/*Q2*/
SELECT Employee.FName, Employee.MInit, Employee.LName, Employee.Address
FROM Employee 
LEFT JOIN Department
ON Employee.DNo = Department.DNo
WHERE Department.DName = 'Marketing';

/*Q3*/
SELECT Project.PNo, Project.Dno, Department.DName
FROM Project 
LEFT JOIN Department
ON Project.Dno = Department.DNo
WHERE Project.Location = 'Lexington, KY';	

/*Q4*/
SELECT Employee.SSN, Dependent.DependentName
FROM Employee 
LEFT JOIN Dependent 
ON Employee.SSN = Dependent.SSN;

/*Q5*/
SELECT DISTINCT Salary
FROM Employee;

/*Q6*/
SELECT DISTINCT Project.PNo
FROM Project 
inner JOIN Workson ON Project.PNo = Workson.PNo
inner JOIN employee ON Workson.SSN = Employee.SSN
WHERE Employee.LName = 'Jones';


/*Q7*/
SELECT *
FROM Employee
WHERE Address LIKE '%Louisville, KY%';



