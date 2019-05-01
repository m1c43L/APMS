-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema payroll_sys
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema payroll_sys
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `payroll_sys` DEFAULT CHARACTER SET utf8 ;
USE `payroll_sys` ;

-- -----------------------------------------------------
-- Table `payroll_sys`.`PTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payroll_sys`.`PTO` (
  `pto_id` INT NOT NULL,
  `Start_Date` VARCHAR(45) NULL,
  `End_Date` VARCHAR(45) NULL,
  `Reason` VARCHAR(45) NULL,
  PRIMARY KEY (`pto_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `payroll_sys`.`Position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payroll_sys`.`Position` (
  `position_id` INT NOT NULL,
  `Position_Title` VARCHAR(45) NULL,
  `Hourly_Wage` INT NULL,
  `PTO(Initial Value)` INT NULL,
  `Work_Time_Cap` INT NULL,
  PRIMARY KEY (`position_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `payroll_sys`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payroll_sys`.`Employee` (
  `EID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Wage_increase` INT NULL,
  `PTO_left` INT NULL,
  `PTO_id` INT NOT NULL,
  `positionID` INT NOT NULL,
  PRIMARY KEY (`EID`, `PTO_id`),
  INDEX `fk_Employee_PTO1_idx` (`PTO_id` ASC) VISIBLE,
  INDEX `fk_Employee_Position1_idx` (`positionID` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_PTO1`
    FOREIGN KEY (`PTO_id`)
    REFERENCES `payroll_sys`.`PTO` (`pto_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Position1`
    FOREIGN KEY (`positionID`)
    REFERENCES `payroll_sys`.`Position` (`position_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `payroll_sys`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payroll_sys`.`Payment` (
  `payment_id` INT NOT NULL,
  `PayDate` VARCHAR(45) NULL,
  `PayAmount` VARCHAR(45) NULL,
  `FTC` INT NULL,
  `STC` INT NULL,
  `MedicareCollected` INT NULL,
  `PaymentFrameBegin` VARCHAR(45) NULL,
  `PaymentFrameEnd` VARCHAR(45) NULL,
  PRIMARY KEY (`payment_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `payroll_sys`.`Shift`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payroll_sys`.`Shift` (
  `shift_id` INT NOT NULL,
  `Lunch_In` VARCHAR(45) NULL,
  `Lunch_Out` VARCHAR(45) NULL,
  `Punch_In` VARCHAR(45) NULL,
  `Punch_Out` VARCHAR(45) NULL,
  `Date` VARCHAR(45) NULL,
  `Wage` INT NULL,
  PRIMARY KEY (`shift_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `payroll_sys`.`assignment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payroll_sys`.`assignment` (
  `day` VARCHAR(45) NOT NULL,
  `employee_id` INT NOT NULL,
  `shift_id` INT NOT NULL,
  INDEX `fk_assigned_Employee1_idx` (`employee_id` ASC) VISIBLE,
  INDEX `fk_assigned_Shift1_idx` (`shift_id` ASC) VISIBLE,
  CONSTRAINT `fk_assigned_Employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `payroll_sys`.`Employee` (`EID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_assigned_Shift1`
    FOREIGN KEY (`shift_id`)
    REFERENCES `payroll_sys`.`Shift` (`shift_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `payroll_sys`.`Payment_Record`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `payroll_sys`.`Payment_Record` (
  `payment_id` INT NOT NULL,
  `Employee_EID` INT NOT NULL,
  INDEX `fk_Paycheck_Payment1_idx` (`payment_id` ASC) VISIBLE,
  INDEX `fk_Payment_Record_Employee1_idx` (`Employee_EID` ASC) VISIBLE,
  PRIMARY KEY (`Employee_EID`),
  CONSTRAINT `fk_Paycheck_Payment1`
    FOREIGN KEY (`payment_id`)
    REFERENCES `payroll_sys`.`Payment` (`payment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Payment_Record_Employee1`
    FOREIGN KEY (`Employee_EID`)
    REFERENCES `payroll_sys`.`Employee` (`EID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
