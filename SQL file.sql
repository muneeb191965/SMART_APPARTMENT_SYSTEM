CREATE DATABASE  IF NOT EXISTS `smartapartmentdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `smartapartmentdb`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: smartapartmentdb
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `apartment`
--

DROP TABLE IF EXISTS `apartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apartment` (
  `flat_id` varchar(50) NOT NULL,
  `flat_number` varchar(10) DEFAULT NULL,
  `floor_number` int DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `rent_amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `building_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`flat_id`),
  KEY `building_id` (`building_id`),
  CONSTRAINT `apartment_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartment`
--

LOCK TABLES `apartment` WRITE;
/*!40000 ALTER TABLE `apartment` DISABLE KEYS */;
INSERT INTO `apartment` VALUES ('F1','1',1,'2BHK',35000.00,'Occupied','B1'),('F10','2',1,'3BHK',55000.00,'Occupied','B2'),('F11','3',2,'2BHK',36000.00,'Occupied','B2'),('F12','4',2,'3BHK',62000.00,'Occupied','B2'),('F13','5',3,'2BHK',30000.00,'Vacant','B2'),('F14','6',3,'3BHK',70000.00,'Vacant','B2'),('F15','1',1,'3BHK',65000.00,'Occupied','B3'),('F16','2',1,'2BHK',48000.00,'Occupied','B3'),('F17','3',2,'3BHK',60000.00,'Occupied','B3'),('F18','4',2,'2BHK',39000.00,'Occupied','B3'),('F19','5',3,'3BHK',70000.00,'Occupied','B3'),('F2','2',1,'2BHK',40000.00,'Occupied','B1'),('F20','6',3,'2BHK',34000.00,'Occupied','B3'),('F21','7',4,'2BHK',31000.00,'Vacant','B3'),('F22','8',4,'3BHK',68000.00,'Vacant','B3'),('F23','9',5,'2BHK',33000.00,'Vacant','B3'),('F24','10',5,'3BHK',69000.00,'Vacant','B3'),('F3','3',2,'3BHK',50000.00,'Occupied','B1'),('F4','4',2,'2BHK',38000.00,'Occupied','B1'),('F5','5',3,'3BHK',60000.00,'Occupied','B1'),('F6','6',3,'2BHK',45000.00,'Vacant','B1'),('F7','7',4,'2BHK',32000.00,'Vacant','B1'),('F8','8',4,'3BHK',65000.00,'Vacant','B1'),('F9','1',1,'2BHK',42000.00,'Occupied','B2');
/*!40000 ALTER TABLE `apartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `bill_id` varchar(50) NOT NULL,
  `resident_id` varchar(50) DEFAULT NULL,
  `flat_id` varchar(50) DEFAULT NULL,
  `rent_amount` decimal(10,2) DEFAULT NULL,
  `maintenance_charges` decimal(10,2) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `bill_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `resident_id` (`resident_id`),
  KEY `flat_id` (`flat_id`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`resident_id`) REFERENCES `resident` (`resident_id`),
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`flat_id`) REFERENCES `apartment` (`flat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES ('Bill1','R1','F1',35000.00,3000.00,38000.00,'2026-04-01','2026-04-10','Paid'),('Bill10','R10','F15',65000.00,3000.00,68000.00,'2026-04-01','2026-04-10','Paid'),('Bill11','R11','F16',48000.00,3000.00,51000.00,'2026-04-01','2026-04-10','Paid'),('Bill12','R12','F17',60000.00,3000.00,63000.00,'2026-04-01','2026-04-10','Paid'),('Bill13','R13','F18',39000.00,3000.00,42000.00,'2026-04-01','2026-04-10','Paid'),('Bill14','R14','F19',70000.00,3000.00,73000.00,'2026-04-01','2026-04-10','Paid'),('Bill15','R15','F20',34000.00,3000.00,37000.00,'2026-04-01','2026-04-10','Paid'),('Bill2','R2','F2',40000.00,3000.00,43000.00,'2026-04-01','2026-04-10','Paid'),('Bill3','R3','F3',50000.00,3000.00,53000.00,'2026-04-01','2026-04-10','Pending'),('Bill4','R4','F4',38000.00,3000.00,41000.00,'2026-04-01','2026-04-10','Paid'),('Bill5','R5','F5',60000.00,3000.00,63000.00,'2026-04-01','2026-04-10','Pending'),('Bill6','R6','F9',42000.00,3000.00,45000.00,'2026-04-01','2026-04-10','Paid'),('Bill7','R7','F10',55000.00,3000.00,58000.00,'2026-04-01','2026-04-10','Paid'),('Bill8','R8','F11',36000.00,3000.00,39000.00,'2026-04-01','2026-04-10','Paid'),('Bill9','R9','F12',62000.00,3000.00,65000.00,'2026-04-01','2026-04-10','Pending');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `building_id` varchar(50) NOT NULL,
  `building_name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `total_flats` int DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  PRIMARY KEY (`building_id`),
  KEY `owner_id` (`owner_id`),
  CONSTRAINT `building_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES ('B1','Sunrise Apartments','Karachi, Sindh',8,1),('B2','Moonlight Residency','Karachi, Sindh',6,1),('B3','Galaxy Heights','Karachi, Sindh',10,1),('B4','moon lights','sukkur,sindh',7,1);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `owner`
--

DROP TABLE IF EXISTS `owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `owner` (
  `owner_id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `owner`
--

LOCK TABLES `owner` WRITE;
/*!40000 ALTER TABLE `owner` DISABLE KEYS */;
INSERT INTO `owner` VALUES (1,'Ali Raza','+923001234567','ali.raza@gmail.com','aliadmin','admin123');
/*!40000 ALTER TABLE `owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` varchar(50) NOT NULL,
  `bill_id` varchar(50) DEFAULT NULL,
  `resident_id` varchar(50) DEFAULT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `bill_id` (`bill_id`),
  KEY `resident_id` (`resident_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill` (`bill_id`),
  CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`resident_id`) REFERENCES `resident` (`resident_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('17','Bill1','R15',50000.00,'2026-04-20','Paid'),('P1','Bill1','R1',38000.00,'2026-04-02','Paid'),('P10','Bill14','R14',73000.00,'2026-04-08','Paid'),('P1776925378848','Bill1','R12',50000.00,'2026-04-20','Paid'),('P1777263249644','Bill1','R13',50000.00,'2026-04-20','Paid'),('P2','Bill2','R2',43000.00,'2026-04-03','Paid'),('P3','Bill4','R4',41000.00,'2026-04-04','Paid'),('P4','Bill6','R6',45000.00,'2026-04-02','Paid'),('P5','Bill7','R7',58000.00,'2026-04-03','Paid'),('P6','Bill8','R8',39000.00,'2026-04-04','Paid'),('P7','Bill10','R10',68000.00,'2026-04-05','Paid'),('P8','Bill11','R11',51000.00,'2026-04-06','Paid'),('P9','Bill12','R12',63000.00,'2026-04-07','Paid');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resident`
--

DROP TABLE IF EXISTS `resident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resident` (
  `resident_id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `CNIC` varchar(20) DEFAULT NULL,
  `flat_id` varchar(50) DEFAULT NULL,
  `move_in_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`resident_id`),
  KEY `flat_id` (`flat_id`),
  CONSTRAINT `resident_ibfk_1` FOREIGN KEY (`flat_id`) REFERENCES `apartment` (`flat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resident`
--

LOCK TABLES `resident` WRITE;
/*!40000 ALTER TABLE `resident` DISABLE KEYS */;
INSERT INTO `resident` VALUES ('R1','Ahmed Khan','+923214567890','ahmed.khan@gmail.com','35201-1234567-1','F1','2025-01-10','Active','resR1'),('R10','Zain Ali','+923004567899','zain.ali@gmail.com','35210-0123456-0','F15','2025-01-05','Active','resR10'),('R11','Imran Shah','+923214567800','imran.shah@gmail.com','35211-1123456-1','F16','2025-01-18','Active','resR11'),('R12','Noman Raza','+923334567801','noman.raza@gmail.com','35212-2123456-2','F17','2025-02-12','Active','resR12'),('R13','Kashif Ali','+923114567802','kashif.ali@gmail.com','35213-3123456-3','F18','2025-02-20','Active','resR13'),('R14','Shahzaib Khan','+923214567803','shahzaib.khan@gmail.com','35214-4123456-4','F19','2025-03-01','Active','resR14'),('R15','Danish Ahmed','+923004567804','danish.ahmed@gmail.com','35215-5123456-5','F20','2025-03-10','Active','resR15'),('R16','imran','032165489090','imran@gmail.com','45104-4838629-9','F24','2026-04-20','Active','resR16'),('R2','Ali Hassan','+923334567891','ali.hassan@gmail.com','35202-2345678-2','F2','2025-01-12','Active','resR2'),('R3','Usman Ali','+923114567892','usman.ali@gmail.com','35203-3456789-3','F3','2025-02-01','Active','resR3'),('R4','Hassan Raza','+923214567893','hassan.raza@gmail.com','35204-4567890-4','F4','2025-02-05','Active','resR4'),('R5','Bilal Ahmed','+923004567894','bilal.ahmed@gmail.com','35205-5678901-5','F5','2025-03-01','Active','resR5'),('R6','Saad Malik','+923214567895','saad.malik@gmail.com','35206-6789012-6','F9','2025-01-15','Active','resR6'),('R7','Fahad Iqbal','+923334567896','fahad.iqbal@gmail.com','35207-7890123-7','F10','2025-01-20','Active','resR7'),('R8','Hamza Khan','+923114567897','hamza.khan@gmail.com','35208-8901234-8','F11','2025-02-10','Active','resR8'),('R9','Adeel Ahmed','+923214567898','adeel.ahmed@gmail.com','35209-9012345-9','F12','2025-02-15','Active','resR9');
/*!40000 ALTER TABLE `resident` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-07  2:37:25
