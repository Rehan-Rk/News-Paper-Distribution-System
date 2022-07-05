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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-19 20:02:36
