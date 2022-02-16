-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema movimentacoes_cartoes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema movimentacoes_cartoes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `movimentacoes_cartoes` DEFAULT CHARACTER SET utf8 ;
USE `movimentacoes_cartoes` ;

-- -----------------------------------------------------
-- Table `movimentacoes_cartoes`.`associado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movimentacoes_cartoes`.`associado` (
  `cod_associado` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(70) NOT NULL,
  `sobrenome` VARCHAR(70) NOT NULL,
  `idade` INT NOT NULL,
  `email` VARCHAR(70) NULL,
  PRIMARY KEY (`cod_associado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movimentacoes_cartoes`.`conta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movimentacoes_cartoes`.`conta` (
  `cod_conta` INT NOT NULL AUTO_INCREMENT,
  `tipo_conta` VARCHAR(30) NOT NULL,
  `data_criacao_conta` TIMESTAMP NOT NULL,
  `cod_associado` INT NOT NULL,
  PRIMARY KEY (`cod_conta`),
  INDEX `fk_conta_associado1_idx` (`cod_associado` ASC) VISIBLE,
  CONSTRAINT `fk_conta_associado1`
    FOREIGN KEY (`cod_associado`)
    REFERENCES `movimentacoes_cartoes`.`associado` (`cod_associado`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movimentacoes_cartoes`.`cartao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movimentacoes_cartoes`.`cartao` (
  `cod_cartao` INT NOT NULL AUTO_INCREMENT,
  `num_cartao` INT NOT NULL,
  `nome_impresso` VARCHAR(100) NOT NULL,
  `data_criaca_cartao` TIMESTAMP NOT NULL,
  `cod_associado` INT NOT NULL,
  `cod_conta` INT NOT NULL,
  PRIMARY KEY (`cod_cartao`),
  INDEX `fk_cartao_associado1_idx` (`cod_associado` ASC) VISIBLE,
  INDEX `fk_cartao_conta1_idx` (`cod_conta` ASC) VISIBLE,
  CONSTRAINT `fk_cartao_associado1`
    FOREIGN KEY (`cod_associado`)
    REFERENCES `movimentacoes_cartoes`.`associado` (`cod_associado`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_cartao_conta1`
    FOREIGN KEY (`cod_conta`)
    REFERENCES `movimentacoes_cartoes`.`conta` (`cod_conta`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `movimentacoes_cartoes`.`movimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movimentacoes_cartoes`.`movimento` (
  `cod_movimento` INT NOT NULL AUTO_INCREMENT,
  `vlr_transacao` DECIMAL(10,2) NOT NULL,
  `des_transacao` VARCHAR(70) NOT NULL,
  `data_movimento` TIMESTAMP NOT NULL,
  `cod_cartao` INT NOT NULL,
  PRIMARY KEY (`cod_movimento`),
  INDEX `fk_movimento_cartao_idx` (`cod_cartao` ASC) VISIBLE,
  CONSTRAINT `fk_movimento_cartao`
    FOREIGN KEY (`cod_cartao`)
    REFERENCES `movimentacoes_cartoes`.`cartao` (`cod_cartao`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `movimentacoes_cartoes`.`movimento_flat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `movimentacoes_cartoes`.`dm_movimento_flat` (
  `cod_movimento_flat` INT NOT NULL AUTO_INCREMENT,
  `nome_associado` VARCHAR(70) NOT NULL,
  `sobrenome_associado` VARCHAR(70) NOT NULL,
  `idade_associado` INT NOT NULL,
  `vlr_transacao_movimento` DECIMAL(10,2) NOT NULL,
  `des_transacao_movimento` VARCHAR(70) NOT NULL,
  `data_movimento` TIMESTAMP NOT NULL,
  `numero_cartao` INT NOT NULL,
  `nome_impresso_cartao` VARCHAR(100) NOT NULL,
  `data_criacao_cartao` TIMESTAMP NOT NULL,
  `tipo_conta` VARCHAR(30) NOT NULL,
  `data_criacao_conta` TIMESTAMP NOT NULL,
  PRIMARY KEY (`cod_movimento_flat`))
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
