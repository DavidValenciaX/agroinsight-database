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
-- Dumping data for table `finca`
--

LOCK TABLES `finca` WRITE;
/*!40000 ALTER TABLE `finca` DISABLE KEYS */;
INSERT INTO `finca` (`id`, `nombre`, `ubicacion`, `area_total`, `unidad_area_id`, `fecha_creacion`, `fecha_modificacion`) VALUES (9,'La Chiquis','Fortalecillas',75.00,9,'2024-09-27 19:43:28',NULL),(10,'La Deissy','Neiva',521.00,7,'2024-09-28 15:37:52',NULL),(11,'PetaFarm','Usco',100.00,7,'2024-10-03 20:35:16',NULL),(12,'Finca 32','ulloa',1752.00,9,'2024-10-03 20:37:06',NULL),(13,'GuguFarm','Huila',100.00,9,'2024-10-03 20:39:33',NULL),(14,'Finca','Ndkd',556.00,7,'2024-10-03 20:39:49',NULL),(15,'La maría','La Ulloa,Neiva',5184.00,9,'2024-10-09 19:26:20',NULL),(16,'Prueba 2','Neiva',218.00,9,'2024-10-09 19:27:33',NULL),(17,'Prueba 21','Neiva',2184.00,9,'2024-10-09 19:29:28',NULL),(18,'Lora','Neiva',21.00,9,'2024-10-09 19:33:54',NULL);
/*!40000 ALTER TABLE `finca` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14  0:00:46
