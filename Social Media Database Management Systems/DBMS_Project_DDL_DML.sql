/*-------------------------CMPS-5303-201 Adv Database Mgmt Systems Spring Semester 2023------------------------- */
/*------------------------------------Team# 04 Project - DDL and DML-------------------------------------------- */
/*----------------------------------Done by MD & Nitish Kumar Kumar--------------------------------------------- */

/*Project Description

/*Our Social Media Database project aims to develop a comprehensive database system.  It can handle vast amounts of data inserted using CSV files or SQL queries. */
/*This system will enable users to store, organize, and analyze social media data using MySQL commands. The database is designed to be scalable so it can incorporate */
/*cutting-edge data processing technologies to ensure that the system can handle large volumes of data with speed and efficiency. Ultimately, the Social Media Database */
/*project seeks to help students, businesses, and organizations understand how social media databases work and achieve their objectives. */






/*-------------Drop tables------------- */
/* There are six tables dropped in this code. They are: USER_T, USER_FRIEND_T, USER_POST_T, GROUP_T, COMMENT_T, and USER_GROUP_T  */

Set FOREIGN_KEY_CHECKS = 0;

DROP TABLE USER_T;
DROP TABLE USER_FRIEND_T;
DROP TABLE USER_POST_T;
DROP TABLE GROUP_T;
DROP TABLE COMMENT_T;
DROP TABLE USER_GROUP_T;

Set FOREIGN_KEY_CHECKS = 1;

/*------------Create tables------------ */
/* There are five tables created in this code. They are: USER_T, USER_FRIEND_T, USER_POST_T, GROUP_T, COMMENT_T and USER_GROUP_T. */


/* Create USER_T */
/* This table is used to store user information. It includes*/ 
/*columns such as userId, first_name, last_name, birth_date, 
/*account_created_date, location, 
/* no_of_friends, and occupation. */

CREATE TABLE USER_T
(userId INTEGER,
first_name VARCHAR(30),
last_name VARCHAR(30),
birth_date DATE,
account_created_date Date,
location VARCHAR(40),
no_of_friends INTEGER,
occupation VARCHAR(30),
PRIMARY KEY(userId)
);

/* Create USER_FRIEND_T */
/* This table is used to store the relationship between users and their friends.  */
/* It includes columns such as userId, friend_Id, date_added, request_status, */
/* relationship_status, and block_status. */


CREATE TABLE USER_FRIEND_T
(userId INTEGER,
friend_Id INTEGER,
date_added DATE NOT NULL,
request_status VARCHAR(20) NOT NULL,
relationship_status VARCHAR(20),
block_status VARCHAR(20) NOT NULL,
PRIMARY KEY(userId, friend_Id)
);

/* Create USER_POST_T */
/* This table is used to store user posts.*/ 
/*It includes columns such as post_Id, post_content*/
/*, post_time_stamp, post_location, and*/
/*post_likes. */

CREATE table USER_POST_T
(post_Id INTEGER,
post_content VARCHAR(200) NOT NULL,
post_time_stamp DATETIME NOT NULL,
post_location VARCHAR(30) NOT NULL,
post_likes INTEGER NOT NULL,
PRIMARY KEY(post_Id)  
);

/* Create COMMENT_T */

/* This table is used to store information about user groups.*/
/* It includes columns such as group_Id, group_name,*/
/* group_description, group_creator, group_creation_date, and group_members. */

CREATE TABLE COMMENT_T
(comment_Id INTEGER,
content VARCHAR(200) NOT NULL,
time_stamp DATETIME NOT NULL,
PRIMARY KEY(comment_Id)
);

/* Create GROUP_T table */
/* This table is used to store the relationship between users*/
/* and the groups they belong to. It includes columns such as userId and group_Id. */


CREATE TABLE GROUP_T
(group_Id INTEGER,
group_name VARCHAR(30) NOT NULL,
group_description VARCHAR(200),
group_creator VARCHAR(20) NOT NULL,
group_creation_date DATE NOT NULL,
group_members INTEGER NOT NULL,
PRIMARY KEY(group_Id)
);

/* Create USER_GROUP_T table  */
/* This table is used to store the relationship between users*/ 
/*and the groups they belong to. It includes columns such as userId*/ 
/*and group_Id. */

CREATE TABLE  USER_GROUP_T
(userId INTEGER,
group_Id INTEGER,
PRIMARY KEY(userId, group_Id)
);

/* Adding foreign key to USER_FRIEND_T */
/* There are several foreign keys added to the tables to */
/*establish relationships between them. The foreign keys added are: */
/* userId and friend_Id columns in USER_FRIEND_T table referencing*/ 
/* userId column in USER_T table. */

Alter Table USER_FRIEND_T
ADD FOREIGN KEY (userId) REFERENCES USER_T(userId);

Alter Table USER_FRIEND_T
ADD FOREIGN KEY (friend_Id) REFERENCES USER_T(userId);

/* Adding foreign key to USER_POST_T */
/* userId column in USER_POST_T table referencing userId column in USER_T table. */

Alter Table USER_POST_T
ADD userId Integer;

Alter Table USER_POST_T
ADD FOREIGN KEY(userId) REFERENCES USER_T(userId);

/* Adding foreign keys to COMMENT_T */
/* post_Id and userId columns in COMMENT_T table referencing post_Id and userId columns in USER_POST_T and USER_T tables respectively. */

Alter Table COMMENT_T
ADD post_Id INTEGER;

Alter Table COMMENT_T
ADD userId INTEGER;

Alter Table COMMENT_T
ADD FOREIGN KEY(userId) REFERENCES USER_T(userId);

Alter Table COMMENT_T
ADD FOREIGN KEY(post_Id) REFERENCES USER_POST_T(post_Id);

/* Renaming a column in USER_POST_T */
/* The column userId in USER_POST_T table is renamed as post_author_Id */

ALTER TABLE   USER_POST_T
CHANGE COLUMN userId post_author_Id INTEGER;  

/* Adding foreign key to USER_GROUP_T */
/* userId and groupId in the USER_GROUP_T table references userId and groupId in USER_T and GROUP_T tables respectively */

Alter Table USER_GROUP_T
ADD FOREIGN KEY(userId) REFERENCES USER_T(userId),
ADD FOREIGN KEY(group_Id) REFERENCES GROUP_T(group_Id);



/* ---------- Adding Dummy Data's ------------

/* DUMMY DATA FOR USER_T */
/* Dummy data is added to the USER_T table with 20 rows of user information. */

INSERT INTO USER_T VALUES 
(1, 'John', 'Doe', '1995-01-01', '2021-01-01', 'New York', 5, 'Engineer'),
(2, 'Jane', 'Doe', '1997-05-12', '2021-03-10', 'Los Angeles', 10, 'Designer'),
(3, 'Bob', 'Smith', '1985-11-30', '2020-12-01', 'Chicago', 10, 'Accountant'),
(4, 'Alice', 'Brown', '1992-07-08', '2021-02-14', 'Miami', 2, 'Teacher'),
(5, 'David', 'Lee', '1999-12-25', '2020-11-11', 'San Francisco', 5, 'Student'),
(6, 'Emily', 'Wong', '1990-03-15', '2021-04-20', 'Toronto', 7, 'Manager'),
(7, 'Chris', 'Evans', '1981-06-13', '2020-10-01', 'Boston', 3, 'Actor'),
(8, 'Emma', 'Stone', '1988-11-06', '2021-03-05', 'New York', 8, 'Actress'),
(9, 'Ryan', 'Gosling', '1980-11-12', '2021-02-01', 'Los Angeles', 8, 'Actor'),
(10, 'Mila', 'Kunis', '1983-08-14', '2021-01-15', 'Chicago', 7, 'Actress'),
(11, 'Tom', 'Hanks', '1956-07-09', '2020-12-31', 'Los Angeles', 5, 'Actor'),
(12, 'Brad', 'Pitt', '1963-12-18', '2021-02-20', 'New York', 4, 'Actor'),
(13, 'Angelina', 'Jolie', '1975-06-04', '2021-03-15', 'Los Angeles', 2, 'Actress'),
(14, 'Leonardo', 'DiCaprio', '1974-11-11', '2020-11-01', 'Los Angeles', 3, 'Actor'),
(15, 'Jennifer', 'Aniston', '1969-02-11', '2021-01-10', 'New York', 8, 'Actress'),
(16, 'Matthew', 'McConaughey', '1969-11-04', '2020-10-20', 'Austin', 2, 'Actor'),
(17, 'Robert', 'Downey Jr.', '1965-04-04', '2021-04-01', 'Los Angeles', 3, 'Actor'),
(18, 'Scarlett', 'Johansson', '1984-11-22', '2021-02-15', 'New York', 6, 'Actress'),
(19, 'Mark', 'Ruffalo', '1967-11-22', '2020-12-15', 'Los Angeles', 4, 'Actor'),
(20, 'Chris', 'Hemsworth', '1983-08-11', '2021-01-20', 'Sydney', 9, 'Actor');


/* DUMMY DATA FOR USER_FRIEND_T */
/* Dummy data is added to the USER_FRIEND_T table with 20 rows of user information. */

INSERT INTO USER_FRIEND_T VALUES 
(1, 2, '2021-01-02', 'ACCEPTED', 'SINGLE', 'NOT_BLOCKED'),
(1, 3, '2021-01-03', 'ACCEPTED', 'MARRIED', 'NOT_BLOCKED'),
(1, 4, '2021-01-04', 'PENDING', NULL, 'NOT_BLOCKED'),
(1, 5, '2021-01-05', 'ACCEPTED', 'SINGLE', 'BLOCKED'),
(2, 3, '2021-02-01', 'ACCEPTED', 'SINGLE', 'NOT_BLOCKED'),
(2, 6, '2021-02-02', 'ACCEPTED', 'SINGLE', 'NOT_BLOCKED'),
(2, 7, '2021-02-03', 'ACCEPTED', 'SINGLE', 'NOT_BLOCKED'),
(2, 8, '2021-02-04', 'ACCEPTED', 'SINGLE', 'BLOCKED'),
(3, 4, '2021-03-01', 'ACCEPTED', 'MARRIED', 'NOT_BLOCKED'),
(3, 9, '2021-03-02', 'ACCEPTED', 'MARRIED', 'NOT_BLOCKED'),
(3, 10, '2021-03-03', 'ACCEPTED', 'MARRIED', 'BLOCKED'),
(4, 11, '2021-04-01', 'ACCEPTED', 'SINGLE', 'NOT_BLOCKED'),
(4, 12, '2021-04-02', 'ACCEPTED', 'SINGLE', 'NOT_BLOCKED'),
(4, 13, '2021-04-03', 'ACCEPTED', 'SINGLE', 'BLOCKED'),
(5, 14, '2021-05-01', 'PENDING', NULL, 'NOT_BLOCKED'),
(5, 15, '2021-05-02', 'PENDING', NULL, 'NOT_BLOCKED'),
(5, 16, '2021-05-03', 'PENDING', NULL, 'BLOCKED'),
(6, 17, '2021-06-01', 'ACCEPTED', 'SINGLE', 'NOT_BLOCKED'),
(6, 18, '2021-06-02', 'ACCEPTED', 'SINGLE', 'NOT_BLOCKED'),
(6, 19, '2021-06-03', 'ACCEPTED', 'SINGLE', 'NOT_BLOCKED');


/* DUMMY DATA FOR USER_POST_T */
/* Dummy data is added to the USER_POST_T table with 20 rows of user information. */

INSERT INTO USER_POST_T VALUES
(1, 'Hello World!', '2021-01-01 10:00:00', 'New York', 10, 5),
(2, 'My first post!', '2021-01-02 14:30:00', 'Los Angeles', 5, 6),
(3, 'I love this app', '2021-01-03 18:45:00', 'London', 20, 5),
(4, 'Check out my new video', '2021-01-04 12:15:00', 'Paris', 15, 7),
(5, 'I had a great weekend!', '2021-01-05 09:00:00', 'Tokyo', 8, 5),
(6, 'I just finished a new project', '2021-01-06 16:20:00', 'San Francisco', 12, 18),
(7, 'Happy birthday to me!', '2021-01-07 11:00:00', 'New York', 2, 6),
(8, 'I just got a promotion!', '2021-01-08 13:45:00', 'Los Angeles', 18, 6),
(9, 'I can\'t believe it\'s already Friday', '2021-01-09 17:30:00', 'London', 7, 7),
(10, 'I\'m so excited for my vacation', '2021-01-10 08:00:00', 'Paris', 14, 13),
(11, 'This is my new favorite restaurant', '2021-02-01 19:00:00', 'New York', 30, 6),
(12, 'I just ran a marathon!', '2021-02-02 11:30:00', 'Los Angeles', 22, 15),
(13, 'I love spending time with my family', '2021-02-03 15:45:00', 'London', 12, 18),
(14, 'This concert was amazing!', '2021-02-04 20:00:00', 'Paris', 28, 6),
(15, 'I just adopted a new puppy', '2021-02-05 10:00:00', 'Tokyo', 9, 1),
(16, 'I can\'t wait for spring', '2021-02-06 14:00:00', 'San Francisco', 16, 18),
(17, 'I\'m learning to cook', '2021-02-07 18:30:00', 'New York', 11, 19),
(18, 'I just finished a great book', '2021-02-08 12:45:00', 'Los Angeles', 20, 2),
(19, 'I\'m taking a photography class', '2021-02-09 16:15:00', 'London', 13, 4),
(20, 'I\'m starting a new job next week', '2021-02-10 09:00:00', 'Paris', 17, 7);


/* DUMMY DATA FOR COMMENT_T */
/* Dummy data is added to the COMMENT_T table with 20 rows of user information. */

INSERT INTO COMMENT_T VALUES
(1, 'Great post!', '2021-01-01 11:00:00', 6, 8),
(2, 'I totally agree', '2021-01-02 15:30:00', 2, 3),
(3, 'Can you share the recipe?', '2021-01-03 19:00:00', 7, 9),
(4, 'Awesome video!', '2021-01-04 13:30:00', 1, 11),
(5, 'Looks like you had a lot of fun', '2021-01-05 10:30:00', 5, 14),
(6, 'Congratulations!', '2021-01-06 17:00:00', 7, 13),
(7, 'Happy birthday!', '2021-01-07 12:30:00', 4, 16),
(8, 'That\'s fantastic news!', '2021-01-08 14:00:00', 3, 1),
(9, 'TGIF!', '2021-01-09 18:30:00', 8, 20),
(10, 'Have a great time!', '2021-01-10 09:30:00', 6, 2),
(11, 'I\'ll have to try that restaurant', '2021-02-01 20:30:00', 6, 5),
(12, 'Wow, that\'s impressive!', '2021-02-02 12:30:00', 7, 8),
(13, 'Family time is the best', '2021-02-03 16:00:00', 6, 7),
(14, 'I wish I could have been there!', '2021-02-04 21:00:00', 5, 12),
(15, 'Puppies are the best!', '2021-02-05 11:30:00', 9, 18),
(16, 'I am looking forward to spring too', '2021-02-06 15:00:00', 15, 4),
(17, 'Good luck with your cooking', '2021-02-07 19:30:00', 6, 17),
(18, 'What book did you read?', '2021-02-08 13:00:00', 19, 6),
(19, 'Photography is a great hobby', '2021-02-09 17:15:00', 7, 15),
(20, 'Congratulations on the new job!', '2021-02-10 10:00:00', 7, 10);


/* DUMMY DATA FOR GROUP_T */
/* Dummy data is added to the GROUP_T table with 20 rows of user information. */

INSERT INTO GROUP_T VALUES
(1, 'Book Club', 'A group for book lovers', 'Jane Smith', '2021-01-01', 10),
(2, 'Fitness Fanatics', 'A group for fitness enthusiasts', 'John Doe', '2021-01-02', 20),
(3, 'Photography Club', 'A group for photography enthusiasts', 'Sarah Johnson', '2021-01-03', 15),
(4, 'Cooking Class', 'A group for cooking enthusiasts', 'Mike Brown', '2021-01-04', 12);


/* DUMMY DATA FOR USER_GROUP_T */
/* Dummy data is added to the USER_GROUP_T table with 20 rows of user information. */

INSERT INTO USER_GROUP_T VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3),
(3, 1),
(3, 2),
(4, 1),
(4, 4),
(5, 4),
(5, 1),
(6, 2),
(6, 3),
(7, 4),
(7, 1),
(8, 2),
(8, 3),
(9, 4),
(9, 1),
(10, 2),
(10, 3);


/* --------- Show all the table data ---------- */ 

select * from USER_T; 
select * from USER_FRIEND_T;
select * from COMMENT_T; 
select * from USER_GROUP_T;
select * from USER_POST_T; 