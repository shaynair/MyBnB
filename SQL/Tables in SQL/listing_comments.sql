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
-- Table structure for table `listing_comments`
--

DROP TABLE IF EXISTS `listing_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_comments` (
  `listingID` int(11) NOT NULL,
  `commenterID` int(11) NOT NULL,
  `content` text NOT NULL,
  `commented_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`listingID`,`commenterID`),
  KEY `commenterID` (`commenterID`),
  CONSTRAINT `listing_comments_ibfk_1` FOREIGN KEY (`commenterID`) REFERENCES `users` (`sin_id`) ON DELETE CASCADE,
  CONSTRAINT `listing_comments_ibfk_2` FOREIGN KEY (`listingID`) REFERENCES `listings` (`listingID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_comments`
--

LOCK TABLES `listing_comments` WRITE;
/*!40000 ALTER TABLE `listing_comments` DISABLE KEYS */;
INSERT INTO `listing_comments` VALUES (6976,29603052,'','2016-07-25 03:13:06'),(152630,37193227,'Really thought out! Engaging. It keeps your mind occupied while you wait.','2016-07-25 03:13:06'),(382929,34552909,'Excellent. So sleek.','2016-07-25 03:13:06'),(488959,33212966,'Fabulous spaces, friend.','2016-07-25 03:13:06'),(533084,37844039,'Everything feels nice.','2016-07-25 03:13:06'),(543823,38573316,'Adore your work.','2016-07-25 03:13:07'),(753348,52992470,'','2016-07-25 03:13:07'),(753446,29603052,'','2016-07-25 03:13:06'),(781153,30753730,'','2016-07-25 03:13:06'),(879929,33212966,'','2016-07-25 03:13:06'),(951782,36141263,'I think clients would love this.','2016-07-25 03:13:06'),(1281306,37844039,'So exquisite and good dude','2016-07-25 03:13:06'),(1301845,24345657,'Tremendously engaging experience!!','2016-07-25 03:13:06'),(1349965,24345657,'Tremendously engaging experience!!','2016-07-25 03:13:06'),(1494726,37193227,'Really thought out! Engaging. It keeps your mind occupied while you wait.','2016-07-25 03:13:06'),(1564714,37253135,'This atmosphere blew my mind.','2016-07-25 03:13:06'),(1591827,37844039,'It\'s admirable not just minimal!','2016-07-25 03:13:06'),(2326265,23904087,'Excellent. So sleek.','2016-07-25 03:13:06'),(2326272,36141263,'I think clients would love this.','2016-07-25 03:13:06'),(2570965,30753730,'','2016-07-25 03:13:06'),(2583074,37253135,'This atmosphere blew my mind.','2016-07-25 03:13:06'),(3038516,24345657,'Tremendously engaging experience!!','2016-07-25 03:13:06'),(3075044,37253135,'Adore your work.','2016-07-25 03:13:06'),(3200293,38573316,'Adore your work.','2016-07-25 03:13:07'),(3420384,34552909,'It\'s classic not just exquisite!','2016-07-25 03:13:06'),(3422597,37253135,'Adore your work.','2016-07-25 03:13:06'),(3522508,33212966,'','2016-07-25 03:13:06'),(3575220,37844039,'It\'s admirable not just minimal!','2016-07-25 03:13:06'),(3858401,23904087,'Excellent. So sleek.','2016-07-25 03:13:06'),(4025194,38855266,'Adore your work.','2016-07-25 03:13:07'),(4085362,29603052,'','2016-07-25 03:13:06'),(4614098,37844039,'It\'s admirable not just minimal!','2016-07-25 03:13:07'),(4775413,24345657,'Tremendously engaging experience!!','2016-07-25 03:13:06'),(4823922,46037158,'','2016-07-25 03:13:07'),(4916307,36141263,'I think clients would love this.','2016-07-25 03:13:06'),(4934960,37253135,'Adore your work.','2016-07-25 03:13:06'),(5434353,23904087,'','2016-07-25 03:13:06'),(5659689,24345657,'Tremendously engaging experience!!','2016-07-25 03:13:06'),(5709491,23904087,'Excellent. So sleek.','2016-07-25 03:13:06'),(5915025,34552909,'I think clients would love this.','2016-07-25 03:13:06'),(6390287,36141263,'Really thought out! Engaging. It keeps your mind occupied while you wait.','2016-07-25 03:13:06'),(6502061,23904087,'Excellent. So sleek.','2016-07-25 03:13:06'),(6887004,37193227,'Really thought out! Engaging. It keeps your mind occupied while you wait.','2016-07-25 03:13:06'),(6922238,37193227,'It\'s classic not just exquisite!','2016-07-25 03:13:06'),(6932491,23904087,'Excellent. So sleek.','2016-07-25 03:13:06'),(8321518,37193227,'It\'s classic not just exquisite!','2016-07-25 03:13:06'),(8535966,23904087,'Excellent. So sleek.','2016-07-25 03:13:06'),(8650746,24345657,'','2016-07-25 03:13:06'),(12232129,38573316,'','2016-07-25 03:13:07');
/*!40000 ALTER TABLE `listing_comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-24 23:18:09
