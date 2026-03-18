-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


CREATE SCHEMA IF NOT EXISTS casa_branca DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE casa_branca ;

-- -----------------------------------------------------
-- Table casa_branca.chale
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS casa_branca.chale (
  idChale INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  capacidade INT NOT NULL,
  PRIMARY KEY (idChale))
ENGINE = InnoDB
AUTO_INCREMENT = 24
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table casa_branca.inquilino
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS casa_branca.inquilino (
  idInquilino INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  email VARCHAR(100) NOT NULL,
  telefone VARCHAR(20) NULL DEFAULT NULL,
  requisicao VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (idInquilino))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table casa_branca.reserva
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS casa_branca.reserva (
  idReserva INT NOT NULL AUTO_INCREMENT,
  idInquilino INT NOT NULL,
  idChale INT NOT NULL,
  inicio DATETIME NULL DEFAULT NULL,
  fim DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (idReserva),
  INDEX idInquilino (idInquilino ASC),
  INDEX idChale (idChale ASC),
  CONSTRAINT reserva_ibfk_1
    FOREIGN KEY (idInquilino)
    REFERENCES casa_branca.inquilino (idInquilino)
    ON DELETE CASCADE,
  CONSTRAINT reserva_ibfk_2
    FOREIGN KEY (idChale)
    REFERENCES casa_branca.chale (idChale)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table casa_branca.usuarios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS casa_branca.usuarios (
  idUsuario INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  senha VARCHAR(255) NOT NULL,
  role ENUM('admin', 'funcionario', 'gerente') NULL DEFAULT 'funcionario',
  ativo TINYINT(1) NULL DEFAULT '1',
  dataCriacao TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  dataAtualizacao TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (idUsuario),
  UNIQUE INDEX email (email ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO usuarios (nome, email, senha, role, ativo)
VALUES (
  'Admin',
  'adm@airbnb.com',
  'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3',
  'admin',
  1
);