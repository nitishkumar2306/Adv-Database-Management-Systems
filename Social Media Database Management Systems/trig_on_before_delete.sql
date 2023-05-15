DROP TRIGGER IF EXISTS trig_on_before_delete_userpost;

CREATE TRIGGER IF NOT EXISTS
trig_on_before_delete_userpost
BEFORE DELETE
ON USER_POST_T
FOR EACH ROW
DELETE FROM COMMENT_T WHERE post_Id = OLD.post_Id;