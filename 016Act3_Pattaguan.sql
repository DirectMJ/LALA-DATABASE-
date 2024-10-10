use EmpManagementDB_Pattaguan;

/*Q8*/
select Gender, count(*) AS NumberOfEmployees
from Employee
group by gender;

/*Q9*/
select Employee.SSN, concat(' ',Employee.Fname,' ',Employee.MInit, ' ', Employee.Lname) as Fullname,
SUM(Workson.HrsRendered) as totalHours
from Employee
inner join Workson
on Employee.SSN = Workson.SSN
group by Employee.SSN, Employee.Fname, Employee.MInit, Employee.Lname;

/*Q10*/
select department.DNo, Department.DName,
COUNT(distinct Project.Pno) as NumberOfProject
from department
left join Project
on Department.DNo = Project.DNo
group by DNo, DName;

/*Q11*/
select Relationship,
count(*) as TotalDependents
from Dependent
group by Relationship;

/*Q12*/
select Department.DNo, Department.DName,
count(Employee.SSN) as totalEmployees
from Department
inner join Employee
on Department.DNo = Employee.DNo
group by Department.DNo, Department.DName


