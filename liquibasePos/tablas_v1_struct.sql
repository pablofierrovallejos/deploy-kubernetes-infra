CREATE DATABASE  IF NOT EXISTS `db_springboot_cloud` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `db_springboot_cloud`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 192.168.2.248    Database: db_springboot_cloud
-- ------------------------------------------------------
-- Server version	5.7.30

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
-- Table structure for table `detalleventas`
--

DROP TABLE IF EXISTS `detalleventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalleventas` (
  `iddetalleventa` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` bigint(20) unsigned NOT NULL,
  `nombreproducto` varchar(45) DEFAULT NULL,
  `idproducto` varchar(45) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `preciosubtotal` int(11) DEFAULT NULL,
  PRIMARY KEY (`iddetalleventa`)
) ENGINE=InnoDB AUTO_INCREMENT=2872 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagenclientes`
--

DROP TABLE IF EXISTS `imagenclientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenclientes` (
  `idimagen` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` bigint(20) unsigned DEFAULT NULL,
  `imagen` mediumblob,
  `rutaimagen` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idimagen`)
) ENGINE=InnoDB AUTO_INCREMENT=1384 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medicionenergia`
--

DROP TABLE IF EXISTS `medicionenergia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicionenergia` (
  `idregistro` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idmuestra` int(10) DEFAULT NULL,
  `nombrenodo` varchar(10) DEFAULT NULL,
  `uptime` varchar(10) DEFAULT NULL,
  `volts` varchar(6) DEFAULT NULL,
  `current` varchar(6) DEFAULT NULL,
  `power` varchar(10) DEFAULT NULL,
  `energy` varchar(10) DEFAULT NULL,
  `fechameas` datetime DEFAULT NULL,
  PRIMARY KEY (`idregistro`)
) ENGINE=InnoDB AUTO_INCREMENT=862378 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idproductos` int(11) NOT NULL AUTO_INCREMENT,
  `nombreproducto` varchar(45) DEFAULT NULL,
  `precio` varchar(20) DEFAULT NULL,
  `fechacreacion` datetime DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL,
  `nroposicion` varchar(45) DEFAULT NULL,
  `cantidaddisponible` int(11) DEFAULT NULL,
  `imagenproducto` mediumblob,
  PRIMARY KEY (`idproductos`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `idcorrelativo` int(11) NOT NULL AUTO_INCREMENT,
  `idventa` bigint(20) unsigned DEFAULT NULL,
  `fechaventa` datetime DEFAULT NULL,
  `secuencia` varchar(45) DEFAULT NULL,
  `nroboleta` varchar(45) DEFAULT NULL,
  `totalarticulos` int(11) DEFAULT NULL,
  `subtotalventa` int(11) DEFAULT NULL,
  `iva` int(11) DEFAULT NULL,
  `totalimporte` int(11) DEFAULT NULL,
  `tipopago` varchar(10) DEFAULT NULL,
  `comisiontbk` int(11) DEFAULT NULL,
  `comunicacionpos` varchar(45) DEFAULT NULL,
  `estadotransbank` varchar(45) DEFAULT NULL,
  `trazastattransbk` varchar(512) DEFAULT NULL,
  `longmsgtransbank` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`idcorrelativo`)
) ENGINE=InnoDB AUTO_INCREMENT=2103 DEFAULT CHARSET=latin1;
