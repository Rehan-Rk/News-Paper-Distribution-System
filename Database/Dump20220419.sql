-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: college
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `aetable`
--

DROP TABLE IF EXISTS `aetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aetable` (
  `Aname` varchar(100) DEFAULT NULL,
  `E_id` int DEFAULT NULL,
  KEY `Aname` (`Aname`),
  KEY `E_id` (`E_id`),
  CONSTRAINT `aetable_ibfk_1` FOREIGN KEY (`Aname`) REFERENCES `areas` (`area1`),
  CONSTRAINT `aetable_ibfk_2` FOREIGN KEY (`E_id`) REFERENCES `employee` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aetable`
--

LOCK TABLES `aetable` WRITE;
/*!40000 ALTER TABLE `aetable` DISABLE KEYS */;
/*!40000 ALTER TABLE `aetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `area1` varchar(50) NOT NULL,
  `charges` varchar(100) NOT NULL,
  PRIMARY KEY (`area1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES ('ambegaon','50'),('civil line','60'),('khatroad','50'),('narhe','40'),('Railway Station ','70');
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `Fname` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `paper` varchar(50) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `Lname` varchar(100) DEFAULT NULL,
  `Amobile` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `mobile` (`mobile`),
  KEY `area` (`area`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`area`) REFERENCES `areas` (`area1`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (65,'Nehal','bhandara','ambegaon','9112454875','hitwad',NULL,'Thote','9112454878'),(66,'Mihir ','Bhnadara','ambegaon','8989898989','navbhart',NULL,'Limje',''),(67,'Vipul','bhandara','ambegaon','7218413967','TOI',NULL,'Raut','8787878796'),(68,'sandesh ','bhandara','khatroad','9122454845','navbhart',NULL,'dhande','9112454878'),(69,'Mayank ','bhandara','khatroad','9468978523','lokmat','null','Parate','8787878745'),(70,'Rehan','Bhandara','khatroad','9405882270','hitwad',NULL,'Khan','9454847596'),(71,'Nehal','bhandara','khatroad','9112454857','lokmat',NULL,'Thote',''),(73,'Nehal','bhandara','civil line','9112454856','hitwad',NULL,'Thote',''),(74,'Nehal','bhandara','civil line','9112454852','hitwad',NULL,'Thote',''),(76,'Nehal','bhandara','civil line','9112454853','hitwad',NULL,'Thote',''),(78,'Gokul','Bhandara','civil line','8657789458','hitwad',NULL,'Limje','');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `Fname` varchar(100) DEFAULT NULL,
  `eaddress` varchar(50) DEFAULT NULL,
  `emobile` varchar(10) DEFAULT NULL,
  `esalary` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `Lname` varchar(100) DEFAULT NULL,
  UNIQUE KEY `u_id` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (11,'Rohan','Bhandara','9122454845','2000','male','ambegaon','Wasnik');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newconnection`
--

DROP TABLE IF EXISTS `newconnection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newconnection` (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `Fname` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `mob` varchar(10) DEFAULT NULL,
  `paper` varchar(50) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `Lname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newconnection`
--

LOCK TABLES `newconnection` WRITE;
/*!40000 ALTER TABLE `newconnection` DISABLE KEYS */;
INSERT INTO `newconnection` VALUES (10,'Nehal','bhandara','9112454857','hitwad','19-04-2022','Thote');
/*!40000 ALTER TABLE `newconnection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papers`
--

DROP TABLE IF EXISTS `papers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `papers` (
  `papers` varchar(50) NOT NULL,
  `price` varchar(10) NOT NULL,
  PRIMARY KEY (`papers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papers`
--

LOCK TABLES `papers` WRITE;
/*!40000 ALTER TABLE `papers` DISABLE KEYS */;
INSERT INTO `papers` VALUES ('hitwad','6'),('lokmat','4'),('navbhart','3'),('TOI','5');
/*!40000 ALTER TABLE `papers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pctable`
--

DROP TABLE IF EXISTS `pctable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pctable` (
  `papers` varchar(100) DEFAULT NULL,
  `c_id` int DEFAULT NULL,
  KEY `papers` (`papers`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `pctable_ibfk_1` FOREIGN KEY (`papers`) REFERENCES `papers` (`papers`),
  CONSTRAINT `pctable_ibfk_2` FOREIGN KEY (`c_id`) REFERENCES `customer` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pctable`
--

LOCK TABLES `pctable` WRITE;
/*!40000 ALTER TABLE `pctable` DISABLE KEYS */;
INSERT INTO `pctable` VALUES ('hitwad',65),('navbhart',66),('TOI',67),('navbhart',68),('lokmat',69),('hitwad',70),('lokmat',71),('hitwad',73),('hitwad',74),('hitwad',76),('hitwad',78);
/*!40000 ALTER TABLE `pctable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `que` varchar(100) DEFAULT NULL,
  `answer` varchar(100) DEFAULT NULL,
  `agency_name` varchar(100) DEFAULT NULL,
  `agency_address` varchar(200) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES (22,'Mihir Limje','m@gmail.com','qqq','Favorite teacher in school','qq','Daily News Papers','Shahid Ward, Bhandara : 441904.','9112494348');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-19 20:03:54
