
-- -----------------------------------------------------
-- Data for table `mydb`.`department`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`department` (`department_id`, `department_name`) VALUES (1, 'HR');
INSERT INTO `mydb`.`department` (`department_id`, `department_name`) VALUES (2, 'IT');
INSERT INTO `mydb`.`department` (`department_id`, `department_name`) VALUES (3, 'production');
INSERT INTO `mydb`.`department` (`department_id`, `department_name`) VALUES (4, 'sales');
INSERT INTO `mydb`.`department` (`department_id`, `department_name`) VALUES (5, 'purchasing');
INSERT INTO `mydb`.`department` (`department_id`, `department_name`) VALUES (6, 'R&D');
INSERT INTO `mydb`.`department` (`department_id`, `department_name`) VALUES (7, 'accounting');
INSERT INTO `mydb`.`department` (`department_id`, `department_name`) VALUES (8, 'H&S');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`employee` (`id`, `pesel`, `first_name`, `surname`, `DOB`, `department_id`) VALUES (1, '91010211111', 'Anna', 'Adamska', '1991-01-02', 1);
INSERT INTO `mydb`.`employee` (`id`, `pesel`, `first_name`, `surname`, `DOB`, `department_id`) VALUES (2, '83080822222', 'Adam', 'Nowicki', '1983-08-08', 1);
INSERT INTO `mydb`.`employee` (`id`, `pesel`, `first_name`, `surname`, `DOB`, `department_id`) VALUES (3, '83010133333', 'Olga', 'Nowicka', '1983-01-01', 1);
INSERT INTO `mydb`.`employee` (`id`, `pesel`, `first_name`, `surname`, `DOB`, `department_id`) VALUES (4, '90112744444', 'Marcin', 'Absolutny', '1990-11-27', 2);
INSERT INTO `mydb`.`employee` (`id`, `pesel`, `first_name`, `surname`, `DOB`, `department_id`) VALUES (5, '93101055555', 'Tomasz', 'Kowal', '1993-10-10', 2);
INSERT INTO `mydb`.`employee` (`id`, `pesel`, `first_name`, `surname`, `DOB`, `department_id`) VALUES (6, '82020266666', 'Hanna', 'Klimas', '1982-02-02', 2);
INSERT INTO `mydb`.`employee` (`id`, `pesel`, `first_name`, `surname`, `DOB`, `department_id`) VALUES (7, '77070777777', 'Emil', 'Drewno', '1977-07-07', 3);
INSERT INTO `mydb`.`employee` (`id`, `pesel`, `first_name`, `surname`, `DOB`, `department_id`) VALUES (8, '88080888888', 'Piotr', 'Portas', '1988-08-08', 3);
INSERT INTO `mydb`.`employee` (`id`, `pesel`, `first_name`, `surname`, `DOB`, `department_id`) VALUES (9, '90090999999', 'Ewa', 'Adamska', '1990-09-09', 3);
INSERT INTO `mydb`.`employee` (`id`, `pesel`, `first_name`, `surname`, `DOB`, `department_id`) VALUES (10, '80101000001', 'Nikodem', 'Dyzma', '1980-10-10', 4);
INSERT INTO `mydb`.`employee` (`id`, `pesel`, `first_name`, `surname`, `DOB`, `department_id`) VALUES (11, '90090999998', 'Marcin', 'Adamski', '1990-09-09', 5);
INSERT INTO `mydb`.`employee` (`id`, `pesel`, `first_name`, `surname`, `DOB`, `department_id`) VALUES (12, '80101000011', 'Tomasz', 'Matyja', '1980-10-10', 6);
INSERT INTO `mydb`.`employee` (`id`, `pesel`, `first_name`, `surname`, `DOB`, `department_id`) VALUES (13, '77070700007', 'Antoni', 'Nowak', '1977-07-07', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`project`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`project` (`project_id`, `project_name`, `location`) VALUES (1, 'cheetah', 'I');
INSERT INTO `mydb`.`project` (`project_id`, `project_name`, `location`) VALUES (2, 'tiger', 'I');
INSERT INTO `mydb`.`project` (`project_id`, `project_name`, `location`) VALUES (3, 'leo', 'I');
INSERT INTO `mydb`.`project` (`project_id`, `project_name`, `location`) VALUES (4, 'wildcat', 'I');
INSERT INTO `mydb`.`project` (`project_id`, `project_name`, `location`) VALUES (5, 'bobcat', 'E');
INSERT INTO `mydb`.`project` (`project_id`, `project_name`, `location`) VALUES (6, 'sphinx', 'E');
INSERT INTO `mydb`.`project` (`project_id`, `project_name`, `location`) VALUES (7, 'timespan', 'E');
INSERT INTO `mydb`.`project` (`project_id`, `project_name`, `location`) VALUES (8, 'puma', 'E');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`employee_projects`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`employee_projects` (`employee_id`, `project_id`, `date_of_start_in_the_project`, `date_of_finish_in_the_project`, `role`, `daily_rate`) VALUES (1, 1, '2015-01-01', NULL, 'PL', 20.00);
INSERT INTO `mydb`.`employee_projects` (`employee_id`, `project_id`, `date_of_start_in_the_project`, `date_of_finish_in_the_project`, `role`, `daily_rate`) VALUES (2, 3, '2016-01-01', NULL, 'TCD', 8.00);
INSERT INTO `mydb`.`employee_projects` (`employee_id`, `project_id`, `date_of_start_in_the_project`, `date_of_finish_in_the_project`, `role`, `daily_rate`) VALUES (2, 4, '2016-05-30', NULL, 'DEV', 15.50);
INSERT INTO `mydb`.`employee_projects` (`employee_id`, `project_id`, `date_of_start_in_the_project`, `date_of_finish_in_the_project`, `role`, `daily_rate`) VALUES (3, 2, '2014-03-03', '2015-11-11', 'FCD', 17.60);
INSERT INTO `mydb`.`employee_projects` (`employee_id`, `project_id`, `date_of_start_in_the_project`, `date_of_finish_in_the_project`, `role`, `daily_rate`) VALUES (4, 3, '2014-03-03', NULL, 'PL', 20.00);
INSERT INTO `mydb`.`employee_projects` (`employee_id`, `project_id`, `date_of_start_in_the_project`, `date_of_finish_in_the_project`, `role`, `daily_rate`) VALUES (5, 3, '2014-03-03', NULL, 'FCD', 14.40);
INSERT INTO `mydb`.`employee_projects` (`employee_id`, `project_id`, `date_of_start_in_the_project`, `date_of_finish_in_the_project`, `role`, `daily_rate`) VALUES (6, 4, '2014-03-03', NULL, 'PL', 20.00);
INSERT INTO `mydb`.`employee_projects` (`employee_id`, `project_id`, `date_of_start_in_the_project`, `date_of_finish_in_the_project`, `role`, `daily_rate`) VALUES (7, 4, '2014-03-03', '2015-11-11', 'DEV', 17.00);
INSERT INTO `mydb`.`employee_projects` (`employee_id`, `project_id`, `date_of_start_in_the_project`, `date_of_finish_in_the_project`, `role`, `daily_rate`) VALUES (8, 5, '2014-03-03', '2015-11-11', 'TCD', 10.00);
INSERT INTO `mydb`.`employee_projects` (`employee_id`, `project_id`, `date_of_start_in_the_project`, `date_of_finish_in_the_project`, `role`, `daily_rate`) VALUES (9, 5, '2014-03-03', NULL, 'PL', 21.00);
INSERT INTO `mydb`.`employee_projects` (`employee_id`, `project_id`, `date_of_start_in_the_project`, `date_of_finish_in_the_project`, `role`, `daily_rate`) VALUES (10, 5, '2014-03-03', NULL, 'FCD', 12.00);
INSERT INTO `mydb`.`employee_projects` (`employee_id`, `project_id`, `date_of_start_in_the_project`, `date_of_finish_in_the_project`, `role`, `daily_rate`) VALUES (11, 6, '2014-03-03', NULL, 'PL', 20.00);
INSERT INTO `mydb`.`employee_projects` (`employee_id`, `project_id`, `date_of_start_in_the_project`, `date_of_finish_in_the_project`, `role`, `daily_rate`) VALUES (12, 7, '2014-03-03', '2015-11-11', 'TCD', 14.00);
INSERT INTO `mydb`.`employee_projects` (`employee_id`, `project_id`, `date_of_start_in_the_project`, `date_of_finish_in_the_project`, `role`, `daily_rate`) VALUES (1, 2, '2014-02-02', '2015-10-10', 'TCD', 10.00);
INSERT INTO `mydb`.`employee_projects` (`employee_id`, `project_id`, `date_of_start_in_the_project`, `date_of_finish_in_the_project`, `role`, `daily_rate`) VALUES (12, 7, '2015-11-12', NULL, 'DEV', 18.00);

COMMIT;

