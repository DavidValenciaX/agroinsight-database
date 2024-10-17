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
-- Dumping data for table `tipo_labor_cultural`
--

LOCK TABLES `tipo_labor_cultural` WRITE;
/*!40000 ALTER TABLE `tipo_labor_cultural` DISABLE KEYS */;
INSERT INTO `tipo_labor_cultural` (`id`, `nombre`, `descripcion`, `fecha_creacion`, `fecha_modificacion`) VALUES (1,'Preparación del suelo','Actividades destinadas a preparar el suelo para la siembra, incluyendo labranza, arado y nivelación.','2024-10-11 08:35:00',NULL),(2,'Siembra','Proceso de colocar las semillas en el suelo en las condiciones adecuadas para su germinación y crecimiento.','2024-10-11 08:35:00',NULL),(3,'Fertilización','Aplicación de nutrientes al suelo para promover el crecimiento saludable de las plantas.','2024-10-11 08:35:00',NULL),(4,'Riego','Suministro de agua a los cultivos para mantener una adecuada humedad del suelo.','2024-10-11 08:35:00',NULL),(5,'Control de plagas','Acciones para prevenir y eliminar plagas que afectan los cultivos.','2024-10-11 08:35:00',NULL),(6,'Control de malezas','Eliminación de plantas no deseadas que compiten con los cultivos por recursos.','2024-10-11 08:35:00',NULL),(7,'Cosecha','Recolección de los cultivos maduros para su posterior procesamiento o venta.','2024-10-11 08:35:00',NULL),(8,'Secado','Reducción del contenido de humedad de los productos cosechados para prevenir la proliferación de microorganismos y facilitar el almacenamiento.','2024-10-11 08:35:00',NULL),(9,'Limpieza','Eliminación de residuos, tierra y otras impurezas de los productos cosechados para mejorar su calidad y preparar para el almacenamiento o procesamiento.','2024-10-11 08:35:00',NULL),(10,'Clasificación y selección','Separación de los productos según su calidad, tamaño o estado para asegurar una mejor presentación y valor en el mercado.','2024-10-11 08:35:00',NULL),(11,'Almacenamiento','Acondicionamiento y conservación de los productos cosechados en condiciones óptimas de temperatura, humedad y ventilación para mantener su calidad.','2024-10-11 08:35:00',NULL),(12,'Empaque','Embalaje de los productos agrícolas para protegerlos durante el transporte y mejorar su comercialización.','2024-10-11 08:35:00',NULL),(13,'Transporte','Movimiento de los productos desde el lugar de cosecha o almacenamiento hasta los mercados o lugares de procesamiento.','2024-10-11 08:35:00',NULL),(14,'Tratamiento post-cosecha','Aplicación de tratamientos específicos para prolongar la vida útil de los productos, como el uso de fungicidas, recubrimientos protectores o atmósfera controlada.','2024-10-11 08:35:00',NULL),(15,'Rotación de cultivos','Práctica de alternar diferentes tipos de cultivos en el mismo terreno para mejorar la salud del suelo.','2024-10-11 08:35:00',NULL),(16,'Monitoreo fitosanitario','Vigilancia sistemática de la salud de los cultivos, orientada a la detección temprana de plagas, enfermedades y otros factores fitosanitarios que puedan afectar a las plantas.','2024-10-11 08:35:00',NULL),(17,'Labranza','Trabajo del suelo mediante herramientas o maquinaria para prepararlo para la siembra.','2024-10-11 08:35:00',NULL),(18,'Arado','Proceso de romper y girar el suelo para facilitar la aireación y el drenaje.','2024-10-11 08:35:00',NULL),(19,'Rastrillado','Uso de herramientas para nivelar el suelo y eliminar restos de cultivos anteriores.','2024-10-11 08:35:00',NULL),(20,'Compactación','Proceso de presionar el suelo para mejorar su estructura y capacidad de retención de agua.','2024-10-11 08:35:00',NULL),(21,'Aplicación de herbicidas','Uso de productos químicos para eliminar malezas de manera eficiente.','2024-10-11 08:35:00',NULL),(22,'Aplicación de pesticidas','Uso de sustancias para controlar y eliminar plagas que dañan los cultivos.','2024-10-11 08:35:00',NULL),(23,'Aplicación de fungicidas','Uso de productos para prevenir y tratar enfermedades fúngicas en las plantas.','2024-10-11 08:35:00',NULL),(24,'Fertilización orgánica','Uso de materiales orgánicos como compost o estiércol para enriquecer el suelo.','2024-10-11 08:35:00',NULL),(25,'Fertilización química','Aplicación de fertilizantes sintéticos para aportar nutrientes específicos al suelo.','2024-10-11 08:35:00',NULL),(26,'Siembra directa','Método de siembra sin labranza previa, conservando la estructura del suelo.','2024-10-11 08:35:00',NULL),(27,'Siembra manual','Colocación de semillas en el suelo de manera manual.','2024-10-11 08:35:00',NULL),(28,'Siembra mecanizada','Uso de maquinaria para la siembra eficiente de grandes áreas.','2024-10-11 08:35:00',NULL),(29,'Riego por aspersión','Sistema de riego que distribuye el agua en forma de lluvia sobre los cultivos.','2024-10-11 08:35:00',NULL),(30,'Riego por goteo','Método de riego que suministra agua directamente a la base de cada planta.','2024-10-11 08:35:00',NULL),(31,'Riego por inundación','Riego que inunda el terreno con agua para asegurar la humedad necesaria.','2024-10-11 08:35:00',NULL),(32,'Control biológico de plagas','Uso de organismos vivos para controlar poblaciones de plagas.','2024-10-11 08:35:00',NULL),(33,'Deshierbe manual','Eliminación de malezas de forma manual para mantener el cultivo limpio.','2024-10-11 08:35:00',NULL),(34,'Deshierbe mecánico','Uso de maquinaria para eliminar las malezas de manera rápida y eficiente.','2024-10-11 08:35:00',NULL),(35,'Cosecha manual','Recolección de cultivos utilizando herramientas y mano de obra humana.','2024-10-11 08:35:00',NULL),(36,'Cosecha mecanizada','Recolección de cultivos mediante maquinaria especializada.','2024-10-11 08:35:00',NULL),(37,'Análisis de suelo','Examen detallado de las características del suelo para mejorar su gestión.','2024-10-11 08:35:00',NULL),(38,'Manejo de residuos agrícolas','Gestión adecuada de los desechos generados en las actividades agrícolas.','2024-10-11 08:35:00',NULL);
/*!40000 ALTER TABLE `tipo_labor_cultural` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14  0:00:39
