-- Find the most active user (the user with the highest number of posts)

SELECT post_author_Id AS 'User Id',
COUNT(*) AS 'Number_of_Posts'
FROM USER_POST_T
GROUP BY post_author_Id
ORDER BY Number_of_Posts
DESC
LIMIT 1;

-- Find all the posts made by a specific user

SELECT userId AS 'User Id', 
CONCAT(first_name,' ',last_name) AS 'User Name', 
t2.post_author_Id AS 'Post Id',
t2.post_content AS 'Post Content',
t2.post_time_stamp AS 'Time Stamp',
t2.post_likes AS 'Post Likes'
FROM USER_T AS t1
INNER JOIN USER_POST_T AS t2
ON t1.userId = t2.post_author_Id
WHERE userId = 6;

-- Find all the comments made by a specific user on a specific post

SELECT t1.userId AS 'User Id', 
CONCAT(t1.first_name,' ',t1.last_name) AS 'User Name',
t2.post_content AS 'Post Content', 
t3.content AS 'Comments'
FROM USER_T AS t1
INNER JOIN USER_POST_T t2
ON t1.userId = t2.post_author_Id
INNER JOIN COMMENT_T t3
ON t2.post_Id = t3.post_Id
WHERE t1.userId = 6;


-- Find all the groups a specific user is a member of

SELECT t3.group_Id AS 'Group Id',
t3.group_name AS 'Group Name',
CONCAT(t1.first_name,' ',t1.last_name) AS 'User Name'
FROM USER_T t1
INNER JOIN USER_GROUP_T t2
ON t1.userId = t2.userId
INNER JOIN GROUP_T t3
ON t3.group_Id = t2.group_Id
WHERE t1.userId = 4;

-- Find all the posts made by the members of a specific group

SELECT t1.post_author_Id AS 'User Id', 
t1.post_time_stamp AS 'Time Stamp',
t2.group_Id
FROM USER_POST_T t1
INNER JOIN USER_GROUP_T t2
ON t1.post_author_Id = t2.userId
WHERE t2.group_Id =2;

-- Find the most liked post

Select post_Id, post_author_Id, post_content, post_likes
FROM USER_POST_T
WHERE post_likes  
IN (SELECT MAX(post_likes)
FROM USER_POST_T);

-- Find the users who have not made any post

SELECT UserId AS 'User Id',
CONCAT(first_name,' ',last_name) AS 'User Name'
FROM USER_T
WHERE userId
NOT IN(SELECT post_author_Id
FROM USER_POST_T);


-- Find the users who have made at least one post but have not made any comment

SELECT userId AS 'User Id', 
CONCAT(first_name,' ',last_name) AS 'User Name'
FROM USER_T 
WHERE

NOT EXISTS(
SELECT post_Id
FROM USER_POST_T 
WHERE USER_POST_T.post_author_Id = USER_T .userId)

AND

EXISTS(
SELECT comment_Id
FROM COMMENT_T 
WHERE COMMENT_T.userId = USER_T.userId);

-- Mutual friends between 2 users

drop view friend1_V;
drop view friend2_V;

CREATE view friend1_V AS 
SELECT friend_Id
FROM USER_FRIEND_T
WHERE userId = 1 and request_status = 'ACCEPTED';

CREATE VIEW friend2_V AS
SELECT friend_Id 
FROM USER_FRIEND_T 
WHERE userId = 2 and request_status = 'ACCEPTED';

SELECT friend1_V.friend_Id AS 'Mutual Friends'
FROM friend1_V
INNER JOIN friend2_V
ON friend1_V.friend_Id = friend2_V.friend_Id;

-- Procedure to get number of friends of a user

DROP PROCEDURE get_no_of_friends_proc;
DELIMITER $$

CREATE PROCEDURE get_no_of_friends_proc(IN Id INTEGER, OUT numOfFriends INTEGER)
BEGIN
	SELECT no_of_friends INTO numOfFriends
	FROM USER_T
	WHERE userId = Id;
END $$

DELIMITER ;

CALL get_no_of_friends_proc(4, @numOfFriends);

SELECT @numOfFriends AS 'Number of Friends';

-- Procedure to find the sum of likes on all posts posted by a user

DROP PROCEDURE get_sum_of_likes_proc;
DELIMITER $$

CREATE PROCEDURE get_sum_of_likes_proc(IN Id INTEGER, OUT numOfLikes INTEGER)
BEGIN
	Select SUM(post_likes) INTO numOfLikes
	FROM USER_POST_T t1
	INNER JOIN USER_T t2
	ON t1.post_author_Id = t2.userId
	WHERE userId = Id
	GROUP BY post_author_Id;
END $$

DELIMITER ;

CALL get_sum_of_likes_proc(4, @numOfLikes);

SELECT @numOfFriends AS 'Number of Likes';



