-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: eshop06_development
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.13.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cif` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_url_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_url_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_url_file_size` int(11) DEFAULT NULL,
  `logo_url_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (1,1919102131,'Olympia',NULL,NULL,NULL,NULL,'2015-04-27 15:24:28','2015-04-27 15:24:28'),(2,1918929,'Fun Yak Boats',NULL,NULL,NULL,NULL,'2015-04-27 15:28:07','2015-04-27 15:28:07'),(3,1717212,'Peruanos','bkg-blu.jpg','image/jpeg',289940,'2015-05-03 18:59:48','2015-04-27 15:31:47','2015-05-03 18:59:49');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (9,10,2,100,1,'2015-05-09 15:04:00','2015-05-09 15:04:00'),(10,6,2,12,1,'2015-05-09 15:04:06','2015-05-09 15:04:06'),(11,2,2,312,1,'2015-05-09 15:04:11','2015-05-09 15:04:11'),(12,10,8,100,1,'2015-05-17 16:40:19','2015-05-17 16:40:19'),(26,1,12,18,1,'2015-05-25 17:22:43','2015-05-25 17:22:43'),(29,6,16,12,1,'2015-05-27 11:44:56','2015-05-27 11:44:56'),(77,12,26,159,2,'2015-06-06 15:50:00','2015-06-06 15:50:01');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
INSERT INTO `carts` VALUES (1,'2015-05-09 12:00:14','2015-05-09 12:00:14'),(2,'2015-05-09 12:00:15','2015-05-09 12:00:15'),(3,'2015-05-09 15:23:07','2015-05-09 15:23:07'),(4,'2015-05-09 15:23:08','2015-05-09 15:23:08'),(5,'2015-05-11 16:08:46','2015-05-11 16:08:46'),(6,'2015-05-11 16:08:47','2015-05-11 16:08:47'),(7,'2015-05-17 15:07:27','2015-05-17 15:07:27'),(8,'2015-05-17 15:07:30','2015-05-17 15:07:30'),(9,'2015-05-25 07:56:33','2015-05-25 07:56:33'),(10,'2015-05-25 07:56:34','2015-05-25 07:56:34'),(11,'2015-05-25 12:14:26','2015-05-25 12:14:26'),(12,'2015-05-25 12:14:27','2015-05-25 12:14:27'),(13,'2015-05-26 06:57:38','2015-05-26 06:57:38'),(14,'2015-05-26 06:57:39','2015-05-26 06:57:39'),(15,'2015-05-27 11:40:05','2015-05-27 11:40:05'),(16,'2015-05-27 11:40:06','2015-05-27 11:40:06'),(17,'2015-05-29 21:11:59','2015-05-29 21:11:59'),(18,'2015-05-29 21:12:01','2015-05-29 21:12:01'),(19,'2015-06-01 09:01:06','2015-06-01 09:01:06'),(20,'2015-06-01 09:01:08','2015-06-01 09:01:08'),(21,'2015-06-01 20:22:10','2015-06-01 20:22:10'),(22,'2015-06-01 20:22:11','2015-06-01 20:22:11'),(23,'2015-06-02 08:20:58','2015-06-02 08:20:58'),(24,'2015-06-02 08:21:00','2015-06-02 08:21:00'),(25,'2015-06-06 10:49:35','2015-06-06 10:49:35'),(26,'2015-06-06 15:49:08','2015-06-06 15:49:08'),(27,'2015-06-06 15:50:30','2015-06-06 15:50:30'),(28,'2015-06-07 10:55:39','2015-06-07 10:55:39');
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_items_orders` (`order_id`),
  CONSTRAINT `fk_order_items_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (12,12,9,159,3,'2015-06-06 15:58:23','2015-06-06 15:58:23'),(13,12,10,159,3,'2015-06-06 15:59:31','2015-06-06 15:59:31'),(14,12,11,159,1,'2015-06-06 16:00:51','2015-06-06 16:00:51'),(15,11,11,144,1,'2015-06-06 16:00:51','2015-06-06 16:00:51'),(16,10,11,100,1,'2015-06-06 16:00:51','2015-06-06 16:00:51'),(17,9,11,121,1,'2015-06-06 16:00:51','2015-06-06 16:00:51'),(18,12,12,159,1,'2015-06-06 16:01:31','2015-06-06 16:01:31'),(19,11,12,144,1,'2015-06-06 16:01:31','2015-06-06 16:01:31'),(20,10,12,100,1,'2015-06-06 16:01:31','2015-06-06 16:01:31');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ship_to_country_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `error_message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (9,'carlos@correo.com','6345125123','Ariel','Isaac','Calle Falsa ','Cadiz','11219','ES','127.0.0.1','procesado',NULL,'2015-06-06 15:58:23','2015-06-06 15:58:27'),(10,'carlos@correo.com','6345125123','Ariel','Isaac','Calle Falsa ','Cadiz','11219','ES','127.0.0.1','procesado',NULL,'2015-06-06 15:59:31','2015-06-06 15:59:33'),(11,'carlos@correo.com','6345125123','Ariel','Isaac','Calle Falsa ','Cadiz','11219','ES','127.0.0.1','procesado',NULL,'2015-06-06 16:00:51','2015-06-06 16:00:52'),(12,'carlos@correo.com','6345125123','Ariel','Isaac','Calle Falsa ','Cadiz','11219','ES','127.0.0.1','procesado',NULL,'2015-06-06 16:01:31','2015-06-06 16:01:32');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `product_img_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_img_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_img_file_size` int(11) DEFAULT NULL,
  `product_img_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_brands_products` (`brand_id`),
  CONSTRAINT `fk_brands_products` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Chaleco',18,'Ayuda la flotabilidad para deportes náuticos\r\n\r\n30-50 kg TALLA S\r\nFlotador delantero monobloque, flotador dorsal en 2 partes.\r\nVisibilidad Colores muy visibles.\r\nAsa de tejido cobre el cuello para colgar el chaleco.\r\nRegulable con hebilla de plástico','40046.jpg','image/jpeg',20240,'2015-04-27 15:26:04','2015-04-27 15:26:04','2015-04-27 15:26:04'),(2,2,'Fun Yak Clam Azul',312,'Caracteristicas Tecnicas:\r\n- Construccion de capa simple.\r\n- 2 personas o 150 Kg.\r\n- Peso barco vacio: 18 Kg.\r\n- Longitud: 1,99 m.\r\n- Anchura: 1,10 m.\r\n- Hueco: 0,30 m.','FunYakClam-RecicleauAzul-1.jpg','image/jpeg',21144,'2015-04-27 15:29:34','2015-04-27 15:29:35','2015-04-27 16:23:09'),(3,3,'Jibionera',9,'Preciosas jibioneras.','jibionera-yo-zuri-bb-diam-s-z-774-77440.jpg','image/jpeg',50343,'2015-04-27 15:32:23','2015-04-27 15:32:24','2015-04-27 15:32:24'),(6,1,'Garmin Fenix 3',475,'La última apuesta de Garmin en relojes GPS multideporte. su sistema compatible con GLONASS acelera el posicionamiento y mejora la precisión. Su nueva pantalla de 1,2 “ permite ver con claridad los datos a plena luz del sol. Dispone de las últimas funciones en entrenamiento avanzado y en recuperación.\r\nBrújula de tres ejes, altímetro, barómetro, trackbac. Con acceso a la plataforma Connect IQ que permite personalizar las pantallas del reloj, campos de datos, etc. Ideal tanto para uso deportivo como diario.\r\nDisponible con y sin pulsómetro.','garmin-fenix-3-GPSFERE3.jpg','image/jpeg',57666,'2015-06-07 11:19:29','2015-04-27 16:32:17','2015-06-07 11:19:29'),(9,3,'Foco de cubierta negro',50,'Foco de cubierta negro 12 v',NULL,NULL,NULL,NULL,'2015-05-03 21:38:01','2015-06-07 10:59:36'),(10,3,'Hilo de Pescar',100,'Muy bueno',NULL,NULL,NULL,NULL,'2015-05-03 23:21:39','2015-05-03 23:21:39'),(11,1,'Ancla Plegable',144,'Anclaje perfecto y cómoda estiba\r\nConstruida en acero galvanizado al fuego, rezones plegables y caña maciza.',NULL,NULL,NULL,NULL,'2015-05-26 08:57:43','2015-06-07 11:00:45'),(12,1,'Shorty Seac Sub Body Fit ',59,'Nuevo shorty de Seac Sub de 3 mm con revestimiento externo e interno de nylon. Cremallera de cursor de alta resistencia. Las muñecas y tobillos están conformados por un anillo toroidal de Smooth Skin, en una sola pieza. Con refuerzos en las rodillas y elegante diseño en negro/azul.','traje-seac-sub-monopieza-body-shorty-caballero-b120073.jpg','image/jpeg',32242,'2015-06-07 11:20:29','2015-06-06 10:50:28','2015-06-07 11:20:30'),(13,1,'Puntera de Proa',42,'Fuertes y resistentes.\r\nPuntera bloqueante:\r\nLargo: 240 mm.\r\nAncho: 100 mm.\r\nPara cadena: 6-8 mm.\r\nPara ancla: hasta 10 kg.','punteras-de-proa-N108071-1-2.jpg','image/jpeg',28223,'2015-06-07 11:19:59','2015-06-07 11:10:45','2015-06-07 11:19:59'),(14,1,'Prismáticos Zeiss Terra ED Azules',499,'Calidad Zeiss al alcance de todos\r\nPrismáticos compactos, ligeros y resistentes al agua.\r\nPrismáticos pensados para el ocio, el campo, el deporte y para actividades al aire libre en general. Para todos aquellos que disfrutan del campo y la montaña haciendo rutas o senderismo, un viaje excitante a tierras desconocidas, o simplemente un evento deportivo. Donde quiera que vaya hay momentos únicos esperando a ser descubiertos.\r\nExcelente calidad óptica gracias a los cristales ED de Schott.\r\nTratamiento Zeiss multicapas, que asegura imágenes nítidas y brillantes, incluso en las peeores condiciones.\r\nMecanismo de enfoque rápido.\r\n\r\n<b>Modelo 10x42:</b><ul><li>Aumentos:10</li><li>Diámetro lente frontal:42 mm</li><li>Peso.690 gr.</li><li>Campo de visión a 1000 mts: 110 mts.</li><ul>','prismatico-zeiss-terra-azul-1-45728.jpg','image/jpeg',32767,'2015-06-07 11:18:33','2015-06-07 11:12:27','2015-06-07 11:18:34');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150405231427'),('20150416201452'),('20150420175309'),('20150427164152'),('20150509114658'),('20150509114732'),('20150509114733'),('20150511174500'),('20150517152521'),('20150525073346'),('20150525073458'),('20150525073459'),('20150525080804'),('20150525080805'),('20150525080810'),('20150525080811');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `crypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `persistence_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `perishable_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `login_count` int(11) NOT NULL DEFAULT '0',
  `failed_login_count` int(11) NOT NULL DEFAULT '0',
  `last_request_at` datetime DEFAULT NULL,
  `current_login_at` datetime DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `current_login_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin','carlos.darth@gmail.com','f9d90a44984ad56a057a8129173a1b715a89c5dff8afc3c36aa8225d3e03005ccca6d17f2d3caf2832efd7be09fdb19824d9a01623dbf419619edf2a29ba4333','09yBH7FMdtMODsRzFOBY','5788d693a7c5bc588681b773332661623675c0423a55a2f8f60c1bf188e521ec9f523154453a19bb2cc77ac0fd0a18207a05cc55bcdcfb6607c55341f57bc967','eZwAs3GFD61RJqsLbvzA',39,0,'2015-06-07 11:26:14','2015-06-07 11:09:54','2015-06-07 10:55:53','127.0.0.1','127.0.0.1','2015-05-18 18:06:36','2015-06-07 11:26:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-07 19:00:53
