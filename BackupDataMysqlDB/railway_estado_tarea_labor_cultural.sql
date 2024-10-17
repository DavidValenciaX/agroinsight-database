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
-- Dumping data for table `estado_tarea_labor_cultural`
--

LOCK TABLES `estado_tarea_labor_cultural` WRITE;
/*!40000 ALTER TABLE `estado_tarea_labor_cultural` DISABLE KEYS */;
INSERT INTO `estado_tarea_labor_cultural` (`id`, `nombre`, `descripcion`, `fecha_creacion`, `fecha_modificacion`) VALUES (1,'Programada','La tarea ha sido programada y está pendiente de inicio.','2024-10-11 08:35:00',NULL),(2,'En Progreso','La tarea está actualmente en ejecución.','2024-10-11 08:35:00',NULL),(3,'Completada','La tarea se ha completado exitosamente.','2024-10-11 08:35:00',NULL),(4,'Cancelada','La tarea ha sido cancelada y no se llevará a cabo.','2024-10-11 08:35:00',NULL),(5,'Pendiente','La tarea está pendiente de recursos o condiciones necesarias para su inicio.','2024-10-11 08:35:00',NULL),(6,'Retrasada','La tarea ha sufrido un retraso respecto a la programación original.','2024-10-11 08:35:00',NULL),(7,'Fallida','La tarea no se pudo completar debido a un error o problema.','2024-10-11 08:35:00',NULL),(8,'Revisada','La tarea ha sido revisada y aprobada para su ejecución.','2024-10-11 08:35:00',NULL),(9,'Aprobada','La tarea ha sido aprobada y está lista para ser iniciada.','2024-10-11 08:35:00',NULL),(10,'Postergada','La tarea ha sido postergada para una fecha futura.','2024-10-11 08:35:00',NULL),(11,'Finalizada','La tarea ha sido finalizada, incluyendo todas las actividades posteriores a su ejecución.','2024-10-11 08:35:00',NULL);
/*!40000 ALTER TABLE `estado_tarea_labor_cultural` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14  0:01:44
