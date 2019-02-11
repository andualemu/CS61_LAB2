INSERT INTO `Editor` (`editor_minaverage`) VALUES (40);
INSERT INTO `Icode` (`subject`) VALUES ("biology");
INSERT INTO `Author` (`author_name`, `author_email`, `author_affil`) VALUES ("Andu", "andu@gmail.com", "Dart");
INSERT INTO `Author` (`author_name`, `author_email`, `author_affil`) VALUES ("Abel", "abel@gmail.com", "BGS");
INSERT INTO `Author` (`author_name`, `author_email`, `author_affil`) VALUES ("Chala", "chala@gmail.com", "MIT");

INSERT INTO `Manuscript` (`manu_title`,`manu_pagenb`,`Editor_editor_id`,`Icode_Icode_num`,`Issue_Issue_id`,`manu_status`) VALUES ("vulputate, lacus. Cras",3,1,1,NULL,9),("gravida. Praesent eu",6,1,1,NULL,7),("feugiat placerat velit. Quisque",7,1,1,NULL,4),("Sed nunc est, mollis",1,1,1,NULL,1),("Quisque",10,1,1,NULL,10),("Mauris",6,1,1,NULL,7),("bibendum sed, est.",4,1,1,NULL,7),("felis.",6,1,1,NULL,9),("dolor sit amet, consectetuer",8,1,1,NULL,1),("eget lacus.",1,1,1,NULL,10);

INSERT INTO Manuscript_has_Author (Manuscript_manu_id, Author_author_id) VALUES (11, 3), (11, 2), (11, 1), (13, 1), (12, 1),(14, 2);
