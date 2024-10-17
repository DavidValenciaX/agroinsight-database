-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: autorack.proxy.rlwy.net    Database: railway
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Dumping data for table `usuario_finca_rol`
--

LOCK TABLES `usuario_finca_rol` WRITE;
/*!40000 ALTER TABLE `usuario_finca_rol` DISABLE KEYS */;
INSERT INTO `usuario_finca_rol` (`id`, `usuario_id`, `finca_id`, `rol_id`, `fecha_creacion`, `fecha_modificacion`) VALUES (77,4,9,1,'2024-09-27 19:43:28',NULL),(78,4,10,1,'2024-09-28 15:37:52',NULL),(79,4,12,1,'2024-10-03 20:37:06',NULL),(80,4,15,1,'2024-10-09 19:26:20',NULL),(81,4,16,1,'2024-10-09 19:27:33',NULL),(82,4,17,1,'2024-10-09 19:29:28',NULL),(83,4,18,1,'2024-10-09 19:33:54',NULL),(84,15,9,2,'2024-10-03 20:05:52',NULL),(85,15,11,2,'2024-10-03 20:37:03',NULL),(86,15,13,2,'2024-10-03 20:40:25',NULL),(87,16,9,2,'2024-10-03 20:06:51',NULL),(88,16,10,2,'2024-10-03 19:52:02',NULL),(89,16,11,2,'2024-10-03 20:37:42',NULL),(90,16,13,2,'2024-10-03 20:40:25',NULL),(91,23,10,1,'2024-10-03 18:09:09',NULL),(92,25,10,1,'2024-10-03 19:18:42',NULL),(93,28,11,1,'2024-10-03 20:35:16',NULL),(94,28,13,1,'2024-10-03 20:39:33',NULL),(95,29,14,1,'2024-10-03 20:39:49',NULL);
/*!40000 ALTER TABLE `usuario_finca_rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14  0:00:14
