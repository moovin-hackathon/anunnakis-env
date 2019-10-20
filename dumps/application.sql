-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: mysql.res.internal    Database: anunnakis_application_7b10ebaf-fecd-4d5b-80f5-a7121f7e4463
-- ------------------------------------------------------
-- Server version	5.7.28

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` char(36) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('bea500c1-86fb-4cd4-b728-112673bd1580','Pablo Quadrado','pabloquadrado@gmail.com'),('d7a65e96-9416-4690-ad5a-c058e2053040','Jonathan Ferreira','cabolosoferreira@gmail.com'),('d8788c3b-1043-4874-af05-6fb3e2189edc','Matheus Gonzaga','matheuzin@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_variation_deal`
--

DROP TABLE IF EXISTS `customer_variation_deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_variation_deal` (
  `id` char(36) NOT NULL,
  `variation_id` char(36) NOT NULL,
  `customer_id` char(36) NOT NULL,
  `variation_price` decimal(10,2) NOT NULL,
  `deal_price` decimal(10,2) NOT NULL,
  `status` enum('NEW','ACCEPTED','REFUSED') NOT NULL DEFAULT 'NEW',
  `deal_uri` varchar(255) DEFAULT NULL,
  `deal_uri_expires` timestamp NULL DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_customer_variation_deal_variation1_idx` (`variation_id`),
  KEY `fk_customer_variation_deal_customer1_idx` (`customer_id`),
  CONSTRAINT `fk_customer_variation_deal_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_variation_deal_variation1` FOREIGN KEY (`variation_id`) REFERENCES `variation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_variation_deal`
--

LOCK TABLES `customer_variation_deal` WRITE;
/*!40000 ALTER TABLE `customer_variation_deal` DISABLE KEYS */;
INSERT INTO `customer_variation_deal` VALUES ('d47a0e50-a2c6-42b8-86fe-778af041c6d6','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','bea500c1-86fb-4cd4-b728-112673bd1580',120.00,100.00,'NEW','https://www.katy.com.br/camisetas/camisa-polo-masculina-asics-tennis-tnb4000-400-azul?utm_campaign=soscommerce','2019-10-20 12:00:00','2019-10-19 12:00:00');
/*!40000 ALTER TABLE `customer_variation_deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module` (
  `id` char(36) NOT NULL,
  `identifier` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES ('56e7dd0a-e1f6-4991-b639-d612caeaa729','deal','Negociação',1);
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_configuration`
--

DROP TABLE IF EXISTS `module_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_configuration` (
  `module_id` char(36) NOT NULL,
  `identifier` varchar(45) NOT NULL,
  `label` varchar(45) NOT NULL,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`identifier`,`module_id`),
  KEY `fk_module_configuration_module1_idx` (`module_id`),
  CONSTRAINT `fk_module_configuration_module1` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_configuration`
--

LOCK TABLES `module_configuration` WRITE;
/*!40000 ALTER TABLE `module_configuration` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` char(36) NOT NULL,
  `collator_code` varchar(45) NOT NULL,
  `title` varchar(100) NOT NULL,
  `category` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('357ad2b6-3b04-4c78-8531-6e5e3d1ee3a5','23','Camisa Polo','Roupas > Casual > Camisas');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation`
--

DROP TABLE IF EXISTS `variation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variation` (
  `id` char(36) NOT NULL,
  `sku` varchar(45) NOT NULL,
  `images` json DEFAULT NULL,
  `previous_price` decimal(10,2) NOT NULL,
  `current_price` decimal(10,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `color` varchar(45) DEFAULT NULL,
  `grid` varchar(45) DEFAULT NULL,
  `grid_type` enum('SIZE','VOLTAGE','FLAVOR') DEFAULT NULL,
  `product_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku_UNIQUE` (`sku`),
  KEY `fk_variation_product_idx` (`product_id`),
  CONSTRAINT `fk_variation_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation`
--

LOCK TABLES `variation` WRITE;
/*!40000 ALTER TABLE `variation` DISABLE KEYS */;
INSERT INTO `variation` VALUES ('3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','5021','[\"https://www.katy.com.br/cdn/imagens/produtos/original/camisa-polo-masculina-asics-tennis-7088ea99294b2830759a762f0b81d9b6.jpg\", \"https://www.katy.com.br/cdn/imagens/produtos/original/camisa-polo-masculina-asics-tennis-7088ea99294b2830759a762f0b81d9b6.jpg\"]',120.00,150.00,10,'https://www.katy.com.br/camisetas/camisa-polo-masculina-asics-tennis-tnb4000-400-azul','Azul','G','SIZE','357ad2b6-3b04-4c78-8531-6e5e3d1ee3a5'),('b779aebd-02e6-4942-9e00-dc31ac121f31','5022','[\"https://www.katy.com.br/cdn/imagens/produtos/original/camisa-polo-masculina-asics-tennis-7088ea99294b2830759a762f0b81d9b6.jpg\", \"https://www.katy.com.br/cdn/imagens/produtos/original/camisa-polo-masculina-asics-tennis-7088ea99294b2830759a762f0b81d9b6.jpg\"]',120.00,150.00,10,'https://www.katy.com.br/camisetas/camisa-polo-masculina-asics-tennis-tnb4000-400-azul','Azul','M','SIZE','357ad2b6-3b04-4c78-8531-6e5e3d1ee3a5');
/*!40000 ALTER TABLE `variation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation_access`
--

DROP TABLE IF EXISTS `variation_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variation_access` (
  `id` varchar(36) NOT NULL,
  `variation_id` char(36) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_variation_access_variation1_idx` (`variation_id`),
  CONSTRAINT `fk_variation_access_variation1` FOREIGN KEY (`variation_id`) REFERENCES `variation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_access`
--

LOCK TABLES `variation_access` WRITE;
/*!40000 ALTER TABLE `variation_access` DISABLE KEYS */;
INSERT INTO `variation_access` VALUES ('3d13bca5-b675-4c33-a6ab-8af39327d085','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-16 12:15:12'),('54960255-32d4-4fb8-a2f8-dc6dd176e6b1','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-19 12:15:12'),('724b605a-ff73-4c60-8bde-2fb7d165c0c1','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-18 12:15:12'),('91703f55-90f0-4c79-8236-2e8e9fbea82f','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-17 12:15:12');
/*!40000 ALTER TABLE `variation_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variation_sale`
--

DROP TABLE IF EXISTS `variation_sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variation_sale` (
  `id` varchar(36) NOT NULL,
  `variation_id` char(36) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_variation_sales_variation1_idx` (`variation_id`),
  CONSTRAINT `fk_variation_sales_variation1` FOREIGN KEY (`variation_id`) REFERENCES `variation` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variation_sale`
--

LOCK TABLES `variation_sale` WRITE;
/*!40000 ALTER TABLE `variation_sale` DISABLE KEYS */;
INSERT INTO `variation_sale` VALUES ('3d13bca5-b675-4c33-a6ab-8af39327d085','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-16 12:15:12'),('54960255-32d4-4fb8-a2f8-dc6dd176e6b1','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-19 12:15:12'),('724b605a-ff73-4c60-8bde-2fb7d165c0c1','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-18 12:15:12'),('91703f55-90f0-4c79-8236-2e8e9fbea82f','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-17 12:15:12');
/*!40000 ALTER TABLE `variation_sale` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-19 23:44:37
