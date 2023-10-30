-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (arm64)
--
-- Host: localhost    Database: grs
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Complaint_Catagory_lists`
--

DROP TABLE IF EXISTS `Complaint_Catagory_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Complaint_Catagory_lists` (
  `C_Id` int NOT NULL,
  `Cat_Id` int NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(100) NOT NULL,
  `Status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`Cat_Id`),
  UNIQUE KEY `Cat_Id` (`Cat_Id`),
  KEY `landline_complaint_catagory_ibfk_1` (`C_Id`),
  CONSTRAINT `complaint_catagory_lists_ibfk_1` FOREIGN KEY (`C_Id`) REFERENCES `Complaint_Type` (`C_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Complaint_Catagory_lists`
--

LOCK TABLES `Complaint_Catagory_lists` WRITE;
/*!40000 ALTER TABLE `Complaint_Catagory_lists` DISABLE KEYS */;
INSERT INTO `Complaint_Catagory_lists` VALUES (1,3,'Noisy',_binary ''),(1,5,'Other',_binary ''),(1,6,'Cann\'t call',_binary ''),(1,7,'Landline Disconnect',_binary ''),(2,8,'Balance Inquiry',_binary ''),(2,9,'Network Issue',_binary ''),(2,10,'Can\'t Call',_binary ''),(2,11,'Internet Issue',_binary ''),(6,14,'Balance Inquiry',_binary ''),(6,15,'Internet Speed Slow',_binary ''),(6,16,'Other',_binary ''),(2,17,'Other',_binary '');
/*!40000 ALTER TABLE `Complaint_Catagory_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Complaint_Progress`
--

DROP TABLE IF EXISTS `Complaint_Progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Complaint_Progress` (
  `Token` varchar(17) NOT NULL,
  `Engineer_id` int NOT NULL,
  `Complaint_status` int NOT NULL DEFAULT '2',
  `Remark` varchar(500) DEFAULT NULL,
  `Engineer_task_status_id` varchar(45) NOT NULL DEFAULT '1',
  KEY `fk_complaints_status` (`Complaint_status`),
  KEY `fk_token` (`Token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Complaint_Progress`
--

LOCK TABLES `Complaint_Progress` WRITE;
/*!40000 ALTER TABLE `Complaint_Progress` DISABLE KEYS */;
INSERT INTO `Complaint_Progress` VALUES ('20220902133504839',7,3,NULL,'1'),('20220902133504839',7,3,NULL,'1'),('20220902133504839',7,3,NULL,'1');
/*!40000 ALTER TABLE `Complaint_Progress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Complaint_Status`
--

DROP TABLE IF EXISTS `Complaint_Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Complaint_Status` (
  `Complaint_id` int NOT NULL AUTO_INCREMENT,
  `Complaint_Status_Name` varchar(30) NOT NULL,
  PRIMARY KEY (`Complaint_id`),
  UNIQUE KEY `Complaint_id_UNIQUE` (`Complaint_id`),
  UNIQUE KEY `Complaint_Status_Name_UNIQUE` (`Complaint_Status_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Complaint_Status`
--

LOCK TABLES `Complaint_Status` WRITE;
/*!40000 ALTER TABLE `Complaint_Status` DISABLE KEYS */;
INSERT INTO `Complaint_Status` VALUES (1,'Pending'),(2,'Process'),(4,'Rejected'),(5,'Revert'),(3,'Sloved');
/*!40000 ALTER TABLE `Complaint_Status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Complaint_Type`
--

DROP TABLE IF EXISTS `Complaint_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Complaint_Type` (
  `C_Id` int NOT NULL AUTO_INCREMENT,
  `C_Name` varchar(50) NOT NULL,
  `C_Status` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`C_Id`),
  UNIQUE KEY `C_Id` (`C_Id`),
  UNIQUE KEY `C_Name` (`C_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Complaint_Type`
--

LOCK TABLES `Complaint_Type` WRITE;
/*!40000 ALTER TABLE `Complaint_Type` DISABLE KEYS */;
INSERT INTO `Complaint_Type` VALUES (1,'Landline',_binary ''),(2,'Mobile',_binary ''),(6,'Boardband',_binary '');
/*!40000 ALTER TABLE `Complaint_Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Complaints_table`
--

DROP TABLE IF EXISTS `Complaints_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Complaints_table` (
  `u_id` int DEFAULT NULL,
  `Comp_id` int NOT NULL AUTO_INCREMENT,
  `mobile` varchar(10) NOT NULL,
  `C_id` int DEFAULT NULL,
  `Cat_id` int DEFAULT NULL,
  `Token` varchar(20) NOT NULL,
  `Comp_date` datetime DEFAULT NULL,
  `Comp_Address` varchar(200) NOT NULL,
  `Com_Pincode` varchar(6) NOT NULL,
  `Comp_desc` varchar(2000) NOT NULL,
  `screenshot` varchar(200) DEFAULT NULL,
  `Comp_status` int NOT NULL DEFAULT '1',
  `Remarks` varchar(500) DEFAULT NULL,
  `Engineer_visit_status` varchar(45) NOT NULL DEFAULT '0',
  `Engineer_id` int DEFAULT NULL,
  PRIMARY KEY (`Comp_id`),
  UNIQUE KEY `Token` (`Token`),
  KEY `u_id` (`u_id`),
  KEY `C_id` (`C_id`),
  KEY `Cat_id` (`Cat_id`),
  CONSTRAINT `complaints_table_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `uld` (`Id`),
  CONSTRAINT `complaints_table_ibfk_2` FOREIGN KEY (`C_id`) REFERENCES `Complaint_Type` (`C_Id`),
  CONSTRAINT `complaints_table_ibfk_3` FOREIGN KEY (`Cat_id`) REFERENCES `Complaint_Catagory_lists` (`Cat_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Complaints_table`
--

LOCK TABLES `Complaints_table` WRITE;
/*!40000 ALTER TABLE `Complaints_table` DISABLE KEYS */;
INSERT INTO `Complaints_table` VALUES (1,1,'7978020151',2,8,'20220902132821543','2022-09-02 13:28:21','mangalaghat,puri','752003','balance',NULL,2,'hiii','0',9),(1,2,'9853618469',6,14,'20220902133412968','2022-09-02 13:34:12','baseli sahi,puri','752002','net slow',NULL,1,'uuuuuu','1',7),(1,3,'9853618460',2,10,'20220902133504839','2022-09-02 13:35:04','folia sahi,puri','752003','call issue',NULL,4,'fffffffff','1',7),(1,21,'2443343434',6,14,'20220902183303153','2022-09-02 18:33:03','111','232434','1',NULL,3,'byyeeeeeee','1',7),(1,27,'4524546456',1,3,'20220907173930015','2022-09-07 17:39:30','puri','897327','qqqq',NULL,2,NULL,'0',NULL),(1,28,'1231231231',1,3,'20220907174146439','2022-09-07 17:41:46','dsasdas','132312','dsfds',NULL,2,NULL,'0',NULL),(1,29,'2222222222',1,3,'20220907174407101','2022-09-07 17:44:07','aaaa','111111','aaaaaa',NULL,2,NULL,'0',9),(1,30,'1111111111',1,3,'20220907174721064','2022-09-07 17:47:21','bbbbbb','676767','bbbb',NULL,2,NULL,'0',9),(1,31,'3234234324',1,3,'20220907182808522','2022-09-07 18:28:08','qqqq','234423','dfsdf',NULL,4,'hgfjhghj','1',7),(1,32,'2312312312',2,9,'20220907183219071','2022-09-07 18:32:19','123123','213123','12213123',NULL,5,'jhjhjhghj','1',7),(1,33,'2312312323',1,3,'20220907184747492','2022-09-07 18:47:47','312313','123123','fgdsfsdfsdf',NULL,2,'fief','0',10);
/*!40000 ALTER TABLE `Complaints_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Engineer_task_status`
--

DROP TABLE IF EXISTS `Engineer_task_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Engineer_task_status` (
  `Engineer_task_status_id` int NOT NULL DEFAULT '1',
  `Engineer_task_status_name` varchar(45) NOT NULL,
  PRIMARY KEY (`Engineer_task_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Engineer_task_status`
--

LOCK TABLES `Engineer_task_status` WRITE;
/*!40000 ALTER TABLE `Engineer_task_status` DISABLE KEYS */;
INSERT INTO `Engineer_task_status` VALUES (1,'Pending'),(2,'Process'),(3,'Sloved'),(4,'Rejected'),(5,'Revert');
/*!40000 ALTER TABLE `Engineer_task_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `customer_id` int NOT NULL,
  `Date` datetime NOT NULL,
  `Token` varchar(20) NOT NULL,
  `Description` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,'2022-09-03 20:04:42','20220902132821543','csacasc'),(2,'2022-09-03 21:04:09','20220902132821511','VVXVDVSVV'),(2,'2022-09-03 21:07:35','20220902132821515','VVXVDVSVV'),(2,'2022-09-03 21:09:14','20220902132821515','VVXVDVSVV'),(2,'2022-09-03 21:12:57','20220902132821516','aaa'),(2,'2022-09-03 21:34:19','20220902142517774','cccc'),(2,'2022-09-03 21:36:08','20220902142517774','Java was developed by Sun Microsystems (which is now the subsidiary of Oracle) in the year 1995. James Gosling is known as the father of Java. Before Java, its name was Oak. Since Oak was already a registered company, so James Gosling and his team changed the name from Oak to Java.'),(1,'2022-09-06 18:40:38','20220902132821543','Click the \"Submit\" button and the form-data will be sent to a page on the server called \"action_page.php\"'),(1,'2022-09-06 18:45:44','20220902132821543','hiii'),(1,'2022-09-07 11:28:12','20220902183303153','make fast solved'),(1,'2022-09-07 17:52:16','20220907174721064','qqq');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Role`
--

DROP TABLE IF EXISTS `Role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `Status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Role`
--

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;
INSERT INTO `Role` VALUES (1,'Customer',1),(2,'Admin',1),(3,'Engineer',1),(4,'Manager',1);
/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uld`
--

DROP TABLE IF EXISTS `uld`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uld` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Mobile` varchar(20) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Role_id` int NOT NULL DEFAULT '1',
  `Address` varchar(200) NOT NULL,
  `Pincode` varchar(6) NOT NULL,
  `Status` bit(1) NOT NULL DEFAULT b'1',
  `Image` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UserName` (`UserName`),
  KEY `fk_role_id` (`Role_id`),
  CONSTRAINT `fk_role_id` FOREIGN KEY (`Role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uld`
--

LOCK TABLES `uld` WRITE;
/*!40000 ALTER TABLE `uld` DISABLE KEYS */;
INSERT INTO `uld` VALUES (1,'JITENDRA SAHOO','sahooj168@gmail.com','7978020151','1111',1,'mangalaghat','752001',_binary '','/Users/jitendrasahoo/eclipse-workspace/GrievanceRedressalSystem/src/main/webapp/Image/16626560709921.jpg'),(2,'chetan sahoo','abc@gmail.com','7978123456','1111',2,'bsfff','752001',_binary '',NULL),(7,'soumya','a@gm.in','9898989888','1111',3,'BDK','123342',_binary '',NULL),(9,'aaaa','aa@gn.om','7866778786','1111',3,'puri','752003',_binary '',NULL),(13,'laxmidhar','l@gm.in','9090909090','1111',1,'bbsr','752991',_binary '',NULL),(14,'Parth bhai','mujanini100@gm.in','9090909090','1111',1,'bbbb','111111',_binary '',NULL),(15,'abinash','b@gm.in','8989898989','1111',4,'bbsr','354345',_binary '',NULL);
/*!40000 ALTER TABLE `uld` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-09 10:38:17
