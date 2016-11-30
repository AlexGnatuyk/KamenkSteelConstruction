drop database ksk;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ksk
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ksk
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ksk` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `ksk` ;

-- -----------------------------------------------------
-- Table `ksk`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`Staff` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `first_name` VARCHAR(45) NULL COMMENT '',
  `last_name` VARCHAR(45) NULL COMMENT '',
  `birthday` DATE NULL COMMENT '',
  `pasportNum` INT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksk`.`position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`position` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `position_name` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksk`.`Staff_has_position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`Staff_has_position` (
  `Staff_id` INT NOT NULL COMMENT '',
  `position_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Staff_id`, `position_id`)  COMMENT '',
  INDEX `fk_Staff_has_position_position1_idx` (`position_id` ASC)  COMMENT '',
  INDEX `fk_Staff_has_position_Staff1_idx` (`Staff_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Staff_has_position_Staff1`
    FOREIGN KEY (`Staff_id`)
    REFERENCES `ksk`.`Staff` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Staff_has_position_position1`
    FOREIGN KEY (`position_id`)
    REFERENCES `ksk`.`position` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksk`.`Salary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`Salary` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `count` INT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksk`.`Staff_has_Salary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`Staff_has_Salary` (
  `Staff_id` INT NOT NULL COMMENT '',
  `Salary_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`Staff_id`, `Salary_id`)  COMMENT '',
  INDEX `fk_Staff_has_Salary_Salary1_idx` (`Salary_id` ASC)  COMMENT '',
  INDEX `fk_Staff_has_Salary_Staff1_idx` (`Staff_id` ASC)  COMMENT '',
  CONSTRAINT `fk_Staff_has_Salary_Staff1`
    FOREIGN KEY (`Staff_id`)
    REFERENCES `ksk`.`Staff` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Staff_has_Salary_Salary1`
    FOREIGN KEY (`Salary_id`)
    REFERENCES `ksk`.`Salary` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksk`.`childs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`childs` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `first_name` VARCHAR(45) NULL COMMENT '',
  `last_name` VARCHAR(45) NULL COMMENT '',
  `Staff_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_childs_Staff1_idx` (`Staff_id` ASC)  COMMENT '',
  CONSTRAINT `fk_childs_Staff1`
    FOREIGN KEY (`Staff_id`)
    REFERENCES `ksk`.`Staff` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksk`.`boss`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`boss` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Staff_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_boss_Staff1_idx` (`Staff_id` ASC)  COMMENT '',
  CONSTRAINT `fk_boss_Staff1`
    FOREIGN KEY (`Staff_id`)
    REFERENCES `ksk`.`Staff` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksk`.`units`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`units` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `units_name` VARCHAR(45) NULL COMMENT '',
  `boss_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_units_boss1_idx` (`boss_id` ASC)  COMMENT '',
  CONSTRAINT `fk_units_boss1`
    FOREIGN KEY (`boss_id`)
    REFERENCES `ksk`.`boss` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksk`.`perfomance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`perfomance` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `text` MEDIUMTEXT NULL COMMENT '',
  `Staff_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_perfomance_Staff1_idx` (`Staff_id` ASC)  COMMENT '',
  CONSTRAINT `fk_perfomance_Staff1`
    FOREIGN KEY (`Staff_id`)
    REFERENCES `ksk`.`Staff` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksk`.`holliday`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`holliday` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `date` DATE NULL COMMENT '',
  `idStaff` INT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksk`.`task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`task` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `text` MEDIUMTEXT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksk`.`ill_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`ill_list` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `date` DATE NULL COMMENT '',
  `Staff_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_ill_list_Staff1_idx` (`Staff_id` ASC)  COMMENT '',
  CONSTRAINT `fk_ill_list_Staff1`
    FOREIGN KEY (`Staff_id`)
    REFERENCES `ksk`.`Staff` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksk`.`Objects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`Objects` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `description` MEDIUMTEXT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksk`.`units_has_task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`units_has_task` (
  `units_id` INT NOT NULL COMMENT '',
  `task_id` INT NOT NULL COMMENT '',
  `Objects_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`units_id`, `task_id`, `Objects_id`)  COMMENT '',
  INDEX `fk_units_has_task_task1_idx` (`task_id` ASC)  COMMENT '',
  INDEX `fk_units_has_task_units1_idx` (`units_id` ASC)  COMMENT '',
  INDEX `fk_units_has_task_Objects1_idx` (`Objects_id` ASC)  COMMENT '',
  CONSTRAINT `fk_units_has_task_units1`
    FOREIGN KEY (`units_id`)
    REFERENCES `ksk`.`units` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_units_has_task_task1`
    FOREIGN KEY (`task_id`)
    REFERENCES `ksk`.`task` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_units_has_task_Objects1`
    FOREIGN KEY (`Objects_id`)
    REFERENCES `ksk`.`Objects` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksk`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`inventory` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `description` MEDIUMTEXT NULL COMMENT '',
  `units_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_inventory_units1_idx` (`units_id` ASC)  COMMENT '',
  CONSTRAINT `fk_inventory_units1`
    FOREIGN KEY (`units_id`)
    REFERENCES `ksk`.`units` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksk`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`payment` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `Salary_id` INT NOT NULL COMMENT '',
  `date` DATE NULL COMMENT '',
  `Staff_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`, `Staff_id`)  COMMENT '',
  INDEX `fk_payment_Salary1_idx` (`Salary_id` ASC)  COMMENT '',
  INDEX `fk_payment_Staff1_idx` (`Staff_id` ASC)  COMMENT '',
  CONSTRAINT `fk_payment_Salary1`
    FOREIGN KEY (`Salary_id`)
    REFERENCES `ksk`.`Salary` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payment_Staff1`
    FOREIGN KEY (`Staff_id`)
    REFERENCES `ksk`.`Staff` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksk`.`units_has_position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`units_has_position` (
  `units_id` INT NOT NULL COMMENT '',
  `position_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`units_id`, `position_id`)  COMMENT '',
  INDEX `fk_units_has_position_position1_idx` (`position_id` ASC)  COMMENT '',
  INDEX `fk_units_has_position_units1_idx` (`units_id` ASC)  COMMENT '',
  CONSTRAINT `fk_units_has_position_units1`
    FOREIGN KEY (`units_id`)
    REFERENCES `ksk`.`units` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_units_has_position_position1`
    FOREIGN KEY (`position_id`)
    REFERENCES `ksk`.`position` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksk`.`units_has_Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`units_has_Staff` (
  `units_id` INT NOT NULL COMMENT '',
  `Staff_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`units_id`, `Staff_id`)  COMMENT '',
  INDEX `fk_units_has_Staff_Staff1_idx` (`Staff_id` ASC)  COMMENT '',
  INDEX `fk_units_has_Staff_units1_idx` (`units_id` ASC)  COMMENT '',
  CONSTRAINT `fk_units_has_Staff_units1`
    FOREIGN KEY (`units_id`)
    REFERENCES `ksk`.`units` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_units_has_Staff_Staff1`
    FOREIGN KEY (`Staff_id`)
    REFERENCES `ksk`.`Staff` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ksk`.`position_has_Salary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ksk`.`position_has_Salary` (
  `position_id` INT NOT NULL COMMENT '',
  `Salary_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`position_id`, `Salary_id`)  COMMENT '',
  INDEX `fk_position_has_Salary_Salary1_idx` (`Salary_id` ASC)  COMMENT '',
  INDEX `fk_position_has_Salary_position1_idx` (`position_id` ASC)  COMMENT '',
  CONSTRAINT `fk_position_has_Salary_position1`
    FOREIGN KEY (`position_id`)
    REFERENCES `ksk`.`position` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_position_has_Salary_Salary1`
    FOREIGN KEY (`Salary_id`)
    REFERENCES `ksk`.`Salary` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
