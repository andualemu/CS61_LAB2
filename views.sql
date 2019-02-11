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
