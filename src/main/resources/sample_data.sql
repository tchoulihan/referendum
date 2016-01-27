INSERT INTO `poll_type` (id, name)
	VALUES (1,'Range');
INSERT INTO `poll_sum_type` (id, name)
	VALUES (1,'Average'),(2,'Median'),(3,'Normalized');
INSERT INTO `user` (id, ip_address) 
	VALUES (1,'127.0.0.1'),(2,'test'),(3,'test3');
INSERT INTO `discussion` (`id`,`subject`,`text`)
	VALUES (1,'test 123','**deaaard**\r\n\r\n### fdasdf\r\n\r\n'),(2,'fgagsfsdf','gagsdf'),(3,'asdfasdf','czxvxzvxz'),(4,'ffasdf','asdf'),(5,'this is a candidate','kl\r\n### asdflkjadlsf\r\n\r\naf\r\n\r\n\r\nasdf');
INSERT INTO `poll` (id, poll_type_id,poll_sum_type_id,discussion_id,user_id,private_password)
	VALUES (1,1,1,1,1,NULL);
INSERT INTO `candidate` (`id`,`poll_id`,`discussion_id`,`user_id`)
	VALUES (1,1,2,1),(2,1,3,1),(3,1,4,2),(4,1,5,3);
INSERT INTO `ballot` (`id`,`poll_id`,`user_id`,`candidate_id`,`rank`)
	VALUES (1,1,1,1,82),(5,1,1,2,20),(8,1,1,4,32),(9,1,2,2,38),(10,1,3,2,67);


INSERT INTO `comment` (id,discussion_id, text, user_id)
	VALUES (1,1,'Level 1',1),(2,1,'Level 2',2),(3,1,'Level 2',3),(4,1,'Level 3',2),(5,1,'Level 4',1),
	(6,1,'Level 1',2);
INSERT INTO `comment_tree` (parent_id, child_id, path_length) 
	VALUES 	(1,1,0) , (1,2,1) , (1,3,1) , (1,4,2) , (1,5,3)	,
			(2,2,0) , 
			(3,3,0) ,                     (3,4,1) ,	(3,5,2)	,
			(4,4,0) ,					  			(4,5,1)	,
			(5,5,0)	,
			(6,6,0)
			;
INSERT INTO `comment_rank` (comment_id, user_id, rank)
	VALUES (2,1,30),(1,2,60),(2,3,50),(3,2,75),(4,3,12),(4,1,81);

