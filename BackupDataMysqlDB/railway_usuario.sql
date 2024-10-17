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
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `nombre`, `apellido`, `email`, `password`, `failed_attempts`, `locked_until`, `state_id`, `fecha_creacion`, `fecha_modificacion`) VALUES (2,'Alejandro ','García Pimentel','alejandrogarcia@yopmail.com','$2b$12$D18RqEUxSFkliQLBb3qjleQpLT1dnxDHkTcjvYiutZ0uClUz76yzO',0,NULL,1,'2024-09-12 19:28:40',NULL),(3,'Alejandro','Garcia Pimentel','alejogarcia@yopmail.com','$2b$12$TbqTBb0340PYJrBRuKH.RuWwufx2iGqhGJXXao7KIXAY2Rq5teC.K',0,NULL,1,'2024-09-12 19:43:09',NULL),(4,'Alejandro','García Pimentel','sergio.garcia@usco.edu.co','$2b$12$rl5s2wRn.XRRjkImCmvmR.1A6DPzgeW8PATtunF1cdX/oZK9x9Iw.',0,NULL,1,'2024-09-16 05:21:58',NULL),(7,'Ana Sofia','Garcia Pimentel','anasofia@yopmail.com','$2b$12$9abOtfrinXmp.LBqxBSg1upJZ1M4NfHdWyq2GeLKrGGV0wQLUaRba',0,NULL,1,'2024-09-21 22:05:47',NULL),(9,'Oswaldo ','García Villalba','oswaldogarcia@yopmail.com','$2b$12$vsz.vZB6sbgLsk7tuirt/e3R7ncIu.gXUo4MJqCuxIvHTPeHsridS',0,NULL,1,'2024-09-21 22:15:16',NULL),(10,'Yudy','Pimentel Rodríguez ','Yupiro15@gmail.com','$2b$12$WNv0t8Dd3p9is.Nb5aU1DucmlajvuDXw7Q.o/ae9wsF4SbbCME3.O',0,NULL,1,'2024-09-21 22:37:17',NULL),(14,'Ana ','Morales','anasofiadavid3@gmail.com','$2b$12$kzInqNUTUHuviPPw21SRVuML5D.DF496LdPGcSVNikwTnCFiOC8OS',0,NULL,1,'2024-09-22 03:43:08',NULL),(15,'Aura Cristina','Lopez Carabali','auracristonalopez@gmail.com','$2b$12$1igDh7LfQMtw6oV.IxNt9.Bg3tU0kFxd18GWfAkab6JD7HAuSeqza',0,NULL,1,'2024-09-22 17:16:15',NULL),(16,'Maritza','Lozano','deissymlr@gmail.com','$2b$12$uGVf12HXMIgfxL1oYEAzZeqWKK3vJtx3.4FFSnR6gEHqHBm54XRfu',0,NULL,1,'2024-09-24 03:59:10',NULL),(17,'Sergio','Garcia','sagp2004@gmail.com','$2b$12$1SwiuBPPEHntWh5E3hTeLO/VFce7NlVuGz2kqlxRs6uqeLsotX5SC',0,NULL,1,'2024-09-24 04:28:26',NULL),(23,'Alejandro Trabajador','Garcia','u20202191161@usco.edu.co','$2b$12$1vWa4ThPISJQHg5e9F2fk.NjDgcQY1pBMCnZihd9Iv/uJulhLi2.O',0,NULL,1,'2024-10-03 03:27:02',NULL),(25,'Juan','Gomez','juandavid12gomez@gmail.com','$2b$12$LAsBhpP6qe02IRB.H9dSmOo0EPvxrD2Ig59IWHcUDZ1hmBp4k0Wbm',0,NULL,1,'2024-10-03 19:03:57',NULL),(28,'Diego','Carvajal','jdco.ayco1010@gmail.com','$2b$12$Q748b3zSz1XEAO7a8UWb9OamNBdrP7YM.LmuRogvo/CAC.MUY7SLu',0,NULL,1,'2024-10-03 19:44:25',NULL),(29,'Natalia ','Rodríguez ','natyrm15173444@gmail.com','$2b$12$yIfvGRctUTOeXrN9RjtxZ..wRV4lg.k2SERn/T7f64xmg.GxJFfW6',3,'2024-10-05 06:36:27',3,'2024-10-03 19:58:10',NULL),(30,'Pepito ','Perez','daperdomosalas@gmail.com','$2b$12$rxdO.fIWZO9Ng8/yigSXV.Nu5.MO.8VIrKfH.NMZ9.ILjFxjS/Om2',0,NULL,1,'2024-10-03 20:04:08',NULL),(31,'Valen','Pola oso','valen.pol.os13@gmail.com','$2b$12$Ysh.Wuo6v1s3bS892yQOXes0EASiAFj6fp0nOvtAlT4VbDQPuiZP2',0,NULL,1,'2024-10-03 20:24:30',NULL),(32,'Sara','Duran','saraelissad@gmail.com','$2b$12$Wt9jnHZ4moBWgoyhMOzya.1Pgi6ganj.30i7I4iddIs4EAj6JKWUi',0,NULL,1,'2024-10-03 21:06:23',NULL),(33,'Dyl','Pin','u20202192371@usco.edu.co','$2b$12$tveOdUDQxHemwYK22JbP..BKgVa6WgMqC9p5vD5clr4uUsa1xtTjG',0,NULL,1,'2024-10-04 04:23:26',NULL),(34,'David','Oliveros','zenway15@gmail.com','$2b$12$E0uz0jpXZZSBFYBSv/MRrOBUhx4/libV6YomYZoker.vH23761GJi',0,NULL,1,'2024-10-04 20:21:01',NULL),(38,'Andres ','Paredes ','andres@yopmail.com','$2b$12$mM5vxg31ZVMHOyCGJZVwiOmTY18gF.AqgH6KgYxZ/.BmeEU.5FLoC',0,NULL,1,'2024-10-09 06:06:17',NULL),(43,'Sara','Duran','saraelisad@yopmail.com','$2b$12$4b0mwEbmJPWoorIgUPekP.tdiZEtAWMM.ltdJqUouX5Rh46wJG/oG',0,NULL,1,'2024-10-09 15:44:41',NULL),(45,'Weekend','Martinez ','weekend@yopmail.com','$2b$12$IOb.bzwvMUQyBWd4mJqe8e5tJXR9qK/ieBa3GJRCPm2fhdO8P8/Di',0,NULL,1,'2024-10-09 15:55:57',NULL),(46,'Sarampión ','Martinez','sarampion@yopmail.com','$2b$12$WNIk97HbHZAaHF3PnWCRr.YujxtiuQOvtjYjWwwIZRhXBOt2zZgzW',0,NULL,1,'2024-10-09 16:23:32',NULL),(47,'Pepito','Ramirez ','sarampion1@yopmail.com','$2b$12$vPdfGmWXsm8mqqJEqVFhAuOI77KVc.1.OBanq.Aei1FLg2sB3L0Wi',0,NULL,1,'2024-10-09 16:26:49',NULL),(54,'Salome','García ','warwick@yopmail.com','$2b$12$SRwZcJLxgzp/SCR19UAqPej1bC.MbjVZZZacCspJJTSxP9ZneBbGC',0,NULL,1,'2024-10-09 16:56:18',NULL),(56,'Mariana Alberta','Plumafloja','marianacachimba@yopmail.com','$2b$12$4DY6FrJxzlBgM3PsRZ3d8eNX66EYPxoPVmfPTTZbOoJtKj6ySItd2',0,NULL,1,'2024-10-09 17:45:20',NULL),(57,'Pedro','Martinez ','perro@yopmail.com','$2b$12$PCM36qiRMRGqAfBD35QCZ.f2zWpVLuO.Hl9PrJf5qwvCYe6quvUz6',0,NULL,1,'2024-10-09 17:52:37',NULL),(58,'Oscar david','Valencia alvarez','davidvalencia0526@gmail.com','$2b$12$qSTavxTBBPbokkrKXKSdNukAqCmgQ2yC/c5UYwn.79M29BA.Msku2',0,NULL,1,'2024-10-09 20:09:52',NULL),(60,'Juan ','Gomez','u20202193142@usco.edu.co','$2b$12$lfGbMzBKEMzoYNfwbZvRX.RCLWY1ZVVGEhKnffl3geu3mP6ZkUHsy',0,NULL,1,'2024-10-09 20:39:38',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-14  0:02:50
