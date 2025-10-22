-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: justicia_verde
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `apoyos`
--

DROP TABLE IF EXISTS `apoyos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apoyos` (
  `id_apoyo` int NOT NULL AUTO_INCREMENT,
  `id_denuncia` int DEFAULT NULL,
  `id_org` int DEFAULT NULL,
  `id_tipo` int DEFAULT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci,
  `fecha_asignacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_apoyo`),
  KEY `id_denuncia` (`id_denuncia`),
  KEY `id_org` (`id_org`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `apoyos_ibfk_1` FOREIGN KEY (`id_denuncia`) REFERENCES `denuncias` (`id_denuncia`),
  CONSTRAINT `apoyos_ibfk_2` FOREIGN KEY (`id_org`) REFERENCES `organizaciones` (`id_org`),
  CONSTRAINT `apoyos_ibfk_3` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_apoyo` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apoyos`
--

LOCK TABLES `apoyos` WRITE;
/*!40000 ALTER TABLE `apoyos` DISABLE KEYS */;
INSERT INTO `apoyos` VALUES (1,1,1,1,'Asesoría jurídica para denuncia.','2025-10-11 23:19:20'),(2,2,2,2,'Apoyo psicológico a la comunidad.','2025-10-11 23:19:20'),(3,3,3,3,'Difusión en medios locales.','2025-10-11 23:19:20'),(4,1,2,3,'Apoyo a la denuncia por contaminación','2025-10-15 00:32:12'),(9,1,2,3,'Apoyo a la denuncia por contaminación','2025-10-15 00:35:05'),(10,1,2,3,'Apoyo a la denuncia por contaminación','2025-10-15 00:35:08'),(11,4,2,1,'La organización se compromete a brindar asesoría legal.','2025-10-15 02:23:38');
/*!40000 ALTER TABLE `apoyos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Contaminación ambiental'),(2,'Maltrato animal'),(3,'Deforestación'),(4,'Vertimiento ilegal'),(5,'Ruido excesivo'),(6,'Construcción irregular'),(7,'Caza o pesca ilegal');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `denuncias`
--

DROP TABLE IF EXISTS `denuncias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `denuncias` (
  `id_denuncia` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_general_ci NOT NULL,
  `ubicacion` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `latitud` decimal(10,7) DEFAULT NULL,
  `longitud` decimal(10,7) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int DEFAULT NULL,
  `id_estado` int DEFAULT '1',
  `id_categoria` int DEFAULT NULL,
  `categoria` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_denuncia`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_estado` (`id_estado`),
  KEY `fk_denuncia_categoria` (`id_categoria`),
  CONSTRAINT `denuncias_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `denuncias_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`),
  CONSTRAINT `fk_denuncia_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `denuncias`
--

LOCK TABLES `denuncias` WRITE;
/*!40000 ALTER TABLE `denuncias` DISABLE KEYS */;
INSERT INTO `denuncias` VALUES (1,'contaminacion','rios con petroleo','Avenida Central, Popayán',4.6500000,-74.0830000,'2025-10-11 23:19:20',1,2,3,''),(2,'Tala no autorizada','Zona protegida afectada por tala ilegal.','Reserva Chingaza',4.5001000,-73.7500000,'2025-10-11 23:19:20',2,2,NULL,''),(3,'Contaminación del aire','Emisión de gases contaminantes.','Soacha',4.5800000,-74.2200000,'2025-10-11 23:19:20',3,1,NULL,''),(4,'Arboles sobre la avenida','Los arboles sobre la avenida...','Ubicación X',2.9345678,-75.2812345,'2025-10-15 01:54:14',1,1,1,'Contaminacion'),(6,'contaminacion','petroleo en el rio','Ubicación rural',2.4387654,-76.6132457,'2025-10-18 01:29:19',1,1,3,NULL),(7,'contaminar rios','petroleo en el rio','vereda tal ',2.4387654,-76.6132457,'2025-10-18 01:58:49',1,1,3,NULL),(8,'contaminar rios','petroleo en el rio','vereda tal ',2.4387654,-76.6132457,'2025-10-18 02:00:47',1,1,3,NULL),(9,'contaminar rios','petroleo en el rio','vereda tal ',2.4387654,-76.6132457,'2025-10-18 02:00:51',1,1,3,NULL);
/*!40000 ALTER TABLE `denuncias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `nombre_estado` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Pendiente'),(2,'En revisión'),(3,'Resuelto'),(4,'Rechazado');
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evidencias`
--

DROP TABLE IF EXISTS `evidencias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evidencias` (
  `id_evidencia` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_denuncia` int DEFAULT NULL,
  `id_tipo` int DEFAULT NULL,
  `fecha_subida` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_evidencia`),
  KEY `id_denuncia` (`id_denuncia`),
  KEY `id_tipo` (`id_tipo`),
  CONSTRAINT `evidencias_ibfk_1` FOREIGN KEY (`id_denuncia`) REFERENCES `denuncias` (`id_denuncia`),
  CONSTRAINT `evidencias_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipo_evidencia` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evidencias`
--

LOCK TABLES `evidencias` WRITE;
/*!40000 ALTER TABLE `evidencias` DISABLE KEYS */;
INSERT INTO `evidencias` VALUES (1,'foto1.jpg','Imagen del río contaminado',1,1,'2025-10-11 23:19:20'),(2,'video1.mp4','Video de tala ilegal',2,2,'2025-10-11 23:19:20'),(3,'documento1.pdf','Informe ambiental',3,3,'2025-10-11 23:19:20'),(4,'https://ejemplo.com/evidencia.jpg','Foto tomada en el lugar del incidente',3,2,'2025-10-15 02:11:00');
/*!40000 ALTER TABLE `evidencias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_estado`
--

DROP TABLE IF EXISTS `historial_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_estado` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `id_denuncia` int NOT NULL,
  `id_estado` int NOT NULL,
  `comentario` text COLLATE utf8mb4_general_ci,
  `fecha_cambio` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_historial`),
  KEY `id_denuncia` (`id_denuncia`),
  KEY `id_estado` (`id_estado`),
  CONSTRAINT `historial_estado_ibfk_1` FOREIGN KEY (`id_denuncia`) REFERENCES `denuncias` (`id_denuncia`),
  CONSTRAINT `historial_estado_ibfk_2` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_estado`
--

LOCK TABLES `historial_estado` WRITE;
/*!40000 ALTER TABLE `historial_estado` DISABLE KEYS */;
INSERT INTO `historial_estado` VALUES (1,1,1,'Denuncia registrada.','2025-10-11 23:19:20'),(2,1,2,'Caso remitido a revisión.','2025-10-11 23:19:20'),(3,2,1,'Creada por ciudadano.','2025-10-11 23:19:20'),(4,3,3,'Caso resuelto satisfactoriamente.','2025-10-11 23:19:20');
/*!40000 ALTER TABLE `historial_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizaciones`
--

DROP TABLE IF EXISTS `organizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizaciones` (
  `id_org` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `contacto` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `correo_contacto` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `id_tipo_org` int DEFAULT NULL,
  PRIMARY KEY (`id_org`),
  KEY `fk_tipo_org` (`id_tipo_org`),
  CONSTRAINT `fk_org_tipo` FOREIGN KEY (`id_tipo_org`) REFERENCES `tipo_organizacion` (`id_tipo_org`),
  CONSTRAINT `fk_tipo_org` FOREIGN KEY (`id_tipo_org`) REFERENCES `tipo_organizacion` (`id_tipo_org`),
  CONSTRAINT `organizaciones_ibfk_1` FOREIGN KEY (`id_tipo_org`) REFERENCES `tipo_organizacion` (`id_tipo_org`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizaciones`
--

LOCK TABLES `organizaciones` WRITE;
/*!40000 ALTER TABLE `organizaciones` DISABLE KEYS */;
INSERT INTO `organizaciones` VALUES (1,'Fundación Verde','Laura Mendoza','fundacionverde@gmail.com',1),(2,'Secretaría Ambiental','Dr. Ruiz','contacto@ambiental.gov',2),(3,'Protege S.A.','Andrés Torres','info@protege.com',NULL),(4,'EcoIndep','Javier Pardo','ecovida@indep.com',4);
/*!40000 ALTER TABLE `organizaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre_rol` (`nombre_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (4,'Admin'),(3,'Administrador'),(2,'Revisor'),(1,'Usuario');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_apoyo`
--

DROP TABLE IF EXISTS `tipo_apoyo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_apoyo` (
  `id_tipo` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_apoyo`
--

LOCK TABLES `tipo_apoyo` WRITE;
/*!40000 ALTER TABLE `tipo_apoyo` DISABLE KEYS */;
INSERT INTO `tipo_apoyo` VALUES (1,'Asesoría legal'),(2,'Acompañamiento psicológico'),(3,'Difusión mediática'),(4,'Protección personal');
/*!40000 ALTER TABLE `tipo_apoyo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_evidencia`
--

DROP TABLE IF EXISTS `tipo_evidencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_evidencia` (
  `id_tipo` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_evidencia`
--

LOCK TABLES `tipo_evidencia` WRITE;
/*!40000 ALTER TABLE `tipo_evidencia` DISABLE KEYS */;
INSERT INTO `tipo_evidencia` VALUES (1,'Fotografía'),(2,'Video'),(3,'Documento'),(4,'Audio'),(5,'Fotografía');
/*!40000 ALTER TABLE `tipo_evidencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_organizacion`
--

DROP TABLE IF EXISTS `tipo_organizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_organizacion` (
  `id_tipo_org` int NOT NULL AUTO_INCREMENT,
  `nombre_tipo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_tipo_org`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_organizacion`
--

LOCK TABLES `tipo_organizacion` WRITE;
/*!40000 ALTER TABLE `tipo_organizacion` DISABLE KEYS */;
INSERT INTO `tipo_organizacion` VALUES (1,'ONG'),(2,'GOBIERNO'),(3,'PRIVADO'),(4,'INDEPENDIENTE'),(5,'ONG Ambiental');
/*!40000 ALTER TABLE `tipo_organizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `id_rol` int DEFAULT '1',
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan P. Actualizado','juanp_actualizado@gmail.com','nuevaClave123',3,'2025-10-11 23:19:20'),(2,'María Pérez','maria@example.com','12345',1,'2025-10-11 23:19:20'),(3,'Luis Gómez','luis@example.com','12345',2,'2025-10-11 23:19:20'),(4,'Ana Torres','ana@example.com','12345',3,'2025-10-11 23:19:20'),(5,'Juan Pérez','juan@correo.com','12345',1,'2025-10-14 18:41:26'),(11,'martha españa','martha@gmail.com','123456',2,'2025-10-15 00:43:04'),(14,'Juan Perez','juanperez@gmail.com','123456',2,'2025-10-17 02:35:36');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_apoyos_basica`
--

DROP TABLE IF EXISTS `vista_apoyos_basica`;
/*!50001 DROP VIEW IF EXISTS `vista_apoyos_basica`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_apoyos_basica` AS SELECT 
 1 AS `id_apoyo`,
 1 AS `descripcion_apoyo`,
 1 AS `fecha_asignacion`,
 1 AS `id_denuncia`,
 1 AS `id_tipo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_categorias_con_denuncias`
--

DROP TABLE IF EXISTS `vista_categorias_con_denuncias`;
/*!50001 DROP VIEW IF EXISTS `vista_categorias_con_denuncias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_categorias_con_denuncias` AS SELECT 
 1 AS `categoria`,
 1 AS `total_denuncias`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_denuncias_detalle`
--

DROP TABLE IF EXISTS `vista_denuncias_detalle`;
/*!50001 DROP VIEW IF EXISTS `vista_denuncias_detalle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_denuncias_detalle` AS SELECT 
 1 AS `id_denuncia`,
 1 AS `titulo`,
 1 AS `descripcion`,
 1 AS `ubicacion`,
 1 AS `usuario`,
 1 AS `categoria`,
 1 AS `estado`,
 1 AS `fecha_creacion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_estadisticas_denuncias`
--

DROP TABLE IF EXISTS `vista_estadisticas_denuncias`;
/*!50001 DROP VIEW IF EXISTS `vista_estadisticas_denuncias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_estadisticas_denuncias` AS SELECT 
 1 AS `estado`,
 1 AS `total_denuncias`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_evidencias_detalle`
--

DROP TABLE IF EXISTS `vista_evidencias_detalle`;
/*!50001 DROP VIEW IF EXISTS `vista_evidencias_detalle`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_evidencias_detalle` AS SELECT 
 1 AS `id_evidencia`,
 1 AS `url`,
 1 AS `descripcion`,
 1 AS `tipo_evidencia`,
 1 AS `denuncia`,
 1 AS `fecha_subida`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_historial_denuncias`
--

DROP TABLE IF EXISTS `vista_historial_denuncias`;
/*!50001 DROP VIEW IF EXISTS `vista_historial_denuncias`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_historial_denuncias` AS SELECT 
 1 AS `id_historial`,
 1 AS `denuncia`,
 1 AS `estado`,
 1 AS `comentario`,
 1 AS `fecha_cambio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_organizaciones_basica`
--

DROP TABLE IF EXISTS `vista_organizaciones_basica`;
/*!50001 DROP VIEW IF EXISTS `vista_organizaciones_basica`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_organizaciones_basica` AS SELECT 
 1 AS `id_org`,
 1 AS `nombre`,
 1 AS `contacto`,
 1 AS `correo_contacto`,
 1 AS `id_tipo_org`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_tipos_apoyos_usados`
--

DROP TABLE IF EXISTS `vista_tipos_apoyos_usados`;
/*!50001 DROP VIEW IF EXISTS `vista_tipos_apoyos_usados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_tipos_apoyos_usados` AS SELECT 
 1 AS `tipo_apoyo`,
 1 AS `total_usos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_usuarios_roles`
--

DROP TABLE IF EXISTS `vista_usuarios_roles`;
/*!50001 DROP VIEW IF EXISTS `vista_usuarios_roles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_usuarios_roles` AS SELECT 
 1 AS `id_usuario`,
 1 AS `nombre_completo`,
 1 AS `correo`,
 1 AS `nombre_rol`,
 1 AS `fecha_creacion`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_apoyos_basica`
--

/*!50001 DROP VIEW IF EXISTS `vista_apoyos_basica`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_apoyos_basica` AS select `a`.`id_apoyo` AS `id_apoyo`,`a`.`descripcion` AS `descripcion_apoyo`,`a`.`fecha_asignacion` AS `fecha_asignacion`,`a`.`id_denuncia` AS `id_denuncia`,`a`.`id_tipo` AS `id_tipo` from `apoyos` `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_categorias_con_denuncias`
--

/*!50001 DROP VIEW IF EXISTS `vista_categorias_con_denuncias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_categorias_con_denuncias` AS select `c`.`nombre_categoria` AS `categoria`,count(`d`.`id_denuncia`) AS `total_denuncias` from (`categorias` `c` left join `denuncias` `d` on((`d`.`id_categoria` = `c`.`id_categoria`))) group by `c`.`nombre_categoria` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_denuncias_detalle`
--

/*!50001 DROP VIEW IF EXISTS `vista_denuncias_detalle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_denuncias_detalle` AS select `d`.`id_denuncia` AS `id_denuncia`,`d`.`titulo` AS `titulo`,`d`.`descripcion` AS `descripcion`,`d`.`ubicacion` AS `ubicacion`,`u`.`nombre_completo` AS `usuario`,`c`.`nombre_categoria` AS `categoria`,`e`.`nombre_estado` AS `estado`,`d`.`fecha_creacion` AS `fecha_creacion` from (((`denuncias` `d` left join `usuarios` `u` on((`d`.`id_usuario` = `u`.`id_usuario`))) left join `categorias` `c` on((`d`.`id_categoria` = `c`.`id_categoria`))) left join `estados` `e` on((`d`.`id_estado` = `e`.`id_estado`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_estadisticas_denuncias`
--

/*!50001 DROP VIEW IF EXISTS `vista_estadisticas_denuncias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_estadisticas_denuncias` AS select `e`.`nombre_estado` AS `estado`,count(`d`.`id_denuncia`) AS `total_denuncias` from (`denuncias` `d` left join `estados` `e` on((`d`.`id_estado` = `e`.`id_estado`))) group by `e`.`nombre_estado` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_evidencias_detalle`
--

/*!50001 DROP VIEW IF EXISTS `vista_evidencias_detalle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_evidencias_detalle` AS select `ev`.`id_evidencia` AS `id_evidencia`,`ev`.`url` AS `url`,`ev`.`descripcion` AS `descripcion`,`te`.`nombre_tipo` AS `tipo_evidencia`,`d`.`titulo` AS `denuncia`,`ev`.`fecha_subida` AS `fecha_subida` from ((`evidencias` `ev` left join `tipo_evidencia` `te` on((`ev`.`id_tipo` = `te`.`id_tipo`))) left join `denuncias` `d` on((`ev`.`id_denuncia` = `d`.`id_denuncia`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_historial_denuncias`
--

/*!50001 DROP VIEW IF EXISTS `vista_historial_denuncias`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_historial_denuncias` AS select `h`.`id_historial` AS `id_historial`,`d`.`titulo` AS `denuncia`,`e`.`nombre_estado` AS `estado`,`h`.`comentario` AS `comentario`,`h`.`fecha_cambio` AS `fecha_cambio` from ((`historial_estado` `h` left join `denuncias` `d` on((`h`.`id_denuncia` = `d`.`id_denuncia`))) left join `estados` `e` on((`h`.`id_estado` = `e`.`id_estado`))) order by `h`.`fecha_cambio` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_organizaciones_basica`
--

/*!50001 DROP VIEW IF EXISTS `vista_organizaciones_basica`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_organizaciones_basica` AS select `o`.`id_org` AS `id_org`,`o`.`nombre` AS `nombre`,`o`.`contacto` AS `contacto`,`o`.`correo_contacto` AS `correo_contacto`,`o`.`id_tipo_org` AS `id_tipo_org` from `organizaciones` `o` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_tipos_apoyos_usados`
--

/*!50001 DROP VIEW IF EXISTS `vista_tipos_apoyos_usados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_tipos_apoyos_usados` AS select `ta`.`nombre_tipo` AS `tipo_apoyo`,count(`a`.`id_apoyo`) AS `total_usos` from (`tipo_apoyo` `ta` left join `apoyos` `a` on((`a`.`id_tipo` = `ta`.`id_tipo`))) group by `ta`.`nombre_tipo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_usuarios_roles`
--

/*!50001 DROP VIEW IF EXISTS `vista_usuarios_roles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_usuarios_roles` AS select `u`.`id_usuario` AS `id_usuario`,`u`.`nombre_completo` AS `nombre_completo`,`u`.`correo` AS `correo`,`r`.`nombre_rol` AS `nombre_rol`,`u`.`fecha_creacion` AS `fecha_creacion` from (`usuarios` `u` left join `roles` `r` on((`u`.`id_rol` = `r`.`id_rol`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-21 21:13:03
