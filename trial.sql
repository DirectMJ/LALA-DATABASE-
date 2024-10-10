use midtermdb;


DELIMITER $$ 
CREATE FUNCTION shit(emp_id VARCHAR(5))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE emp_type VARCHAR(10);
    
    -- Check if the employee is in the HOURLYEMPLOYEE table
    IF EXISTS (SELECT * FROM HOURLYEMPLOYEE WHERE EmpID = emp_id) THEN
        SET emp_type = 'Hourly';
    -- Check if the employee is in the SALARIEDEMPLOYEE table
    ELSEIF EXISTS (SELECT * FROM SALARIEDEMPLOYEE WHERE EmpID = emp_id) THEN
        SET emp_type = 'Salaried';
    ELSE
        SET emp_type = 'Unknown';
    END IF;
    
    RETURN emp_type;
END;
delimiter
$$
select shit('10002') as EmployeeType
