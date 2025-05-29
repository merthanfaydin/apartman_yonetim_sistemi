-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: apartman_yonetim_sistemi
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `aidatodemeleri`
--

DROP TABLE IF EXISTS `aidatodemeleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aidatodemeleri` (
  `odeme_id` int NOT NULL AUTO_INCREMENT,
  `daire_id` int NOT NULL,
  `aidat_tanim_id` int NOT NULL,
  `odeme_tarihi` date DEFAULT NULL,
  `odeme_tutari` decimal(10,2) NOT NULL,
  `odeme_durumu` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL,
  `odeme_yontemi` varchar(50) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `aciklama` text COLLATE utf8mb4_turkish_ci,
  PRIMARY KEY (`odeme_id`),
  KEY `daire_id` (`daire_id`),
  KEY `aidat_tanim_id` (`aidat_tanim_id`),
  CONSTRAINT `aidatodemeleri_ibfk_1` FOREIGN KEY (`daire_id`) REFERENCES `daireler` (`daire_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `aidatodemeleri_ibfk_2` FOREIGN KEY (`aidat_tanim_id`) REFERENCES `aidattanimlari` (`aidat_tanim_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aidatodemeleri`
--

LOCK TABLES `aidatodemeleri` WRITE;
/*!40000 ALTER TABLE `aidatodemeleri` DISABLE KEYS */;
/*!40000 ALTER TABLE `aidatodemeleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aidattanimlari`
--

DROP TABLE IF EXISTS `aidattanimlari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aidattanimlari` (
  `aidat_tanim_id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `aidat_adi` varchar(100) COLLATE utf8mb4_turkish_ci NOT NULL,
  `tutar` decimal(10,2) NOT NULL,
  `baslangic_tarihi` date NOT NULL,
  `bitis_tarihi` date DEFAULT NULL,
  `aciklama` text COLLATE utf8mb4_turkish_ci,
  PRIMARY KEY (`aidat_tanim_id`),
  KEY `site_id` (`site_id`),
  CONSTRAINT `aidattanimlari_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `siteler` (`site_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aidattanimlari`
--

LOCK TABLES `aidattanimlari` WRITE;
/*!40000 ALTER TABLE `aidattanimlari` DISABLE KEYS */;
/*!40000 ALTER TABLE `aidattanimlari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloklar`
--

DROP TABLE IF EXISTS `bloklar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bloklar` (
  `blok_id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `blok_adi` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `daire_sayisi` int NOT NULL,
  `kat_sayisi` int NOT NULL,
  `yapim_yili` int DEFAULT NULL,
  PRIMARY KEY (`blok_id`),
  KEY `site_id` (`site_id`),
  CONSTRAINT `bloklar_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `siteler` (`site_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloklar`
--

LOCK TABLES `bloklar` WRITE;
/*!40000 ALTER TABLE `bloklar` DISABLE KEYS */;
/*!40000 ALTER TABLE `bloklar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dairekullanicilari`
--

DROP TABLE IF EXISTS `dairekullanicilari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dairekullanicilari` (
  `daire_kullanici_id` int NOT NULL AUTO_INCREMENT,
  `daire_id` int NOT NULL,
  `kullanici_id` int NOT NULL,
  `baslangic_tarihi` date NOT NULL,
  `bitis_tarihi` date DEFAULT NULL,
  `ev_sahibi_mi` tinyint(1) NOT NULL,
  PRIMARY KEY (`daire_kullanici_id`),
  KEY `daire_id` (`daire_id`),
  KEY `kullanici_id` (`kullanici_id`),
  CONSTRAINT `dairekullanicilari_ibfk_1` FOREIGN KEY (`daire_id`) REFERENCES `daireler` (`daire_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dairekullanicilari_ibfk_2` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dairekullanicilari`
--

LOCK TABLES `dairekullanicilari` WRITE;
/*!40000 ALTER TABLE `dairekullanicilari` DISABLE KEYS */;
/*!40000 ALTER TABLE `dairekullanicilari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daireler`
--

DROP TABLE IF EXISTS `daireler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daireler` (
  `daire_id` int NOT NULL AUTO_INCREMENT,
  `blok_id` int NOT NULL,
  `daire_no` int NOT NULL,
  `kat_no` int NOT NULL,
  `brut_alan` decimal(8,2) DEFAULT NULL,
  `net_alan` decimal(8,2) DEFAULT NULL,
  `oda_sayisi` int DEFAULT NULL,
  PRIMARY KEY (`daire_id`),
  UNIQUE KEY `blok_id` (`blok_id`,`daire_no`),
  CONSTRAINT `daireler_ibfk_1` FOREIGN KEY (`blok_id`) REFERENCES `bloklar` (`blok_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daireler`
--

LOCK TABLES `daireler` WRITE;
/*!40000 ALTER TABLE `daireler` DISABLE KEYS */;
/*!40000 ALTER TABLE `daireler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duyuruhedefkitlesi`
--

DROP TABLE IF EXISTS `duyuruhedefkitlesi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `duyuruhedefkitlesi` (
  `hedef_id` int NOT NULL AUTO_INCREMENT,
  `duyuru_id` int NOT NULL,
  `hedef_tipi` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `hedef_referans_id` int DEFAULT NULL,
  PRIMARY KEY (`hedef_id`),
  KEY `duyuru_id` (`duyuru_id`),
  CONSTRAINT `duyuruhedefkitlesi_ibfk_1` FOREIGN KEY (`duyuru_id`) REFERENCES `duyurular` (`duyuru_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duyuruhedefkitlesi`
--

LOCK TABLES `duyuruhedefkitlesi` WRITE;
/*!40000 ALTER TABLE `duyuruhedefkitlesi` DISABLE KEYS */;
/*!40000 ALTER TABLE `duyuruhedefkitlesi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duyurukategorileri`
--

DROP TABLE IF EXISTS `duyurukategorileri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `duyurukategorileri` (
  `kategori_id` int NOT NULL AUTO_INCREMENT,
  `kategori_adi` varchar(100) COLLATE utf8mb4_turkish_ci NOT NULL,
  `aciklama` text COLLATE utf8mb4_turkish_ci,
  PRIMARY KEY (`kategori_id`),
  UNIQUE KEY `kategori_adi` (`kategori_adi`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duyurukategorileri`
--

LOCK TABLES `duyurukategorileri` WRITE;
/*!40000 ALTER TABLE `duyurukategorileri` DISABLE KEYS */;
INSERT INTO `duyurukategorileri` VALUES (1,'Genel','Genel site duyuruları'),(2,'Acil','Acil durumlar için duyurular'),(3,'Bakım','Bakım ve onarım çalışmaları hakkında duyurular'),(4,'Etkinlik','Site etkinlikleri hakkında duyurular');
/*!40000 ALTER TABLE `duyurukategorileri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `duyurular`
--

DROP TABLE IF EXISTS `duyurular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `duyurular` (
  `duyuru_id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `kategori_id` int NOT NULL,
  `baslik` varchar(200) COLLATE utf8mb4_turkish_ci NOT NULL,
  `icerik` text COLLATE utf8mb4_turkish_ci NOT NULL,
  `olusturma_tarihi` datetime NOT NULL,
  `baslangic_tarihi` date NOT NULL,
  `bitis_tarihi` date DEFAULT NULL,
  `onemli_mi` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`duyuru_id`),
  KEY `site_id` (`site_id`),
  KEY `kategori_id` (`kategori_id`),
  CONSTRAINT `duyurular_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `siteler` (`site_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `duyurular_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `duyurukategorileri` (`kategori_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `duyurular`
--

LOCK TABLES `duyurular` WRITE;
/*!40000 ALTER TABLE `duyurular` DISABLE KEYS */;
/*!40000 ALTER TABLE `duyurular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kilerler`
--

DROP TABLE IF EXISTS `kilerler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kilerler` (
  `kiler_id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `kiler_no` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL,
  `boyut` decimal(8,2) NOT NULL,
  `kat` int DEFAULT NULL,
  `blok_id` int DEFAULT NULL,
  PRIMARY KEY (`kiler_id`),
  UNIQUE KEY `site_id` (`site_id`,`kiler_no`),
  KEY `blok_id` (`blok_id`),
  CONSTRAINT `kilerler_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `siteler` (`site_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kilerler_ibfk_2` FOREIGN KEY (`blok_id`) REFERENCES `bloklar` (`blok_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kilerler`
--

LOCK TABLES `kilerler` WRITE;
/*!40000 ALTER TABLE `kilerler` DISABLE KEYS */;
/*!40000 ALTER TABLE `kilerler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kilertahsisleri`
--

DROP TABLE IF EXISTS `kilertahsisleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kilertahsisleri` (
  `tahsis_id` int NOT NULL AUTO_INCREMENT,
  `kiler_id` int NOT NULL,
  `daire_id` int NOT NULL,
  `baslangic_tarihi` date NOT NULL,
  `bitis_tarihi` date DEFAULT NULL,
  PRIMARY KEY (`tahsis_id`),
  KEY `kiler_id` (`kiler_id`),
  KEY `daire_id` (`daire_id`),
  CONSTRAINT `kilertahsisleri_ibfk_1` FOREIGN KEY (`kiler_id`) REFERENCES `kilerler` (`kiler_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `kilertahsisleri_ibfk_2` FOREIGN KEY (`daire_id`) REFERENCES `daireler` (`daire_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kilertahsisleri`
--

LOCK TABLES `kilertahsisleri` WRITE;
/*!40000 ALTER TABLE `kilertahsisleri` DISABLE KEYS */;
/*!40000 ALTER TABLE `kilertahsisleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kullanicilar`
--

DROP TABLE IF EXISTS `kullanicilar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kullanicilar` (
  `kullanici_id` int NOT NULL AUTO_INCREMENT,
  `rol_id` int NOT NULL,
  `ad` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `soyad` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `telefon` varchar(20) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `sifre_hash` varchar(255) COLLATE utf8mb4_turkish_ci NOT NULL,
  `kayit_tarihi` datetime NOT NULL,
  `son_giris_tarihi` datetime DEFAULT NULL,
  `aktif_mi` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`kullanici_id`),
  UNIQUE KEY `email` (`email`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `kullanicilar_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `kullanicirolleri` (`rol_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanicilar`
--

LOCK TABLES `kullanicilar` WRITE;
/*!40000 ALTER TABLE `kullanicilar` DISABLE KEYS */;
/*!40000 ALTER TABLE `kullanicilar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kullanicirolleri`
--

DROP TABLE IF EXISTS `kullanicirolleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kullanicirolleri` (
  `rol_id` int NOT NULL AUTO_INCREMENT,
  `rol_adi` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`rol_id`),
  UNIQUE KEY `rol_adi` (`rol_adi`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanicirolleri`
--

LOCK TABLES `kullanicirolleri` WRITE;
/*!40000 ALTER TABLE `kullanicirolleri` DISABLE KEYS */;
INSERT INTO `kullanicirolleri` VALUES (2,'Bina Yöneticisi'),(3,'Ev Sahibi'),(4,'Kiracı'),(1,'Site Yöneticisi');
/*!40000 ALTER TABLE `kullanicirolleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siteler`
--

DROP TABLE IF EXISTS `siteler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siteler` (
  `site_id` int NOT NULL AUTO_INCREMENT,
  `site_adi` varchar(100) COLLATE utf8mb4_turkish_ci NOT NULL,
  `adres` text COLLATE utf8mb4_turkish_ci NOT NULL,
  `telefon` varchar(20) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `kurulus_tarihi` date DEFAULT NULL,
  `toplam_blok_sayisi` int DEFAULT NULL,
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siteler`
--

LOCK TABLES `siteler` WRITE;
/*!40000 ALTER TABLE `siteler` DISABLE KEYS */;
/*!40000 ALTER TABLE `siteler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tadilatdairepayi`
--

DROP TABLE IF EXISTS `tadilatdairepayi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tadilatdairepayi` (
  `tadilat_pay_id` int NOT NULL AUTO_INCREMENT,
  `tadilat_id` int NOT NULL,
  `daire_id` int NOT NULL,
  `pay_tutari` decimal(10,2) NOT NULL,
  `odeme_durumu` varchar(20) COLLATE utf8mb4_turkish_ci NOT NULL,
  `odeme_tarihi` date DEFAULT NULL,
  PRIMARY KEY (`tadilat_pay_id`),
  KEY `tadilat_id` (`tadilat_id`),
  KEY `daire_id` (`daire_id`),
  CONSTRAINT `tadilatdairepayi_ibfk_1` FOREIGN KEY (`tadilat_id`) REFERENCES `tadilatlar` (`tadilat_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tadilatdairepayi_ibfk_2` FOREIGN KEY (`daire_id`) REFERENCES `daireler` (`daire_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tadilatdairepayi`
--

LOCK TABLES `tadilatdairepayi` WRITE;
/*!40000 ALTER TABLE `tadilatdairepayi` DISABLE KEYS */;
/*!40000 ALTER TABLE `tadilatdairepayi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tadilatlar`
--

DROP TABLE IF EXISTS `tadilatlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tadilatlar` (
  `tadilat_id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `tadilat_tur_id` int NOT NULL,
  `baslangic_tarihi` date NOT NULL,
  `bitis_tarihi` date DEFAULT NULL,
  `toplam_maliyet` decimal(12,2) NOT NULL,
  `durum` varchar(50) COLLATE utf8mb4_turkish_ci NOT NULL,
  `aciklama` text COLLATE utf8mb4_turkish_ci,
  PRIMARY KEY (`tadilat_id`),
  KEY `site_id` (`site_id`),
  KEY `tadilat_tur_id` (`tadilat_tur_id`),
  CONSTRAINT `tadilatlar_ibfk_1` FOREIGN KEY (`site_id`) REFERENCES `siteler` (`site_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tadilatlar_ibfk_2` FOREIGN KEY (`tadilat_tur_id`) REFERENCES `tadilatturleri` (`tadilat_tur_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tadilatlar`
--

LOCK TABLES `tadilatlar` WRITE;
/*!40000 ALTER TABLE `tadilatlar` DISABLE KEYS */;
/*!40000 ALTER TABLE `tadilatlar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tadilatturleri`
--

DROP TABLE IF EXISTS `tadilatturleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tadilatturleri` (
  `tadilat_tur_id` int NOT NULL AUTO_INCREMENT,
  `tur_adi` varchar(100) COLLATE utf8mb4_turkish_ci NOT NULL,
  `aciklama` text COLLATE utf8mb4_turkish_ci,
  PRIMARY KEY (`tadilat_tur_id`),
  UNIQUE KEY `tur_adi` (`tur_adi`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tadilatturleri`
--

LOCK TABLES `tadilatturleri` WRITE;
/*!40000 ALTER TABLE `tadilatturleri` DISABLE KEYS */;
INSERT INTO `tadilatturleri` VALUES (1,'Boya','Bina dış cephe veya iç mekan boya işlemleri'),(2,'Çatı Onarımı','Çatı tamir ve bakım işlemleri'),(3,'Altyapı','Su, elektrik, doğalgaz altyapı çalışmaları'),(4,'Peyzaj','Bahçe ve çevre düzenleme çalışmaları');
/*!40000 ALTER TABLE `tadilatturleri` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-29 20:10:09
