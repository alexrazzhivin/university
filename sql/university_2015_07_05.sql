-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: university
-- ------------------------------------------------------
-- Server version	5.7.7-rc-log

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
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `courseName` varchar(255) NOT NULL,
  `subjectId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `courseName_UNIQUE` (`courseName`),
  KEY `fk3_idx` (`subjectId`),
  CONSTRAINT `fk3` FOREIGN KEY (`subjectId`) REFERENCES `subjects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'Основы квантовой механики',3),(2,'Квантовая механика для профессионалов',3),(3,'Основы дискретной математики',8),(4,'Основы математического анализа',9),(5,'История России в лицах',11);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `courses_students`
--

DROP TABLE IF EXISTS `courses_students`;
/*!50001 DROP VIEW IF EXISTS `courses_students`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `courses_students` AS SELECT 
 1 AS `id`,
 1 AS `familyName`,
 1 AS `name`,
 1 AS `patronymic`,
 1 AS `groupId`,
 1 AS `courseId`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`groupName`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (9,'06ВП1'),(10,'06ВП2'),(11,'06ВП3'),(12,'06ВП4'),(7,'07УУ1'),(8,'07УУ2'),(4,'08ЕЕ1'),(5,'08ЕЕ2'),(6,'08ЕЕ3'),(13,'09ХХ1'),(14,'09ХХ2'),(15,'09ХХ3'),(16,'10ЮА1'),(17,'10ЮА2');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_courses`
--

DROP TABLE IF EXISTS `groups_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_courses`
--

LOCK TABLES `groups_courses` WRITE;
/*!40000 ALTER TABLE `groups_courses` DISABLE KEYS */;
INSERT INTO `groups_courses` VALUES (1,5,1),(2,6,2),(3,4,5),(4,5,5),(5,6,5),(6,7,5),(7,8,5),(8,9,5),(9,10,5),(10,11,5),(11,12,5),(12,13,5),(13,14,5),(14,15,5),(15,16,5),(16,17,5),(17,6,2),(18,7,2),(20,17,4),(22,16,3);
/*!40000 ALTER TABLE `groups_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `groups_with_students_number`
--

DROP TABLE IF EXISTS `groups_with_students_number`;
/*!50001 DROP VIEW IF EXISTS `groups_with_students_number`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `groups_with_students_number` AS SELECT 
 1 AS `id`,
 1 AS `groupName`,
 1 AS `studentsNumber`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `familyName` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `patronymic` varchar(255) NOT NULL,
  `groupId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `groupId_idx` (`groupId`),
  CONSTRAINT `fk2` FOREIGN KEY (`groupId`) REFERENCES `groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (7,'Иванов','Александр','Александрович',5),(8,'Петров','Дмитрий','Сергеевич',5),(9,'Станков','Алексей','Петрович',6),(10,'Сидоров','Сидр','Иванович',6),(11,'Бражкин','Емельян','Афанасьевич',7),(12,'Бутылин','Петр','Сергеевич',6),(13,'Степанов','Александр','Александрович',9),(14,'Осколков','Леонид','Абрагимович',9),(15,'Свеклов','Михаил','Викторович',6),(16,'Пробкин','Елисей','Елисеевич',6),(17,'Шилов','Евгений','Михайлович',7),(18,'Грибоедов','Иван','Сидорович',16),(19,'Печкин','Иосиф','Леонидович',17),(20,'Смирнов','Михаил','Юрьевич',17),(21,'Егоров','Иван','Алексеевич',16),(22,'Стрелков','Дмитрий','Иосифович',16),(23,'Егоров','Геннадий','Сидорович',7),(24,'Семкин','Степан','Грибоедович',7);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subjectName` varchar(255) NOT NULL,
  `parentId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `subjectName_UNIQUE` (`subjectName`),
  KEY `fk1_idx` (`parentId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Физика',0),(2,'Теоретическая физика',1),(3,'Квантовая механика',2),(7,'Математика',0),(8,'Дискретная математика',7),(9,'Математический анализ',7),(10,'История',0),(11,'История России',10);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `courses_students`
--

/*!50001 DROP VIEW IF EXISTS `courses_students`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`webuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `courses_students` AS select `university`.`students`.`id` AS `id`,`university`.`students`.`familyName` AS `familyName`,`university`.`students`.`name` AS `name`,`university`.`students`.`patronymic` AS `patronymic`,`university`.`students`.`groupId` AS `groupId`,`gs`.`courseId` AS `courseId` from (`university`.`students` join (select `gc`.`courseId` AS `courseId`,`s`.`id` AS `id` from (`university`.`groups_courses` `gc` join `university`.`students` `s` on((`gc`.`groupId` = `s`.`groupId`)))) `gs` on((`university`.`students`.`id` = `gs`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `groups_with_students_number`
--

/*!50001 DROP VIEW IF EXISTS `groups_with_students_number`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`webuser`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `groups_with_students_number` AS select `university`.`groups`.`id` AS `id`,`university`.`groups`.`groupName` AS `groupName`,`g`.`studentsNumber` AS `studentsNumber` from (`university`.`groups` join (select `university`.`students`.`groupId` AS `id`,count(0) AS `studentsNumber` from `university`.`students` group by `university`.`students`.`groupId`) `g` on((`university`.`groups`.`id` = `g`.`id`))) */;
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

-- Dump completed on 2015-07-05 22:01:28
