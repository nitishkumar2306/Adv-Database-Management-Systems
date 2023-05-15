DROP TABLE product_log;
DROP TRIGGER IF EXISTS trig_on_after_comment;
DELETE FROM COMMENT_T WHERE comment_Id=21;

create table product_log (
  comment_Id    INTEGER,
  username  VARCHAR(50),
  time_stamp   DATETIME,
  content VARCHAR(100),
  postId INTEGER);

CREATE TRIGGER IF NOT EXISTS
trig_on_after_comment
AFTER INSERT
ON COMMENT_T
FOR EACH ROW
INSERT INTO product_log
( comment_Id , username, time_stamp, content, postId)
VALUES
(new.comment_Id, CURRENT_USER, CURRENT_TIMESTAMP, new.content, new.post_Id);