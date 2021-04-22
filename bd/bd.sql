-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema instagram
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema instagram
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `instagram` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `instagram` ;

-- -----------------------------------------------------
-- Table `instagram`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instagram`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(256) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `instagram`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instagram`.`posts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `texto` VARCHAR(100) NOT NULL,
  `img` VARCHAR(100) NULL DEFAULT NULL,
  `usuarios_id` INT NULL DEFAULT NULL,
  `n_likes` INT NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  INDEX `usuarios_id` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `posts_ibfk_1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `instagram`.`usuarios` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `instagram`.`comentarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instagram`.`comentarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `texto` TEXT NOT NULL,
  `usuarios_id` INT NULL DEFAULT NULL,
  `posts_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `usuarios_id` (`usuarios_id` ASC) VISIBLE,
  INDEX `posts_id` (`posts_id` ASC) VISIBLE,
  CONSTRAINT `comentarios_ibfk_1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `instagram`.`usuarios` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `comentarios_ibfk_2`
    FOREIGN KEY (`posts_id`)
    REFERENCES `instagram`.`posts` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `instagram`.`curtidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `instagram`.`curtidas` (
  `usuarios_id` INT NOT NULL,
  `posts_id` INT NOT NULL,
  INDEX `posts_id_idx` (`posts_id` ASC) VISIBLE,
  INDEX `usuarios_id_idx` (`usuarios_id` ASC) VISIBLE,
  CONSTRAINT `posts_id`
    FOREIGN KEY (`posts_id`)
    REFERENCES `instagram`.`posts` (`id`),
  CONSTRAINT `usuarios_id`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `instagram`.`usuarios` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
