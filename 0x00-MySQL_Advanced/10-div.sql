-- Write a SQL script that creates a function SafeDiv 
-- That divides (and returns) the first by the second number
-- Or returns 0 if the second number is equal to 0.

DELIMITER //

CREATE FUNCTION SafeDiv(a INT, b INT)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    -- Check if the divisor is zero
    IF b = 0 THEN
        RETURN 0;

    ELSE
        -- Perform the division
        RETURN a / b;
    END IF;
END //

DELIMITER ;