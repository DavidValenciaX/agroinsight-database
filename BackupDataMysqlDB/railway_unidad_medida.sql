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
-- Dumping data for table `unidad_medida`
--

LOCK TABLES `unidad_medida` WRITE;
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
INSERT INTO `unidad_medida` (`id`, `nombre`, `abreviatura`, `categoria_id`, `fecha_creacion`, `fecha_modificacion`) VALUES (1,'Metro','m',1,'2024-10-11 08:35:00',NULL),(2,'Kilómetro','km',1,'2024-10-11 08:35:00',NULL),(3,'Centímetro','cm',1,'2024-10-11 08:35:00',NULL),(4,'Milímetro','mm',1,'2024-10-11 08:35:00',NULL),(5,'Pulgada','in',1,'2024-10-11 08:35:00',NULL),(6,'Pie','ft',1,'2024-10-11 08:35:00',NULL),(7,'Metro cuadrado','m²',2,'2024-10-11 08:35:00',NULL),(8,'Kilómetro cuadrado','km²',2,'2024-10-11 08:35:00',NULL),(9,'Hectárea','ha',2,'2024-10-11 08:35:00',NULL),(10,'Acre','ac',2,'2024-10-11 08:35:00',NULL),(11,'Litro','L',3,'2024-10-11 08:35:00',NULL),(12,'Mililitro','mL',3,'2024-10-11 08:35:00',NULL),(13,'Metro cúbico','m³',3,'2024-10-11 08:35:00',NULL),(14,'Galón','gal',3,'2024-10-11 08:35:00',NULL),(15,'Kilogramo','kg',4,'2024-10-11 08:35:00',NULL),(16,'Gramo','g',4,'2024-10-11 08:35:00',NULL),(17,'Tonelada','t',4,'2024-10-11 08:35:00',NULL),(18,'Libra','lb',4,'2024-10-11 08:35:00',NULL),(19,'Segundo','s',5,'2024-10-11 08:35:00',NULL),(20,'Minuto','min',5,'2024-10-11 08:35:00',NULL),(21,'Hora','h',5,'2024-10-11 08:35:00',NULL),(22,'Día','d',5,'2024-10-11 08:35:00',NULL),(23,'Grado Celsius','°C',6,'2024-10-11 08:35:00',NULL),(24,'Grado Fahrenheit','°F',6,'2024-10-11 08:35:00',NULL),(25,'Kelvin','K',6,'2024-10-11 08:35:00',NULL);
/*!40000 ALTER TABLE `unidad_medida` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14  0:00:25
