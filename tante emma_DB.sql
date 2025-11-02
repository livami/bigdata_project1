-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `customer_name` varchar(45) NOT NULL,
  `customer_city` varchar(45) NOT NULL,
  `customer_zipcode` int NOT NULL,
  `customer_email` varchar(45) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_id_UNIQUE` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Max Muster','Basel ',4056,'maxm@gmail.com'),(2,'Michelle Liva','Basel ',4058,'michelle@gmail.com'),(3,'Francesco Leone','Aargau ',1234,'francescol@hotmail.com'),(4,'Loic Boesch ','Basel ',4124,'boeschl@yahoo.com'),(5,'Noah Agostinis','Zurich',3621,'nagostinis@fhnw.ch'),(6,'Ada Mueller','Bern',9905,'a.mueller@hotmail.de'),(7,'Franz Libby','Solothurn',7768,'f.libby@gmail.com'),(8,'Helga Born','Luzern',8754,'helga.b@bluewin.ch'),(9,'Joerg Berndt','St. Gallen',5342,'j.berndt71@hotmail.de'),(10,'Berta Ulm','Glarus',6674,'bertaulm@gmail.com');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `denor_view`
--

DROP TABLE IF EXISTS `denor_view`;
/*!50001 DROP VIEW IF EXISTS `denor_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `denor_view` AS SELECT 
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `order_id`,
 1 AS `sales_id`,
 1 AS `sales_quantity`,
 1 AS `sales_month`,
 1 AS `sales_year`,
 1 AS `turnover`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL,
  `order_date` datetime NOT NULL,
  `order_deliverydate` datetime DEFAULT NULL,
  `order_priceperpiece` double NOT NULL,
  `product_id` int NOT NULL,
  `order_quantity` int NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_id_UNIQUE` (`order_id`) /*!80000 INVISIBLE */,
  KEY `product_id_idx` (`product_id`),
  CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (10,'2025-02-04 00:00:00','2025-02-14 00:00:00',7,100,15),(11,'2025-03-01 00:00:00','2025-03-07 00:00:00',1,101,100);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `product_priceperpiece` double NOT NULL,
  `product_storequantity` int NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_id_UNIQUE` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (100,'garden_gloves',10,103),(101,'garden_pots',3,76),(102,'garden_shovel',32,26),(103,'garden_rakes',28,33),(104,'garden_planters',5,109),(105,'garden_axes',57,43),(106,'garden_saw',78,19),(107,'garden_stemcutter',38,48),(108,'garden_loppers',69,31),(109,'garden_fork',49,28),(110,'garden_wateringcan',12,55);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `sales_id` int NOT NULL,
  `sales_quantity` int NOT NULL,
  `sales_salesdate` date NOT NULL,
  `sales_deliverydate` date DEFAULT NULL,
  `customer_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`sales_id`),
  UNIQUE KEY `sales_id_UNIQUE` (`sales_id`),
  KEY `product_id_idx` (`product_id`),
  KEY `customer_id_idx` (`customer_id`),
  CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_id 1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1000,2,'2025-03-25','2025-03-25',1,100),(1001,7,'2025-04-16','2025-04-16',2,101),(1002,5,'2025-06-07','2025-06-07',3,101),(1003,2,'2025-06-13','2025-04-13',4,103),(1004,10,'2025-07-08','2025-07-08',5,109),(1005,5,'2025-07-17','2025-07-17',6,110),(1006,3,'2025-07-20','2025-07-17',7,106),(1007,10,'2025-07-25','2025-07-25',8,100),(1008,5,'2025-08-05','2025-08-05',9,105),(1009,7,'2025-08-13','2025-08-13',10,100),(1010,15,'2025-09-16','2025-09-16',1,109);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `denor_view`
--

/*!50001 DROP VIEW IF EXISTS `denor_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `denor_view` AS select `p`.`product_id` AS `product_id`,`p`.`product_name` AS `product_name`,`o`.`order_id` AS `order_id`,`s`.`sales_id` AS `sales_id`,`s`.`sales_quantity` AS `sales_quantity`,month(`s`.`sales_salesdate`) AS `sales_month`,year(`s`.`sales_salesdate`) AS `sales_year`,sum((`s`.`sales_quantity` * (`p`.`product_priceperpiece` - `o`.`order_priceperpiece`))) AS `turnover` from ((`products` `p` left join `orders` `o` on((`p`.`product_id` = `o`.`product_id`))) left join `sales` `s` on((`p`.`product_id` = `s`.`product_id`))) group by `p`.`product_id`,`p`.`product_name`,`o`.`order_id`,`s`.`sales_id`,month(`s`.`sales_salesdate`),year(`s`.`sales_salesdate`) */;
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

-- Dump completed on 2025-11-02 12:52:05
