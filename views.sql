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
Select Manuscript.manu_id, Manuscript_has_Author.Author_author_id, Reviewer_assignment.Reviewer_reviewer_id
FROM Manuscript
LEFT JOIN
Manuscript_has_Author ON Manuscript.manu_id = Manuscript_has_Author.Manuscript_manu_id
LEFT JOIN
Reviewer_assignment ON Manuscript.manu_id = Reviewer_assignment.Manuscript_manu_id
WHERE Manuscript.manu_status = 2;
