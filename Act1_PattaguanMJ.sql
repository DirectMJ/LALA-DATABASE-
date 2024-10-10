create database EmpManagementDB_Pattaguan;
use EmpManagementDB_Pattaguan;

create table Department (
	Dno TINYINT primary key,
    Dname VARCHAR(15)
);

create table Deplocation (
	DLNo tinyint primary key,
    Location varchar(15),
    Dno tinyint,
    foreign key (Dno) references Department(Dno)
);

create table Project (
	Pno tinyint primary key,
    Pname varchar(20),
    Location varchar(15),
    Dno tinyint,
    foreign key (Dno) references Department(Dno)
);

create table Employee (
	SSN char(9) primary key,
    Fname varchar(15),
    MInit char(1),
    Lname varchar(15),
    BirthDate DATE,
    Address varchar(50),
    Gender char(1),
    Salary mediumint,
    Dno tinyint,
    foreign key (Dno) references Department(Dno)
);

create table Workson (
	WID tinyint primary key,
    SSN char(9),
    foreign key (SSN) references Employee(SSN),
    Pno tinyint,
    foreign key (Pno) references Project(Pno),
    HrsRendered FLOAT
);

create table Dependent (
	DepNo tinyint primary key,
    DependentName varchar(15),
    gender char (1),
    BirthDate date,
    Relationship varchar(8),
    SSN char(9),
    foreign key (SSN) references Employee(SSN)
);








