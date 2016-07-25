-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: mybnb
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `profile_comments`
--

DROP TABLE IF EXISTS `profile_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_comments` (
  `userID` int(11) NOT NULL,
  `commenterID` int(11) NOT NULL,
  `content` text NOT NULL,
  `commented_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userID`,`commenterID`),
  KEY `commenterID` (`commenterID`),
  CONSTRAINT `profile_comments_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`sin_id`) ON DELETE CASCADE,
  CONSTRAINT `profile_comments_ibfk_2` FOREIGN KEY (`commenterID`) REFERENCES `users` (`sin_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_comments`
--

LOCK TABLES `profile_comments` WRITE;
/*!40000 ALTER TABLE `profile_comments` DISABLE KEYS */;
INSERT INTO `profile_comments` VALUES (23904087,6542094,'Talkative','2016-07-25 03:12:21'),(23904087,7134807,'would love to have them back','2016-07-25 03:12:21'),(23904087,9658771,'','2016-07-25 03:12:21'),(23904087,11883405,'would love to have them back','2016-07-25 03:12:21'),(23904087,13281477,'would love to have them back','2016-07-25 03:12:21'),(23904087,24558497,'would love to have them back','2016-07-25 03:12:21'),(23904087,29603052,'would love to have them back','2016-07-25 03:12:21'),(24345657,7078248,'no noice at all','2016-07-25 03:12:21'),(24345657,7324823,'loves the same music as I do','2016-07-25 03:12:21'),(24345657,9214271,'','2016-07-25 03:12:21'),(24345657,10635352,'loves the same music as I do','2016-07-25 03:12:21'),(24345657,15472709,'loves the same music as I do','2016-07-25 03:12:21'),(24345657,29335268,'loves the same music as I do','2016-07-25 03:12:21'),(29603052,16701,'','2016-07-25 03:12:21'),(29603052,3164508,'','2016-07-25 03:12:21'),(29603052,3962517,'','2016-07-25 03:12:21'),(30753730,19916,'','2016-07-25 03:12:21'),(30753730,4120058,'','2016-07-25 03:12:21'),(33212966,110792,'helped out with chores','2016-07-25 03:12:21'),(33212966,3527628,'','2016-07-25 03:12:21'),(33212966,4653380,'','2016-07-25 03:12:21'),(34552909,431385,'helped out with chores','2016-07-25 03:12:21'),(34552909,1890533,'helped out with chores','2016-07-25 03:12:21'),(34552909,5162168,'very good','2016-07-25 03:12:21'),(36141263,702188,'very good','2016-07-25 03:12:21'),(36141263,2001148,'very good','2016-07-25 03:12:21'),(36141263,5164882,'very good','2016-07-25 03:12:21'),(36141263,11883405,'very good','2016-07-25 03:12:21'),(37193227,734359,'was clean as I left it','2016-07-25 03:12:21'),(37193227,5340640,'will definitly consider renting to them again','2016-07-25 03:12:21'),(37193227,7506913,'will definitly consider renting to them again','2016-07-25 03:12:21'),(37193227,12571995,'will definitly consider renting to them again','2016-07-25 03:12:21'),(37193227,21704315,'Friendly','2016-07-25 03:12:21'),(37253135,2572247,'Very friendly','2016-07-25 03:12:21'),(37253135,5422969,'Very friendly','2016-07-25 03:12:21'),(37253135,8323794,'Friendly','2016-07-25 03:12:21'),(37253135,13226301,'Very friendly','2016-07-25 03:12:21'),(37253135,22760672,'Very friendly','2016-07-25 03:12:21'),(37844039,2619674,'kept the place clean','2016-07-25 03:12:22'),(37844039,6336753,'kept the place clean','2016-07-25 03:12:22'),(37844039,8491165,'kept the place clean','2016-07-25 03:12:22'),(37844039,13226301,'kept the place clean','2016-07-25 03:12:22'),(37844039,23904087,'kept the place clean','2016-07-25 03:12:22'),(38573316,1264979,'','2016-07-25 03:12:22'),(38573316,2673521,'kept the place clean','2016-07-25 03:12:22'),(38573316,6404004,'arranged everything the way it was before leaving','2016-07-25 03:12:22'),(38855266,1480518,'arranged everything the way it was before leaving','2016-07-25 03:12:22'),(46037158,3649315,'','2016-07-25 03:12:22'),(52992470,3945222,'','2016-07-25 03:12:22');
/*!40000 ALTER TABLE `profile_comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-24 23:19:18
