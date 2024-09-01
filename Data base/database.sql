CREATE DATABASE  IF NOT EXISTS `abcd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `abcd`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: abcd
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (101,'111','Asik Rahman','male','asik123@gmail.com','0157895692','Gazipur'),(102,'222','Asika Akter','female','asika000@gmail.com','01536987445','Mymensingh'),(103,'333','Jahir Ahmed','male','jahir@gmail.com','01989564562','Mirpur'),(104,'444','Rojina Akter','female','rojina3@gmail.com','01478956876','Dhanmondi'),(105,'555','Kalam Mia','male','kalam45@gmail.com','01536987410','Uttara');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applyaccount`
--

DROP TABLE IF EXISTS `applyaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applyaccount` (
  `nid` double NOT NULL,
  `acctype` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `mar_status` varchar(45) DEFAULT NULL,
  `occupation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applyaccount`
--

LOCK TABLES `applyaccount` WRITE;
/*!40000 ALTER TABLE `applyaccount` DISABLE KEYS */;
INSERT INTO `applyaccount` VALUES (101203,'Savings Account','Fahmida Akter','Female','01795013338','jahir@gmail.com','Uttara','2024-05-20','Single','Teacher'),(101204,'Checking Account','Md. Jahir Uddin','Male','01787013338','123@gmail.com','Dhanmondi','2024-05-20','Married','Govt. employee'),(101205,'Savings Account','Rakibul Islam','Male','01478523698','abc@gmail.com','Mirpur','2024-05-20','Single','Student'),(101206,'Savings account','Afifa','female','01236547895','123@gmail.com','Dhaka','2024-05-20','Marid','Teacher');
/*!40000 ALTER TABLE `applyaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applyforloan`
--

DROP TABLE IF EXISTS `applyforloan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applyforloan` (
  `nid` int NOT NULL,
  `loantype` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `mar_status` varchar(45) DEFAULT NULL,
  `occupation` varchar(45) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applyforloan`
--

LOCK TABLES `applyforloan` WRITE;
/*!40000 ALTER TABLE `applyforloan` DISABLE KEYS */;
INSERT INTO `applyforloan` VALUES (101203,'Home loan','Rifa akter','Female','01478523690','ra1766579@gmail.com','Cantonment','2024-05-25','Single','private',100000,'1'),(101204,'Home loan','Ms. Jahanara Akter','Female','01787013338','jahir@gmail.com','Cantonment','2024-05-24','Married','Teacher',200000,'1');
/*!40000 ALTER TABLE `applyforloan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `createaccount`
--

DROP TABLE IF EXISTS `createaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `createaccount` (
  `a_number` double NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nid` double DEFAULT NULL,
  `acctype` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `mar_status` varchar(45) DEFAULT NULL,
  `occupation` varchar(45) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `img` varchar(700) DEFAULT NULL,
  PRIMARY KEY (`a_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `createaccount`
--

LOCK TABLES `createaccount` WRITE;
/*!40000 ALTER TABLE `createaccount` DISABLE KEYS */;
INSERT INTO `createaccount` VALUES (101501,'111',101201,'Savings Account','Md. Rifat Ahmed','Male','01795013338','ra1766579@gmail.com','Mirpur','2024-05-25','Single','Govt. employee',6500,'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg'),(101502,'222',101202,'Money Marjet Account','Md. Jahir Uddin','Male','01478523690','abc@gmail.com','Dhanmondi','2024-05-08','Single','Private Job',8700,'https://cdn.pixabay.com/photo/2015/01/08/18/29/entrepreneur-593358_640.jpg');
/*!40000 ALTER TABLE `createaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loanapproval`
--

DROP TABLE IF EXISTS `loanapproval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loanapproval` (
  `accnumber` int NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `nid` int DEFAULT NULL,
  `loantype` varchar(45) DEFAULT NULL,
  `req_amount` double DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `cash` double DEFAULT NULL,
  `interest_rate` varchar(45) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `installment` int DEFAULT NULL,
  `paid_installment` int DEFAULT NULL,
  `monthlypaid` double DEFAULT NULL,
  `paid_amount` double DEFAULT NULL,
  `due` double DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  `mar_status` varchar(45) DEFAULT NULL,
  `occupation` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`accnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='				';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loanapproval`
--

LOCK TABLES `loanapproval` WRITE;
/*!40000 ALTER TABLE `loanapproval` DISABLE KEYS */;
INSERT INTO `loanapproval` VALUES (101302,'222',101202,'Car loan',300000,'1',300000,'10%',330000,12,47,27500,164439,25000,'Md. Jahir Uddin','Male','01478523690','123@gmail.com','Mirpur','2024-05-16','Single','Teacher'),(101304,'444',101201,'Car loan',200000,'2',200000,'15%',260000,24,0,3000,0,260000,'Md. Rifat Ahmed','Male','01795013338','ra1766579@gmail.com','Dhanmondi','2024-05-20','Separated','Teacher');
/*!40000 ALTER TABLE `loanapproval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loantransaction`
--

DROP TABLE IF EXISTS `loantransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loantransaction` (
  `tid` int NOT NULL AUTO_INCREMENT,
  `ttype` varchar(45) DEFAULT NULL,
  `accnumber` int DEFAULT NULL,
  `loantype` varchar(45) DEFAULT NULL,
  `totalinstallment` int DEFAULT NULL,
  `payinstallment` int DEFAULT NULL,
  `paidamount` double DEFAULT NULL,
  `dueamount` double DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loantransaction`
--

LOCK TABLES `loantransaction` WRITE;
/*!40000 ALTER TABLE `loantransaction` DISABLE KEYS */;
INSERT INTO `loantransaction` VALUES (10,'Installment',101301,'Home loan',24,1,10834,249166,'2024-05-25 22:20:14'),(11,'Installment',101301,'Home loan',24,2,21668,238332,'2024-05-25 22:21:29'),(12,'Installment',101301,'Home loan',24,3,260000,0,'2024-05-25 22:23:58'),(13,'Installment',101302,'Car loan',12,1,10834,319166,'2024-05-25 22:34:32'),(17,'Installment',101302,'Car loan',12,5,54170,275830,'2024-05-26 00:06:10'),(18,'Installment',101304,'Car loan',24,1,3000,257000,'2024-05-26 10:19:27'),(19,'Installment',101302,'Car loan',12,1,27500,302500,'2024-05-26 14:36:22'),(20,'Installment',101302,'Car loan',12,2,38334,291666,'2024-06-05 00:27:20'),(21,'Installment',101302,'Car loan',12,3,49169,280831,'2024-06-06 00:28:50'),(22,'Installment',101302,'Car loan',12,4,49669,280331,'2024-07-14 00:05:43'),(23,'Installment',101302,'Car loan',12,5,50669,279331,'2024-07-14 00:06:17'),(24,'Installment',101302,'Car loan',12,6,70669,259331,'2024-07-15 16:57:45'),(25,'Installment',101302,'Car loan',12,7,73269,256731,'2024-08-11 09:49:14'),(26,'Installment',101302,'Car loan',12,8,74269,255731,'2024-08-11 09:50:24'),(27,'Installment',101302,'Car loan',12,9,75269,254731,'2024-08-11 09:50:27'),(28,'Installment',101302,'Car loan',12,10,76269,253731,'2024-08-11 09:50:34'),(29,'Installment',101302,'Car loan',12,11,77269,24000,'2024-08-11 09:51:56'),(30,'Installment',101302,'Car loan',12,12,78269,23000,'2024-08-11 09:56:14'),(31,'Installment',101302,'Car loan',12,13,79269,22000,'2024-08-11 09:56:44'),(32,'Installment',101302,'Car loan',12,14,80269,21000,'2024-08-11 09:58:13'),(33,'Installment',101302,'Car loan',12,15,81269,20000,'2024-08-11 09:58:19'),(34,'Installment',101302,'Car loan',12,16,83269,18000,'2024-08-11 10:11:43'),(35,'Installment',101302,'Car loan',12,17,85269,16000,'2024-08-11 10:12:04'),(36,'Installment',101302,'Car loan',12,18,87269,14000,'2024-08-11 10:24:52'),(37,'Installment',101302,'Car loan',12,19,89269,12000,'2024-08-11 10:27:13'),(38,'Installment',101302,'Car loan',12,20,91269,10000,'2024-08-11 10:27:22'),(39,'Installment',101302,'Car loan',12,21,93269,8000,'2024-08-11 10:29:35'),(40,'Installment',101302,'Car loan',12,22,95269,6000,'2024-08-11 10:30:51'),(41,'Installment',101302,'Car loan',12,23,96269,5000,'2024-08-11 10:31:28'),(42,'Installment',101302,'Car loan',12,24,97269,4000,'2024-08-11 10:33:09'),(43,'Installment',101302,'Car loan',12,25,98269,3000,'2024-08-11 10:33:52'),(44,'Installment',101302,'Car loan',12,26,99269,2000,'2024-08-11 10:49:37'),(45,'Installment',101302,'Car loan',12,27,99279,1990,'2024-08-11 10:51:04'),(46,'Installment',101302,'Car loan',12,28,99289,1980,'2024-08-11 10:51:27'),(47,'Installment',101302,'Car loan',12,29,99299,1970,'2024-08-11 10:51:55'),(48,'Installment',101302,'Car loan',12,30,99309,1960,'2024-08-11 10:53:15'),(49,'Installment',101302,'Car loan',12,31,99319,1950,'2024-08-11 10:53:24'),(50,'Installment',101302,'Car loan',12,32,99329,1940,'2024-08-11 10:56:37'),(51,'Installment',101302,'Car loan',12,33,99339,1930,'2024-08-11 10:57:12'),(52,'Installment',101302,'Car loan',12,34,99349,1920,'2024-08-11 10:59:41'),(53,'Installment',101302,'Car loan',12,35,99359,1910,'2024-08-11 11:01:05'),(54,'Installment',101302,'Car loan',12,36,99369,1900,'2024-08-11 11:01:07'),(55,'Installment',101302,'Car loan',12,37,99379,1890,'2024-08-11 11:01:18'),(56,'Installment',101302,'Car loan',12,38,99389,1880,'2024-08-11 11:05:27'),(57,'Installment',101302,'Car loan',12,39,99399,1870,'2024-08-11 11:06:58'),(58,'Installment',101302,'Car loan',12,40,99409,1860,'2024-08-11 11:08:51'),(59,'Installment',101302,'Car loan',12,41,99419,1850,'2024-08-11 11:09:51'),(60,'Installment',101302,'Car loan',12,42,99429,1840,'2024-08-11 11:11:34'),(61,'Installment',101302,'Car loan',12,43,99439,1830,'2024-08-11 11:12:21'),(62,'Installment',101302,'Car loan',12,44,129439,0,'2024-08-11 11:21:03'),(63,'Installment',101302,'Car loan',12,45,149439,10000,'2024-08-11 11:22:33'),(64,'Installment',101302,'Car loan',12,46,159439,0,'2024-08-11 11:22:54'),(65,'Installment',101302,'Car loan',12,47,164439,25000,'2024-08-11 13:19:43');
/*!40000 ALTER TABLE `loantransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `tid` int NOT NULL AUTO_INCREMENT,
  `ttype` varchar(45) DEFAULT NULL,
  `a_number` double DEFAULT NULL,
  `a_type` varchar(45) DEFAULT NULL,
  `Prebalance` double DEFAULT NULL,
  `tamount` double DEFAULT NULL,
  `curbalance` double DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `toacc_number` double DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,'withdraw',101501,'Savings Account',2800,100,2700,'2024-04-20','21:41:05',NULL),(2,'withdraw',101501,'Savings Account',2700,100,2600,'2024-04-02','21:42:21',NULL),(3,'withdraw',101501,'Savings Account',2600,100,2500,'2024-05-22','21:56:33',NULL),(4,'withdraw',101502,'Money Marjet Account',2700,700,2000,'2024-05-15','21:59:02',NULL),(5,'Transfer',101501,'Money Marjet Account',2500,500,2000,'2024-05-20','21:59:40',101502),(6,'deposit',101501,'Savings Account',3000,750,3750,'2024-05-25','22:08:42',NULL),(27,'deposit',101501,'Savings Account',6000,500,6500,'2024-08-09','20:20:00',NULL);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-11 22:45:06
