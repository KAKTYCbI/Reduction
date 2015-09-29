-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: sto
-- ------------------------------------------------------
-- Server version	5.6.25-log

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
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `application_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` float DEFAULT NULL,
  `date_order` date NOT NULL,
  `date_completion` date DEFAULT NULL,
  `applicationcol` varchar(45) DEFAULT NULL,
  `status_status_id` int(11) NOT NULL,
  `mechanic_mechanic_id` int(11) DEFAULT NULL,
  `client_client_id` int(11) DEFAULT NULL,
  `STO_STO_id` int(11) NOT NULL,
  PRIMARY KEY (`application_id`),
  KEY `fk_application_status1` (`status_status_id`),
  KEY `fk_application_mechanic1` (`mechanic_mechanic_id`),
  KEY `fk_application_client1` (`client_client_id`),
  KEY `fk_application_STO1` (`STO_STO_id`),
  CONSTRAINT `fk_application_STO1` FOREIGN KEY (`STO_STO_id`) REFERENCES `sto` (`STO_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_application_client1` FOREIGN KEY (`client_client_id`) REFERENCES `client` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_application_mechanic1` FOREIGN KEY (`mechanic_mechanic_id`) REFERENCES `mechanic` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_application_status1` FOREIGN KEY (`status_status_id`) REFERENCES `status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (1,NULL,'2015-08-29','2015-09-01',NULL,4,16,18,1),(2,NULL,'2015-08-29',NULL,NULL,4,20,18,2),(3,NULL,'2015-08-29',NULL,NULL,0,20,18,2),(4,NULL,'2015-08-30','2015-08-31',NULL,2,22,18,2),(5,NULL,'2015-08-31','2015-09-01',NULL,3,22,18,2),(6,NULL,'2015-08-31',NULL,NULL,4,19,18,1),(7,NULL,'2015-08-31','2015-09-01',NULL,3,22,18,2),(8,51500,'2015-08-31','2015-09-01',NULL,3,16,18,1),(9,2000,'2015-09-01','2015-09-02',NULL,3,20,18,2),(10,50000,'2015-09-02',NULL,NULL,0,19,17,1),(11,50500,'2015-09-03','2015-09-04',NULL,1,16,18,1);
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_detail`
--

DROP TABLE IF EXISTS `application_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_detail` (
  `application_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `date_order` date NOT NULL,
  `date_delivery` date DEFAULT NULL,
  `application_application_id` int(11) DEFAULT NULL,
  `status_status_id` int(11) NOT NULL,
  PRIMARY KEY (`application_detail_id`),
  KEY `fk_application_detail_application1` (`application_application_id`),
  KEY `fk_application_detail_status1` (`status_status_id`),
  CONSTRAINT `fk_application_detail_application1` FOREIGN KEY (`application_application_id`) REFERENCES `application` (`application_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_application_detail_status1` FOREIGN KEY (`status_status_id`) REFERENCES `status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_detail`
--

LOCK TABLES `application_detail` WRITE;
/*!40000 ALTER TABLE `application_detail` DISABLE KEYS */;
INSERT INTO `application_detail` VALUES (1,'det','2015-08-30','2015-09-01',1,7),(2,'podshibnic','2015-08-30','2015-09-02',1,7),(3,'ruchka','2015-08-31','2015-09-01',4,6),(4,'smazka','2015-09-03',NULL,4,5),(5,'detalka','2015-09-03',NULL,4,5),(6,'tasol','2015-09-03',NULL,4,5),(7,'opora','2015-09-03',NULL,4,5),(8,'antifriz','2015-09-03','2015-09-03',4,6);
/*!40000 ALTER TABLE `application_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_has_detail`
--

DROP TABLE IF EXISTS `application_has_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_has_detail` (
  `application_application_id` int(11) NOT NULL AUTO_INCREMENT,
  `detail_detail_id` int(11) NOT NULL,
  PRIMARY KEY (`application_application_id`,`detail_detail_id`),
  KEY `fk_application_has_detail_detail1` (`detail_detail_id`),
  KEY `fk_application_has_detail_application1` (`application_application_id`),
  CONSTRAINT `fk_application_has_detail_application1` FOREIGN KEY (`application_application_id`) REFERENCES `application` (`application_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_application_has_detail_detail1` FOREIGN KEY (`detail_detail_id`) REFERENCES `detail` (`detail_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_has_detail`
--

LOCK TABLES `application_has_detail` WRITE;
/*!40000 ALTER TABLE `application_has_detail` DISABLE KEYS */;
INSERT INTO `application_has_detail` VALUES (1,1),(9,1),(1,2),(4,2),(8,2),(11,2);
/*!40000 ALTER TABLE `application_has_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_client_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (17),(18),(24);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail`
--

DROP TABLE IF EXISTS `detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail` (
  `detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail`
--

LOCK TABLES `detail` WRITE;
/*!40000 ALTER TABLE `detail` DISABLE KEYS */;
INSERT INTO `detail` VALUES (1,'shruz',1000),(2,'maslo',500),(3,'masleny filtr',100),(4,'det',1500),(5,'podshibnic',1000),(6,'ruchka',400),(7,'tiaga',3000);
/*!40000 ALTER TABLE `detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `director` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `salary` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_director_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (13,5000);
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mechanic`
--

DROP TABLE IF EXISTS `mechanic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mechanic` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `rating` float NOT NULL,
  `salary` int(11) DEFAULT NULL,
  `STO_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `STO` (`STO_id`),
  CONSTRAINT `STO` FOREIGN KEY (`STO_id`) REFERENCES `sto` (`STO_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mechanic_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mechanic`
--

LOCK TABLES `mechanic` WRITE;
/*!40000 ALTER TABLE `mechanic` DISABLE KEYS */;
INSERT INTO `mechanic` VALUES (16,3.66667,4000,1),(19,0,3000,1),(20,0,3000,2),(22,0,5000,2),(25,0,5000,3);
/*!40000 ALTER TABLE `mechanic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(256) NOT NULL,
  `mechanic_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `MechanicMassage` (`mechanic_id`),
  KEY `fk_message_client1` (`client_id`),
  CONSTRAINT `MechanicMassage` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanic` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'ваш заказ выполнен',16,18),(3,'Ваша заявка № 1выполнена',16,18),(4,'Ваша заявка № 7поступила на обрабутку механику mechanic4',22,18),(5,'Ваша заявка № 7выполненяется',22,18),(6,'Ваша заявка № 8поступила на обрабутку механику mechanic',16,18),(7,'Ваша заявка № 8выполнена',16,18),(8,'Ваша заявка № 8выполненяется',16,18),(9,'Ваша заявка № 9поступила на обрабутку механику mechanic3',20,18),(10,'Ваша заявка № 9выполненяется',20,18),(11,'Ваша заявка № 11поступила на обрабутку механику mechanic',16,18),(12,'Ваша заявка № 10поступила на обрабутку механику mechanic2',19,17),(13,'Ваша заявка № 11выполненяется',16,18),(14,'Ваша заявка № 11поступила на обрабутку механику mechanic',16,18);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent`
--

DROP TABLE IF EXISTS `rent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rent` (
  `rent_id` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `price` float NOT NULL,
  `STO_STO_id` int(11) NOT NULL,
  PRIMARY KEY (`rent_id`),
  KEY `fk_rent_STO1` (`STO_STO_id`),
  CONSTRAINT `fk_rent_STO1` FOREIGN KEY (`STO_STO_id`) REFERENCES `sto` (`STO_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent`
--

LOCK TABLES `rent` WRITE;
/*!40000 ALTER TABLE `rent` DISABLE KEYS */;
INSERT INTO `rent` VALUES (1,'2015-08-28',5000,1),(2,'2015-09-02',5000,1);
/*!40000 ALTER TABLE `rent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `date` date NOT NULL,
  `text` text NOT NULL,
  `rating` mediumtext NOT NULL,
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `visible` tinyint(1) NOT NULL,
  `STO_STO_id` int(11) DEFAULT NULL,
  `mechanic_mechanic_id` int(11) DEFAULT NULL,
  `client_client_id` int(11) NOT NULL,
  PRIMARY KEY (`review_id`,`client_client_id`),
  KEY `fk_review_STO1` (`STO_STO_id`),
  KEY `fk_review_mechanic1` (`mechanic_mechanic_id`),
  KEY `fk_review_client1_idx` (`client_client_id`),
  CONSTRAINT `fk_review_STO1` FOREIGN KEY (`STO_STO_id`) REFERENCES `sto` (`STO_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_review_client1` FOREIGN KEY (`client_client_id`) REFERENCES `client` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_review_mechanic1` FOREIGN KEY (`mechanic_mechanic_id`) REFERENCES `mechanic` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES ('2015-08-31','klassny mechanik','5.0',8,1,NULL,16,18),('2015-08-31','delaet vse bystro','4.0',9,1,NULL,16,18),('2015-08-31','klassnoe sto','4.0',12,1,1,NULL,18),('2015-08-31','delayt vse bystro','5.0',13,1,1,NULL,18),('2015-09-01','sdelal vse kachestveno','4.0',14,1,NULL,16,18),('2015-09-01','ochenb choroshiy','4.0',15,1,NULL,16,18),('2015-09-01','Budu remontirovatsia rolko u nego','5.0',16,1,1,NULL,18),('2015-09-01','neplocho','4.0',17,1,NULL,16,18),('2015-09-01','otvratitelnoe obraschenie','1.0',18,1,NULL,16,18),('2015-09-01','ochen klassnoe sto','5.0',19,1,2,NULL,18),('2015-09-03','Krutoe sto','4.0',20,1,2,NULL,18),('2015-09-03','malo vnimanie','0.0',21,1,2,NULL,18);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salary` (
  `salary_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `summa` float NOT NULL,
  `mechanic_id` int(11) DEFAULT NULL,
  `director_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`salary_id`),
  KEY `MechanicSalary` (`mechanic_id`),
  KEY `fk_salary_director1` (`director_id`),
  CONSTRAINT `MechanicSalary` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanic` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_salary_director1` FOREIGN KEY (`director_id`) REFERENCES `director` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (1,'2028-08-20',4000,16,NULL),(2,'2028-08-20',5000,NULL,13),(3,'2015-09-02',3000,16,NULL),(4,'2015-09-03',3000,16,NULL);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (2,'zamena masla',50000),(3,'zamena shruza',1000),(4,'razval',1000),(5,'zamena startera',2000),(6,'zamenaschey ochlozdayschey zhidkosti',10000);
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_has_application`
--

DROP TABLE IF EXISTS `service_has_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_has_application` (
  `service_service_id` int(11) NOT NULL,
  `application_application_id` int(11) NOT NULL,
  PRIMARY KEY (`service_service_id`,`application_application_id`),
  KEY `fk_service_has_application_application1` (`application_application_id`),
  KEY `fk_service_has_application_service1` (`service_service_id`),
  CONSTRAINT `fk_service_has_application_application1` FOREIGN KEY (`application_application_id`) REFERENCES `application` (`application_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_service_has_application_service1` FOREIGN KEY (`service_service_id`) REFERENCES `service` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_has_application`
--

LOCK TABLES `service_has_application` WRITE;
/*!40000 ALTER TABLE `service_has_application` DISABLE KEYS */;
INSERT INTO `service_has_application` VALUES (2,1),(2,2),(2,3),(3,3),(3,4),(4,5),(3,6),(3,7),(4,7),(2,8),(4,8),(3,9),(2,10),(2,11);
/*!40000 ALTER TABLE `service_has_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (0,'zajavka na obrabotke u mechanika'),(1,'zajavka ozhidaet obrabotku'),(2,'net nuznych detaley'),(3,'zajavka vypolniaetsia'),(4,'zajavka vypolnena'),(5,'ozhidaetsia obrobotki directora'),(6,'zakazana'),(7,'pribyla');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sto`
--

DROP TABLE IF EXISTS `sto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sto` (
  `STO_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) NOT NULL,
  `salary` int(11) DEFAULT NULL,
  `rating` float NOT NULL,
  PRIMARY KEY (`STO_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sto`
--

LOCK TABLES `sto` WRITE;
/*!40000 ALTER TABLE `sto` DISABLE KEYS */;
INSERT INTO `sto` VALUES (1,'sto1',5500,4.66667),(2,'sto2',3000,3),(3,'sto3',20000,0);
/*!40000 ALTER TABLE `sto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `login` varchar(100) NOT NULL,
  `role` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `login_UNIQUE` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (13,'admin','admin','admin','admin','admin','DIRECTOR'),(16,'mechanic','mechanic@mechanic','mechanic','mechanic','mechanic','MECHANIC'),(17,'sergey','sergey','sergey','1','sergey','CLIENT'),(18,'user','user','user','1','user','CLIENT'),(19,'mechanic2','mechanic2','mechanic2','mechanic2','mechanic2','MECHANIC'),(20,'mechanic3','mechanic3','mechanic3','mechanic3','mechanic3','MECHANIC'),(22,'mechanic4','mechanic4','mechanic4','mechanic4','mechanic4','MECHANIC'),(24,'julia','julia','julia','1','julia','CLIENT'),(25,'vasia','vasia','vasia','vasia','vasia','MECHANIC');
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

-- Dump completed on 2015-09-03 20:11:24
