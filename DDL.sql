SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`department` (
  `department_id` INT NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(45) NULL,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `department_id_UNIQUE` ON `mydb`.`department` (`department_id` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employee` (
  `id` INT NOT NULL,
  `pesel` CHAR(11) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `DOB` DATE NULL,
  `department_id` INT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `department_id`
    FOREIGN KEY (`department_id`)
    REFERENCES `mydb`.`department` (`department_id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `pesel_UNIQUE` ON `mydb`.`employee` (`pesel` ASC);

CREATE UNIQUE INDEX `user_id_UNIQUE` ON `mydb`.`employee` (`id` ASC);

CREATE INDEX `department_id_idx` ON `mydb`.`employee` (`department_id` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`project` (
  `project_id` INT NOT NULL,
  `project_name` VARCHAR(45) NULL,
  `location` VARCHAR(1) NULL,
  PRIMARY KEY (`project_id`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `project_name_UNIQUE` ON `mydb`.`project` (`project_name` ASC);

CREATE UNIQUE INDEX `project_id_UNIQUE` ON `mydb`.`project` (`project_id` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`employee_projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employee_projects` (
  `employee_id` INT NOT NULL,
  `project_id` INT NOT NULL,
  `date_of_start_in_the_project` DATE NOT NULL,
  `date_of_finish_in_the_project` DATE NULL,
  `role` VARCHAR(45) NOT NULL,
  `daily_rate` DECIMAL(4) NULL,
  CONSTRAINT `user_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `mydb`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `project_id`
    FOREIGN KEY (`project_id`)
    REFERENCES `mydb`.`project` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- View `mydb`.`current_projects`
-- -----------------------------------------------------
USE `mydb`;
CREATE  OR REPLACE VIEW `current_projects` AS
    SELECT 
        employee.id,
        employee.first_name,
        employee.surname,
        employee_projects.project_id,
        project.project_name
    FROM
        employee_projects
            INNER JOIN
        employee ON (employee.id =  employee_projects.employee_id)
            INNER JOIN
        project ON (employee_projects.project_id = project.project_id)
    WHERE
         employee_projects.date_of_finish_in_the_project = NULL;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
