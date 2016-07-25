CREATE DATABASE  IF NOT EXISTS `mybnb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mybnb`;
-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `latitude` decimal(10,5) NOT NULL,
  `longitude` decimal(10,5) NOT NULL,
  `country` varchar(24) NOT NULL,
  `province` varchar(24) NOT NULL,
  `city` varchar(24) NOT NULL,
  `street_address` varchar(256) NOT NULL,
  `postal_code` varchar(7) NOT NULL,
  PRIMARY KEY (`latitude`,`longitude`),
  UNIQUE KEY `country` (`country`,`province`,`city`,`street_address`),
  KEY `postal_code` (`postal_code`),
  KEY `street_address` (`street_address`),
  KEY `country_2` (`country`,`province`,`city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (42.27441,-71.12529,'United States','Massachusetts','Boston','Doncaster Street, Boston, MA 02131, United States','2771'),(42.27493,-71.13063,'United States','Massachusetts','Boston','Beech Street, Boston, MA 02131, United States','2568'),(42.27572,-71.13014,'United States','Massachusetts','Boston','Glendower Road, Roslindale, MA 02131, United States','2599'),(42.27965,-71.13606,'United States','Massachusetts','Boston','Cedrus Avenue, Boston, MA 02131, United States','2221'),(42.28145,-71.12925,'United States','Massachusetts','Boston','Augustus Ave, Boston, MA 02131, United States','2926'),(42.28175,-71.14032,'United States','Massachusetts','Boston','Cornell Street, Boston, MA 02131, United States','2639'),(42.28209,-71.13335,'United States','Massachusetts','Boston','Durnell Avenue, Boston, MA 02131, United States','2549'),(42.28214,-71.12905,'United States','Massachusetts','Boston','Kittredge St, Roslindale, Boston, MA 02131, United States','2727'),(42.28280,-71.11515,'United States','Massachusetts','Boston','Brook St, Boston, MA 02131, United States','2453'),(42.28556,-71.12400,'United States','Massachusetts','Boston','Hyde Park Avenue, Roslindale, MA 02131, United States','2536'),(42.28588,-71.12491,'United States','Massachusetts','Boston','Sycamore St, Roslindale, MA 02131, United States','2860'),(42.28624,-71.13437,'United States','Massachusetts','Boston','Pinehurst Street, Boston, MA 02131, United States','2858'),(42.28626,-71.13707,'United States','Massachusetts','Boston','Tyndale Street, Boston, MA 02131, United States','2268'),(42.28885,-71.13128,'United States','Massachusetts','Boston','Fairview Street, Boston, MA 02131, United States','2333'),(42.28997,-71.13615,'United States','Massachusetts','Boston','Fletcher Street, Boston, MA 02131, United States','2373'),(42.29152,-71.13186,'United States','Massachusetts','Boston','Ashfield Street, Roslindale, MA 02131, United States','2586'),(42.29244,-71.13577,'United States','Massachusetts','Boston','Ardale St, Boston, MA 02131, United States','2357'),(42.29353,-71.12071,'United States','Massachusetts','Boston','Washington Street, Boston, MA 02131, United States','2131'),(43.74786,-79.49367,'Canada','Ontario','Toronto','Benjamin Boake Trail, Toronto, ON M3J 3b3, Canada','M3J 3b3'),(43.74945,-79.50488,'Canada','Ontario','Toronto','Grandravine Drive, Toronto, ON M3N 1J2, Canada','M3N 1J2'),(43.75262,-79.46548,'Canada','Ontario','Toronto','De Boers Drive, Toronto, ON M3J 3E5, Canada','M3J 3E5'),(43.75428,-79.50053,'Canada','Ontario','Toronto','Candlewood Crescent, Toronto, ON M3J 1G8, Canada','M3J 1G8'),(43.76396,-79.49695,'Canada','Ontario','Toronto','Four Winds Drive, Toronto, ON M3J 1K8, Canada','M3J 1K8'),(43.76551,-79.49440,'Canada','Ontario','Toronto','Four Winds Drive, Toronto, ON M3J 2S8, Canada','M3J 2S8'),(43.76597,-79.50259,'Canada','Ontario','Toronto','Sentinel Road, Toronto, ON M3J 3R9, Canada','M3J 3R9'),(43.76664,-79.49926,'Canada','Ontario','Toronto','Bowsfield Rd, Toronto, ON M3J 3R3, Canada','M3J 3R3'),(43.76761,-79.50310,'Canada','Ontario','Toronto','Assiniboine Road, Toronto, ON M3J 1L4, Canada','M3J 1L4'),(43.76763,-79.50239,'Canada','Ontario','Toronto','Sentinel Rd, Toronto, ON M3J 0B2, Canada','M3J 0B2'),(43.76804,-79.50013,'Canada','Ontario','Toronto','Cook Road, Toronto, ON M3J 3T1, Canada','M3J 3T1'),(43.76810,-79.50349,'Canada','Ontario','Toronto','Troyer Ave, Toronto, Ontario M3J 0A3, Canada','M3J 0A3'),(43.76914,-79.50439,'Canada','Ontario','Toronto','York University, 340 Assiniboine Road, Toronto, ON M3J 1L2, Canada','M3J 1L2'),(45.51278,-73.59735,'Canada','Quebec','Montreal','Casgrain Avenue, Montreal, QC H2T 1W8, Canada','H2T 1W8'),(45.51536,-73.61821,'Canada','Quebec','Montreal','Antonine Maillet Avenue, Montreal, Quebec H2V 2Y6, Canada','H2V 2Y6'),(45.51637,-73.59208,'Canada','Quebec','Montreal','Chemin de la Côte-Sainte-Catherine, Montreal, Quebec H2V, Canada','H2V 9C4'),(45.51645,-73.62116,'Canada','Quebec','Montreal','Avenue Hartland, Montreal, Quebec H2V 2X9, Canada','H2V 2X9'),(45.51655,-73.59726,'Canada','Quebec','Montreal','Avenue Édouard Charles, Montreal, Quebec H2V, Canada','H2V 3H3'),(45.51719,-73.61799,'Canada','Quebec','Outremont','Avenue Davaar, Outremont, QC H2V 1G4, Canada','H2V 1G4'),(45.51822,-73.59651,'Canada','Quebec','Outremont','Avenue Laurier Ouest, Outremont, QC H2V 2K8, Canada','H2V 2K8'),(45.51866,-73.61271,'Canada','Quebec','Montreal','Avenue Lajoie, Montreal, Quebec H2V, Canada','H2V 8U1'),(45.51902,-73.60851,'Canada','Quebec','Montreal','Bernard Avenue, Montreal, Quebec H2V 1V8, Canada','H2V 1V8'),(45.52001,-73.61211,'Canada','Quebec','Montreal','Avenue Joyce, Montreal, Quebec H2V 1S7, Canada','H2V 1S7'),(45.52014,-73.61552,'Canada','Quebec','Montreal','Avenue Wiseman, Montreal, QC H2V 1E8, Canada','H2V 1E8'),(45.52014,-73.61295,'Canada','Quebec','Outremont','Avenue Champagneur, Outremont, QC H2V 1P1, Canada','H2V 1P1'),(45.52016,-73.60120,'Canada','Quebec','Montreal','Av du Parc, Montreal, Quebec H2V 4G8, Canada','H2V 4G8'),(45.52076,-73.61281,'Canada','Quebec','Montreal','Avenue Outremont, Montreal, QC, Canada','H2V 3S3'),(45.52100,-73.61349,'Canada','Quebec','Montreal','Avenue Champagneur, Montreal, Quebec H2V 3P8, Canada','H2V 3P8'),(45.52130,-73.60832,'Canada','Quebec','Montreal','Avenue Champagneur, Montreal, Quebec H2V 3P7, Canada','H2V 3P7'),(45.52252,-73.60902,'Canada','Quebec','Montreal','A Avenue Bloomfield, Montreal, Quebec H2V 3S4, Canada','H2V 3S4'),(45.52344,-73.60911,'Canada','Quebec','Montreal','Avenue de l\'Épée, Montreal, QC H2V 3T9, Canada','H2V 3T9'),(45.52362,-73.60807,'Canada','Quebec','Montreal','Avenue du Parc, Montreal, Quebec H2V 4H4, Canada','H2V 4H4'),(45.52373,-73.61229,'Canada','Quebec','Montreal','Avenue Van Horne, Montreal, QC H2V 1J7, Canada','H2V 1J7'),(49.22760,-123.18995,'Canada','British Columbia','Vancouver','W 50th Ave, Vancouver, British Columbia V6N 3V4, Canada','V6N 3V4'),(49.23120,-123.18664,'Canada','British Columbia','Vancouver','Dunbar Street, Vancouver, BC V6N 1X3, Canada','V6N 1X3'),(49.23201,-123.20810,'Canada','British Columbia','Vancouver','Sennok Crescent, Vancouver, BC V6N 2E3, Canada','V6N 2E3'),(49.23283,-123.19596,'Canada','British Columbia','Vancouver','Salish Drive, Vancouver, BC V6N, Canada','V6N 1P6'),(49.23330,-123.18021,'Canada','British Columbia','Vancouver','West 44th Avenue, Vancouver, BC V6N 3K8, Canada','V6N 3K8'),(49.23468,-123.18669,'Canada','British Columbia','Vancouver','Dunbar Street, Vancouver, BC V6N 1W5, Canada','V6N 1W5'),(49.23617,-123.17896,'Canada','British Columbia','Vancouver','Blenheim Street, Vancouver, BC V6N 1P5, Canada','V6N 1P5'),(49.23900,-123.18096,'Canada','British Columbia','Vancouver','West 37th Avenue, Vancouver, BC V6N 2V6, Canada','V6N 2V6'),(49.24078,-123.18380,'Canada','British Columbia','Vancouver','West 34th Avenue, Vancouver, BC V6N 2K8, Canada','V6N 2K8'),(49.24167,-123.17028,'Canada','British Columbia','Vancouver','West 34th Avenue, Vancouver, BC V6N 2J7, Canada','V6N 2J7'),(49.24239,-123.18399,'Canada','British Columbia','Vancouver','Dunbar Street, Vancouver, BC V6S 2H3, Canada','V6S 2H3'),(49.24257,-123.17746,'Canada','British Columbia','Vancouver','West 32nd Avenue, Vancouver, BC V6L 2C3, Canada','V6L 2C3'),(49.24281,-123.18437,'Canada','British Columbia','Vancouver','Dunbar Street, Vancouver, BC V6S 2H2, Canada','V6S 2H2'),(49.24555,-123.18223,'Canada','British Columbia','Vancouver','West 30th Avenue, Vancouver, BC V6S 1W3, Canada','V6S 1W3'),(49.24573,-123.18943,'Canada','British Columbia','Vancouver','West 29th Avenue, Vancouver, BC V6S 1T6, Canada','V6S 1T6'),(49.24597,-123.17528,'Canada','British Columbia','Vancouver','West 28th Avenue, Vancouver, BC V6L 1X5, Canada','V6L 1X5'),(49.24980,-123.18913,'Canada','British Columbia','Vancouver','West 26th Avenue, Vancouver, BC V6S 1P1, Canada','V6S 1P1'),(49.25113,-123.18386,'Canada','British Columbia','Vancouver','West King Edward Avenue, Vancouver, BC V6S 1M4, Canada','V6S 1M4'),(49.25436,-123.18818,'Canada','British Columbia','Vancouver','West 19th Avenue, Vancouver, BC V6S 1C8, Canada','V6S 1C8'),(49.25517,-123.18549,'Canada','British Columbia','Vancouver','Dunbar Street, Vancouver, BC V6S, Canada','V6S 1C3'),(49.25596,-123.18075,'Canada','British Columbia','Vancouver','West 20th Avenue, Vancouver, BC V6S 1E5, Canada','V6S 1E5'),(49.25688,-123.17999,'Canada','British Columbia','Vancouver','Blenheim Street, Vancouver, BC V6L 2X8, Canada','V6L 2X8'),(49.25779,-123.20018,'Canada','British Columbia','Vancouver','West 15th Avenue, Vancouver, BC V6R 3A6, Canada','V6R 3A6');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amenities`
--

DROP TABLE IF EXISTS `amenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amenities` (
  `listingID` int(11) NOT NULL,
  `amenity` enum('Kitchen','Internet','TV','Essentials','Heating','Air Conditioning','Washer','Dryer','Free Parking','Wireless','Breakfast','Pets','Family Friendly','Suitable for Events','Smoking','Wheelchair Accessible','Elevator','Fireplace','Buzzer','Doorman','Pool','Hot Tub','Gym','24 Hours Check-In','Hangers','Iron','Hair Dryer','Laptop-friendly Workspace','Carbon Monoxide Detector','First Aid Kit','Smoke Detector') NOT NULL,
  PRIMARY KEY (`listingID`,`amenity`),
  CONSTRAINT `amenities_ibfk_1` FOREIGN KEY (`listingID`) REFERENCES `listings` (`listingID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amenities`
--

LOCK TABLES `amenities` WRITE;
/*!40000 ALTER TABLE `amenities` DISABLE KEYS */;
INSERT INTO `amenities` VALUES (6976,'Free Parking'),(6976,'Wheelchair Accessible'),(6976,'Fireplace'),(6976,'Doorman'),(6976,'Laptop-friendly Workspace'),(152630,'Internet'),(152630,'Free Parking'),(152630,'Hair Dryer'),(382929,'Wireless'),(382929,'Breakfast'),(382929,'Doorman'),(488959,'Smoking'),(488959,'Iron'),(488959,'Laptop-friendly Workspace'),(533084,'Smoking'),(543823,'Laptop-friendly Workspace'),(753348,'Hangers'),(753446,'Essentials'),(781153,'Laptop-friendly Workspace'),(879929,'Doorman'),(951782,'Kitchen'),(951782,'Fireplace'),(951782,'Pool'),(951782,'Smoke Detector'),(1281306,'TV'),(1281306,'Breakfast'),(1281306,'Family Friendly'),(1281306,'Hot Tub'),(1281306,'Laptop-friendly Workspace'),(1301845,'Internet'),(1301845,'Essentials'),(1301845,'Wireless'),(1301845,'Breakfast'),(1301845,'Family Friendly'),(1301845,'Elevator'),(1301845,'Buzzer'),(1301845,'24 Hours Check-In'),(1301845,'Iron'),(1349965,'TV'),(1349965,'Air Conditioning'),(1349965,'Pets'),(1349965,'Buzzer'),(1349965,'Doorman'),(1349965,'Pool'),(1349965,'Hangers'),(1349965,'Hair Dryer'),(1494726,'TV'),(1564714,'Heating'),(1591827,'Heating'),(1936861,'24 Hours Check-In'),(2326265,'Essentials'),(2326272,'First Aid Kit'),(2570965,'Family Friendly'),(2583074,'Air Conditioning'),(2583074,'Free Parking'),(2583074,'Wireless'),(2583074,'Smoking'),(2583074,'Wheelchair Accessible'),(2583074,'Fireplace'),(2583074,'Hangers'),(2583074,'Hair Dryer'),(2583074,'Smoke Detector'),(2672380,'Kitchen'),(2672380,'Internet'),(2672380,'TV'),(2672380,'Air Conditioning'),(2672380,'Free Parking'),(2672380,'Wireless'),(2672380,'Pets'),(2672380,'Family Friendly'),(2672380,'Smoking'),(2672380,'Elevator'),(2672380,'Fireplace'),(2672380,'Pool'),(2672380,'Hangers'),(2672380,'Iron'),(2672380,'Laptop-friendly Workspace'),(3038516,'TV'),(3038516,'Breakfast'),(3038516,'Family Friendly'),(3038516,'Elevator'),(3038516,'First Aid Kit'),(3038516,'Smoke Detector'),(3075044,'Internet'),(3075044,'Heating'),(3075044,'Air Conditioning'),(3075044,'Free Parking'),(3075044,'Wireless'),(3075044,'Elevator'),(3075044,'Doorman'),(3075044,'Hot Tub'),(3075044,'Hangers'),(3075044,'Iron'),(3075044,'Laptop-friendly Workspace'),(3075044,'First Aid Kit'),(3200293,'Internet'),(3200293,'Free Parking'),(3200293,'Breakfast'),(3200293,'Family Friendly'),(3200293,'Elevator'),(3200293,'Gym'),(3420384,'Internet'),(3420384,'Wireless'),(3422597,'Heating'),(3422597,'Suitable for Events'),(3422597,'Hot Tub'),(3422597,'24 Hours Check-In'),(3422597,'First Aid Kit'),(3522508,'Essentials'),(3522508,'Air Conditioning'),(3522508,'Family Friendly'),(3522508,'Doorman'),(3522508,'24 Hours Check-In'),(3534949,'Heating'),(3534949,'Free Parking'),(3534949,'Wireless'),(3534949,'Breakfast'),(3534949,'Pets'),(3534949,'Family Friendly'),(3534949,'Elevator'),(3534949,'Doorman'),(3534949,'Hangers'),(3534949,'First Aid Kit'),(3534949,'Smoke Detector'),(4775413,'Family Friendly'),(4775413,'Suitable for Events'),(4775413,'Smoking'),(4775413,'Wheelchair Accessible'),(4775413,'Elevator'),(4775413,'Hot Tub'),(4775413,'Iron'),(4775413,'Smoke Detector'),(4823922,'Essentials'),(4823922,'Free Parking'),(4823922,'Pets'),(4823922,'Family Friendly'),(4823922,'Suitable for Events'),(4823922,'Wheelchair Accessible'),(4823922,'Elevator'),(4823922,'Buzzer'),(4823922,'Doorman'),(4823922,'Pool'),(4823922,'Hangers'),(4823922,'Iron'),(4823922,'Hair Dryer'),(4823922,'First Aid Kit'),(4823922,'Smoke Detector'),(4916307,'Air Conditioning'),(4916307,'Free Parking'),(4916307,'Suitable for Events'),(4916307,'Iron'),(4916307,'Laptop-friendly Workspace'),(4916307,'Smoke Detector'),(4922204,'Kitchen'),(4922204,'Internet'),(4922204,'Air Conditioning'),(4922204,'Pets'),(4922204,'Family Friendly'),(4922204,'Smoking'),(4922204,'Elevator'),(4922204,'24 Hours Check-In'),(4922204,'Carbon Monoxide Detector'),(4922204,'Smoke Detector'),(4934960,'Internet'),(4934960,'Essentials'),(4934960,'Heating'),(4934960,'Free Parking'),(4934960,'Suitable for Events'),(4934960,'Smoking'),(4934960,'Fireplace'),(4934960,'Buzzer'),(5354033,'Heating'),(5354033,'Air Conditioning'),(5354033,'Family Friendly'),(5354033,'Smoking'),(5354033,'Fireplace'),(5354033,'Pool'),(5354033,'Gym'),(5354033,'24 Hours Check-In'),(5354033,'Hangers'),(5354033,'Iron'),(5354033,'Hair Dryer'),(5354033,'First Aid Kit'),(5434353,'Kitchen'),(5434353,'Internet'),(5434353,'Essentials'),(5434353,'Heating'),(5434353,'Wireless'),(5434353,'Pets'),(5434353,'Suitable for Events'),(5434353,'Wheelchair Accessible'),(5434353,'Elevator'),(5434353,'Pool'),(5434353,'Hot Tub'),(5434353,'Carbon Monoxide Detector'),(5550435,'TV'),(5550435,'Essentials'),(5550435,'Smoking'),(5550435,'Fireplace'),(5550435,'Buzzer'),(5550435,'Pool'),(5550435,'24 Hours Check-In'),(5550435,'Hair Dryer'),(5550435,'Smoke Detector'),(5659689,'Essentials'),(5659689,'Elevator'),(5659689,'Doorman'),(5659689,'24 Hours Check-In'),(5659689,'Hangers'),(5709491,'Kitchen'),(5709491,'Air Conditioning'),(5709491,'Free Parking'),(5709491,'Wireless'),(5709491,'Elevator'),(5709491,'Pool'),(5709491,'First Aid Kit'),(6932491,'Kitchen'),(6932491,'Free Parking'),(6932491,'Wireless'),(6932491,'Family Friendly'),(6932491,'Smoking'),(6932491,'Wheelchair Accessible'),(6932491,'Fireplace'),(6932491,'Pool'),(6932491,'Iron'),(6932491,'Hair Dryer'),(6932491,'Smoke Detector'),(6933545,'TV'),(6933545,'Essentials'),(6933545,'Free Parking'),(6933545,'Breakfast'),(6933545,'Pets'),(6933545,'Suitable for Events'),(6933545,'Elevator'),(6933545,'Doorman'),(6933545,'Gym'),(6933545,'Hangers'),(6933545,'Iron'),(6933545,'First Aid Kit'),(7111604,'Kitchen'),(7111604,'Heating'),(7111604,'Air Conditioning'),(7111604,'Free Parking'),(7111604,'Breakfast'),(7111604,'Suitable for Events'),(7111604,'Smoking'),(7111604,'Wheelchair Accessible'),(7111604,'Elevator'),(7111604,'Buzzer'),(7111604,'Hot Tub'),(7111604,'24 Hours Check-In'),(7111604,'Smoke Detector'),(7227968,'Kitchen'),(7227968,'Internet'),(7227968,'Essentials'),(7227968,'Heating'),(7227968,'Free Parking'),(7227968,'Breakfast'),(7227968,'Elevator'),(7227968,'Fireplace'),(7227968,'Buzzer'),(7227968,'Hot Tub'),(7252607,'Kitchen'),(7252607,'Internet'),(7252607,'TV'),(7252607,'Heating'),(7252607,'Air Conditioning'),(7252607,'Wireless'),(7252607,'Suitable for Events'),(7252607,'Smoking'),(7252607,'Pool'),(7252607,'24 Hours Check-In'),(7252607,'Hangers'),(7252607,'Hair Dryer'),(7252607,'Carbon Monoxide Detector'),(7252607,'First Aid Kit'),(7362173,'TV'),(7362173,'Essentials'),(7362173,'Free Parking'),(7362173,'Wireless'),(7362173,'Breakfast'),(7362173,'Suitable for Events'),(7362173,'Buzzer'),(7362173,'Doorman'),(7362173,'Hot Tub'),(7362173,'Hair Dryer'),(7362173,'Laptop-friendly Workspace'),(7362173,'First Aid Kit'),(7390061,'Internet'),(7390061,'TV'),(7390061,'Wireless'),(7390061,'Breakfast'),(7390061,'Wheelchair Accessible'),(7390061,'Fireplace'),(7390061,'Buzzer'),(7390061,'Pool'),(7390061,'Hot Tub'),(7390061,'Iron'),(7390061,'Carbon Monoxide Detector'),(7417108,'Kitchen'),(7417108,'Internet'),(7417108,'Essentials'),(7417108,'Air Conditioning'),(7417108,'Smoking'),(7417108,'Wheelchair Accessible'),(7417108,'Elevator'),(7417108,'Pool'),(7417108,'24 Hours Check-In'),(7417108,'Carbon Monoxide Detector'),(7417108,'First Aid Kit'),(7417108,'Smoke Detector'),(8030967,'Kitchen'),(8030967,'Internet'),(8030967,'TV'),(8030967,'Essentials'),(8030967,'Wireless'),(8030967,'Suitable for Events'),(8030967,'Smoking'),(8030967,'Wheelchair Accessible'),(8030967,'Gym'),(8030967,'24 Hours Check-In'),(8030967,'Hangers'),(8030967,'Laptop-friendly Workspace'),(8030967,'First Aid Kit'),(8321518,'Kitchen'),(8321518,'TV'),(8321518,'Essentials'),(8321518,'Air Conditioning'),(8321518,'Free Parking'),(8321518,'Wireless'),(8321518,'Breakfast'),(8321518,'Smoking'),(8321518,'Wheelchair Accessible'),(8321518,'Elevator'),(8321518,'Fireplace'),(8321518,'Hot Tub'),(8321518,'24 Hours Check-In'),(8321518,'Iron'),(8473851,'Heating'),(8473851,'Air Conditioning'),(8473851,'Free Parking'),(8473851,'Pets'),(8473851,'Elevator'),(8473851,'Buzzer'),(8473851,'Doorman'),(8473851,'Hot Tub'),(8473851,'Hair Dryer'),(8473851,'Laptop-friendly Workspace'),(8473851,'Carbon Monoxide Detector'),(8473851,'Smoke Detector'),(8535966,'Wireless'),(8535966,'Gym'),(8535966,'Iron'),(8539865,'Heating'),(8539865,'24 Hours Check-In'),(8539865,'Hair Dryer'),(8650746,'Essentials'),(8650746,'Air Conditioning'),(8650746,'Free Parking'),(8650746,'Breakfast'),(8650746,'Wheelchair Accessible'),(8650746,'Pool'),(8650746,'Hot Tub'),(8650746,'24 Hours Check-In'),(8783019,'TV'),(8783019,'Free Parking'),(8783019,'Family Friendly'),(8783019,'Suitable for Events'),(8783019,'Buzzer'),(8783019,'24 Hours Check-In'),(8783019,'Hair Dryer'),(8783019,'Smoke Detector'),(11639279,'Heating'),(11639279,'Air Conditioning'),(11639279,'Free Parking'),(11639279,'Breakfast'),(11639279,'Suitable for Events'),(11639279,'Elevator'),(11639279,'Hot Tub'),(11639279,'Gym'),(11639279,'Hangers'),(11639279,'Hair Dryer'),(11639279,'Laptop-friendly Workspace'),(12232129,'Heating'),(12232129,'Free Parking'),(12232129,'Breakfast'),(12232129,'Suitable for Events'),(12232129,'Elevator'),(12232129,'Pool'),(12232129,'Gym'),(12232129,'24 Hours Check-In'),(12232129,'Laptop-friendly Workspace'),(12232129,'First Aid Kit'),(12232129,'Smoke Detector');
/*!40000 ALTER TABLE `amenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `availability`
--

DROP TABLE IF EXISTS `availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `availability` (
  `availabilityID` int(11) NOT NULL AUTO_INCREMENT,
  `listingID` int(11) NOT NULL,
  `starts_on` date NOT NULL,
  `ends_on` date NOT NULL,
  `rent_type` enum('Full Location','Private Room','Shared Room') NOT NULL,
  `daily_price` double NOT NULL,
  `guests` smallint(5) unsigned NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`availabilityID`),
  KEY `listingID` (`listingID`),
  KEY `is_available` (`is_available`),
  KEY `starts_on` (`starts_on`,`ends_on`),
  KEY `rent_type` (`rent_type`,`daily_price`),
  CONSTRAINT `availability_ibfk_1` FOREIGN KEY (`listingID`) REFERENCES `listings` (`listingID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13000096 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `availability`
--

LOCK TABLES `availability` WRITE;
/*!40000 ALTER TABLE `availability` DISABLE KEYS */;
INSERT INTO `availability` VALUES (13000001,6976,'2016-06-21','2016-07-18','Shared Room',65,1,1),(13000002,2570965,'2016-06-30','2016-07-23','Shared Room',69,2,1),(13000003,488959,'2016-06-05','2016-07-18','Full Location',80,4,1),(13000005,3420384,'2016-06-05','2016-07-25','Private Room',150,4,1),(13000006,4916307,'2016-06-03','2016-07-02','Full Location',138,6,1),(13000007,152630,'2016-06-12','2016-07-22','Shared Room',110,3,1),(13000010,12232129,'2016-06-28','2016-07-21','Private Room',30,1,1),(13000011,4025194,'2016-06-26','2016-07-24','Full Location',75,2,1),(13000015,382929,'2016-06-10','2016-07-22','Private Room',40,2,1),(13000016,6390287,'2016-06-22','2016-07-11','Shared Room',76,1,1),(13000018,3075044,'2016-06-01','2016-07-13','Private Room',75,2,1),(13000019,533084,'2016-06-29','2016-07-11','Private Room',50,2,1),(13000020,543823,'2016-06-12','2016-07-30','Shared Room',105,4,1),(13000021,4085362,'2016-06-09','2016-07-01','Full Location',75,1,1),(13000023,3522508,'2016-06-10','2016-07-17','Full Location',69,3,1),(13000024,4823922,'2016-06-21','2016-07-01','Shared Room',75,2,1),(13000025,753348,'2016-06-01','2016-07-20','Shared Room',60,6,1),(13000026,753446,'2016-06-24','2016-07-27','Private Room',58,2,1),(13000027,781153,'2016-06-05','2016-07-05','Full Location',125,4,1),(13000028,879929,'2016-06-12','2016-07-02','Full Location',90,2,1),(13000029,5915025,'2016-06-18','2016-07-31','Full Location',150,2,1),(13000030,951782,'2016-06-30','2016-07-28','Private Room',69,1,1),(13000031,6887004,'2016-06-09','2016-07-21','Private Room',48,2,1),(13000032,3422597,'2016-06-04','2016-07-24','Private Room',220,4,1),(13000033,1281306,'2016-06-17','2016-07-21','Shared Room',226,6,1),(13000034,3200293,'2016-06-28','2016-07-20','Private Room',146,4,1),(13000035,8535966,'2016-06-30','2016-07-06','Full Location',150,2,1),(13000036,4922204,'2016-06-26','2016-07-08','Shared Room',200,9,1),(13000037,1301845,'2016-06-11','2016-07-24','Full Location',105,2,1),(13000038,3858401,'2016-06-12','2016-07-08','Private Room',69,3,1),(13000039,5550435,'2016-06-19','2016-07-16','Shared Room',78,2,1),(13000040,1349965,'2016-06-28','2016-07-04','Shared Room',109,4,1),(13000041,3534949,'2016-06-21','2016-07-19','Private Room',80,2,1),(13000042,1494726,'2016-06-15','2016-07-15','Private Room',89,2,1),(13000043,1564714,'2016-06-22','2016-07-11','Full Location',50,3,1),(13000044,1591827,'2016-06-25','2016-07-19','Shared Room',60,2,1),(13000047,8030967,'2016-06-02','2016-07-07','Shared Room',64,4,1),(13000048,8650746,'2016-06-27','2016-07-17','Private Room',150,6,1),(13000051,5434353,'2016-07-22','2016-08-12','Full Location',145,2,1),(13000052,1936861,'2016-07-16','2016-08-31','Full Location',50,1,1),(13000053,4775413,'2016-07-19','2016-08-18','Private Room',350,4,1),(13000054,2326265,'2016-07-24','2016-08-31','Private Room',160,6,1),(13000055,2326272,'2016-07-18','2016-08-22','Private Room',146,4,1),(13000056,6922238,'2016-07-02','2016-08-22','Private Room',110,5,1),(13000057,2583074,'2016-07-25','2016-08-09','Private Room',40,1,1),(13000058,3575220,'2016-07-22','2016-08-16','Shared Room',50,1,1),(13000059,6932491,'2016-07-01','2016-08-06','Full Location',99,2,1),(13000060,2672380,'2016-07-14','2016-08-15','Private Room',226,4,1),(13000061,3929127,'2016-07-22','2016-08-25','Private Room',125,4,1),(13000064,6933545,'2016-07-15','2016-08-04','Full Location',68,2,1),(13000065,3038516,'2016-07-05','2016-08-12','Full Location',98,2,1),(13000066,8321518,'2016-07-15','2016-08-08','Shared Room',80,3,1),(13000067,4934960,'2016-07-31','2016-08-16','Private Room',60,2,1),(13000068,4614098,'2016-07-17','2016-08-19','Full Location',34,2,1),(13000070,4710792,'2016-07-20','2016-08-15','Full Location',80,1,1),(13000077,6502061,'2016-07-07','2016-08-04','Private Room',48,2,1),(13000078,5354033,'2016-07-07','2016-08-26','Private Room',40,1,1),(13000079,5659689,'2016-07-30','2016-08-20','Private Room',300,5,1),(13000080,5709491,'2016-07-17','2016-08-26','Shared Room',89,2,1),(13000081,5922059,'2016-07-13','2016-08-14','Shared Room',38,2,1),(13000084,6628476,'2016-06-22','2016-07-11','Full Location',38,1,1),(13000085,8539865,'2016-07-07','2016-08-04','Shared Room',35,2,1),(13000086,7252607,'2016-07-26','2016-08-22','Shared Room',49,2,1),(13000087,6897283,'2016-07-29','2016-08-01','Shared Room',180,5,1),(13000088,7390061,'2016-07-14','2016-08-09','Shared Room',40,1,1),(13000089,7111604,'2016-07-05','2016-08-30','Shared Room',60,2,1),(13000090,7227968,'2016-07-26','2016-08-18','Private Room',65,2,1),(13000091,7362173,'2016-07-07','2016-08-26','Shared Room',575,5,1),(13000092,7417108,'2016-07-30','2016-08-30','Full Location',117,3,1),(13000093,8473851,'2016-06-09','2016-07-21','Private Room',50,2,1),(13000094,8783019,'2016-07-24','2016-08-11','Private Room',49,1,1),(13000095,11639279,'2016-07-02','2016-08-22','Private Room',284,8,1);
/*!40000 ALTER TABLE `availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `available_listings`
--

DROP TABLE IF EXISTS `available_listings`;
/*!50001 DROP VIEW IF EXISTS `available_listings`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `available_listings` AS SELECT 
 1 AS `listingID`,
 1 AS `title`,
 1 AS `description`,
 1 AS `max_guests`,
 1 AS `is_available`,
 1 AS `created_on`,
 1 AS `hostID`,
 1 AS `list_type`,
 1 AS `num_beds`,
 1 AS `num_bedrooms`,
 1 AS `num_bathrooms`,
 1 AS `average_listing_rating`,
 1 AS `unit_number`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `country`,
 1 AS `province`,
 1 AS `city`,
 1 AS `street_address`,
 1 AS `postal_code`,
 1 AS `average_price`,
 1 AS `num_amenities`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `booking_information`
--

DROP TABLE IF EXISTS `booking_information`;
/*!50001 DROP VIEW IF EXISTS `booking_information`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `booking_information` AS SELECT 
 1 AS `availabilityID`,
 1 AS `starts`,
 1 AS `ends`,
 1 AS `status`,
 1 AS `rent_type`,
 1 AS `num_guests`,
 1 AS `total_price`,
 1 AS `guests`,
 1 AS `renterID`,
 1 AS `bookingID`,
 1 AS `booking_time`,
 1 AS `card_number`,
 1 AS `card_type`,
 1 AS `expiry_date`,
 1 AS `listingID`,
 1 AS `title`,
 1 AS `description`,
 1 AS `max_guests`,
 1 AS `is_available`,
 1 AS `created_on`,
 1 AS `hostID`,
 1 AS `list_type`,
 1 AS `num_beds`,
 1 AS `num_bedrooms`,
 1 AS `num_bathrooms`,
 1 AS `average_listing_rating`,
 1 AS `unit_number`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `country`,
 1 AS `province`,
 1 AS `city`,
 1 AS `street_address`,
 1 AS `postal_code`,
 1 AS `average_price`,
 1 AS `num_amenities`,
 1 AS `sin_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email`,
 1 AS `birth_date`,
 1 AS `occupation`,
 1 AS `average_user_rating`,
 1 AS `starts_on`,
 1 AS `ends_on`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `bookingID` int(11) NOT NULL AUTO_INCREMENT,
  `availabilityID` int(11) NOT NULL,
  `renterID` int(11) NOT NULL,
  `starts` date NOT NULL,
  `ends` date NOT NULL,
  `status` enum('Available','Canceled by Renter','Canceled by Host') NOT NULL DEFAULT 'Available',
  `num_guests` smallint(5) unsigned NOT NULL,
  `card_number` bigint(20) NOT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bookingID`),
  KEY `card_number` (`card_number`),
  KEY `availabilityID` (`availabilityID`),
  KEY `renterID` (`renterID`),
  KEY `starts` (`starts`,`ends`),
  KEY `status` (`status`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`card_number`) REFERENCES `renter_payments` (`card_number`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`availabilityID`) REFERENCES `availability` (`availabilityID`) ON DELETE CASCADE,
  CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`renterID`) REFERENCES `users` (`sin_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=160100081 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (160100001,13000001,29603052,'2016-06-21','2016-07-18','Canceled by Host',1,4020000000000000,'2016-07-25 09:32:00'),(160100002,13000002,30753730,'2016-06-30','2016-07-23','Canceled by Host',1,4930000000000000,'2016-07-25 09:32:00'),(160100003,13000003,33212966,'2016-06-05','2016-07-18','Available',2,5590000000000000,'2016-07-25 09:33:07'),(160100005,13000005,34552909,'2016-06-24','2016-07-19','Available',2,5540000000000000,'2016-07-25 09:33:07'),(160100006,13000006,36141263,'2016-06-05','2016-07-25','Available',3,5340000000000000,'2016-07-25 09:33:07'),(160100007,13000007,37193227,'2016-06-03','2016-07-02','Available',4,5140000000000000,'2016-07-25 09:33:07'),(160100010,13000010,38573316,'2016-06-09','2016-07-29','Canceled by Host',2,5540000000000000,'2016-07-25 09:32:00'),(160100011,13000011,38855266,'2016-06-23','2016-07-01','Available',1,349000000000000,'2016-07-25 09:33:07'),(160100015,13000015,34552909,'2016-06-26','2016-07-24','Available',2,5540000000000000,'2016-07-25 09:33:07'),(160100016,13000016,36141263,'2016-06-15','2016-07-10','Available',3,5340000000000000,'2016-07-25 09:33:07'),(160100018,13000018,37253135,'2016-06-05','2016-07-06','Available',1,5160000000000000,'2016-07-25 09:33:07'),(160100019,13000019,37844039,'2016-06-07','2016-07-24','Available',1,5450000000000000,'2016-07-25 09:33:07'),(160100020,13000020,38573316,'2016-06-10','2016-07-22','Available',2,5540000000000000,'2016-07-25 09:33:07'),(160100021,13000021,29603052,'2016-06-22','2016-07-11','Canceled by Renter',1,4020000000000000,'2016-07-25 09:32:00'),(160100023,13000023,33212966,'2016-06-12','2016-07-19','Canceled by Renter',2,5590000000000000,'2016-07-25 09:32:00'),(160100024,13000024,46037158,'2016-06-01','2016-07-13','Canceled by Renter',2,346000000000000,'2016-07-25 09:32:00'),(160100025,13000025,52992470,'2016-06-29','2016-07-11','Canceled by Host',2,370000000000000,'2016-07-25 09:32:00'),(160100026,13000026,29603052,'2016-06-12','2016-07-30','Canceled by Host',2,4020000000000000,'2016-07-25 09:32:00'),(160100027,13000027,30753730,'2016-06-09','2016-07-01','Canceled by Host',1,4930000000000000,'2016-07-25 09:32:00'),(160100028,13000028,33212966,'2016-06-26','2016-07-31','Canceled by Host',4,5590000000000000,'2016-07-25 09:32:00'),(160100029,13000029,34552909,'2016-06-10','2016-07-17','Available',2,5540000000000000,'2016-07-25 09:33:07'),(160100030,13000030,36141263,'2016-06-21','2016-07-01','Available',2,5340000000000000,'2016-07-25 09:33:07'),(160100031,13000031,37193227,'2016-06-01','2016-07-20','Available',5,5140000000000000,'2016-07-25 09:33:07'),(160100032,13000032,37253135,'2016-06-24','2016-07-27','Available',2,5160000000000000,'2016-07-25 09:33:07'),(160100033,13000033,37844039,'2016-06-05','2016-07-05','Available',4,5450000000000000,'2016-07-25 09:33:07'),(160100034,13000034,38573316,'2016-06-12','2016-07-02','Available',2,5540000000000000,'2016-07-25 09:33:07'),(160100035,13000035,23904087,'2016-06-18','2016-07-31','Available',2,4890000000000000,'2016-07-25 09:33:07'),(160100037,13000037,24345657,'2016-06-09','2016-07-21','Available',2,4020000000000000,'2016-07-25 09:33:07'),(160100038,13000038,23904087,'2016-06-04','2016-07-24','Available',3,4890000000000000,'2016-07-25 09:33:07'),(160100040,13000040,24345657,'2016-06-28','2016-07-20','Available',4,4020000000000000,'2016-07-25 09:33:07'),(160100042,13000042,37193227,'2016-06-26','2016-07-08','Available',3,5140000000000000,'2016-07-25 09:33:07'),(160100043,13000043,37253135,'2016-06-11','2016-07-24','Available',2,5160000000000000,'2016-07-25 09:33:07'),(160100044,13000044,37844039,'2016-06-12','2016-07-08','Available',3,5450000000000000,'2016-07-25 09:33:07'),(160100048,13000048,24345657,'2016-06-21','2016-07-19','Canceled by Renter',2,4020000000000000,'2016-07-25 09:32:00'),(160100051,13000051,23904087,'2016-06-15','2016-07-15','Canceled by Host',2,4890000000000000,'2016-07-25 09:31:59'),(160100053,13000053,24345657,'2016-06-25','2016-07-19','Available',2,4020000000000000,'2016-07-25 09:33:07'),(160100054,13000054,23904087,'2016-06-28','2016-07-22','Available',1,4890000000000000,'2016-07-25 09:33:07'),(160100055,13000055,36141263,'2016-06-26','2016-07-11','Available',2,5340000000000000,'2016-07-25 09:33:07'),(160100056,13000056,37193227,'2016-06-02','2016-07-07','Available',4,5140000000000000,'2016-07-25 09:33:07'),(160100057,13000057,37253135,'2016-06-27','2016-07-17','Available',4,5160000000000000,'2016-07-25 09:33:07'),(160100058,13000058,37844039,'2016-07-28','2016-08-29','Available',1,5450000000000000,'2016-07-25 09:33:07'),(160100059,13000059,23904087,'2016-07-14','2016-08-08','Available',1,4890000000000000,'2016-07-25 09:33:07'),(160100065,13000065,24345657,'2016-07-24','2016-08-31','Available',6,4020000000000000,'2016-07-25 09:33:07'),(160100066,13000066,37193227,'2016-07-18','2016-08-22','Available',4,5140000000000000,'2016-07-25 09:33:07'),(160100067,13000067,37253135,'2016-07-02','2016-08-22','Available',3,5160000000000000,'2016-07-25 09:33:07'),(160100068,13000068,37844039,'2016-07-25','2016-08-09','Available',1,5450000000000000,'2016-07-25 09:33:07'),(160100077,13000077,23904087,'2016-07-14','2016-08-15','Available',4,4890000000000000,'2016-07-25 09:33:07'),(160100079,13000079,24345657,'2016-07-24','2016-08-02','Available',4,4020000000000000,'2016-07-25 09:33:07'),(160100080,13000080,23904087,'2016-07-18','2016-08-02','Available',2,4890000000000000,'2016-07-25 09:33:07');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cancellations_per_host`
--

DROP TABLE IF EXISTS `cancellations_per_host`;
/*!50001 DROP VIEW IF EXISTS `cancellations_per_host`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cancellations_per_host` AS SELECT 
 1 AS `hostID`,
 1 AS `num_cancellations`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `cancellations_per_renter`
--

DROP TABLE IF EXISTS `cancellations_per_renter`;
/*!50001 DROP VIEW IF EXISTS `cancellations_per_renter`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cancellations_per_renter` AS SELECT 
 1 AS `renterID`,
 1 AS `num_cancellations`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `host_market_share`
--

DROP TABLE IF EXISTS `host_market_share`;
/*!50001 DROP VIEW IF EXISTS `host_market_share`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `host_market_share` AS SELECT 
 1 AS `hostID`,
 1 AS `country`,
 1 AS `province`,
 1 AS `city`,
 1 AS `market_share`*/;
SET character_set_client = @saved_cs_client;

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

--
-- Temporary view structure for view `listing_information`
--

DROP TABLE IF EXISTS `listing_information`;
/*!50001 DROP VIEW IF EXISTS `listing_information`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listing_information` AS SELECT 
 1 AS `listingID`,
 1 AS `title`,
 1 AS `description`,
 1 AS `max_guests`,
 1 AS `is_available`,
 1 AS `created_on`,
 1 AS `hostID`,
 1 AS `list_type`,
 1 AS `num_beds`,
 1 AS `num_bedrooms`,
 1 AS `num_bathrooms`,
 1 AS `average_listing_rating`,
 1 AS `unit_number`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `country`,
 1 AS `province`,
 1 AS `city`,
 1 AS `street_address`,
 1 AS `postal_code`,
 1 AS `average_price`,
 1 AS `num_amenities`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `listing_ratings`
--

DROP TABLE IF EXISTS `listing_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_ratings` (
  `listingID` int(11) NOT NULL,
  `raterID` int(11) NOT NULL,
  `rating` smallint(5) unsigned NOT NULL,
  `rated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`listingID`,`raterID`),
  KEY `raterID` (`raterID`),
  CONSTRAINT `listing_ratings_ibfk_1` FOREIGN KEY (`raterID`) REFERENCES `users` (`sin_id`) ON DELETE CASCADE,
  CONSTRAINT `listing_ratings_ibfk_2` FOREIGN KEY (`listingID`) REFERENCES `listings` (`listingID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_ratings`
--

LOCK TABLES `listing_ratings` WRITE;
/*!40000 ALTER TABLE `listing_ratings` DISABLE KEYS */;
INSERT INTO `listing_ratings` VALUES (152630,37193227,3,'2016-07-25 03:12:42'),(382929,34552909,5,'2016-07-25 03:12:42'),(488959,33212966,4,'2016-07-25 03:12:42'),(533084,37844039,3,'2016-07-25 03:12:42'),(543823,38573316,3,'2016-07-25 03:12:42'),(753348,52992470,1,'2016-07-25 03:12:42'),(951782,36141263,4,'2016-07-25 03:12:42'),(1281306,37844039,2,'2016-07-25 03:12:42'),(1301845,24345657,2,'2016-07-25 03:12:42'),(1349965,24345657,5,'2016-07-25 03:12:42'),(1494726,37193227,2,'2016-07-25 03:12:42'),(1564714,37253135,5,'2016-07-25 03:12:42'),(1591827,37844039,3,'2016-07-25 03:12:42'),(2326265,23904087,1,'2016-07-25 03:12:42'),(2326272,36141263,3,'2016-07-25 03:12:42'),(2583074,37253135,4,'2016-07-25 03:12:42'),(3038516,24345657,5,'2016-07-25 03:12:42'),(3075044,37253135,4,'2016-07-25 03:12:42'),(3200293,38573316,4,'2016-07-25 03:12:42'),(3420384,34552909,1,'2016-07-25 03:12:42'),(3422597,37253135,1,'2016-07-25 03:12:42'),(3575220,37844039,3,'2016-07-25 03:12:42'),(3858401,23904087,1,'2016-07-25 03:12:42'),(4025194,38855266,4,'2016-07-25 03:12:42'),(4614098,37844039,3,'2016-07-25 03:12:42'),(4775413,24345657,1,'2016-07-25 03:12:42'),(4823922,46037158,2,'2016-07-25 03:12:42'),(4916307,36141263,4,'2016-07-25 03:12:42'),(4934960,37253135,4,'2016-07-25 03:12:42'),(5659689,24345657,1,'2016-07-25 03:12:42'),(5709491,23904087,2,'2016-07-25 03:12:42'),(5915025,34552909,5,'2016-07-25 03:12:42'),(6390287,36141263,3,'2016-07-25 03:12:42'),(6502061,23904087,4,'2016-07-25 03:12:42'),(6887004,37193227,1,'2016-07-25 03:12:42'),(6922238,37193227,2,'2016-07-25 03:12:42'),(6932491,23904087,3,'2016-07-25 03:12:42'),(8321518,37193227,5,'2016-07-25 03:12:42'),(8535966,23904087,1,'2016-07-25 03:12:42');
/*!40000 ALTER TABLE `listing_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listings`
--

DROP TABLE IF EXISTS `listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listings` (
  `listingID` int(11) NOT NULL AUTO_INCREMENT,
  `hostID` int(11) NOT NULL,
  `list_type` enum('Apartment','House','Townhouse','Villa','Tent','Condominium','Bungalow','Cottage','Loft','Lighthouse','Dormitory','Castle','Boat','RV','Other') NOT NULL DEFAULT 'Other',
  `latitude` decimal(10,5) NOT NULL,
  `longitude` decimal(10,5) NOT NULL,
  `unit_number` mediumint(9) DEFAULT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `num_bedrooms` smallint(5) unsigned NOT NULL,
  `num_beds` smallint(5) unsigned NOT NULL,
  `num_bathrooms` smallint(5) unsigned NOT NULL,
  `max_guests` smallint(5) unsigned NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`listingID`),
  KEY `hostID` (`hostID`),
  KEY `latitude` (`latitude`,`longitude`),
  KEY `is_available` (`is_available`),
  KEY `list_type` (`list_type`,`max_guests`),
  KEY `num_bedrooms` (`num_bedrooms`,`num_beds`,`num_bathrooms`),
  CONSTRAINT `listings_ibfk_1` FOREIGN KEY (`hostID`) REFERENCES `users` (`sin_id`) ON DELETE CASCADE,
  CONSTRAINT `listings_ibfk_2` FOREIGN KEY (`latitude`, `longitude`) REFERENCES `address` (`latitude`, `longitude`)
) ENGINE=InnoDB AUTO_INCREMENT=12232130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listings`
--

LOCK TABLES `listings` WRITE;
/*!40000 ALTER TABLE `listings` DISABLE KEYS */;
INSERT INTO `listings` VALUES (6976,16701,'Loft',42.29244,-71.13577,90,'Mexican Folk Art Haven in Boston','Come stay with a friendly, middle-aged guy in the safe and quiet Roslindale neighborhood of Boston. You will have you own clean, furnished room (with cable TV, Wi-Fi, and a desk to work at) in an apartment that is filled with Mexican folk art. This is a well-maintained two-family house built in the 1920s. My apartment is on the second floor. This is a pet and smoke-free apartment.   PRICE: Price includes ALL utilities (heat, electricity, Wi-Fi, cable TV, air conditioner), parking in street, and use of back yard. NO SMOKING indoors or outside. This is a room for one person, only. Note that the bed is a size \"Full\" mattress, not a Queen or a King.  The price listed is for one person.  I offer discounted rates for stays of one week or longer.   Guests get free coffee and a slice or two of my homemade banana or zucchini bread in the morning.  It\'s not a full breakfast, but it will get your day started on the right track. YOUR ROOM: Measures 12.5 by 11.5 feet. It has 2 windows, side-by side',1,1,1,1,1,'2016-07-25 04:26:15'),(152630,734359,'Apartment',45.51719,-73.61799,27,'Nice and sunny condo/Outremont','J\'aime ce quartier car il réunit à la fois la vie ville\\village.  C\'est un quartier résidentiel  entrecoupé par des rues très animées et  très diversifiées.  Il y a beaucoup d\'arbres, de nombreux parcs avec aires de jeux pour les enfants. Hi, I am renting my apartment. Special price for weekly rental. Magnificent apartment located in Montreal, Outremont. Outremont is one of the most \"green\" neighborhoods of Montreal. You will find there many parks, gardens, trees. It is great for kids as well as adults ! 3rd floor of a triplex. Newly renovated. Furnished with taste. Very sunny, fully equiped. A large open space combining kitchen and living room with fireplace. 2 confortable bedrooms.  the second bedroom has no door, only curtains and opens up on the living room.  there are 2 beds  A nice bathroom (with washing machine and dryer) Great terrasse at the back and a small balcony in front. Telephone (local calls), Cable tv, internet wifi. head, electricity included The neiborhood is is calm',2,3,1,3,1,'2016-07-25 04:26:15'),(382929,1890533,'Villa',45.52076,-73.61281,43,'Must love cats - flat in Montreal!','Looking to live in a beautiful and safe neighborhood,  one block from a subway station? You wish for a quiet yet fun person to share a gorgeous place with?  You love the presence of a funny cat? Well, this might be your lucky day! One block away from Outremont Metro station. Very nice and safe neighbourhood!  Everything is walking distance (restaurants, bars, grocery stores, drugstores, banks, etc.) You will share this spacious apartment (6 1/2) with a very easygoing and quiet roommate (me!). I will answer all your questions about the neighborhood or any \"technical\" or practical questions when they arise. You will become instant friends with Partner, the house cat, if you show him you can play too.  He loves to chase the laser light! :-O Looking forward to meet and greet you!   :-) P.S.:  I don\'t know why my apartment does not show on the Airbnb map... INCLUDED :  - High Speed Internet Wi-Fii  - Heating/ Electricity/ Gaz  - Washer & Dryer  - Dishwasher  - Toaster Oven / Microwave Oven ',1,1,1,2,1,'2016-07-25 04:26:15'),(488959,110792,'Apartment',45.51866,-73.61271,29,'Nice flat in great neighbourhood','English will follow. Bonjour!  Nous offrons un logement sympa pouvant accommoder jusqu\'à 3-4 personnes, dans un quartier tout aussi agréable. Chambre avec un grand lit double, canapé-lit au salon, cuisine bien équipée. Très ensoleillé et décoré de belles plantes. Outremont est un des quartiers les plus sympa de Montréal, le meilleur à notre avis: on y trouve de nombreux parcs, de très bons petits restaurants et cafés, la meilleure boulangerie de l\'île, de petites boutiques etc. C\'est à côté du Mile-End et pas très loin du Plateau. On peut facilement rejoindre le centre de la ville (10 minutes environ en autobus). Nous avons un piano. Et Internet sans fil, mais pas de télévision! _____ Hi! We are offering a nice apartment for up to 3-4 persons: one bedroom with a big double bed, folding couch in living room, well-equipped kitchen. Very sunny, with several plants.  Outremont is one of the best neighbourhoods in Montreal: very green, several parks, nice cafes and restaurants. Close to the',1,2,1,4,1,'2016-07-25 04:26:15'),(533084,2619674,'Apartment',45.51822,-73.59651,25,'parisian apartment in Outremont ','looking for people interested in a middle-term stay (from may 2014 until summer 2015, more or less) My apartment is located on the very chic Laurier Street, not far from Mile-End and the Mont-Royal Moutain. It gets the advantage of town as well as the quietnes of residential sector  wherein you can enjoy a very exciting local life AND a a quiet neighborhood, with a lot of trees.  The place was built in 1927 and is quite unique in his style. Because it\'s at the back side of the building and very well isolated, the place is very calm.  The apartment is all furnished and has two bedrooms with a double-bed in each room. It can accomodate 4 people.  Fees include internet and local phone.  There are several buses near by ((PHONE NUMBER HIDDEN)) and the Laurier metro station is about 13 minutes by foot.  Don\'t hesitate to contact me if you have some further questions ! I will be pleased to answer them.  ',1,1,1,2,1,'2016-07-25 04:26:15'),(543823,2673521,'Apartment',45.52014,-73.61295,28,'Nice large bedroom in Outremont','Nice large bedroom in Outremont. The room includes a double bed and a desk for your laptop with WIFI internet connexion. You will also have access to a large living room, a fully equiped kitchen (including an espresso machine!) and a terrasse with a BBQ to enjoy summer evenings. Air conditionning.  Three minutes walk from Outremont metro station. Easy access to Université de Montréal, Plateau Mont-Royal, Mile-End and downtown Montreal. BIXI station near by. Although close to downtown, Outremont is a very nice and quiet neighborhood, with numerous parks and trees along each streets. There is a nice public (outside) swimming pool just two blocks from here. You will be close to Bernard and Van Horne streets where you will find trendy restaurants and cafés. I am a sociologist and a photographer and would be happy to make you discover my beautiful city. I love gestonomy and would be happy to share my secrets concerning restaurants and beautiful places. ',2,2,1,4,1,'2016-07-25 04:26:15'),(753348,3945222,'Townhouse',45.52014,-73.61552,78,'Cozy apartment in Montreal','Apartment cozy en plein coeur de Montrél a 2 minutes a pied du métro. Belle vue sur parc avec piscine découverte. Tout confort, 2 chambres fermées avec lits queen et un canapé lit dans salon pour extra. Nombreux commerces accessibles à pied. Lovely apartment all furnished and  Ideally located in the beautiful quarter of Outremont ( centrer of Montreal), 2 minutes walk distance from the subway and 10 minutes from the Mont Royal.  Facing beautiful park with swimming pool.  Walking distance from commerces: bakery, cafes, grocery stores, banks, etc. 2 big bedrooms with double and queen beds + living room equipped with queen sofa bed. can sleep 4 and up to 6 people. Piano, washing machine and dryer in the apartment. Very comfortable and quiet. Wifi. All equipments Plein d\'arbres et de parcs. Jolie architecture. Environnement très famille. Proche du métro et du plateau. 20 minutes en taxi de l\'aéroport. 2 min à pied du métro. Stationnement gratuit dans la rue et rues avoisinantes avec certai',2,2,1,6,1,'2016-07-25 04:26:15'),(753446,3962517,'Loft',42.28588,-71.12491,1,'6 miles away from downtown Boston!','Nice and cozy apartment about 6 miles away to downtown Boston and only about 20 minutes via public transportation with plenty of street parking. It is a 5 minute walk from Rolsindale Village where you can find public transportation. Nice and cozy apartment about 6 miles away to downtown Boston and only about 20 minutes via public transportation with plenty of street parking. It is a 5 minute walk from Rolsindale Village where you can find public transportation, a Supermarket, a Bakery, and a ton of great bars and restaurants. It is also 1 mile from Forest Hills Station:  Bus/Subway/Train. It is conveniently located, with a small town atmosphere and just minutes to the city.  The bedroom is about 12 x 12, with a bunk bed for 2 guests including, a dresser, closet and a small desk. No TV. Shared bathroom. Amenities include: Free WIFI internet. Fresh towels. Pets: 1 cat.',1,2,1,2,1,'2016-07-25 04:26:15'),(781153,4120058,'Townhouse',49.24555,-123.18223,77,'The Secret Garden in Vancouver BC','Everything you need for a perfect stay!  Fireplace, sauna, your own BBQ hut and patio.    Lush gardens, tropical retreat with water feature, in a quiet and safe neighbourhood one block from shopping in Dunbar Village - close to UBC and downtown. The Secret Garden is a large garden suite with lots of light and windows, surrounded by lush gardens.  The apartment is on the ground level of a Craftsman styled house in a very quiet treed neighbourhood half a block from Dunbar Village. The apartment has two bedrooms - one with queen bed, one with standard double bed, lots of storage and closet space.  There is one bathroom with walk-in shower and rainhead and a sauna.  The kitchen is fully equipped with dishes, cutlery, pots and pans, etc. and has a full-size fridge with top freezer compartment and a microwave and full size stove.  Cozy and warm in winter with a lovely gas fireplace, and cool in summer. Half a block down the street is Dunbar Village with many ethnic restaurants, two pubs, liq',2,2,1,4,1,'2016-07-25 04:26:15'),(879929,4653380,'Loft',42.29152,-71.13186,21,'Surround yourself with custom art!','One big bedroom in a three bedroom Apartment in Boston. Guest has use of kitchen, living room, Laundry on premises. Conveniently located on back side of Arnold Arboretum, just a 3 minute walk to commuter rail (and then 11Minutes to Down town), bus stop at corner, 15 minute walk to Forest hills MBTA station. 3 minute walk to restaurants and stores. On bike path to inner corridor. This is the home of a woodworker/sculptor and you will be surrounded by art. Located in a safe quiet neighborhood.  Guests have use of bedroom shared bathroom and kitchen. I have bicycles on premises. I try to leave guests alone unless they need help. I am always available for questions by phone or text. This is a safe beautiful neighborhood bordering the Arnold Arboretum. Easy walk to dinner safe to walk home at night. Easy access to commuter rail, bus and MBTA. I am located on Boston bike trail and it is a 4.8 mile bike ride to the center of downtown Boston without riding on any roads.',1,1,1,2,1,'2016-07-25 04:26:15'),(951782,5164882,'Loft',49.25113,-123.18386,70,'West King Edward Suite','I have a clean, nicely furnished bedroom. The bedroom has a double futon bed, night table, dresser, desk & closet. Rental includes a full size, fully stocked kitchen, a bathroom to share with the other female roommate, and the use of the living room area. There is a laundry room, wireless internet & utilities included. No Pets & No Smoking. Great local transit access to Downtown Vancouver, Richmond and almost everywhere in the lower mainland. Bus stops located a few houses down from us as well as just up the street. Grocery store, drug store, movie theatre, library, produce shop, coffee shop just a 5 min walk.  Neighbourhood is safe and quiet.',1,1,1,1,1,'2016-07-25 04:26:15'),(1281306,6336753,'Apartment',49.22760,-123.18995,20,'Retreat in the City','Nestled in the forest near the Fraser River and UBC, this architect\'s own home offers guests the tranquility of the country in the city. This contemporary style  home is a great base for exploring the beautiful  beaches and attractions of Vancouver. 1 king bed, 2 queen and 1 twin comfortably sleep 4-6. Gourmet kitchen has gas cook top and all the staples a chef could require. Grand piano in living room. Relax on the large south facing private deck and barbecue at the end of a day of sightseeing.  Bedrooms and den on main floor level and large backyard make this the ideal choice for families and couples. charcoal barbecue patio heater Wifi, phone and Netflix  2 mountain bikes I will be available by email or phone throughout the stay. Steps to hiking/cycling trails along the river or through beautiful Pacific Spirit Park  5 minutes to UBC and beaches and 15-20 minutes by car to downtown or airport 10 minutes to Dunbar Village shops and movie theatre and Kerrisdale Shopping District and r',4,4,2,6,1,'2016-07-25 04:26:15'),(1301845,7078248,'Apartment',49.24573,-123.18943,20,'Private Garden Suite ','This private suite is on the ground level of our home in Vancouver.  It has it\'s own entry so you can come and go separate from the main house.  This studio suite has been recently renovated and is fully furnished with a full kitchen with stove-top and everything you need to cook and serve a meal, a full bathroom.  The queen size bed is separated from the main room by a privacy screen and there are drawers and a small closet for your things.  Bed linens and towels are provided.  You\'ll have a TV with full digital, HD cable including lots of movie channels.  Wi-fi is also included.  There is a small private patio outside your door and you have access to a shared backyard garden.  Just 2 short blocks away is a shopping community with just about everything you need: grocery markets, wine store, Starbucks, pub, movie theater, convenience stores, several major banks, hair salons and barbers, several small cafes and restaurants, pharmacies, walk in medical clinic, yoga and fitness studios, b',1,1,1,2,1,'2016-07-25 04:26:15'),(1349965,7324823,'House',49.24078,-123.18380,6,'Beautiful 1 BR Dunbar Apt','Our clean & bright newly renovated 1 bedroom suite with its own private entrance is located on West 34th Ave near Dunbar St.  We are on a direct bus route to downtown Vancouver (approx 20 mins away) and just a few blocks from direct buses to the University (UBC) and other parts of the city.  We are 15 mins from the Airport.  There is ample free on-street parking. The apartment is self-contained and very private.  It has a queen size bed in the bedroom, plus a futon double bed in the living room providing sleeping accomodation for up to 4 people.  Great for singles, couple or a family.  The bathroom has a shower/tub and we are child friendly (high chair, pack n play crib and other child equipment can be provided).  There are tennis courts, forest trails in the UBC Endowment Lands and a playground within walking distance.  Dunbar is a beautiful residential neighbourhood, a short distance from downtown, beaches and all the amenities Vancouver has to offer.  A variety of restaurants and co',1,2,1,4,1,'2016-07-25 04:26:15'),(1494726,7506913,'Loft',42.27572,-71.13014,59,'Cozy in Rozzie!','Spacious & quiet room with private bathroom, for 1 or 2,  in the lower level  of beautiful colonial home. Country feel in the city! Close to public transportation (40 min. to downtown Boston).  Great garden and porch. Golf course 5 min. away. Spacious room with private bathroom in really nice house located south of Boston, 40 minutes to downtown Boston by public transportation.  It accommodates up to 2 people.  Great restaurants nearby. The house has three levels and the room is located in the lower level. Beautiful backyard and garden, country feeling in the city. Share the kitchen and common areas with two more adults and 2 wonderful cats. Wi-Fi, Cable TV, Laundry by asking, Small refrigerator for your use, kitchen (some restrictions), deck and garden. NO Air Conditioner or Handicap access. There are 6 steps down to the room. If you like quaint villages, come to Rozzie Square and explore the great shops and restaurants: American, Indian, Italian, Korean, etc.  Some play live music on',1,1,1,2,1,'2016-07-25 04:26:15'),(1564714,8323794,'House',45.52252,-73.60902,28,'Outremont - Mile-End','OUTREMONT, entièrement meublé, très beau,ensoleillé, grand 4 1/2, 3e triplex, 5 électros. OUTREMONT, fully furnished, all inclusive, beautiful and bright 4 1/2, 3rd floor triplex, 5 appliances. Incluant grande cuisine avec balcon (table, chaises, parasol), salle à manger, salle de bains, chambre à coucher et salon et Internet haute vitesse, bureau, chauffage, électricité...  Includes fully equipped kitchen, TV, DVD player, Radio/CD Player. Wireless High Speed Internet, work table, electricity, heating...; includes a big kitchen with balcony (+ table, parasol and chairs), dining room, bathroom, one bedroom and living room. Cet appartement est situé sur l\'avenue Bloomfield près de Lajoie et de la rue Bernard. Seulement 5 minutes du métro Outremont, de plusieurs autobus, épiceries, boulangeries, cafés, restaurants-terrasses, et boutiques sur les rues Bernard, Parc et Saint Viateur. This architect\'s apartment is located on Bloomfield close to the corner of Lajoie and one street from Bernar',1,2,2,3,1,'2016-07-25 04:26:15'),(1591827,8491165,'Loft',42.28556,-71.12400,84,'PrivRoom+Bath In Roslindale/Boston','Cozy room with private bathroom use in Roslindale neighborhood of Boston. Typical commute into city center is 30 minutes via bus and train. Enjoy a nice room, in a nice home, with nice people and easy access to downtown at an affordable rate. Our listing is a private room in a very convenient location. There is no need for a car due to direct access to public transportation (Bus 32, 2 mins walk), but there is also ample street parking (please note no parking in front on Sunday nights for street cleaning) if you bring or rent one. We offer a clean, quiet, friendly, and tolerant atmosphere for all those who want to visit our city at a reasonable cost. Our street is pretty busy, so if you have trouble with traffic noise you may not want to stay at our location. But, we have the extra space, and we are happy to share it. Guests may enjoy their own private bathroom. The bedroom door is key locked (you get 1 key and we have one key for emergency), and guests will be given a key to front door',1,1,1,2,1,'2016-07-25 04:26:15'),(1936861,10021116,'Loft',42.28997,-71.13615,4,'Private Room in Rozzie','Private Room in Rozzie',1,1,1,1,1,'2016-07-25 04:26:15'),(2326265,11883405,'House',49.24239,-123.18399,14,'3bdr in Dunbar Village with a View','3bdr in Dunbar Village with a View',3,3,1,6,1,'2016-07-25 04:26:15'),(2326272,11883405,'House',49.24281,-123.18437,66,'Cozy 2b garden suite Dunbar Village','Cozy 2b garden suite Dunbar Village',2,3,1,4,1,'2016-07-25 04:26:15'),(2570965,19916,'Loft',49.23900,-123.18096,28,'*Total Privacy+Separate Entry*','Natural light and fresh air pour into this cosy accommodation. Our home has been completely renovated and featured in Style at Home Magazine. We are not only Airbnb hosts, but regular Airbnb guests as well.  We know what makes for a perfect guest experience. Check out our reviews, all our guests seem to think we\'ve got it right!  Everything you need for an easy, comfortable stay is here. The space isn\'t huge but the photos tell the story. It\'s a private, self-contained garden level suite with some fun, user-friendly extras. It\'s quiet too - no dogs barking, no kids running around. AND no cleaning fee! - Bright, modern bedroom with queen bed - Lux linens - Soft pillows and firm pillows. Your choice! - Full bathroom with heated towel rack, blow drier, organic shampoo, conditioner, body wash.  - Kitchenette with mini-fridge and microwave - Selection of coffees and herbal teas, breakfast bars - DIY home-made fruit/nut oatmeal for your first 3 days (guests LOVE this stuff!) - Kettle, dishes',1,1,1,2,1,'2016-07-25 04:26:15'),(2583074,13226301,'Dormitory',42.27965,-71.13606,26,'Cozy room in a charming villa.','Cozy room in a charming villa.',1,1,2,1,1,'2016-07-25 04:26:15'),(2672380,13682119,'Townhouse',49.24980,-123.18913,16,'Amazing neighbourhood!','Amazing neighbourhood!',3,3,2,4,1,'2016-07-25 04:26:15'),(3038516,15472709,'Condominium',45.51278,-73.59735,49,'Sunny, Zen apartment in Mile End.','Sunny, Zen apartment in Mile End.',1,2,1,2,1,'2016-07-25 04:26:15'),(3075044,2572247,'Villa',42.28624,-71.13437,22,'Charming room in pet friendly apt','Charming and quiet room in a second floor 1910 condo building. The room has a full size bed, darkening curtains, window A/C unit. It\'s quiet because it\'s in the back of the house. Shared bathroom. Guests can use kitchen, living room. Pet friendly. Small but cozy and quite room with a full size bed. Ample street parking. Apt has one more bedroom (which I use) and large living space and kitchen that you can use.  Possibility to do laundry. Two porches. If I am at home, I am likely working in my home office, which is a separate room. I can help you settle in and give you tips and directions on the neighborhood and Boston.  The room is in Roslindale, a diverse and primarily residential neighborhood of Boston. It\'s well connected via public transportation to other neighborhoods and easy to access by car. Roslindale Square is a nice business district with supermarkets. banks, a bakery, etc. (See my Guidebook for some recommendations). The Arnold Arboretum is just steps away. Plenty of safe s',1,1,1,2,1,'2016-07-25 04:26:15'),(3200293,6404004,'Apartment',49.25688,-123.17999,58,'Incredible view - Kitsilano/Dunbar','Our home is the top floor of a lovely house in Kitsilano/Dunbar.  Special features include one of the best views in the entire city with a deck to enjoy it from, a jaccuzi tub for two, king size bed, luxurious kitchen, quiet friendly neighbourhood. The house is just over 1100 sq. feet, on one storey (up a flight of stairs from the back garden).  In floor heating and gas fireplace make for cozy winter nights and 2 sets of french doors onto the balcony/deck make for fresh summer evenings.  In-suite laundry is handy after a hot day at the beach or rainy day hiking up the mountains.  There\'s also an office-type space with desk & office chair. The house is fully furnished and kitchen fully equiped. You will have access to the entire suite to yourselves.  There\'s a lovely family that live on the bottom 2 floors of the house, and while you might hear them if they\'re playing in the back yard they\'re very well behaved and soundproofing inside the house is excellent.  Free street parking directl',2,1,1,4,1,'2016-07-25 04:26:15'),(3420384,431385,'Loft',42.27441,-71.12529,19,'Convient, Safe and Comfortable','Located along public transportation with plenty of on street parking. Extra large studio with wifi, cable, original Fenway Park seats, patio, grill, hot tub, laundry, Charlie Cards, complimentary pass for 4 to the Museum of Fine Arts. Front and side access. Owner occupied. Village 1 mile with banks, grocery store, special meat and fish stores, international wine and cheese shop, flower shop, library and other shops to browse.  Some of the best restaurants in Boston, everything from Susi to Italian. Airport pick up service. Bus, commuter rail and train in the neighborhood. Bus a two minute walk from the house. Plenty of on street parking. Lyft service available while on premises. Access to large backyard. Enjoy John\'s original art work. 2 minutes from public transportation. Excellent restaurants and shops within walking distance.',1,3,1,4,1,'2016-07-25 04:26:15'),(3422597,5422969,'Apartment',49.25517,-123.18549,74,'Lux Vancouver Lanehouse Near UBC','2 levels, 1 bedroom, 1 bathroom new lane way house in Dunbar Village. Clean, minimalist design, not suitable for kid. Large private deck, seconds to direct bus downtown, UBC, Pacific Spirit Park, golf courses, tennis, bike to beach. Five Star Living! Perfect for two guests. The living room has a Scandinavian sofa that eases into a queen-sized bed, for extra people, but this house is not suitable for small children. Large, spacious and luxurious and free-standing! Your own home away from home. Steps from Westside private/public schools and UBC. A little gem in Dunbar, safe, quiet and welcoming.  Guest will have access to everything our little home has to offer. Bike rental just up the street, washer/dryer, fully equipped kitchen, bath and shower. We will give you keys, familiarize you with area and provide maps and tourism information. You can call/text us if you need something, but otherwise this is a very private accommodation. Dunbar is a little village in a big city. Our neighbourho',1,2,1,4,1,'2016-07-25 04:26:15'),(3522508,3527628,'Townhouse',49.23201,-123.20810,87,'Charming basement suite - near UBC','Our comfortable & private suite is next door to walking/cycling trails, 5 min drive to UBC, 10 min to the beach, and 20 min to downtown!  Large, extremely private backyard with BBQ and eating area. Perfect for students, couples, or a small family. Our clean and cute space easily accommodates a couple or small family.  We are also pet friendly (but require additional 25$ pet cleaning fee)! This fully furnished, private entry suite is self-contained and separate from the rest of the house.  There is plenty of free street parking out front. The bedroom has an extremely comfortable queen sized bed that will rejuvinate any tired traveler and offer you the best nights sleep!  The living area also has a futon couch that could sleep up to two people, if necessary. The kitchen is fully stocked with a full sized fridge, oven, dishwasher, coffee maker, and microwave.  We also supply the basics like sugar, salt, pepper, olive oil, and coffee!  There is also a 40\" flat screen tv with basic cable.  ',1,1,1,3,1,'2016-07-25 04:26:15'),(3534949,7465731,'Loft',49.25779,-123.20018,82,'Stay in beautiful Pt Grey Vancouver','SF bed (Q-size) room. Full, private bathroom. In 3 BedR + den, 2 1/2 BathR, 2400 sq ft SF, 2-storey contemporary house with 9 ft ceilings on main floor. On a quiet street in westside Vancouver\'s most desirable area. The house is large enough that you can have your own privacy.  I\'m the only other person sharing the 3 BR+den  upstairs with you. My BR is at one end of the hall, your guest BR is at the other. Very comfortably fits one or two people. Guests have access to the kitchen/breakfast nook, dining room, living room, shared laundry room, back yard and deck. I interact with guests as little or as much as they would like.  I tend to go to bed after most people and am not an early riser, so if your schedule is opposite to mine, you can often feel like you have the whole house to yourself!  My house is 5 blocks from the Blanca St UBC gates (15th Ave & Courtenay St) in Vancouver westside\'s best and most desirable area.  It\'s a beautiful, quiet, safe area, 7 min by bus from UBC, 8 min by',1,1,1,2,1,'2016-07-25 04:26:15'),(3575220,13226301,'Loft',42.27965,-71.13606,94,'The Artist room in beautiful villa.','The Artist room in beautiful villa.',1,1,1,1,1,'2016-07-25 04:26:15'),(3858401,7134807,'Loft',43.76396,-79.49695,62,'Spacious Room in Spacious Apartment','This spacious apartment is warm and charming, with its original art, large book collection, and tv/stereo equipment available to those who visit.   This is an ideal place to stay for the 2015 Pan Am / Parapan Am Games. The space available is a large private bedroom in a spacious three bedroom apartment.  The room is furnished with a double bed, bedside table, bookshelves, computer desk and chair, cabinet, and lockable door with key.   A blowup mattress is also available for a third guest. Guests will have access to all common spaces, including the bathroom, the living room, the balcony, the dining room, the computer room, and the kitchen.  The only room off limits is my private bedroom. I welcome guests to interact with me.  I am available for advice on the city or to simply chat.  But I also appreciate the need for privacy, and so guests are also welcome to keep to themselves without disturbance. This apartment is in a safe and friendly neighborhood, directly across from a community g',1,1,1,3,1,'2016-07-25 04:26:15'),(3929127,14589681,'Townhouse',43.74786,-79.49367,25,'900sq/ft apartment on ravine lot','900sq/ft apartment on ravine lot',1,2,1,4,1,'2016-07-25 04:26:15'),(4025194,1480518,'Villa',42.29353,-71.12071,80,'Queen Bed/Near Subway/Free Passes','Comfy queen-size bed, free breakfast, clean sheets, fresh towels, private space with welcoming hosts who want to make your Boston experience easy and memorable. Roslindale is a wonderful neighborhood. If you have any doubts, read our reviews! This room is situated in Boston\'s charming Roslindale neighborhood, 0.4 miles away from the Orange Line subway (an 8 minute walk or 2 minute ride on the very frequent buses). Quiet, young married hosts who are very friendly and like to meet new people. No pets, smoke-free, no harsh chemicals or fragrances in our cleaning products or laundry detergent.  Features: Free Continental Breakfast Comfortable Queen Bed with clean, soft sheets Fresh Towels Free Fast Wi-Fi Cable TV Living Room has movie projector w/ 10 ft screen, free popcorn, Netflix Air Conditioner during summer Desk Deck with seating and table On-Street Parking Bonuses: 2 Free Unlimited Passes for subway and bus  Free Water & Snacks Information: Pamphlets, brochures, books and takeout men',1,1,1,2,1,'2016-07-25 04:26:15'),(4085362,3164508,'Loft',42.28175,-71.14032,97,'Sub\"Urban\" Vacationing Rm 2','Come share our  beautifully maintained grand two family home built circa 1924 with spectacular views of the nearby Boston skyline.  We live in a quiet neighborhood and we are only a 4 minute walk to the bus. On street parking available.   We provide a bedroom and a full shared bath for this room. From the front of the house you have a panoramic view of Boston and from the back deck you have a private space overlooking our spacious back yard and the greenery of the neighborhood.  We provide the towels and the linens.   (For the summer months, we have air conditioning in the bedrooms)  Our home is impeccably clean.  We vacuum, dust, and clean everywhere before and after our guests arrive and depart.  For use of another room see our listing at Sub\"Urban\" Vacationing Rm 1.  We will respond to your inquiry within 6-8 hours or less. Amenities include an evening snack upon arrival, continental style breakfast (Please let us know of food allergies, or other dietary needs.), wireless internet, ',1,1,2,1,1,'2016-07-25 04:26:15'),(4614098,23904087,'Loft',45.51655,-73.59726,86,'Charming Bedroom in Mile End Apt.','Charming Bedroom in Mile End Apt.',1,1,1,2,1,'2016-07-25 04:26:15'),(4710792,24345657,'House',43.76597,-79.50259,53,'House','House',1,1,0,1,1,'2016-07-25 04:26:15'),(4775413,10635352,'Condominium',43.76761,-79.50310,99,'York Penthouse with a View','York Penthouse with a View',2,2,1,4,1,'2016-07-25 04:26:15'),(4823922,3649315,'Townhouse',45.52362,-73.60807,81,'Mile End 4 1/2 Montreal','Big clean 4 1/2 in the heart of the mileend. Cable tv, internet and easy access to best neighborhood Montreal. Perfect for couple or single person . Clean, bright and super cute .',1,1,1,2,1,'2016-07-25 04:26:15'),(4916307,702188,'Apartment',49.25436,-123.18818,87,'Private Modern Dunbar Suite','Our cozy basement suite is equipped to accommodate up to six people in a quiet residential neighbourhood.  We are located close to UBC with easy access to four bus routes. This is a single, self-contained, garden level suite (approx. 825 sq. ft.) with 2 bedrooms with queen size beds and a double sized futon in the living room. The suite is equipped to accommodate six people and is best suited to those who are active with plans to be out during the day. There is a separate, private entry with key-less access, LCD-TV with DVD, high speed internet, a single bathroom with shower, full  kitchen facilities including gas stove, refrigerator, microwave, toaster, blender, kettle, Keurig coffee maker, pots & pans,  glassware, dishes, cutlery and cooking utensils and in suite laundry facilities for guest use.  Guests staying over a week are provided weekly linen changes and cleaning service. Breakfast is not served. The suite has coffee and tea supplies and other basic kitchen essentials. Beyond ',2,3,1,6,1,'2016-07-25 04:26:15'),(4922204,6570877,'Apartment',42.28214,-71.12905,81,'Charming new house-15 min to Boston','Roslindale is the new hip section of Boston and I just bought this house which was fully renovated. It is a 5 minute walk to \"Rosi Square\" where you can get the commuter rail into downtown Boston. If you drive, it is 7.9 miles to downtown Boston. I just bought this house so my old Airbnb listing is deactivated but you can see reviews of my last place.  Guests can use the entire house but if your group is less than the entire house will fit,  you will have access to the number of bedrooms you need and the others will be closed so I don\'t have as much to clean. I ask for guests to please take off their shoes inside the house, and please no smoking. There is another apartment in the basement level which I may stay in if I am in town, but I am often away. I also come over to water the new grass which I am trying to grow! I am happy to interact or leave you on your own! I have an electronic keypad for entry so you will not have to worry about the key if I am not around. If there are no gues',3,6,2,9,1,'2016-07-25 04:26:15'),(4934960,22760672,'Loft',43.75262,-79.46548,8,'Beautiful sunny room in  condo','Beautiful sunny room in  condo',1,1,1,2,1,'2016-07-25 04:26:15'),(5354033,27751962,'Loft',45.51645,-73.62116,68,'Chambre privée dans luxueux 7 1/2','Chambre privée dans luxueux 7 1/2',1,1,1,1,1,'2016-07-25 04:26:15'),(5434353,9658771,'House',42.28626,-71.13707,83,'Quiet  Beauty in Boston','Quiet  Beauty in Boston',2,2,1,2,1,'2016-07-25 04:26:15'),(5550435,7155869,'House',45.51637,-73.59208,73,'Cozy apt in the ❤️ of Vibrant Mtl','Big 1-bedroom with a sofa bed in living room. Located centrally between cool Mile-End and trendy Outremont. 5 min walk to the Mont-Royal park. Easy access to groceries, cafés and metro and bus stations.',1,1,1,2,1,'2016-07-25 04:26:15'),(5659689,29335268,'Condominium',49.23120,-123.18664,71,'Beautifully renovated 2-3 bed home','Beautifully renovated 2-3 bed home',3,4,1,5,1,'2016-07-25 04:26:15'),(5709491,29603052,'Loft',49.23283,-123.19596,50,'Shaunessy golf course views by UBC ','Shaunessy golf course views by UBC ',1,1,1,2,1,'2016-07-25 04:26:15'),(5915025,5162168,'Townhouse',45.52100,-73.61349,28,'Big Gorgeous Sunny Gem w Roof Deck','Spacious and charming Outremont apartment, 10 minutes walk from Mile End, with 2 balconies and a huge roof deck, accessible by a spiral staircase in the kitchen.  The rooftop terrace is a great spot to recline or eat dinner with a fabulous view of Mount Royal, L\'Église Sainte-Madeleine, and the neighbourhood\'s beautiful green treetops. The huge, bright kitchen features a cathedral ceiling with skylights, and french doors that lead onto the back balcony which contains a gas BBQ. The rear balcony faces the back alley which can be a hub of neighbourly activity in the summer, with children playing and adults sipping cocktails.  In the back of the kitchen there is a big closet that holds the washer and dryer. The living room features a skylight, exposed brick, a working cast iron fireplace, and a 46\" flat screen TV. We also have a huge collection of vinyl LPs that you are free to enjoy. The smallish bathroom contains a big original clawfoot tub, original tile, a brand new sink, toilet, and ',1,1,1,2,1,'2016-07-25 04:26:15'),(5922059,30753730,'Loft',43.76763,-79.50239,44,'Cozy BR @ York University, Toronto','Cozy BR @ York University, Toronto',1,1,1,2,1,'2016-07-25 04:26:15'),(6390287,2001148,'Villa',49.24167,-123.17028,72,'Artist retreat','Share artist home filled with art.  It is my pleasure to accomodate you with a comfortable private room, in a tranquil setting minutes to the heart of Kits and downtown. Think sanctuary, the house is located on a quiet tree lined street. It is a home gallery of the owner. Guest are welcomed to use the kitchen, relax in the living room or back deck. I\'m happy to assist my guest with suggestions for places to visit, or general public transportation information. This is an older neighborhood that is located on a beautiful tree lined street. We are very close to public transportation that takes you straight to downtown attractions in 15 min. The beach is 10min.',1,1,1,1,1,'2016-07-25 04:26:15'),(6502061,24558497,'Loft',45.52373,-73.61229,71,'The coolest location in Montreal.','The coolest location in Montreal.',1,1,1,2,1,'2016-07-25 04:26:15'),(6628476,33212966,'Loft',43.76551,-79.49440,66,'Bdrm in shared condo near YorkU (M)','Bdrm in shared condo near YorkU (M)',1,1,1,1,1,'2016-07-25 04:26:15'),(6887004,5340640,'Townhouse',43.74945,-79.50488,58,'Cozy Apartment, 1 Bed, 1 Bath','A cozy apartment, with a private bedroom, king size bed and washroom. Very nice view of the city. You can see the CN Tower in the distance.  The unit is nicer than the building itself. Very cozy and upgraded for us to enjoy living in. The unit was renovated with care for us to live in and enjoy. The building itself is not new, but we\'ve done what we can to make the unit as cozy as possible. I\'m always available by text or email. I do my best to respond within a reasonably fast time frame. The common areas of the building are not in the newest condition.',2,1,1,2,1,'2016-07-25 04:26:15'),(6897283,36141263,'Loft',49.25596,-123.18075,41,'Collingwood Cottage near Dunbar','Collingwood Cottage near Dunbar',1,3,1,5,1,'2016-07-25 04:26:15'),(6922238,12571995,'Townhouse',43.75428,-79.50053,41,'Home near York University','Home near York University',2,4,1,5,1,'2016-07-25 04:26:15'),(6932491,13281477,'Townhouse',45.51902,-73.60851,88,'Bright Apartement near subway','Bright Apartement near subway',2,1,1,2,1,'2016-07-25 04:26:15'),(6933545,15472064,'Loft',42.28885,-71.13128,96,'Cozy Room On the Arnold Arboretum','Cozy Room On the Arnold Arboretum',1,1,1,2,1,'2016-07-25 04:26:15'),(7111604,37253135,'Loft',45.52344,-73.60911,66,'Nice room available in Outremont','Nice room available in Outremont',1,1,2,2,1,'2016-07-25 04:26:15'),(7227968,37844039,'Loft',43.76810,-79.50349,85,'Hotel Style Room W/ Fancy Washroom','Hotel Style Room W/ Fancy Washroom',1,1,1,2,1,'2016-07-25 04:26:15'),(7252607,34552909,'Loft',42.28280,-71.11515,85,'Private Room near Public Transport','Private Room near Public Transport',1,1,1,2,1,'2016-07-25 04:26:15'),(7362173,38573316,'Condominium',49.24597,-123.17528,5,'West Side Vancouver Entire Home','West Side Vancouver Entire Home',3,3,3,5,1,'2016-07-25 04:26:15'),(7390061,37193227,'Dormitory',43.76664,-79.49926,52,'Toronto@York university bright room','Toronto@York university bright room',1,1,1,1,1,'2016-07-25 04:26:15'),(7417108,38855266,'Bungalow',45.52130,-73.60832,42,'Luminous City Oasis in Mile End','Luminous City Oasis in Mile End',2,2,1,3,1,'2016-07-25 04:26:15'),(8030967,8860332,'House',43.76914,-79.50439,32,'Simple, clean and practical','Simple, clean and practical',2,4,1,4,1,'2016-07-25 04:26:15'),(8321518,21704315,'Condominium',49.23330,-123.18021,1,'Basement suite/flexible pricing!','Basement suite/flexible pricing!',1,1,1,3,1,'2016-07-25 04:26:15'),(8473851,44625108,'Loft',42.27493,-71.13063,76,'Private Room in Single Family Home','Private Room in Single Family Home',1,1,2,2,1,'2016-07-25 04:26:15'),(8535966,6542094,'Apartment',49.23468,-123.18669,28,'New 1 Bedroom/Studio Apartment','Open concept, large bright studio apartment. Coffee shop downstairs, across the street from IGA grocery store. The apartment has a full kitchen including a dishwasher. Wifi included. Easy Access to UBC, Kitsilano and Kerrisdale shops and restaurants. Queen sized bed, front room is like a solarium, and does close off to separate. The building is very new which is rare in Vancouver, with a beautiful clean kitchen and modern bathroom. Main Bus Routes are across the street and can take you pretty much anywhere in Vancouver.',1,1,1,2,1,'2016-07-25 04:26:15'),(8539865,34470961,'Loft',45.52001,-73.61211,42,'Cutie Patootie Montreal Apartment','Cutie Patootie Montreal Apartment',1,1,1,2,1,'2016-07-25 04:26:15'),(8650746,9214271,'House',49.23617,-123.17896,49,'Beautiful house near UBC','Beautiful house near UBC',3,3,3,6,1,'2016-07-25 04:26:15'),(8783019,46037158,'Loft',49.24257,-123.17746,3,'Near UBC. Quiet Street. Family home','Near UBC. Quiet Street. Family home',1,1,1,1,1,'2016-07-25 04:26:15'),(11639279,52992470,'Bungalow',45.51536,-73.61821,43,'Grande maison ancienne a louer','Grande maison ancienne a louer',4,4,2,8,1,'2016-07-25 04:26:15'),(12232129,1264979,'Loft',45.52016,-73.60120,21,'A beautiful room in the Mile-End','Sunny and comfortable room with a queen bed to rent in an apartment located in the coolest area of Montreal : the Mile-End. Close to all types of artistic venues, direct bus lines to McGill and UdeM universities, lots of',1,1,1,1,1,'2016-07-25 04:26:15');
/*!40000 ALTER TABLE `listings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `listings_per_city`
--

DROP TABLE IF EXISTS `listings_per_city`;
/*!50001 DROP VIEW IF EXISTS `listings_per_city`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listings_per_city` AS SELECT 
 1 AS `country`,
 1 AS `province`,
 1 AS `city`,
 1 AS `num_listings`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listings_per_country`
--

DROP TABLE IF EXISTS `listings_per_country`;
/*!50001 DROP VIEW IF EXISTS `listings_per_country`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listings_per_country` AS SELECT 
 1 AS `country`,
 1 AS `num_listings`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listings_per_host_in_city`
--

DROP TABLE IF EXISTS `listings_per_host_in_city`;
/*!50001 DROP VIEW IF EXISTS `listings_per_host_in_city`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listings_per_host_in_city` AS SELECT 
 1 AS `hostID`,
 1 AS `country`,
 1 AS `province`,
 1 AS `city`,
 1 AS `num_listings`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listings_per_host_in_country`
--

DROP TABLE IF EXISTS `listings_per_host_in_country`;
/*!50001 DROP VIEW IF EXISTS `listings_per_host_in_country`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listings_per_host_in_country` AS SELECT 
 1 AS `hostID`,
 1 AS `country`,
 1 AS `num_listings`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listings_per_postal_code`
--

DROP TABLE IF EXISTS `listings_per_postal_code`;
/*!50001 DROP VIEW IF EXISTS `listings_per_postal_code`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listings_per_postal_code` AS SELECT 
 1 AS `country`,
 1 AS `city`,
 1 AS `postal_code`,
 1 AS `num_listings`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `previously_booked`
--

DROP TABLE IF EXISTS `previously_booked`;
/*!50001 DROP VIEW IF EXISTS `previously_booked`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `previously_booked` AS SELECT 
 1 AS `listingID`,
 1 AS `title`,
 1 AS `description`,
 1 AS `max_guests`,
 1 AS `is_available`,
 1 AS `created_on`,
 1 AS `hostID`,
 1 AS `list_type`,
 1 AS `num_beds`,
 1 AS `num_bedrooms`,
 1 AS `num_bathrooms`,
 1 AS `average_listing_rating`,
 1 AS `unit_number`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `country`,
 1 AS `province`,
 1 AS `city`,
 1 AS `street_address`,
 1 AS `postal_code`,
 1 AS `average_price`,
 1 AS `num_amenities`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `price_per_amenity_in_location`
--

DROP TABLE IF EXISTS `price_per_amenity_in_location`;
/*!50001 DROP VIEW IF EXISTS `price_per_amenity_in_location`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `price_per_amenity_in_location` AS SELECT 
 1 AS `amenity`,
 1 AS `country`,
 1 AS `province`,
 1 AS `city`,
 1 AS `average_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `price_per_essential_in_location`
--

DROP TABLE IF EXISTS `price_per_essential_in_location`;
/*!50001 DROP VIEW IF EXISTS `price_per_essential_in_location`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `price_per_essential_in_location` AS SELECT 
 1 AS `country`,
 1 AS `province`,
 1 AS `city`,
 1 AS `average_price`,
 1 AS `average_beds`,
 1 AS `average_bedrooms`,
 1 AS `average_bathrooms`,
 1 AS `average_amenities`,
 1 AS `average_guests`,
 1 AS `bed_price`,
 1 AS `bedroom_price`,
 1 AS `bathroom_price`,
 1 AS `amenity_price`,
 1 AS `guest_price`*/;
SET character_set_client = @saved_cs_client;

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

--
-- Table structure for table `profile_ratings`
--

DROP TABLE IF EXISTS `profile_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_ratings` (
  `userID` int(11) NOT NULL,
  `raterID` int(11) NOT NULL,
  `rating` smallint(5) unsigned NOT NULL,
  `rated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userID`,`raterID`),
  KEY `raterID` (`raterID`),
  CONSTRAINT `profile_ratings_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `users` (`sin_id`) ON DELETE CASCADE,
  CONSTRAINT `profile_ratings_ibfk_2` FOREIGN KEY (`raterID`) REFERENCES `users` (`sin_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_ratings`
--

LOCK TABLES `profile_ratings` WRITE;
/*!40000 ALTER TABLE `profile_ratings` DISABLE KEYS */;
INSERT INTO `profile_ratings` VALUES (23904087,6542094,1,'2016-07-25 03:11:54'),(23904087,7134807,3,'2016-07-25 03:11:54'),(23904087,11883405,3,'2016-07-25 03:11:54'),(23904087,13281477,1,'2016-07-25 03:11:54'),(23904087,24558497,4,'2016-07-25 03:11:54'),(23904087,29603052,3,'2016-07-25 03:11:54'),(24345657,7078248,3,'2016-07-25 03:11:54'),(24345657,7324823,1,'2016-07-25 03:11:54'),(24345657,10635352,5,'2016-07-25 03:11:54'),(24345657,15472709,1,'2016-07-25 03:11:54'),(24345657,29335268,1,'2016-07-25 03:11:54'),(33212966,110792,5,'2016-07-25 03:11:54'),(34552909,431385,2,'2016-07-25 03:11:54'),(34552909,1890533,4,'2016-07-25 03:11:54'),(34552909,5162168,5,'2016-07-25 03:11:54'),(36141263,702188,1,'2016-07-25 03:11:54'),(36141263,2001148,4,'2016-07-25 03:11:54'),(36141263,5164882,3,'2016-07-25 03:11:54'),(36141263,11883405,2,'2016-07-25 03:11:54'),(37193227,734359,3,'2016-07-25 03:11:54'),(37193227,5340640,3,'2016-07-25 03:11:54'),(37193227,7506913,1,'2016-07-25 03:11:54'),(37193227,12571995,4,'2016-07-25 03:11:54'),(37193227,21704315,4,'2016-07-25 03:11:54'),(37253135,2572247,5,'2016-07-25 03:11:54'),(37253135,5422969,4,'2016-07-25 03:11:54'),(37253135,8323794,2,'2016-07-25 03:11:54'),(37253135,13226301,1,'2016-07-25 03:11:54'),(37253135,22760672,1,'2016-07-25 03:11:54'),(37844039,2619674,2,'2016-07-25 03:11:54'),(37844039,6336753,1,'2016-07-25 03:11:54'),(37844039,8491165,3,'2016-07-25 03:11:54'),(37844039,13226301,5,'2016-07-25 03:11:54'),(37844039,23904087,5,'2016-07-25 03:11:54'),(38573316,2673521,5,'2016-07-25 03:11:54'),(38573316,6404004,3,'2016-07-25 03:11:54'),(38855266,1480518,5,'2016-07-25 03:11:54'),(46037158,3649315,3,'2016-07-25 03:11:54'),(52992470,3945222,3,'2016-07-25 03:11:54');
/*!40000 ALTER TABLE `profile_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `renter_payments`
--

DROP TABLE IF EXISTS `renter_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `renter_payments` (
  `card_number` bigint(20) NOT NULL,
  `renterID` int(11) NOT NULL,
  `card_type` enum('Visa','MasterCard','American Express') NOT NULL,
  `expiry_date` date NOT NULL,
  PRIMARY KEY (`card_number`),
  KEY `renterID` (`renterID`),
  CONSTRAINT `renter_payments_ibfk_1` FOREIGN KEY (`renterID`) REFERENCES `users` (`sin_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `renter_payments`
--

LOCK TABLES `renter_payments` WRITE;
/*!40000 ALTER TABLE `renter_payments` DISABLE KEYS */;
INSERT INTO `renter_payments` VALUES (346000000000000,46037158,'American Express','2018-02-10'),(349000000000000,38855266,'American Express','2018-01-01'),(370000000000000,52992470,'American Express','2018-06-01'),(4020000000000000,24345657,'Visa','2018-05-01'),(4890000000000000,23904087,'Visa','2018-03-01'),(4930000000000000,30753730,'Visa','2018-10-01'),(5140000000000000,37193227,'MasterCard','2018-12-01'),(5160000000000000,37253135,'MasterCard','2018-03-01'),(5340000000000000,36141263,'MasterCard','2018-06-01'),(5450000000000000,37844039,'MasterCard','2018-12-01'),(5540000000000000,34552909,'MasterCard','2018-04-01'),(5590000000000000,33212966,'MasterCard','2018-10-01');
/*!40000 ALTER TABLE `renter_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `unbooked_availabilities`
--

DROP TABLE IF EXISTS `unbooked_availabilities`;
/*!50001 DROP VIEW IF EXISTS `unbooked_availabilities`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `unbooked_availabilities` AS SELECT 
 1 AS `listingID`,
 1 AS `title`,
 1 AS `description`,
 1 AS `max_guests`,
 1 AS `is_available`,
 1 AS `created_on`,
 1 AS `hostID`,
 1 AS `list_type`,
 1 AS `num_beds`,
 1 AS `num_bedrooms`,
 1 AS `num_bathrooms`,
 1 AS `average_listing_rating`,
 1 AS `unit_number`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `country`,
 1 AS `province`,
 1 AS `city`,
 1 AS `street_address`,
 1 AS `postal_code`,
 1 AS `average_price`,
 1 AS `num_amenities`,
 1 AS `starts_on`,
 1 AS `ends_on`,
 1 AS `rent_type`,
 1 AS `daily_price`,
 1 AS `guests`,
 1 AS `availabilityID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `user_information`
--

DROP TABLE IF EXISTS `user_information`;
/*!50001 DROP VIEW IF EXISTS `user_information`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `user_information` AS SELECT 
 1 AS `sin_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email`,
 1 AS `birth_date`,
 1 AS `occupation`,
 1 AS `registered_on`,
 1 AS `last_login`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `country`,
 1 AS `province`,
 1 AS `city`,
 1 AS `street_address`,
 1 AS `postal_code`,
 1 AS `average_user_rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `sin_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `latitude` decimal(10,5) NOT NULL,
  `longitude` decimal(10,5) NOT NULL,
  `birth_date` date NOT NULL,
  `occupation` varchar(50) NOT NULL,
  `login_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `registered_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sin_id`),
  UNIQUE KEY `email` (`email`),
  KEY `latitude` (`latitude`,`longitude`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`latitude`, `longitude`) REFERENCES `address` (`latitude`, `longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (16701,'Phil','Elene','Phil.Elene@mybnb.com',42.29244,-71.13577,'1977-07-31','Garden designer','2016-07-25 04:27:07','2016-07-25 04:25:33'),(19916,'Cathy','Loanna','Cathy.Loanna@mybnb.com',49.23900,-123.18096,'1972-11-16','Artist','2016-07-25 04:27:07','2016-07-25 04:25:33'),(110792,'Philipp','Chimwemwe','Philipp.Chimwemwe@mybnb.com',45.51866,-73.61271,'1983-12-30','Telephonist','2016-07-25 04:27:07','2016-07-25 04:25:33'),(431385,'Cynthia','Fabricia','Cynthia.Fabricia@mybnb.com',42.27441,-71.12529,'1966-02-10','Animal breeder','2016-07-25 04:27:07','2016-07-25 04:25:33'),(702188,'Ramona','Queenie','Ramona.Queenie@mybnb.com',49.25436,-123.18818,'1995-03-20','Animal breeder','2016-07-25 04:27:07','2016-07-25 04:25:33'),(734359,'Nicole','Sybille','Nicole.Sybille@mybnb.com',45.51719,-73.61799,'1994-05-03','Typist','2016-07-25 04:27:07','2016-07-25 04:25:33'),(1264979,'Ida','Ottabviano','Ida.Ottabviano@mybnb.com',45.52016,-73.60120,'1984-12-30','Salesperson','2016-07-25 04:27:07','2016-07-25 04:25:33'),(1480518,'Lisa','Edur','Lisa.Edur@mybnb.com',42.29353,-71.12071,'1968-02-08','Architect','2016-07-25 04:27:07','2016-07-25 04:25:33'),(1890533,'Nadia','Loanna','Nadia.Loanna@mybnb.com',45.52076,-73.61281,'1972-01-24','Circus worker','2016-07-25 04:27:07','2016-07-25 04:25:33'),(2001148,'Barbara','Goricia','Barbara.Goricia@mybnb.com',49.24167,-123.17028,'1985-11-16','Fitness instructor','2016-07-25 04:27:07','2016-07-25 04:25:33'),(2572247,'Andrea','Chimwemwe','Andrea.Chimwemwe@mybnb.com',42.28624,-71.13437,'1994-11-03','Disc jockey','2016-07-25 04:27:07','2016-07-25 04:25:33'),(2619674,'Maude','Elene','Maude.Elene@mybnb.com',45.51822,-73.59651,'1967-06-22','Architect','2016-07-25 04:27:07','2016-07-25 04:25:33'),(2673521,'Rémi','Mahli','Rémi.Mahli@mybnb.com',45.52014,-73.61295,'1989-05-16','Medical student','2016-07-25 04:27:07','2016-07-25 04:25:33'),(3164508,'Marilyn','Ralston','Marilyn.Ralston@mybnb.com',42.28175,-71.14032,'1989-08-07','Pharmacist','2016-07-25 04:27:07','2016-07-25 04:25:33'),(3527628,'John','Janna','John.Janna@mybnb.com',49.23201,-123.20810,'1975-01-12','Pharmacist','2016-07-25 04:27:07','2016-07-25 04:25:33'),(3649315,'Coleen','Loanna','Coleen.Loanna@mybnb.com',45.52362,-73.60807,'1991-03-25','Butcher','2016-07-25 04:27:07','2016-07-25 04:25:33'),(3945222,'Adeline','Ralston','Adeline.Ralston@mybnb.com',45.52014,-73.61552,'1974-09-05','Carpenter','2016-07-25 04:27:07','2016-07-25 04:25:33'),(3962517,'Sami','Loanna','Sami.Loanna@mybnb.com',42.28588,-71.12491,'1966-09-14','Social worker','2016-07-25 04:27:07','2016-07-25 04:25:33'),(4120058,'Noo-Noo','Chimwemwe','Noo-Noo.Chimwemwe@mybnb.com',49.24555,-123.18223,'1975-02-19','Architect','2016-07-25 04:27:07','2016-07-25 04:25:33'),(4653380,'Beth','Ottabviano','Beth.Ottabviano@mybnb.com',42.29152,-71.13186,'1987-05-30','Carpenter','2016-07-25 04:27:07','2016-07-25 04:25:33'),(5162168,'Adam','Margit','Adam.Margit@mybnb.com',45.52100,-73.61349,'1973-06-11','Garden designer','2016-07-25 04:27:07','2016-07-25 04:25:33'),(5164882,'Dagmar','Edur','Dagmar.Edur@mybnb.com',49.25113,-123.18386,'1973-04-11','Artist','2016-07-25 04:27:07','2016-07-25 04:25:33'),(5340640,'Shervin','Margit','Shervin.Margit@mybnb.com',43.74945,-79.50488,'1979-09-08','Telephonist','2016-07-25 04:27:07','2016-07-25 04:25:33'),(5422969,'Julie','Mahli','Julie.Mahli@mybnb.com',49.25517,-123.18549,'1982-11-02','Circus worker','2016-07-25 04:27:07','2016-07-25 04:25:33'),(6336753,'Susan','Murali','Susan.Murali@mybnb.com',49.22760,-123.18995,'1966-05-29','Animal breeder','2016-07-25 04:27:07','2016-07-25 04:25:33'),(6404004,'Serena','Elene','Serena.Elene@mybnb.com',49.25688,-123.17999,'1966-09-09','Animal breeder','2016-07-25 04:27:07','2016-07-25 04:25:33'),(6542094,'Lindsey','Queenie','Lindsey.Queenie@mybnb.com',49.23468,-123.18669,'1995-01-20','Typist','2016-07-25 04:27:07','2016-07-25 04:25:33'),(6570877,'Juliet','Edur','Juliet.Edur@mybnb.com',42.28214,-71.12905,'1966-12-01','Brewer','2016-07-25 04:27:07','2016-07-25 04:25:33'),(7078248,'Paula','Margit','Paula.Margit@mybnb.com',49.24573,-123.18943,'1976-04-14','Salesperson','2016-07-25 04:27:07','2016-07-25 04:25:33'),(7134807,'Michael','Fabricia','Michael.Fabricia@mybnb.com',43.76396,-79.49695,'1993-06-20','Architect','2016-07-25 04:27:07','2016-07-25 04:25:33'),(7155869,'Mahnoush','Zenobios','Mahnoush.Zenobios@mybnb.com',45.51637,-73.59208,'1988-03-20','Salesperson','2016-07-25 04:27:07','2016-07-25 04:25:33'),(7324823,'Mike','Sybille','Mike.Sybille@mybnb.com',49.24078,-123.18380,'1995-03-30','Circus worker','2016-07-25 04:27:07','2016-07-25 04:25:33'),(7465731,'Brian','Mahli','Brian.Mahli@mybnb.com',49.25779,-123.20018,'1985-09-08','Fitness instructor','2016-07-25 04:27:07','2016-07-25 04:25:33'),(7506913,'Maria','Zenobios','Maria.Zenobios@mybnb.com',42.27572,-71.13014,'1978-08-14','Disc jockey','2016-07-25 04:27:07','2016-07-25 04:25:33'),(8323794,'Jean','Joris','Jean.Joris@mybnb.com',45.52252,-73.60902,'1966-01-22','Disc jockey','2016-07-25 04:27:07','2016-07-25 04:25:33'),(8491165,'Jeff','Jorginho','Jeff.Jorginho@mybnb.com',42.28556,-71.12400,'1970-10-18','Architect','2016-07-25 04:27:07','2016-07-25 04:25:33'),(8860332,'Vibhor','Fabricia','Vibhor.Fabricia@mybnb.com',43.76914,-79.50439,'1966-08-06','Pharmacist','2016-07-25 04:27:07','2016-07-25 04:25:33'),(9214271,'Claudine','Ilona','Claudine.Ilona@mybnb.com',49.23617,-123.17896,'1968-04-29','Carpenter','2016-07-25 04:27:07','2016-07-25 04:25:33'),(9658771,'Anthony','Fabricia','Anthony.Fabricia@mybnb.com',42.28626,-71.13707,'1987-10-06','Butcher','2016-07-25 04:27:07','2016-07-25 04:25:33'),(10021116,'Douglas','Murali','Douglas.Murali@mybnb.com',42.28997,-71.13615,'1991-01-21','Carpenter','2016-07-25 04:27:07','2016-07-25 04:25:33'),(10635352,'Jan','Queenie','Jan.Queenie@mybnb.com',43.76761,-79.50310,'1977-08-03','Social worker','2016-07-25 04:27:07','2016-07-25 04:25:33'),(11883405,'Miss','Zenobios','Miss.Zenobios@mybnb.com',49.24239,-123.18399,'1985-04-05','Architect','2016-07-25 04:27:07','2016-07-25 04:25:33'),(12571995,'Sam','Edur','Sam.Edur@mybnb.com',43.75428,-79.50053,'1995-04-03','Carpenter','2016-07-25 04:27:07','2016-07-25 04:25:33'),(13226301,'Mohamed','Goricia','Mohamed.Goricia@mybnb.com',42.27965,-71.13606,'1967-06-21','Garden designer','2016-07-25 04:27:07','2016-07-25 04:25:33'),(13281477,'Milena','Mahli','Milena.Mahli@mybnb.com',45.51902,-73.60851,'1987-02-05','Telephonist','2016-07-25 04:27:07','2016-07-25 04:25:33'),(13682119,'Stephanie','Jorginho','Stephanie.Jorginho@mybnb.com',49.24980,-123.18913,'1979-03-11','Circus worker','2016-07-25 04:27:07','2016-07-25 04:25:33'),(14589681,'Martha','Zenobios','Martha.Zenobios@mybnb.com',43.74786,-79.49367,'1991-09-03','Animal breeder','2016-07-25 04:27:07','2016-07-25 04:25:33'),(15472064,'Herb','Queenie','Herb.Queenie@mybnb.com',42.28885,-71.13128,'1968-01-04','Typist','2016-07-25 04:27:07','2016-07-25 04:25:33'),(15472709,'Milena','Sybille','Milena.Sybille@mybnb.com',45.51278,-73.59735,'1988-06-10','Brewer','2016-07-25 04:27:07','2016-07-25 04:25:33'),(21704315,'Thomas','Loanna','Thomas.Loanna@mybnb.com',49.23330,-123.18021,'1975-05-08','Salesperson','2016-07-25 04:27:07','2016-07-25 04:25:33'),(22760672,'Berna','Mahli','Berna.Mahli@mybnb.com',43.75262,-79.46548,'1981-01-08','Architect','2016-07-25 04:27:07','2016-07-25 04:25:33'),(23904087,'Jonas','Fabricia','Jonas.Fabricia@mybnb.com',45.51655,-73.59726,'1989-02-27','Salesperson','2016-07-25 04:27:07','2016-07-25 04:25:33'),(24345657,'Arkadi','Loanna','Arkadi.Loanna@mybnb.com',43.76597,-79.50259,'1979-10-04','Fitness instructor','2016-07-25 04:27:07','2016-07-25 04:25:33'),(24558497,'Anna','Murali','Anna.Murali@mybnb.com',45.52373,-73.61229,'1978-02-18','Disc jockey','2016-07-25 04:27:07','2016-07-25 04:25:33'),(27751962,'Mariel','Edur','Mariel.Edur@mybnb.com',45.51645,-73.62116,'1991-02-06','Architect','2016-07-25 04:27:07','2016-07-25 04:25:33'),(29335268,'Elizabeth','Ottabviano','Elizabeth.Ottabviano@mybnb.com',49.23120,-123.18664,'1975-03-14','Medical student','2016-07-25 04:27:07','2016-07-25 04:25:33'),(29603052,'Lynda','Sybille','Lynda.Sybille@mybnb.com',49.23283,-123.19596,'1967-02-27','Pharmacist','2016-07-25 04:27:07','2016-07-25 04:25:33'),(30753730,'Jeishan','Elene','Jeishan.Elene@mybnb.com',43.76763,-79.50239,'1973-07-05','Carpenter','2016-07-25 04:27:07','2016-07-25 04:25:33'),(33212966,'Lisa','Janna','Lisa.Janna@mybnb.com',43.76551,-79.49440,'1983-02-09','Pharmacist','2016-07-25 04:27:07','2016-07-25 04:25:33'),(34470961,'Joelle','Jorginho','Joelle.Jorginho@mybnb.com',45.52001,-73.61211,'1995-05-28','Butcher','2016-07-25 04:27:07','2016-07-25 04:25:33'),(34552909,'Barrie','Joris','Barrie.Joris@mybnb.com',42.28280,-71.11515,'1975-05-21','Carpenter','2016-07-25 04:27:07','2016-07-25 04:25:33'),(36141263,'Ashley','Ottabviano','Ashley.Ottabviano@mybnb.com',49.25596,-123.18075,'1973-01-17','Social worker','2016-07-25 04:27:07','2016-07-25 04:25:33'),(37193227,'Josie','Goricia','Josie.Goricia@mybnb.com',43.76664,-79.49926,'1981-07-16','Architect','2016-07-25 04:27:07','2016-07-25 04:25:33'),(37253135,'Luc','Edur','Luc.Edur@mybnb.com',45.52344,-73.60911,'1967-10-02','Carpenter','2016-07-25 04:27:07','2016-07-25 04:25:33'),(37844039,'Nishka','Ilona','Nishka.Ilona@mybnb.com',43.76810,-79.50349,'1970-09-21','Carpenter','2016-07-25 04:27:07','2016-07-25 04:25:33'),(38573316,'Joan','Ralston','Joan.Ralston@mybnb.com',49.24597,-123.17528,'1976-08-23','Pharmacist','2016-07-25 04:27:07','2016-07-25 04:25:33'),(38855266,'Aude','Queenie','Aude.Queenie@mybnb.com',45.52130,-73.60832,'1973-08-15','Butcher','2016-07-25 04:27:07','2016-07-25 04:25:33'),(44625108,'Jessica','Queenie','Jessica.Queenie@mybnb.com',42.27493,-71.13063,'1991-06-21','Carpenter','2016-07-25 04:27:07','2016-07-25 04:25:33'),(46037158,'Lidia','Fabricia','Lidia.Fabricia@mybnb.com',49.24257,-123.17746,'1989-07-22','Social worker','2016-07-25 04:27:07','2016-07-25 04:25:33'),(52992470,'Soraya','Ilona','Soraya.Ilona@mybnb.com',45.51536,-73.61821,'1977-04-16','Architect','2016-07-25 04:27:07','2016-07-25 04:25:33');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mybnb'
--

--
-- Dumping routines for database 'mybnb'
--

--
-- Final view structure for view `available_listings`
--

/*!50001 DROP VIEW IF EXISTS `available_listings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `available_listings` AS (select `l`.`listingID` AS `listingID`,`l`.`title` AS `title`,`l`.`description` AS `description`,`l`.`max_guests` AS `max_guests`,`l`.`is_available` AS `is_available`,`l`.`created_on` AS `created_on`,`l`.`hostID` AS `hostID`,`l`.`list_type` AS `list_type`,`l`.`num_beds` AS `num_beds`,`l`.`num_bedrooms` AS `num_bedrooms`,`l`.`num_bathrooms` AS `num_bathrooms`,`l`.`average_listing_rating` AS `average_listing_rating`,`l`.`unit_number` AS `unit_number`,`l`.`latitude` AS `latitude`,`l`.`longitude` AS `longitude`,`l`.`country` AS `country`,`l`.`province` AS `province`,`l`.`city` AS `city`,`l`.`street_address` AS `street_address`,`l`.`postal_code` AS `postal_code`,`l`.`average_price` AS `average_price`,`l`.`num_amenities` AS `num_amenities` from `listing_information` `l` where ((`l`.`is_available` = TRUE) and exists(select `a`.`availabilityID` from `availability` `a` where ((`a`.`is_available` = TRUE) and (`l`.`listingID` = `a`.`listingID`))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `booking_information`
--

/*!50001 DROP VIEW IF EXISTS `booking_information`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `booking_information` AS (select `a`.`availabilityID` AS `availabilityID`,`b`.`starts` AS `starts`,`b`.`ends` AS `ends`,`b`.`status` AS `status`,`a`.`rent_type` AS `rent_type`,`b`.`num_guests` AS `num_guests`,(`a`.`daily_price` * ((to_days(`b`.`ends`) - to_days(`b`.`starts`)) + 1)) AS `total_price`,`a`.`guests` AS `guests`,`b`.`renterID` AS `renterID`,`b`.`bookingID` AS `bookingID`,`b`.`updated_on` AS `booking_time`,`c`.`card_number` AS `card_number`,`c`.`card_type` AS `card_type`,`c`.`expiry_date` AS `expiry_date`,`l`.`listingID` AS `listingID`,`l`.`title` AS `title`,`l`.`description` AS `description`,`l`.`max_guests` AS `max_guests`,`l`.`is_available` AS `is_available`,`l`.`created_on` AS `created_on`,`l`.`hostID` AS `hostID`,`l`.`list_type` AS `list_type`,`l`.`num_beds` AS `num_beds`,`l`.`num_bedrooms` AS `num_bedrooms`,`l`.`num_bathrooms` AS `num_bathrooms`,`l`.`average_listing_rating` AS `average_listing_rating`,`l`.`unit_number` AS `unit_number`,`l`.`latitude` AS `latitude`,`l`.`longitude` AS `longitude`,`l`.`country` AS `country`,`l`.`province` AS `province`,`l`.`city` AS `city`,`l`.`street_address` AS `street_address`,`l`.`postal_code` AS `postal_code`,`l`.`average_price` AS `average_price`,`l`.`num_amenities` AS `num_amenities`,`u`.`sin_id` AS `sin_id`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,`u`.`email` AS `email`,`u`.`birth_date` AS `birth_date`,`u`.`occupation` AS `occupation`,`u`.`average_user_rating` AS `average_user_rating`,`a`.`starts_on` AS `starts_on`,`a`.`ends_on` AS `ends_on` from ((((`bookings` `b` left join `availability` `a` on((`b`.`availabilityID` = `a`.`availabilityID`))) left join `listing_information` `l` on((`a`.`listingID` = `l`.`listingID`))) left join `renter_payments` `c` on((`b`.`card_number` = `c`.`card_number`))) left join `user_information` `u` on((`b`.`renterID` = `u`.`sin_id`))) where ((`l`.`is_available` = TRUE) and (`a`.`is_available` = TRUE))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cancellations_per_host`
--

/*!50001 DROP VIEW IF EXISTS `cancellations_per_host`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cancellations_per_host` AS (select `c`.`hostID` AS `hostID`,count(0) AS `num_cancellations` from `booking_information` `c` where ((`c`.`booking_time` >= (curdate() + interval -(1) year)) and (`c`.`status` = 'Canceled by Host')) group by `c`.`hostID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `cancellations_per_renter`
--

/*!50001 DROP VIEW IF EXISTS `cancellations_per_renter`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cancellations_per_renter` AS (select `c`.`renterID` AS `renterID`,count(0) AS `num_cancellations` from `booking_information` `c` where ((`c`.`booking_time` >= (curdate() + interval -(1) year)) and ((`c`.`status` = 'Canceled by Renter') or (`c`.`status` = 'Canceled by Host'))) group by `c`.`renterID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `host_market_share`
--

/*!50001 DROP VIEW IF EXISTS `host_market_share`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `host_market_share` AS (select `h`.`hostID` AS `hostID`,`h`.`country` AS `country`,`h`.`province` AS `province`,`h`.`city` AS `city`,((`h`.`num_listings` / `c`.`num_listings`) * 100) AS `market_share` from (`listings_per_host_in_city` `h` left join `listings_per_city` `c` on(((`c`.`city` = `h`.`city`) and (`c`.`province` = `h`.`province`) and (`c`.`country` = `h`.`country`))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listing_information`
--

/*!50001 DROP VIEW IF EXISTS `listing_information`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listing_information` AS (select `l`.`listingID` AS `listingID`,`l`.`title` AS `title`,`l`.`description` AS `description`,`l`.`max_guests` AS `max_guests`,`l`.`is_available` AS `is_available`,`l`.`created_on` AS `created_on`,`l`.`hostID` AS `hostID`,`l`.`list_type` AS `list_type`,`l`.`num_beds` AS `num_beds`,`l`.`num_bedrooms` AS `num_bedrooms`,`l`.`num_bathrooms` AS `num_bathrooms`,avg(`r`.`rating`) AS `average_listing_rating`,`l`.`unit_number` AS `unit_number`,`a`.`latitude` AS `latitude`,`a`.`longitude` AS `longitude`,`a`.`country` AS `country`,`a`.`province` AS `province`,`a`.`city` AS `city`,`a`.`street_address` AS `street_address`,`a`.`postal_code` AS `postal_code`,avg(`av`.`daily_price`) AS `average_price`,count(`am`.`amenity`) AS `num_amenities` from ((((`listings` `l` left join `address` `a` on(((`l`.`latitude` = `a`.`latitude`) and (`l`.`longitude` = `a`.`longitude`)))) left join `listing_ratings` `r` on((`l`.`listingID` = `r`.`listingID`))) left join `availability` `av` on((`l`.`listingID` = `av`.`listingID`))) left join `amenities` `am` on((`l`.`listingID` = `am`.`listingID`))) group by `l`.`listingID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listings_per_city`
--

/*!50001 DROP VIEW IF EXISTS `listings_per_city`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listings_per_city` AS (select `a`.`country` AS `country`,`a`.`province` AS `province`,`a`.`city` AS `city`,count(`l`.`listingID`) AS `num_listings` from (`address` `a` left join `listings` `l` on(((`a`.`latitude` = `l`.`latitude`) and (`a`.`longitude` = `l`.`longitude`)))) where (`l`.`is_available` = TRUE) group by `a`.`country`,`a`.`province`,`a`.`city`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listings_per_country`
--

/*!50001 DROP VIEW IF EXISTS `listings_per_country`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listings_per_country` AS (select `a`.`country` AS `country`,count(`l`.`listingID`) AS `num_listings` from (`address` `a` left join `listings` `l` on(((`a`.`latitude` = `l`.`latitude`) and (`a`.`longitude` = `l`.`longitude`)))) where (`l`.`is_available` = TRUE) group by `a`.`country`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listings_per_host_in_city`
--

/*!50001 DROP VIEW IF EXISTS `listings_per_host_in_city`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listings_per_host_in_city` AS (select `u`.`sin_id` AS `hostID`,`a`.`country` AS `country`,`a`.`province` AS `province`,`a`.`city` AS `city`,count(`l`.`listingID`) AS `num_listings` from ((`users` `u` left join `listings` `l` on((`l`.`hostID` = `u`.`sin_id`))) left join `address` `a` on(((`l`.`latitude` = `a`.`latitude`) and (`l`.`longitude` = `a`.`longitude`)))) where (`l`.`is_available` = TRUE) group by `u`.`sin_id`,`a`.`country`,`a`.`province`,`a`.`city`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listings_per_host_in_country`
--

/*!50001 DROP VIEW IF EXISTS `listings_per_host_in_country`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listings_per_host_in_country` AS (select `u`.`sin_id` AS `hostID`,`a`.`country` AS `country`,count(`l`.`listingID`) AS `num_listings` from ((`users` `u` left join `listings` `l` on((`l`.`hostID` = `u`.`sin_id`))) left join `address` `a` on(((`l`.`latitude` = `a`.`latitude`) and (`l`.`longitude` = `a`.`longitude`)))) where (`l`.`is_available` = TRUE) group by `u`.`sin_id`,`a`.`country`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listings_per_postal_code`
--

/*!50001 DROP VIEW IF EXISTS `listings_per_postal_code`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listings_per_postal_code` AS (select `a`.`country` AS `country`,`a`.`city` AS `city`,`a`.`postal_code` AS `postal_code`,count(`l`.`listingID`) AS `num_listings` from (`address` `a` left join `listings` `l` on(((`a`.`latitude` = `l`.`latitude`) and (`a`.`longitude` = `l`.`longitude`)))) where (`l`.`is_available` = TRUE) group by `a`.`country`,`a`.`city`,`a`.`postal_code`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `previously_booked`
--

/*!50001 DROP VIEW IF EXISTS `previously_booked`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `previously_booked` AS (select `l`.`listingID` AS `listingID`,`l`.`title` AS `title`,`l`.`description` AS `description`,`l`.`max_guests` AS `max_guests`,`l`.`is_available` AS `is_available`,`l`.`created_on` AS `created_on`,`l`.`hostID` AS `hostID`,`l`.`list_type` AS `list_type`,`l`.`num_beds` AS `num_beds`,`l`.`num_bedrooms` AS `num_bedrooms`,`l`.`num_bathrooms` AS `num_bathrooms`,`l`.`average_listing_rating` AS `average_listing_rating`,`l`.`unit_number` AS `unit_number`,`l`.`latitude` AS `latitude`,`l`.`longitude` AS `longitude`,`l`.`country` AS `country`,`l`.`province` AS `province`,`l`.`city` AS `city`,`l`.`street_address` AS `street_address`,`l`.`postal_code` AS `postal_code`,`l`.`average_price` AS `average_price`,`l`.`num_amenities` AS `num_amenities` from `listing_information` `l` where exists(select `b`.`renterID` from (`bookings` `b` left join `availability` `a` on((`b`.`availabilityID` = `a`.`availabilityID`))) where ((`a`.`listingID` = `l`.`listingID`) and (`b`.`status` = 'Available')))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `price_per_amenity_in_location`
--

/*!50001 DROP VIEW IF EXISTS `price_per_amenity_in_location`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `price_per_amenity_in_location` AS (select `a`.`amenity` AS `amenity`,`l`.`country` AS `country`,`l`.`province` AS `province`,`l`.`city` AS `city`,avg(`l`.`average_price`) AS `average_price` from (`amenities` `a` join `previously_booked` `l` on((`a`.`listingID` = `l`.`listingID`))) group by `a`.`amenity`,`l`.`country`,`l`.`province`,`l`.`city`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `price_per_essential_in_location`
--

/*!50001 DROP VIEW IF EXISTS `price_per_essential_in_location`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `price_per_essential_in_location` AS (select `l`.`country` AS `country`,`l`.`province` AS `province`,`l`.`city` AS `city`,avg(`l`.`average_price`) AS `average_price`,avg(`l`.`num_beds`) AS `average_beds`,avg(`l`.`num_bedrooms`) AS `average_bedrooms`,avg(`l`.`num_bathrooms`) AS `average_bathrooms`,avg(`l`.`num_amenities`) AS `average_amenities`,avg(`l`.`max_guests`) AS `average_guests`,avg((`l`.`average_price` / `l`.`num_beds`)) AS `bed_price`,avg((`l`.`average_price` / `l`.`num_bedrooms`)) AS `bedroom_price`,avg((`l`.`average_price` / `l`.`num_bathrooms`)) AS `bathroom_price`,avg((`l`.`average_price` / `l`.`num_amenities`)) AS `amenity_price`,avg((`l`.`average_price` / `l`.`max_guests`)) AS `guest_price` from `previously_booked` `l` group by `l`.`country`,`l`.`province`,`l`.`city`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `unbooked_availabilities`
--

/*!50001 DROP VIEW IF EXISTS `unbooked_availabilities`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `unbooked_availabilities` AS (select `l`.`listingID` AS `listingID`,`l`.`title` AS `title`,`l`.`description` AS `description`,`l`.`max_guests` AS `max_guests`,`l`.`is_available` AS `is_available`,`l`.`created_on` AS `created_on`,`l`.`hostID` AS `hostID`,`l`.`list_type` AS `list_type`,`l`.`num_beds` AS `num_beds`,`l`.`num_bedrooms` AS `num_bedrooms`,`l`.`num_bathrooms` AS `num_bathrooms`,`l`.`average_listing_rating` AS `average_listing_rating`,`l`.`unit_number` AS `unit_number`,`l`.`latitude` AS `latitude`,`l`.`longitude` AS `longitude`,`l`.`country` AS `country`,`l`.`province` AS `province`,`l`.`city` AS `city`,`l`.`street_address` AS `street_address`,`l`.`postal_code` AS `postal_code`,`l`.`average_price` AS `average_price`,`l`.`num_amenities` AS `num_amenities`,`a`.`starts_on` AS `starts_on`,`a`.`ends_on` AS `ends_on`,`a`.`rent_type` AS `rent_type`,`a`.`daily_price` AS `daily_price`,`a`.`guests` AS `guests`,`a`.`availabilityID` AS `availabilityID` from (`availability` `a` left join `listing_information` `l` on((`a`.`listingID` = `l`.`listingID`))) where ((`l`.`is_available` = TRUE) and (`a`.`is_available` = TRUE))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_information`
--

/*!50001 DROP VIEW IF EXISTS `user_information`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `user_information` AS (select `u`.`sin_id` AS `sin_id`,`u`.`first_name` AS `first_name`,`u`.`last_name` AS `last_name`,`u`.`email` AS `email`,`u`.`birth_date` AS `birth_date`,`u`.`occupation` AS `occupation`,`u`.`registered_on` AS `registered_on`,(to_days(now()) - to_days(`u`.`login_on`)) AS `last_login`,`a`.`latitude` AS `latitude`,`a`.`longitude` AS `longitude`,`a`.`country` AS `country`,`a`.`province` AS `province`,`a`.`city` AS `city`,`a`.`street_address` AS `street_address`,`a`.`postal_code` AS `postal_code`,avg(`p`.`rating`) AS `average_user_rating` from ((`users` `u` left join `address` `a` on(((`u`.`latitude` = `a`.`latitude`) and (`u`.`longitude` = `a`.`longitude`)))) left join `profile_ratings` `p` on((`p`.`userID` = `u`.`sin_id`))) group by `u`.`sin_id`) */;
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

-- Dump completed on 2016-07-25 18:03:54
