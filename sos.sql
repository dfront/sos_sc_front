-- MySQL dump 10.13  Distrib 5.5.27, for Linux (i686)
--
-- Host: localhost    Database: sos
-- ------------------------------------------------------
-- Server version	5.5.27

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
-- Table structure for table `abrigo_abrigo`
--

DROP TABLE IF EXISTS `abrigo_abrigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abrigo_abrigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abrigo_abrigo`
--

LOCK TABLES `abrigo_abrigo` WRITE;
/*!40000 ALTER TABLE `abrigo_abrigo` DISABLE KEYS */;
INSERT INTO `abrigo_abrigo` VALUES (5,'Casa da vo'),(6,'Casa santos'),(7,'Casa Floripa');
/*!40000 ALTER TABLE `abrigo_abrigo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abrigo_abrigolocation`
--

DROP TABLE IF EXISTS `abrigo_abrigolocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abrigo_abrigolocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abrigo_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abrigo_abrigolocation_ec98304b` (`abrigo_id`),
  KEY `abrigo_abrigolocation_afbb987d` (`location_id`),
  CONSTRAINT `abrigo_id_refs_id_d6999b6f` FOREIGN KEY (`abrigo_id`) REFERENCES `abrigo_abrigo` (`id`),
  CONSTRAINT `location_id_refs_id_0e3809d8` FOREIGN KEY (`location_id`) REFERENCES `abrigo_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abrigo_abrigolocation`
--

LOCK TABLES `abrigo_abrigolocation` WRITE;
/*!40000 ALTER TABLE `abrigo_abrigolocation` DISABLE KEYS */;
INSERT INTO `abrigo_abrigolocation` VALUES (5,5,16),(6,6,15),(7,7,14);
/*!40000 ALTER TABLE `abrigo_abrigolocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abrigo_addresscomponent`
--

DROP TABLE IF EXISTS `abrigo_addresscomponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abrigo_addresscomponent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `long_name` varchar(200) DEFAULT NULL,
  `short_name` varchar(200) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `abrigo_addresscomponent_afbb987d` (`location_id`),
  CONSTRAINT `location_id_refs_id_9e974505` FOREIGN KEY (`location_id`) REFERENCES `abrigo_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abrigo_addresscomponent`
--

LOCK TABLES `abrigo_addresscomponent` WRITE;
/*!40000 ALTER TABLE `abrigo_addresscomponent` DISABLE KEYS */;
INSERT INTO `abrigo_addresscomponent` VALUES (162,'110','110',14),(163,'Rua Neivo Paulo Rogelin','R. Neivo Paulo Rogelin',14),(164,'Barra da Lagoa','Barra da Lagoa',14),(165,'Florianópolis','Florianópolis',14),(166,'Santa Catarina','SC',14),(167,'Brazil','BR',14),(168,'88061-165','88061-165',14),(169,'6','6',15),(170,'Rua Azevedo Sodré','R. Azevedo Sodré',15),(171,'Gonzaga','Gonzaga',15),(172,'Santos','Santos',15),(173,'São Paulo','SP',15),(174,'Brazil','BR',15),(175,'11055-051','11055-051',15),(176,'18','18',16),(177,'Rua Rui Pinto','R. Rui Pinto',16),(178,'Vila Morse','Vila Morse',16),(179,'São Paulo','São Paulo',16),(180,'São Paulo','SP',16),(181,'Brazil','BR',16),(182,'05624-100','05624-100',16);
/*!40000 ALTER TABLE `abrigo_addresscomponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abrigo_addresscomponent_types`
--

DROP TABLE IF EXISTS `abrigo_addresscomponent_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abrigo_addresscomponent_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addresscomponent_id` int(11) NOT NULL,
  `addresscomponenttype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `addresscomponent_id` (`addresscomponent_id`,`addresscomponenttype_id`),
  KEY `abrigo_addresscomponent_types_1592f4de` (`addresscomponent_id`),
  KEY `abrigo_addresscomponent_types_7795fd4f` (`addresscomponenttype_id`),
  CONSTRAINT `addresscomponent_id_refs_id_65388c3f` FOREIGN KEY (`addresscomponent_id`) REFERENCES `abrigo_addresscomponent` (`id`),
  CONSTRAINT `addresscomponenttype_id_refs_id_fff09b15` FOREIGN KEY (`addresscomponenttype_id`) REFERENCES `abrigo_addresscomponenttype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abrigo_addresscomponent_types`
--

LOCK TABLES `abrigo_addresscomponent_types` WRITE;
/*!40000 ALTER TABLE `abrigo_addresscomponent_types` DISABLE KEYS */;
INSERT INTO `abrigo_addresscomponent_types` VALUES (360,162,14),(361,163,15),(362,164,16),(363,164,17),(364,164,18),(367,165,18),(368,165,20),(369,166,18),(370,166,21),(371,167,18),(372,167,22),(373,168,24),(388,169,14),(389,170,15),(390,171,16),(391,171,17),(392,171,18),(395,172,18),(396,172,20),(397,173,18),(398,173,21),(399,174,18),(400,174,22),(401,175,24),(402,176,14),(403,177,15),(404,178,16),(405,178,17),(406,178,18),(409,179,18),(410,179,20),(411,180,18),(412,180,21),(413,181,18),(414,181,22),(415,182,24);
/*!40000 ALTER TABLE `abrigo_addresscomponent_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abrigo_addresscomponenttype`
--

DROP TABLE IF EXISTS `abrigo_addresscomponenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abrigo_addresscomponenttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abrigo_addresscomponenttype`
--

LOCK TABLES `abrigo_addresscomponenttype` WRITE;
/*!40000 ALTER TABLE `abrigo_addresscomponenttype` DISABLE KEYS */;
INSERT INTO `abrigo_addresscomponenttype` VALUES (14,'street_number'),(15,'route'),(16,'sublocality_level_1'),(17,'sublocality'),(18,'political'),(19,'locality'),(20,'administrative_area_level_2'),(21,'administrative_area_level_1'),(22,'country'),(23,'postal_code_prefix'),(24,'postal_code');
/*!40000 ALTER TABLE `abrigo_addresscomponenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `abrigo_location`
--

DROP TABLE IF EXISTS `abrigo_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `abrigo_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `place_id` varchar(200) DEFAULT NULL,
  `formatted_address` varchar(200) DEFAULT NULL,
  `lat` varchar(50) DEFAULT NULL,
  `lng` varchar(50) DEFAULT NULL,
  `bound_northeast_lat` varchar(50) DEFAULT NULL,
  `bound_northeast_lng` varchar(50) DEFAULT NULL,
  `bound_southwest_lat` varchar(50) DEFAULT NULL,
  `bound_southwest_lng` varchar(50) DEFAULT NULL,
  `viewport_southwest_lat` varchar(50) DEFAULT NULL,
  `viewport_southwest_lng` varchar(50) DEFAULT NULL,
  `viewport_northeast_lat` varchar(50) DEFAULT NULL,
  `viewport_northeast_lng` varchar(50) DEFAULT NULL,
  `location_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `abrigo_location`
--

LOCK TABLES `abrigo_location` WRITE;
/*!40000 ALTER TABLE `abrigo_location` DISABLE KEYS */;
INSERT INTO `abrigo_location` VALUES (14,'ElRSLiBOZWl2byBQYXVsbyBSb2dlbGluLCAxMTAgLSBCYXJyYSBkYSBMYWdvYSwgRmxvcmlhbsOzcG9saXMgLSBTQywgODgwNjEtMTY1LCBCcmFzaWw','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil','-27.573874','-48.4277809','-27.573874','-48.4277656','-27.5738836','-48.4277809','-27.5752277803','-48.4291222303','-27.5725298197','-48.4264242697','RANGE_INTERPOLATED'),(15,'Ej5SLiBBemV2ZWRvIFNvZHLDqSwgNiAtIEdvbnphZ2EsIFNhbnRvcyAtIFNQLCAxMTA1NS0wNTEsIEJyYXNpbA','R. Azevedo Sodré, 6 - Gonzaga, Santos - SP, 11055-051, Brazil','-23.9665803','-46.3242945','-23.9665803','-46.3242945','-23.9665974','-46.3242959','-23.9679378303','-46.3256441803','-23.9652398697','-46.3229462197','RANGE_INTERPOLATED'),(16,'EkFSLiBSdWkgUGludG8sIDE4IC0gVmlsYSBNb3JzZSwgU8OjbyBQYXVsbyAtIFNQLCAwNTYyNC0xMDAsIEJyYXNpbA','R. Rui Pinto, 18 - Vila Morse, São Paulo - SP, 05624-100, Brazil','-23.5980999','-46.7263162','-23.5980999','-46.7263162','-23.5981149','-46.7263254','-23.5994563803','-46.7276697803','-23.5967584197','-46.7249718197','RANGE_INTERPOLATED');
/*!40000 ALTER TABLE `abrigo_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add session',7,'add_session'),(20,'Can change session',7,'change_session'),(21,'Can delete session',7,'delete_session'),(22,'Can add flat page',8,'add_flatpage'),(23,'Can change flat page',8,'change_flatpage'),(24,'Can delete flat page',8,'delete_flatpage'),(25,'Can add abrigo',9,'add_abrigo'),(26,'Can change abrigo',9,'change_abrigo'),(27,'Can delete abrigo',9,'delete_abrigo'),(28,'Can add location',10,'add_location'),(29,'Can change location',10,'change_location'),(30,'Can delete location',10,'delete_location'),(31,'Can add abrigo location',11,'add_abrigolocation'),(32,'Can change abrigo location',11,'change_abrigolocation'),(33,'Can delete abrigo location',11,'delete_abrigolocation'),(34,'Can add address component type',12,'add_addresscomponenttype'),(35,'Can change address component type',12,'change_addresscomponenttype'),(36,'Can delete address component type',12,'delete_addresscomponenttype'),(37,'Can add address component',13,'add_addresscomponent'),(38,'Can change address component',13,'change_addresscomponent'),(39,'Can delete address component',13,'delete_addresscomponent');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$12000$6bVvwqGKHQDr$vIbUPKq+iRWAXAPCZES3gy0qrLYEeYmO3+xRZD5WN6Q=','2015-11-10 00:09:35',1,'corbe','','','corbe@bol.com.br',1,1,'2015-10-28 06:00:10');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-10-29 02:57:35',1,10,'1','Amphitheatre Pkwy',1,''),(2,'2015-10-29 02:57:59',1,10,'1','Amphitheatre Pkwy',2,'Nenhum campo modificado.'),(3,'2015-10-29 02:58:19',1,9,'1','Abrigo teste 1',1,''),(4,'2015-10-29 03:28:35',1,9,'2','Abrigo teste 2',1,''),(5,'2015-10-30 01:22:22',1,10,'1','1600 Amphitheatre Parkway, Mountain View, CA 94043, USA',1,''),(6,'2015-10-30 01:22:36',1,10,'1','1600 Amphitheatre Parkway, Mountain View, CA 94043, USA',2,'Nenhum campo modificado.'),(7,'2015-10-30 01:22:44',1,9,'2','Abrigo teste 2',2,'Adicionado abrigo location \"Abrigo teste 2\"'),(8,'2015-10-30 01:22:51',1,9,'1','Abrigo teste 1',2,'Adicionado abrigo location \"Abrigo teste 1\"'),(9,'2015-10-30 01:25:27',1,10,'1','1600 Amphitheatre Parkway, Mountain View, CA 94043, USA',1,''),(10,'2015-10-30 01:25:57',1,9,'1','Abrigo teste 1',2,'Adicionado abrigo location \"Abrigo teste 1\"'),(11,'2015-10-30 01:26:04',1,9,'2','Abrigo teste 2',2,'Adicionado abrigo location \"Abrigo teste 2\"'),(12,'2015-10-30 03:09:29',1,10,'2','Rua neivo Paulo rogelin,110 - Barra da Lagoa SC Florianopolis',1,''),(13,'2015-10-30 03:10:10',1,9,'3','Casa',1,''),(14,'2015-10-30 03:21:13',1,9,'3','Casa',3,''),(15,'2015-10-30 03:21:14',1,9,'2','Abrigo teste 2',3,''),(16,'2015-10-30 03:21:14',1,9,'1','Abrigo teste 1',3,''),(17,'2015-10-30 03:21:21',1,9,'4','teste',1,''),(18,'2015-10-30 03:23:02',1,10,'1','1600 Amphitheatre Parkway, Mountain View, CA 94043, USA',3,''),(19,'2015-10-30 03:30:51',1,9,'4','teste',3,''),(20,'2015-10-30 03:31:21',1,9,'5','teste',1,''),(21,'2015-10-30 03:31:39',1,10,'2','Rua neivo Paulo rogelin,110 - Barra da Lagoa SC Florianopolis',3,''),(22,'2015-10-30 03:32:12',1,10,'3','Rua neivo Paulo rogelin,110 - Barra da Lagoa SC Florianopolis',1,''),(23,'2015-10-30 03:33:25',1,10,'3','Rua neivo Paulo rogelin,110 - Barra da Lagoa SC Florianopolis',3,''),(24,'2015-10-30 03:33:50',1,10,'4','Rua neivo Paulo rogelin,110 - Barra da Lagoa SC Florianopolis',1,''),(25,'2015-10-30 03:34:20',1,9,'5','teste',2,'Adicionado abrigo location \"teste\"'),(26,'2015-10-30 03:57:07',1,9,'6','Casa santos',1,''),(27,'2015-10-30 03:57:13',1,9,'6','Casa santos',3,''),(28,'2015-10-30 03:57:44',1,10,'5','Av. Azevedo Sodre, n 6 - Santos SP ',1,''),(29,'2015-10-30 03:58:07',1,10,'5','Av. Azevedo Sodre, n 6 - Santos SP ',2,'Nenhum campo modificado.'),(30,'2015-10-30 03:58:15',1,9,'7','Casa santos',1,''),(31,'2015-10-30 04:00:37',1,10,'6','Rua Rui Pinto, 43 Vila Sonia Sao Paulo SP',1,''),(32,'2015-10-30 04:00:49',1,10,'6','Rua Rui Pinto, 43 Vila Sonia Sao Paulo SP',2,'Nenhum campo modificado.'),(33,'2015-10-30 04:01:04',1,9,'8','Casa vo',1,''),(34,'2015-11-07 00:03:05',1,10,'6','Rua Rui Pinto, 43 Vila Sonia Sao Paulo SP',2,'Nenhum campo modificado.'),(35,'2015-11-08 19:07:02',1,10,'18','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',1,''),(36,'2015-11-08 19:07:18',1,10,'18','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Nenhum campo modificado.'),(37,'2015-11-08 19:07:47',1,10,'18','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Nenhum campo modificado.'),(38,'2015-11-08 19:07:56',1,10,'18','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Nenhum campo modificado.'),(39,'2015-11-08 19:08:43',1,10,'18','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',3,''),(40,'2015-11-08 19:09:03',1,10,'19','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',1,''),(41,'2015-11-08 19:09:05',1,10,'19','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Nenhum campo modificado.'),(42,'2015-11-08 19:09:17',1,10,'19','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Nenhum campo modificado.'),(43,'2015-11-08 19:11:00',1,10,'1','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',1,''),(44,'2015-11-08 19:12:18',1,10,'1','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',1,''),(45,'2015-11-08 19:15:45',1,9,'1','Casa',1,''),(46,'2015-11-08 19:15:49',1,9,'1','Casa',2,'Nenhum campo modificado.'),(47,'2015-11-08 19:22:17',1,9,'1','Casa',3,''),(48,'2015-11-08 19:24:02',1,10,'5','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',1,''),(49,'2015-11-08 19:28:13',1,10,'5','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',2,'Nenhum campo modificado.'),(50,'2015-11-08 19:28:41',1,10,'1','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',3,''),(51,'2015-11-08 19:29:00',1,9,'2','Salão Paroquial da Capela Santo Antônio',1,''),(52,'2015-11-08 19:29:13',1,9,'3','Comunidade Nossa Sra. Aparecida',1,''),(53,'2015-11-08 19:29:26',1,10,'6','Rod. Jorge Lacerda, Km 04, s/nº - Espinheirinhos',1,''),(54,'2015-11-08 19:29:33',1,10,'6','Itajaí, Itajaí - SC, Brazil',2,'Modificado formatted_address.'),(55,'2015-11-08 19:30:09',1,9,'4','Comunidade Nossa Sra. Aparecida',1,''),(56,'2015-11-08 19:30:30',1,9,'4','Comunidade Nossa Sra. Aparecida',3,''),(57,'2015-11-08 19:30:30',1,9,'3','Comunidade Nossa Sra. Aparecida',3,''),(58,'2015-11-08 19:30:30',1,9,'2','Salão Paroquial da Capela Santo Antônio',3,''),(59,'2015-11-08 19:32:44',1,10,'1','Itajaí, Itajaí - SC, Brazil',1,''),(60,'2015-11-08 19:33:09',1,10,'1','R. Bruno Vicente da Luz, 5626 - Espinheiros, Itajaí - SC, Brazil',2,'Modificado formatted_address.'),(61,'2015-11-08 19:35:01',1,12,'13','postal_code_prefix',3,''),(62,'2015-11-08 19:35:01',1,12,'12','postal_code',3,''),(63,'2015-11-08 19:35:01',1,12,'11','country',3,''),(64,'2015-11-08 19:35:01',1,12,'10','administrative_area_level_1',3,''),(65,'2015-11-08 19:35:01',1,12,'9','administrative_area_level_2',3,''),(66,'2015-11-08 19:35:01',1,12,'8','locality',3,''),(67,'2015-11-08 19:35:01',1,12,'7','political',3,''),(68,'2015-11-08 19:35:01',1,12,'6','sublocality',3,''),(69,'2015-11-08 19:35:01',1,12,'5','sublocality_level_1',3,''),(70,'2015-11-08 19:35:01',1,12,'4','route',3,''),(71,'2015-11-08 19:35:11',1,12,'3','street_number',3,''),(72,'2015-11-08 19:35:23',1,10,'1','R. Bruno Vicente da Luz, 5626 - Espinheiros, Itajaí - SC, Brazil',2,'Nenhum campo modificado.'),(73,'2015-11-08 19:47:27',1,10,'1','R. Bruno Vicente da Luz, 5626 - Espinheiros, Itajaí - SC, Brazil',2,'Nenhum campo modificado.'),(74,'2015-11-08 19:51:47',1,9,'1','Salão Paroquial da Capela Santo Antônio',1,''),(75,'2015-11-08 19:52:03',1,10,'2','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',1,''),(76,'2015-11-08 20:06:22',1,10,'2','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',3,''),(77,'2015-11-08 20:06:22',1,10,'1','R. Bruno Vicente da Luz, 5626 - Espinheiros, Itajaí - SC, Brazil',3,''),(78,'2015-11-08 20:06:28',1,10,'3','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',1,''),(79,'2015-11-08 20:07:01',1,9,'1','Salão Paroquial da Capela Santo Antônio',3,''),(80,'2015-11-08 20:07:14',1,10,'3','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',3,''),(81,'2015-11-08 20:13:08',1,10,'10','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',1,''),(82,'2015-11-08 20:19:38',1,10,'10','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Nenhum campo modificado.'),(83,'2015-11-08 20:20:25',1,10,'10','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Nenhum campo modificado.'),(84,'2015-11-08 20:27:02',1,10,'10','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Nenhum campo modificado.'),(85,'2015-11-08 20:29:02',1,10,'10','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Nenhum campo modificado.'),(86,'2015-11-08 20:30:25',1,10,'10','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',3,''),(87,'2015-11-08 20:36:27',1,10,'13','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',1,''),(88,'2015-11-08 20:52:35',1,10,'2','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',1,''),(89,'2015-11-08 21:27:15',1,10,'1','Rod. Jorge Lacerda, Km 04, s/nº - Espinheirinhos',1,''),(90,'2015-11-08 21:48:49',1,10,'4','Itajaí, Itajaí - SC, Brazil',1,''),(91,'2015-11-08 21:49:14',1,10,'4','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',2,'Modificado formatted_address.'),(92,'2015-11-08 21:49:20',1,10,'4','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',2,'Nenhum campo modificado.'),(93,'2015-11-08 21:49:35',1,10,'5','',1,''),(94,'2015-11-08 21:50:06',1,10,'5','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Modificado formatted_address.'),(95,'2015-11-08 21:50:25',1,10,'5','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Modificado formatted_address.'),(96,'2015-11-08 22:31:01',1,10,'5','Rua Neivo Paulo Rogelin,110 - barra da lagoa - SC - Florianopolis',3,''),(97,'2015-11-08 22:31:01',1,10,'4','Rua Fermino Vieira Cordeiro, nº 4374 - Espinheiros - Itajai - SC',3,''),(98,'2015-11-08 22:31:22',1,13,'101','AddressComponent object',3,''),(99,'2015-11-08 22:31:22',1,13,'100','AddressComponent object',3,''),(100,'2015-11-08 22:31:22',1,13,'99','AddressComponent object',3,''),(101,'2015-11-08 22:31:22',1,13,'98','AddressComponent object',3,''),(102,'2015-11-08 22:31:22',1,13,'97','AddressComponent object',3,''),(103,'2015-11-08 22:31:22',1,13,'96','AddressComponent object',3,''),(104,'2015-11-08 22:31:22',1,13,'95','AddressComponent object',3,''),(105,'2015-11-08 22:31:22',1,13,'94','AddressComponent object',3,''),(106,'2015-11-08 22:31:22',1,13,'93','AddressComponent object',3,''),(107,'2015-11-08 22:31:22',1,13,'92','AddressComponent object',3,''),(108,'2015-11-08 22:31:22',1,13,'91','AddressComponent object',3,''),(109,'2015-11-08 22:31:22',1,13,'90','AddressComponent object',3,''),(110,'2015-11-08 22:31:22',1,13,'89','AddressComponent object',3,''),(111,'2015-11-08 22:31:22',1,13,'88','AddressComponent object',3,''),(112,'2015-11-08 22:31:37',1,10,'6','Itajaí, Itajaí - SC, Brazil',1,''),(113,'2015-11-08 22:36:23',1,10,'7','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',1,''),(114,'2015-11-08 22:36:31',1,10,'7','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Nenhum campo modificado.'),(115,'2015-11-08 22:36:36',1,10,'7','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Nenhum campo modificado.'),(116,'2015-11-08 22:40:40',1,10,'7','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Nenhum campo modificado.'),(117,'2015-11-08 22:40:55',1,10,'7','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Nenhum campo modificado.'),(118,'2015-11-08 22:41:05',1,10,'7','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Nenhum campo modificado.'),(119,'2015-11-08 22:43:25',1,10,'7','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Nenhum campo modificado.'),(120,'2015-11-08 22:44:23',1,13,'118','88061-165',3,''),(121,'2015-11-08 22:44:23',1,13,'117','BR',3,''),(122,'2015-11-08 22:44:23',1,13,'116','SC',3,''),(123,'2015-11-08 22:44:23',1,13,'115','Florianópolis',3,''),(124,'2015-11-08 22:44:23',1,13,'114','Barra da Lagoa',3,''),(125,'2015-11-08 22:44:23',1,13,'113','R. Neivo Paulo Rogelin',3,''),(126,'2015-11-08 22:44:23',1,13,'112','110',3,''),(127,'2015-11-08 22:44:23',1,13,'111','BR',3,''),(128,'2015-11-08 22:44:23',1,13,'110','SC',3,''),(129,'2015-11-08 22:44:23',1,13,'109','Itajaí',3,''),(130,'2015-11-08 22:45:31',1,10,'7','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Nenhum campo modificado.'),(131,'2015-11-08 22:46:16',1,10,'7','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Nenhum campo modificado.'),(132,'2015-11-08 23:11:04',1,10,'6','Itajaí, Itajaí - SC, Brazil',2,'Nenhum campo modificado.'),(133,'2015-11-09 00:02:14',1,10,'6','Itajaí, Itajaí - SC, Brazil',2,'Nenhum campo modificado.'),(134,'2015-11-09 00:02:18',1,10,'6','Itajaí, Itajaí - SC, Brazil',2,'Nenhum campo modificado.'),(135,'2015-11-09 00:02:52',1,10,'7','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',3,''),(136,'2015-11-09 00:03:00',1,10,'6','Itajaí, Itajaí - SC, Brazil',3,''),(137,'2015-11-09 00:05:50',1,10,'8','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',1,''),(138,'2015-11-09 00:05:58',1,10,'8','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',2,'Nenhum campo modificado.'),(139,'2015-11-09 00:06:04',1,10,'8','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',2,'Nenhum campo modificado.'),(140,'2015-11-09 00:06:12',1,10,'8','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',2,'Nenhum campo modificado.'),(141,'2015-11-09 00:10:50',1,9,'1','Comunidade Nossa Sra. Aparecida',1,''),(142,'2015-11-09 00:10:52',1,9,'1','Comunidade Nossa Sra. Aparecida',2,'Nenhum campo modificado.'),(143,'2015-11-09 00:13:17',1,10,'8','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',2,'Nenhum campo modificado.'),(144,'2015-11-09 00:13:21',1,10,'8','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',2,'Nenhum campo modificado.'),(145,'2015-11-09 00:14:25',1,10,'None','Rua Clarindo S. da Cunha, 1385 - Espinheirinhos - SC- Itajai',1,''),(146,'2015-11-09 00:14:33',1,10,'None','Rua Clarindo S. da Cunha, 1385 - Espinheirinhos - SC- Itajai',1,''),(147,'2015-11-09 00:14:39',1,10,'8','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',2,'Nenhum campo modificado.'),(148,'2015-11-09 00:15:16',1,9,'1','Clarindo Sebastião da Cunha',2,'Modificado nome.'),(149,'2015-11-09 00:17:42',1,10,'9','São Roque, Itajaí - SC, Brazil',1,''),(150,'2015-11-09 00:17:50',1,10,'10','São Roque, Itajaí - SC, Brazil',1,''),(151,'2015-11-09 00:17:50',1,10,'11','São Roque, Itajaí - SC, Brazil',1,''),(152,'2015-11-09 00:17:56',1,9,'2','E. I. Jorge Domingos Gonzaga',1,''),(153,'2015-11-09 00:17:59',1,9,'2','E. I. Jorge Domingos Gonzaga',2,'Nenhum campo modificado.'),(154,'2015-11-09 00:18:55',1,10,'12','R. Bruno Vicente da Luz, 5626 - Espinheiros, Itajaí - SC, Brazil',1,''),(155,'2015-11-09 00:18:56',1,9,'3','E. M. Rosa Negreiros Cabral',1,''),(156,'2015-11-09 00:20:09',1,10,'13','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',1,''),(157,'2015-11-09 00:20:10',1,9,'4','Salão Paroquial da Capela Santo Antônio',1,''),(158,'2015-11-10 00:09:42',1,9,'4','Salão Paroquial da Capela Santo Antônio',3,''),(159,'2015-11-10 00:09:42',1,9,'3','E. M. Rosa Negreiros Cabral',3,''),(160,'2015-11-10 00:09:42',1,9,'2','E. I. Jorge Domingos Gonzaga',3,''),(161,'2015-11-10 00:09:42',1,9,'1','Clarindo Sebastião da Cunha',3,''),(162,'2015-11-10 00:10:06',1,10,'13','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',3,''),(163,'2015-11-10 00:10:07',1,10,'12','R. Bruno Vicente da Luz, 5626 - Espinheiros, Itajaí - SC, Brazil',3,''),(164,'2015-11-10 00:10:07',1,10,'11','São Roque, Itajaí - SC, Brazil',3,''),(165,'2015-11-10 00:10:07',1,10,'10','São Roque, Itajaí - SC, Brazil',3,''),(166,'2015-11-10 00:10:07',1,10,'9','São Roque, Itajaí - SC, Brazil',3,''),(167,'2015-11-10 00:10:07',1,10,'8','R. Fermino Viêira Cordeiro, 4374 - Espinheiros, Itajaí - SC, Brazil',3,''),(168,'2015-11-10 00:10:41',1,10,'14','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',1,''),(169,'2015-11-10 00:10:50',1,10,'14','R. Neivo Paulo Rogelin, 110 - Barra da Lagoa, Florianópolis - SC, 88061-165, Brazil',2,'Nenhum campo modificado.'),(170,'2015-11-10 00:11:15',1,10,'15','R. Azevedo Sodré, 6 - Gonzaga, Santos - SP, 11055-051, Brazil',1,''),(171,'2015-11-10 00:11:20',1,10,'15','R. Azevedo Sodré, 6 - Gonzaga, Santos - SP, 11055-051, Brazil',2,'Nenhum campo modificado.'),(172,'2015-11-10 00:11:33',1,10,'16','R. Rui Pinto, 18 - Vila Morse, São Paulo - SP, 05624-100, Brazil',1,''),(173,'2015-11-10 00:11:45',1,9,'5','Casa da vo',1,''),(174,'2015-11-10 00:11:54',1,9,'6','Casa santos',1,''),(175,'2015-11-10 00:12:06',1,9,'7','Casa Floripa',1,'');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'user','auth','user'),(5,'content type','contenttypes','contenttype'),(6,'site','sites','site'),(7,'session','sessions','session'),(8,'flat page','flatpages','flatpage'),(9,'abrigo','abrigo','abrigo'),(10,'location','abrigo','location'),(11,'abrigo location','abrigo','abrigolocation'),(12,'address component type','abrigo','addresscomponenttype'),(13,'address component','abrigo','addresscomponent');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_flatpage`
--

DROP TABLE IF EXISTS `django_flatpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_flatpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `enable_comments` tinyint(1) NOT NULL,
  `template_name` varchar(70) NOT NULL,
  `registration_required` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_flatpage_c379dc61` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_flatpage`
--

LOCK TABLES `django_flatpage` WRITE;
/*!40000 ALTER TABLE `django_flatpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_flatpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_flatpage_sites`
--

DROP TABLE IF EXISTS `django_flatpage_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_flatpage_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flatpage_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `flatpage_id` (`flatpage_id`,`site_id`),
  KEY `django_flatpage_sites_872c4601` (`flatpage_id`),
  KEY `django_flatpage_sites_99732b5c` (`site_id`),
  CONSTRAINT `flatpage_id_refs_id_83cd0023` FOREIGN KEY (`flatpage_id`) REFERENCES `django_flatpage` (`id`),
  CONSTRAINT `site_id_refs_id_2df951cb` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_flatpage_sites`
--

LOCK TABLES `django_flatpage_sites` WRITE;
/*!40000 ALTER TABLE `django_flatpage_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_flatpage_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3umjew6vhvecmqzjspgjm03t2lb3mo0y','OTJkMDljOWJhZWE4OTNmMjczYjVkMTFhNjM5YjZlNjViMDQ2YmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2015-11-12 02:03:07'),('903wsf9rzg0nq6q4shqu8gxo9evejtje','ZWFkN2Q2NWQyOTI5ODQzMDI2YjRhZTJiNDM1ZjNlYjYyYjVjOGQzYjp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiUi4gTmVpdm8gUGF1bG8gUm9nZWxpbiwgMTEwIC0gQmFycmEgZGEgTGFnb2EsIEZsb3JpYW5cXHUwMGYzcG9saXMgLSBTQywgODgwNjEtMTY1LCBCcmF6aWxcXFwiOiBhZGljaW9uYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdGFyIG5vdmFtZW50ZSBhYmFpeG8uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJSLiBOZWl2byBQYXVsbyBSb2dlbGluLCAxMTAgLSBCYXJyYSBkYSBMYWdvYSwgRmxvcmlhblxcdTAwZjNwb2xpcyAtIFNDLCA4ODA2MS0xNjUsIEJyYXppbFxcXCI6IGFkaWNpb25hZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0YXIgbm92YW1lbnRlIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiYWJyaWdvIFxcXCJDYXNhXFxcIjogYWRpY2lvbmFkbyBjb20gc3VjZXNzby4gVm9jXFx1MDBlYSBwb2RlIGVkaXRhciBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJhYnJpZ28gXFxcIkNhc2FcXFwiIG1vZGlmaWNhZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0XFx1MDBlMS1sbyBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJSZW1vdmlkbyAxIGFicmlnbyBjb20gc3VjZXNzby5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwibG9jYXRpb24gXFxcIlIuIEZlcm1pbm8gVmlcXHUwMGVhaXJhIENvcmRlaXJvLCA0Mzc0IC0gRXNwaW5oZWlyb3MsIEl0YWphXFx1MDBlZCAtIFNDLCBCcmF6aWxcXFwiOiBhZGljaW9uYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdGFyIG5vdmFtZW50ZSBhYmFpeG8uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJSLiBGZXJtaW5vIFZpXFx1MDBlYWlyYSBDb3JkZWlybywgNDM3NCAtIEVzcGluaGVpcm9zLCBJdGFqYVxcdTAwZWQgLSBTQywgQnJhemlsXFxcIiBtb2RpZmljYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdFxcdTAwZTEtbG8gbm92YW1lbnRlIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiUmVtb3ZpZG8gMSBsb2NhdGlvbiBjb20gc3VjZXNzby5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiYWJyaWdvIFxcXCJTYWxcXHUwMGUzbyBQYXJvcXVpYWwgZGEgQ2FwZWxhIFNhbnRvIEFudFxcdTAwZjRuaW9cXFwiOiBhZGljaW9uYWRvIGNvbSBzdWNlc3NvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJhYnJpZ28gXFxcIkNvbXVuaWRhZGUgTm9zc2EgU3JhLiBBcGFyZWNpZGFcXFwiOiBhZGljaW9uYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdGFyIG5vdmFtZW50ZSBhYmFpeG8uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJSb2QuIEpvcmdlIExhY2VyZGEsIEttIDA0LCBzL25cXHUwMGJhIC0gRXNwaW5oZWlyaW5ob3NcXFwiOiBhZGljaW9uYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdGFyIG5vdmFtZW50ZSBhYmFpeG8uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJJdGFqYVxcdTAwZWQsIEl0YWphXFx1MDBlZCAtIFNDLCBCcmF6aWxcXFwiIG1vZGlmaWNhZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0XFx1MDBlMS1sbyBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJhYnJpZ28gXFxcIkNvbXVuaWRhZGUgTm9zc2EgU3JhLiBBcGFyZWNpZGFcXFwiOiBhZGljaW9uYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdGFyIG5vdmFtZW50ZSBhYmFpeG8uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlJlbW92aWRvIDMgYWJyaWdvcyBjb20gc3VjZXNzby5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwibG9jYXRpb24gXFxcIkl0YWphXFx1MDBlZCwgSXRhamFcXHUwMGVkIC0gU0MsIEJyYXppbFxcXCI6IGFkaWNpb25hZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0YXIgbm92YW1lbnRlIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwibG9jYXRpb24gXFxcIlIuIEJydW5vIFZpY2VudGUgZGEgTHV6LCA1NjI2IC0gRXNwaW5oZWlyb3MsIEl0YWphXFx1MDBlZCAtIFNDLCBCcmF6aWxcXFwiIG1vZGlmaWNhZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0XFx1MDBlMS1sbyBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJSZW1vdmlkbyAxMCBhZGRyZXNzIGNvbXBvbmVudCB0eXBlcyBjb20gc3VjZXNzby5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiUmVtb3ZpZG8gMSBhZGRyZXNzIGNvbXBvbmVudCB0eXBlIGNvbSBzdWNlc3NvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiUi4gQnJ1bm8gVmljZW50ZSBkYSBMdXosIDU2MjYgLSBFc3BpbmhlaXJvcywgSXRhamFcXHUwMGVkIC0gU0MsIEJyYXppbFxcXCIgbW9kaWZpY2FkbyBjb20gc3VjZXNzby4gVm9jXFx1MDBlYSBwb2RlIGVkaXRcXHUwMGUxLWxvIG5vdmFtZW50ZSBhYmFpeG8uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJSLiBCcnVubyBWaWNlbnRlIGRhIEx1eiwgNTYyNiAtIEVzcGluaGVpcm9zLCBJdGFqYVxcdTAwZWQgLSBTQywgQnJhemlsXFxcIiBtb2RpZmljYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdFxcdTAwZTEtbG8gbm92YW1lbnRlIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiYWJyaWdvIFxcXCJTYWxcXHUwMGUzbyBQYXJvcXVpYWwgZGEgQ2FwZWxhIFNhbnRvIEFudFxcdTAwZjRuaW9cXFwiOiBhZGljaW9uYWRvIGNvbSBzdWNlc3NvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiUi4gRmVybWlubyBWaVxcdTAwZWFpcmEgQ29yZGVpcm8sIDQzNzQgLSBFc3BpbmhlaXJvcywgSXRhamFcXHUwMGVkIC0gU0MsIEJyYXppbFxcXCI6IGFkaWNpb25hZG8gY29tIHN1Y2Vzc28uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlJlbW92aWRvIDIgbG9jYXRpb25zIGNvbSBzdWNlc3NvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiUi4gRmVybWlubyBWaVxcdTAwZWFpcmEgQ29yZGVpcm8sIDQzNzQgLSBFc3BpbmhlaXJvcywgSXRhamFcXHUwMGVkIC0gU0MsIEJyYXppbFxcXCI6IGFkaWNpb25hZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0YXIgbm92YW1lbnRlIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiUmVtb3ZpZG8gMSBhYnJpZ28gY29tIHN1Y2Vzc28uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlJlbW92aWRvIDEgbG9jYXRpb24gY29tIHN1Y2Vzc28uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJSLiBOZWl2byBQYXVsbyBSb2dlbGluLCAxMTAgLSBCYXJyYSBkYSBMYWdvYSwgRmxvcmlhblxcdTAwZjNwb2xpcyAtIFNDLCA4ODA2MS0xNjUsIEJyYXppbFxcXCI6IGFkaWNpb25hZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0YXIgbm92YW1lbnRlIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwibG9jYXRpb24gXFxcIlIuIE5laXZvIFBhdWxvIFJvZ2VsaW4sIDExMCAtIEJhcnJhIGRhIExhZ29hLCBGbG9yaWFuXFx1MDBmM3BvbGlzIC0gU0MsIDg4MDYxLTE2NSwgQnJhemlsXFxcIiBtb2RpZmljYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdFxcdTAwZTEtbG8gbm92YW1lbnRlIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwibG9jYXRpb24gXFxcIlIuIE5laXZvIFBhdWxvIFJvZ2VsaW4sIDExMCAtIEJhcnJhIGRhIExhZ29hLCBGbG9yaWFuXFx1MDBmM3BvbGlzIC0gU0MsIDg4MDYxLTE2NSwgQnJhemlsXFxcIiBtb2RpZmljYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdFxcdTAwZTEtbG8gbm92YW1lbnRlIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwibG9jYXRpb24gXFxcIlIuIE5laXZvIFBhdWxvIFJvZ2VsaW4sIDExMCAtIEJhcnJhIGRhIExhZ29hLCBGbG9yaWFuXFx1MDBmM3BvbGlzIC0gU0MsIDg4MDYxLTE2NSwgQnJhemlsXFxcIiBtb2RpZmljYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdFxcdTAwZTEtbG8gbm92YW1lbnRlIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwibG9jYXRpb24gXFxcIlIuIE5laXZvIFBhdWxvIFJvZ2VsaW4sIDExMCAtIEJhcnJhIGRhIExhZ29hLCBGbG9yaWFuXFx1MDBmM3BvbGlzIC0gU0MsIDg4MDYxLTE2NSwgQnJhemlsXFxcIiBtb2RpZmljYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdFxcdTAwZTEtbG8gbm92YW1lbnRlIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwibG9jYXRpb24gXFxcIlIuIE5laXZvIFBhdWxvIFJvZ2VsaW4sIDExMCAtIEJhcnJhIGRhIExhZ29hLCBGbG9yaWFuXFx1MDBmM3BvbGlzIC0gU0MsIDg4MDYxLTE2NSwgQnJhemlsXFxcIjogZXhjbHVcXHUwMGVkZG8gY29tIHN1Y2Vzc28uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJSLiBGZXJtaW5vIFZpXFx1MDBlYWlyYSBDb3JkZWlybywgNDM3NCAtIEVzcGluaGVpcm9zLCBJdGFqYVxcdTAwZWQgLSBTQywgQnJhemlsXFxcIjogYWRpY2lvbmFkbyBjb20gc3VjZXNzby4gVm9jXFx1MDBlYSBwb2RlIGVkaXRhciBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiUi4gTmVpdm8gUGF1bG8gUm9nZWxpbiwgMTEwIC0gQmFycmEgZGEgTGFnb2EsIEZsb3JpYW5cXHUwMGYzcG9saXMgLSBTQywgODgwNjEtMTY1LCBCcmF6aWxcXFwiOiBhZGljaW9uYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdGFyIG5vdmFtZW50ZSBhYmFpeG8uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJSb2QuIEpvcmdlIExhY2VyZGEsIEttIDA0LCBzL25cXHUwMGJhIC0gRXNwaW5oZWlyaW5ob3NcXFwiOiBhZGljaW9uYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdGFyIG5vdmFtZW50ZSBhYmFpeG8uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJJdGFqYVxcdTAwZWQsIEl0YWphXFx1MDBlZCAtIFNDLCBCcmF6aWxcXFwiOiBhZGljaW9uYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdGFyIG5vdmFtZW50ZSBhYmFpeG8uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJSLiBGZXJtaW5vIFZpXFx1MDBlYWlyYSBDb3JkZWlybywgNDM3NCAtIEVzcGluaGVpcm9zLCBJdGFqYVxcdTAwZWQgLSBTQywgQnJhemlsXFxcIiBtb2RpZmljYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdFxcdTAwZTEtbG8gbm92YW1lbnRlIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwibG9jYXRpb24gXFxcIlIuIEZlcm1pbm8gVmlcXHUwMGVhaXJhIENvcmRlaXJvLCA0Mzc0IC0gRXNwaW5oZWlyb3MsIEl0YWphXFx1MDBlZCAtIFNDLCBCcmF6aWxcXFwiIGFsdGVyYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgYWRpY2lvbmFyIHVtIG91dHJvIGxvY2F0aW9uIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwibG9jYXRpb24gXFxcIlxcXCI6IGFkaWNpb25hZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0YXIgbm92YW1lbnRlIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwibG9jYXRpb24gXFxcIlIuIE5laXZvIFBhdWxvIFJvZ2VsaW4sIDExMCAtIEJhcnJhIGRhIExhZ29hLCBGbG9yaWFuXFx1MDBmM3BvbGlzIC0gU0MsIDg4MDYxLTE2NSwgQnJhemlsXFxcIiBtb2RpZmljYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdFxcdTAwZTEtbG8gbm92YW1lbnRlIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwibG9jYXRpb24gXFxcIlIuIE5laXZvIFBhdWxvIFJvZ2VsaW4sIDExMCAtIEJhcnJhIGRhIExhZ29hLCBGbG9yaWFuXFx1MDBmM3BvbGlzIC0gU0MsIDg4MDYxLTE2NSwgQnJhemlsXFxcIiBhbHRlcmFkbyBjb20gc3VjZXNzby4gVm9jXFx1MDBlYSBwb2RlIGFkaWNpb25hciB1bSBvdXRybyBsb2NhdGlvbiBhYmFpeG8uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlJlbW92aWRvIDIgbG9jYXRpb25zIGNvbSBzdWNlc3NvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJSZW1vdmlkbyAxNCBhZGRyZXNzIGNvbXBvbmVudHMgY29tIHN1Y2Vzc28uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJJdGFqYVxcdTAwZWQsIEl0YWphXFx1MDBlZCAtIFNDLCBCcmF6aWxcXFwiIGFkaWNpb25hZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBhZGljaW9uYXIgdW0gb3V0cm8gbG9jYXRpb24gYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiUi4gTmVpdm8gUGF1bG8gUm9nZWxpbiwgMTEwIC0gQmFycmEgZGEgTGFnb2EsIEZsb3JpYW5cXHUwMGYzcG9saXMgLSBTQywgODgwNjEtMTY1LCBCcmF6aWxcXFwiOiBhZGljaW9uYWRvIGNvbSBzdWNlc3NvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiUi4gTmVpdm8gUGF1bG8gUm9nZWxpbiwgMTEwIC0gQmFycmEgZGEgTGFnb2EsIEZsb3JpYW5cXHUwMGYzcG9saXMgLSBTQywgODgwNjEtMTY1LCBCcmF6aWxcXFwiIG1vZGlmaWNhZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0XFx1MDBlMS1sbyBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiUi4gTmVpdm8gUGF1bG8gUm9nZWxpbiwgMTEwIC0gQmFycmEgZGEgTGFnb2EsIEZsb3JpYW5cXHUwMGYzcG9saXMgLSBTQywgODgwNjEtMTY1LCBCcmF6aWxcXFwiIG1vZGlmaWNhZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0XFx1MDBlMS1sbyBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiUi4gTmVpdm8gUGF1bG8gUm9nZWxpbiwgMTEwIC0gQmFycmEgZGEgTGFnb2EsIEZsb3JpYW5cXHUwMGYzcG9saXMgLSBTQywgODgwNjEtMTY1LCBCcmF6aWxcXFwiIG1vZGlmaWNhZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0XFx1MDBlMS1sbyBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiUi4gTmVpdm8gUGF1bG8gUm9nZWxpbiwgMTEwIC0gQmFycmEgZGEgTGFnb2EsIEZsb3JpYW5cXHUwMGYzcG9saXMgLSBTQywgODgwNjEtMTY1LCBCcmF6aWxcXFwiIG1vZGlmaWNhZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0XFx1MDBlMS1sbyBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiUi4gTmVpdm8gUGF1bG8gUm9nZWxpbiwgMTEwIC0gQmFycmEgZGEgTGFnb2EsIEZsb3JpYW5cXHUwMGYzcG9saXMgLSBTQywgODgwNjEtMTY1LCBCcmF6aWxcXFwiIG1vZGlmaWNhZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0XFx1MDBlMS1sbyBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiUi4gTmVpdm8gUGF1bG8gUm9nZWxpbiwgMTEwIC0gQmFycmEgZGEgTGFnb2EsIEZsb3JpYW5cXHUwMGYzcG9saXMgLSBTQywgODgwNjEtMTY1LCBCcmF6aWxcXFwiIG1vZGlmaWNhZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0XFx1MDBlMS1sbyBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJSZW1vdmlkbyAxMCBhZGRyZXNzIGNvbXBvbmVudHMgY29tIHN1Y2Vzc28uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJSLiBOZWl2byBQYXVsbyBSb2dlbGluLCAxMTAgLSBCYXJyYSBkYSBMYWdvYSwgRmxvcmlhblxcdTAwZjNwb2xpcyAtIFNDLCA4ODA2MS0xNjUsIEJyYXppbFxcXCIgbW9kaWZpY2FkbyBjb20gc3VjZXNzby4gVm9jXFx1MDBlYSBwb2RlIGVkaXRcXHUwMGUxLWxvIG5vdmFtZW50ZSBhYmFpeG8uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJSLiBOZWl2byBQYXVsbyBSb2dlbGluLCAxMTAgLSBCYXJyYSBkYSBMYWdvYSwgRmxvcmlhblxcdTAwZjNwb2xpcyAtIFNDLCA4ODA2MS0xNjUsIEJyYXppbFxcXCIgbW9kaWZpY2FkbyBjb20gc3VjZXNzby4gVm9jXFx1MDBlYSBwb2RlIGVkaXRcXHUwMGUxLWxvIG5vdmFtZW50ZSBhYmFpeG8uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJJdGFqYVxcdTAwZWQsIEl0YWphXFx1MDBlZCAtIFNDLCBCcmF6aWxcXFwiIG1vZGlmaWNhZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0XFx1MDBlMS1sbyBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiSXRhamFcXHUwMGVkLCBJdGFqYVxcdTAwZWQgLSBTQywgQnJhemlsXFxcIiBtb2RpZmljYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdFxcdTAwZTEtbG8gbm92YW1lbnRlIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwibG9jYXRpb24gXFxcIkl0YWphXFx1MDBlZCwgSXRhamFcXHUwMGVkIC0gU0MsIEJyYXppbFxcXCIgbW9kaWZpY2FkbyBjb20gc3VjZXNzby4gVm9jXFx1MDBlYSBwb2RlIGVkaXRcXHUwMGUxLWxvIG5vdmFtZW50ZSBhYmFpeG8uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlJlbW92aWRvIDEgbG9jYXRpb24gY29tIHN1Y2Vzc28uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcIlJlbW92aWRvIDEgbG9jYXRpb24gY29tIHN1Y2Vzc28uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJSLiBGZXJtaW5vIFZpXFx1MDBlYWlyYSBDb3JkZWlybywgNDM3NCAtIEVzcGluaGVpcm9zLCBJdGFqYVxcdTAwZWQgLSBTQywgQnJhemlsXFxcIjogYWRpY2lvbmFkbyBjb20gc3VjZXNzby4gVm9jXFx1MDBlYSBwb2RlIGVkaXRhciBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiUi4gRmVybWlubyBWaVxcdTAwZWFpcmEgQ29yZGVpcm8sIDQzNzQgLSBFc3BpbmhlaXJvcywgSXRhamFcXHUwMGVkIC0gU0MsIEJyYXppbFxcXCIgbW9kaWZpY2FkbyBjb20gc3VjZXNzby4gVm9jXFx1MDBlYSBwb2RlIGVkaXRcXHUwMGUxLWxvIG5vdmFtZW50ZSBhYmFpeG8uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJSLiBGZXJtaW5vIFZpXFx1MDBlYWlyYSBDb3JkZWlybywgNDM3NCAtIEVzcGluaGVpcm9zLCBJdGFqYVxcdTAwZWQgLSBTQywgQnJhemlsXFxcIiBtb2RpZmljYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdFxcdTAwZTEtbG8gbm92YW1lbnRlIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwibG9jYXRpb24gXFxcIlIuIEZlcm1pbm8gVmlcXHUwMGVhaXJhIENvcmRlaXJvLCA0Mzc0IC0gRXNwaW5oZWlyb3MsIEl0YWphXFx1MDBlZCAtIFNDLCBCcmF6aWxcXFwiIG1vZGlmaWNhZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0XFx1MDBlMS1sbyBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJhYnJpZ28gXFxcIkNvbXVuaWRhZGUgTm9zc2EgU3JhLiBBcGFyZWNpZGFcXFwiOiBhZGljaW9uYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdGFyIG5vdmFtZW50ZSBhYmFpeG8uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImFicmlnbyBcXFwiQ29tdW5pZGFkZSBOb3NzYSBTcmEuIEFwYXJlY2lkYVxcXCIgbW9kaWZpY2FkbyBjb20gc3VjZXNzby4gVm9jXFx1MDBlYSBwb2RlIGVkaXRcXHUwMGUxLWxvIG5vdmFtZW50ZSBhYmFpeG8uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJSLiBGZXJtaW5vIFZpXFx1MDBlYWlyYSBDb3JkZWlybywgNDM3NCAtIEVzcGluaGVpcm9zLCBJdGFqYVxcdTAwZWQgLSBTQywgQnJhemlsXFxcIiBtb2RpZmljYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdFxcdTAwZTEtbG8gbm92YW1lbnRlIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwibG9jYXRpb24gXFxcIlIuIEZlcm1pbm8gVmlcXHUwMGVhaXJhIENvcmRlaXJvLCA0Mzc0IC0gRXNwaW5oZWlyb3MsIEl0YWphXFx1MDBlZCAtIFNDLCBCcmF6aWxcXFwiIG1vZGlmaWNhZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0XFx1MDBlMS1sbyBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiUnVhIENsYXJpbmRvIFMuIGRhIEN1bmhhLCAxMzg1IC0gRXNwaW5oZWlyaW5ob3MgLSBTQy0gSXRhamFpXFxcIjogYWRpY2lvbmFkbyBjb20gc3VjZXNzby4gVm9jXFx1MDBlYSBwb2RlIGVkaXRhciBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiUnVhIENsYXJpbmRvIFMuIGRhIEN1bmhhLCAxMzg1IC0gRXNwaW5oZWlyaW5ob3MgLSBTQy0gSXRhamFpXFxcIjogYWRpY2lvbmFkbyBjb20gc3VjZXNzby5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwibG9jYXRpb24gXFxcIlIuIEZlcm1pbm8gVmlcXHUwMGVhaXJhIENvcmRlaXJvLCA0Mzc0IC0gRXNwaW5oZWlyb3MsIEl0YWphXFx1MDBlZCAtIFNDLCBCcmF6aWxcXFwiIG1vZGlmaWNhZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0XFx1MDBlMS1sbyBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJhYnJpZ28gXFxcIkNsYXJpbmRvIFNlYmFzdGlcXHUwMGUzbyBkYSBDdW5oYVxcXCI6IG1vZGlmaWNhZG8gY29tIHN1Y2Vzc28uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImFicmlnbyBcXFwiRS4gSS4gSm9yZ2UgRG9taW5nb3MgR29uemFnYVxcXCI6IGFkaWNpb25hZG8gY29tIHN1Y2Vzc28uIFZvY1xcdTAwZWEgcG9kZSBlZGl0YXIgbm92YW1lbnRlIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiYWJyaWdvIFxcXCJFLiBJLiBKb3JnZSBEb21pbmdvcyBHb256YWdhXFxcIiBtb2RpZmljYWRvIGNvbSBzdWNlc3NvLiBWb2NcXHUwMGVhIHBvZGUgZWRpdFxcdTAwZTEtbG8gbm92YW1lbnRlIGFiYWl4by5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiYWJyaWdvIFxcXCJFLiBNLiBSb3NhIE5lZ3JlaXJvcyBDYWJyYWxcXFwiOiBhZGljaW9uYWRvIGNvbSBzdWNlc3NvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJhYnJpZ28gXFxcIlNhbFxcdTAwZTNvIFBhcm9xdWlhbCBkYSBDYXBlbGEgU2FudG8gQW50XFx1MDBmNG5pb1xcXCI6IGFkaWNpb25hZG8gY29tIHN1Y2Vzc28uXCJdXSIsIl9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2015-11-23 00:20:10'),('lcbcnsn821l60fto9nikzkuvkorgxf60','OTJkMDljOWJhZWE4OTNmMjczYjVkMTFhNjM5YjZlNjViMDQ2YmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2015-11-21 00:00:52'),('q0nn8dbfuoo7fpqx7rwxtxapbng8n2wv','OTJkMDljOWJhZWE4OTNmMjczYjVkMTFhNjM5YjZlNjViMDQ2YmM0YTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=','2015-11-24 00:09:35'),('zv5q95672i73bbyktoxnnspqfcg6ycoh','MWUxMDcxMzcyYjEyOTJkNjZhNmVmY2EzMzMzZTJkYmU5OGNiZWE5ZTp7Il9tZXNzYWdlcyI6IltbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiUnVhIG5laXZvIFBhdWxvIHJvZ2VsaW4sMTEwIC0gQmFycmEgZGEgTGFnb2EgU0MgRmxvcmlhbm9wb2xpc1xcXCI6IGFkaWNpb25hZG8gY29tIHN1Y2Vzc28uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJSdWEgbmVpdm8gUGF1bG8gcm9nZWxpbiwxMTAgLSBCYXJyYSBkYSBMYWdvYSBTQyBGbG9yaWFub3BvbGlzXFxcIjogZXhjbHVcXHUwMGVkZG8gY29tIHN1Y2Vzc28uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImxvY2F0aW9uIFxcXCJSdWEgbmVpdm8gUGF1bG8gcm9nZWxpbiwxMTAgLSBCYXJyYSBkYSBMYWdvYSBTQyBGbG9yaWFub3BvbGlzXFxcIjogYWRpY2lvbmFkbyBjb20gc3VjZXNzby5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwiYWJyaWdvIFxcXCJ0ZXN0ZVxcXCI6IG1vZGlmaWNhZG8gY29tIHN1Y2Vzc28uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwzMCxcIk9zIGl0ZW5zIGRldmVtIHNlciBzZWxlY2lvbmFkb3MgYSBmaW0gZGUgZXhlY3V0YXIgYVxcdTAwZTdcXHUwMGY1ZXMgc29icmUgZWxlcy4gTmVuaHVtIGl0ZW0gZm9pIG1vZGlmaWNhZG8uXCJdLFtcIl9fanNvbl9tZXNzYWdlXCIsMCwyNSxcImFicmlnbyBcXFwiQ2FzYSBzYW50b3NcXFwiOiBhZGljaW9uYWRvIGNvbSBzdWNlc3NvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJSZW1vdmlkbyAxIGFicmlnbyBjb20gc3VjZXNzby5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwibG9jYXRpb24gXFxcIkF2LiBBemV2ZWRvIFNvZHJlLCBuIDYgLSBTYW50b3MgU1AgXFxcIjogYWRpY2lvbmFkbyBjb20gc3VjZXNzby4gVm9jXFx1MDBlYSBwb2RlIGVkaXRhciBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiQXYuIEF6ZXZlZG8gU29kcmUsIG4gNiAtIFNhbnRvcyBTUCBcXFwiOiBtb2RpZmljYWRvIGNvbSBzdWNlc3NvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJhYnJpZ28gXFxcIkNhc2Egc2FudG9zXFxcIjogYWRpY2lvbmFkbyBjb20gc3VjZXNzby5cIl0sW1wiX19qc29uX21lc3NhZ2VcIiwwLDI1LFwibG9jYXRpb24gXFxcIlJ1YSBSdWkgUGludG8sIDQzIFZpbGEgU29uaWEgU2FvIFBhdWxvIFNQXFxcIjogYWRpY2lvbmFkbyBjb20gc3VjZXNzby4gVm9jXFx1MDBlYSBwb2RlIGVkaXRhciBub3ZhbWVudGUgYWJhaXhvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJsb2NhdGlvbiBcXFwiUnVhIFJ1aSBQaW50bywgNDMgVmlsYSBTb25pYSBTYW8gUGF1bG8gU1BcXFwiOiBtb2RpZmljYWRvIGNvbSBzdWNlc3NvLlwiXSxbXCJfX2pzb25fbWVzc2FnZVwiLDAsMjUsXCJhYnJpZ28gXFxcIkNhc2Egdm9cXFwiOiBhZGljaW9uYWRvIGNvbSBzdWNlc3NvLlwiXV0iLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9','2015-11-13 04:01:04');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-09 22:22:41
