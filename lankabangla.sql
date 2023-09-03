-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: lankabangla
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `adult`
--

DROP TABLE IF EXISTS `adult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adult` (
  `adult_bo_num` varchar(8) NOT NULL,
  PRIMARY KEY (`adult_bo_num`),
  UNIQUE KEY `adult_bo_num_UNIQUE` (`adult_bo_num`),
  CONSTRAINT `adult_bo_number` FOREIGN KEY (`adult_bo_num`) REFERENCES `bo_account` (`bo_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adult`
--

LOCK TABLES `adult` WRITE;
/*!40000 ALTER TABLE `adult` DISABLE KEYS */;
/*!40000 ALTER TABLE `adult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorized_person`
--

DROP TABLE IF EXISTS `authorized_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorized_person` (
  `account_number` varchar(8) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `spouse_name` varchar(30) DEFAULT NULL,
  `mother_name` varchar(30) DEFAULT NULL,
  `father_name` varchar(30) DEFAULT NULL,
  `nid` varchar(10) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  `occupation` varchar(20) DEFAULT NULL,
  `phone_number` varchar(11) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `photo` varchar(16) DEFAULT NULL,
  `signature` varchar(16) DEFAULT NULL,
  UNIQUE KEY `account_number_UNIQUE` (`account_number`),
  UNIQUE KEY `photo_UNIQUE` (`photo`),
  UNIQUE KEY `signature_UNIQUE` (`signature`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `nid_UNIQUE` (`nid`),
  CONSTRAINT `company_account_no` FOREIGN KEY (`account_number`) REFERENCES `corporate` (`corp_account_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorized_person`
--

LOCK TABLES `authorized_person` WRITE;
/*!40000 ALTER TABLE `authorized_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorized_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank` (
  `bank_name` varchar(40) NOT NULL,
  `account` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bank_name`),
  UNIQUE KEY `account_UNIQUE` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES ('3','100001005'),('17','100001186'),('6','100001345'),('2','100001392'),('10','100001456'),('4','100002779'),('12','100003042'),('11','100003556'),('20','100003971'),('14','100004605'),('9','100005010'),('15','100005476'),('16','100005633'),('22','100006120'),('25','100006512'),('1','100006956'),('8','100007089'),('19','100007477'),('24','100007516'),('21','100007710'),('23','100008495'),('18','100009172'),('13','100009624'),('5','100009813'),('7','100009822');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_branch_name`
--

DROP TABLE IF EXISTS `bank_branch_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_branch_name` (
  `bank_name` varchar(40) NOT NULL,
  `branch_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`bank_name`),
  UNIQUE KEY `branch_name_UNIQUE` (`branch_name`),
  CONSTRAINT `bankName` FOREIGN KEY (`bank_name`) REFERENCES `bank` (`bank_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_branch_name`
--

LOCK TABLES `bank_branch_name` WRITE;
/*!40000 ALTER TABLE `bank_branch_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_branch_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_routing_number`
--

DROP TABLE IF EXISTS `bank_routing_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_routing_number` (
  `branch_name` varchar(40) NOT NULL,
  `routing_number` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`branch_name`),
  UNIQUE KEY `branch_name_UNIQUE` (`branch_name`),
  UNIQUE KEY `routing_number_UNIQUE` (`routing_number`),
  CONSTRAINT `branch_name` FOREIGN KEY (`branch_name`) REFERENCES `bank_branch_name` (`bank_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_routing_number`
--

LOCK TABLES `bank_routing_number` WRITE;
/*!40000 ALTER TABLE `bank_routing_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_routing_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bo_account`
--

DROP TABLE IF EXISTS `bo_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bo_account` (
  `bo_number` varchar(16) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `bo_nid` varchar(16) DEFAULT NULL,
  `occupation` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `photo` varchar(16) DEFAULT NULL,
  `signature` varchar(16) DEFAULT NULL,
  `account_type` varchar(2) DEFAULT NULL,
  `operation_type` varchar(2) DEFAULT NULL,
  `opening_date` date DEFAULT NULL,
  `nom_id` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`bo_number`),
  UNIQUE KEY `bo_number_UNIQUE` (`bo_number`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `bo_nid_UNIQUE` (`bo_nid`),
  UNIQUE KEY `nom_id_UNIQUE` (`nom_id`),
  UNIQUE KEY `photo_UNIQUE` (`photo`),
  UNIQUE KEY `signature_UNIQUE` (`signature`),
  CONSTRAINT `nom_id` FOREIGN KEY (`nom_id`) REFERENCES `nominee` (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bo_account`
--

LOCK TABLES `bo_account` WRITE;
/*!40000 ALTER TABLE `bo_account` DISABLE KEYS */;
INSERT INTO `bo_account` VALUES ('319231541395026',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('619231613365140',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('620231340021651',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('620231353275901',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('620231359020700',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('620231406537621',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('620231426497519',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('620231458113103',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('620231500049216',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('620231511387309',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('620231522020383',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('620231528017679',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('620231725554660',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('620231741231363',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('620232215530395',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('620232241053479',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('620232322325065',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('620232349173664',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('621230034511845',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('621230108133481',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('621230857564843',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('621230909038939',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('621230923518765',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('621230926322084',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('621230928429321',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `bo_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `account_number` varchar(10) NOT NULL,
  `product_type` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`account_number`),
  UNIQUE KEY `account_number_UNIQUE` (`account_number`),
  UNIQUE KEY `product_type_UNIQUE` (`product_type`),
  CONSTRAINT `card_account_num` FOREIGN KEY (`account_number`) REFERENCES `client` (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `account_number` varchar(10) NOT NULL,
  `client_code` varchar(15) DEFAULT NULL,
  `title` varchar(3) DEFAULT NULL,
  `client_name` varchar(30) DEFAULT NULL,
  `father_name` varchar(30) DEFAULT NULL,
  `mother_name` varchar(30) DEFAULT NULL,
  `spouse_name` varchar(30) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `permanent_city` varchar(30) DEFAULT NULL,
  `permanent_post` varchar(5) DEFAULT NULL,
  `branch` varchar(30) DEFAULT NULL,
  `phone_number` varchar(13) DEFAULT NULL,
  `operation` varchar(45) DEFAULT NULL,
  `intro_id` varchar(8) DEFAULT NULL,
  `bo_account_number` varchar(16) DEFAULT NULL,
  `bank_account_number` varchar(20) DEFAULT NULL,
  `client_bank_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`account_number`),
  UNIQUE KEY `account_number_UNIQUE` (`account_number`),
  UNIQUE KEY `client_code_UNIQUE` (`client_code`),
  UNIQUE KEY `bo_number_UNIQUE` (`bo_account_number`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`),
  UNIQUE KEY `bank_account_number_UNIQUE` (`bank_account_number`),
  KEY `intro_id_idx` (`intro_id`),
  KEY `bank_account_number_idx` (`bank_account_number`),
  KEY `client_bank_name_idx` (`client_bank_name`),
  CONSTRAINT `bank_account_number` FOREIGN KEY (`bank_account_number`) REFERENCES `bank` (`account`),
  CONSTRAINT `bo_account_number` FOREIGN KEY (`bo_account_number`) REFERENCES `bo_account` (`bo_number`),
  CONSTRAINT `client_bank_name` FOREIGN KEY (`client_bank_name`) REFERENCES `bank` (`bank_name`),
  CONSTRAINT `introducer_id` FOREIGN KEY (`intro_id`) REFERENCES `introducer` (`Introducer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('1001149','1036','MR','MD. KAYES HOSSAIN','MD. KAWSAR HOSSAIN','AFSANA KHANAM','','Bangladesh','DHAKA','1214','Online','01818800008','','2106766','620231500049216','100005010',NULL),('1001207','6781','MS','RAFIA AKTER','A. K. M. SABUR','ASMA KHANAM','','Bangladesh','BARISAL','8530','Agrabad','01818800024','','2106766','621230928429321','100006512',NULL),('1002037','8155','MR','MOHAMMAD ZULKIPAL','MOHAMMAD AMIR HOSSAIN','TAHMINA YESMIN','','Bangladesh','CHATTOGRAM','4100','Online','01818800010','','1903577','620231522020383','100003556',NULL),('1002548','8375','MR','IRINE AFROZA AURPA','HAZI MD. AMIR HOSSAIN TALUKDER','SONIA AKTER','','Bangladesh','MUNSHIGANJ','1530','Agrabad','01818800016','','2106766','620232322325065','100001186',NULL),('1003032','1339','MR','MOHAMMAD NAZRUL ISLAM','MD ABDUL KUDDUS','ARIFA KHATUN','','Bangladesh','CTG','4000','Online','01818800000','','2009680','319231541395026','100006956',NULL),('1003918','1764','MR','G.M SALMAN TANVIR','GAZI ABDUL MANNAN','NAZMA BEGUM','','Bangladesh','KHULNA','9100','Online','01818800004','','2109780','620231359020700','100009813',NULL),('1003937','3408','NA','ARUBA SALIM','MOHAMMAD SALIM','FARZANA PARVEEN ','MD. PARVEZ','Bangladesh','NILPHAMARI ','5310','Principal','01818800001','','2009680','619231613365140','100001392',NULL),('1003973','4810','NA','AHM AMINUL ISLAM','Abdul Kuddus Bhuiyan','Shamsunnahar Begum','Kazi Mobruka Akter','Bangladesh','DHAKA','1000','Online','01818800005','','1903577','620231406537621','100001345',NULL),('1004814','4861','NA','MD HOSSAIN AHMED SHAMIM','MD. SHAHIDUL ISLAM','JOSNA BEGUM','ANOWARA AKTER','Bangladesh','BRAHMANBARIA','3415','Online','01818800002','','1406320','620231340021651','100001005',NULL),('1005204','5879','MR','ANTU SHEEL','MINTU SHIL','POPY SHIL','','Bangladesh','CHATTOGRAM','4351','Online','01818800003','','2109780','620231353275901','100002779',NULL),('1005368','2980','MR','RATUL SEN','SHAILESH CHANDRA SEN','MIRA SEN','','Bangladesh','SHERPUR','2100','Agrabad','01818800018','','2106766','621230034511845','100007477',NULL),('1005659','2866','MR','MD. TOWFIQ AHMED SAKIB','MD. ABDUL MUTALAB','SHAJADA BEGUM','NUSRAT JAHAN BRISTY','Bangladesh','TANGAIL','1900','Online','01818800006','','2303912','620231426497519','100009822',NULL),('1005673','1519','MR','MD. ABU FOYSAL','MD. ABI ABDULLAH','KAMRUN NAHAR','','Bangladesh','DHAKA','1207','Online','01818800012','','2111794','620231725554660','100009624',NULL),('1006265','8754','MS','KISMA BINTE KAMAL','MD. KAMAL HOSSAIN','ROZINA BEGUM','','Bangladesh','DHAKA','1100','Agrabad','01818800014','','2106766','620232215530395','100005476',NULL),('1006370','1555','MR','MD. SHADMAN MOMIN','MD. MOMINUL ISLAM','LAYLA NASRIN','','Bangladesh','DHAKA','1207','Agrabad','01818800021','','2106766','621230909038939','100006120',NULL),('1007077','7713','MR','MD. NAZMUL ALAM ANIK','NUR-A ALAM','ZAHANARA BEGUM','','Bangladesh','DHAKA','1230','Agrabad','01818800015','','2106766','620232241053479','100005633',NULL),('1007599','6062','MR','TOWFIQUR RAHMAN TOKI','MIZANUR RAHMAN','DILARA BEGUM','','Bangladesh','BHOLA','8340','Online','01818800013','','2111794','620231741231363','100004605',NULL),('1007603','9914','MS','NAHID SULTANA','JASHIM UDDIN','FERDOUS ARA','','Bangladesh','DHAKA','1229','Agrabad','01818800023','','2106766','621230926322084','100007516',NULL),('1007797','9430','MR','Md Sohrab Hossain','Md Abdul Alim','Saira Khatun','Mahmuda Khatun','Bangladesh','JASHORE','7430','Agrabad','01818800019','','1406320','621230108133481','100003971',NULL),('1008054','6945','MR','Azmal Hossain','Anowar Hossain','Kulsum Hossain','','Bangladesh','DHAKA','1219','Agrabad','01818800020','','1406320','621230857564843','100007710',NULL),('1008137','2259','MR','MD. AHNAF TOWSHIF','ABUL KASHEM AZAD','LUTFA BEGUM','','Bangladesh','DHAKA','1216','Online','01818800011','','1406320','620231528017679','100003042',NULL),('1008475','8760','MR','ANIRBAN SARKAR','MANINDRA NATH SARKAR','SUCHITRA ROY','','Bangladesh','CHATTOGRAM','4209','Online','01818800009','','1206283','620231511387309','100001456',NULL),('1008708','4510','NA','ABDULLAH AL SHAKIB','MD SHAWKAT ALI','ROKEYA BEGUM','','Bangladesh','MUNSHIGANJ SADAR','1501','Agrabad','01818800022','','1406320','621230923518765','100008495',NULL),('1008868','6527','MR','MD. JAMIRUL ISLAM','MD. ALAM ISLAM','JAMENA BEGUM','','Bangladesh','DHAKA','1216','Online','01818800007','','1206283','620231458113103','100007089',NULL),('1009536','2170','MR','SHAON CHANDRA SAHA','SOMIR CHANDRA SAHA','NIYASA RANI SAHA','','Bangladesh',NULL,NULL,NULL,'01818800017','','2106766','620232349173664','100009172',NULL);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corporate`
--

DROP TABLE IF EXISTS `corporate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corporate` (
  `corp_account_num` varchar(8) NOT NULL,
  `company_name` varchar(30) DEFAULT NULL,
  UNIQUE KEY `corp_account_num_UNIQUE` (`corp_account_num`),
  CONSTRAINT `com_account_num` FOREIGN KEY (`corp_account_num`) REFERENCES `bo_account` (`bo_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corporate`
--

LOCK TABLES `corporate` WRITE;
/*!40000 ALTER TABLE `corporate` DISABLE KEYS */;
/*!40000 ALTER TABLE `corporate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `first_account`
--

DROP TABLE IF EXISTS `first_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `first_account` (
  `first_account_number` varchar(8) NOT NULL,
  `nid` varchar(10) DEFAULT NULL,
  `dateOfbirth` datetime DEFAULT NULL,
  `occupation` varchar(20) DEFAULT NULL,
  `phone_number` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `photo` varchar(16) DEFAULT NULL,
  `signature` varchar(16) DEFAULT NULL,
  UNIQUE KEY `first_account_number_UNIQUE` (`first_account_number`),
  UNIQUE KEY `nid_UNIQUE` (`nid`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `photo_UNIQUE` (`photo`),
  UNIQUE KEY `signature_UNIQUE` (`signature`),
  CONSTRAINT `FA_account_number` FOREIGN KEY (`first_account_number`) REFERENCES `bo_account` (`bo_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `first_account`
--

LOCK TABLES `first_account` WRITE;
/*!40000 ALTER TABLE `first_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `first_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `head_of_settlement`
--

DROP TABLE IF EXISTS `head_of_settlement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `head_of_settlement` (
  `employee_id` varchar(10) NOT NULL,
  `phone_number` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nid` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `photo` varchar(16) DEFAULT NULL,
  `signature` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_id_UNIQUE` (`employee_id`),
  UNIQUE KEY `photo_UNIQUE` (`photo`),
  UNIQUE KEY `signature_UNIQUE` (`signature`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `nid_UNIQUE` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `head_of_settlement`
--

LOCK TABLES `head_of_settlement` WRITE;
/*!40000 ALTER TABLE `head_of_settlement` DISABLE KEYS */;
/*!40000 ALTER TABLE `head_of_settlement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `introducer`
--

DROP TABLE IF EXISTS `introducer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `introducer` (
  `Introducer_id` varchar(8) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `phone_number` varchar(11) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `occupation` varchar(20) DEFAULT NULL,
  `dob` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Introducer_id`),
  UNIQUE KEY `Introducer_id_UNIQUE` (`Introducer_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `introducer`
--

LOCK TABLES `introducer` WRITE;
/*!40000 ALTER TABLE `introducer` DISABLE KEYS */;
INSERT INTO `introducer` VALUES ('1206283','ADIB ISLAM KHAN','1700000007','sultan.d@gmail.com','',''),('1406320','MD. TARIQUL ALAM','1700000002','sultan.al@gmail.com','',''),('1903577','S.M.TANVEER HASAN','1700000005','sultan.e@gmail.com','',''),('2009679','MOHAMMAD JASHED ALAM','1700000000','sultan.alam@gmail.com','',''),('2009680','Md. Mosarraf Hossain ','1700000001','sultan.ala@gmail.com','',''),('2106766','Md. Mehdi Hasan','1700000008','sultan.f@gmail.com','',''),('2106767','PRITOM ROY','1700000009','sultan.g@gmail.com','',''),('2106768','MOHAMMED RASEL','1700000010','sultan.h@gmail.com','',''),('2109780','MOHAMMAD SHAMIM PARVEZ','1700000003','sultan.a@gmail.com','',''),('2109781','UZZAL KUMAR ROY','1700000004','sultan.b@gmail.com','',''),('2111794','MD FAHIM AL - RASHID','1700000012','sultan.j@gmail.com','',''),('2111796','Mufti Mejbaur Rahman','1700000020','sultan.k@gmail.com','',''),('2303912','MOHAMMAD NABI HOSSAIN','1700000006','sultan.c@gmail.com','','');
/*!40000 ALTER TABLE `introducer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joint_account`
--

DROP TABLE IF EXISTS `joint_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `joint_account` (
  `joint_account_number` varchar(8) NOT NULL,
  `title` varchar(2) DEFAULT NULL,
  `spouse_name` varchar(30) DEFAULT NULL,
  `mother_name` varchar(30) DEFAULT NULL,
  `father_name` varchar(30) DEFAULT NULL,
  `permanent_address` varchar(70) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `phone_number` varchar(12) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `occupation` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `nationality` varchar(30) DEFAULT NULL,
  `photo` varchar(16) DEFAULT NULL,
  `signature` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`joint_account_number`),
  UNIQUE KEY `joint_account_number_UNIQUE` (`joint_account_number`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `photo_UNIQUE` (`photo`),
  UNIQUE KEY `signature_UNIQUE` (`signature`),
  CONSTRAINT `bo_number` FOREIGN KEY (`joint_account_number`) REFERENCES `bo_account` (`bo_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joint_account`
--

LOCK TABLES `joint_account` WRITE;
/*!40000 ALTER TABLE `joint_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `joint_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kyc`
--

DROP TABLE IF EXISTS `kyc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kyc` (
  `bo_account_num` varchar(16) NOT NULL,
  `account_name` varchar(30) DEFAULT NULL,
  `type_of_account` varchar(2) DEFAULT NULL,
  `intro_name` varchar(30) DEFAULT NULL,
  `source_of_fund` varchar(120) DEFAULT NULL,
  `passport_num` varchar(18) DEFAULT NULL,
  `tin_num` varchar(12) DEFAULT NULL,
  `var_reg_no` varchar(45) DEFAULT NULL,
  `driving_license_no` varchar(15) DEFAULT NULL,
  `signature` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`bo_account_num`),
  UNIQUE KEY `bo_account_num_UNIQUE` (`bo_account_num`),
  UNIQUE KEY `tin_num_UNIQUE` (`tin_num`),
  UNIQUE KEY `passport_num_UNIQUE` (`passport_num`),
  UNIQUE KEY `driving_license_no_UNIQUE` (`driving_license_no`),
  UNIQUE KEY `var_reg_no_UNIQUE` (`var_reg_no`),
  UNIQUE KEY `signature_UNIQUE` (`signature`),
  CONSTRAINT `kyc_bo_number` FOREIGN KEY (`bo_account_num`) REFERENCES `bo_account` (`bo_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kyc`
--

LOCK TABLES `kyc` WRITE;
/*!40000 ALTER TABLE `kyc` DISABLE KEYS */;
/*!40000 ALTER TABLE `kyc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minor`
--

DROP TABLE IF EXISTS `minor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `minor` (
  `minor_id` varchar(8) NOT NULL,
  `Guardian_first_name` varchar(15) DEFAULT NULL,
  `guardian_last_name` varchar(15) DEFAULT NULL,
  `guardian_relationship` varchar(20) DEFAULT NULL,
  `minor_dob` date DEFAULT NULL,
  `minor_maturity_date` date DEFAULT NULL,
  `guardian_address` varchar(70) DEFAULT NULL,
  `guardian_city` varchar(30) DEFAULT NULL,
  `guardian_post_code` varchar(5) DEFAULT NULL,
  `guardian_state` varchar(20) DEFAULT NULL,
  `guardian_country` varchar(45) DEFAULT NULL,
  `guardian_telephone` varchar(9) DEFAULT NULL,
  `guardian_mobile` varchar(12) DEFAULT NULL,
  `guardian_fax` varchar(12) DEFAULT NULL,
  `guardian_email` varchar(50) DEFAULT NULL,
  `guardian_passport_num` varchar(18) DEFAULT NULL,
  `guardian_passport_issue_place` varchar(20) DEFAULT NULL,
  `guardian_passport_issue_date` date DEFAULT NULL,
  `guardian_passport_expiry_date` date DEFAULT NULL,
  `guardian_residency` varchar(45) DEFAULT NULL,
  `guardian_nationality` varchar(20) DEFAULT NULL,
  `guardian_dob` date DEFAULT NULL,
  `guardian_photo` varchar(16) DEFAULT NULL,
  `guardian_signature` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`minor_id`),
  UNIQUE KEY `minor_id_UNIQUE` (`minor_id`),
  UNIQUE KEY `guardian_passport_num_UNIQUE` (`guardian_passport_num`),
  UNIQUE KEY `guardian_photo_UNIQUE` (`guardian_photo`),
  UNIQUE KEY `guardian_signature_UNIQUE` (`guardian_signature`),
  CONSTRAINT `minor_bo_num` FOREIGN KEY (`minor_id`) REFERENCES `bo_account` (`bo_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minor`
--

LOCK TABLES `minor` WRITE;
/*!40000 ALTER TABLE `minor` DISABLE KEYS */;
/*!40000 ALTER TABLE `minor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nominee`
--

DROP TABLE IF EXISTS `nominee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nominee` (
  `account_number` varchar(8) NOT NULL,
  `title` varchar(3) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `address` varchar(70) DEFAULT NULL,
  `phone_number` varchar(11) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `post_code` varchar(4) DEFAULT NULL,
  `nid` varchar(10) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  PRIMARY KEY (`account_number`),
  UNIQUE KEY `nid_UNIQUE` (`nid`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nominee`
--

LOCK TABLES `nominee` WRITE;
/*!40000 ALTER TABLE `nominee` DISABLE KEYS */;
/*!40000 ALTER TABLE `nominee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `power_of_attorney`
--

DROP TABLE IF EXISTS `power_of_attorney`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `power_of_attorney` (
  `bo_number` varchar(16) NOT NULL,
  `CDBL_account_no` varchar(45) DEFAULT NULL,
  `name_of_account_holder` varchar(30) DEFAULT NULL,
  `attorney_name` varchar(30) DEFAULT NULL,
  `attorney_address` varchar(70) DEFAULT NULL,
  `attorney_number` varchar(11) DEFAULT NULL,
  `attorney_passport_no` varchar(18) DEFAULT NULL,
  `attorney_country` varchar(20) DEFAULT NULL,
  `attorney_nationality` varchar(20) DEFAULT NULL,
  `attorney_dob` date DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  PRIMARY KEY (`bo_number`),
  UNIQUE KEY `bo_number_UNIQUE` (`bo_number`),
  UNIQUE KEY `CDBL_account_no_UNIQUE` (`CDBL_account_no`),
  UNIQUE KEY `attorney_passport_no_UNIQUE` (`attorney_passport_no`),
  UNIQUE KEY `attorney_number_UNIQUE` (`attorney_number`),
  CONSTRAINT `kyc_bo_no` FOREIGN KEY (`bo_number`) REFERENCES `bo_account` (`bo_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_of_attorney`
--

LOCK TABLES `power_of_attorney` WRITE;
/*!40000 ALTER TABLE `power_of_attorney` DISABLE KEYS */;
/*!40000 ALTER TABLE `power_of_attorney` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relationship_manager`
--

DROP TABLE IF EXISTS `relationship_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relationship_manager` (
  `employee_id` varchar(10) NOT NULL,
  `phone_number` varchar(12) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `nid` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `nationality` varchar(20) DEFAULT NULL,
  `photo` varchar(16) DEFAULT NULL,
  `signature` varchar(16) DEFAULT NULL,
  `head_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_id_UNIQUE` (`employee_id`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `nid_UNIQUE` (`nid`),
  UNIQUE KEY `signature_UNIQUE` (`signature`),
  UNIQUE KEY `photo_UNIQUE` (`photo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relationship_manager`
--

LOCK TABLES `relationship_manager` WRITE;
/*!40000 ALTER TABLE `relationship_manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `relationship_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `value_added_service`
--

DROP TABLE IF EXISTS `value_added_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `value_added_service` (
  `account_number` varchar(8) NOT NULL,
  `internet_trading` varchar(20) DEFAULT NULL,
  `SE` varchar(3) DEFAULT NULL,
  `order_management_system` tinyint DEFAULT NULL,
  `SMS_service` tinyint DEFAULT NULL,
  `email_service` tinyint DEFAULT NULL,
  PRIMARY KEY (`account_number`),
  UNIQUE KEY `account_number_UNIQUE` (`account_number`),
  CONSTRAINT `vas_account_number` FOREIGN KEY (`account_number`) REFERENCES `client` (`account_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `value_added_service`
--

LOCK TABLES `value_added_service` WRITE;
/*!40000 ALTER TABLE `value_added_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `value_added_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workers_under_head`
--

DROP TABLE IF EXISTS `workers_under_head`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workers_under_head` (
  `head_id` varchar(10) NOT NULL,
  `worker_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`head_id`),
  UNIQUE KEY `head_id_UNIQUE` (`head_id`),
  UNIQUE KEY `worker_id_UNIQUE` (`worker_id`),
  CONSTRAINT `hos_id` FOREIGN KEY (`head_id`) REFERENCES `head_of_settlement` (`employee_id`),
  CONSTRAINT `rm_id` FOREIGN KEY (`worker_id`) REFERENCES `relationship_manager` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workers_under_head`
--

LOCK TABLES `workers_under_head` WRITE;
/*!40000 ALTER TABLE `workers_under_head` DISABLE KEYS */;
/*!40000 ALTER TABLE `workers_under_head` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-03 18:48:34
