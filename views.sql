-- lastname, author_id, manu_id primary author, status, latest timestamp status change
--
DROP VIEW LeadAuthorManuscripts;
CREATE VIEW LeadAuthorManuscripts AS
	SELECT DISTINCT author_name, author_id, manu_id, manu_status, updated_at
	FROM Manuscript, Manuscript_has_Author, Author
	WHERE Manuscript.manu_id = Manuscript_has_Author.Manuscript_manu_id
		AND Manuscript_has_Author.Author_author_id = Author.author_id
	GROUP BY Manuscript.manu_id
	ORDER BY Manuscript_has_Author.`order`;

DROP VIEW AnyAuthorManuscripts;
CREATE VIEW AnyAuthorManuscripts AS
	SELECT DISTINCT author_name, author_id, manu_id, manu_status
	FROM Manuscript, Manuscript_has_Author, Author
		WHERE Manuscript.manu_id = Manuscript_has_Author.Manuscript_manu_id
		AND Manuscript_has_Author.Author_author_id = Author.author_id
	ORDER BY author_name, updated_at;

DROP VIEW IF EXISTS PublishedIssues;
CREATE VIEW PublishedIssues AS
SELECT Manuscript.manu_title, Manuscript.manu_pagenb, Issue.issue_year, Issue.issue_periodnum
FROM Manuscript
LEFT JOIN
Issue ON Manuscript.Issue_Issue_id = Issue.Issue_id
WHERE Issue.issue_status = "Published"
ORDER BY Issue.issue_year, Issue.issue_periodnum, Manuscript.manu_pagenb;

DROP VIEW IF EXISTS ReviewQueue;
CREATE VIEW ReviewQueue AS
Select Manuscript.manu_id as `Manuscript ID`,
 Manuscript_has_Author.Author_author_id AS `Primary author`,
  Reviewer_assignment.Reviewer_reviewer_id AS `Reviewers`
FROM Manuscript
LEFT JOIN
Manuscript_has_Author ON Manuscript.manu_id = Manuscript_has_Author.Manuscript_manu_id
LEFT JOIN
Reviewer_assignment ON Manuscript.manu_id = Reviewer_assignment.Manuscript_manu_id
WHERE Manuscript.manu_status = 2;

DELIMITER $$
DROP FUNCTION IF EXISTS ViewRevId;
CREATE FUNCTION ViewRevId(reviewer int) RETURNS INT
DETERMINISTIC
BEGIN
SET @rev_id = reviewer;
RETURN @rev_id;
END; $$
DELIMITER ;


DROP VIEW IF EXISTS ReviewStatus;
CREATE VIEW ReviewStatus AS
SELECT Feedback.Manuscript_manu_id AS `Manuscript ID`,
Manuscript.manu_title AS `Manuscript Title`,
Reviewer_assignment.assigned_date AS `Assigned date`,
Feedback_feedback_id AS `Feedback ID`,
Feedback.feedback_appropr AS `Appropriateness`,
Feedback.feedback_clarity AS `Clarity`,
Feedback.feedback_method As `Method`,
Feedback.feedback_exp AS `Experimental results`,
Feedback.feedback_decision AS `Decision`
FROM Reviewer_assignment
JOIN Feedback
ON Feedback.feedback_id = Reviewer_assignment.Feedback_feedback_id
JOIN Manuscript
WHERE Feedback.Manuscript_manu_id = Manuscript.manu_id AND Reviewer_reviewer_id = viewRevId(2);


DROP VIEW IF EXISTS WhatsLeft;
CREATE VIEW WhatsLeft AS
SELECT manu_id AS `Manuscript ID`,
manu_status As `Status`,
updated_at AS `TimeStamp`
FROM Manuscript;

DELIMITER $$
DROP FUNCTION IF EXISTS ViewRevId;
CREATE FUNCTION ViewRevId(reviewer int) RETURNS INT
DETERMINISTIC
BEGIN
SET @rev_id = reviewer;
RETURN @rev_id;
END; $$
DELIMITER ;

DROP VIEW IF EXISTS ReviewStatus;
CREATE VIEW ReviewStatus AS
SELECT Reviewer_assignment.assigned_date AS `Assigned date`,
Feedback.Manuscript_manu_id AS `Manuscript ID`,
Manuscript.manu_title AS `Manuscript Title`,
Feedback_feedback_id AS `Feedback ID`,
Feedback.feedback_appropr AS `Appropriateness`,
Feedback.feedback_clarity AS `Clarity`,
Feedback.feedback_method As `Methodology`,
Feedback.feedback_exp AS `Experimental results`,
Feedback.feedback_decision AS `Recommendation`
FROM Reviewer_assignment
JOIN Feedback
ON Feedback.feedback_id = Reviewer_assignment.Feedback_feedback_id
JOIN Manuscript
WHERE Feedback.Manuscript_manu_id = Manuscript.manu_id AND Reviewer_reviewer_id = viewRevId(2)
ORDER BY Feedback.feedback_date;
