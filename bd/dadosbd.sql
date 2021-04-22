-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: instagram
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `texto` text NOT NULL,
  `usuarios_id` int DEFAULT NULL,
  `posts_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarios_id` (`usuarios_id`),
  KEY `posts_id` (`posts_id`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,'Oi! Tirando os problemas, tudo certo!',2,1),(3,'Oi pra você também,!',4,1),(4,'Fim de semana já não existe mais!',2,2),(6,'Fim de semana foi lindo!',4,2),(7,'Lindão !',4,2);
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curtidas`
--

DROP TABLE IF EXISTS `curtidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curtidas` (
  `usuarios_id` int NOT NULL,
  `posts_id` int NOT NULL,
  KEY `posts_id_idx` (`posts_id`),
  KEY `usuarios_id_idx` (`usuarios_id`),
  CONSTRAINT `posts_id` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `usuarios_id` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curtidas`
--

LOCK TABLES `curtidas` WRITE;
/*!40000 ALTER TABLE `curtidas` DISABLE KEYS */;
INSERT INTO `curtidas` VALUES (1,1),(1,2);
/*!40000 ALTER TABLE `curtidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `texto` varchar(100) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  `usuarios_id` int DEFAULT NULL,
  `n_likes` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `usuarios_id` (`usuarios_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Oi gente tudo bem?',NULL,1,0),(2,'Como foi o fim de semana?',NULL,1,0),(6,'Fds foi só Raincife',NULL,10,0),(7,'Fds só foi Raincife!',NULL,10,0),(8,'DALE!',NULL,10,0),(11,'Olá Galera!!','*mãozinha dando tchau*',10,0);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Gabriel Brunetti','gbrunetti@digitalhouse.com','12341231312'),(2,'Sergio Siqueira','sergio@digitalhouse.com','12341231312'),(4,'Hendy Almeida','halmeida@digitalhouse.com','1234125412'),(5,'Maria Luiza','marialuiza@avanade.com','maravilhosaaaa123'),(6,'Lúcio Araújo','lucioaraujo@avanade.com','lucinho123'),(7,'Manoela Vyctoria','manoelavyctoria@avanade.com','manu123'),(8,'Dari Diniz','daridiniz@avanade.com','dari123'),(9,'Angelo','angelo@avanade.com','andelo123'),(10,'Bárbara Lícia','barbaralicia@avanade.com','babi123'),(11,'Shiley','shiley@email.com','shyrley123'),(12,'Reginaldo','Reginaldo@email.com','Carlitos'),(14,'Dra. Helena','drhelena@email.com','euamomilho'),(19,'Pelé','pele@email.com','pexscscsacsacsacas'),(20,'Pelé','pelsss@email.com','sssssssssssssssssssssssss'),(21,'Pelé','psadassss@email.com','sssssssssssssssssssssssss'),(22,'Pelé','psadaasdasdsassss@email.com','sssssssssasdasdssssssssssssssss');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-22 10:50:08
