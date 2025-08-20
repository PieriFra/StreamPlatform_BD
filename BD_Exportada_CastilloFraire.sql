-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: tp_bd_2023
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `abono`
--

DROP TABLE IF EXISTS `abono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `abono` (
  `idOperacion` int NOT NULL,
  `MedioPago` varchar(45) NOT NULL,
  `NumCuenta` int NOT NULL,
  `FechaFac` date NOT NULL,
  `FechaVen` date NOT NULL,
  PRIMARY KEY (`idOperacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actoresprincipalespelicula`
--

DROP TABLE IF EXISTS `actoresprincipalespelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actoresprincipalespelicula` (
  `TitIngles` varchar(200) NOT NULL,
  `ActoresPrincipales` varchar(45) NOT NULL,
  KEY `TitIngles_idx` (`TitIngles`),
  CONSTRAINT `TitIngles_APrincipal` FOREIGN KEY (`TitIngles`) REFERENCES `pelicula` (`TitIngles`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actoresprincipalesserie`
--

DROP TABLE IF EXISTS `actoresprincipalesserie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actoresprincipalesserie` (
  `TitIngles` varchar(45) NOT NULL,
  `ActoresPrincipales` varchar(45) NOT NULL,
  KEY `TitIngles0_idx` (`TitIngles`),
  CONSTRAINT `TitIngles0` FOREIGN KEY (`TitIngles`) REFERENCES `serie` (`TitIngles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actoressecundariospelicula`
--

DROP TABLE IF EXISTS `actoressecundariospelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actoressecundariospelicula` (
  `TitIngles` varchar(200) NOT NULL,
  `ActoresSecundarios` varchar(45) NOT NULL,
  KEY `TitIngles_idx` (`TitIngles`),
  CONSTRAINT `TitIngles_ASecundario` FOREIGN KEY (`TitIngles`) REFERENCES `pelicula` (`TitIngles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `actoressecundariosserie`
--

DROP TABLE IF EXISTS `actoressecundariosserie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actoressecundariosserie` (
  `TitIngles` varchar(45) NOT NULL,
  `ActoresSecundarios` varchar(45) NOT NULL,
  KEY `TitIngles1_idx` (`TitIngles`),
  CONSTRAINT `TitIngles1` FOREIGN KEY (`TitIngles`) REFERENCES `serie` (`TitIngles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `audio`
--

DROP TABLE IF EXISTS `audio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audio` (
  `idContenido` int NOT NULL,
  `Audio` varchar(45) NOT NULL,
  KEY `idContenido_idx` (`idContenido`),
  CONSTRAINT `idContenido_Audio` FOREIGN KEY (`idContenido`) REFERENCES `contenido` (`idContenido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `busqueda`
--

DROP TABLE IF EXISTS `busqueda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `busqueda` (
  `idBusqueda` int NOT NULL,
  `Fecha` date NOT NULL,
  `TiempoRespuesta` int NOT NULL,
  `CantResultado` int NOT NULL,
  PRIMARY KEY (`idBusqueda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `capitulo`
--

DROP TABLE IF EXISTS `capitulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `capitulo` (
  `idCapitulo` int NOT NULL,
  `Resumen` varchar(300) NOT NULL,
  `Duracion` int NOT NULL,
  `NumTemporada` int NOT NULL,
  `NumCapitulo` int NOT NULL,
  `TitIngles` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idCapitulo`),
  KEY `TitIngles_idx` (`TitIngles`),
  CONSTRAINT `TitIngles` FOREIGN KEY (`TitIngles`) REFERENCES `serie` (`TitIngles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `castea`
--

DROP TABLE IF EXISTS `castea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `castea` (
  `idCastea` int NOT NULL,
  `idCasteado` int NOT NULL,
  KEY `idCasteado_idx` (`idCasteado`),
  KEY `idCastea` (`idCastea`),
  CONSTRAINT `idCastea` FOREIGN KEY (`idCastea`) REFERENCES `dispositivo` (`idDispositivo`),
  CONSTRAINT `idCasteado` FOREIGN KEY (`idCasteado`) REFERENCES `dispositivo` (`idDispositivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contenido`
--

DROP TABLE IF EXISTS `contenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenido` (
  `idContenido` int NOT NULL,
  `TitOriginal` varchar(100) NOT NULL,
  `Director` varchar(45) NOT NULL,
  `Calificacion` varchar(45) NOT NULL,
  `Duracion` int NOT NULL,
  `lanzamiento` date NOT NULL,
  PRIMARY KEY (`idContenido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contenidoesdocumental`
--

DROP TABLE IF EXISTS `contenidoesdocumental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenidoesdocumental` (
  `TitIngles` varchar(100) NOT NULL,
  `idContenido` int NOT NULL,
  PRIMARY KEY (`TitIngles`),
  KEY `idContenido_idx` (`idContenido`),
  CONSTRAINT `idContenido_Docu` FOREIGN KEY (`idContenido`) REFERENCES `contenido` (`idContenido`),
  CONSTRAINT `TitIngles_Docu` FOREIGN KEY (`TitIngles`) REFERENCES `documental` (`TitIngles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contenidoespelicula`
--

DROP TABLE IF EXISTS `contenidoespelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenidoespelicula` (
  `TitIngles` varchar(200) NOT NULL,
  `idContenido` int NOT NULL,
  PRIMARY KEY (`TitIngles`),
  KEY `idContenido_idx` (`idContenido`),
  CONSTRAINT `idContenido_Pelicula` FOREIGN KEY (`idContenido`) REFERENCES `contenido` (`idContenido`),
  CONSTRAINT `TitIngles_Pelicula` FOREIGN KEY (`TitIngles`) REFERENCES `pelicula` (`TitIngles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contenidoesserie`
--

DROP TABLE IF EXISTS `contenidoesserie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contenidoesserie` (
  `TitIngles` varchar(45) NOT NULL,
  `idContenido` int NOT NULL,
  PRIMARY KEY (`TitIngles`),
  UNIQUE KEY `idContenido_UNIQUE` (`idContenido`),
  CONSTRAINT `idContenido_CS` FOREIGN KEY (`idContenido`) REFERENCES `contenido` (`idContenido`),
  CONSTRAINT `TitIngles_CS` FOREIGN KEY (`TitIngles`) REFERENCES `serie` (`TitIngles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `mail` varchar(45) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `domicilio` varchar(45) NOT NULL,
  `cant_usuarios` int NOT NULL,
  `idioma` varchar(45) NOT NULL,
  PRIMARY KEY (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `descarga`
--

DROP TABLE IF EXISTS `descarga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descarga` (
  `Nombre` varchar(45) NOT NULL,
  `idContenido` int NOT NULL,
  `Calidad` varchar(45) NOT NULL,
  `AudioElejido` varchar(45) NOT NULL,
  `SubtituloElejido` varchar(45) DEFAULT NULL,
  KEY `idContenido_idx` (`idContenido`),
  KEY `Nombre_D` (`Nombre`),
  CONSTRAINT `idContenido_D` FOREIGN KEY (`idContenido`) REFERENCES `contenido` (`idContenido`),
  CONSTRAINT `Nombre_D` FOREIGN KEY (`Nombre`) REFERENCES `usuario` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ajustar_descarga` BEFORE INSERT ON `descarga` FOR EACH ROW BEGIN
    IF NEW.Calidad = 'normal' THEN
        SET NEW.SubtituloElejido = NULL;
        SET NEW.AudioElejido = 'Castellano';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dispositivo`
--

DROP TABLE IF EXISTS `dispositivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dispositivo` (
  `idDispositivo` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  `Marca` varchar(45) NOT NULL,
  `HoraDescarga` int NOT NULL,
  PRIMARY KEY (`idDispositivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `limit_horas_descarga` BEFORE INSERT ON `dispositivo` FOR EACH ROW BEGIN
-- Calcular las HorasDescarga para el numero dado
    DECLARE total_horas DECIMAL(10,2);
    SET total_horas = COALESCE((SELECT SUM(HoraDescarga) FROM Dispositivo WHERE Nombre = NEW.Nombre), 0);

    -- Chequear si las horas totales de descarga supera 4
    IF total_horas + NEW.HoraDescarga > 4 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Exceeded the maximum limit of 4 HorasDescarga for the Nombre';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `documental`
--

DROP TABLE IF EXISTS `documental`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documental` (
  `TitIngles` varchar(100) NOT NULL,
  `Tema` varchar(200) NOT NULL,
  PRIMARY KEY (`TitIngles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `favorito`
--

DROP TABLE IF EXISTS `favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorito` (
  `Nombre` varchar(45) NOT NULL,
  `idContenido` int NOT NULL,
  KEY `idContenido_idx` (`idContenido`),
  KEY `Nombre_F` (`Nombre`),
  CONSTRAINT `idContenido_F` FOREIGN KEY (`idContenido`) REFERENCES `contenido` (`idContenido`),
  CONSTRAINT `Nombre_F` FOREIGN KEY (`Nombre`) REFERENCES `usuario` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Check_cant_favs` BEFORE UPDATE ON `favorito` FOR EACH ROW BEGIN
DECLARE favorito_count INT;
    
    -- Contar la cantidad de favoritos que tienen el usuario
    SET favorito_count := (
    SELECT COUNT(*)
    FROM Favorito
    WHERE Nombre = NEW.Nombre
    );
    
    -- Verificar que pueda agregar un favorito
    IF favorite_count >= 10 THEN
        SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Usuario ya no puede agregar favoritos';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `historial`
--

DROP TABLE IF EXISTS `historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial` (
  `idContenido` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Fecha` date NOT NULL,
  `Audio` varchar(45) NOT NULL,
  `Seleccionado` varchar(45) NOT NULL,
  KEY `idContenido_His_idx` (`idContenido`),
  KEY `Nombre_H_idx` (`Nombre`),
  CONSTRAINT `idContenido_His` FOREIGN KEY (`idContenido`) REFERENCES `contenido` (`idContenido`),
  CONSTRAINT `Nombre_H` FOREIGN KEY (`Nombre`) REFERENCES `usuario` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paga`
--

DROP TABLE IF EXISTS `paga`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paga` (
  `idOperacion` int NOT NULL,
  `mail` varchar(45) NOT NULL,
  `FechaPago` varchar(45) NOT NULL,
  PRIMARY KEY (`idOperacion`),
  KEY `mail_idx` (`mail`),
  CONSTRAINT `idOperacion` FOREIGN KEY (`idOperacion`) REFERENCES `abono` (`idOperacion`),
  CONSTRAINT `mail` FOREIGN KEY (`mail`) REFERENCES `cuenta` (`mail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `limitarCuentasAbono` BEFORE INSERT ON `paga` FOR EACH ROW BEGIN

 -- Verficar si la cantidad de Mails asociados a un idOperacion es mayor a 3
    IF (SELECT COUNT(DISTINCT Mail) FROM Paga WHERE idOperacion = NEW.idOperacion) >= 3 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede tener mas de 3 cuentas asociadas a un abono';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_cantCuentas` AFTER INSERT ON `paga` FOR EACH ROW BEGIN
    -- Actualizar cantCuentas del Abono correspondiente
    UPDATE Abono
    SET cantCuentas = (SELECT COUNT(DISTINCT Mail) FROM Paga WHERE idOperacion = NEW.idOperacion) WHERE idOperacion = NEW.idOperacion;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `pagacheck_payment_status` AFTER INSERT ON `paga` FOR EACH ROW BEGIN
DECLARE vencimiento DATE ;
    DECLARE hoy DATE;
    DECLARE diferencia INT;
    DECLARE cuenta_mail VARCHAR(45);

    -- Obtener la fecha de vencimiento de la factura
    SELECT FechaVen INTO vencimiento FROM abono WHERE idOperacion = NEW.idOperacion;

    -- Obtener la fecha de hoy
    SET hoy = CURDATE();
    
    -- Calcular la diferencia en días entre la fecha actual y la fecha de vencimiento
    SET diferencia = DATEDIFF(hoy, vencimiento);
    
    -- Obtengo el mail asociado a la cuenta asociada a la factura
	SELECT mail INTO cuenta_mail FROM cuenta WHERE mail = NEW.mail;
    
    -- Verificar si la diferencia es mayor a 5 días y si no se ha realizado el pago
    IF diferencia >= 5 AND NEW.idOperacion NOT IN (SELECT idOperacion FROM abono) THEN
        -- Actualizar el estado de la cuenta a "inactivo"
        UPDATE cuenta SET cuenta.estado = 'inactivo' WHERE cuenta.mail = cuenta_mail;
	END IF;
    
    
    -- ---------------------------------------------------------------
     -- Actualizar cantCuentas del Abono correspondiente
    UPDATE Abono
    SET cantCuentas = (SELECT COUNT(DISTINCT Mail) FROM Paga WHERE idOperacion = NEW.idOperacion) 
    WHERE idOperacion = NEW.idOperacion;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pelicula`
--

DROP TABLE IF EXISTS `pelicula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelicula` (
  `TitIngles` varchar(200) NOT NULL,
  `Genero` varchar(45) NOT NULL,
  `Clasificacion` varchar(45) NOT NULL,
  `Productor` varchar(45) NOT NULL,
  `TitEspanol` varchar(200) NOT NULL,
  PRIMARY KEY (`TitIngles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `premios`
--

DROP TABLE IF EXISTS `premios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premios` (
  `TitIngles` varchar(200) NOT NULL,
  `Premios` varchar(100) NOT NULL,
  `Festival` varchar(100) NOT NULL,
  `Ano` int NOT NULL,
  KEY `TitIngles_idx` (`TitIngles`),
  CONSTRAINT `TitIngles_Premio` FOREIGN KEY (`TitIngles`) REFERENCES `pelicula` (`TitIngles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `realiza_busqueda`
--

DROP TABLE IF EXISTS `realiza_busqueda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `realiza_busqueda` (
  `Nombre` varchar(45) NOT NULL,
  `idBusqueda` int NOT NULL,
  `Tema` varchar(45) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`idBusqueda`),
  KEY `Nombre_idx` (`Nombre`),
  CONSTRAINT `idBusqueda_R` FOREIGN KEY (`idBusqueda`) REFERENCES `busqueda` (`idBusqueda`),
  CONSTRAINT `Nombre_R` FOREIGN KEY (`Nombre`) REFERENCES `usuario` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reproduce`
--

DROP TABLE IF EXISTS `reproduce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reproduce` (
  `Nombre` varchar(45) NOT NULL,
  `idContenido` int NOT NULL,
  `Velocidad` decimal(10,0) NOT NULL,
  `Estado` varchar(45) NOT NULL,
  `Fecha` date NOT NULL,
  `AudioSeleccionado` varchar(45) NOT NULL,
  KEY `idContenido_idx` (`idContenido`),
  KEY `Nombre_` (`Nombre`),
  CONSTRAINT `idContenido_` FOREIGN KEY (`idContenido`) REFERENCES `contenido` (`idContenido`),
  CONSTRAINT `Nombre_` FOREIGN KEY (`Nombre`) REFERENCES `usuario` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `serie`
--

DROP TABLE IF EXISTS `serie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serie` (
  `TitIngles` varchar(100) NOT NULL,
  `TitEspanol` varchar(100) NOT NULL,
  `Calificacion` varchar(45) NOT NULL,
  `Productor` varchar(100) NOT NULL,
  `Genero` varchar(45) NOT NULL,
  `Resumen` varchar(200) NOT NULL,
  PRIMARY KEY (`TitIngles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subtitulo`
--

DROP TABLE IF EXISTS `subtitulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subtitulo` (
  `idContenido` int NOT NULL,
  `Subtitulo` varchar(45) NOT NULL,
  KEY `idContenido_idx` (`idContenido`),
  CONSTRAINT `idContenido_Sub` FOREIGN KEY (`idContenido`) REFERENCES `contenido` (`idContenido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `Nombre` varchar(45) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  `CantDispositivo` varchar(45) NOT NULL,
  `FechaNac` date NOT NULL,
  PRIMARY KEY (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `enforce_cantDispositivo_limit` BEFORE INSERT ON `usuario` FOR EACH ROW BEGIN
-- Verifico que la cantidad de dispositivos no supere la cantidad de cinco 
    IF NEW.cantDispositivo > 5 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El usuario no puede tener mas de 5 dispositivos asociados.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `usuario_posee_dispositivo`
--

DROP TABLE IF EXISTS `usuario_posee_dispositivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_posee_dispositivo` (
  `Nombre` varchar(45) NOT NULL,
  `idDispositivo` int NOT NULL,
  PRIMARY KEY (`idDispositivo`),
  KEY `Nombre_idx` (`Nombre`),
  CONSTRAINT `idDispositivo_P` FOREIGN KEY (`idDispositivo`) REFERENCES `dispositivo` (`idDispositivo`),
  CONSTRAINT `Nombre_P` FOREIGN KEY (`Nombre`) REFERENCES `usuario` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario_tiene_cuenta`
--

DROP TABLE IF EXISTS `usuario_tiene_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_tiene_cuenta` (
  `Nombre` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL,
  PRIMARY KEY (`Nombre`),
  KEY `mail_idx` (`mail`),
  CONSTRAINT `mail_T` FOREIGN KEY (`mail`) REFERENCES `cuenta` (`mail`),
  CONSTRAINT `Nombre_T` FOREIGN KEY (`Nombre`) REFERENCES `usuario` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Verificar_Asociacion_usuarios` BEFORE INSERT ON `usuario_tiene_cuenta` FOR EACH ROW BEGIN

    DECLARE Cuentacount INT;
    
    -- Obtener la cantidad de usuarios asociados a la cuenta
    SELECT COUNT(*) INTO Cuentacount
    FROM Tiene
    WHERE Mail = NEW.Mail;
    
    -- Verificar si la cuenta puede asociar un usuario nuevo
    IF Cuentacount >= 3 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'No se puede asociar otro usuario a esta cuenta ya que tiene 5 usuarios.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `watchparty`
--

DROP TABLE IF EXISTS `watchparty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchparty` (
  `NomParticipante` varchar(45) NOT NULL,
  `NomCreador` varchar(45) NOT NULL,
  `Fecha` date NOT NULL,
  `idContenido` int NOT NULL,
  KEY `NomCreador_idx` (`NomCreador`),
  KEY `NomParticipante_idx` (`NomParticipante`),
  CONSTRAINT `NomCreador` FOREIGN KEY (`NomCreador`) REFERENCES `usuario` (`Nombre`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `NomParticipante` FOREIGN KEY (`NomParticipante`) REFERENCES `usuario` (`Nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'tp_bd_2023'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-19 19:44:33
