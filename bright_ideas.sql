CREATE DATABASE  IF NOT EXISTS `ideasdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ideasdb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ideasdb
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ideas`
--

DROP TABLE IF EXISTS `ideas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ideas` (
  `IdeaId` int(11) NOT NULL AUTO_INCREMENT,
  `Description` varchar(255) DEFAULT NULL,
  `UserId` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`IdeaId`),
  KEY `fk_Idea_User1_idx` (`UserId`),
  CONSTRAINT `fk_Idea_User1` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ideas`
--

LOCK TABLES `ideas` WRITE;
/*!40000 ALTER TABLE `ideas` DISABLE KEYS */;
INSERT INTO `ideas` VALUES (2,'another witty',1,'2018-02-27 11:41:20','2018-02-27 11:41:20'),(5,'lalalalalallalaskdjfa',3,'2018-02-27 12:02:52','2018-02-27 12:02:52'),(6,'askdjfhaksdjfla',3,'2018-02-27 12:02:58','2018-02-27 12:02:58'),(7,'bright idea',5,'2018-02-27 12:58:22','2018-02-27 12:58:22');
/*!40000 ALTER TABLE `ideas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joins`
--

DROP TABLE IF EXISTS `joins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `joins` (
  `JoinId` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(11) NOT NULL,
  `IdeaId` int(11) NOT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`JoinId`),
  KEY `fk_User_has_Idea_Idea1_idx` (`IdeaId`),
  KEY `fk_User_has_Idea_User_idx` (`UserId`),
  CONSTRAINT `fk_User_has_Idea_Idea1` FOREIGN KEY (`IdeaId`) REFERENCES `ideas` (`IdeaId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_Idea_User` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joins`
--

LOCK TABLES `joins` WRITE;
/*!40000 ALTER TABLE `joins` DISABLE KEYS */;
INSERT INTO `joins` VALUES (2,2,2,'2018-02-27 11:59:45','2018-02-27 11:59:45'),(3,2,2,'2018-02-27 12:02:24','2018-02-27 12:02:24'),(4,3,2,'2018-02-27 12:03:03','2018-02-27 12:03:03'),(8,5,2,'2018-02-27 12:57:18','2018-02-27 12:57:18'),(12,5,6,'2018-02-27 12:57:24','2018-02-27 12:57:24'),(13,5,7,'2018-02-27 12:58:26','2018-02-27 12:58:26'),(14,5,7,'2018-02-27 12:58:32','2018-02-27 12:58:32'),(15,5,7,'2018-02-27 12:58:36','2018-02-27 12:58:36'),(16,5,7,'2018-02-27 12:58:38','2018-02-27 12:58:38'),(17,5,7,'2018-02-27 12:58:40','2018-02-27 12:58:40'),(18,5,7,'2018-02-27 12:58:41','2018-02-27 12:58:41'),(19,5,7,'2018-02-27 12:58:42','2018-02-27 12:58:42'),(20,5,7,'2018-02-27 12:58:43','2018-02-27 12:58:43'),(21,5,7,'2018-02-27 12:58:44','2018-02-27 12:58:44'),(22,5,7,'2018-02-27 12:58:45','2018-02-27 12:58:45'),(23,5,7,'2018-02-27 12:58:46','2018-02-27 12:58:46'),(24,6,7,'2018-02-27 13:05:55','2018-02-27 13:05:55'),(25,7,7,'2018-02-27 13:13:44','2018-02-27 13:13:44'),(26,7,7,'2018-02-27 13:13:45','2018-02-27 13:13:45'),(27,7,7,'2018-02-27 13:13:46','2018-02-27 13:13:46'),(28,7,2,'2018-02-27 13:15:13','2018-02-27 13:15:13'),(29,7,2,'2018-02-27 13:15:15','2018-02-27 13:15:15'),(30,7,2,'2018-02-27 13:15:16','2018-02-27 13:15:16'),(31,7,2,'2018-02-27 13:15:17','2018-02-27 13:15:17'),(32,7,2,'2018-02-27 13:15:17','2018-02-27 13:15:17'),(33,7,2,'2018-02-27 13:15:18','2018-02-27 13:15:18'),(34,7,2,'2018-02-27 13:15:19','2018-02-27 13:15:19'),(35,7,2,'2018-02-27 13:15:21','2018-02-27 13:15:21'),(36,7,2,'2018-02-27 13:15:21','2018-02-27 13:15:21'),(37,7,2,'2018-02-27 13:15:22','2018-02-27 13:15:22'),(38,7,2,'2018-02-27 13:15:23','2018-02-27 13:15:23'),(39,7,2,'2018-02-27 13:15:27','2018-02-27 13:15:27');
/*!40000 ALTER TABLE `joins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `UserId` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Alias` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Ria','Ria','ria@ria.ria','AQAAAAEAACcQAAAAEDFU/rraGvC7cl80nubPMJy9ZxUWFN4S9ZGx9y6aRff6vP/Z/y/PTxMAP/yHrc2+Mg==','2018-02-27 11:06:42','2018-02-27 11:06:42'),(2,'Nebula','Neb','neb@neb.neb','AQAAAAEAACcQAAAAEMQeE6Ht3/BywC+62ckkoLrAmr46Du0ApL3bSXffrkK/sZCWpr/o1vpABMW5a+OCUQ==','2018-02-27 11:41:50','2018-02-27 11:41:50'),(3,'Alcyone','Ace','ace@ace.ace','AQAAAAEAACcQAAAAEASC8u1qu3X6305PP16Nh4nKtRfkg6wsDN5RBYVechy6hgjWPA8KKwdKqaBUwxwipA==','2018-02-27 12:02:46','2018-02-27 12:02:46'),(4,'Alexandria Kong','Alex','ria2@ria.ria','AQAAAAEAACcQAAAAEJje7zn+ln/GHZfPNscYOSj0oYVWZTq4ynvl6GZd/2xkrBcKDXiXJtnvn+A82bnHig==','2018-02-27 12:43:59','2018-02-27 12:43:59'),(5,'Helios Kong','Helios','helios@helios.com','AQAAAAEAACcQAAAAEKgdRFMGBAu9QcGO3Phfd8lcnB4XwJxoAsBCqmJVKZhOq/mKSUYP1IlOWkoUAPuQJg==','2018-02-27 12:56:56','2018-02-27 12:56:56'),(6,'Lauren Hodges','Lauren','l@l.com','AQAAAAEAACcQAAAAEKgcB4St/wG91D5buncoH6bOnkQP9XmBTo743fg53/30sBzdh1mTuIOlXKmNdMfToQ==','2018-02-27 13:05:49','2018-02-27 13:05:49'),(7,'Noelle','Hey','ncaldwell@codingdojo.com','AQAAAAEAACcQAAAAENphH6O8k2D+bePrk7m/hPVjJ5GUe/WBK0Xq5Miya79lMZsPGF2KQIGeL/6j3TKV8g==','2018-02-27 13:13:37','2018-02-27 13:13:37');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-27 14:17:49
