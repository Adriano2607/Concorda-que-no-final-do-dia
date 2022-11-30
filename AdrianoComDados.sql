-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: adriano
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `carro`
--

DROP TABLE IF EXISTS `carro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carro` (
  `idcarro` int NOT NULL AUTO_INCREMENT,
  `Ano` char(5) NOT NULL,
  `Categoria` varchar(25) DEFAULT NULL,
  `Motor` varchar(20) DEFAULT NULL,
  `Proprietario_idProprietario` int NOT NULL,
  `Opcionais_idOpcionais` int NOT NULL,
  `Placa_idPlaca` int NOT NULL,
  `Chassi_idChassi` int NOT NULL,
  PRIMARY KEY (`idcarro`),
  KEY `fk_Carro_Chassi1` (`Chassi_idChassi`),
  KEY `fk_Carro_Opcionais1` (`Opcionais_idOpcionais`),
  KEY `fk_Carro_Placa1` (`Placa_idPlaca`),
  KEY `fk_Carro_Proprietrario1` (`Proprietario_idProprietario`),
  CONSTRAINT `fk_Carro_Chassi1` FOREIGN KEY (`Chassi_idChassi`) REFERENCES `chassi` (`idChassi`) ON DELETE CASCADE,
  CONSTRAINT `fk_Carro_Opcionais1` FOREIGN KEY (`Opcionais_idOpcionais`) REFERENCES `opcionais` (`idOpcionais`) ON DELETE CASCADE,
  CONSTRAINT `fk_Carro_Placa1` FOREIGN KEY (`Placa_idPlaca`) REFERENCES `placa` (`idPlaca`) ON DELETE CASCADE,
  CONSTRAINT `fk_Carro_Proprietrario1` FOREIGN KEY (`Proprietario_idProprietario`) REFERENCES `proprietario` (`idProprietario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carro`
--

LOCK TABLES `carro` WRITE;
/*!40000 ALTER TABLE `carro` DISABLE KEYS */;
INSERT INTO `carro` VALUES (1,'2002','Sedan','4 cilindros',1,1,1,1),(2,'2003','Hatch','Vtech',2,2,2,2),(3,'2004','Caminhonete','Turbo',3,2,3,3),(4,'2005','Sedan','Diesel',4,3,4,4),(5,'2006','Hatch','5 cilindros',5,4,5,5),(6,'2007','Caminhonete','Vtech',6,5,6,6),(7,'2008','Sedan','Turbo',7,6,7,7),(8,'2009','Hatch','Diesel',8,7,8,8),(9,'2010','Caminhonete','6 cilindros',9,8,9,9),(10,'2011','Sedan','Vtech',10,9,10,10),(11,'2012','Hatch','Turbo',11,10,11,11),(12,'2013','Caminhonete','Diesel',12,11,12,12),(13,'2014','Sedan','7 cilindros',13,12,13,13),(14,'2015','Hatch','Vtech',14,13,14,14),(15,'2016','Caminhonete','Turbo',15,14,15,15);
/*!40000 ALTER TABLE `carro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chassi`
--

DROP TABLE IF EXISTS `chassi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chassi` (
  `idChassi` int NOT NULL AUTO_INCREMENT,
  `Numero_do_chassi` char(100) NOT NULL,
  PRIMARY KEY (`idChassi`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chassi`
--

LOCK TABLES `chassi` WRITE;
/*!40000 ALTER TABLE `chassi` DISABLE KEYS */;
INSERT INTO `chassi` VALUES (1,'6R1 tlB4Ku Aj LA5785'),(2,'2HH 7mNZ8c 2t X76166'),(3,'4aS Hbap71 8Z 1c7079'),(4,'35R 44sT0A c5 Vx4071'),(5,'6AV 1RpL2K Gw fs5817'),(6,'5Pj KnFmAy Au D20456'),(7,'48B dZz781 N8 Mf5024'),(8,'1lJ t3ApNy T8 Ee0543'),(9,'8Ag 08fx91 yA 0j9817'),(10,'66G 5kPH6A 2h 796328'),(11,'7lE T2rKdA BN U86094'),(12,'4wd NzG2Rp 1D 495840'),(13,'34x gAjC2A gJ RU1599'),(14,'6Wd L589cA h7 hb6191'),(15,'6AR l1MdA0 AA Am8396');
/*!40000 ALTER TABLE `chassi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custo`
--

DROP TABLE IF EXISTS `custo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custo` (
  `idCusto` int NOT NULL AUTO_INCREMENT,
  `Valor_de_custo` char(20) NOT NULL,
  `Valor_de_Venda` char(20) NOT NULL,
  PRIMARY KEY (`idCusto`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custo`
--

LOCK TABLES `custo` WRITE;
/*!40000 ALTER TABLE `custo` DISABLE KEYS */;
INSERT INTO `custo` VALUES (1,'50.000,00','100.000,00'),(2,'65.000,00','118.000,00'),(3,'80.000,00','150.000,00'),(4,'95.000,00','105.000,00'),(5,'110.000,00','180.000,00'),(6,'125.000,00','145.000,00'),(7,'140.000,00','160.000,00'),(8,'155.000,00','215.000,00'),(9,'170.000,00','200.000,00'),(10,'185.000,00','190.000,00'),(11,'200.000,00','215.000,00'),(12,'215.000,00','235.000,00'),(13,'230.000,00','245.000,00'),(14,'245.000,00','265.000,00'),(15,'260.000,00','375.000,00');
/*!40000 ALTER TABLE `custo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fabricante`
--

DROP TABLE IF EXISTS `fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fabricante` (
  `idFabricante` int NOT NULL AUTO_INCREMENT,
  `CNPJ` char(30) NOT NULL,
  `Nome_do_Fabricante` varchar(45) DEFAULT NULL,
  `Modelo_idModelo` int NOT NULL,
  `Custo_idCusto` int NOT NULL,
  PRIMARY KEY (`idFabricante`),
  KEY `fk_Fabricante_Modelo1` (`Modelo_idModelo`),
  KEY `fk_Fabricante_Custo1` (`Custo_idCusto`),
  CONSTRAINT `fk_Fabricante_Custo1` FOREIGN KEY (`Custo_idCusto`) REFERENCES `custo` (`idCusto`) ON DELETE CASCADE,
  CONSTRAINT `fk_Fabricante_Modelo1` FOREIGN KEY (`Modelo_idModelo`) REFERENCES `modelo` (`idModelo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabricante`
--

LOCK TABLES `fabricante` WRITE;
/*!40000 ALTER TABLE `fabricante` DISABLE KEYS */;
INSERT INTO `fabricante` VALUES (1,'54.821.431/0001-48','Volkswagen',1,1),(2,'75.848.485/0001-77','Ford',2,2),(3,'16.435.871/0001-78','Fiat',2,3),(4,'83.689.183/0001-21','Hyundai',3,4),(5,'28.454.338/0001-32','Renault',4,5),(6,'54.821.431/0001-48','Volkswagen',5,6),(7,'75.848.485/0001-77','Ford',6,7),(8,'16.435.871/0001-78','Fiat',7,8),(9,'83.689.183/0001-21','Hyundai',8,9),(10,'28.454.338/0001-32','Renault',9,10),(11,'54.821.431/0001-48','Volkswagen',10,11),(12,'75.848.485/0001-77','Ford',11,12),(13,'16.435.871/0001-78','Fiat',12,13),(14,'83.689.183/0001-21','Hyundai',13,14),(15,'28.454.338/0001-32','Renault',14,15);
/*!40000 ALTER TABLE `fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo` (
  `idModelo` int NOT NULL AUTO_INCREMENT,
  `Descrição` varchar(45) DEFAULT NULL,
  `Caracteristicas` varchar(45) DEFAULT NULL,
  `Carro_idcarro` int NOT NULL,
  PRIMARY KEY (`idModelo`),
  KEY `fk_Modelo_Carro1` (`Carro_idcarro`),
  CONSTRAINT `fk_Modelo_Carro1` FOREIGN KEY (`Carro_idcarro`) REFERENCES `carro` (`idcarro`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,'Novo','Teto Solar',1),(2,'Semi','4 Portas',2),(3,'Usado','Vidro Escuro',3),(4,'Novo','Interface',4),(5,'Semi','Teto Solar',5),(6,'Usado','5 Portas',6),(7,'Novo','Vidro Escuro',7),(8,'Semi','Interface',8),(9,'Usado','Teto Solar',9),(10,'Novo','6 Portas',10),(11,'Semi','Vidro Escuro',11),(12,'Usado','Interface',12),(13,'Novo','Teto Solar',13),(14,'Semi','7 Portas',14),(15,'Usado','Vidro Escuro',15);
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opcionais`
--

DROP TABLE IF EXISTS `opcionais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opcionais` (
  `idOpcionais` int NOT NULL AUTO_INCREMENT,
  `Ar_condicionado` char(10) DEFAULT NULL,
  `Direção_hidráulica` char(10) DEFAULT NULL,
  `Pintura` char(20) DEFAULT NULL,
  PRIMARY KEY (`idOpcionais`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opcionais`
--

LOCK TABLES `opcionais` WRITE;
/*!40000 ALTER TABLE `opcionais` DISABLE KEYS */;
INSERT INTO `opcionais` VALUES (1,'Sim','Sim','Azul'),(2,'Sim','Sim','Vermelho'),(3,'Não','Não','Amarelo'),(4,'Sim','Sim','Roxo'),(5,'Sim','Sim','Preto'),(6,'Não','Não','Rosa'),(7,'Sim','Sim','Azul'),(8,'Sim','Sim','Vermelho'),(9,'Não','Não','Amarelo'),(10,'Sim','Sim','Roxo'),(11,'Sim','Sim','Preto'),(12,'Não','Não','Rosa'),(13,'Sim','Sim','Azul'),(14,'Sim','Sim','Vermelho'),(15,'Não','Não','Amarelo');
/*!40000 ALTER TABLE `opcionais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `placa`
--

DROP TABLE IF EXISTS `placa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `placa` (
  `idPlaca` int NOT NULL AUTO_INCREMENT,
  `Placa` char(20) NOT NULL,
  `Número_de_Série` char(25) NOT NULL,
  `Estampador` char(20) NOT NULL,
  PRIMARY KEY (`idPlaca`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `placa`
--

LOCK TABLES `placa` WRITE;
/*!40000 ALTER TABLE `placa` DISABLE KEYS */;
INSERT INTO `placa` VALUES (1,'FXJ-0618','00314042007-B','Mercosul'),(2,'PQM-4919','10314042007-B','Mercosul'),(3,'IFG-1400','00523042007-B','Mercosul'),(4,'ILP-0033','12523042007-B','Mercosul'),(5,'IGY-4541','13523042007-B','Mercosul'),(6,'IXM-3106','14523042007-B','Mercosul'),(7,'JCK-5231','15523042007-B','Mercosul'),(8,'JBU-4024','16523042007-B','Mercosul'),(9,'IOW-7802','17523042007-B','Mercosul'),(10,'LZS-9120','60523042007-B','Mercosul'),(11,'MGH-7202','00523042007-B','Mercosul'),(12,'MJB-7717','06523042007-B','Mercosul'),(13,'LZV-1295','87523042007-B','Mercosul'),(14,'MAP-4485','26523042007-B','Mercosul'),(15,'FKM-1742','21523042007-B','Mercosul');
/*!40000 ALTER TABLE `placa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proprietario`
--

DROP TABLE IF EXISTS `proprietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proprietario` (
  `idProprietario` int NOT NULL AUTO_INCREMENT,
  `Nome` char(45) NOT NULL,
  `Cpf` char(45) NOT NULL,
  `RG` char(50) NOT NULL,
  `Estado` char(3) NOT NULL,
  PRIMARY KEY (`idProprietario`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proprietario`
--

LOCK TABLES `proprietario` WRITE;
/*!40000 ALTER TABLE `proprietario` DISABLE KEYS */;
INSERT INTO `proprietario` VALUES (1,'Nair Laís de Paula','643.868.282-90','28.231.226-2','RS'),(2,'Agatha Lúcia Marli Lopes','035.191.083-21','41.708.723-8','BA'),(3,'Esther Louise Bárbara Rezende','586.137.116-42','49.802.209-2','SC'),(4,'Anderson Samuel Caldeira','124.567.268-12','16.422.717-9','BA'),(5,'Emanuel Caio Oliveira','415.015.574-75','35.740.057-4','SC'),(6,'Iago Ryan Martin Cardoso','695.289.208-70','44.764.147-5','SP'),(7,'Hugo Nelson Melo','459.033.638-30','47.743.885-4','SP'),(8,'Giovanni Edson Tiago Almada','192.215.318-48','11.746.242-1','RJ'),(9,'Fernando Augusto Baptista','631.248.658-39','13.668.362-9','SP'),(10,'Eduarda Luciana Letícia Viana','008.458.798-98','24.733.962-3','AM'),(11,'Emily Sara Elaine Barros','396.576.018-19','36.006.973-3','RS'),(12,'Marcelo Ryan da Costa','883.288.268-01','26.535.682-9','MG'),(13,'Fátima Isabelle Elaine da Costa','872.882.658-20','40.673.850-6','SP'),(14,'Giovanni Severino Otávio Novaes','079.673.488-77','15.090.572-5','RJ'),(15,'Liz Lara Isabella Alves','098.066.991-06','12.899.144-6','PE');
/*!40000 ALTER TABLE `proprietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `visao_chassi`
--

DROP TABLE IF EXISTS `visao_chassi`;
/*!50001 DROP VIEW IF EXISTS `visao_chassi`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `visao_chassi` AS SELECT 
 1 AS `idChassi`,
 1 AS `Numero_do_chassi`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `visao_chassi`
--

/*!50001 DROP VIEW IF EXISTS `visao_chassi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `visao_chassi` AS select `chassi`.`idChassi` AS `idChassi`,`chassi`.`Numero_do_chassi` AS `Numero_do_chassi` from `chassi` where (`chassi`.`idChassi` > 2) */;
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

-- Dump completed on 2022-11-30 15:35:44
