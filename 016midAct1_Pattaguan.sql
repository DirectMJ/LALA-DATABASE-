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

select fnGetfullname('10003');

-- next shit --
-- next shit--
-- next shit--
-- next shit--


DELIMITER $$ 
CREATE FUNCTION shit(emp_id VARCHAR(5))
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
select shit('10004') as EmployeeType

-- next shit--
-- next shit--
-- next shit--
-- next shit--



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
    
    -- next shit --
	-- next shit --
	-- next shit --
	-- next shit --

-- philhealth contribution--



    
    
    
            
	





 

