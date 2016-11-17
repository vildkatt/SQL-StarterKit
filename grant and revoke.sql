-- Create users, grant privileges, revoke privileges --

CREATE USER 'user_ro'@'localhost' IDENTIFIED BY 'user_ro';

GRANT SELECT ON TABLE `mydb`.* TO 'user_ro'@'localhost';
REVOKE SELECT ON TABLE `mydb`.* FROM 'user_ro'@'localhost';

CREATE USER 'user_rw'@'localhost' IDENTIFIED BY 'user_rw';
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE `mydb`.`project` TO 'user_rw'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON TABLE `mydb`.`project` FROM 'user_rw'@'localhost';

SHOW GRANTS FOR 'user_ro'@'localhost';
REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'user_ro'@'localhost';
DROP USER 'user_ro'@'localhost';
