-- MariaDB dump 10.19-11.3.2-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: mauri
-- ------------------------------------------------------
-- Server version	11.3.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bazar`
--

DROP TABLE IF EXISTS `bazar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bazar` (
  `id_bazar` int(11) NOT NULL AUTO_INCREMENT,
  `nombreBazar` text NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_bazar`),
  KEY `id_cliente` (`id_cliente`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `bazar_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `bazar_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bazar`
--

LOCK TABLES `bazar` WRITE;
/*!40000 ALTER TABLE `bazar` DISABLE KEYS */;
/*!40000 ALTER TABLE `bazar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `carnet` int(11) NOT NULL,
  `Nombre` text NOT NULL,
  `Papellido` text NOT NULL,
  `Sapellido` text NOT NULL,
  `cel` int(11) NOT NULL,
  `garantia` text NOT NULL,
  `id_flete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  KEY `id_flete` (`id_flete`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_flete`) REFERENCES `flete` (`id_flete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conjunto`
--

DROP TABLE IF EXISTS `conjunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conjunto` (
  `id_conjunto` int(11) NOT NULL AUTO_INCREMENT,
  `nombreConjunto` text NOT NULL,
  `descripcionConjunto` text DEFAULT NULL,
  PRIMARY KEY (`id_conjunto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conjunto`
--

LOCK TABLES `conjunto` WRITE;
/*!40000 ALTER TABLE `conjunto` DISABLE KEYS */;
/*!40000 ALTER TABLE `conjunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conjunto_prendas`
--

DROP TABLE IF EXISTS `conjunto_prendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conjunto_prendas` (
  `id_conjunto_prendas` int(11) NOT NULL AUTO_INCREMENT,
  `id_conjunto` int(11) DEFAULT NULL,
  `id_prenda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_conjunto_prendas`),
  KEY `id_conjunto` (`id_conjunto`),
  KEY `id_prenda` (`id_prenda`),
  CONSTRAINT `conjunto_prendas_ibfk_1` FOREIGN KEY (`id_conjunto`) REFERENCES `conjunto` (`id_conjunto`),
  CONSTRAINT `conjunto_prendas_ibfk_2` FOREIGN KEY (`id_prenda`) REFERENCES `prenda` (`id_prenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conjunto_prendas`
--

LOCK TABLES `conjunto_prendas` WRITE;
/*!40000 ALTER TABLE `conjunto_prendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `conjunto_prendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conjunto_tematica`
--

DROP TABLE IF EXISTS `conjunto_tematica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conjunto_tematica` (
  `id_conjunto_tematica` int(11) NOT NULL AUTO_INCREMENT,
  `id_conjunto` int(11) DEFAULT NULL,
  `id_tematica` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_conjunto_tematica`),
  KEY `id_conjunto` (`id_conjunto`),
  KEY `id_tematica` (`id_tematica`),
  CONSTRAINT `conjunto_tematica_ibfk_1` FOREIGN KEY (`id_conjunto`) REFERENCES `conjunto` (`id_conjunto`),
  CONSTRAINT `conjunto_tematica_ibfk_2` FOREIGN KEY (`id_tematica`) REFERENCES `tematica` (`id_tematica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conjunto_tematica`
--

LOCK TABLES `conjunto_tematica` WRITE;
/*!40000 ALTER TABLE `conjunto_tematica` DISABLE KEYS */;
/*!40000 ALTER TABLE `conjunto_tematica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flete`
--

DROP TABLE IF EXISTS `flete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flete` (
  `id_flete` int(11) NOT NULL AUTO_INCREMENT,
  `descripcionFlete` text NOT NULL,
  `coste` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `fechaEntrega` date NOT NULL,
  PRIMARY KEY (`id_flete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flete`
--

LOCK TABLES `flete` WRITE;
/*!40000 ALTER TABLE `flete` DISABLE KEYS */;
/*!40000 ALTER TABLE `flete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flete_conjunto`
--

DROP TABLE IF EXISTS `flete_conjunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flete_conjunto` (
  `id_flete_conjunto` int(11) NOT NULL AUTO_INCREMENT,
  `id_conjunto` int(11) DEFAULT NULL,
  `id_flete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_flete_conjunto`),
  KEY `id_conjunto` (`id_conjunto`),
  KEY `id_flete` (`id_flete`),
  CONSTRAINT `flete_conjunto_ibfk_1` FOREIGN KEY (`id_conjunto`) REFERENCES `conjunto` (`id_conjunto`),
  CONSTRAINT `flete_conjunto_ibfk_2` FOREIGN KEY (`id_flete`) REFERENCES `flete` (`id_flete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flete_conjunto`
--

LOCK TABLES `flete_conjunto` WRITE;
/*!40000 ALTER TABLE `flete_conjunto` DISABLE KEYS */;
/*!40000 ALTER TABLE `flete_conjunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prenda`
--

DROP TABLE IF EXISTS `prenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prenda` (
  `id_prenda` int(11) NOT NULL AUTO_INCREMENT,
  `nombrePrenda` text NOT NULL,
  PRIMARY KEY (`id_prenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prenda`
--

LOCK TABLES `prenda` WRITE;
/*!40000 ALTER TABLE `prenda` DISABLE KEYS */;
/*!40000 ALTER TABLE `prenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talla`
--

DROP TABLE IF EXISTS `talla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `talla` (
  `id_talla` int(11) NOT NULL AUTO_INCREMENT,
  `talla` text DEFAULT NULL,
  `id_prenda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_talla`),
  KEY `id_prenda` (`id_prenda`),
  CONSTRAINT `talla_ibfk_1` FOREIGN KEY (`id_prenda`) REFERENCES `prenda` (`id_prenda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talla`
--

LOCK TABLES `talla` WRITE;
/*!40000 ALTER TABLE `talla` DISABLE KEYS */;
/*!40000 ALTER TABLE `talla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tematica`
--

DROP TABLE IF EXISTS `tematica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tematica` (
  `id_tematica` int(11) NOT NULL AUTO_INCREMENT,
  `tematica` text NOT NULL,
  `descriptematica` text NOT NULL,
  PRIMARY KEY (`id_tematica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tematica`
--

LOCK TABLES `tematica` WRITE;
/*!40000 ALTER TABLE `tematica` DISABLE KEYS */;
/*!40000 ALTER TABLE `tematica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `userName` text NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-06 13:31:46
