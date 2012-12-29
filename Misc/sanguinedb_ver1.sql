SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb`;

-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Patient` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `FirstName` VARCHAR(45) NULL COMMENT '	' ,
  `LastName` VARCHAR(45) NULL ,
  `BirthDate` DATE NULL ,
  `PumpType` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`UserPrefs`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`UserPrefs` (
  `Patient_id` INT UNSIGNED NOT NULL ,
  `BrkStrt` TIME NULL ,
  `BrkEnd` TIME NULL ,
  `LnchStrt` TIME NULL ,
  `LnchEnd` TIME NULL ,
  `SupStrt` TIME NULL ,
  `SupEnd` TIME NULL ,
  `HypoThreshold` VARCHAR(45) NULL ,
  `HyperThreshold` VARCHAR(45) NULL ,
  `CarbType` VARCHAR(45) NULL ,
  `BasalInsulin` VARCHAR(45) NULL ,
  `BolusInsulin` VARCHAR(45) NULL ,
  `Notes` TEXT NULL ,
  INDEX `fk_UserPrefs_Patient1` (`Patient_id` ASC) ,
  CONSTRAINT `fk_UserPrefs_Patient1`
    FOREIGN KEY (`Patient_id` )
    REFERENCES `mydb`.`Patient` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Event`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Event` (
  `Patient_id` INT UNSIGNED NOT NULL ,
  `EvtDtm` DATETIME NOT NULL ,
  `EventTypeCode` VARCHAR(45) NOT NULL ,
  `EventFlagCode` VARCHAR(45) NULL ,
  PRIMARY KEY (`Patient_id`, `EvtDtm`, `EventTypeCode`) ,
  INDEX `fk_Event_Patient` (`Patient_id` ASC) ,
  CONSTRAINT `fk_Event_Patient`
    FOREIGN KEY (`Patient_id` )
    REFERENCES `mydb`.`Patient` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ReadingGlucoseBlood`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`ReadingGlucoseBlood` (
  `Event_Patient_id` INT UNSIGNED NOT NULL ,
  `Event_EvtDtm` DATETIME NOT NULL ,
  `Event_EventTypeCode` VARCHAR(45) NOT NULL ,
  `GlucoseEventTypeCode` VARCHAR(45) NULL ,
  `Value` VARCHAR(45) NULL ,
  `IsEstimate` VARCHAR(45) NULL ,
  `IsManual` VARCHAR(45) NULL ,
  PRIMARY KEY (`Event_Patient_id`, `Event_EvtDtm`, `Event_EventTypeCode`) ,
  INDEX `fk_ReadingGlucoseBlood_Event2` (`Event_Patient_id` ASC, `Event_EvtDtm` ASC, `Event_EventTypeCode` ASC) ,
  CONSTRAINT `fk_ReadingGlucoseBlood_Event2`
    FOREIGN KEY (`Event_Patient_id` , `Event_EvtDtm` , `Event_EventTypeCode` )
    REFERENCES `mydb`.`Event` (`Patient_id` , `EvtDtm` , `EventTypeCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ReadingGlucoseSensor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`ReadingGlucoseSensor` (
  `EventId` INT NOT NULL ,
  `Value` VARCHAR(45) NULL ,
  `Event_id` INT NOT NULL ,
  PRIMARY KEY (`EventId`) ,
  INDEX `fk_ReadingGlucoseSensor_Event1` (`Event_id` ASC) ,
  CONSTRAINT `fk_ReadingGlucoseSensor_Event1`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Event` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PumpSettingsChange`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`PumpSettingsChange` (
  `Event_id` INT NOT NULL ,
  `id` INT NOT NULL ,
  `ActiveInsulinDur` TIME NULL ,
  `InsulinSensitivity` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`, `Event_id`) ,
  INDEX `fk_PumpSettings_Event1` (`Event_id` ASC) ,
  CONSTRAINT `fk_PumpSettings_Event1`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Event` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BasalPatterns`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`BasalPatterns` (
  `id` INT NOT NULL ,
  `name` VARCHAR(20) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BasalPatternRates`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`BasalPatternRates` (
  `BasalPatterns_id` INT NOT NULL ,
  `Time` TIME NOT NULL ,
  `Rate` DECIMAL(8,4) NULL ,
  PRIMARY KEY (`Time`, `BasalPatterns_id`) ,
  INDEX `fk_BasalPatternRates_BasalPatterns1` (`BasalPatterns_id` ASC) ,
  CONSTRAINT `fk_BasalPatternRates_BasalPatterns1`
    FOREIGN KEY (`BasalPatterns_id` )
    REFERENCES `mydb`.`BasalPatterns` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SettingsCarbRatioPattern`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`SettingsCarbRatioPattern` (
  `PumpSettings_id` INT NOT NULL ,
  `Time` TIME NOT NULL ,
  `Rate` VARCHAR(45) NULL ,
  PRIMARY KEY (`PumpSettings_id`) ,
  INDEX `fk_SettingsCarbRatioPattern_PumpSettings1` (`PumpSettings_id` ASC) ,
  CONSTRAINT `fk_SettingsCarbRatioPattern_PumpSettings1`
    FOREIGN KEY (`PumpSettings_id` )
    REFERENCES `mydb`.`PumpSettingsChange` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SettingsBgTargetPattern`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`SettingsBgTargetPattern` (
  `PumpSettings_id` INT NOT NULL ,
  `Time` TIME NOT NULL ,
  `MinBG` FLOAT NULL ,
  `MaxBg` FLOAT NULL ,
  PRIMARY KEY (`PumpSettings_id`) ,
  INDEX `fk_SettingsBgTargetPattern_PumpSettings1` (`PumpSettings_id` ASC) ,
  CONSTRAINT `fk_SettingsBgTargetPattern_PumpSettings1`
    FOREIGN KEY (`PumpSettings_id` )
    REFERENCES `mydb`.`PumpSettingsChange` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Bolus`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Bolus` (
  `Event_id` INT NOT NULL ,
  `BolusTotal` VARCHAR(45) NOT NULL ,
  `FoodAmount` VARCHAR(45) NULL ,
  `CorrectionAmount` VARCHAR(45) NULL ,
  `IsStandard` BINARY NULL ,
  PRIMARY KEY (`Event_id`) ,
  INDEX `fk_Bolus_Event1` (`Event_id` ASC) ,
  CONSTRAINT `fk_Bolus_Event1`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Event` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BolusAdvanced`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`BolusAdvanced` (
  `EventId` INT NOT NULL ,
  `BolusTypeCode` VARCHAR(45) NULL ,
  `NowPercent` FLOAT NULL ,
  `NowAmount` FLOAT NULL ,
  `SquarePercent` FLOAT NULL ,
  `SquareAmount` FLOAT NULL ,
  `Bolus_EventId` INT NOT NULL ,
  PRIMARY KEY (`EventId`) ,
  INDEX `fk_BolusAdvanced_Bolus1` (`Bolus_EventId` ASC) ,
  CONSTRAINT `fk_BolusAdvanced_Bolus1`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Bolus` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FoodIntake`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`FoodIntake` (
  `Description` VARCHAR(45) NULL ,
  `CarbohydrateAmount` VARCHAR(45) NULL ,
  `IsEstimate` VARCHAR(45) NULL ,
  `Event_Patient_id` INT UNSIGNED NOT NULL ,
  `Event_EvtDtm` DATETIME NOT NULL ,
  `Event_EventTypeCode` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Event_Patient_id`, `Event_EvtDtm`, `Event_EventTypeCode`) ,
  INDEX `fk_FoodIntake_Event1` (`Event_Patient_id` ASC, `Event_EvtDtm` ASC, `Event_EventTypeCode` ASC) ,
  CONSTRAINT `fk_FoodIntake_Event1`
    FOREIGN KEY (`Event_Patient_id` , `Event_EvtDtm` , `Event_EventTypeCode` )
    REFERENCES `mydb`.`Event` (`Patient_id` , `EvtDtm` , `EventTypeCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ExerciseStart`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`ExerciseStart` (
  `Event_id` INT NOT NULL ,
  `Intensity` INT NULL ,
  `Description` VARCHAR(45) NULL ,
  INDEX `fk_ExerciseStart_Event1` (`Event_id` ASC) ,
  CONSTRAINT `fk_ExerciseStart_Event1`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Event` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ExerciseEnd`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`ExerciseEnd` (
  `Event_id` INT NOT NULL ,
  `StartId` INT NULL ,
  INDEX `fk_ExerciseEnd_Event1` (`Event_id` ASC) ,
  CONSTRAINT `fk_ExerciseEnd_Event1`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Event` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Weight`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Weight` (
  `Event_id` INT NOT NULL ,
  `Weight` DECIMAL(5,2) NULL ,
  INDEX `fk_Weight_Event1` (`Event_id` ASC) ,
  CONSTRAINT `fk_Weight_Event1`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Event` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cholesterol`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Cholesterol` (
  `Event_id` INT NOT NULL ,
  `Value` DECIMAL(8,4) NULL ,
  INDEX `fk_HBA1C_Event1` (`Event_id` ASC) ,
  CONSTRAINT `fk_HBA1C_Event1`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Event` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BloodPressure`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`BloodPressure` (
  `Event_id` INT NOT NULL ,
  `Value` DECIMAL(8,4) NULL ,
  INDEX `fk_HBA1C_Event1` (`Event_id` ASC) ,
  CONSTRAINT `fk_HBA1C_Event1`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Event` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HBA1C`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`HBA1C` (
  `Event_id` INT NOT NULL ,
  `Value` DECIMAL(8,4) NULL ,
  INDEX `fk_HBA1C_Event1` (`Event_id` ASC) ,
  CONSTRAINT `fk_HBA1C_Event1`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Event` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Keytones`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Keytones` (
  `Event_id` INT NOT NULL ,
  `Value` DECIMAL(8,4) NULL ,
  INDEX `fk_HBA1C_Event1` (`Event_id` ASC) ,
  CONSTRAINT `fk_HBA1C_Event1`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Event` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TempBasalStart`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`TempBasalStart` (
  `Event_id` INT NOT NULL ,
  `Rate` DECIMAL(6,3) NOT NULL ,
  `Percentage` DECIMAL(4,1) NULL ,
  INDEX `fk_TempBasalStart_Event1` (`Event_id` ASC) ,
  CONSTRAINT `fk_TempBasalStart_Event1`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Event` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TempBasalEnd`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`TempBasalEnd` (
  `Event_id` INT NOT NULL ,
  `StartId` INT NULL ,
  INDEX `fk_ExerciseEnd_Event1` (`Event_id` ASC) ,
  CONSTRAINT `fk_ExerciseEnd_Event1`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Event` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`BasalPatternChange`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`BasalPatternChange` (
  `newPattern` INT NULL ,
  `Event_Patient_id` INT UNSIGNED NOT NULL ,
  `Event_EvtDtm` DATETIME NOT NULL ,
  `Event_EventTypeCode` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Event_Patient_id`, `Event_EvtDtm`, `Event_EventTypeCode`) ,
  INDEX `fk_BasalPatternChange_Event1` (`Event_Patient_id` ASC, `Event_EvtDtm` ASC, `Event_EventTypeCode` ASC) ,
  CONSTRAINT `fk_BasalPatternChange_Event1`
    FOREIGN KEY (`Event_Patient_id` , `Event_EvtDtm` , `Event_EventTypeCode` )
    REFERENCES `mydb`.`Event` (`Patient_id` , `EvtDtm` , `EventTypeCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SetChange`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`SetChange` (
  `Event_id` INT NOT NULL ,
  `Event_Patient_id` INT UNSIGNED NOT NULL ,
  `IsTubing` BINARY NULL ,
  `IsSite` BINARY NULL ,
  `IsReservoir` BINARY NULL ,
  INDEX `fk_SetChange_Event1` (`Event_id` ASC, `Event_Patient_id` ASC) ,
  PRIMARY KEY (`Event_id`, `Event_Patient_id`) ,
  CONSTRAINT `fk_SetChange_Event1`
    FOREIGN KEY ()
    REFERENCES `mydb`.`Event` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ActiveInsulin`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`ActiveInsulin` (
  `Event_Patient_id` INT UNSIGNED NOT NULL ,
  `Event_EvtDtm` DATETIME NOT NULL ,
  `Event_EventTypeCode` VARCHAR(45) NOT NULL ,
  `Amount` VARCHAR(45) NULL ,
  PRIMARY KEY (`Event_Patient_id`, `Event_EvtDtm`, `Event_EventTypeCode`) ,
  INDEX `fk_ActiveInsulin_Event1` (`Event_Patient_id` ASC, `Event_EvtDtm` ASC, `Event_EventTypeCode` ASC) ,
  CONSTRAINT `fk_ActiveInsulin_Event1`
    FOREIGN KEY (`Event_Patient_id` , `Event_EvtDtm` , `Event_EventTypeCode` )
    REFERENCES `mydb`.`Event` (`Patient_id` , `EvtDtm` , `EventTypeCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MealType`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`MealType` (
  `MealTypeCode` VARCHAR(4) NOT NULL ,
  `Description` VARCHAR(45) NULL ,
  PRIMARY KEY (`MealTypeCode`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MealType_has_FoodIntake`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`MealType_has_FoodIntake` (
  `MealType_MealTypeCode` VARCHAR(4) NOT NULL ,
  `FoodIntake_Event_Patient_id` INT UNSIGNED NOT NULL ,
  `FoodIntake_Event_EvtDtm` DATETIME NOT NULL ,
  `FoodIntake_Event_EventTypeCode` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`MealType_MealTypeCode`, `FoodIntake_Event_Patient_id`, `FoodIntake_Event_EvtDtm`, `FoodIntake_Event_EventTypeCode`) ,
  INDEX `fk_MealType_has_FoodIntake_MealType1` (`MealType_MealTypeCode` ASC) ,
  INDEX `fk_MealType_has_FoodIntake_FoodIntake1` (`FoodIntake_Event_Patient_id` ASC, `FoodIntake_Event_EvtDtm` ASC, `FoodIntake_Event_EventTypeCode` ASC) ,
  CONSTRAINT `fk_MealType_has_FoodIntake_MealType1`
    FOREIGN KEY (`MealType_MealTypeCode` )
    REFERENCES `mydb`.`MealType` (`MealTypeCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MealType_has_FoodIntake_FoodIntake1`
    FOREIGN KEY (`FoodIntake_Event_Patient_id` , `FoodIntake_Event_EvtDtm` , `FoodIntake_Event_EventTypeCode` )
    REFERENCES `mydb`.`FoodIntake` (`Event_Patient_id` , `Event_EvtDtm` , `Event_EventTypeCode` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
