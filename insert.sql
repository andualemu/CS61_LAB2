INSERT INTO `Editor` (`editor_minaverage`) VALUES (40);
INSERT INTO `Icode` (`subject`) VALUES ("biology");
INSERT INTO `Author` (`author_name`, `author_email`, `author_affil`) VALUES ("Andu", "andu@gmail.com", "Dart");
INSERT INTO `Author` (`author_name`, `author_email`, `author_affil`) VALUES ("Abel", "abel@gmail.com", "BGS");
INSERT INTO `Author` (`author_name`, `author_email`, `author_affil`) VALUES ("Chala", "chala@gmail.com", "MIT");

INSERT INTO `Manuscript` (`manu_title`,`manu_pagenb`,`Editor_editor_id`,`Icode_Icode_num`,`Issue_Issue_id`,`manu_status`) VALUES ("vulputate, lacus. Cras",3,1,1,NULL,9),("gravida. Praesent eu",6,1,1,NULL,7),("feugiat placerat velit. Quisque",7,1,1,NULL,4),("Sed nunc est, mollis",1,1,1,NULL,1),("Quisque",10,1,1,NULL,10),("Mauris",6,1,1,NULL,7),("bibendum sed, est.",4,1,1,NULL,7),("felis.",6,1,1,NULL,9),("dolor sit amet, consectetuer",8,1,1,NULL,1),("eget lacus.",1,1,1,NULL,10);
INSERT INTO `Manuscript` (`manu_title`,`manu_date`,`manu_pagenb`,`Editor_editor_id`,`Icode_Icode_num`,`Issue_Issue_id`,`manu_status`) VALUES('ahdioadjal', "12/07/1818", 13,1, 3, 52, 10), ('barakljop', "12/07/1818", 20,1, 3, 52, 10), ('shiaduajsda', "12/07/1818", 25,1, 3, 51, 10),("oindoada", "01/12/1990", 40,1, 3, 50, 10), ('niajkdnlad', "12/07/1818",5,1,3,54,10), ('ewpmklm', "01/12/1990", 13,1, 3, 56, 10);
INSERT INTO Manuscript_has_Author (Manuscript_manu_id, Author_author_id) VALUES (11, 3), (11, 2), (11, 1), (13, 1), (12, 1),(14, 2);


/* Insert into issue table */
insert INTO Issue (issue_id, issue_year, issue_periodnum, issue_status, issue_npages, issue_date)
VALUES (50, 2015, 1, 'Published', 120, '1000-01-01 00:00:00');
insert INTO Issue (issue_id, issue_year, issue_periodnum, issue_status, issue_npages, issue_date)
VALUES (51, 2015, 1, 'Published', 125, '1000-01-01 00:00:00');
insert INTO Issue (issue_id, issue_year, issue_periodnum, issue_status, issue_npages, issue_date)
VALUES (52, 2015, 3, 'Published', 140, '1000-01-01 00:00:00');
insert INTO Issue (issue_id, issue_year, issue_periodnum, issue_status, issue_npages, issue_date)
VALUES (53, 2017, 2, 'Published', 125, '1000-01-01 00:00:00');
insert INTO Issue (issue_id, issue_year, issue_periodnum, issue_status, issue_npages, issue_date)
VALUES (54, 2017, 4, 'Published', 100, '1000-01-01 00:00:00');
insert INTO Issue (issue_id, issue_year, issue_periodnum, issue_status, issue_npages, issue_date)
VALUES (55, 2019, 1, 'Pending', 120, '1000-01-01 00:00:00');
insert INTO Issue (issue_id, issue_year, issue_periodnum, issue_status, issue_npages, issue_date)
VALUES (56, 2019, 2, 'Pending', 114, '1000-01-01 00:00:00');

/* INSERT INTO REVIEWER_ASSIGNMENT*/
INSERT INTO Reviewer_assignment (Manuscript_manu_id, Reviewer_reviewer_id, Feedback_feedback_id, assigned_date)
VALUES(17,200, null, null), (17,206, null, null), (17, 209, null, null), (18, 200, null, null), (18, 203, null, null), (18, 210, null, null), (19,208, null, null), (1, 200, null, null), (1, 201, null, null), (1, 202, null, null), (2, 201, null, null), (2, 204, null, null), (2, 206, null, null), (3, 204, null, null), (3, 205, null, null), (4, 202, null, null);

/* INSERT INTO MANUSCRIPT_HAS_AUTHOR*/

INSERT INTO Manuscript_has_Author(Manuscript_manu_id, Author_author_id)
VALUES(1, 100), (2, 105), (3, 100), (4, 108), (5, 101), (6, 111), (7, 104), (8, 104), (9, 105), (10, 109), (4, 107);
INSERT INTO Manuscript_has_Author(Manuscript_manu_id, Author_author_id)
VALUES(16, 112), (11, 107), (12, 109), (13, 102), (14, 110), (15, 106), (17, 105), (18, 112), (19,113), (20, 115);
