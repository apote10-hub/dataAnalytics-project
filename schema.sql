-- MySQL dump 10.13  Distrib 8.4.7, for Win64 (x86_64)
--
-- Host: localhost    Database: gallimaps
-- ------------------------------------------------------
-- Server version	8.4.7

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `CategoryID` int NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CategoryID`),
  UNIQUE KEY `CategoryName` (`CategoryName`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (18,'Bank'),(2,'Hospital'),(16,'Parking'),(1,'Restaurant'),(19,'School'),(17,'Shop'),(3,'Temple');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mappoints`
--

DROP TABLE IF EXISTS `mappoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mappoints` (
  `PointID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `CategoryID` int DEFAULT NULL,
  `VerifiedStatus` tinyint(1) DEFAULT '1',
  `Location` varchar(255) NOT NULL,
  PRIMARY KEY (`PointID`),
  KEY `CategoryID` (`CategoryID`),
  CONSTRAINT `mappoints_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `categories` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mappoints`
--

LOCK TABLES `mappoints` WRITE;
/*!40000 ALTER TABLE `mappoints` DISABLE KEYS */;
INSERT INTO `mappoints` VALUES (1,'Galli Restaurant',1,1,''),(2,'Galli Cafe',1,1,''),(3,'City Hospital',2,1,''),(4,'Galli Cafe',1,1,'Ward 5, Kathmandu'),(5,'City Hospital',2,1,'Ward 3, Kathmandu');
/*!40000 ALTER TABLE `mappoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pendingsubmissions`
--

DROP TABLE IF EXISTS `pendingsubmissions`;
/*!50001 DROP VIEW IF EXISTS `pendingsubmissions`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pendingsubmissions` AS SELECT 
 1 AS `SubmissionID`,
 1 AS `PlaceName`,
 1 AS `Address`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissions` (
  `SubmissionID` int NOT NULL AUTO_INCREMENT,
  `UserID` int NOT NULL,
  `PlaceName` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `ContactNumber` varchar(20) DEFAULT NULL,
  `CategoryID` int NOT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `Status` enum('pending','approved','rejected') DEFAULT 'pending',
  `VerifiedStatus` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`SubmissionID`),
  UNIQUE KEY `unique_submission` (`PlaceName`,`Address`,`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES (1,1,'prettyclick','Budhanilkantha',NULL,1,NULL,'pending',0),(4,1,'Galli Cafe','Ward 5, Kathmandu','9812345678',1,'cafe.jpg','pending',0),(5,2,'City Hospital','Ward 3, Kathmandu','9800000000',2,'hospital.jpg','pending',0),(6,2,'Machhapuchre Bank','Ward 10, Kathmandu','9812345678',1,'bank.jpg','pending',0);
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Role` enum('user','admin') DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin User','admin@galli.com','admin'),(2,'User 1','user1@galli.com','user'),(3,'User 2','user2@galli.com','user'),(4,'User 3','user3@galli.com','user'),(5,'User 4','user4@galli.com','user'),(6,'User 5','user5@galli.com','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verificationlog`
--

DROP TABLE IF EXISTS `verificationlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `verificationlog` (
  `LogID` int NOT NULL AUTO_INCREMENT,
  `SubmissionID` int DEFAULT NULL,
  `VerifiedBy` int DEFAULT NULL,
  `Action` enum('approved','rejected') DEFAULT NULL,
  `VerifiedAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LogID`),
  KEY `VerifiedBy` (`VerifiedBy`),
  KEY `verificationlog_ibfk_1` (`SubmissionID`),
  CONSTRAINT `verificationlog_ibfk_1` FOREIGN KEY (`SubmissionID`) REFERENCES `submissions` (`SubmissionID`) ON DELETE CASCADE,
  CONSTRAINT `verificationlog_ibfk_2` FOREIGN KEY (`VerifiedBy`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verificationlog`
--

LOCK TABLES `verificationlog` WRITE;
/*!40000 ALTER TABLE `verificationlog` DISABLE KEYS */;
INSERT INTO `verificationlog` VALUES (10,4,3,'approved','2025-12-15 14:53:26'),(11,5,3,'approved','2025-12-15 14:53:26'),(12,6,3,'rejected','2025-12-15 14:53:26');
/*!40000 ALTER TABLE `verificationlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `pendingsubmissions`
--

/*!50001 DROP VIEW IF EXISTS `pendingsubmissions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pendingsubmissions` AS select `submissions`.`SubmissionID` AS `SubmissionID`,`submissions`.`PlaceName` AS `PlaceName`,`submissions`.`Address` AS `Address`,`submissions`.`Status` AS `Status` from `submissions` where (`submissions`.`Status` = 'Pending') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-28 12:28:24
