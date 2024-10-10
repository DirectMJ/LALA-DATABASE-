-- create a database
CREATE Database IntroDB;
use IntroDB;
-- create tables
CREATE TABLE Student (
    IDNumber VARCHAR(7) PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    MiddleName VARCHAR(20) NULL,
    LastName VARCHAR(20) NOT NULL,
    Gender VARCHAR(20) NOT NULL,
    Program VARCHAR(50) NOT NULL,
    YearLevel INT NOT NULL
);

-- populate the table
INSERT INTO Student (IDNumber, FirstName,  MiddleName, LastName, Gender, Program, YearLevel)
VALUES ('1042601', 'Michael', 'Angelo', 'Alpha', 'Male', 'Marine Painting', '5');



Update Student 
Set FirstName= 'Reyna',
	LastName= 'Pattaguan',
    Gender= 'Godzilla'
Where IDNumber= '1042601';



Delete from Student Where IDNumber= '1042601';

Select * from Student;


