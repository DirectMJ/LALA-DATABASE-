DELIMITER //

CREATE FUNCTION calculate_philhealth_contribution(basic_gross DECIMAL(18,2)) 
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE contribution DECIMAL(18,2);
    DECLARE rate DECIMAL(5,2);
    DECLARE debug_info VARCHAR(255);
    
    -- Get the appropriate rate
    SELECT Rate INTO rate
    FROM PHILHEALTH
    WHERE basic_gross >= SalaryMin
    ORDER BY SalaryMin DESC
    LIMIT 1;
    
    -- Set debug info
    SET info = CONCAT('Rate: ', IFNULL(rate, 'NULL'), ', ');
    
    -- Calculate the contribution if rate is not null
    IF rate IS NOT NULL THEN
        SET contribution = basic_gross * rate;
        
        -- Cap the contribution at 4050
        IF contribution > 4050 THEN
            SET contribution = 4050;
        END IF;
        
        SET info = CONCAT(info, 'Contribution: ', contribution);
    ELSE
        SET info = CONCAT(info, 'Rate is NULL');
    END IF;
    
    RETURN info;
END //

DELIMITER ;
SELECT * FROM PHILHEALTH;
SELECT * FROM PHILHEALTH WHERE 25000.00 >= SalaryMin ORDER BY SalaryMin DESC LIMIT 1;