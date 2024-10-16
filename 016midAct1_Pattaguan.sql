use midtermdb;

create or replace VIEW vwEmployeeList 
as
select EmpID, concat(FirstName, ' ',IFNULL(MiddleName,''),' ',LastName) as fullname, gender, birthdate, emptype
from Employee;

select fullname from vwemployeelist;

Delimiter  $$
create Function fnGetfullname
(
	empid varchar(5)
)
returns varchar(150) deterministic
begin
	declare  fullname varchar(150);
    select  concat(FirstName, ' ',IFNULL(MiddleName,''),' ',LastName)
    into fullname
    from Employee e
    where e.empid=empid;
    
    return fullname;
end
$$

select fnGetfullname('10003') as FullName

-- next --



DELIMITER $$ 
CREATE FUNCTION getEmpType(emp_id VARCHAR(5))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE emp_type VARCHAR(10);
    

    IF EXISTS (SELECT * FROM HOURLYEMPLOYEE WHERE EmpID = emp_id) THEN
        SET emp_type = 'Hourly';

    ELSEIF EXISTS (SELECT * FROM SALARIEDEMPLOYEE WHERE EmpID = emp_id) THEN
        SET emp_type = 'Salaried';
    ELSE
        SET emp_type = 'Unknown';
    END IF;
    
    RETURN emp_type;
END;
delimiter
$$
select getEmpType('10004') as EmployeeType

-- next --



DELIMITER //
CREATE FUNCTION grossSalary(p_EmpID VARCHAR(5))
RETURNS DECIMAL(18,2)
DETERMINISTIC
BEGIN
    DECLARE v_gross DECIMAL(18,2);
    DECLARE v_rate DECIMAL(8,2);
    DECLARE v_hours DECIMAL(6,2);
    
    SELECT h.Rate, hr.HrsRendered 
    INTO v_rate, v_hours
    FROM HOURLYEMPLOYEE h
    JOIN HOURSRENDERED hr ON h.EmpID = hr.EmpID
    WHERE h.EmpID = p_EmpID;
    
    SET v_gross = v_rate * v_hours;
    
    RETURN v_gross;
END//

DELIMITER ;

SELECT 
    e.EmpID,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    h.Rate AS HourlyRate,
    hr.HrsRendered AS HoursWorked,
    grossSalary(e.EmpID) AS HourlyEmployeeGrossPay
FROM 
    EMPLOYEE e
    INNER JOIN HOURLYEMPLOYEE h ON e.EmpID = h.EmpID
    INNER JOIN HOURSRENDERED hr ON e.EmpID = hr.EmpID;

SELECT 
    e.EmpID,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    s.BasicSalary,
    s.Incentive,
    (s.BasicSalary + s.Incentive) AS SalariedEmployeeGrossPay
FROM 
    EMPLOYEE e
    INNER JOIN SALARIEDEMPLOYEE s ON e.EmpID = s.EmpID;
    
    -- next --

-- philhealth contribution--

DELIMITER //

CREATE FUNCTION philhealthContri(p_EmpID VARCHAR(5))
RETURNS DECIMAL(18,2)
DETERMINISTIC
BEGIN
    DECLARE v_grossSalary DECIMAL(18,2);
    DECLARE v_philHealth DECIMAL(18,2);
    
  
    IF EXISTS (SELECT 1 FROM HOURLYEMPLOYEE WHERE EmpID = p_EmpID) THEN
        SET v_grossSalary = grossSalary(p_EmpID);
    ELSEIF EXISTS (SELECT 1 FROM SALARIEDEMPLOYEE WHERE EmpID = p_EmpID) THEN
       
        SELECT (s.BasicSalary + s.Incentive) INTO v_grossSalary
        FROM SALARIEDEMPLOYEE s
        WHERE s.EmpID = p_EmpID;
    ELSE
       
        SET v_grossSalary = 0;
    END IF;

   
    IF v_grossSalary <= 10000 THEN
        SET v_philHealth = v_grossSalary * 0.05;  
    ELSEIF v_grossSalary > 10000 AND v_grossSalary <= 99999.99 THEN
        SET v_philHealth = v_grossSalary * 0.06;  
    ELSE
        SET v_philHealth = v_grossSalary * 0.07;  
    END IF;

    RETURN v_philHealth;
END //

DELIMITER ;

SELECT 
    e.EmpID,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    philhealthContri(e.EmpID) AS PhilHealthContribution
FROM 
    EMPLOYEE e;

-- next --
-- PAGIBIG CONRTIBUTION --

DELIMITER //

CREATE FUNCTION pagibigContribution(p_EmpID VARCHAR(5))
RETURNS DECIMAL(18,2)
DETERMINISTIC
BEGIN
    DECLARE v_grossSalary DECIMAL(18,2);
    DECLARE v_errate DECIMAL(18,2) DEFAULT 0.02; 
    DECLARE v_pagibig DECIMAL(18,2);

   
    SET v_grossSalary = grossSalary(p_EmpID);
    

    IF v_grossSalary <= 5000 THEN
        SET v_pagibig = (v_grossSalary * v_errate) + (v_grossSalary * v_errate); 
    ELSE
        SET v_pagibig = 200;  
    END IF;

    RETURN v_pagibig;
END //

DELIMITER ;
SELECT 
    e.EmpID,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    pagibigContribution(e.EmpID) AS PagibigContribution
FROM 
    EMPLOYEE e;

-- sss --
DELIMITER $$

CREATE FUNCTION calculateSSSContribution(p_EmpID VARCHAR(5))
RETURNS DECIMAL(18,2)
DETERMINISTIC
BEGIN
    DECLARE v_grossSalary DECIMAL(18,2);
    DECLARE v_erss DECIMAL(18,2);
    DECLARE v_erec DECIMAL(18,2);
    DECLARE v_eess DECIMAL(18,2);
    DECLARE v_pfer DECIMAL(18,2);
    DECLARE v_pfee DECIMAL(18,2);
    DECLARE v_sssContribution DECIMAL(18,2);

   
    IF EXISTS (SELECT 1 FROM HOURLYEMPLOYEE WHERE EmpID = p_EmpID) THEN
        SET v_grossSalary = grossSalary(p_EmpID);
    ELSEIF EXISTS (SELECT 1 FROM SALARIEDEMPLOYEE WHERE EmpID = p_EmpID) THEN
        SELECT (s.BasicSalary + s.Incentive) INTO v_grossSalary
        FROM SALARIEDEMPLOYEE s
        WHERE s.EmpID = p_EmpID;
    ELSE
        SET v_grossSalary = 0;
    END IF;

    
    SELECT ERSS, EREC, EESS, PFER, PFEE
    INTO v_erss, v_erec, v_eess, v_pfer, v_pfee
    FROM SSS  
    WHERE v_grossSalary >= SalaryMin
	AND (SalaryMax IS NULL OR v_grossSalary <= SalaryMax)
    LIMIT 1; 

  
    SET v_sssContribution = v_erss + v_erec + v_eess + v_pfer + v_pfee;

    RETURN v_sssContribution;
END $$

DELIMITER ;
SELECT 
    e.EmpID,
    CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
    calculateSSSContribution(e.EmpID) AS SSSContribution
FROM 
    EMPLOYEE e;











    
    



    
    
    
            
	





 