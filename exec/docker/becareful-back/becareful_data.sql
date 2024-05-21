-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: k10a207.p.ssafy.io    Database: becareful
-- ------------------------------------------------------
-- Server version	8.0.32

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-17 18:11:44
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: k10a207.p.ssafy.io    Database: becareful_temp
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `crosswalk`
--

DROP TABLE IF EXISTS `crosswalk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crosswalk` (
                             `crosswalk_id` bigint NOT NULL AUTO_INCREMENT,
                             `intersection_id` bigint DEFAULT NULL,
                             `direction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `length` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `midpoint_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `midpoint_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `point_four` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `point_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `point_three` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `point_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `side_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `side_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             PRIMARY KEY (`crosswalk_id`),
                             KEY `FKm8bvbcal0xe533oiwfm0knywk` (`intersection_id`),
                             CONSTRAINT `FKm8bvbcal0xe533oiwfm0knywk` FOREIGN KEY (`intersection_id`) REFERENCES `intersection` (`intersection_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crosswalk`
--

LOCK TABLES `crosswalk` WRITE;
/*!40000 ALTER TABLE `crosswalk` DISABLE KEYS */;
INSERT INTO `crosswalk` VALUES (1,2217,'ntPdsgRmdrCs','36.39','37.5009944,127.0370510','37.5006845,127.0371854','37.5010030,127.0369890','37.5006670,127.0373100','37.5010350,127.0371290','37.5006320,127.0371510','언주역','도곡동'),(2,2217,'wtPdsgRmdrCs','24.85','37.5010894,127.0369561','37.50101015,127.036693254','37.5009881,127.0367011','37.5011104,127.0369442','37.5010322,127.0366854','37.5010684,127.0369680','강남역','선릉역'),(3,2217,'stPdsgRmdrCs','43.22','37.5008987,127.03668845','37.50053095,127.03684915','37.5005410,127.0368970','37.5009230,127.0367310','37.5005231,127.0368235','37.5009050,127.0366530','도곡동','언주역'),(4,2217,'etPdsgRmdrCs','20.67','37.5005211,127.0369521','37.50058035,127.0371737','37.5005692,127.0371769','37.5005340,127.0369442','37.5005915,127.0371705','37.5005082,127.0369600','선릉역','강남역');
/*!40000 ALTER TABLE `crosswalk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intersection`
--

DROP TABLE IF EXISTS `intersection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intersection` (
                                `intersection_id` bigint NOT NULL,
                                `intersection_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                PRIMARY KEY (`intersection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intersection`
--

LOCK TABLES `intersection` WRITE;
/*!40000 ALTER TABLE `intersection` DISABLE KEYS */;
INSERT INTO `intersection` VALUES (2217,'역삼역');
/*!40000 ALTER TABLE `intersection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
                          `report_id` bigint NOT NULL AUTO_INCREMENT,
                          `img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `report_detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-17 18:11:44
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: k10a207.p.ssafy.io    Database: becareful_test
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `crosswalk`
--

DROP TABLE IF EXISTS `crosswalk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crosswalk` (
                             `crosswalk_id` bigint NOT NULL AUTO_INCREMENT,
                             `direction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `length` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `midpoint_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `midpoint_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `point_four` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `point_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `point_three` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `point_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `side_one` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `side_two` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                             `intersection_id` bigint DEFAULT NULL,
                             PRIMARY KEY (`crosswalk_id`),
                             KEY `FKm8bvbcal0xe533oiwfm0knywk` (`intersection_id`),
                             CONSTRAINT `FKm8bvbcal0xe533oiwfm0knywk` FOREIGN KEY (`intersection_id`) REFERENCES `intersection` (`intersection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crosswalk`
--

LOCK TABLES `crosswalk` WRITE;
/*!40000 ALTER TABLE `crosswalk` DISABLE KEYS */;
/*!40000 ALTER TABLE `crosswalk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intersection`
--

DROP TABLE IF EXISTS `intersection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intersection` (
                                `intersection_id` bigint NOT NULL,
                                `intersectio_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `intersection_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                PRIMARY KEY (`intersection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intersection`
--

LOCK TABLES `intersection` WRITE;
/*!40000 ALTER TABLE `intersection` DISABLE KEYS */;
/*!40000 ALTER TABLE `intersection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
                          `report_id` bigint NOT NULL AUTO_INCREMENT,
                          `img_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
                          `report_detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                          PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trafficlight`
--

DROP TABLE IF EXISTS `trafficlight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trafficlight` (
                                `traffic_id` bigint NOT NULL,
                                `direction` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `endpoint` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `startpoint` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `stop_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `walk_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
                                `intersection_id` bigint DEFAULT NULL,
                                PRIMARY KEY (`traffic_id`),
                                KEY `FKdha8lgpkou9soxnj1tin4tn4d` (`intersection_id`),
                                CONSTRAINT `FKdha8lgpkou9soxnj1tin4tn4d` FOREIGN KEY (`intersection_id`) REFERENCES `intersection` (`intersection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trafficlight`
--

LOCK TABLES `trafficlight` WRITE;
/*!40000 ALTER TABLE `trafficlight` DISABLE KEYS */;
/*!40000 ALTER TABLE `trafficlight` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-17 18:11:44
