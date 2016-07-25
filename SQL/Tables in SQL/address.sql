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
  UNIQUE KEY `country` (`country`,`province`,`city`,`street_address`,`postal_code`),
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
INSERT INTO `address` VALUES (49.25688,-123.17999,'Canada','British Colombia','Vancouver','Blenheim Street, Vancouver, BC V6L 2X8, Canada','V6L 2X8'),(49.23617,-123.17896,'Canada','British Colombia','Vancouver','Blenheim Street, Vancouver, BC V6N 1P5, Canada','V6N 1P5'),(49.23468,-123.18669,'Canada','British Colombia','Vancouver','Dunbar Street, Vancouver, BC V6N 1W5, Canada','V6N 1W5'),(49.23120,-123.18664,'Canada','British Colombia','Vancouver','Dunbar Street, Vancouver, BC V6N 1X3, Canada','V6N 1X3'),(49.24281,-123.18437,'Canada','British Colombia','Vancouver','Dunbar Street, Vancouver, BC V6S 2H2, Canada','V6S 2H2'),(49.24239,-123.18399,'Canada','British Colombia','Vancouver','Dunbar Street, Vancouver, BC V6S 2H3, Canada','V6S 2H3'),(49.25517,-123.18549,'Canada','British Colombia','Vancouver','Dunbar Street, Vancouver, BC V6S, Canada','V6S 1C3'),(49.23283,-123.19596,'Canada','British Colombia','Vancouver','Salish Drive, Vancouver, BC V6N, Canada','V6N 1P6'),(49.23201,-123.20810,'Canada','British Colombia','Vancouver','Sennok Crescent, Vancouver, BC V6N 2E3, Canada','V6N 2E3'),(49.25779,-123.20018,'Canada','British Colombia','Vancouver','West 15th Avenue, Vancouver, BC V6R 3A6, Canada','V6R 3A6'),(49.25436,-123.18818,'Canada','British Colombia','Vancouver','West 19th Avenue, Vancouver, BC V6S 1C8, Canada','V6S 1C8'),(49.25596,-123.18075,'Canada','British Colombia','Vancouver','West 20th Avenue, Vancouver, BC V6S 1E5, Canada','V6S 1E5'),(49.24980,-123.18913,'Canada','British Colombia','Vancouver','West 26th Avenue, Vancouver, BC V6S 1P1, Canada','V6S 1P1'),(49.24597,-123.17528,'Canada','British Colombia','Vancouver','West 28th Avenue, Vancouver, BC V6L 1X5, Canada','V6L 1X5'),(49.24573,-123.18943,'Canada','British Colombia','Vancouver','West 29th Avenue, Vancouver, BC V6S 1T6, Canada','V6S 1T6'),(49.24555,-123.18223,'Canada','British Colombia','Vancouver','West 30th Avenue, Vancouver, BC V6S 1W3, Canada','V6S 1W3'),(49.24257,-123.17746,'Canada','British Colombia','Vancouver','West 32nd Avenue, Vancouver, BC V6L 2C3, Canada','V6L 2C3'),(49.24167,-123.17028,'Canada','British Colombia','Vancouver','West 34th Avenue, Vancouver, BC V6N 2J7, Canada','V6N 2J7'),(49.24078,-123.18380,'Canada','British Colombia','Vancouver','West 34th Avenue, Vancouver, BC V6N 2K8, Canada','V6N 2K8'),(49.23900,-123.18096,'Canada','British Colombia','Vancouver','West 37th Avenue, Vancouver, BC V6N 2V6, Canada','V6N 2V6'),(49.23330,-123.18021,'Canada','British Colombia','Vancouver','West 44th Avenue, Vancouver, BC V6N 3K8, Canada','V6N 3K8'),(49.25113,-123.18386,'Canada','British Colombia','Vancouver','West King Edward Avenue, Vancouver, BC V6S 1M4, Canada','V6S 1M4'),(49.22760,-123.18995,'Canada','British Columbia','Vancouver','W 50th Ave, Vancouver, British Columbia V6N 3V4, Canada','V6N 3V4'),(43.76761,-79.50310,'Canada','Ontario','Toronto','Assiniboine Road, Toronto, ON M3J 1L4, Canada','M3J 1L4'),(43.74786,-79.49367,'Canada','Ontario','Toronto','Benjamin Boake Trail, Toronto, ON M3J 3b3, Canada','M3J 3b3'),(43.76664,-79.49926,'Canada','Ontario','Toronto','Bowsfield Rd, Toronto, ON M3J 3R3, Canada','M3J 3R3'),(43.75428,-79.50053,'Canada','Ontario','Toronto','Candlewood Crescent, Toronto, ON M3J 1G8, Canada','M3J 1G8'),(43.76733,-79.49898,'Canada','Ontario','Toronto','Cook Rd, Toronto, Ontario M3J 3T1, Canada','M3J 3T1'),(43.76804,-79.50013,'Canada','Ontario','Toronto','Cook Road, Toronto, ON M3J 3T1, Canada','M3J 3T1'),(43.75262,-79.46548,'Canada','Ontario','Toronto','De Boers Drive, Toronto, ON M3J 3E5, Canada','M3J 3E5'),(43.76396,-79.49695,'Canada','Ontario','Toronto','Four Winds Drive, Toronto, ON M3J 1K8, Canada','M3J 1K8'),(43.76551,-79.49440,'Canada','Ontario','Toronto','Four Winds Drive, Toronto, ON M3J 2S8, Canada','M3J 2S8'),(43.74945,-79.50488,'Canada','Ontario','Toronto','Grandravine Drive, Toronto, ON M3N 1J2, Canada','M3N 1J2'),(43.76763,-79.50239,'Canada','Ontario','Toronto','Sentinel Rd, Toronto, ON M3J 0B2, Canada','M3J 0B2'),(43.76597,-79.50259,'Canada','Ontario','Toronto','Sentinel Road, Toronto, ON M3J 3R9, Canada','M3J 3R9'),(43.76810,-79.50349,'Canada','Ontario','Toronto','Troyer Ave, Toronto, Ontario M3J 0A3, Canada','M3J 0A3'),(43.76914,-79.50439,'Canada','Ontario','Toronto','York University, 340 Assiniboine Road, Toronto, ON M3J 1L2, Canada','M3J 1L2'),(45.52252,-73.60902,'Canada','Quebec','Montreal','A Avenue Bloomfield, Montreal, Quebec H2V 3S4, Canada','H2V 3S4'),(45.51536,-73.61821,'Canada','Quebec','Montreal','Antonine Maillet Avenue, Montreal, Quebec H2V 2Y6, Canada','H2V 2Y6'),(45.52016,-73.60120,'Canada','Quebec','Montreal','Av du Parc, Montreal, Quebec H2V 4G8, Canada','H2V 4G8'),(45.52130,-73.60832,'Canada','Quebec','Montreal','Avenue Champagneur, Montreal, Quebec H2V 3P7, Canada','H2V 3P7'),(45.52100,-73.61349,'Canada','Quebec','Montreal','Avenue Champagneur, Montreal, Quebec H2V 3P8, Canada','H2V 3P8'),(45.52344,-73.60911,'Canada','Quebec','Montreal','Avenue de l\'Épée, Montreal, QC H2V 3T9, Canada','H2V 3T9'),(45.52362,-73.60807,'Canada','Quebec','Montreal','Avenue du Parc, Montreal, Quebec H2V 4H4, Canada','H2V 4H4'),(45.51655,-73.59726,'Canada','Quebec','Montreal','Avenue Édouard Charles, Montreal, Quebec H2V, Canada','H2V 3H3'),(45.51645,-73.62116,'Canada','Quebec','Montreal','Avenue Hartland, Montreal, Quebec H2V 2X9, Canada','H2V 2X9'),(45.52001,-73.61211,'Canada','Quebec','Montreal','Avenue Joyce, Montreal, Quebec H2V 1S7, Canada','H2V 1S7'),(45.51866,-73.61271,'Canada','Quebec','Montreal','Avenue Lajoie, Montreal, Quebec H2V, Canada','H2V 8U1'),(45.52076,-73.61281,'Canada','Quebec','Montreal','Avenue Outremont, Montreal, QC, Canada','H2V 3S3'),(45.52373,-73.61229,'Canada','Quebec','Montreal','Avenue Van Horne, Montreal, QC H2V 1J7, Canada','H2V 1J7'),(45.52014,-73.61552,'Canada','Quebec','Montreal','Avenue Wiseman, Montreal, QC H2V 1E8, Canada','H2V 1E8'),(45.51902,-73.60851,'Canada','Quebec','Montreal','Bernard Avenue, Montreal, Quebec H2V 1V8, Canada','H2V 1V8'),(45.51278,-73.59735,'Canada','Quebec','Montreal','Casgrain Avenue, Montreal, QC H2T 1W8, Canada','H2T 1W8'),(45.51637,-73.59208,'Canada','Quebec','Montreal','Chemin de la Côte-Sainte-Catherine, Montreal, Quebec H2V, Canada','H2V 9C4'),(45.52014,-73.61295,'Canada','Quebec','Outremont','Avenue Champagneur, Outremont, QC H2V 1P1, Canada','H2V 1P1'),(45.51719,-73.61799,'Canada','Quebec','Outremont','Avenue Davaar, Outremont, QC H2V 1G4, Canada','H2V 1G4'),(45.51822,-73.59651,'Canada','Quebec','Outremont','Avenue Laurier Ouest, Outremont, QC H2V 2K8, Canada','H2V 2K8'),(42.29244,-71.13577,'United States','Massachusetts','Boston','Ardale St, Boston, MA 02131, United States','2357'),(42.28145,-71.12925,'United States','Massachusetts','Boston','Augustus Ave, Boston, MA 02131, United States','2926'),(42.27493,-71.13063,'United States','Massachusetts','Boston','Beech Street, Boston, MA 02131, United States','2568'),(42.28280,-71.11515,'United States','Massachusetts','Boston','Brook St, Boston, MA 02131, United States','2453'),(42.27965,-71.13606,'United States','Massachusetts','Boston','Cedrus Avenue, Boston, MA 02131, United States','2221'),(42.28028,-71.13587,'United States','Massachusetts','Boston','Cedrus Avenue, Boston, MA 02131, United States','2547'),(42.28175,-71.14032,'United States','Massachusetts','Boston','Cornell Street, Boston, MA 02131, United States','2639'),(42.27441,-71.12529,'United States','Massachusetts','Boston','Doncaster Street, Boston, MA 02131, United States','2771'),(42.28209,-71.13335,'United States','Massachusetts','Boston','Durnell Avenue, Boston, MA 02131, United States','2549'),(42.28885,-71.13128,'United States','Massachusetts','Boston','Fairview Street, Boston, MA 02131, United States','2333'),(42.28997,-71.13615,'United States','Massachusetts','Boston','Fletcher Street, Boston, MA 02131, United States','2373'),(42.28624,-71.13437,'United States','Massachusetts','Boston','Pinehurst Street, Boston, MA 02131, United States','2858'),(42.28626,-71.13707,'United States','Massachusetts','Boston','Tyndale Street, Boston, MA 02131, United States','2268'),(42.29353,-71.12071,'United States','Massachusetts','Boston','Washington Street, Boston, MA 02131, United States','2131'),(42.29152,-71.13186,'United States','Massachusetts','Roslindale','Ashfield Street, Roslindale, MA 02131, United States','2586'),(42.27572,-71.13014,'United States','Massachusetts','Roslindale','Glendower Road, Roslindale, MA 02131, United States','2599'),(42.28556,-71.12400,'United States','Massachusetts','Roslindale','Hyde Park Avenue, Roslindale, MA 02131, United States','2536'),(42.28588,-71.12491,'United States','Massachusetts','Roslindale','Sycamore St, Roslindale, MA 02131, United States','2860'),(42.28214,-71.12905,'United States','Massachusetts','Roslindale, Boston','Kittredge St, Roslindale, Boston, MA 02131, United States','2727');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-24 23:14:34
