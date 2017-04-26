CREATE DATABASE  IF NOT EXISTS `BarBeerDrinkerSample` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `BarBeerDrinkerSample`;
-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: cs336-1.c28ltethrrc0.us-east-1.rds.amazonaws.com    Database: BarBeerDrinker
-- ------------------------------------------------------
-- Server version	5.6.23

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


DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(7) DEFAULT NULL,
  `ru_email` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone`varchar(50) DEFAULT NULL,
  `isAdmin` boolean NOT NULL DEFAULT FALSE,
  `isSysStaff` boolean NOT NULL DEFAULT FALSE,
  `isDisabled` boolean NOT NULL DEFAULT FALSE,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('jake','jake123','mihir.dixit@rutgers.edu', 'Mihir Dixit', '732-439-7787', TRUE, TRUE, FALSE);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cars` (
  `driver` varchar(50) NOT NULL DEFAULT '',
  `licenseplate` varchar(50) DEFAULT NULL,
  `make` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `year` varchar(50) DEFAULT NULL,
  `passengers` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`licenseplate`),
  FOREIGN KEY (`driver`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `rideOffers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rideOffers` (
  `departure` varchar(50) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `availableStarting`datetime DEFAULT NULL,
  `availableUntil`datetime DEFAULT NULL,
  `isRecurring` boolean DEFAULT FALSE,
  `car` varchar(50) DEFAULT NULL,
  `driver` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`driver`,`availableStarting`, `availableUntil`),
  FOREIGN KEY (`car`) REFERENCES `cars` (`licenseplate`),
  FOREIGN KEY (`driver`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `rideOffers` WRITE;
/*!40000 ALTER TABLE `rideOffers` DISABLE KEYS */;
/*!40000 ALTER TABLE `rideOffers` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `rideRequests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rideRequests` (
  `departure` varchar(50) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `availableStarting`datetime DEFAULT NULL,
  `availableUntil`datetime DEFAULT NULL,
  `isRecurring` boolean DEFAULT FALSE,
  `passenger` varchar(50) DEFAULT NULL,
  `accepted` boolean DEFAULT FALSE,
  PRIMARY KEY (`passenger`,`availableStarting`, `availableUntil`),
  FOREIGN KEY (`passenger`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `rideRequests` WRITE;
/*!40000 ALTER TABLE `rideRequests` DISABLE KEYS */;
/*!40000 ALTER TABLE `rideRequests` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `rides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rides` (
  `departure` varchar(50) DEFAULT NULL,
  `destination` varchar(50) DEFAULT NULL,
  `start`datetime DEFAULT NULL,
  `end`datetime DEFAULT NULL,
  `passenger` varchar(50) DEFAULT NULL,
  `driver` varchar(50) DEFAULT NULL,
  `isCompleted` boolean DEFAULT FALSE,
  `driverRating` varchar(50) DEFAULT NULL,
  `driverComment` varchar(50) DEFAULT NULL,
  `passengerRating` varchar(50) DEFAULT NULL,
  `passengerComment` varchar(50) DEFAULT NULL,
  `ad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`passenger`,`start`, `end`),
  FOREIGN KEY (`passenger`) REFERENCES `users` (`username`),
  FOREIGN KEY (`driver`) REFERENCES `users` (`username`),
  FOREIGN KEY (`ad`) REFERENCES `ads` (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `rides` WRITE;
/*!40000 ALTER TABLE `rides` DISABLE KEYS */;
/*!40000 ALTER TABLE `rides` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ads` (
  `link` varchar(50) DEFAULT NULL,
  `views` mediumint(9) DEFAULT 0,
  `driverCommission` mediumint(9) DEFAULT 0,
  PRIMARY KEY (`link`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `message` varchar(50) DEFAULT NULL,
  `from` varchar(50) DEFAULT NULL,
  `to` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`from`, `to`, `message`),
  FOREIGN KEY (`from`) REFERENCES `users` (`username`),
  FOREIGN KEY (`to`) REFERENCES `users` (`to`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;





/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-24 15:40:46