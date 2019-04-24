-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema payrollsystem
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`PTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PTO` (
  `PTO_id` INT NOT NULL,
  `StartDate` VARCHAR(45) NULL,
  `EndDate` VARCHAR(45) NULL,
  `Reason` VARCHAR(45) NULL,
  PRIMARY KEY (`PTO_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Position` (
  `PositionID` INT NOT NULL,
  `PositionTitle` VARCHAR(45) NULL,
  `Hourly_Wage` INT NULL,
  `PTO(Initial Value)` INT NULL,
  `WorkTimeCap` VARCHAR(45) NULL,
  PRIMARY KEY (`PositionID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employee` (
  `EID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Wage_increase` INT NULL,
  `PTO_left` INT NULL,
  `PTO_PTO_id` INT NOT NULL,
  `Position_PositionID` INT NOT NULL,
  PRIMARY KEY (`EID`, `PTO_PTO_id`),
  INDEX `fk_Employee_PTO1_idx` (`PTO_PTO_id` ASC) VISIBLE,
  INDEX `fk_Employee_Position1_idx` (`Position_PositionID` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_PTO1`
    FOREIGN KEY (`PTO_PTO_id`)
    REFERENCES `mydb`.`PTO` (`PTO_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Employee_Position1`
    FOREIGN KEY (`Position_PositionID`)
    REFERENCES `mydb`.`Position` (`PositionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Payment` (
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
-- Table `mydb`.`Shift`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Shift` (
  `shift_id` INT NOT NULL,
  `LunchIn` VARCHAR(45) NULL,
  `LunchOut` VARCHAR(45) NULL,
  `PunchIn` VARCHAR(45) NULL,
  `PunchOut` VARCHAR(45) NULL,
  `Date` VARCHAR(45) NULL,
  `Wage` INT NULL,
  PRIMARY KEY (`shift_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`assigned`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`assigned` (
  `day` VARCHAR(45) NOT NULL,
  `Employee_employee_id` INT NOT NULL,
  `Shift_shift_id` INT NOT NULL,
  INDEX `fk_assigned_Employee1_idx` (`Employee_employee_id` ASC) VISIBLE,
  INDEX `fk_assigned_Shift1_idx` (`Shift_shift_id` ASC) VISIBLE,
  CONSTRAINT `fk_assigned_Employee1`
    FOREIGN KEY (`Employee_employee_id`)
    REFERENCES `mydb`.`Employee` (`EID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_assigned_Shift1`
    FOREIGN KEY (`Shift_shift_id`)
    REFERENCES `mydb`.`Shift` (`shift_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Paycheck`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Paycheck` (
  `pay_id` INT NOT NULL,
  `Employee_employee_id` INT NOT NULL,
  `Payment_payment_id` INT NOT NULL,
  PRIMARY KEY (`pay_id`, `Employee_employee_id`, `Payment_payment_id`),
  INDEX `fk_Paycheck_Employee1_idx` (`Employee_employee_id` ASC) VISIBLE,
  INDEX `fk_Paycheck_Payment1_idx` (`Payment_payment_id` ASC) VISIBLE,
  CONSTRAINT `fk_Paycheck_Employee1`
    FOREIGN KEY (`Employee_employee_id`)
    REFERENCES `mydb`.`Employee` (`EID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paycheck_Payment1`
    FOREIGN KEY (`Payment_payment_id`)
    REFERENCES `mydb`.`Payment` (`payment_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
