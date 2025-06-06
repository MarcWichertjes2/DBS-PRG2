CREATE DATABASE  IF NOT EXISTS `game` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `game`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: game
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `spelers`
--

DROP TABLE IF EXISTS `spelers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spelers` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TeamsID` int NOT NULL,
  `Nummer` int NOT NULL,
  `Voornaam` varchar(50) NOT NULL,
  `Achternaam` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TeamsID` (`TeamsID`),
  CONSTRAINT `spelers_ibfk_1` FOREIGN KEY (`TeamsID`) REFERENCES `teams` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spelers`
--

LOCK TABLES `spelers` WRITE;
/*!40000 ALTER TABLE `spelers` DISABLE KEYS */;
INSERT INTO `spelers` VALUES (1,1,10,'Liam','Jansen'),(2,1,10,'Ema','Vermeer'),(3,2,9,'Noah','De Vries'),(4,2,4,'Sophie','Bakker'),(5,3,34,'Daan','Peeters'),(6,3,6,'Mila','Hendriks'),(7,4,8,'Finn','Vos'),(8,4,5,'stinky','Kuipers'),(9,5,3,'Ties','Van Dijk'),(11,3,10,'Marc','Wichertjes');
/*!40000 ALTER TABLE `spelers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `spelers_AFTER_INSERT` AFTER INSERT ON `spelers` FOR EACH ROW BEGIN
	INSERT INTO spelers_log (SpelerID, TeamsID, Nummer, Voornaam, Achternaam, usr)
    VALUES (NEW.ID, NEW.TeamsID, NEW.Nummer, NEW.Voornaam, NEW.Achternaam, user());
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `spelers_AFTER_UPDATE` AFTER UPDATE ON `spelers` FOR EACH ROW BEGIN

  INSERT INTO spelers_update_log (
    SpelerID,
    OudeTeamsID, NieuweTeamsID,
    OudeNummer, NieuweNummer,
    OudeVoornaam, NieuweVoornaam,
    OudeAchternaam, NieuweAchternaam,
    usr
  )
  VALUES (
    OLD.ID,
    OLD.TeamsID, NEW.TeamsID,
    OLD.Nummer, NEW.Nummer,
    OLD.Voornaam, NEW.Voornaam,
    OLD.Achternaam, NEW.Achternaam,
    user()
  );

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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `spelers_AFTER_DELETE` AFTER DELETE ON `spelers` FOR EACH ROW BEGIN

  INSERT INTO spelers_delete_log (SpelerID, TeamsID, Nummer, Voornaam, Achternaam, usr)
  VALUES (OLD.ID, OLD.TeamsID, OLD.Nummer, OLD.Voornaam, OLD.Achternaam, user());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `spelers_delete_log`
--

DROP TABLE IF EXISTS `spelers_delete_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spelers_delete_log` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SpelerID` int DEFAULT NULL,
  `TeamsID` int DEFAULT NULL,
  `Nummer` int DEFAULT NULL,
  `Voornaam` varchar(100) DEFAULT NULL,
  `Achternaam` varchar(100) DEFAULT NULL,
  `usr` varchar(100) DEFAULT NULL,
  `VerwijderdOp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spelers_delete_log`
--

LOCK TABLES `spelers_delete_log` WRITE;
/*!40000 ALTER TABLE `spelers_delete_log` DISABLE KEYS */;
INSERT INTO `spelers_delete_log` VALUES (1,12,10,120,'Pieter','Post',NULL,'2025-06-05 09:45:12'),(2,10,5,1,'Isa','De Boer','coach@localhost','2025-06-06 10:22:34');
/*!40000 ALTER TABLE `spelers_delete_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spelers_log`
--

DROP TABLE IF EXISTS `spelers_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spelers_log` (
  `LogID` int NOT NULL AUTO_INCREMENT,
  `SpelerID` int DEFAULT NULL,
  `TeamsID` int DEFAULT NULL,
  `teamnaam` varchar(100) DEFAULT NULL,
  `Nummer` int DEFAULT NULL,
  `Voornaam` varchar(50) DEFAULT NULL,
  `Achternaam` varchar(50) DEFAULT NULL,
  `usr` varchar(100) DEFAULT NULL,
  `IngevoegdOp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LogID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spelers_log`
--

LOCK TABLES `spelers_log` WRITE;
/*!40000 ALTER TABLE `spelers_log` DISABLE KEYS */;
INSERT INTO `spelers_log` VALUES (1,11,3,NULL,10,'Marc','Wichertjes',NULL,'2025-06-05 07:26:26'),(2,12,10,NULL,120,'Pieter','Post',NULL,'2025-06-05 07:32:24'),(3,NULL,13,'mider_hoop',NULL,NULL,NULL,'coach@localhost','2025-06-06 08:37:53');
/*!40000 ALTER TABLE `spelers_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spelers_update_log`
--

DROP TABLE IF EXISTS `spelers_update_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spelers_update_log` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SpelerID` int DEFAULT NULL,
  `OudeTeamsID` int DEFAULT NULL,
  `NieuweTeamsID` int DEFAULT NULL,
  `OudeNummer` int DEFAULT NULL,
  `NieuweNummer` int DEFAULT NULL,
  `OudeVoornaam` varchar(100) DEFAULT NULL,
  `NieuweVoornaam` varchar(100) DEFAULT NULL,
  `OudeAchternaam` varchar(100) DEFAULT NULL,
  `NieuweAchternaam` varchar(100) DEFAULT NULL,
  `usr` varchar(100) DEFAULT NULL,
  `GewijzigdOp` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spelers_update_log`
--

LOCK TABLES `spelers_update_log` WRITE;
/*!40000 ALTER TABLE `spelers_update_log` DISABLE KEYS */;
INSERT INTO `spelers_update_log` VALUES (1,2,1,1,7,10,'Emma','Emma','Vermeer','Vermeer',NULL,'2025-06-05 09:48:15'),(2,2,1,1,10,10,'Emma','Ema','Vermeer','Vermeer',NULL,'2025-06-05 09:52:25'),(3,8,4,4,5,5,'Lotte','stinky','Kuipers','Kuipers','root@localhost','2025-06-06 09:44:16'),(4,5,3,3,11,69,'Daan','Daan','Peeters','Peeters','root@localhost','2025-06-06 09:56:04'),(5,5,3,3,69,34,'Daan','Daan','Peeters','Peeters','root@localhost','2025-06-06 10:01:47'),(6,10,5,5,1,2,'Isa','Isa','De Boer','De Boer',NULL,'2025-06-06 10:11:43'),(7,10,5,5,2,1,'Isa','Isa','De Boer','De Boer',NULL,'2025-06-06 10:16:07'),(8,10,5,5,1,1,'Isa','Isa','De Boer','De Boer','coach@localhost','2025-06-06 10:21:26');
/*!40000 ALTER TABLE `spelers_update_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Naam` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Naam` (`Naam`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (4,'Black Panthers'),(2,'Blue Sharks'),(10,'Crimson Hawks'),(5,'Golden Eagles'),(3,'Green Giants'),(13,'mider_hoop'),(8,'Orange Foxes'),(9,'Purple Vipers'),(1,'Red Dragons'),(6,'Silver Wolves'),(7,'White Tigers');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `teams_AFTER_INSERT` AFTER INSERT ON `teams` FOR EACH ROW BEGIN
	insert into spelers_log(teamsID, teamnaam, usr)
    values(NEW.ID, NEW.naam, user());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `userview`
--

DROP TABLE IF EXISTS `userview`;
/*!50001 DROP VIEW IF EXISTS `userview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `userview` AS SELECT 
 1 AS `Voornaam`,
 1 AS `Achternaam`,
 1 AS `nummer`,
 1 AS `Team`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'game'
--

--
-- Final view structure for view `userview`
--

/*!50001 DROP VIEW IF EXISTS `userview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `userview` AS select `spelers`.`Voornaam` AS `Voornaam`,`spelers`.`Achternaam` AS `Achternaam`,`spelers`.`Nummer` AS `nummer`,`teams`.`Naam` AS `Team` from (`spelers` left join `teams` on((`spelers`.`TeamsID` = `teams`.`ID`))) */;
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

-- Dump completed on 2025-06-06 10:42:37
