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
INSERT INTO `users` VALUES (16701,'Phil','Elene','Phil.Elene@mybnb.com',42.29244,-71.13577,'1977-07-31','Garden designer'),(19916,'Cathy','Loanna','Cathy.Loanna@mybnb.com',49.23900,-123.18096,'1972-11-16','Artist'),(110792,'Philipp','Chimwemwe','Philipp.Chimwemwe@mybnb.com',45.51866,-73.61271,'1983-12-30','Telephonist'),(431385,'Cynthia','Fabricia','Cynthia.Fabricia@mybnb.com',42.27441,-71.12529,'1966-02-10','Animal breeder'),(702188,'Ramona','Queenie','Ramona.Queenie@mybnb.com',49.25436,-123.18818,'1995-03-20','Animal breeder'),(734359,'Nicole','Sybille','Nicole.Sybille@mybnb.com',45.51719,-73.61799,'1994-05-03','Typist'),(1264979,'Ida','Ottabviano','Ida.Ottabviano@mybnb.com',45.52016,-73.60120,'1984-12-30','Salesperson'),(1480518,'Lisa','Edur','Lisa.Edur@mybnb.com',42.29353,-71.12071,'1968-02-08','Architect'),(1890533,'Nadia','Loanna','Nadia.Loanna@mybnb.com',45.52076,-73.61281,'1972-01-24','Circus worker'),(2001148,'Barbara','Goricia','Barbara.Goricia@mybnb.com',49.24167,-123.17028,'1985-11-16','Fitness instructor'),(2572247,'Andrea','Chimwemwe','Andrea.Chimwemwe@mybnb.com',42.28624,-71.13437,'1994-11-03','Disc jockey'),(2619674,'Maude','Elene','Maude.Elene@mybnb.com',45.51822,-73.59651,'1967-06-22','Architect'),(2673521,'Rémi','Mahli','Rémi.Mahli@mybnb.com',45.52014,-73.61295,'1989-05-16','Medical student'),(3164508,'Marilyn','Ralston','Marilyn.Ralston@mybnb.com',42.28175,-71.14032,'1989-08-07','Pharmacist'),(3527628,'John','Janna','John.Janna@mybnb.com',49.23201,-123.20810,'1975-01-12','Pharmacist'),(3649315,'Coleen','Loanna','Coleen.Loanna@mybnb.com',45.52362,-73.60807,'1991-03-25','Butcher'),(3945222,'Adeline','Ralston','Adeline.Ralston@mybnb.com',45.52014,-73.61552,'1974-09-05','Carpenter'),(3962517,'Sami','Loanna','Sami.Loanna@mybnb.com',42.28588,-71.12491,'1966-09-14','Social worker'),(4120058,'Noo-Noo','Chimwemwe','Noo-Noo.Chimwemwe@mybnb.com',49.24555,-123.18223,'1975-02-19','Architect'),(4653380,'Beth','Ottabviano','Beth.Ottabviano@mybnb.com',42.29152,-71.13186,'1987-05-30','Carpenter'),(5162168,'Adam','Margit','Adam.Margit@mybnb.com',45.52100,-73.61349,'1973-06-11','Garden designer'),(5164882,'Dagmar','Edur','Dagmar.Edur@mybnb.com',49.25113,-123.18386,'1973-04-11','Artist'),(5340640,'Shervin','Margit','Shervin.Margit@mybnb.com',43.74945,-79.50488,'1979-09-08','Telephonist'),(5422969,'Julie','Mahli','Julie.Mahli@mybnb.com',49.25517,-123.18549,'1982-11-02','Circus worker'),(6336753,'Susan','Murali','Susan.Murali@mybnb.com',49.22760,-123.18995,'1966-05-29','Animal breeder'),(6404004,'Serena','Elene','Serena.Elene@mybnb.com',49.25688,-123.17999,'1966-09-09','Animal breeder'),(6542094,'Lindsey','Queenie','Lindsey.Queenie@mybnb.com',49.23468,-123.18669,'1995-01-20','Typist'),(6570877,'Juliet','Edur','Juliet.Edur@mybnb.com',42.28214,-71.12905,'1966-12-01','Brewer'),(7078248,'Paula','Margit','Paula.Margit@mybnb.com',49.24573,-123.18943,'1976-04-14','Salesperson'),(7134807,'Michael','Fabricia','Michael.Fabricia@mybnb.com',43.76396,-79.49695,'1993-06-20','Architect'),(7155869,'Mahnoush','Zenobios','Mahnoush.Zenobios@mybnb.com',45.51637,-73.59208,'1988-03-20','Salesperson'),(7324823,'Mike','Sybille','Mike.Sybille@mybnb.com',49.24078,-123.18380,'1995-03-30','Circus worker'),(7465731,'Brian','Mahli','Brian.Mahli@mybnb.com',49.25779,-123.20018,'1985-09-08','Fitness instructor'),(7506913,'Maria','Zenobios','Maria.Zenobios@mybnb.com',42.27572,-71.13014,'1978-08-14','Disc jockey'),(8323794,'Jean','Joris','Jean.Joris@mybnb.com',45.52252,-73.60902,'1966-01-22','Disc jockey'),(8491165,'Jeff','Jorginho','Jeff.Jorginho@mybnb.com',42.28556,-71.12400,'1970-10-18','Architect'),(8860332,'Vibhor','Fabricia','Vibhor.Fabricia@mybnb.com',43.76914,-79.50439,'1966-08-06','Pharmacist'),(9214271,'Claudine','Ilona','Claudine.Ilona@mybnb.com',49.23617,-123.17896,'1968-04-29','Carpenter'),(9658771,'Anthony','Fabricia','Anthony.Fabricia@mybnb.com',42.28626,-71.13707,'1987-10-06','Butcher'),(10021116,'Douglas','Murali','Douglas.Murali@mybnb.com',42.28997,-71.13615,'1991-01-21','Carpenter'),(10635352,'Jan','Queenie','Jan.Queenie@mybnb.com',43.76761,-79.50310,'1977-08-03','Social worker'),(11883405,'Miss','Zenobios','Miss.Zenobios@mybnb.com',49.24239,-123.18399,'1985-04-05','Architect'),(12571995,'Sam','Edur','Sam.Edur@mybnb.com',43.75428,-79.50053,'1995-04-03','Carpenter'),(13226301,'Mohamed','Goricia','Mohamed.Goricia@mybnb.com',42.27965,-71.13606,'1967-06-21','Garden designer'),(13281477,'Milena','Mahli','Milena.Mahli@mybnb.com',45.51902,-73.60851,'1987-02-05','Telephonist'),(13682119,'Stephanie','Jorginho','Stephanie.Jorginho@mybnb.com',49.24980,-123.18913,'1979-03-11','Circus worker'),(14589681,'Martha','Zenobios','Martha.Zenobios@mybnb.com',43.74786,-79.49367,'1991-09-03','Animal breeder'),(15472064,'Herb','Queenie','Herb.Queenie@mybnb.com',42.28885,-71.13128,'1968-01-04','Typist'),(15472709,'Milena','Sybille','Milena.Sybille@mybnb.com',45.51278,-73.59735,'1988-06-10','Brewer'),(21704315,'Thomas','Loanna','Thomas.Loanna@mybnb.com',49.23330,-123.18021,'1975-05-08','Salesperson'),(22760672,'Berna','Mahli','Berna.Mahli@mybnb.com',43.75262,-79.46548,'1981-01-08','Architect'),(23904087,'Jonas','Fabricia','Jonas.Fabricia@mybnb.com',45.51655,-73.59726,'1989-02-27','Salesperson'),(24345657,'Arkadi','Loanna','Arkadi.Loanna@mybnb.com',43.76597,-79.50259,'1979-10-04','Fitness instructor'),(24558497,'Anna','Murali','Anna.Murali@mybnb.com',45.52373,-73.61229,'1978-02-18','Disc jockey'),(27751962,'Mariel','Edur','Mariel.Edur@mybnb.com',45.51645,-73.62116,'1991-02-06','Architect'),(29335268,'Elizabeth','Ottabviano','Elizabeth.Ottabviano@mybnb.com',49.23120,-123.18664,'1975-03-14','Medical student'),(29603052,'Lynda','Sybille','Lynda.Sybille@mybnb.com',49.23283,-123.19596,'1967-02-27','Pharmacist'),(30753730,'Jeishan','Elene','Jeishan.Elene@mybnb.com',43.76763,-79.50239,'1973-07-05','Carpenter'),(33212966,'Lisa','Janna','Lisa.Janna@mybnb.com',43.76551,-79.49440,'1983-02-09','Pharmacist'),(34470961,'Joelle','Jorginho','Joelle.Jorginho@mybnb.com',45.52001,-73.61211,'1995-05-28','Butcher'),(34552909,'Barrie','Joris','Barrie.Joris@mybnb.com',42.28280,-71.11515,'1975-05-21','Carpenter'),(36141263,'Ashley','Ottabviano','Ashley.Ottabviano@mybnb.com',49.25596,-123.18075,'1973-01-17','Social worker'),(37193227,'Josie','Goricia','Josie.Goricia@mybnb.com',43.76664,-79.49926,'1981-07-16','Architect'),(37253135,'Luc','Edur','Luc.Edur@mybnb.com',45.52344,-73.60911,'1967-10-02','Carpenter'),(37844039,'Nishka','Ilona','Nishka.Ilona@mybnb.com',43.76810,-79.50349,'1970-09-21','Carpenter'),(38573316,'Joan','Ralston','Joan.Ralston@mybnb.com',49.24597,-123.17528,'1976-08-23','Pharmacist'),(38855266,'Aude','Queenie','Aude.Queenie@mybnb.com',45.52130,-73.60832,'1973-08-15','Butcher'),(44625108,'Jessica','Queenie','Jessica.Queenie@mybnb.com',42.27493,-71.13063,'1991-06-21','Carpenter'),(46037158,'Lidia','Fabricia','Lidia.Fabricia@mybnb.com',49.24257,-123.17746,'1989-07-22','Social worker'),(52992470,'Soraya','Ilona','Soraya.Ilona@mybnb.com',45.51536,-73.61821,'1977-04-16','Architect');
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

-- Dump completed on 2016-07-24 23:20:31
