-- MySQL Workbench Synchronization
-- Generated: 2023-06-01 19:46
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Usuario

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `tp_bd_2023`.`Paga` 
DROP PRIMARY KEY,
ADD PRIMARY KEY (`mail`);
;

ALTER TABLE `tp_bd_2023`.`Reproduce` 
CHANGE COLUMN `Velocidad` `Velocidad` DECIMAL(10) NOT NULL ;

CREATE TABLE IF NOT EXISTS `tp_bd_2023`.`Realiza` (
  `Nombre` VARCHAR(45) NOT NULL,
  `idBusqueda` INT(11) NOT NULL,
  `Tema` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idBusqueda`),
  INDEX `Nombre_idx` (`Nombre` ASC) VISIBLE,
  CONSTRAINT `idBusqueda_R`
    FOREIGN KEY (`idBusqueda`)
    REFERENCES `tp_bd_2023`.`Busqueda` (`idBusqueda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Nombre`
    FOREIGN KEY (`Nombre`)
    REFERENCES `tp_bd_2023`.`Usuario` (`Nombre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

DROP TABLE IF EXISTS `tp_bd_2023`.`realizar` ;

ALTER TABLE `tp_bd_2023`.`Paga` 
ADD CONSTRAINT `idOperacion`
  FOREIGN KEY (`idOperacion`)
  REFERENCES `tp_bd_2023`.`Abono` (`idOperacion`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `mail`
  FOREIGN KEY (`mail`)
  REFERENCES `tp_bd_2023`.`Cuenta` (`mail`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`WatchParty` 
ADD CONSTRAINT `NomParticipante`
  FOREIGN KEY (`NomParticipante`)
  REFERENCES `tp_bd_2023`.`Usuario` (`Nombre`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`Descarga` 
ADD CONSTRAINT `idContenido_D`
  FOREIGN KEY (`idContenido`)
  REFERENCES `tp_bd_2023`.`Contenido` (`idContenido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `Nombre_D`
  FOREIGN KEY (`Nombre`)
  REFERENCES `tp_bd_2023`.`Usuario` (`Nombre`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`Reproduce` 
ADD CONSTRAINT `idContenido_`
  FOREIGN KEY (`idContenido`)
  REFERENCES `tp_bd_2023`.`Contenido` (`idContenido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `Nombre_`
  FOREIGN KEY (`Nombre`)
  REFERENCES `tp_bd_2023`.`Usuario` (`Nombre`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`Favorito` 
ADD CONSTRAINT `idContenido_F`
  FOREIGN KEY (`idContenido`)
  REFERENCES `tp_bd_2023`.`Contenido` (`idContenido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `Nombre_F`
  FOREIGN KEY (`Nombre`)
  REFERENCES `tp_bd_2023`.`Usuario` (`Nombre`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`CasteA` 
ADD CONSTRAINT `idCastea`
  FOREIGN KEY (`idCastea`)
  REFERENCES `tp_bd_2023`.`Dispositivo` (`idDispositivo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `idCasteado`
  FOREIGN KEY (`idCasteado`)
  REFERENCES `tp_bd_2023`.`Dispositivo` (`idDispositivo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`Contiene` 
ADD CONSTRAINT `TitIngles_Contiene`
  FOREIGN KEY (`TitIngles`)
  REFERENCES `tp_bd_2023`.`Serie` (`TitIngles`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `idCapitulo_Contiene`
  FOREIGN KEY (`idCapitulo`)
  REFERENCES `tp_bd_2023`.`Capitulo` (`idCapitulo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`Tiene` 
ADD CONSTRAINT `Nombre_T`
  FOREIGN KEY (`Nombre`)
  REFERENCES `tp_bd_2023`.`Usuario` (`Nombre`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `mail_T`
  FOREIGN KEY (`mail`)
  REFERENCES `tp_bd_2023`.`Cuenta` (`mail`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`Posee` 
ADD CONSTRAINT `Nombre_P`
  FOREIGN KEY (`Nombre`)
  REFERENCES `tp_bd_2023`.`Usuario` (`Nombre`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `idDispositivo_P`
  FOREIGN KEY (`idDispositivo`)
  REFERENCES `tp_bd_2023`.`Dispositivo` (`idDispositivo`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`ContenidoEsSerie` 
ADD CONSTRAINT `idContenido_CS`
  FOREIGN KEY (`idContenido`)
  REFERENCES `tp_bd_2023`.`Contenido` (`idContenido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `TitIngles_CS`
  FOREIGN KEY (`TitIngles`)
  REFERENCES `tp_bd_2023`.`Serie` (`TitIngles`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`ContenidoEsPelicula` 
ADD CONSTRAINT `idContenido_Pelicula`
  FOREIGN KEY (`idContenido`)
  REFERENCES `tp_bd_2023`.`Contenido` (`idContenido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `TitIngles_Pelicula`
  FOREIGN KEY (`TitIngles`)
  REFERENCES `tp_bd_2023`.`Pelicula` (`TitIngles`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`ContenidoEsDocumental` 
ADD CONSTRAINT `idContenido_Docu`
  FOREIGN KEY (`idContenido`)
  REFERENCES `tp_bd_2023`.`Contenido` (`idContenido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `TitIngles_Docu`
  FOREIGN KEY (`TitIngles`)
  REFERENCES `tp_bd_2023`.`Documental` (`TitIngles`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`ActoresSecundariosPelicula` 
ADD CONSTRAINT `TitIngles_ASecundario`
  FOREIGN KEY (`TitIngles`)
  REFERENCES `tp_bd_2023`.`Pelicula` (`TitIngles`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`ActoresPrincipalesPelicula` 
ADD CONSTRAINT `TitIngles_APrincipal`
  FOREIGN KEY (`TitIngles`)
  REFERENCES `tp_bd_2023`.`Pelicula` (`TitIngles`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`Audio` 
ADD CONSTRAINT `idContenido_Audio`
  FOREIGN KEY (`idContenido`)
  REFERENCES `tp_bd_2023`.`Contenido` (`idContenido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`Premios` 
ADD CONSTRAINT `TitIngles`
  FOREIGN KEY (`TitIngles`)
  REFERENCES `tp_bd_2023`.`Pelicula` (`TitIngles`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`Subtitulo` 
ADD CONSTRAINT `idContenido_Sub`
  FOREIGN KEY (`idContenido`)
  REFERENCES `tp_bd_2023`.`Contenido` (`idContenido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`ActoresPrincipalesSerie` 
ADD CONSTRAINT `TitIngles0`
  FOREIGN KEY (`TitIngles`)
  REFERENCES `tp_bd_2023`.`Serie` (`TitIngles`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`ActoresSecundariosSerie` 
ADD CONSTRAINT `TitIngles1`
  FOREIGN KEY (`TitIngles`)
  REFERENCES `tp_bd_2023`.`Serie` (`TitIngles`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `tp_bd_2023`.`Historial` 
ADD CONSTRAINT `idContenido_His`
  FOREIGN KEY (`idContenido`)
  REFERENCES `tp_bd_2023`.`Contenido` (`idContenido`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `Nombre_H`
  FOREIGN KEY (`Nombre`)
  REFERENCES `tp_bd_2023`.`Usuario` (`Nombre`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
