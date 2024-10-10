use EmpManagementDB_Pattaguan;

INSERT INTO Department(Dno, Dname)
Values (1, 'Finance'),
(2, 'Administration'),
(3, 'Sales'),
(4, 'Marketing'),
(5, 'Engineering'),
(6, 'Business Development');

alter table Department
change column Dname Dname varchar(50) not null;

INSERT INTO Project(Pno, Pname, Location, Dno)
Values (1, 'Lotlux', 'Houston, TX', 3),
(2, 'Stim', 'Lexington, KY', 5),
(3, 'Prodder', 'Midland, TX', 4),
(4, 'Voyatouch', 'Jacksonville FL', 5),
(5, 'Flexidy', 'West Palm Beach, FL', 6),
(6, 'Quo Lux', 'Lexington, KY', 5),
(7, 'Job', 'Austin, TX', 4),
(8, 'Bitwolf', 'Lakeland, FL', 3),
(9, 'Veribet', 'Gilbert, AZ', 5),
(10, 'Zoolab', 'Houston, TX', 6);

alter table Project
change column Location Location varchar(200) not null;

INSERT INTO Employee(SSN,	FName,	MInit,	LName,	Birthdate,	Address,	Gender,	Salary,	DNo)
Values('302366205',	'Olivia',	'K',	'Williams',	'1994-06-17',	'862 Vidon Circle, West Palm Beach, FL',	'F',	'97659.67',	1),
('656579164',	'Elizabeth',	'V',	'Phillips', '1970-05-30',	'75740 Oriole Place, El Paso, TX',	'F',	'54569.47',	4),
('271904410',	'Matthew',	'S',	'Brown',	'1974-04-29',	'8 Kim Plaza, Miami, FL',	'M',	'48272.65',	3),
('193149599',	'James',	'B',	'Johnson',	'2001-08-10',	'285 Manitowish Way, Denver, CO',	'M',	'90515.74',	2),
('730672786',	'Lillian',	'S',	'Anderson',	'1984-10-09',	'56507 Old Shore Circle, Corpus Christi, TX',	'F',	'65255.17',	5),
('688131442',	'Martyn',	'D',	'Campbell',	'1999-07-07',	'07 Westend Avenue, Louisville, KY',	'M',	'50982.73',	6),
('438707370',	'Daniel',	'D',	'Smith',	'1979-01-31',	'86565 Holy Cross Junction, Jacksonville, FL',	'M',	'61079.34',	4),
('320436077',	'Harvey',	'M',	'Roberts',	'1997-03-14',	'41 Pankratz Lane, Houston, TX',	'M',	'74099.57',	2),
('755272504',	'Victoria',	'I',	'Rodriguez',	'1986-03-01',	'3 Bunker Hill Crossing, Spring, TX',	'F',	'20432.72',	3),
('443119407',	'Gianna',	'F',	'Walker',	'1997-01-23',	'36075 Spohn Street, Fort Worth, TX',	'F',	'64124.9',	6),
('767582066',	'Grayson',	'',	'Garcia',	'1994-09-09',	'53264 Graedel Center, El Paso, TX',	'M',	'59755.76',	4),
('500056990',	'Michael',	'E',	'Hall',	'1974-12-10',	'71 Southridge Hill, Tucson, AZ',	'M', '64166.44',	5),
('224027328',	'Scarlett',	'P',	'Martinez',	'1987-09-28',	'6 Chive Circle, Lexington, KY',	'F',	'25237.9',	5),
('132850466',	'Amelia',	'J',	'Adams',	'1983-09-14',	'6693 Truax Avenue, Spring Hill, FL',	'F',	'24316.06',	1),
('260407647',	'John','L',	'Davis',	'1986-11-17',	'53 Buell Hill, Laredo, TX',	'M',	'74633.62',	'1'),
('473860457',	'Sheilah',	'Z',	'Martin',	'1997-05-31',	'62 Southridge Park, Louisville, KY',	'F',	'77207.42',	6),
('295210671',	'Gerald',	'L',	'Wilson',	'1994-11-28',	'701 Mallory Drive, Orlando, FL',	'M',	'49883.02',	'5'),
('850499675',	'Kimmie',	'W',	'Baker',	'1994-04-25',	'185 Weeping Birch Place, Gainesville, FL',	'F',	'77168.23',	5),
('671596405',	'Paisley',	'S',	'Thomas',	'1998-04-24',	'4821 Anniversary Plaza, Fort Worth, TX',	'F',	'97919.58',	3),
('435235662',	'Andie',	'B',	'Miller',	'1984-07-25',	'03 Valley Edge Trail, Boca Raton, FL',	'F',	'27338.5',	4),
('466710302',	'Sebastian',	'L',	'Scott',	'1972-09-02',	'989 Milwaukee Trail, Louisville, KY',	'M',	'73575.37',	2),
('488459661',	'Emma',	'L',	'Wright',	'1990-04-12',	'784 School Terrace, Laredo, TX',	'F',	'60963.69',	3),
('136485560',	'Addison',	'L',	'Jones',	'1986-09-03',	'749 Red Cloud Hill, El Paso, TX',	'F',	'62702.46',	6),
('588510442',	'Randy',	'B',	'Moore',	'1995-10-18', '6402 Mcguire Parkway, Winter Haven, FL',	'M',	'15097.09',	2);

INSERT INTO Workson()
Values(1,'271904410', 1, 28),
(2,	'755272504',	1,	24),
(3,	'671596405',	8,	30),
(4,	'488459661',	1,	17.5),
(5,	'656579164',	3,	6),
(6,	'656579164',	4,	27),
(7,	'438707370',	3,	26),
(8,	'767582066',	4,	21),
(9,	'730672786',	2,	6.5),
(10,	'500056990',	2,	15),
(11,	'224027328',	2,	7),
(12,	'295210671',	4,	26),
(13,	'850499675', 4,	21),
(14,	'295210671', 6,	13.5),
(15,	'224027328', 9,	26),
(16,	'688131442',	5,	30),
(17,	'443119407',	5,	5),
(18,	'473860457', 10,	16),
(19,	'136485560',	10,	8.5),
(20,	'136485560', 10,	21);

INSERT INTO Dependent()
Values
(1,	'Ellie','F',	'2024-08-23',	'Daughter',	'302366205'),
(2,	'Wyatt','M',	'2010-10-08',	'Son',	'302366205'),
(3,	'Zoey',	'F', 	'2023-03-13',	'Daughter',	'302366205'),
(4,	'Chloe','F',	'2021-08-21',	'Cousin',	'193149599'),
(5,	'Camila','F',	'2004-02-03',	'Niece',	'850499675'),
(6,	'Daniel','M',	'2020-11-25',	'Grandson',	'500056990'),
(7,	'Ethan','M',	'2010-02-15',	'Grandson',	'500056990'),
(8,	'Erinn','F',	'2015-07-05',	'Sister',	'443119407'),
(9,	'Mason','M',	'2006-12-31',	'Son',	'320436077'),
(10, 'Scarlett','F', '2019-06-01',	'Daughter',	'132850466');

















