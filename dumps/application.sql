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
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `id` char(36) NOT NULL,
  `identifier` varchar(45) NOT NULL,
  `type` enum('VARIATION') NOT NULL,
  `code` varchar(45) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `viewed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES ('11aa74f5-a543-4107-ad00-37e399c5d78a','LOW_STOCK_QUANTITY','VARIATION','85639CP','Estoque baixo na variação.','2019-10-20 10:43:44',0),('326eeb5f-1938-42e6-ad65-821dbf758681','LOW_STOCK_QUANTITY','VARIATION','85639CP-3','Estoque baixo na variação.','2019-10-20 10:44:00',0),('3e5bf786-f681-480d-8c74-b82fc46aa691','LOW_STOCK_QUANTITY','VARIATION','as5s5','Estoque baixo na variação.','2019-10-20 10:49:54',0),('75dbb653-27b7-46b8-a1d5-319a4a5f0f1a','LOW_SALES','VARIATION','5022','Seu produto está com poucas vendas.','2019-10-19 10:30:00',0),('a07738ac-a2f9-4054-bee9-5a68742e8a04','LOW_STOCK_QUANTITY','VARIATION','5021','Seu produto está vendendo bastante.','2019-10-19 10:30:00',0),('b8c97629-5ab2-4cea-819b-bfa17c51aacb','LOW_STOCK_QUANTITY','VARIATION','053027','Estoque baixo na variação.','2019-10-20 10:49:29',0),('d32761f0-b213-46ff-835a-bf7b4825f7ef','LOW_STOCK_QUANTITY','VARIATION','a6ss3s6s','Estoque baixo na variação.','2019-10-20 10:49:54',0),('e02f34b6-b5e9-4d35-ab86-7e10ced87641','LOW_STOCK_QUANTITY','VARIATION','85639CP','Estoque baixo na variação.','2019-10-20 10:43:59',0),('e38aebfc-c878-4537-b30b-ed228cedfe53','LOW_STOCK_QUANTITY','VARIATION','1324545','Estoque baixo na variação.','2019-10-20 10:49:29',0);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
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
INSERT INTO `product` VALUES ('1a7f3333-b7d3-49de-83fc-9841968d0cdf','965','Camiseta Masculina Reserva Manga Curta Marinho 3','Roupas > Camisetas > Masculino > Reserva'),('357ad2b6-3b04-4c78-8531-6e5e3d1ee3a5','23','Camisa Polo','Roupas > Casual > Camisas'),('40f6af3f-d507-478a-8dea-e53109896a47','21','BOTA FEMININA CRAVO E CANELA COTURNO','Calçados > Botas > Feminino > Cravo e Canela'),('44c728e0-d25f-40f5-973a-d59e3e130dd1','33','Camiseta Masculina Reserva Manga Curta Marinho 2','Roupas > Camisetas > Masculino > Reserva'),('751c6360-dadf-4098-9ca6-d5a0712f1998','965','Camiseta Masculina Reserva Manga Curta Marinho 4','Roupas > Camisetas > Masculino > Reserva'),('8d4a2dd1-41b2-4e68-8b89-0939dbad53c2','12','Camiseta Masculina Reserva Manga Curta Marinho','Roupas > Camisetas > Masculino > Reserva');
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
INSERT INTO `variation` VALUES ('00ce7e4a-5560-455c-b495-9342ade30955','1324545','[\"http://cdnv2.moovin.com.br/playground/imagens/produtos/original/camiseta-masculina-reserva-manga-curta-cd102e03d9afe707fdd01ea82a2a5dec.jpg\"]',179.00,129.90,0,'http://playground.staging.moovin.com.br/camiseta-masculina-reserva-manga-curta-marinho','Marinho','G','SIZE','8d4a2dd1-41b2-4e68-8b89-0939dbad53c2'),('0ad40087-ebdd-4e3e-9c33-38781e808cf3','as5s5','[\"http://cdnv2.moovin.com.br/playground/imagens/produtos/original/camiseta-masculina-reserva-manga-curta-cd102e03d9afe707fdd01ea82a2a5dec.jpg\"]',179.00,129.90,0,'http://playground.staging.moovin.com.br/camiseta-masculina-reserva-manga-curta-marinho','Marinho','G','SIZE','44c728e0-d25f-40f5-973a-d59e3e130dd1'),('1c3b591d-406c-4769-976e-68aaa5646fa4','aaaaas66','[\"http://cdnv2.moovin.com.br/playground/imagens/produtos/original/camiseta-masculina-reserva-manga-curta-af937f442ab7e810293c2910741d28f4.jpg\"]',179.00,129.90,12,'http://playground.staging.moovin.com.br/camiseta-masculina-reserva-manga-curta-branco','Branco','G','SIZE','1a7f3333-b7d3-49de-83fc-9841968d0cdf'),('3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','5021','[\"https://www.katy.com.br/cdn/imagens/produtos/original/camisa-polo-masculina-asics-tennis-7088ea99294b2830759a762f0b81d9b6.jpg\", \"https://www.katy.com.br/cdn/imagens/produtos/original/camisa-polo-masculina-asics-tennis-7088ea99294b2830759a762f0b81d9b6.jpg\"]',120.00,150.00,10,'https://www.katy.com.br/camisetas/camisa-polo-masculina-asics-tennis-tnb4000-400-azul','Azul','G','SIZE','357ad2b6-3b04-4c78-8531-6e5e3d1ee3a5'),('4033a86d-9ad4-4486-aa6f-6699f76ddb51','053027','[\"http://cdnv2.moovin.com.br/playground/imagens/produtos/original/camiseta-masculina-reserva-manga-curta-af937f442ab7e810293c2910741d28f4.jpg\"]',179.00,129.90,0,'http://playground.staging.moovin.com.br/camiseta-masculina-reserva-manga-curta-branco','Branco','G','SIZE','8d4a2dd1-41b2-4e68-8b89-0939dbad53c2'),('5b30bafc-63fe-41ba-9cad-c8b708e1d3be','999','[\"http://cdnv2.moovin.com.br/playground/imagens/produtos/original/camiseta-masculina-reserva-manga-curta-af937f442ab7e810293c2910741d28f4.jpg\"]',179.00,129.90,14,'http://playground.staging.moovin.com.br/camiseta-masculina-reserva-manga-curta-branco','Branco','G','SIZE','751c6360-dadf-4098-9ca6-d5a0712f1998'),('6c71fd39-a092-4e58-b40c-cadd0652054d','ass6555','[\"http://cdnv2.moovin.com.br/playground/imagens/produtos/original/camiseta-masculina-reserva-manga-curta-cd102e03d9afe707fdd01ea82a2a5dec.jpg\"]',179.00,129.90,100,'http://playground.staging.moovin.com.br/camiseta-masculina-reserva-manga-curta-marinho','Marinho','G','SIZE','1a7f3333-b7d3-49de-83fc-9841968d0cdf'),('9da84f4e-79ba-4e3e-9670-9217a0c02058','566666','[\"http://cdnv2.moovin.com.br/playground/imagens/produtos/original/camiseta-masculina-reserva-manga-curta-cd102e03d9afe707fdd01ea82a2a5dec.jpg\"]',179.00,129.90,500,'http://playground.staging.moovin.com.br/camiseta-masculina-reserva-manga-curta-marinho','Marinho','G','SIZE','751c6360-dadf-4098-9ca6-d5a0712f1998'),('9dddf332-4173-4b45-acff-a75f83109251','85639CP-3','[\"https://www.katy.com.br/cdn/imagens/produtos/original/bota-feminina-cravo-e-canela-coturno-9db9bfd6420ecff82659cfd695ccf9c9.jpg\", \"https://www.katy.com.br/cdn/imagens/produtos/original/bota-feminina-cravo-e-canela-coturno-9db9bfd6420ecff82659cfd695ccf9c9.jpg\", \"https://www.katy.com.br/cdn/imagens/produtos/original/bota-feminina-cravo-e-canela-coturno-9db9bfd6420ecff82659cfd695ccf9c9.jpg\"]',239.90,199.90,10,'https://www.katy.com.br/botas/bota-feminina-cravo-e-canela-coturno-85639cp-3-primula-matelasse-durian','Primula','34','SIZE','40f6af3f-d507-478a-8dea-e53109896a47'),('b779aebd-02e6-4942-9e00-dc31ac121f31','5022','[\"https://www.katy.com.br/cdn/imagens/produtos/original/camisa-polo-masculina-asics-tennis-7088ea99294b2830759a762f0b81d9b6.jpg\", \"https://www.katy.com.br/cdn/imagens/produtos/original/camisa-polo-masculina-asics-tennis-7088ea99294b2830759a762f0b81d9b6.jpg\"]',120.00,150.00,10,'https://www.katy.com.br/camisetas/camisa-polo-masculina-asics-tennis-tnb4000-400-azul','Azul','M','SIZE','357ad2b6-3b04-4c78-8531-6e5e3d1ee3a5'),('d8a5e930-eadd-4877-951a-f8cd3256a437','a6ss3s6s','[\"http://cdnv2.moovin.com.br/playground/imagens/produtos/original/camiseta-masculina-reserva-manga-curta-af937f442ab7e810293c2910741d28f4.jpg\"]',179.00,129.90,0,'http://playground.staging.moovin.com.br/camiseta-masculina-reserva-manga-curta-branco','Branco','G','SIZE','44c728e0-d25f-40f5-973a-d59e3e130dd1'),('e7972b12-6b3a-4303-a5cf-51e9dba3ef5d','85639CP','[\"https://www.katy.com.br/cdn/imagens/produtos/original/bota-feminina-cravo-e-canela-coturno-df629963707e1e429305f91514a54334.jpg\", \"https://www.katy.com.br/cdn/imagens/produtos/original/bota-feminina-cravo-e-canela-coturno-df629963707e1e429305f91514a54334.jpg\", \"https://www.katy.com.br/cdn/imagens/produtos/original/bota-feminina-cravo-e-canela-coturno-df629963707e1e429305f91514a54334.jpg\", \"https://www.katy.com.br/cdn/imagens/produtos/original/bota-feminina-cravo-e-canela-coturno-df629963707e1e429305f91514a54334.jpg\"]',250.00,239.90,10,'https://www.katy.com.br/botas/bota-feminina-cravo-e-canela-coturno-85639cp-1-preto-matelasse-durian','Preto','34','SIZE','40f6af3f-d507-478a-8dea-e53109896a47');
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
INSERT INTO `variation_access` VALUES ('04899375-9f66-4481-8a40-5a290037f67d','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-20 11:13:46'),('11d32e65-ab7b-47cb-a9d9-110f348b043f','0ad40087-ebdd-4e3e-9c33-38781e808cf3','2019-10-20 11:15:12'),('1ec53da0-1a9d-4219-9f31-c732fdc677aa','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-20 11:13:33'),('3d13bca5-b675-4c33-a6ab-8af39327d085','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-16 12:15:12'),('3f9e0ac2-a1d5-4267-a062-7671c05cb0d0','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-20 11:13:53'),('54960255-32d4-4fb8-a2f8-dc6dd176e6b1','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-19 12:15:12'),('69f411f0-a3b4-48bc-a721-8b89e0c7b239','1c3b591d-406c-4769-976e-68aaa5646fa4','2019-10-20 11:10:33'),('724b605a-ff73-4c60-8bde-2fb7d165c0c1','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-18 12:15:12'),('7fbda72d-3cc3-4fcd-88c4-ad516f24cb65','0ad40087-ebdd-4e3e-9c33-38781e808cf3','2019-10-20 11:15:04'),('8e56ef9b-07b7-47f6-8da1-5971ffcadd64','0ad40087-ebdd-4e3e-9c33-38781e808cf3','2019-10-20 11:14:57'),('91703f55-90f0-4c79-8236-2e8e9fbea82f','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-17 12:15:12'),('b4d822aa-bc39-4486-a25d-474b6993f8d9','1c3b591d-406c-4769-976e-68aaa5646fa4','2019-10-20 10:53:27'),('d84f1f8b-b625-4904-8a5b-e19e11d93a8e','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-20 11:13:40'),('d9a9448b-71c3-436d-b41c-c2604b9b10e3','e7972b12-6b3a-4303-a5cf-51e9dba3ef5d','2019-10-20 11:11:43'),('e701deec-57f2-4f94-90f4-a53ba8f21233','e7972b12-6b3a-4303-a5cf-51e9dba3ef5d','2019-10-20 11:11:14'),('efcd7318-1c90-4cd5-a43d-d58620a4817a','e7972b12-6b3a-4303-a5cf-51e9dba3ef5d','2019-10-20 11:11:26'),('f3747348-5e49-4f85-ad46-303b9b228759','e7972b12-6b3a-4303-a5cf-51e9dba3ef5d','2019-10-20 11:11:36');
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
INSERT INTO `variation_sale` VALUES ('0929abe4-9dba-4957-a2a0-e87ab54219a1','e7972b12-6b3a-4303-a5cf-51e9dba3ef5d','2019-10-20 11:12:04'),('2c6ab0b1-21ce-4a0b-b092-36a85b0e89d1','0ad40087-ebdd-4e3e-9c33-38781e808cf3','2019-10-20 11:15:43'),('3d13bca5-b675-4c33-a6ab-8af39327d085','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-16 12:15:12'),('54960255-32d4-4fb8-a2f8-dc6dd176e6b1','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-19 12:15:12'),('57636903-1ecf-420b-9f9f-2a3fa041e2c4','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-20 11:13:19'),('6e2af1a2-5df0-4405-ad23-f165e21335af','1c3b591d-406c-4769-976e-68aaa5646fa4','2019-10-20 11:10:12'),('724b605a-ff73-4c60-8bde-2fb7d165c0c1','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-18 12:15:12'),('78b3e8ed-e129-4022-8e99-cf18a455970d','1c3b591d-406c-4769-976e-68aaa5646fa4','2019-10-20 11:10:19'),('91703f55-90f0-4c79-8236-2e8e9fbea82f','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-17 12:15:12'),('97ffdfd1-9f06-40f6-a368-352adbffba7c','0ad40087-ebdd-4e3e-9c33-38781e808cf3','2019-10-20 11:15:20'),('9dc5b6d2-f657-4d37-aa05-1813c2b4a95d','0ad40087-ebdd-4e3e-9c33-38781e808cf3','2019-10-20 11:15:28'),('a7cf93a8-f872-4091-b3a8-e1cd4234e43f','0ad40087-ebdd-4e3e-9c33-38781e808cf3','2019-10-20 11:15:52'),('adbfbcae-dabc-45f3-a66d-92ae64008915','e7972b12-6b3a-4303-a5cf-51e9dba3ef5d','2019-10-20 11:12:12'),('b96a42d0-b3bf-4d76-a3fd-b30fe5a2473f','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-20 11:13:12'),('dc0ba258-5b5a-44e2-9373-634e1a704306','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-20 11:12:46'),('de01303d-f2cc-48ba-8dfe-a68948f2c4b7','3f27a6ee-dbfb-4f46-9516-746eeaa00fa2','2019-10-20 11:13:59'),('e3836a4d-9631-4fc0-975a-f5c0a030c597','e7972b12-6b3a-4303-a5cf-51e9dba3ef5d','2019-10-20 11:11:57'),('ea62aa4d-5d0f-4985-8f98-2e7e437fff6f','1c3b591d-406c-4769-976e-68aaa5646fa4','2019-10-20 11:10:27'),('fcab97b7-0c61-4825-9565-fef1300f30e3','e7972b12-6b3a-4303-a5cf-51e9dba3ef5d','2019-10-20 11:11:10'),('ffa07a76-71f6-41c4-ac0f-671b63bec6f9','0ad40087-ebdd-4e3e-9c33-38781e808cf3','2019-10-20 11:15:36');
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

-- Dump completed on 2019-10-20  8:16:53
