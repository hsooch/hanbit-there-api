-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hanbit_there
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `tbl_file`
--

DROP TABLE IF EXISTS `tbl_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_file` (
  `file_id` varchar(100) NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `content_type` varchar(100) NOT NULL,
  `content_length` bigint(20) NOT NULL,
  `file_name` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_file`
--

LOCK TABLES `tbl_file` WRITE;
/*!40000 ALTER TABLE `tbl_file` DISABLE KEYS */;
INSERT INTO `tbl_file` VALUES ('activity-guam-cocopalm-garden-beach_0','/hanbit/webpack/hanbit-there/src/img/activities/guam-cocopalm-garden-beach_0.png','image/png',186472,'guam-cocopalm.png'),('activity-guam-cocopalm-garden-beach_1','/hanbit/webpack/hanbit-there/src/img/activities/guam-cocopalm-garden-beach_1.png','image/png',135508,'cruise.png'),('activity-guam-cocopalm-garden-beach_2','/hanbit/webpack/hanbit-there/src/img/activities/guam-cocopalm-garden-beach_2.png','image/png',110221,'dive.png'),('activity-guam-cocopalm-garden-beach_3','/hanbit/webpack/hanbit-there/src/img/activities/guam-cocopalm-garden-beach_3.png','image/png',46327,'dolphin2.png'),('activity-guam-dolphin-cruise_3','/hanbit/webpack/hanbit-there/src/img/activities/guam-dolphin-cruise_3.png','image/png',36672,'dolphin1.png'),('activity-guam-dolphin-cruise_4','/hanbit/webpack/hanbit-there/src/img/activities/guam-dolphin-cruise_4.png','image/png',106754,'dolphin3.png'),('activity-guam-dolphin-cruise_5','/hanbit/webpack/hanbit-there/src/img/activities/guam-dolphin-cruise_5.png','image/png',143352,'dolphin.png'),('activity-guam-dolphin-cruise_6','/hanbit/webpack/hanbit-there/src/img/activities/guam-dolphin-cruise_6.png','image/png',46327,'dolphin2.png'),('avatar-l4OtT4yLmxVZ','/hanbit/webpack/hanbit-there/src/img/avatars/l4OtT4yLmxVZ.jpg','image/jpeg',8264,'l4OtT4yLmxVZ.jpg'),('there-Barcelona','/hanbit/webpack/hanbit-there/src/img/theres/Barcelona.jpg','image/jpeg',392608,'Barcelona.jpg'),('there-busan','/hanbit/webpack/hanbit-there/src/img/theres/busan.jpg','image/jpeg',306385,'busan.jpg'),('there-Danang','/hanbit/webpack/hanbit-there/src/img/theres/Danang.jpg','image/jpeg',44159,'Danang.jpg'),('there-Gold-Coast','/hanbit/webpack/hanbit-there/src/img/theres/Gold-Coast.jpg','image/jpeg',52965,'Gold-Coast.jpg'),('there-Guam','/hanbit/webpack/hanbit-there/src/img/theres/Guam.png','image/png',667020,'Guam.png'),('there-Sabana','/hanbit/webpack/hanbit-there/src/img/theres/Sabana.jpg','image/jpeg',162436,'sabana.jpg'),('there-seoul','/hanbit/webpack/hanbit-there/src/img/theres/seoul.jpg','image/jpeg',215281,'seoul.jpg'),('there-Taiwan','/hanbit/webpack/hanbit-there/src/img/theres/Taiwan.jpg','image/jpeg',71308,'Taiwan.jpg'),('there-Tokyo','/hanbit/webpack/hanbit-there/src/img/theres/Tokyo.jpg','image/jpeg',562811,'Tokyo.jpg');
/*!40000 ALTER TABLE `tbl_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_info`
--

DROP TABLE IF EXISTS `tbl_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_info` (
  `id` varchar(150) NOT NULL,
  `info_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `value` varchar(500) NOT NULL,
  `info_order` int(11) NOT NULL,
  PRIMARY KEY (`id`,`info_id`),
  CONSTRAINT `fk_tbl_info_tbl_there1` FOREIGN KEY (`id`) REFERENCES `tbl_there` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_info`
--

LOCK TABLES `tbl_info` WRITE;
/*!40000 ALTER TABLE `tbl_info` DISABLE KEYS */;
INSERT INTO `tbl_info` VALUES ('Barcelona',1,'FC','바르셀로나',1),('busan',1,'경상도','부산 갈매기',1),('Danang',1,'언어','베트남어',1),('Danang',2,'화폐','동 (VND)',2),('Danang',3,'비자','15일이하 무비자',3),('Danang',4,'TIP','다낭의 근교 관광지 \'바나힐\'과 \'호이안\'은 꼭 들러보세요',4),('Gold-Coast',1,'언어','영어',1),('Gold-Coast',2,'화폐','호주 달러(AUD)',2),('Gold-Coast',3,'비자','비자 필수, 관광비자 필요(ETA 비자)',3),('Gold-Coast',4,'TIP','240v, 50Hz이나 플러그 모양이 다른 경우가 있음',4),('Guam',1,'언어','영어',1),('Guam',2,'화폐','달러(USD, Doller)',2),('Guam',3,'비자','45일 미만 무비자 체류',3),('Guam',4,'TIP','110v이므로 변환플러그(돼지코)가 필요',4),('Hawaii',1,'언어','영어',1),('Hawaii',2,'화폐','달러(USD, Dollar)',2),('Hawaii',3,'비자','45일 미만 무비자 체류',3),('Hawaii',4,'TIP','110v이므로 변환플러그(돼지코)가 필요',4),('LasVegas',1,'언어','영어',1),('LasVegas',2,'화폐','달러(USD, Dollar)',2),('LasVegas',3,'비자','90일 이하 체류시 ESTA 로 무비자 입국 가능',3),('LasVegas',4,'TIP','110v이므로 변환플러그(돼지코)가 필요',4),('Newyork',1,'언어','영어',1),('Newyork',2,'화폐','US달러 (USD)',2),('Newyork',3,'비자','90일 이하 체류시 ESTA 로 무비자 입국 가능',3),('Newyork',4,'TIP','110v이므로 변환플러그(돼지코)가 필요',4),('Sabana',1,'제목','내용',1),('Saipan',1,'언어','영어',1),('Saipan',2,'화폐','달러(USD, Dollar)',2),('Saipan',3,'비자','45일 미만 무비자 체류',3),('Saipan',4,'TIP','110v이므로 변환플러그(돼지코)가 필요',4),('San-Francisco',1,'언어','영어',1),('San-Francisco',2,'화폐','달러(USD, Dollar)',2),('San-Francisco',3,'비자','90일 이하 체류시 ESTA 로 무비자 입국 가능',3),('San-Francisco',4,'TIP','110v이므로 변환플러그(돼지코)가 필요',4),('seoul',1,'서울 대표축제','경복궁 별빛야행(3.20~4.14) 서울밤도깨비야시장(3.24~10.29) 서울패션위크(3.27~4.1) 2017 연등회(4.28~4.30) 서울대공원 벛꽃축제(4.8~4.12)',1),('seoul',2,'서울시선정 10대 여행지','명동, 동대문쇼핑타운, 경복궁, 서울타워, 인사동, 남대문시장, 동대문디자인플라자, 홍대, 청계천',2),('seoul',3,'서울 관광안내','<a href=\"http://korean.visitseoul.net/index\" target=\"_blank\">바로가기</a>',3),('Taiwan',1,'언어','중국어(만다린), 객가어',1),('Taiwan',2,'화폐','뉴 타이완 달러(TWD, New Taiwan Dollar)',2),('Taiwan',3,'비자','30일 이하 대만 무비자',3),('Taiwan',4,'TIP','교통패스 이지카드를 구입하면 편리합니다',4),('Tokyo',1,'귀찮음','귀찮음',1),('Tokyo',2,'제목','내용',2),('Tokyo',3,'제목','내용',3);
/*!40000 ALTER TABLE `tbl_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_location`
--

DROP TABLE IF EXISTS `tbl_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_location` (
  `id` varchar(150) NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_tbl_location_tbl_there` FOREIGN KEY (`id`) REFERENCES `tbl_there` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_location`
--

LOCK TABLES `tbl_location` WRITE;
/*!40000 ALTER TABLE `tbl_location` DISABLE KEYS */;
INSERT INTO `tbl_location` VALUES ('Barcelona',41.385064,2.173403),('busan',35.179554,129.075642),('Danang',16.054407,108.202167),('Gold-Coast',-28.016667,153.4),('Guam',13.444304,144.793732),('Hawaii',21.3165109,-157.8487859),('LasVegas',36.14211,-115.1324358),('Newyork',40.73061,-73.935242),('Sabana',10.529178,0.525782),('Saipan',15.1780588,145.7511158),('San-Francisco',37.7699955,-122.4196075),('seoul',37.566535,126.977969),('Taiwan',25.032969,121.565418),('Tokyo',35.689487,139.691706);
/*!40000 ALTER TABLE `tbl_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_member`
--

DROP TABLE IF EXISTS `tbl_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_member` (
  `uid` varchar(300) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `create_dt` varchar(45) NOT NULL,
  `created_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_member`
--

LOCK TABLES `tbl_member` WRITE;
/*!40000 ALTER TABLE `tbl_member` DISABLE KEYS */;
INSERT INTO `tbl_member` VALUES ('HtqCeBMBAp6B','zxcvb','2a6ba8a38580760b93f2233b71db4d29ee312628270e164884cc112eb2feafe77290dfc3333afdeb','2017-08-29 11:36:56',NULL),('IJCtWv1BTzkl','qwerty','955126c1dc022b4c8d695cd19cdcdf2fc36a722fd1e507c8b52b30bcf4067e8cae6caf13de07099e','2017-08-29 11:25:58',NULL),('l4OtT4yLmxVZ','abcd','fb8adeabd6973cae8e5665e2183b6cdda341c8cb56593413900b7b9052db8d0e88cafb4a60667bed','2017-08-29 11:23:59',NULL),('lc3gVzctWTFo','qwer','e47e3e06073f40d33b593721ee06c56ab32733540c5af89c1873f48f98b9a53b43e38a10e35fef88','2017-09-12 09:45:13',NULL),('QhXCrF8lUP33','gggg','b8f78be4a8a7406e8060b2f20d2643610fa62193dc87db80dcf013d5511f7e0d6329e1e253c35dfc','2017-08-29 12:01:57',NULL),('tzWbiLW1p7fc','asdf','e342c4581e5231705d8dd533ce5ca37f58f4d909bf6840e0a87c4312744cabcc0928662861206f60','2017-08-29 10:54:59',NULL);
/*!40000 ALTER TABLE `tbl_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_member_detail`
--

DROP TABLE IF EXISTS `tbl_member_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_member_detail` (
  `uid` varchar(300) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `info` char(1) NOT NULL DEFAULT 'N',
  `avatar` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  CONSTRAINT `fk_tbl_member_detail_tbl_member1` FOREIGN KEY (`uid`) REFERENCES `tbl_member` (`uid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_member_detail`
--

LOCK TABLES `tbl_member_detail` WRITE;
/*!40000 ALTER TABLE `tbl_member_detail` DISABLE KEYS */;
INSERT INTO `tbl_member_detail` VALUES ('l4OtT4yLmxVZ','absd','12312412412','Y','/api/file/avatar-l4OtT4yLmxVZ');
/*!40000 ALTER TABLE `tbl_member_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_there`
--

DROP TABLE IF EXISTS `tbl_there`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_there` (
  `id` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `name_en` varchar(150) NOT NULL,
  `background` varchar(500) NOT NULL,
  `summary` varchar(500) NOT NULL,
  `timezone` varchar(100) NOT NULL,
  `group_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tbl_there_group_id_idx` (`group_id`),
  CONSTRAINT `fk_tbl_there_group_id` FOREIGN KEY (`group_id`) REFERENCES `tbl_there_group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_there`
--

LOCK TABLES `tbl_there` WRITE;
/*!40000 ALTER TABLE `tbl_there` DISABLE KEYS */;
INSERT INTO `tbl_there` VALUES ('adelaide','애들레이드','Adelaide','/img/theres/adelaide.jpg','','Australia/Adelaide','Oceania'),('Bali','발리','Bali','/img/theres/Bali.jpg','','Asia/Makassar','Asia'),('BangKok','방콕','BangKok','/img/theres/BangKok.jpg','','Asia/Bangkok','Asia'),('Barcelona','바르셀로나','Barcelona','/api/file/there-Barcelona','메시의 도시..','Europe/Madrid','Europe'),('Boracay','보라카이','Boracay','/img/theres/Boracay.jpg','','Asia/Manila','Asia'),('Brisbane','브리즈번','Brisbane','./img/theres/Brisbane.jpg','','Australia/Brisbane','Oceania'),('Budapest','부다페스트','Budapest','./img/theres/Budapest.jpg','','Europe/Budapest','Europe'),('busan','부산','Busan','/api/file/there-busan','비린내 나는 부둣가','Asia/Seoul','Korea'),('Cebu','세부','Cebu','./img/theres/Cebu.jpg','','Asia/Manila','Asia'),('Chiang-Mai','치앙마이','Chiang-Mai','./img/theres/Chiang-Mai.jpg','','Asia/Bangkok','Asia'),('Chungcheong','충청','Chungcheong','./img/theres/Chungcheong.jpg','','Asia/Seoul','Korea'),('daejeon','대전','Daejeon','./img/theres/daejeon.jpg','','Asia/Seoul','Korea'),('Danang','다낭','Danang','/api/file/there-Danang','관광과 휴양이 공존하는 도시 다낭!','Asia/Ho_Chi_Minh','Asia'),('darwin','다윈','Darwin','./img/theres/darwin.jpg','','Australia/Darwin','Oceania'),('Florence','피렌체','Florence','./img/theres/Florence.jpg','','Europe/Rome','Europe'),('Fukuoka','후쿠오카','Fukuoka','./img/theres/Fukuoka.jpg','','Asia/Tokyo','Asia'),('gangwon','강원','Gangwon','./img/theres/gangwon.jpg','','Asia/Seoul','Korea'),('Gold-Coast','골드코스트','Gold-Coast','/api/file/there-Gold-Coast','문득 문득 찾아오는 작은 발견이 바다에서의 삶을 연장케 한다. 이를테면 요트 뒤를 졸졸 따라오며 점프를 하고 장난을 치는 한 마리의 돌고래나 불현듯 나타난 무지개 같은 것. <br>\n내 요트를 타는 사람들이 사소한 것들로 감동할 수 있는 삶이 진정 행복한 삶임을 깨달았으면 좋겠다. <br>\n-샴페인 세일링 크루즈의 Klass&Elke','Australia/Sydney','Oceania'),('Guam','괌','Guam','/api/file/there-Guam','남태평양 푸른 바다의 넘실거림을 보고있자니<br>어제가 오늘인 듯, 오늘이 어제인 듯 시간의 흐름이 느껴지지 않는곳, 괌','Pacific/Guam','America'),('gyeonggi','경기','Gyeonggi','./img/theres/gyeonggi.jpg','','Asia/Seoul','Korea'),('gyeongsang','경상','Gyeongsang','./img/theres/gyeongsang.jpg','','Asia/Seoul','Korea'),('Hawaii','하와이','Hawaii','/img/theres/Hawaii.jpg','시원하게 뻗은 야자수와 말없이 걷기만해도 좋을 것 같은 와이키키 비치.<br>다양한 인종, 문화, 그보다 더 다양한 자연환경이 절묘하게 어울리는 레인보우 스테이트','Pacific/Honolulu','America'),('Hokkaido','훗카이도','Hokkaido','./img/theres/Hokkaido.jpg','','Asia/Tokyo','Asia'),('HongKong','홍콩','HongKong','./img/theres/HongKong.jpg','','Asia/Hong_Kong','Asia'),('incheon','인천','Incheon','./img/theres/incheon.jpg','','Asia/Seoul','Korea'),('Interlaken','인터라켄','Interlaken','./img/theres/Interlaken.jpg','','Europe/Zurich','Europe'),('Jeju','제주','Jeju','./img/theres/Jeju.jpg','','Asia/Seoul','Korea'),('jeolla','전라','Jeolla','./img/theres/jeolla.jpg','','Asia/Seoul','Korea'),('Kotakinabalu','코타키나발루','Kotakinabalu','./img/theres/Kotakinabalu.jpg','','Asia/Kuching','Asia'),('Kualalumpur','쿠알라룸푸르','Kualalumpur','./img/theres/Kualalumpur.jpg','','Asia/Kuala_Lumpur','Asia'),('Laos','라오스','Laos','./img/theres/Laos.jpg','','Asia/Vientiane','Asia'),('LasVegas','라스베가스','LasVegas','/img/theres/LasVegas.jpg','호화스러운 도시, 24시간 화려한 조명이 가득 메운 환락의 도시','America/Tijuana','America'),('Lisbon','리스본','Lisbon','./img/theres/Lisbon.jpg','','Europe/Lisbon','Europe'),('London','런던','London','./img/theres/London.jpg','','Europe/London','Europe'),('Macau','마카오','Macau','./img/theres/Macau.jpg','','Asia/Macau','Asia'),('Madrid','마드리드','Madrid','./img/theres/Madrid.jpg','','Europe/Madrid','Europe'),('Melbourne','멜버른','Melbourne','./img/theres/Melbourne.jpg','','Australia/Melbourne','Oceania'),('Mongolia','몽골','Mongolia','./img/theres/Mongolia.jpg','','Asia/Ulaanbaatar','Asia'),('naples','나폴리','Naples','./img/theres/naples.jpg','','Europe/Rome','Europe'),('Newyork','뉴욕','Newyork','/img/theres/Newyork.jpg','오늘은 내 남은 인생의 첫날이다<br>-센트럴파크의 어느 벤치에 누군가가 새긴 낙서','America/New_York','America'),('NewZealand','뉴질랜드','NewZealand','./img/theres/NewZealand.jpg','','Pacific/Auckland','Oceania'),('Okinawa','오키나와','Okinawa','./img/theres/Okinawa.jpg','','Asia/Tokyo','Asia'),('Osaka','오사카','Osaka','./img/theres/Osaka.jpg','','Asia/Tokyo','Asia'),('Paris','파리','Paris','./img/theres/Paris.jpg','','Europe/Paris','Europe'),('perth','퍼스','Perth','./img/theres/perth.jpg','','Australia/Perth','Oceania'),('Phuket','푸켓','Phuket','./img/theres/Phuket.jpg','','Asia/Bangkok','Asia'),('qingdao','칭다오','Qingdao','./img/theres/qingdao.jpg','','Asia/Shanghai','Asia'),('Rome','로마','Rome','./img/theres/Rome.jpg','','Europe/Rome','Europe'),('Sabana','사바나','Sabana','/api/file/there-Sabana','여기가 사바나','Africa/Cairo','Africa'),('Saipan','사이판','Saipan','/img/theres/Saipan.jpg','늘 혼자 여행하는게 좋았지만<br>꼭 가족과 함께 다시 오고 싶은 곳이 있었다.<br>사이판. 사이판이 내게 그랬다.','Pacific/Saipan','America'),('San-Francisco','샌프란시스코','San-Francisco','/img/theres/San-Francisco.jpg','금문교로 대표되는, 아름다움과 낭만의 도시','America/Los_Angeles','America'),('seoul','서울','Seoul','/api/file/there-seoul','대한민국의 수도이자 최대 도시<br>\n아름다운 여행의 시작이자 <br>\n독특한 맛집과 여행이 머무는 서울<br>','Asia/Seoul','Korea'),('Shanghai','상해','Shanghai','./img/theres/Shanghai.jpg','','Asia/Shanghai','Asia'),('Siemreap','시엠립','Siemreap','./img/theres/Siemreap.jpg','','Asia/Phnom_Penh','Asia'),('Singapore','싱가폴','Singapore','./img/theres/Singapore.jpg','','Asia/Singapore','Asia'),('Sydney','시드니','Sydney','./img/theres/Sydney.jpg','','Australia/Sydney','Oceania'),('Taiwan','대만','Taiwan','/api/file/there-Taiwan','대만은 웅장한 자연의 관대함, 시끌벅적한 야시장의 소박함,<br>그리그 그 앞에서 한 껏 겸손해지는 나를 만날 수 있는 곳.','Asia/Taipei','Asia'),('tasmania','타즈매니아','Tasmania','./img/theres/tasmania.jpg','','Australia/Sydney','Oceania'),('Tokyo','도쿄','Tokyo','/api/file/there-Tokyo','첫번째 나의 도쿄는 새로웠고, 두번째 도쿄는 익숙했다. <br> 세 번의 도쿄는 다시 새로워졌다. <br> 다음 번의 도쿄는 어떨까?','Asia/Tokyo','Asia'),('uluru','울룰루','Uluru','./img/theres/uluru.jpg','','Australia/Sydney','Oceania'),('Venice','베네치아','Venice','./img/theres/Venice.jpg','','Europe/Rome','Europe'),('vienna','비엔나','Vienna','./img/theres/vienna.jpg','','Europe/Vienna','Europe');
/*!40000 ALTER TABLE `tbl_there` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_there_group`
--

DROP TABLE IF EXISTS `tbl_there_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_there_group` (
  `id` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  `group_order` int(11) NOT NULL,
  `update_dt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_there_group`
--

LOCK TABLES `tbl_there_group` WRITE;
/*!40000 ALTER TABLE `tbl_there_group` DISABLE KEYS */;
INSERT INTO `tbl_there_group` VALUES ('Africa','아프리카',6,'2017-07-26 12:42:21'),('America','아메리카',1,'2017-07-24 11:53:54'),('Asia','아시아',2,'2017-07-24 11:53:54'),('Europe','유럽',3,'2017-07-24 11:02:17'),('Korea','국내',5,'2017-07-26 12:42:05'),('Oceania','오세아니아',4,'2017-07-24 11:02:16');
/*!40000 ALTER TABLE `tbl_there_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_traffic`
--

DROP TABLE IF EXISTS `tbl_traffic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_traffic` (
  `id` varchar(150) NOT NULL,
  `traffic_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `icon` varchar(45) NOT NULL,
  `contents` varchar(500) NOT NULL,
  `traffic_order` int(11) NOT NULL,
  PRIMARY KEY (`id`,`traffic_id`),
  CONSTRAINT `fk_tbl_traffic_tbl_there1` FOREIGN KEY (`id`) REFERENCES `tbl_there` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_traffic`
--

LOCK TABLES `tbl_traffic` WRITE;
/*!40000 ALTER TABLE `tbl_traffic` DISABLE KEYS */;
INSERT INTO `tbl_traffic` VALUES ('Barcelona',1,'교통은','bus','어떨까?',1),('busan',1,'제목','bus','내용',1),('Danang',1,'오토바이','motorcycle','대부분의 현지인이 이용하는 교통수단. 택시보다 저렴하지만 흥정은 필수!',1),('Danang',2,'자전거','bicycle','교통수단이라기 보다 관광용! 요금은 흥정하기 나름이다.',2),('Danang',3,'택시','taxi','하얀택시, 노란택시, 초록택시 중 하얀택시와 초록택시가 친절하다고 한다. 콜택시 또한 서비스가 좋다.',3),('Gold-Coast',1,'아쿠아덕','ship','육지와 바다를 누비는 수륙양용버스 아쿠아덕은 골드코스트에서 꼭 타보아야 할 명물이다.',1),('Gold-Coast',2,'서프사이드 버스 라인','bus','골드코스트의 유일한 대중교통이다. 3일권 가격은 성인 A$26.00, 어린이 A$13.00, 학생이 A$13.00이다.',2),('Guam',1,'레드 괌 셔틀 버스','bus','주요 호텔과 쇼핑센터는 물론 유명 레스토랑까지 노선에 포함돼 있어 유용하다.',1),('Guam',2,'택시 Taxi','taxi','호텔이나 쇼핑센터 같은 지정된 지점에서 탑승. 팁은 요금의 10%면 적당',2),('Guam',3,'투몬 셔틀 버스','bus','투몬과 타무닝 지역을 연결하며 북부, 남부노선이 있고 약 8분 간격 운행',3),('Guam',4,'렌트카 Rent-a-Car','car','괌 자유여행자들에게 최고의 교통수단이다. 그러다보니, 여행 전 예약해서 준비해둘것.',4),('Guam',5,'갤러리아 무료 셔틀 버스','bus','투몬 지역과 타무닝 지역의 주요 호텔을 3개의 노선이 운행',5),('Hawaii',1,'트롤리 Trolley','bus','가격 비싸고 에어콘 시설 없어서 추천하지는 않음. 창문이 없어 시원한 바람 맞으며 달리는 기분은 최고!',1),('Hawaii',2,'택시 Taxi','taxi','인원이 많으면 많을수록 유리한 교통수단. 요금이 비싸고 팁을 챙겨줘야 함을 잊지 말것',2),('Hawaii',3,'더버스 The Bus','bus','가격이 비교적 저렴하고 환승도 무료라 자유여행자들이 선호하는 교통수단',3),('Hawaii',4,'렌트카 Rent-a-Car','car','시간의 효율적 차원에서 하와이에서 가장 유리한 교통수단. 여건이 된다면 가장 권한다.',3),('LasVegas',1,'트램','subway','스트립 중심 도심위로 다닌다. 호텔들을 통과하기도 하며 무료로 이용가능하다.',1),('LasVegas',2,'UBER','taxi','택시로 이용이 편리하지만, 공항 내와 공항으로 가는 길에는 우버 택시를 이용할 수 없다.',2),('LasVegas',3,'RTC','bus','DEUCE / SDX / WAX / CX / DVX 다섯가지를 모두 이용할 수 있는 통합 버스. 제한된 시간 내에 무한적으로 이용 가능하다.',3),('Newyork',1,'지하철(Subway)','subway','뉴욕 메트로의 첫번째 대표주자 지하철. 지하철 내부에서 공연을 즐길 수 있는 뉴욕의 서브웨이.',1),('Newyork',2,'기차(LIRR)','train','뉴욕의 곳곳으로 다니는 \'럴\'이라고 불리는 뉴욕 기차. 따로 무제한 패스가 있으니 여행 떠나기전 꼭 확인할 것',2),('Newyork',3,'버스(Bus)','bus','버스 정류장에서 문자를 보내면 버스 도착시간 답장을 받아 확인할 수 있다.',3),('Sabana',1,'제목','bus','내용',1),('Saipan',1,'이브닝 쇼핑셔틀 Bus','bus','사이판 북부 쪽에 위치한 각 호텔과 DFS갤러리아를 연결하는 유료 순환 셔틀 버스',1),('Saipan',2,'택시 Taxi','taxi','가격을 미리 흥정하여 시간제로 원하는 여행지를 돌아보는걸 추천한다.',2),('Saipan',3,'DFS 갤러리아 익스프레스 Bus','bus','사이판 내 주요 호텔들과 가라판 중심에 위치한 DFS갤러리아를 연결하는 무료 셔틀버스',3),('Saipan',4,'렌트카 Rent-a-Car','car','자유여행자라면 가장 좋은 선택이다.',3),('San-Francisco',1,'MUNI METRO','subway','샌프란시스코 시내에서만 운영하는 전차',1),('San-Francisco',2,'MUNI BUS','bus','시내의 구석구석을 연결하는 버스, 노선이 복잡하므로 버스 노선도는 필수',2),('San-Francisco',3,'Cable Car','train','다운타운에서 Fisherman’s Wharf까지 이동할 때 유용',3),('San-Francisco',4,'BART','subway','한국식 지상/지하 전철, 샌프란시스코 시내를 벗어나 Bay Area의 East Bay쪽 도시를 갈 때 유용',3),('seoul',1,'서울의 교통은','subway','지옥과도 같지....',1),('seoul',2,'차','car','타지마.. 욕나옴...',2),('Taiwan',1,'지하철 MRT','subway','타이페이 시내 대부분을 이동 할 수 있는 타이페이 교통의 중심 지하철',1),('Taiwan',2,'자전거','bicycle','시내 곳곳에서 쉽게 찾을 수 있는 자전거 정거장에서 자유롭게 이용 후 30분 무료 탑승 후 반납할 수 있는 자전거',2),('Taiwan',3,'시내버스 bus','bus','타이페이 시민의 발이 되어주는, 200여개의 노선이 운행되고 있는 타이페이 버스',3),('Taiwan',4,'호텔 셔틀버스','bus','타이완 관광청에서 운영하고 주요관광지로 이동할 수 있는 셔틀버스',4),('Taiwan',5,'택시','taxi','친절한 택시기사가 많기로 소문난 타이페이 택시',5),('Tokyo',1,'아무거나','bus','타고다님',1),('Tokyo',2,'제목','bus','내용',2),('Tokyo',3,'제목','bus','내용',3);
/*!40000 ALTER TABLE `tbl_traffic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'hanbit_there'
--

--
-- Dumping routines for database 'hanbit_there'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-12 12:20:16
