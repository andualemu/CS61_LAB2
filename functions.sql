DROP FUNCTION IF EXISTS getScore;

DELIMITER $$
CREATE FUNCTION getScore(manuID INT) RETURNS INT
DETERMINISTIC
BEGIN

DECLARE result INT Default 0;
DECLARE minScore INT DEFAULT 40;
CREATE TEMPORARY TABLE IF NOT EXISTS output (value VARCHAR(255));

SELECT (AVG(`feedback_appropr`) + AVG(`feedback_clarity`) + AVG(`feedback_method`) + AVG(`feedback_exp`))/4
INTO result
FROM Feedback
WHERE Feedback.Manuscript_manu_id = manuID;

IF (result < minScore) THEN
	UPDATE Manuscript SET `manu_status` = 5
    WHERE `manu_id` = manuID;
else
	UPDATE Manuscript SET `manu_status` = 4
    WHERE `manu_id` = manuID;
END IF;

return result;
END $$
DELIMITER ;

select * ,getScore(3) FROM Manuscript;
SELECT * FROM Manuscript;
