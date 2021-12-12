-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: webdb
-- ------------------------------------------------------
-- Server version	8.0.27

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

USE webdb;

--
-- Table structure for table `apply`
--

DROP TABLE IF EXISTS `apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apply` (
  `key` int NOT NULL AUTO_INCREMENT,
  `post_key` int NOT NULL,
  `user_key` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `key_UNIQUE` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply`
--

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
INSERT INTO `apply` VALUES (12,3,4);
/*!40000 ALTER TABLE `apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contactme`
--

DROP TABLE IF EXISTS `contactme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contactme` (
  `key` int NOT NULL AUTO_INCREMENT,
  `userkey` int NOT NULL,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `key_UNIQUE` (`key`),
  KEY `userkey_idx` (`userkey`),
  CONSTRAINT `userkey` FOREIGN KEY (`userkey`) REFERENCES `users` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contactme`
--

LOCK TABLES `contactme` WRITE;
/*!40000 ALTER TABLE `contactme` DISABLE KEYS */;
INSERT INTO `contactme` VALUES (6,4,'I have an issue!','Please fix this error!\r\n\r\nI have damaged by this error.\r\n\r\nI\'m looking forward to your quick feedback.\r\n\r\nThank you.');
/*!40000 ALTER TABLE `contactme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gubuns`
--

DROP TABLE IF EXISTS `gubuns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gubuns` (
  `key` int NOT NULL AUTO_INCREMENT,
  `gubun` varchar(45) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `key_UNIQUE` (`key`),
  UNIQUE KEY `gubun_UNIQUE` (`gubun`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gubuns`
--

LOCK TABLES `gubuns` WRITE;
/*!40000 ALTER TABLE `gubuns` DISABLE KEYS */;
INSERT INTO `gubuns` VALUES (2,'EMPLOYEE'),(1,'EMPLOYER');
/*!40000 ALTER TABLE `gubuns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `key` int NOT NULL AUTO_INCREMENT,
  `writer_key` int NOT NULL,
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contents` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `finished` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0',
  `money` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `key_UNIQUE` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,1,'Frontend Engineer - HR Management','At Personio we are on the amazing journey of becoming the leading HR Platform in Europe!\r\n\r\n\r\nThe Human Resource Management Tribe is on a mission to empower organizations for employee self service and remarkable employee management, integrated across domains.\r\n\r\nWe are building our product around the employee lifecycle events, getting hired, getting promotions, getting married, leaving the company and following the direct implications of these lifecycle events - for employees, managers and HR managers.\r\n\r\n\r\nLike all our tribes we are a cross-functional group of engineers, designers and product managers from many different nationalities and backgrounds, spread across different locations and we continue to grow in 2021. Join us and help shape the HRM Tribe journey for Personio.',0,15000),(2,2,'Software Developers for our offices','The mission of the team you are joining is to create the leading software product for life science data analytics. Over the last decade, Evotec has created software for the analysis of cellular data that for us has been a game-changer in drug discovery. We have been using it with huge success internally, and now we are working towards a public release. As part of the software development team, you will help advance and improve this software into a product used by customers worldwide. Join us to shape the future of not only how to treat illnesses, but also how to keep people healthy.\r\n\r\nYour key responsibilities\r\n\r\nImplement and improve features for our large SaaS server/browser application: a secure, high-performance and on-demand scalable cloud computing product\r\nParticipate in every stage of the development process and lifecycle of the software your team is building &#8211; from design and implementation to operation and continuous improvement\r\nWork closely with a team of like-minded experts in various domains and help realize new software ideas in an agile development process',1,13000),(3,3,'Senior Software Engineer (Frontend)','Who We Are\r\n\r\nNokia is a global leader in the technologies that connect people and things. With state-of-the-art software, hardware and services for any type of network, Nokia is uniquely positioned to help communication service providers, governments, and large enterprises deliver on the promise of 5G, the Cloud and the Internet of Things. Serving customers in over 100 countries, our research scientists and engineers continue to invent and accelerate new technologies that will increasingly transform the way people and things communicate and connect.\r\n\r\nDeepfield is a Nokia owned company that builds the analytic and security solutions that monitor and defend over 90% of internet backbone networks. We produce cutting-edge research at the intersection of data science, visualization, and network analytics, and we create, deploy, and maintain the largest global network analytics platform. Come join us and help advance state-of-the-art network intelligence.\r\n\r\nWhat We Do\r\n\r\nAt Deepfield, a Nokia owned company, our customers are the internet - from content providers to global network operators. There\'s no shortage of data in these environments; the challenge is to turn that data into actionable information for everything from strategic business decisions to automated network operation. The biggest players in the industry are turning to Deepfield for answers.\r\n\r\nWhile one of the key aspects of our product is the data, the way that data is presented and the workflows we provide play a big role in the ability of our customers to take action. That¡¯s where you come in. You¡¯ll work on a small team helping to create and bring to life the vision that we have for big data. With your strong passion for user experience, we can help alleviate and clarify the information challenges large amounts of data provide.\r\n\r\nOur ideal candidate is a frontend developer who has at least three years of experience writing production-ready code for web products. We¡¯re looking for someone who can take an idea and run with it, turning it into something useful and beautiful.',0,16000);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `key` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `gubun` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `id_UNIQUE` (`key`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  KEY `gubun_idx` (`gubun`),
  CONSTRAINT `gubun` FOREIGN KEY (`gubun`) REFERENCES `gubuns` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Personio','personio','Personio','Personio',1),(2,'Evotec','evotec','Evotec','Evotec',1),(3,'DeepfieldNetworks','deepfieldnetworks','DeepfieldNetworks','DeepfieldNetworks',1),(4,'developer','developer','Developer','Developer',2);
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

-- Dump completed on 2021-12-12 22:24:37
