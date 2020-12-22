CREATE DATABASE  IF NOT EXISTS `sutulaa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sutulaa`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: sutulaa
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `projekt_adres_czytelnika`
--

DROP TABLE IF EXISTS `projekt_adres_czytelnika`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projekt_adres_czytelnika` (
  `id_adresu` int NOT NULL AUTO_INCREMENT,
  `miejscowosc` varchar(255) NOT NULL,
  `kod_pocztowy` varchar(6) NOT NULL,
  `ulica` varchar(255) NOT NULL,
  `numer_domu` varchar(45) NOT NULL,
  `czytelnik_id_czytelnika` int NOT NULL,
  PRIMARY KEY (`id_adresu`),
  KEY `fk_adres_czytelnika_czytelnik_idx` (`czytelnik_id_czytelnika`),
  CONSTRAINT `fk_adres_czytelnika_czytelnik` FOREIGN KEY (`czytelnik_id_czytelnika`) REFERENCES `projekt_czytelnik` (`id_czytelnika`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projekt_adres_czytelnika`
--

LOCK TABLES `projekt_adres_czytelnika` WRITE;
/*!40000 ALTER TABLE `projekt_adres_czytelnika` DISABLE KEYS */;
INSERT INTO `projekt_adres_czytelnika` VALUES (1,'Ostroleka','07-410','Totus Tuus','12',1),(2,'Ostroleka','07-410','Totus Tuus','12',2),(3,'Ostroleka','07-410','Kubusia Puchatka','2',3),(4,'Ostroleka','07-410','Czerwonego Kapturka','6',6),(5,'Ostroleka','07-410','11 Listopada','13',6);
/*!40000 ALTER TABLE `projekt_adres_czytelnika` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projekt_autor`
--

DROP TABLE IF EXISTS `projekt_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projekt_autor` (
  `id_autora` int NOT NULL AUTO_INCREMENT,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  PRIMARY KEY (`id_autora`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projekt_autor`
--

LOCK TABLES `projekt_autor` WRITE;
/*!40000 ALTER TABLE `projekt_autor` DISABLE KEYS */;
INSERT INTO `projekt_autor` VALUES (1,'Andrzej','Sapkowski'),(2,'John Ronald Reuel','Tolkien'),(3,'George R. R.','Martin'),(4,'Stephen','King'),(5,'Dmitrij','Głuchowski'),(6,'Thomas','Ligotti'),(7,'Wiktoria','Wawrzyniak'),(8,'William ','Shakespeare'),(9,'Krzysztof ','Gonciarz'),(10,'Stephen ','King'),(11,'Autor ','Nieznany'),(12,'Stephen ','Hawking');
/*!40000 ALTER TABLE `projekt_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projekt_bibliotekarz`
--

DROP TABLE IF EXISTS `projekt_bibliotekarz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projekt_bibliotekarz` (
  `id_bibliotekarza` int NOT NULL AUTO_INCREMENT,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `pesel` int DEFAULT NULL,
  `data_urodzenia` date NOT NULL,
  `data_zatrudnienia` date NOT NULL,
  `numer_telefonu` int NOT NULL,
  PRIMARY KEY (`id_bibliotekarza`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projekt_bibliotekarz`
--

LOCK TABLES `projekt_bibliotekarz` WRITE;
/*!40000 ALTER TABLE `projekt_bibliotekarz` DISABLE KEYS */;
INSERT INTO `projekt_bibliotekarz` VALUES (9,'Maria','Choinka',11111111,'1994-03-24','2017-01-01',885342122),(10,'Barbara','Kontakt',11232323,'1985-12-23','2008-05-03',606521456),(11,'Damian','Tomczak',232323244,'1993-10-12','2016-02-13',564254799),(12,'Dominik','Potocki',12334223,'1961-11-14','1984-06-25',564789321);
/*!40000 ALTER TABLE `projekt_bibliotekarz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projekt_czytelnik`
--

DROP TABLE IF EXISTS `projekt_czytelnik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projekt_czytelnik` (
  `id_czytelnika` int NOT NULL AUTO_INCREMENT,
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `pesel` varchar(45) NOT NULL,
  `data_urodzenia` varchar(45) NOT NULL,
  `adres` int NOT NULL,
  `numer_telefonu` varchar(45) NOT NULL,
  `status_zawodowy` int NOT NULL,
  PRIMARY KEY (`id_czytelnika`),
  KEY `fk_czytelnik_status_zawodowy1_idx` (`status_zawodowy`),
  CONSTRAINT `fk_czytelnik_status_zawodowy1` FOREIGN KEY (`status_zawodowy`) REFERENCES `projekt_status_zawodowy` (`id_statusu`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projekt_czytelnik`
--

LOCK TABLES `projekt_czytelnik` WRITE;
/*!40000 ALTER TABLE `projekt_czytelnik` DISABLE KEYS */;
INSERT INTO `projekt_czytelnik` VALUES (1,'Łucja','Tomczak','232312423','2002-04-23',1,'657422178',1),(2,'Damian','Tomczak','232323244','1993-10-12',1,'564254799',4),(3,'Arkadiusz','Kowalski','4125231','2000-12-01',2,'154678456',4),(4,'Piotr','Modzelewski','8745351','1997-07-30',3,'574231654',3),(5,'Jaroslaw','Chrostek','2735932','1978-07-30',4,'232123435',4),(6,'Dominik','Mydlowski','2345265','1987-10-22',5,'232123435',4);
/*!40000 ALTER TABLE `projekt_czytelnik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projekt_gatunek`
--

DROP TABLE IF EXISTS `projekt_gatunek`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projekt_gatunek` (
  `id_gatunku` int NOT NULL AUTO_INCREMENT,
  `nazwa_gatunku` varchar(45) NOT NULL,
  PRIMARY KEY (`id_gatunku`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projekt_gatunek`
--

LOCK TABLES `projekt_gatunek` WRITE;
/*!40000 ALTER TABLE `projekt_gatunek` DISABLE KEYS */;
INSERT INTO `projekt_gatunek` VALUES (1,'Filozofia'),(2,'Psychologia'),(3,'Religia'),(4,'Socjologia'),(5,'Prawo'),(6,'Medycyna'),(7,'Historyczne'),(8,'Poezja'),(9,'Dramat'),(10,'Powiesc'),(11,'Fantastyka'),(12,'Sensacyjne'),(13,'Biografia'),(14,'Geografia'),(15,'Literatura dziecieca'),(16,'Literatura mlodziezowa'),(17,'Horrory'),(18,'Komiksy'),(19,'Harlequin'),(20,'Fizyka');
/*!40000 ALTER TABLE `projekt_gatunek` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projekt_ksiazka`
--

DROP TABLE IF EXISTS `projekt_ksiazka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projekt_ksiazka` (
  `id_ksiazki` int NOT NULL AUTO_INCREMENT,
  `tytul` varchar(100) NOT NULL,
  `isbn` int NOT NULL,
  `autor` int DEFAULT NULL,
  `gatunek` int NOT NULL,
  `wydawnictwo` varchar(45) NOT NULL,
  `data_publikacji` date NOT NULL,
  `status_ksiazki` int DEFAULT NULL,
  PRIMARY KEY (`id_ksiazki`),
  KEY `fk_ksiazka_gatunek1_idx` (`gatunek`),
  KEY `fk_ksiazka_autor1_idx` (`autor`),
  KEY `fk_ksiazka_status_ksiazki1_idx` (`status_ksiazki`),
  CONSTRAINT `fk_ksiazka_autor1` FOREIGN KEY (`autor`) REFERENCES `projekt_autor` (`id_autora`),
  CONSTRAINT `fk_ksiazka_gatunek1` FOREIGN KEY (`gatunek`) REFERENCES `projekt_gatunek` (`id_gatunku`),
  CONSTRAINT `fk_ksiazka_status_ksiazki1` FOREIGN KEY (`status_ksiazki`) REFERENCES `projekt_status_ksiazki` (`id_statusu`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projekt_ksiazka`
--

LOCK TABLES `projekt_ksiazka` WRITE;
/*!40000 ALTER TABLE `projekt_ksiazka` DISABLE KEYS */;
INSERT INTO `projekt_ksiazka` VALUES (1,'Krew Elfow',1111111,1,11,'SuperNowa','1994-02-13',1),(2,'Hobbit, czyli tam i z powrotem',123456,2,11,'Zysk i s-ka','1960-01-01',1),(4,'Pieśni umarłego marzyciela',235123,6,17,'Okultura','2020-12-05',1),(5,'Przebudzenie',765834,7,12,'Wydawnictwo Internetowe','2020-12-18',1),(6,'Metro 2033',86953,5,11,'Insignis Media','2010-02-24',2),(7,'Powrót króla. Władca Pierścieni.',9802399,2,11,'Zysk i s-ka','1995-10-20',1),(8,'Powrót króla. Władca Pierścieni.',70234,2,11,'Allen & Unwin','1995-10-20',1),(9,'Powrót króla. Władca Pierścieni.',621409,2,11,'Allen & Unwin','1995-10-20',1),(10,'Dwie wieże',621409,2,11,'Allen & Unwin','1954-11-11',1),(11,'Romeo i Julia',3457567,8,9,'IBIS','1602-01-01',1),(12,'Hamlet',2346575,8,9,'IBIS','1597-01-01',1),(13,'Rozum i Godność Człowieka',9788393,9,13,'KG Tofu Media','2019-06-12',1),(14,'Lśnienie',320370,10,10,'Iskry','1990-01-01',1),(15,'Doktor Sen',546872167,10,10,'Iskry','2013-12-12',1),(16,'Wszechświat w skorupce orzecha',541337,12,20,'Bantam Spectra','2001-04-09',2),(17,'Sentencje ojców',65421548,11,19,'Wydawnictwo WAM','2015-06-30',2);
/*!40000 ALTER TABLE `projekt_ksiazka` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sutulaa`@`localhost`*/ /*!50003 TRIGGER `autor_nieznany` BEFORE INSERT ON `projekt_ksiazka` FOR EACH ROW BEGIN
  IF NEW.autor IS NULL
  THEN
    SET NEW.autor = 11;
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `projekt_status_ksiazki`
--

DROP TABLE IF EXISTS `projekt_status_ksiazki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projekt_status_ksiazki` (
  `id_statusu` int NOT NULL,
  `nazwa_statusu` varchar(45) NOT NULL,
  PRIMARY KEY (`id_statusu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projekt_status_ksiazki`
--

LOCK TABLES `projekt_status_ksiazki` WRITE;
/*!40000 ALTER TABLE `projekt_status_ksiazki` DISABLE KEYS */;
INSERT INTO `projekt_status_ksiazki` VALUES (1,'Dostepna'),(2,'Niedostepna');
/*!40000 ALTER TABLE `projekt_status_ksiazki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projekt_status_zawodowy`
--

DROP TABLE IF EXISTS `projekt_status_zawodowy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projekt_status_zawodowy` (
  `id_statusu` int NOT NULL,
  `nazwa_status` varchar(45) NOT NULL,
  PRIMARY KEY (`id_statusu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projekt_status_zawodowy`
--

LOCK TABLES `projekt_status_zawodowy` WRITE;
/*!40000 ALTER TABLE `projekt_status_zawodowy` DISABLE KEYS */;
INSERT INTO `projekt_status_zawodowy` VALUES (1,'Uczen'),(2,'Student'),(3,'Pracownik-fizyczny'),(4,'Pracownik-umyslowy'),(5,'Emeryt'),(6,'Bezrobotny/a');
/*!40000 ALTER TABLE `projekt_status_zawodowy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projekt_wypozyczenie`
--

DROP TABLE IF EXISTS `projekt_wypozyczenie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projekt_wypozyczenie` (
  `id_wypozyczenia` int NOT NULL AUTO_INCREMENT,
  `id_czytelnika` int NOT NULL,
  `id_ksiazki` int DEFAULT NULL,
  `bibliotekarz` int NOT NULL,
  `data_wypozyczenia` date NOT NULL,
  `data_zwrotu` date DEFAULT NULL,
  PRIMARY KEY (`id_wypozyczenia`),
  KEY `fk_wypozyczenie_czytelnik1_idx` (`id_czytelnika`),
  KEY `fk_wypozyczenie_bibliotekarz1_idx` (`bibliotekarz`),
  KEY `id_ksiazki` (`id_ksiazki`),
  CONSTRAINT `fk_wypozyczenie_bibliotekarz1` FOREIGN KEY (`bibliotekarz`) REFERENCES `projekt_bibliotekarz` (`id_bibliotekarza`),
  CONSTRAINT `fk_wypozyczenie_czytelnik1` FOREIGN KEY (`id_czytelnika`) REFERENCES `projekt_czytelnik` (`id_czytelnika`),
  CONSTRAINT `projekt_wypozyczenie_ibfk_1` FOREIGN KEY (`id_ksiazki`) REFERENCES `projekt_ksiazka` (`id_ksiazki`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projekt_wypozyczenie`
--

LOCK TABLES `projekt_wypozyczenie` WRITE;
/*!40000 ALTER TABLE `projekt_wypozyczenie` DISABLE KEYS */;
INSERT INTO `projekt_wypozyczenie` VALUES (1,3,7,10,'2019-10-13','2019-11-17'),(3,1,6,9,'2020-12-20','2020-12-20'),(4,3,7,9,'2020-12-20','2020-12-20'),(7,4,4,9,'2020-12-20','2020-12-20'),(8,4,10,9,'2020-12-20','2020-12-20'),(10,5,8,9,'2020-12-20','2020-12-20'),(11,5,6,9,'2020-12-20','2020-12-20'),(13,5,6,9,'2020-12-20','2020-12-20'),(14,2,6,9,'2020-12-20','2020-12-20'),(15,2,4,9,'2020-12-20','2020-12-20'),(16,1,1,10,'2020-12-20','2020-12-20'),(17,6,6,12,'2020-12-20',NULL),(18,3,17,12,'2020-12-22',NULL),(19,5,16,12,'2020-12-22',NULL);
/*!40000 ALTER TABLE `projekt_wypozyczenie` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sutulaa`@`localhost`*/ /*!50003 TRIGGER `wypozyczenie_after_insert` AFTER INSERT ON `projekt_wypozyczenie` FOR EACH ROW BEGIN 
    UPDATE projekt_ksiazka SET status_ksiazki = 2 WHERE id_ksiazki=NEW.id_ksiazki ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`sutulaa`@`localhost`*/ /*!50003 TRIGGER `wypozyczenie_after_update` AFTER UPDATE ON `projekt_wypozyczenie` FOR EACH ROW BEGIN 
    UPDATE projekt_ksiazka SET status_ksiazki = 1 WHERE id_ksiazki=NEW.id_ksiazki ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'sutulaa'
--

--
-- Dumping routines for database 'sutulaa'
--
/*!50003 DROP FUNCTION IF EXISTS `count_pracownicy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sutulaa`@`localhost` FUNCTION `count_pracownicy`() RETURNS int
BEGIN
    DECLARE ile INT;
    SELECT COUNT(*) INTO @ile FROM pracownik;
    RETURN @ile;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `wypozyczenie` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sutulaa`@`localhost` FUNCTION `wypozyczenie`(id_czy INT,id_ks INT,bibliotekarz INT) RETURNS text CHARSET utf8mb4
BEGIN
    INSERT INTO projekt_wypozyczenie(id_wypozyczenia,id_czytelnika,id_ksiazki,bibliotekarz,data_wypozyczenia)
    VALUES(DEFAULT,id_czy,id_ks,bibliotekarz,CURRENT_DATE);
    RETURN 'Dodano wypozyczenie!';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliksir_sily` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sutulaa`@`localhost` PROCEDURE `eliksir_sily`(IN id int)
BEGIN
UPDATE kreatura SET udzwig = 1.2 * udzwig WHERE idKreatury = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `udzwig_kreatura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sutulaa`@`localhost` PROCEDURE `udzwig_kreatura`(IN tmp INT, OUT suma INT, srednia INT)
BEGIN
SELECT SUM(tmp),AVG(tmp)INTO suma,srednia FROM kreatura WHERE tmp=udzwig;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `zwrot` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`sutulaa`@`localhost` PROCEDURE `zwrot`(IN id_wyp int)
BEGIN
Update projekt_wypozyczenie set data_zwrotu =  CURRENT_DATE WHERE id_wypozyczenia = id_wyp;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-22 20:46:54
