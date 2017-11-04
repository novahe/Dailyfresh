-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: tiantian
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.17.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user info',7,'add_userinfo'),(20,'Can change user info',7,'change_userinfo'),(21,'Can delete user info',7,'delete_userinfo'),(22,'Can add type info',8,'add_typeinfo'),(23,'Can change type info',8,'change_typeinfo'),(24,'Can delete type info',8,'delete_typeinfo'),(25,'Can add goods info',9,'add_goodsinfo'),(26,'Can change goods info',9,'change_goodsinfo'),(27,'Can delete goods info',9,'delete_goodsinfo'),(28,'Can add cart info',10,'add_cartinfo'),(29,'Can change cart info',10,'change_cartinfo'),(30,'Can delete cart info',10,'delete_cartinfo'),(31,'Can add order info',11,'add_orderinfo'),(32,'Can change order info',11,'change_orderinfo'),(33,'Can delete order info',11,'delete_orderinfo'),(34,'Can add order dtail info',12,'add_orderdtailinfo'),(35,'Can change order dtail info',12,'change_orderdtailinfo'),(36,'Can delete order dtail info',12,'delete_orderdtailinfo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$LlnqK2AKhKKU$6LJmRgAowB4YblC97osN7eppsZtRyckjYWTqBWCKSI4=','2017-10-28 10:56:21.030829',1,'admin','','','admin@qq.com',1,1,'2017-10-28 10:55:45.984887');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_cartinfo`
--

DROP TABLE IF EXISTS `cart_cartinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_cartinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_carti_goods_id_356f5ce0300c7f5f_fk_goods_goodsinfo_id` (`goods_id`),
  KEY `cart_cartinfo_user_id_2ac7dec92cce8599_fk_user_userinfo_id` (`user_id`),
  CONSTRAINT `cart_carti_goods_id_356f5ce0300c7f5f_fk_goods_goodsinfo_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goodsinfo` (`id`),
  CONSTRAINT `cart_cartinfo_user_id_2ac7dec92cce8599_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cartinfo`
--

LOCK TABLES `cart_cartinfo` WRITE;
/*!40000 ALTER TABLE `cart_cartinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_cartinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-10-28 11:00:07.741816','1','火龙果',2,'已修改 gpic 和 gcontent 。',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(10,'cart','cartinfo'),(5,'contenttypes','contenttype'),(9,'goods','goodsinfo'),(8,'goods','typeinfo'),(12,'order','orderdtailinfo'),(11,'order','orderinfo'),(6,'sessions','session'),(7,'user','userinfo');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-10-28 09:32:52.353393'),(2,'auth','0001_initial','2017-10-28 09:32:54.506605'),(3,'admin','0001_initial','2017-10-28 09:32:55.077272'),(4,'contenttypes','0002_remove_content_type_name','2017-10-28 09:32:55.425553'),(5,'auth','0002_alter_permission_name_max_length','2017-10-28 09:32:55.662421'),(6,'auth','0003_alter_user_email_max_length','2017-10-28 09:32:55.894779'),(7,'auth','0004_alter_user_username_opts','2017-10-28 09:32:55.948709'),(8,'auth','0005_alter_user_last_login_null','2017-10-28 09:32:56.124956'),(9,'auth','0006_require_contenttypes_0002','2017-10-28 09:32:56.134677'),(10,'user','0001_initial','2017-10-28 09:32:56.234677'),(11,'user','0002_auto_20171008_0313','2017-10-28 09:32:56.459176'),(12,'user','0003_auto_20171008_1338','2017-10-28 09:32:56.761631'),(13,'user','0004_auto_20171008_1341','2017-10-28 09:32:56.803527'),(14,'goods','0001_initial','2017-10-28 09:32:57.386953'),(15,'goods','0002_auto_20171025_1202','2017-10-28 09:32:57.402342'),(16,'cart','0001_initial','2017-10-28 09:32:57.965901'),(17,'cart','0002_auto_20171025_1225','2017-10-28 09:32:57.985751'),(18,'order','0001_initial','2017-10-28 09:32:59.021061'),(19,'sessions','0001_initial','2017-10-28 09:32:59.203415'),(20,'order','0002_auto_20171104_2045','2017-11-04 13:24:44.139579'),(21,'order','0003_orderdtailinfo','2017-11-04 13:24:44.933864');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('8n7kt5jzp6lyyy2azc55ektk2xl04sm7','NzY0ZmI2MjUyMzEzYWU1OWRhNGE3OGJmZjI3MGM2ZmYxNzI0MDIyNDp7InVzZXJfbmFtZSI6IjIwMTQ1NDk5IiwiX2F1dGhfdXNlcl9oYXNoIjoiMTIwYTg2YmU4OTViYzk3YTczNGI2Y2M3NGQxYzU1YmNjOWJlNzQwMyIsInVzZXJfaWQiOjEsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==','2017-11-11 11:18:40.228847'),('9dvlh9xkwp2p2fa7pwvio1rx293uzoqc','MWUyMWM0OTIwYzEwYTY4YjliOGM1Njk0ZDlkODg3ZTk0ZWI5ODU2Yzp7InVzZXJfbmFtZSI6IjIwMTQ1NDk5IiwidXNlcl9pZCI6MX0=','2017-11-18 13:25:27.285488'),('i2g9fb6zw3l50n3iq3uy3krsxteijnpz','MWUyMWM0OTIwYzEwYTY4YjliOGM1Njk0ZDlkODg3ZTk0ZWI5ODU2Yzp7InVzZXJfbmFtZSI6IjIwMTQ1NDk5IiwidXNlcl9pZCI6MX0=','2017-11-11 13:09:50.494073'),('sfugjyctvv55hjscism5oiyxv7exck32','MWUyMWM0OTIwYzEwYTY4YjliOGM1Njk0ZDlkODg3ZTk0ZWI5ODU2Yzp7InVzZXJfbmFtZSI6IjIwMTQ1NDk5IiwidXNlcl9pZCI6MX0=','2017-11-16 00:45:21.792660');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_goodsinfo`
--

DROP TABLE IF EXISTS `goods_goodsinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_goodsinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gtitle` varchar(20) NOT NULL,
  `gpic` varchar(100) NOT NULL,
  `gprice` decimal(5,2) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `gunit` varchar(20) NOT NULL,
  `gclick` int(11) NOT NULL,
  `gintroduction` varchar(200) NOT NULL,
  `gstore` int(11) NOT NULL,
  `gcontent` longtext NOT NULL,
  `gtype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_goodsinfo_3204e418` (`gtype_id`),
  CONSTRAINT `goods_goodsi_gtype_id_36acf5bdedbbbe8_fk_goods_typeinfo_id` FOREIGN KEY (`gtype_id`) REFERENCES `goods_typeinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_goodsinfo`
--

LOCK TABLES `goods_goodsinfo` WRITE;
/*!40000 ALTER TABLE `goods_goodsinfo` DISABLE KEYS */;
INSERT INTO `goods_goodsinfo` VALUES (1,'火龙果','goods/1.jpg',8.80,0,'500g',67,'新鲜火龙果',62,'<p>火龙果营养丰富、功能独特，它含有一般植物少有的植物性白蛋白以及花青素，丰富的维生素和水溶性膳食纤维。火龙果属于凉性水果，在自然状态下，果实于夏秋成熟，味甜，多汁。</p>',1),(2,'苹果','goods/5.jpg',8.80,0,'500g',68,'新鲜苹果',64,'苹果是一种低热量食物，每100克只产生60千卡热量。苹果中营养成分可溶性大，易被人体吸收，故有“活水”之称，其有利于溶解硫元素，使皮肤润滑柔嫩[1]  。据说“每天一苹果，医生远离我”。',1),(3,'橘子','goods/8.jpg',10.00,0,'500g',66,'新鲜橘子',65,'橘子中的维生素A还能够增强人体在黑暗环境中的视力和治疗夜盲症。橘子不宜食用过量，吃太多会患有胡萝卜素血症，皮肤呈深黄色，如同黄疸一般。若因吃太多橘子造成手掌变黄，只要停吃一段时间，就能让肤色渐渐恢复正常。明代张岱季叔张烨芳对橘子情有独钟，据载其“性好啖橘，橘熟，堆砌床案间，无非橘者，自刊不给，辄命数僮环立剥之”，吃到手脚都呈现黄色。',1),(4,'草莓','images/goods/goods003.jpg',18.50,0,'500g',68,'新鲜草莓',63,'原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。',1),(5,'青岛野生海捕大青虾','images/goods/goods018.jpg',50.00,0,'500g',66,'东平湖大青虾',66,'大青虾是广温动物，只要水温不低于0℃，均可正常生活，14℃以上开始摄食，最适生长水温25—30℃，其对突然降温的适应性很强。大青虾喜欢清新水质，要求溶氧较高，保持在5毫克/升以上。东平湖大青虾产量高，年产量约300吨左右，为我省青虾之冠。大青虾肉质细嫩，肉味鲜美，营养丰富，且易保鲜，投放市场后，供不应求。现在，大青虾已成为重要的出口商品，我县水产渔业公司以大青虾和白糖为原料烤制的甜味虾串，色鲜味美，出口到日本，十分受欢迎，成为人们馈赠亲友的佳品。',2),(6,'扇贝','images/goods/goods019.jpg',45.00,0,'500g',66,'扇贝',66,'扇贝又名海扇，其肉质鲜美，营养丰富，它的闭壳肌干制后即是“干贝”，被列入八珍之一。',2),(7,'冷冻秋刀鱼','images/goods/goods020.jpg',50.00,0,'500g',66,'冷冻秋刀鱼',66,'秋刀鱼是 颌针鱼目，竹刀鱼科，秋刀鱼属的唯一一种，也是重要的食用鱼类之一。其学名Cololabis saira 取自日本纪伊半岛当地对此鱼种的名称，其中saira系俄语(сайра)。中文与日文的汉字都是 \'秋刀鱼\' 可能是源自于其体型脩长如刀，同时生产季节在秋天的缘故。秋刀鱼在部分东亚地区的食物料理是种很常见的鱼种。体型细圆，棒状；背鳍后有5-6个小鳍，臀鳍后有6-7个游离小鳍；两颇多突起，但不呈长缘状，牙细弱；体背部深蓝色，腹部银白色，吻端与尾柄后部略带黄色。',2),(8,'基围虾','images/goods/goods021.jpg',48.20,0,'500g',66,'基围虾',66,'广温广盐性\n刀额新对虾\n刀额新对虾(5张)\n 虾类。广泛栖息于沙底、沙泥底、泥底的海区，在沿海50米等深浅范围内均有分布，而以10米内数量较多。刀额新对虾水温适应范围很广，在海区8～29°C均有分布，养殖水温以18-25°C为宜。刀额新对虾是广盐性种类，盐度范围可在0‰一34‰间。食性很杂，以捕食底栖生物为主，兼食底层浮游生物及游泳生物。',2),(9,'草莓','images/goods/goods003.jpg',18.50,0,'500g',68,'新鲜草莓',63,'原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。',1),(10,'草莓','images/goods/goods003.jpg',18.50,0,'500g',72,'新鲜草莓',58,'原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。',1),(11,'草莓','images/goods/goods003.jpg',18.50,0,'500g',68,'新鲜草莓',63,'原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。',1),(12,'草莓','images/goods/goods003.jpg',18.50,0,'500g',68,'新鲜草莓',63,'原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。',1),(13,'草莓','images/goods/goods003.jpg',18.50,0,'500g',69,'新鲜草莓',63,'原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。',1),(14,'草莓','images/goods/goods003.jpg',18.50,0,'500g',68,'新鲜草莓',63,'原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。',1),(15,'草莓','images/goods/goods003.jpg',18.50,0,'500g',68,'新鲜草莓',63,'原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。',1),(16,'草莓','images/goods/goods003.jpg',18.50,0,'500g',68,'新鲜草莓',63,'原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。',1),(17,'草莓','images/goods/goods003.jpg',18.50,0,'500g',68,'新鲜草莓',63,'原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。',1),(18,'草莓','images/goods/goods003.jpg',18.50,0,'500g',68,'新鲜草莓',63,'原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。',1),(19,'草莓','images/goods/goods003.jpg',18.50,0,'500g',68,'新鲜草莓',63,'原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。',1),(20,'草莓','images/goods/goods003.jpg',18.50,0,'500g',68,'新鲜草莓',63,'原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。',1),(21,'草莓','images/goods/goods003.jpg',18.50,0,'500g',68,'新鲜草莓',63,'原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。',1),(22,'草莓','images/goods/goods003.jpg',18.50,0,'500g',68,'新鲜草莓',63,'原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。',1),(23,'草莓','images/goods/goods003.jpg',18.50,0,'500g',68,'新鲜草莓',63,'原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。',1),(24,'草莓','images/goods/goods003.jpg',18.50,0,'500g',68,'新鲜草莓',63,'原产南美，中国各地及欧洲等地广为栽培。草莓营养价值高，含有多种营养物质 ，且有保健功效。',1),(25,'苹果','goods/5.jpg',8.80,0,'500g',68,'新鲜苹果',64,'苹果是一种低热量食物，每100克只产生60千卡热量。苹果中营养成分可溶性大，易被人体吸收，故有“活水”之称，其有利于溶解硫元素，使皮肤润滑柔嫩[1]  。据说“每天一苹果，医生远离我”。',1),(26,'苹果','goods/5.jpg',8.80,0,'500g',68,'新鲜苹果',64,'苹果是一种低热量食物，每100克只产生60千卡热量。苹果中营养成分可溶性大，易被人体吸收，故有“活水”之称，其有利于溶解硫元素，使皮肤润滑柔嫩[1]  。据说“每天一苹果，医生远离我”。',1),(27,'苹果','goods/5.jpg',8.80,0,'500g',69,'新鲜苹果',63,'苹果是一种低热量食物，每100克只产生60千卡热量。苹果中营养成分可溶性大，易被人体吸收，故有“活水”之称，其有利于溶解硫元素，使皮肤润滑柔嫩[1]  。据说“每天一苹果，医生远离我”。',1),(28,'苹果','goods/5.jpg',8.80,0,'500g',74,'新鲜苹果',62,'苹果是一种低热量食物，每100克只产生60千卡热量。苹果中营养成分可溶性大，易被人体吸收，故有“活水”之称，其有利于溶解硫元素，使皮肤润滑柔嫩[1]  。据说“每天一苹果，医生远离我”。',1),(29,'苹果','goods/5.jpg',8.80,0,'500g',70,'新鲜苹果',64,'苹果是一种低热量食物，每100克只产生60千卡热量。苹果中营养成分可溶性大，易被人体吸收，故有“活水”之称，其有利于溶解硫元素，使皮肤润滑柔嫩[1]  。据说“每天一苹果，医生远离我”。',1),(30,'苹果','goods/5.jpg',8.80,0,'500g',74,'新鲜苹果',63,'苹果是一种低热量食物，每100克只产生60千卡热量。苹果中营养成分可溶性大，易被人体吸收，故有“活水”之称，其有利于溶解硫元素，使皮肤润滑柔嫩[1]  。据说“每天一苹果，医生远离我”。',1),(31,'基围虾','images/goods/goods021.jpg',48.20,0,'500g',67,'基围虾',66,'广温广盐性\n刀额新对虾\n刀额新对虾(5张)\n 虾类。广泛栖息于沙底、沙泥底、泥底的海区，在沿海50米等深浅范围内均有分布，而以10米内数量较多。刀额新对虾水温适应范围很广，在海区8～29°C均有分布，养殖水温以18-25°C为宜。刀额新对虾是广盐性种类，盐度范围可在0‰一34‰间。食性很杂，以捕食底栖生物为主，兼食底层浮游生物及游泳生物。',2),(32,'基围虾','images/goods/goods021.jpg',48.20,0,'500g',66,'基围虾',66,'广温广盐性\n刀额新对虾\n刀额新对虾(5张)\n 虾类。广泛栖息于沙底、沙泥底、泥底的海区，在沿海50米等深浅范围内均有分布，而以10米内数量较多。刀额新对虾水温适应范围很广，在海区8～29°C均有分布，养殖水温以18-25°C为宜。刀额新对虾是广盐性种类，盐度范围可在0‰一34‰间。食性很杂，以捕食底栖生物为主，兼食底层浮游生物及游泳生物。',2),(33,'基围虾','images/goods/goods021.jpg',48.20,0,'500g',66,'基围虾',66,'广温广盐性\n刀额新对虾\n刀额新对虾(5张)\n 虾类。广泛栖息于沙底、沙泥底、泥底的海区，在沿海50米等深浅范围内均有分布，而以10米内数量较多。刀额新对虾水温适应范围很广，在海区8～29°C均有分布，养殖水温以18-25°C为宜。刀额新对虾是广盐性种类，盐度范围可在0‰一34‰间。食性很杂，以捕食底栖生物为主，兼食底层浮游生物及游泳生物。',2),(34,'基围虾','images/goods/goods021.jpg',48.20,0,'500g',66,'基围虾',66,'广温广盐性\n刀额新对虾\n刀额新对虾(5张)\n 虾类。广泛栖息于沙底、沙泥底、泥底的海区，在沿海50米等深浅范围内均有分布，而以10米内数量较多。刀额新对虾水温适应范围很广，在海区8～29°C均有分布，养殖水温以18-25°C为宜。刀额新对虾是广盐性种类，盐度范围可在0‰一34‰间。食性很杂，以捕食底栖生物为主，兼食底层浮游生物及游泳生物。',2),(35,'基围虾','images/goods/goods021.jpg',48.20,0,'500g',67,'基围虾',62,'广温广盐性\n刀额新对虾\n刀额新对虾(5张)\n 虾类。广泛栖息于沙底、沙泥底、泥底的海区，在沿海50米等深浅范围内均有分布，而以10米内数量较多。刀额新对虾水温适应范围很广，在海区8～29°C均有分布，养殖水温以18-25°C为宜。刀额新对虾是广盐性种类，盐度范围可在0‰一34‰间。食性很杂，以捕食底栖生物为主，兼食底层浮游生物及游泳生物。',2),(36,'基围虾','images/goods/goods021.jpg',48.20,0,'500g',66,'基围虾',66,'广温广盐性\n刀额新对虾\n刀额新对虾(5张)\n 虾类。广泛栖息于沙底、沙泥底、泥底的海区，在沿海50米等深浅范围内均有分布，而以10米内数量较多。刀额新对虾水温适应范围很广，在海区8～29°C均有分布，养殖水温以18-25°C为宜。刀额新对虾是广盐性种类，盐度范围可在0‰一34‰间。食性很杂，以捕食底栖生物为主，兼食底层浮游生物及游泳生物。',2),(37,'火龙果','goods/1.jpg',8.80,0,'500g',67,'新鲜火龙果',62,'<p>火龙果营养丰富、功能独特，它含有一般植物少有的植物性白蛋白以及花青素，丰富的维生素和水溶性膳食纤维。火龙果属于凉性水果，在自然状态下，果实于夏秋成熟，味甜，多汁。</p>',3),(38,'火龙果','goods/1.jpg',8.80,0,'500g',67,'新鲜火龙果',62,'<p>火龙果营养丰富、功能独特，它含有一般植物少有的植物性白蛋白以及花青素，丰富的维生素和水溶性膳食纤维。火龙果属于凉性水果，在自然状态下，果实于夏秋成熟，味甜，多汁。</p>',3),(39,'火龙果','goods/1.jpg',8.80,0,'500g',67,'新鲜火龙果',62,'<p>火龙果营养丰富、功能独特，它含有一般植物少有的植物性白蛋白以及花青素，丰富的维生素和水溶性膳食纤维。火龙果属于凉性水果，在自然状态下，果实于夏秋成熟，味甜，多汁。</p>',3),(40,'火龙果','goods/1.jpg',8.80,0,'500g',67,'新鲜火龙果',62,'<p>火龙果营养丰富、功能独特，它含有一般植物少有的植物性白蛋白以及花青素，丰富的维生素和水溶性膳食纤维。火龙果属于凉性水果，在自然状态下，果实于夏秋成熟，味甜，多汁。</p>',3),(41,'火龙果','goods/1.jpg',8.80,0,'500g',67,'新鲜火龙果',62,'<p>火龙果营养丰富、功能独特，它含有一般植物少有的植物性白蛋白以及花青素，丰富的维生素和水溶性膳食纤维。火龙果属于凉性水果，在自然状态下，果实于夏秋成熟，味甜，多汁。</p>',3),(42,'火龙果','goods/1.jpg',8.80,0,'500g',67,'新鲜火龙果',62,'<p>火龙果营养丰富、功能独特，它含有一般植物少有的植物性白蛋白以及花青素，丰富的维生素和水溶性膳食纤维。火龙果属于凉性水果，在自然状态下，果实于夏秋成熟，味甜，多汁。</p>',3),(43,'火龙果','goods/1.jpg',8.80,0,'500g',67,'新鲜火龙果',62,'<p>火龙果营养丰富、功能独特，它含有一般植物少有的植物性白蛋白以及花青素，丰富的维生素和水溶性膳食纤维。火龙果属于凉性水果，在自然状态下，果实于夏秋成熟，味甜，多汁。</p>',3),(44,'火龙果','goods/1.jpg',8.80,0,'500g',67,'新鲜火龙果',62,'<p>火龙果营养丰富、功能独特，它含有一般植物少有的植物性白蛋白以及花青素，丰富的维生素和水溶性膳食纤维。火龙果属于凉性水果，在自然状态下，果实于夏秋成熟，味甜，多汁。</p>',3),(45,'火龙果','goods/1.jpg',8.80,0,'500g',68,'新鲜火龙果',62,'<p>火龙果营养丰富、功能独特，它含有一般植物少有的植物性白蛋白以及花青素，丰富的维生素和水溶性膳食纤维。火龙果属于凉性水果，在自然状态下，果实于夏秋成熟，味甜，多汁。</p>',3),(46,'火龙果','goods/1.jpg',8.80,0,'500g',67,'新鲜火龙果',62,'<p>火龙果营养丰富、功能独特，它含有一般植物少有的植物性白蛋白以及花青素，丰富的维生素和水溶性膳食纤维。火龙果属于凉性水果，在自然状态下，果实于夏秋成熟，味甜，多汁。</p>',3),(47,'橘子','goods/8.jpg',10.00,0,'500g',66,'新鲜橘子',65,'橘子中的维生素A还能够增强人体在黑暗环境中的视力和治疗夜盲症。橘子不宜食用过量，吃太多会患有胡萝卜素血症，皮肤呈深黄色，如同黄疸一般。若因吃太多橘子造成手掌变黄，只要停吃一段时间，就能让肤色渐渐恢复正常。明代张岱季叔张烨芳对橘子情有独钟，据载其“性好啖橘，橘熟，堆砌床案间，无非橘者，自刊不给，辄命数僮环立剥之”，吃到手脚都呈现黄色。',4),(48,'橘子','goods/8.jpg',10.00,0,'500g',66,'新鲜橘子',65,'橘子中的维生素A还能够增强人体在黑暗环境中的视力和治疗夜盲症。橘子不宜食用过量，吃太多会患有胡萝卜素血症，皮肤呈深黄色，如同黄疸一般。若因吃太多橘子造成手掌变黄，只要停吃一段时间，就能让肤色渐渐恢复正常。明代张岱季叔张烨芳对橘子情有独钟，据载其“性好啖橘，橘熟，堆砌床案间，无非橘者，自刊不给，辄命数僮环立剥之”，吃到手脚都呈现黄色。',4),(49,'橘子','goods/8.jpg',10.00,0,'500g',66,'新鲜橘子',65,'橘子中的维生素A还能够增强人体在黑暗环境中的视力和治疗夜盲症。橘子不宜食用过量，吃太多会患有胡萝卜素血症，皮肤呈深黄色，如同黄疸一般。若因吃太多橘子造成手掌变黄，只要停吃一段时间，就能让肤色渐渐恢复正常。明代张岱季叔张烨芳对橘子情有独钟，据载其“性好啖橘，橘熟，堆砌床案间，无非橘者，自刊不给，辄命数僮环立剥之”，吃到手脚都呈现黄色。',4),(50,'橘子','goods/8.jpg',10.00,0,'500g',67,'新鲜橘子',64,'橘子中的维生素A还能够增强人体在黑暗环境中的视力和治疗夜盲症。橘子不宜食用过量，吃太多会患有胡萝卜素血症，皮肤呈深黄色，如同黄疸一般。若因吃太多橘子造成手掌变黄，只要停吃一段时间，就能让肤色渐渐恢复正常。明代张岱季叔张烨芳对橘子情有独钟，据载其“性好啖橘，橘熟，堆砌床案间，无非橘者，自刊不给，辄命数僮环立剥之”，吃到手脚都呈现黄色。',4),(51,'橘子','goods/8.jpg',10.00,0,'500g',66,'新鲜橘子',65,'橘子中的维生素A还能够增强人体在黑暗环境中的视力和治疗夜盲症。橘子不宜食用过量，吃太多会患有胡萝卜素血症，皮肤呈深黄色，如同黄疸一般。若因吃太多橘子造成手掌变黄，只要停吃一段时间，就能让肤色渐渐恢复正常。明代张岱季叔张烨芳对橘子情有独钟，据载其“性好啖橘，橘熟，堆砌床案间，无非橘者，自刊不给，辄命数僮环立剥之”，吃到手脚都呈现黄色。',4),(52,'橘子','goods/8.jpg',10.00,0,'500g',66,'新鲜橘子',65,'橘子中的维生素A还能够增强人体在黑暗环境中的视力和治疗夜盲症。橘子不宜食用过量，吃太多会患有胡萝卜素血症，皮肤呈深黄色，如同黄疸一般。若因吃太多橘子造成手掌变黄，只要停吃一段时间，就能让肤色渐渐恢复正常。明代张岱季叔张烨芳对橘子情有独钟，据载其“性好啖橘，橘熟，堆砌床案间，无非橘者，自刊不给，辄命数僮环立剥之”，吃到手脚都呈现黄色。',4),(53,'橘子','goods/8.jpg',10.00,0,'500g',66,'新鲜橘子',65,'橘子中的维生素A还能够增强人体在黑暗环境中的视力和治疗夜盲症。橘子不宜食用过量，吃太多会患有胡萝卜素血症，皮肤呈深黄色，如同黄疸一般。若因吃太多橘子造成手掌变黄，只要停吃一段时间，就能让肤色渐渐恢复正常。明代张岱季叔张烨芳对橘子情有独钟，据载其“性好啖橘，橘熟，堆砌床案间，无非橘者，自刊不给，辄命数僮环立剥之”，吃到手脚都呈现黄色。',4);
/*!40000 ALTER TABLE `goods_goodsinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_typeinfo`
--

DROP TABLE IF EXISTS `goods_typeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_typeinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ttitle` varchar(20) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_typeinfo`
--

LOCK TABLES `goods_typeinfo` WRITE;
/*!40000 ALTER TABLE `goods_typeinfo` DISABLE KEYS */;
INSERT INTO `goods_typeinfo` VALUES (1,'新鲜水果',0),(2,'海鲜水产',0),(3,'猪牛羊肉',0),(4,'禽类蛋品',0),(5,'新鲜蔬菜',0),(6,'速冻食品',0);
/*!40000 ALTER TABLE `goods_typeinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderdtailinfo`
--

DROP TABLE IF EXISTS `order_orderdtailinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orderdtailinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(6,2) NOT NULL,
  `subtotal` decimal(6,2) NOT NULL,
  `count` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderdtail_goods_id_2732b2acbb126f18_fk_goods_goodsinfo_id` (`goods_id`),
  KEY `order_orderdtai_order_id_3976f7595a81d40e_fk_order_orderinfo_oid` (`order_id`),
  CONSTRAINT `order_orderdtai_order_id_3976f7595a81d40e_fk_order_orderinfo_oid` FOREIGN KEY (`order_id`) REFERENCES `order_orderinfo` (`oid`),
  CONSTRAINT `order_orderdtail_goods_id_2732b2acbb126f18_fk_goods_goodsinfo_id` FOREIGN KEY (`goods_id`) REFERENCES `goods_goodsinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderdtailinfo`
--

LOCK TABLES `order_orderdtailinfo` WRITE;
/*!40000 ALTER TABLE `order_orderdtailinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_orderdtailinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderinfo`
--

DROP TABLE IF EXISTS `order_orderinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orderinfo` (
  `oid` varchar(20) NOT NULL,
  `odate` datetime(6) NOT NULL,
  `oIspay` tinyint(1) NOT NULL,
  `ototal` decimal(6,2) NOT NULL,
  `oaddress` varchar(150) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `order_orderin_user_id_3b057c6bce0222e9_fk_user_userinfo_id` (`user_id`),
  CONSTRAINT `order_orderin_user_id_3b057c6bce0222e9_fk_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderinfo`
--

LOCK TABLES `order_orderinfo` WRITE;
/*!40000 ALTER TABLE `order_orderinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_orderinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userinfo`
--

DROP TABLE IF EXISTS `user_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `upwd` varchar(40) NOT NULL,
  `umail` varchar(30) NOT NULL,
  `uaddr` varchar(20) NOT NULL,
  `uzip_code` varchar(6) NOT NULL,
  `uphone` varchar(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userinfo`
--

LOCK TABLES `user_userinfo` WRITE;
/*!40000 ALTER TABLE `user_userinfo` DISABLE KEYS */;
INSERT INTO `user_userinfo` VALUES (1,'20145499','513a6f2249b142d77a5bddb1df56daab6b99aa0e','20145499@qq.com','天津 西青区 天津理工大学','300300','1374567891','何谦');
/*!40000 ALTER TABLE `user_userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-04 21:30:47
