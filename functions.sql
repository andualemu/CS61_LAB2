DELIMITER $$

 DROP FUNCTION IF EXISTS ViewRevId;
CREATE FUNCTION ViewRevId(reviewer INT) RETURNS INT
BEGIN
SET @rev_id = reviewer;
RETURN rev_id;
END; $$

DELIMITER ;
