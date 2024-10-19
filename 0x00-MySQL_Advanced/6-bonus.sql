-- SQL script that creates a stored procedure AddBonus
-- That adds a new correction for a student.

DELIMITER //

CREATE PROCEDURE AddBonus(
    IN user_id INT, 
    IN project_name VARCHAR(255), 
    IN score INT
)
BEGIN
    DECLARE project_id INT;
    
    -- Check if the project already exists
    SELECT id INTO project_id 
    FROM projects 
    WHERE name = project_name;
    
    -- If project doesn't exist, create it
    IF project_id IS NULL THEN
        INSERT INTO projects (name) VALUES (project_name);
        SET project_id = LAST_INSERT_ID();
    END IF;
    
    -- Add the correction for the student
    INSERT INTO corrections (user_id, project_id, score) 
    VALUES (user_id, project_id, score);
    
    -- Update user's average_score
    UPDATE users 
    SET average_score = (
        SELECT AVG(score) 
        FROM corrections 
        WHERE corrections.user_id = users.id
    )
    WHERE id = user_id;
    
END //

DELIMITER ;
