-- MySQL dump 10.13  Distrib 9.6.0, for macos15 (arm64)
--
-- Host: localhost    Database: hackathon
-- ------------------------------------------------------
-- Server version	9.6.0-commercial

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `BOT_CLUSTER_TABLE`
--

DROP TABLE IF EXISTS `BOT_CLUSTER_TABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BOT_CLUSTER_TABLE` (
  `id` char(36) NOT NULL,
  `cluster_size` int DEFAULT NULL,
  `risk_level` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BOT_CLUSTER_TABLE`
--

LOCK TABLES `BOT_CLUSTER_TABLE` WRITE;
/*!40000 ALTER TABLE `BOT_CLUSTER_TABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `BOT_CLUSTER_TABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BUISNESS_AUTHENTICITY`
--

DROP TABLE IF EXISTS `BUISNESS_AUTHENTICITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BUISNESS_AUTHENTICITY` (
  `id` char(36) NOT NULL,
  `buisness_id` char(36) DEFAULT NULL,
  `authenticity_score` float DEFAULT NULL,
  `rating_manipulation_score` float DEFAULT NULL,
  `bot_activity_score` float DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buisness_id` (`buisness_id`),
  CONSTRAINT `buisness_authenticity_ibfk_1` FOREIGN KEY (`buisness_id`) REFERENCES `BUISNESSES` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUISNESS_AUTHENTICITY`
--

LOCK TABLES `BUISNESS_AUTHENTICITY` WRITE;
/*!40000 ALTER TABLE `BUISNESS_AUTHENTICITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `BUISNESS_AUTHENTICITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BUISNESSES`
--

DROP TABLE IF EXISTS `BUISNESSES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BUISNESSES` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category` varchar(120) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUISNESSES`
--

LOCK TABLES `BUISNESSES` WRITE;
/*!40000 ALTER TABLE `BUISNESSES` DISABLE KEYS */;
/*!40000 ALTER TABLE `BUISNESSES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REVIEW_ANALYSIS`
--

DROP TABLE IF EXISTS `REVIEW_ANALYSIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REVIEW_ANALYSIS` (
  `id` char(36) NOT NULL,
  `review_id` char(36) DEFAULT NULL,
  `fake_probability` float DEFAULT NULL,
  `sentiment_score` float DEFAULT NULL,
  `simailarity_cluster_id` char(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `review_id` (`review_id`),
  CONSTRAINT `review_analysis_ibfk_1` FOREIGN KEY (`review_id`) REFERENCES `REVIEWS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REVIEW_ANALYSIS`
--

LOCK TABLES `REVIEW_ANALYSIS` WRITE;
/*!40000 ALTER TABLE `REVIEW_ANALYSIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REVIEW_ANALYSIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REVIEWS`
--

DROP TABLE IF EXISTS `REVIEWS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REVIEWS` (
  `id` char(36) NOT NULL,
  `buisness_id` char(36) DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `review_text` text,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `buisness_id` (`buisness_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`buisness_id`) REFERENCES `BUISNESSES` (`id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `USERS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REVIEWS`
--

LOCK TABLES `REVIEWS` WRITE;
/*!40000 ALTER TABLE `REVIEWS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REVIEWS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_BEHAVIOUR_ANALYSIS`
--

DROP TABLE IF EXISTS `USER_BEHAVIOUR_ANALYSIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_BEHAVIOUR_ANALYSIS` (
  `id` char(36) NOT NULL,
  `user_id` char(36) DEFAULT NULL,
  `anomaly_score` float DEFAULT NULL,
  `suspicious_level` varchar(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_behaviour_analysis_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `USERS` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_BEHAVIOUR_ANALYSIS`
--

LOCK TABLES `USER_BEHAVIOUR_ANALYSIS` WRITE;
/*!40000 ALTER TABLE `USER_BEHAVIOUR_ANALYSIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_BEHAVIOUR_ANALYSIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERS`
--

DROP TABLE IF EXISTS `USERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERS` (
  `id` char(36) NOT NULL,
  `username` varchar(120) DEFAULT NULL,
  `account_age` int DEFAULT NULL,
  `trust_score` float DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOCK TABLES `USERS` WRITE;
UNLOCK TABLES;
