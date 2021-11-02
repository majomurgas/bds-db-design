-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema airportdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema airportdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `airportdb` DEFAULT CHARACTER SET utf8 ;
USE `airportdb` ;

-- -----------------------------------------------------
-- Table `airportdb`.`airline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airportdb`.`airline` (
  `airline_id` INT NOT NULL,
  `airline_name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `adress` VARCHAR(45) NULL,
  PRIMARY KEY (`airline_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airportdb`.`airplane_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airportdb`.`airplane_type` (
  `type_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  `identifier` VARCHAR(45) NULL,
  PRIMARY KEY (`type_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airportdb`.`airplane`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airportdb`.`airplane` (
  `airplane_id` INT NOT NULL,
  `model_num` VARCHAR(45) NULL,
  `airline_id` INT NOT NULL,
  `airplane_type_id` INT NOT NULL,
  PRIMARY KEY (`airplane_id`),
  INDEX `fk_airplane_airline1_idx` (`airline_id` ASC) VISIBLE,
  INDEX `fk_airplane_airplane_type1_idx` (`airplane_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_airplane_airline1`
    FOREIGN KEY (`airline_id`)
    REFERENCES `airportdb`.`airline` (`airline_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_airplane_airplane_type1`
    FOREIGN KEY (`airplane_type_id`)
    REFERENCES `airportdb`.`airplane_type` (`type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airportdb`.`airport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airportdb`.`airport` (
  `airport_id` INT NOT NULL,
  `iata` VARCHAR(45) NULL,
  `icao` VARCHAR(45) NULL,
  `name` VARCHAR(200) NULL,
  PRIMARY KEY (`airport_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airportdb`.`flight`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airportdb`.`flight` (
  `flight_id` INT NOT NULL AUTO_INCREMENT,
  `from` VARCHAR(45) NULL,
  `to` VARCHAR(45) NULL,
  `departure` DATETIME NULL,
  `arrival` DATETIME NULL,
  `airplane_id` INT NOT NULL,
  `airport_id` INT NOT NULL,
  PRIMARY KEY (`flight_id`),
  INDEX `fk_flight_airplane1_idx` (`airplane_id` ASC) VISIBLE,
  INDEX `fk_flight_airport1_idx` (`airport_id` ASC) VISIBLE,
  CONSTRAINT `fk_flight_airplane1`
    FOREIGN KEY (`airplane_id`)
    REFERENCES `airportdb`.`airplane` (`airplane_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_flight_airport1`
    FOREIGN KEY (`airport_id`)
    REFERENCES `airportdb`.`airport` (`airport_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airportdb`.`airport_geo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airportdb`.`airport_geo` (
  `airpot_geo_id` INT NOT NULL,
  `city` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `airport_id` INT NOT NULL,
  PRIMARY KEY (`airpot_geo_id`),
  INDEX `fk_airport_geo_airport1_idx` (`airport_id` ASC) VISIBLE,
  CONSTRAINT `fk_airport_geo_airport1`
    FOREIGN KEY (`airport_id`)
    REFERENCES `airportdb`.`airport` (`airport_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airportdb`.`pasenger`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airportdb`.`pasenger` (
  `passenger_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `passportnum` INT NOT NULL,
  PRIMARY KEY (`passenger_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airportdb`.`passenger_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airportdb`.`passenger_details` (
  `passenger_details_id` INT NOT NULL,
  `birthdate` VARCHAR(45) NULL,
  `sex` VARCHAR(45) NULL,
  `phone_num` VARCHAR(45) NULL,
  `emailadress` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `passenger_id` INT NOT NULL,
  PRIMARY KEY (`passenger_details_id`),
  INDEX `fk_passenger_details_pasenger1_idx` (`passenger_id` ASC) VISIBLE,
  CONSTRAINT `fk_passenger_details_pasenger1`
    FOREIGN KEY (`passenger_id`)
    REFERENCES `airportdb`.`pasenger` (`passenger_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airportdb`.`pilot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airportdb`.`pilot` (
  `pilot_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `contact_number` VARCHAR(45) NULL,
  `pilotlicense` VARCHAR(45) NULL,
  `designation` VARCHAR(45) NULL,
  `flight_id` INT NOT NULL,
  PRIMARY KEY (`pilot_id`),
  INDEX `fk_pilot_flight1_idx` (`flight_id` ASC) VISIBLE,
  CONSTRAINT `fk_pilot_flight1`
    FOREIGN KEY (`flight_id`)
    REFERENCES `airportdb`.`flight` (`flight_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airportdb`.`cabin_crew`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airportdb`.`cabin_crew` (
  `cabin_crew_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `contact_number` VARCHAR(45) NULL,
  `designation` VARCHAR(45) NULL,
  `flight_id` INT NOT NULL,
  PRIMARY KEY (`cabin_crew_id`),
  INDEX `fk_cabin_crew_flight1_idx` (`flight_id` ASC) VISIBLE,
  CONSTRAINT `fk_cabin_crew_flight1`
    FOREIGN KEY (`flight_id`)
    REFERENCES `airportdb`.`flight` (`flight_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airportdb`.`ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airportdb`.`ticket` (
  `ticket_id` INT NOT NULL,
  `from` VARCHAR(45) NULL,
  `to` VARCHAR(45) NULL,
  `currency` VARCHAR(45) NULL,
  `invoice_num` INT NULL,
  PRIMARY KEY (`ticket_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airportdb`.`boarding_pass`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airportdb`.`boarding_pass` (
  `boarding_pass_id` INT NOT NULL,
  `gate` VARCHAR(45) NULL,
  `meal` VARCHAR(45) NULL,
  `baggage` VARCHAR(45) NULL,
  `flight_id` INT NOT NULL,
  `passenger_id` INT NOT NULL,
  `ticket_id` INT NOT NULL,
  PRIMARY KEY (`boarding_pass_id`),
  INDEX `fk_boarding_pass_flight1_idx` (`flight_id` ASC) VISIBLE,
  INDEX `fk_boarding_pass_pasenger1_idx` (`passenger_id` ASC) VISIBLE,
  INDEX `fk_boarding_pass_ticket1_idx` (`ticket_id` ASC) VISIBLE,
  CONSTRAINT `fk_boarding_pass_flight1`
    FOREIGN KEY (`flight_id`)
    REFERENCES `airportdb`.`flight` (`flight_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boarding_pass_pasenger1`
    FOREIGN KEY (`passenger_id`)
    REFERENCES `airportdb`.`pasenger` (`passenger_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_boarding_pass_ticket1`
    FOREIGN KEY (`ticket_id`)
    REFERENCES `airportdb`.`ticket` (`ticket_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airportdb`.`pasenger_has_ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airportdb`.`pasenger_has_ticket` (
  `ticket_id` INT NOT NULL,
  `passenger_id` INT NOT NULL,
  PRIMARY KEY (`ticket_id`, `passenger_id`),
  INDEX `fk_ticket_has_pasenger_pasenger1_idx` (`passenger_id` ASC) VISIBLE,
  INDEX `fk_ticket_has_pasenger_ticket1_idx` (`ticket_id` ASC) VISIBLE,
  CONSTRAINT `fk_ticket_has_pasenger_ticket1`
    FOREIGN KEY (`ticket_id`)
    REFERENCES `airportdb`.`ticket` (`ticket_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ticket_has_pasenger_pasenger1`
    FOREIGN KEY (`passenger_id`)
    REFERENCES `airportdb`.`pasenger` (`passenger_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
