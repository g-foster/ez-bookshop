-- MySQL dump 10.16  Distrib 10.1.21-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.21-MariaDB

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
-- Table structure for table `ezapprove_items`
--

DROP TABLE IF EXISTS `ezapprove_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezapprove_items` (
  `collaboration_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_process_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezapprove_items`
--

LOCK TABLES `ezapprove_items` WRITE;
/*!40000 ALTER TABLE `ezapprove_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezapprove_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezbasket`
--

DROP TABLE IF EXISTS `ezbasket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezbasket` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `productcollection_id` int(11) NOT NULL DEFAULT '0',
  `session_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ezbasket_session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezbasket`
--

LOCK TABLES `ezbasket` WRITE;
/*!40000 ALTER TABLE `ezbasket` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezbasket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezbinaryfile`
--

DROP TABLE IF EXISTS `ezbinaryfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezbinaryfile` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT '0',
  `download_count` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `mime_type` varchar(255) NOT NULL DEFAULT '',
  `original_filename` varchar(255) NOT NULL DEFAULT '',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contentobject_attribute_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezbinaryfile`
--

LOCK TABLES `ezbinaryfile` WRITE;
/*!40000 ALTER TABLE `ezbinaryfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezbinaryfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state`
--

DROP TABLE IF EXISTS `ezcobj_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state` (
  `default_language_id` bigint(20) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(45) NOT NULL DEFAULT '',
  `language_mask` bigint(20) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezcobj_state_identifier` (`group_id`,`identifier`),
  KEY `ezcobj_state_lmask` (`language_mask`),
  KEY `ezcobj_state_priority` (`priority`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state`
--

LOCK TABLES `ezcobj_state` WRITE;
/*!40000 ALTER TABLE `ezcobj_state` DISABLE KEYS */;
INSERT INTO `ezcobj_state` VALUES (2,2,1,'not_locked',3,0),(2,2,2,'locked',3,1);
/*!40000 ALTER TABLE `ezcobj_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state_group`
--

DROP TABLE IF EXISTS `ezcobj_state_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state_group` (
  `default_language_id` bigint(20) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(45) NOT NULL DEFAULT '',
  `language_mask` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezcobj_state_group_identifier` (`identifier`),
  KEY `ezcobj_state_group_lmask` (`language_mask`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state_group`
--

LOCK TABLES `ezcobj_state_group` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_group` DISABLE KEYS */;
INSERT INTO `ezcobj_state_group` VALUES (2,2,'ez_lock',3);
/*!40000 ALTER TABLE `ezcobj_state_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state_group_language`
--

DROP TABLE IF EXISTS `ezcobj_state_group_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state_group_language` (
  `contentobject_state_group_id` int(11) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `language_id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL DEFAULT '',
  `real_language_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contentobject_state_group_id`,`real_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state_group_language`
--

LOCK TABLES `ezcobj_state_group_language` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_group_language` DISABLE KEYS */;
INSERT INTO `ezcobj_state_group_language` VALUES (2,'',3,'Lock',2);
/*!40000 ALTER TABLE `ezcobj_state_group_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state_language`
--

DROP TABLE IF EXISTS `ezcobj_state_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state_language` (
  `contentobject_state_id` int(11) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `language_id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`contentobject_state_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state_language`
--

LOCK TABLES `ezcobj_state_language` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_language` DISABLE KEYS */;
INSERT INTO `ezcobj_state_language` VALUES (1,'',3,'Not locked'),(2,'',3,'Locked');
/*!40000 ALTER TABLE `ezcobj_state_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcobj_state_link`
--

DROP TABLE IF EXISTS `ezcobj_state_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcobj_state_link` (
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_state_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`contentobject_id`,`contentobject_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcobj_state_link`
--

LOCK TABLES `ezcobj_state_link` WRITE;
/*!40000 ALTER TABLE `ezcobj_state_link` DISABLE KEYS */;
INSERT INTO `ezcobj_state_link` VALUES (1,1),(4,1),(10,1),(11,1),(12,1),(13,1),(14,1),(41,1),(42,1),(45,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1);
/*!40000 ALTER TABLE `ezcobj_state_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcollab_group`
--

DROP TABLE IF EXISTS `ezcollab_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcollab_group` (
  `created` int(11) NOT NULL DEFAULT '0',
  `depth` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_open` int(11) NOT NULL DEFAULT '1',
  `modified` int(11) NOT NULL DEFAULT '0',
  `parent_group_id` int(11) NOT NULL DEFAULT '0',
  `path_string` varchar(255) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezcollab_group_depth` (`depth`),
  KEY `ezcollab_group_path` (`path_string`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcollab_group`
--

LOCK TABLES `ezcollab_group` WRITE;
/*!40000 ALTER TABLE `ezcollab_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcollab_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcollab_item`
--

DROP TABLE IF EXISTS `ezcollab_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcollab_item` (
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `data_float1` float NOT NULL DEFAULT '0',
  `data_float2` float NOT NULL DEFAULT '0',
  `data_float3` float NOT NULL DEFAULT '0',
  `data_int1` int(11) NOT NULL DEFAULT '0',
  `data_int2` int(11) NOT NULL DEFAULT '0',
  `data_int3` int(11) NOT NULL DEFAULT '0',
  `data_text1` longtext NOT NULL,
  `data_text2` longtext NOT NULL,
  `data_text3` longtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `type_identifier` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcollab_item`
--

LOCK TABLES `ezcollab_item` WRITE;
/*!40000 ALTER TABLE `ezcollab_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcollab_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcollab_item_group_link`
--

DROP TABLE IF EXISTS `ezcollab_item_group_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcollab_item_group_link` (
  `collaboration_id` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `is_read` int(11) NOT NULL DEFAULT '0',
  `last_read` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`collaboration_id`,`group_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcollab_item_group_link`
--

LOCK TABLES `ezcollab_item_group_link` WRITE;
/*!40000 ALTER TABLE `ezcollab_item_group_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcollab_item_group_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcollab_item_message_link`
--

DROP TABLE IF EXISTS `ezcollab_item_message_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcollab_item_message_link` (
  `collaboration_id` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL DEFAULT '0',
  `message_type` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `participant_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcollab_item_message_link`
--

LOCK TABLES `ezcollab_item_message_link` WRITE;
/*!40000 ALTER TABLE `ezcollab_item_message_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcollab_item_message_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcollab_item_participant_link`
--

DROP TABLE IF EXISTS `ezcollab_item_participant_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcollab_item_participant_link` (
  `collaboration_id` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `is_read` int(11) NOT NULL DEFAULT '0',
  `last_read` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `participant_id` int(11) NOT NULL DEFAULT '0',
  `participant_role` int(11) NOT NULL DEFAULT '1',
  `participant_type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`collaboration_id`,`participant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcollab_item_participant_link`
--

LOCK TABLES `ezcollab_item_participant_link` WRITE;
/*!40000 ALTER TABLE `ezcollab_item_participant_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcollab_item_participant_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcollab_item_status`
--

DROP TABLE IF EXISTS `ezcollab_item_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcollab_item_status` (
  `collaboration_id` int(11) NOT NULL DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `is_read` int(11) NOT NULL DEFAULT '0',
  `last_read` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`collaboration_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcollab_item_status`
--

LOCK TABLES `ezcollab_item_status` WRITE;
/*!40000 ALTER TABLE `ezcollab_item_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcollab_item_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcollab_notification_rule`
--

DROP TABLE IF EXISTS `ezcollab_notification_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcollab_notification_rule` (
  `collab_identifier` varchar(255) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcollab_notification_rule`
--

LOCK TABLES `ezcollab_notification_rule` WRITE;
/*!40000 ALTER TABLE `ezcollab_notification_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcollab_notification_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcollab_profile`
--

DROP TABLE IF EXISTS `ezcollab_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcollab_profile` (
  `created` int(11) NOT NULL DEFAULT '0',
  `data_text1` longtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main_group` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcollab_profile`
--

LOCK TABLES `ezcollab_profile` WRITE;
/*!40000 ALTER TABLE `ezcollab_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcollab_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcollab_simple_message`
--

DROP TABLE IF EXISTS `ezcollab_simple_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcollab_simple_message` (
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `data_float1` float NOT NULL DEFAULT '0',
  `data_float2` float NOT NULL DEFAULT '0',
  `data_float3` float NOT NULL DEFAULT '0',
  `data_int1` int(11) NOT NULL DEFAULT '0',
  `data_int2` int(11) NOT NULL DEFAULT '0',
  `data_int3` int(11) NOT NULL DEFAULT '0',
  `data_text1` longtext NOT NULL,
  `data_text2` longtext NOT NULL,
  `data_text3` longtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_type` varchar(40) NOT NULL DEFAULT '',
  `modified` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcollab_simple_message`
--

LOCK TABLES `ezcollab_simple_message` WRITE;
/*!40000 ALTER TABLE `ezcollab_simple_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcollab_simple_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcomment`
--

DROP TABLE IF EXISTS `ezcomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` bigint(20) NOT NULL,
  `created` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_key` varchar(32) DEFAULT NULL,
  `ip` varchar(100) NOT NULL,
  `contentobject_id` int(11) NOT NULL,
  `parent_comment_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `email` varchar(75) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `text` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_session_key_ip` (`user_id`,`session_key`,`ip`),
  KEY `content_parentcomment` (`contentobject_id`,`language_id`,`parent_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcomment`
--

LOCK TABLES `ezcomment` WRITE;
/*!40000 ALTER TABLE `ezcomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcomment_notification`
--

DROP TABLE IF EXISTS `ezcomment_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcomment_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contentobject_id` int(11) NOT NULL,
  `language_id` bigint(20) NOT NULL,
  `send_time` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `comment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcomment_notification`
--

LOCK TABLES `ezcomment_notification` WRITE;
/*!40000 ALTER TABLE `ezcomment_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcomment_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcomment_subscriber`
--

DROP TABLE IF EXISTS `ezcomment_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcomment_subscriber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `hash_string` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcomment_subscriber`
--

LOCK TABLES `ezcomment_subscriber` WRITE;
/*!40000 ALTER TABLE `ezcomment_subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcomment_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcomment_subscription`
--

DROP TABLE IF EXISTS `ezcomment_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcomment_subscription` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `subscriber_id` int(11) NOT NULL,
  `subscription_type` varchar(30) NOT NULL,
  `content_id` int(11) NOT NULL,
  `language_id` bigint(20) NOT NULL DEFAULT '0',
  `subscription_time` int(11) NOT NULL,
  `enabled` int(11) NOT NULL DEFAULT '1',
  `hash_string` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcomment_subscription`
--

LOCK TABLES `ezcomment_subscription` WRITE;
/*!40000 ALTER TABLE `ezcomment_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcomment_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontent_language`
--

DROP TABLE IF EXISTS `ezcontent_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontent_language` (
  `disabled` int(11) NOT NULL DEFAULT '0',
  `id` bigint(20) NOT NULL DEFAULT '0',
  `locale` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ezcontent_language_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontent_language`
--

LOCK TABLES `ezcontent_language` WRITE;
/*!40000 ALTER TABLE `ezcontent_language` DISABLE KEYS */;
INSERT INTO `ezcontent_language` VALUES (0,2,'eng-GB','English (United Kingdom)');
/*!40000 ALTER TABLE `ezcontent_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentbrowsebookmark`
--

DROP TABLE IF EXISTS `ezcontentbrowsebookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentbrowsebookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `node_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezcontentbrowsebookmark_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentbrowsebookmark`
--

LOCK TABLES `ezcontentbrowsebookmark` WRITE;
/*!40000 ALTER TABLE `ezcontentbrowsebookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcontentbrowsebookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentbrowserecent`
--

DROP TABLE IF EXISTS `ezcontentbrowserecent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentbrowserecent` (
  `created` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `node_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezcontentbrowserecent_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentbrowserecent`
--

LOCK TABLES `ezcontentbrowserecent` WRITE;
/*!40000 ALTER TABLE `ezcontentbrowserecent` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcontentbrowserecent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass`
--

DROP TABLE IF EXISTS `ezcontentclass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass` (
  `always_available` int(11) NOT NULL DEFAULT '0',
  `contentobject_name` varchar(255) DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `initial_language_id` bigint(20) NOT NULL DEFAULT '0',
  `is_container` int(11) NOT NULL DEFAULT '0',
  `language_mask` bigint(20) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `modifier_id` int(11) NOT NULL DEFAULT '0',
  `remote_id` varchar(100) NOT NULL DEFAULT '',
  `serialized_description_list` longtext,
  `serialized_name_list` longtext,
  `sort_field` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '1',
  `url_alias_name` varchar(255) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`version`),
  KEY `ezcontentclass_version` (`version`),
  KEY `ezcontentclass_identifier` (`identifier`,`version`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass`
--

LOCK TABLES `ezcontentclass` WRITE;
/*!40000 ALTER TABLE `ezcontentclass` DISABLE KEYS */;
INSERT INTO `ezcontentclass` VALUES (1,'<short_name|name>',1024392098,14,1,'folder',2,1,2,1448831672,14,'a3d405b81be900468eb153d774f4f0d2','b:0;','a:1:{s:6:\"eng-GB\";s:6:\"Folder\";}',1,1,NULL,0),(0,'<short_title|title>',1024392098,14,2,'article',2,1,3,1082454989,14,'c15b600eb9198b1924063b5a68758232',NULL,'a:2:{s:6:\"eng-GB\";s:7:\"Article\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL,0),(1,'<name>',1024392098,14,3,'user_group',2,1,3,1048494743,14,'25b4268cdcd01921b808a0d854b877ef',NULL,'a:2:{s:6:\"eng-GB\";s:10:\"User group\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL,0),(1,'<first_name> <last_name>',1024392098,14,4,'user',2,0,3,1082018364,14,'40faa822edc579b02c25f6bb7beec3ad',NULL,'a:2:{s:6:\"eng-GB\";s:4:\"User\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL,0),(1,'<name>',1031484992,8,5,'image',2,0,3,1048494784,14,'f6df12aa74e36230eb675f364fccd25a',NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL,0),(1,'<name>',1052385472,14,12,'file',2,0,3,1052385669,14,'637d58bfddf164627bdfd265733280a0',NULL,'a:2:{s:6:\"eng-GB\";s:4:\"File\";s:16:\"always-available\";s:6:\"eng-GB\";}',1,1,NULL,0),(1,'<title>',1493039989,14,13,'product',2,0,2,1493040884,14,'63e44e7b8ae410c18164fdeb5efb3351','a:0:{}','a:1:{s:6:\"eng-GB\";s:7:\"Product\";}',2,0,'',0);
/*!40000 ALTER TABLE `ezcontentclass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass_attribute`
--

DROP TABLE IF EXISTS `ezcontentclass_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass_attribute` (
  `can_translate` int(11) DEFAULT '1',
  `category` varchar(25) NOT NULL DEFAULT '',
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `data_float1` double DEFAULT NULL,
  `data_float2` double DEFAULT NULL,
  `data_float3` double DEFAULT NULL,
  `data_float4` double DEFAULT NULL,
  `data_int1` int(11) DEFAULT NULL,
  `data_int2` int(11) DEFAULT NULL,
  `data_int3` int(11) DEFAULT NULL,
  `data_int4` int(11) DEFAULT NULL,
  `data_text1` varchar(50) DEFAULT NULL,
  `data_text2` varchar(50) DEFAULT NULL,
  `data_text3` varchar(50) DEFAULT NULL,
  `data_text4` varchar(255) DEFAULT NULL,
  `data_text5` longtext,
  `data_type_string` varchar(50) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `is_information_collector` int(11) NOT NULL DEFAULT '0',
  `is_required` int(11) NOT NULL DEFAULT '0',
  `is_searchable` int(11) NOT NULL DEFAULT '0',
  `placement` int(11) NOT NULL DEFAULT '0',
  `serialized_data_text` longtext,
  `serialized_description_list` longtext,
  `serialized_name_list` longtext NOT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`version`),
  KEY `ezcontentclass_attr_ccid` (`contentclass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass_attribute`
--

LOCK TABLES `ezcontentclass_attribute` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_attribute` DISABLE KEYS */;
INSERT INTO `ezcontentclass_attribute` VALUES (1,'',2,0,0,0,0,255,0,0,0,'New article','','','','','ezstring',1,'title',0,1,1,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Title\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(1,'',1,NULL,NULL,NULL,NULL,255,0,NULL,NULL,'Folder',NULL,NULL,NULL,NULL,'ezstring',4,'name',0,1,1,1,'N;','b:0;','a:1:{s:6:\"eng-GB\";s:4:\"Name\";}',0),(1,'',3,0,0,0,0,255,0,0,0,'','','','',NULL,'ezstring',6,'name',0,1,1,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Name\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(1,'',3,0,0,0,0,255,0,0,0,'','','','',NULL,'ezstring',7,'description',0,0,1,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:11:\"Description\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(1,'',4,0,0,0,0,255,0,0,0,'','','','','','ezstring',8,'first_name',0,1,1,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:10:\"First name\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(1,'',4,0,0,0,0,255,0,0,0,'','','','','','ezstring',9,'last_name',0,1,1,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:9:\"Last name\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(0,'',4,0,0,0,0,0,0,0,0,'','','','','','ezuser',12,'user_account',0,1,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:12:\"User account\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(1,'',5,0,0,0,0,150,0,0,0,'','','','',NULL,'ezstring',116,'name',0,1,1,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Name\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(1,'',5,0,0,0,0,10,0,0,0,'','','','',NULL,'ezrichtext',117,'caption',0,0,1,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:7:\"Caption\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(1,'',5,0,0,0,0,10,0,0,0,'','','','',NULL,'ezimage',118,'image',0,0,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(1,'',1,NULL,NULL,NULL,NULL,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext',119,'short_description',0,0,1,3,'N;','b:0;','a:1:{s:6:\"eng-GB\";s:17:\"Short description\";}',0),(1,'',2,0,0,0,0,10,0,0,0,'','','','','','ezrichtext',120,'intro',0,1,1,4,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Intro\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(1,'',2,0,0,0,0,20,0,0,0,'','','','','','ezrichtext',121,'body',0,0,1,5,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Body\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(0,'',2,0,0,0,0,0,0,0,0,'','','','','','ezboolean',123,'enable_comments',0,0,0,6,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:15:\"Enable comments\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(1,'',12,0,0,0,0,0,0,0,0,'New file','','','',NULL,'ezstring',146,'name',0,1,1,1,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"Name\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(1,'',12,0,0,0,0,10,0,0,0,'','','','',NULL,'ezrichtext',147,'description',0,0,1,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:11:\"Description\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(1,'',12,0,0,0,0,0,0,0,0,'','','','',NULL,'ezbinaryfile',148,'file',0,1,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:4:\"File\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(1,'',2,0,0,0,0,255,0,0,0,'','','','','','ezstring',152,'short_title',0,0,1,2,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:11:\"Short title\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(1,'',2,0,0,0,0,0,0,0,0,'','','','','','ezauthor',153,'author',0,0,0,3,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:6:\"Author\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(1,'',2,0,0,0,0,0,0,0,0,'','','','','','ezobjectrelation',154,'image',0,0,1,7,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(1,'',1,NULL,NULL,NULL,NULL,100,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring',155,'short_name',0,0,1,2,'N;','b:0;','a:1:{s:6:\"eng-GB\";s:10:\"Short name\";}',0),(1,'',1,NULL,NULL,NULL,NULL,20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezrichtext',156,'description',0,0,1,4,'N;','b:0;','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}',0),(1,'',4,0,0,0,0,10,0,0,0,'','','','','','eztext',179,'signature',0,0,1,4,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:9:\"Signature\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(1,'',4,0,0,0,0,10,0,0,0,'','','','','','ezimage',180,'image',0,0,0,5,NULL,NULL,'a:2:{s:6:\"eng-GB\";s:5:\"Image\";s:16:\"always-available\";s:6:\"eng-GB\";}',0),(1,'content',13,NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezstring',181,'title',0,1,1,1,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Title\";}',0),(1,'content',13,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezimage',182,'image',0,0,0,2,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Image\";}',0),(1,'content',13,NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'eztext',183,'description',0,0,1,3,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:11:\"Description\";}',0),(1,'content',13,0,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ezfloat',184,'price',0,0,0,4,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:5:\"Price\";}',0),(1,'content',13,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezselection><options><option id=\"1\" name=\"Choose One\"/><option id=\"2\" name=\"Biography\"/><option id=\"3\" name=\"Fiction\"/><option id=\"4\" name=\"Science\"/></options></ezselection>\n','ezselection',187,'category',0,1,1,5,'N;','a:0:{}','a:1:{s:6:\"eng-GB\";s:8:\"Category\";}',0);
/*!40000 ALTER TABLE `ezcontentclass_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass_classgroup`
--

DROP TABLE IF EXISTS `ezcontentclass_classgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass_classgroup` (
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `contentclass_version` int(11) NOT NULL DEFAULT '0',
  `group_id` int(11) NOT NULL DEFAULT '0',
  `group_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`contentclass_id`,`contentclass_version`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass_classgroup`
--

LOCK TABLES `ezcontentclass_classgroup` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_classgroup` DISABLE KEYS */;
INSERT INTO `ezcontentclass_classgroup` VALUES (1,0,1,'Content'),(2,0,1,'Content'),(3,0,2,'Users'),(4,0,2,'Users'),(5,0,3,'Media'),(12,0,3,'Media'),(13,0,1,'Content');
/*!40000 ALTER TABLE `ezcontentclass_classgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclass_name`
--

DROP TABLE IF EXISTS `ezcontentclass_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclass_name` (
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `contentclass_version` int(11) NOT NULL DEFAULT '0',
  `language_id` bigint(20) NOT NULL DEFAULT '0',
  `language_locale` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`contentclass_id`,`contentclass_version`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclass_name`
--

LOCK TABLES `ezcontentclass_name` WRITE;
/*!40000 ALTER TABLE `ezcontentclass_name` DISABLE KEYS */;
INSERT INTO `ezcontentclass_name` VALUES (1,0,2,'eng-GB','Folder'),(2,0,3,'eng-GB','Article'),(3,0,3,'eng-GB','User group'),(4,0,3,'eng-GB','User'),(5,0,3,'eng-GB','Image'),(12,0,3,'eng-GB','File'),(13,0,2,'eng-GB','Product');
/*!40000 ALTER TABLE `ezcontentclass_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentclassgroup`
--

DROP TABLE IF EXISTS `ezcontentclassgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentclassgroup` (
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` int(11) NOT NULL DEFAULT '0',
  `modifier_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentclassgroup`
--

LOCK TABLES `ezcontentclassgroup` WRITE;
/*!40000 ALTER TABLE `ezcontentclassgroup` DISABLE KEYS */;
INSERT INTO `ezcontentclassgroup` VALUES (1031216928,14,1,1033922106,14,'Content'),(1031216941,14,2,1033922113,14,'Users'),(1032009743,14,3,1033922120,14,'Media');
/*!40000 ALTER TABLE `ezcontentclassgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject`
--

DROP TABLE IF EXISTS `ezcontentobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject` (
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `current_version` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `initial_language_id` bigint(20) NOT NULL DEFAULT '0',
  `language_mask` bigint(20) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `published` int(11) NOT NULL DEFAULT '0',
  `remote_id` varchar(100) DEFAULT NULL,
  `section_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezcontentobject_remote_id` (`remote_id`),
  KEY `ezcontentobject_classid` (`contentclass_id`),
  KEY `ezcontentobject_currentversion` (`current_version`),
  KEY `ezcontentobject_lmask` (`language_mask`),
  KEY `ezcontentobject_owner` (`owner_id`),
  KEY `ezcontentobject_pub` (`published`),
  KEY `ezcontentobject_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject`
--

LOCK TABLES `ezcontentobject` WRITE;
/*!40000 ALTER TABLE `ezcontentobject` DISABLE KEYS */;
INSERT INTO `ezcontentobject` VALUES (1,9,1,2,3,1448889046,'eZ Platform',14,1448889046,'9459d3c29e15006e45197295722c7ade',1,1),(3,1,4,2,3,1033917596,'Users',14,1033917596,'f5c88a2209584891056f987fd965b0ba',2,1),(4,2,10,2,3,1072180405,'Anonymous User',14,1033920665,'faaeb9be3bd98ed09f606fc16d144eca',2,1),(3,1,11,2,3,1033920746,'Guest accounts',14,1033920746,'5f7f0bdb3381d6a461d8c29ff53d908f',2,1),(3,1,12,2,3,1033920775,'Administrator users',14,1033920775,'9b47a45624b023b1a76c73b74d704acf',2,1),(3,1,13,2,3,1033920794,'Editors',14,1033920794,'3c160cca19fb135f83bd02d911f04db2',2,1),(4,3,14,2,3,1301062024,'Administrator User',14,1033920830,'1bb4fe25487f05527efa8bfd394cecc7',2,1),(1,1,41,2,3,1060695457,'Media',14,1060695457,'a6e35cbcb7cd6ae4b691f3eee30cd262',3,1),(3,1,42,2,3,1072180330,'Anonymous Users',14,1072180330,'15b256dbea2ae72418ff5facc999e8f9',2,1),(1,1,45,2,3,1079684190,'Setup',14,1079684190,'241d538ce310074e602f29f49e44e938',4,1),(1,1,49,2,3,1080220197,'Images',14,1080220197,'e7ff633c6b8e0fd3531e74c6e712bead',3,1),(1,1,50,2,3,1080220220,'Files',14,1080220220,'732a5acd01b51a6fe6eab448ad4138a9',3,1),(1,1,51,2,3,1080220233,'Multimedia',14,1080220233,'09082deb98662a104f325aaa8c4933d3',3,1),(1,1,52,2,3,1493040495,'products',14,1493040495,'a3d98891bbaae2fb666decb881edf831',1,1),(13,2,53,2,3,1493803795,'Nikola Tesla: Imagination and the Man That Invented the 20th Century',14,1493040781,'5b0e9ec23dab498d073223db315531df',1,1),(13,2,54,2,3,1493803725,'Robin Williams: The Biography',14,1493041272,'30ba9c0a8fc6c9ce49f3507a70c5721f',1,1),(13,2,55,2,3,1493803591,'J.K. Rowling: A Life of Magic',14,1493041511,'c44efc7eede109049c1671b4d2aca6c2',1,1),(13,2,56,2,3,1493803475,'The Letter: The #1 Bestseller that everyone is talking about',14,1493042677,'d98554be64e4a8973a1abea5ee9feae5',1,1),(13,2,57,2,3,1493803334,'The Phantom Tree',14,1493042810,'354057e329a8f7c3af806587def0a98e',1,1),(13,2,58,2,3,1493803025,'The Circle',14,1493042976,'1cdb7eec4cf34565e38fe6bc70b02ebe',1,1),(13,2,59,2,3,1493802924,'The Science Book (Big Ideas)',14,1493043098,'600cbc1ae8f891b0ace68b44c21445ee',1,1),(13,2,60,2,3,1493802807,'Bad Science',14,1493043378,'1847b1d4151849f384b04d4fc309802d',1,1),(13,3,61,2,3,1493802711,'An Astronaut\'s Guide to Life on Earth',14,1493043498,'584b29ce55550f6736efb522baa72a2a',1,1);
/*!40000 ALTER TABLE `ezcontentobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_attribute`
--

DROP TABLE IF EXISTS `ezcontentobject_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_attribute` (
  `attribute_original_id` int(11) DEFAULT '0',
  `contentclassattribute_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `data_float` double DEFAULT NULL,
  `data_int` int(11) DEFAULT NULL,
  `data_text` longtext,
  `data_type_string` varchar(50) DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_code` varchar(20) NOT NULL DEFAULT '',
  `language_id` bigint(20) NOT NULL DEFAULT '0',
  `sort_key_int` int(11) NOT NULL DEFAULT '0',
  `sort_key_string` varchar(255) NOT NULL DEFAULT '',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`version`),
  KEY `ezcontentobject_attribute_co_id_ver_lang_code` (`contentobject_id`,`version`,`language_code`),
  KEY `ezcontentobject_attribute_language_code` (`language_code`),
  KEY `ezcontentobject_classattr_id` (`contentclassattribute_id`),
  KEY `sort_key_int` (`sort_key_int`),
  KEY `sort_key_string` (`sort_key_string`)
) ENGINE=InnoDB AUTO_INCREMENT=230 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_attribute`
--

LOCK TABLES `ezcontentobject_attribute` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_attribute` DISABLE KEYS */;
INSERT INTO `ezcontentobject_attribute` VALUES (0,4,1,NULL,NULL,'Welcome to eZ Platform','ezstring',1,'eng-GB',3,0,'welcome to ez platform',9),(0,119,1,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><para>This is the clean install coming with eZ Platform. It’s a barebone setup of the platform, an excellent foundation to build upon if you want to build from scratch. For more ready to go base designs or demo sites, please check the documentation.</para></section>\n','ezrichtext',2,'eng-GB',3,0,'',9),(0,7,4,NULL,NULL,'Main group','ezstring',7,'eng-GB',3,0,'',1),(0,6,4,NULL,NULL,'Users','ezstring',8,'eng-GB',3,0,'',1),(0,8,10,0,0,'Anonymous','ezstring',19,'eng-GB',3,0,'anonymous',2),(0,9,10,0,0,'User','ezstring',20,'eng-GB',3,0,'user',2),(0,12,10,0,0,'','ezuser',21,'eng-GB',3,0,'',2),(0,6,11,0,0,'Guest accounts','ezstring',22,'eng-GB',3,0,'',1),(0,7,11,0,0,'','ezstring',23,'eng-GB',3,0,'',1),(0,6,12,0,0,'Administrator users','ezstring',24,'eng-GB',3,0,'',1),(0,7,12,0,0,'','ezstring',25,'eng-GB',3,0,'',1),(0,6,13,0,0,'Editors','ezstring',26,'eng-GB',3,0,'',1),(0,7,13,0,0,'','ezstring',27,'eng-GB',3,0,'',1),(0,8,14,0,0,'Administrator','ezstring',28,'eng-GB',3,0,'administrator',3),(0,9,14,0,0,'User','ezstring',29,'eng-GB',3,0,'user',3),(30,12,14,0,0,'','ezuser',30,'eng-GB',3,0,'',3),(0,4,41,0,0,'Media','ezstring',98,'eng-GB',3,0,'',1),(0,119,41,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',99,'eng-GB',3,0,'',1),(0,6,42,0,0,'Anonymous Users','ezstring',100,'eng-GB',3,0,'anonymous users',1),(0,7,42,0,0,'User group for the anonymous user','ezstring',101,'eng-GB',3,0,'user group for the anonymous user',1),(0,155,1,NULL,NULL,'eZ Platform','ezstring',102,'eng-GB',3,0,'ez platform',9),(0,155,41,0,0,'','ezstring',103,'eng-GB',3,0,'',1),(0,156,1,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"><title ezxhtml:level=\"2\">Welcome to eZ Platform</title><para>Congratulations, you just installed eZ Platform. eZ Platform is the new generation Content Management Platform from eZ Systems and the eZ Community replacing eZ Publish, our previous software.</para><title ezxhtml:level=\"3\">Need some guidance?</title><para>Check out the following resources:</para><title ezxhtml:level=\"4\"><link xlink:href=\"ezurl://23\" xlink:show=\"none\">User Manual</link> for eZ Platform (and eZ Studio)</title><title ezxhtml:level=\"4\"><link xlink:href=\"ezurl://24\" xlink:show=\"none\">Technical doc</link> for eZ Platform (and eZ Publish Platform new stack)</title><title ezxhtml:level=\"4\"><link xlink:href=\"ezurl://25\" xlink:show=\"none\">eZ Platform</link> developer tutorial</title><title ezxhtml:level=\"4\"><link xlink:href=\"ezurl://26\" xlink:show=\"none\">Comparison guide</link> between eZ Platform and eZ Publish Platform</title><title ezxhtml:level=\"3\">Contribute to the project?</title><para>Join the community:</para><title ezxhtml:level=\"4\"><link xlink:href=\"ezurl://27\" xlink:show=\"none\">Github repositories</link> open to the public</title><title ezxhtml:level=\"4\">Register to the community on <link xlink:href=\"ezurl://28\" xlink:show=\"none\">share.ez.no</link>, the community site, to access forums, tutorials and blogs</title><title ezxhtml:level=\"4\">Join the conversation on <link xlink:href=\"ezurl://29\" xlink:show=\"none\">the eZ Community Slack</link></title><para>Good luck!</para></section>\n','ezrichtext',104,'eng-GB',3,0,'',9),(0,156,41,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',105,'eng-GB',3,0,'',1),(0,4,45,0,0,'Setup','ezstring',123,'eng-GB',3,0,'setup',1),(0,155,45,0,0,'','ezstring',124,'eng-GB',3,0,'',1),(0,119,45,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',125,'eng-GB',3,0,'',1),(0,156,45,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',126,'eng-GB',3,0,'',1),(0,4,49,0,0,'Images','ezstring',142,'eng-GB',3,0,'images',1),(0,155,49,0,0,'','ezstring',143,'eng-GB',3,0,'',1),(0,119,49,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',144,'eng-GB',3,0,'',1),(0,156,49,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',145,'eng-GB',3,0,'',1),(0,4,50,0,0,'Files','ezstring',147,'eng-GB',3,0,'files',1),(0,155,50,0,0,'','ezstring',148,'eng-GB',3,0,'',1),(0,119,50,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',149,'eng-GB',3,0,'',1),(0,156,50,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',150,'eng-GB',3,0,'',1),(0,4,51,0,0,'Multimedia','ezstring',152,'eng-GB',3,0,'multimedia',1),(0,155,51,0,0,'','ezstring',153,'eng-GB',3,0,'',1),(0,119,51,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',154,'eng-GB',3,0,'',1),(0,156,51,0,1045487555,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" xmlns:ezxhtml=\"http://ez.no/xmlns/ezpublish/docbook/xhtml\" xmlns:ezcustom=\"http://ez.no/xmlns/ezpublish/docbook/custom\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',155,'eng-GB',3,0,'',1),(0,179,10,0,0,'','eztext',177,'eng-GB',3,0,'',2),(0,179,14,0,0,'','eztext',178,'eng-GB',3,0,'',3),(0,180,10,0,0,'','ezimage',179,'eng-GB',3,0,'',2),(0,180,14,0,0,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"\" filename=\"\" suffix=\"\" basename=\"\" dirpath=\"\" url=\"\" original_filename=\"\" mime_type=\"\" width=\"\" height=\"\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1301057722\"><original attribute_id=\"180\" attribute_version=\"3\" attribute_language=\"eng-GB\"/></ezimage>\n','ezimage',180,'eng-GB',3,0,'',3),(0,4,52,NULL,NULL,'Products','ezstring',181,'eng-GB',3,0,'products',1),(0,155,52,NULL,NULL,'products','ezstring',182,'eng-GB',3,0,'products',1),(0,119,52,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',183,'eng-GB',3,0,'',1),(0,156,52,NULL,NULL,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<section xmlns=\"http://docbook.org/ns/docbook\" xmlns:xlink=\"http://www.w3.org/1999/xlink\" version=\"5.0-variant ezpublish-1.0\"/>\n','ezrichtext',184,'eng-GB',3,0,'',1),(0,181,53,NULL,NULL,'Nikola Tesla: Imagination and the Man That Invented the 20th Century','ezstring',185,'eng-GB',3,0,'nikola tesla: imagination and the man that invented the 20th century',1),(0,181,53,NULL,NULL,'Nikola Tesla: Imagination and the Man That Invented the 20th Century','ezstring',185,'eng-GB',3,0,'nikola tesla: imagination and the man that invented the 20th century',2),(0,182,53,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"tesla.jpg\"\n    suffix=\"jpg\" basename=\"tesla\" dirpath=\"var/site/storage/images/6/8/1/0/186-1-eng-GB\" url=\"var/site/storage/images/6/8/1/0/186-1-eng-GB/tesla.jpg\"\n    original_filename=\"tesla.jpg\" mime_type=\"image/jpeg\" width=\"218\"\n    height=\"218\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493040779\">\n  <original attribute_id=\"186\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"218\" Width=\"218\" IsColor=\"1\"/>\n</ezimage>','ezimage',186,'eng-GB',3,0,'',1),(0,182,53,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"nikola.jpg\"\n    suffix=\"jpg\" basename=\"nikola\" dirpath=\"var/site/storage/images/6/8/1/0/186-2-eng-GB\" url=\"var/site/storage/images/6/8/1/0/186-2-eng-GB/nikola.jpg\"\n    original_filename=\"nikola.jpg\" mime_type=\"image/jpeg\" width=\"218\"\n    height=\"218\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493803794\">\n  <original attribute_id=\"186\" attribute_version=\"2\" attribute_language=\"eng-GB\"/>\n  <information Height=\"218\" Width=\"218\" IsColor=\"1\"/>\n</ezimage>','ezimage',186,'eng-GB',3,0,'',2),(0,183,53,NULL,NULL,'If you want to learn about one of history’s most fascinating minds and uncover some of his secrets of imagination—secrets that enabled him to invent machines light years ahead of his time and literally bring light to the world—then you want to read this book.','eztext',187,'eng-GB',3,0,'if you want to learn about one of history’s most fascinating minds and uncover some of his secrets of imagination—secrets that enabled him to invent machines light years ahead of his time and literally bring light to the world—then you want to read this b',1),(0,183,53,NULL,NULL,'If you want to learn about one of history’s most fascinating minds and uncover some of his secrets of imagination—secrets that enabled him to invent machines light years ahead of his time and literally bring light to the world—then you want to read this book.','eztext',187,'eng-GB',3,0,'if you want to learn about one of history’s most fascinating minds and uncover some of his secrets of imagination—secrets that enabled him to invent machines light years ahead of his time and literally bring light to the world—then you want to read this b',2),(0,184,53,10.99,NULL,NULL,'ezfloat',188,'eng-GB',3,0,'',1),(0,184,53,10.99,NULL,NULL,'ezfloat',188,'eng-GB',3,0,'',2),(0,187,53,NULL,NULL,'1','ezselection',189,'eng-GB',3,0,'1',1),(0,187,53,NULL,NULL,'1','ezselection',189,'eng-GB',3,0,'1',2),(0,181,54,NULL,NULL,'Robin Williams: The Biography','ezstring',190,'eng-GB',3,0,'robin williams: the biography',1),(0,181,54,NULL,NULL,'Robin Williams: The Biography','ezstring',190,'eng-GB',3,0,'robin williams: the biography',2),(0,182,54,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"robin.jpg\"\n    suffix=\"jpg\" basename=\"robin\" dirpath=\"var/site/storage/images/1/9/1/0/191-1-eng-GB\" url=\"var/site/storage/images/1/9/1/0/191-1-eng-GB/robin.jpg\"\n    original_filename=\"robin.jpg\" mime_type=\"image/jpeg\" width=\"218\"\n    height=\"218\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493041270\">\n  <original attribute_id=\"191\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"218\" Width=\"218\" IsColor=\"1\"/>\n</ezimage>','ezimage',191,'eng-GB',3,0,'',1),(0,182,54,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"robin.jpg\"\n    suffix=\"jpg\" basename=\"robin\" dirpath=\"var/site/storage/images/1/9/1/0/191-2-eng-GB\" url=\"var/site/storage/images/1/9/1/0/191-2-eng-GB/robin.jpg\"\n    original_filename=\"robin.jpg\" mime_type=\"image/jpeg\" width=\"218\"\n    height=\"218\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493803725\">\n  <original attribute_id=\"191\" attribute_version=\"2\" attribute_language=\"eng-GB\"/>\n  <information Height=\"218\" Width=\"218\" IsColor=\"1\"/>\n</ezimage>','ezimage',191,'eng-GB',3,0,'',2),(0,183,54,NULL,NULL,'This book delves into the creative genius of Robin Williams. It will give you insight into what sort of a background contributed to his meteoric success. Fascinating details are revealed about the larger than life experiences that Robin had in his journey through this world. ','eztext',192,'eng-GB',3,0,'this book delves into the creative genius of robin williams. it will give you insight into what sort of a background contributed to his meteoric success. fascinating details are revealed about the larger than life experiences that robin had in his journey',1),(0,183,54,NULL,NULL,'This book delves into the creative genius of Robin Williams. It will give you insight into what sort of a background contributed to his meteoric success. Fascinating details are revealed about the larger than life experiences that Robin had in his journey through this world. ','eztext',192,'eng-GB',3,0,'this book delves into the creative genius of robin williams. it will give you insight into what sort of a background contributed to his meteoric success. fascinating details are revealed about the larger than life experiences that robin had in his journey',2),(0,184,54,3.99,NULL,NULL,'ezfloat',193,'eng-GB',3,0,'',1),(0,184,54,3.99,NULL,NULL,'ezfloat',193,'eng-GB',3,0,'',2),(0,187,54,NULL,NULL,'1','ezselection',194,'eng-GB',3,0,'1',1),(0,187,54,NULL,NULL,'1','ezselection',194,'eng-GB',3,0,'1',2),(0,181,55,NULL,NULL,'J.K. Rowling: A Life of Magic','ezstring',195,'eng-GB',3,0,'j.k. rowling: a life of magic',1),(0,181,55,NULL,NULL,'J.K. Rowling: A Life of Magic','ezstring',195,'eng-GB',3,0,'j.k. rowling: a life of magic',2),(0,182,55,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"rowling.jpg\"\n    suffix=\"jpg\" basename=\"rowling\" dirpath=\"var/site/storage/images/6/9/1/0/196-1-eng-GB\" url=\"var/site/storage/images/6/9/1/0/196-1-eng-GB/rowling.jpg\"\n    original_filename=\"rowling.jpg\" mime_type=\"image/jpeg\" width=\"218\"\n    height=\"218\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493041510\">\n  <original attribute_id=\"196\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"218\" Width=\"218\" IsColor=\"1\"/>\n</ezimage>','ezimage',196,'eng-GB',3,0,'',1),(0,182,55,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"rowling.jpg\"\n    suffix=\"jpg\" basename=\"rowling\" dirpath=\"var/site/storage/images/6/9/1/0/196-2-eng-GB\" url=\"var/site/storage/images/6/9/1/0/196-2-eng-GB/rowling.jpg\"\n    original_filename=\"rowling.jpg\" mime_type=\"image/jpeg\" width=\"218\"\n    height=\"218\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493803590\">\n  <original attribute_id=\"196\" attribute_version=\"2\" attribute_language=\"eng-GB\"/>\n  <information Height=\"218\" Width=\"218\" IsColor=\"1\"/>\n</ezimage>','ezimage',196,'eng-GB',3,0,'',2),(0,183,55,NULL,NULL,'What a brilliant book. It is not extremely long, but goes through Rowling\'s life nicely, with all the ups and down from an early ages. I personally don\'t like really long biographies, as I feel I don\'t really want to know everything about a certain famous person. This book is just what I like - it is personal though and changes from person to person, so someone may find the book too short or not enough detail... ','eztext',197,'eng-GB',3,0,'what a brilliant book. it is not extremely long, but goes through rowling\'s life nicely, with all the ups and down from an early ages. i personally don\'t like really long biographies, as i feel i don\'t really want to know everything about a certain famous',1),(0,183,55,NULL,NULL,'What a brilliant book. It is not extremely long, but goes through Rowling\'s life nicely, with all the ups and down from an early ages. I personally don\'t like really long biographies, as I feel I don\'t really want to know everything about a certain famous person. This book is just what I like - it is personal though and changes from person to person, so someone may find the book too short or not enough detail... ','eztext',197,'eng-GB',3,0,'what a brilliant book. it is not extremely long, but goes through rowling\'s life nicely, with all the ups and down from an early ages. i personally don\'t like really long biographies, as i feel i don\'t really want to know everything about a certain famous',2),(0,184,55,2.99,NULL,NULL,'ezfloat',198,'eng-GB',3,0,'',1),(0,184,55,2.99,NULL,NULL,'ezfloat',198,'eng-GB',3,0,'',2),(0,187,55,NULL,NULL,'1','ezselection',199,'eng-GB',3,0,'1',1),(0,187,55,NULL,NULL,'1','ezselection',199,'eng-GB',3,0,'1',2),(0,181,56,NULL,NULL,'The Letter: The #1 Bestseller that everyone is talking about','ezstring',200,'eng-GB',3,0,'the letter: the #1 bestseller that everyone is talking about',1),(0,181,56,NULL,NULL,'The Letter: The #1 Bestseller that everyone is talking about','ezstring',200,'eng-GB',3,0,'the letter: the #1 bestseller that everyone is talking about',2),(0,182,56,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"letter.jpg\"\n    suffix=\"jpg\" basename=\"letter\" dirpath=\"var/site/storage/images/1/0/2/0/201-1-eng-GB\" url=\"var/site/storage/images/1/0/2/0/201-1-eng-GB/letter.jpg\"\n    original_filename=\"letter.jpg\" mime_type=\"image/jpeg\" width=\"218\"\n    height=\"218\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493042675\">\n  <original attribute_id=\"201\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"218\" Width=\"218\" IsColor=\"1\"/>\n</ezimage>','ezimage',201,'eng-GB',3,0,'',1),(0,182,56,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"letter.jpg\"\n    suffix=\"jpg\" basename=\"letter\" dirpath=\"var/site/storage/images/1/0/2/0/201-2-eng-GB\" url=\"var/site/storage/images/1/0/2/0/201-2-eng-GB/letter.jpg\"\n    original_filename=\"letter.jpg\" mime_type=\"image/jpeg\" width=\"218\"\n    height=\"218\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493803474\">\n  <original attribute_id=\"201\" attribute_version=\"2\" attribute_language=\"eng-GB\"/>\n  <information Height=\"218\" Width=\"218\" IsColor=\"1\"/>\n</ezimage>','ezimage',201,'eng-GB',3,0,'',2),(0,183,56,NULL,NULL,'The #1 EBook Bestseller. Every so often a love story comes along to remind us that sometimes, in our darkest hour, hope shines a candle to light our way. Discover THE LETTER by Kathryn Hughes, the Number One bestseller that has captured thousands of hearts worldwide.','eztext',202,'eng-GB',3,0,'the #1 ebook bestseller. every so often a love story comes along to remind us that sometimes, in our darkest hour, hope shines a candle to light our way. discover the letter by kathryn hughes, the number one bestseller that has captured thousands of heart',1),(0,183,56,NULL,NULL,'The #1 EBook Bestseller. Every so often a love story comes along to remind us that sometimes, in our darkest hour, hope shines a candle to light our way. Discover THE LETTER by Kathryn Hughes, the Number One bestseller that has captured thousands of hearts worldwide.','eztext',202,'eng-GB',3,0,'the #1 ebook bestseller. every so often a love story comes along to remind us that sometimes, in our darkest hour, hope shines a candle to light our way. discover the letter by kathryn hughes, the number one bestseller that has captured thousands of heart',2),(0,184,56,4.99,NULL,NULL,'ezfloat',203,'eng-GB',3,0,'',1),(0,184,56,4.99,NULL,NULL,'ezfloat',203,'eng-GB',3,0,'',2),(0,187,56,NULL,NULL,'2','ezselection',204,'eng-GB',3,0,'2',1),(0,187,56,NULL,NULL,'2','ezselection',204,'eng-GB',3,0,'2',2),(0,181,57,NULL,NULL,'The Phantom Tree','ezstring',205,'eng-GB',3,0,'the phantom tree',1),(0,181,57,NULL,NULL,'The Phantom Tree','ezstring',205,'eng-GB',3,0,'the phantom tree',2),(0,182,57,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"phantom.jpg\"\n    suffix=\"jpg\" basename=\"phantom\" dirpath=\"var/site/storage/images/6/0/2/0/206-1-eng-GB\" url=\"var/site/storage/images/6/0/2/0/206-1-eng-GB/phantom.jpg\"\n    original_filename=\"phantom.jpg\" mime_type=\"image/jpeg\" width=\"218\"\n    height=\"218\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493042809\">\n  <original attribute_id=\"206\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"218\" Width=\"218\" IsColor=\"1\"/>\n</ezimage>','ezimage',206,'eng-GB',3,0,'',1),(0,182,57,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"phantom.jpg\"\n    suffix=\"jpg\" basename=\"phantom\" dirpath=\"var/site/storage/images/6/0/2/0/206-2-eng-GB\" url=\"var/site/storage/images/6/0/2/0/206-2-eng-GB/phantom.jpg\"\n    original_filename=\"phantom.jpg\" mime_type=\"image/jpeg\" width=\"218\"\n    height=\"218\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493803333\">\n  <original attribute_id=\"206\" attribute_version=\"2\" attribute_language=\"eng-GB\"/>\n  <information Height=\"218\" Width=\"218\" IsColor=\"1\"/>\n</ezimage>','ezimage',206,'eng-GB',3,0,'',2),(0,183,57,NULL,NULL,'Browsing antiques shops in Wiltshire, Alison Bannister stumbles across a delicate old portrait – supposedly of Anne Boleyn. Except Alison knows better… The woman is Mary Seymour, the daughter of Katherine Parr who was taken to Wolf Hall in 1557 as an unwanted orphan and presumed dead after going missing as a child.','eztext',207,'eng-GB',3,0,'browsing antiques shops in wiltshire, alison bannister stumbles across a delicate old portrait – supposedly of anne boleyn. except alison knows better… the woman is mary seymour, the daughter of katherine parr who was taken to wolf hall in 1557 as an unwa',1),(0,183,57,NULL,NULL,'Browsing antiques shops in Wiltshire, Alison Bannister stumbles across a delicate old portrait – supposedly of Anne Boleyn. Except Alison knows better… The woman is Mary Seymour, the daughter of Katherine Parr who was taken to Wolf Hall in 1557 as an unwanted orphan and presumed dead after going missing as a child.','eztext',207,'eng-GB',3,0,'browsing antiques shops in wiltshire, alison bannister stumbles across a delicate old portrait – supposedly of anne boleyn. except alison knows better… the woman is mary seymour, the daughter of katherine parr who was taken to wolf hall in 1557 as an unwa',2),(0,184,57,1.99,NULL,NULL,'ezfloat',208,'eng-GB',3,0,'',1),(0,184,57,1.99,NULL,NULL,'ezfloat',208,'eng-GB',3,0,'',2),(0,187,57,NULL,NULL,'2','ezselection',209,'eng-GB',3,0,'2',1),(0,187,57,NULL,NULL,'2','ezselection',209,'eng-GB',3,0,'2',2),(0,181,58,NULL,NULL,'The Circle','ezstring',210,'eng-GB',3,0,'the circle',1),(0,181,58,NULL,NULL,'The Circle','ezstring',210,'eng-GB',3,0,'the circle',2),(0,182,58,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"circle.jpg\"\n    suffix=\"jpg\" basename=\"circle\" dirpath=\"var/site/storage/images/1/1/2/0/211-1-eng-GB\" url=\"var/site/storage/images/1/1/2/0/211-1-eng-GB/circle.jpg\"\n    original_filename=\"circle.jpg\" mime_type=\"image/jpeg\" width=\"218\"\n    height=\"218\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493042975\">\n  <original attribute_id=\"211\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"218\" Width=\"218\" IsColor=\"1\"/>\n</ezimage>','ezimage',211,'eng-GB',3,0,'',1),(0,182,58,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"circle.jpg\"\n    suffix=\"jpg\" basename=\"circle\" dirpath=\"var/site/storage/images/1/1/2/0/211-2-eng-GB\" url=\"var/site/storage/images/1/1/2/0/211-2-eng-GB/circle.jpg\"\n    original_filename=\"circle.jpg\" mime_type=\"image/jpeg\" width=\"218\"\n    height=\"218\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493803024\">\n  <original attribute_id=\"211\" attribute_version=\"2\" attribute_language=\"eng-GB\"/>\n  <information Height=\"218\" Width=\"218\" IsColor=\"1\"/>\n</ezimage>','ezimage',211,'eng-GB',3,0,'',2),(0,183,58,NULL,NULL,'He was created for only one person. She was never supposed to be the One. It is 1988 and Lilly, a shy high school senior with a non-existent social life, is forced to live out her romantic fantasies through the fictional characters of her books. That all changes when she issues a spur of the moment invitation to the strange new kid.','eztext',212,'eng-GB',3,0,'he was created for only one person. she was never supposed to be the one. it is 1988 and lilly, a shy high school senior with a non-existent social life, is forced to live out her romantic fantasies through the fictional characters of her books. that all ',1),(0,183,58,NULL,NULL,'He was created for only one person. She was never supposed to be the One. It is 1988 and Lilly, a shy high school senior with a non-existent social life, is forced to live out her romantic fantasies through the fictional characters of her books. That all changes when she issues a spur of the moment invitation to the strange new kid.','eztext',212,'eng-GB',3,0,'he was created for only one person. she was never supposed to be the one. it is 1988 and lilly, a shy high school senior with a non-existent social life, is forced to live out her romantic fantasies through the fictional characters of her books. that all ',2),(0,184,58,3.99,NULL,NULL,'ezfloat',213,'eng-GB',3,0,'',1),(0,184,58,3.99,NULL,NULL,'ezfloat',213,'eng-GB',3,0,'',2),(0,187,58,NULL,NULL,'2','ezselection',214,'eng-GB',3,0,'2',1),(0,187,58,NULL,NULL,'2','ezselection',214,'eng-GB',3,0,'2',2),(0,181,59,NULL,NULL,'The Science Book (Big Ideas)','ezstring',215,'eng-GB',3,0,'the science book (big ideas)',1),(0,181,59,NULL,NULL,'The Science Book (Big Ideas)','ezstring',215,'eng-GB',3,0,'the science book (big ideas)',2),(0,182,59,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"science1.jpg\"\n    suffix=\"jpg\" basename=\"science1\" dirpath=\"var/site/storage/images/6/1/2/0/216-1-eng-GB\" url=\"var/site/storage/images/6/1/2/0/216-1-eng-GB/science1.jpg\"\n    original_filename=\"science1.jpg\" mime_type=\"image/jpeg\" width=\"218\"\n    height=\"218\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493043097\">\n  <original attribute_id=\"216\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"218\" Width=\"218\" IsColor=\"1\"/>\n</ezimage>','ezimage',216,'eng-GB',3,0,'',1),(0,182,59,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"science.jpg\"\n    suffix=\"jpg\" basename=\"science\" dirpath=\"var/site/storage/images/6/1/2/0/216-2-eng-GB\" url=\"var/site/storage/images/6/1/2/0/216-2-eng-GB/science.jpg\"\n    original_filename=\"science.jpg\" mime_type=\"image/jpeg\" width=\"218\"\n    height=\"218\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493802923\">\n  <original attribute_id=\"216\" attribute_version=\"2\" attribute_language=\"eng-GB\"/>\n  <information Height=\"218\" Width=\"218\" IsColor=\"1\"/>\n</ezimage>','ezimage',216,'eng-GB',3,0,'',2),(0,183,59,NULL,NULL,'Part of the popular Big Ideas series, The Science Book explores the history of science, how scientists have sought to explain our incredible universe and how amazing scientific discoveries have been made.','eztext',217,'eng-GB',3,0,'part of the popular big ideas series, the science book explores the history of science, how scientists have sought to explain our incredible universe and how amazing scientific discoveries have been made.',1),(0,183,59,NULL,NULL,'Part of the popular Big Ideas series, The Science Book explores the history of science, how scientists have sought to explain our incredible universe and how amazing scientific discoveries have been made.','eztext',217,'eng-GB',3,0,'part of the popular big ideas series, the science book explores the history of science, how scientists have sought to explain our incredible universe and how amazing scientific discoveries have been made.',2),(0,184,59,12.99,NULL,NULL,'ezfloat',218,'eng-GB',3,0,'',1),(0,184,59,12.99,NULL,NULL,'ezfloat',218,'eng-GB',3,0,'',2),(0,187,59,NULL,NULL,'3','ezselection',219,'eng-GB',3,0,'3',1),(0,187,59,NULL,NULL,'3','ezselection',219,'eng-GB',3,0,'3',2),(0,181,60,NULL,NULL,'Bad Science','ezstring',220,'eng-GB',3,0,'bad science',1),(0,181,60,NULL,NULL,'Bad Science','ezstring',220,'eng-GB',3,0,'bad science',2),(0,182,60,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"science2.jpg\"\n    suffix=\"jpg\" basename=\"science2\" dirpath=\"var/site/storage/images/1/2/2/0/221-1-eng-GB\" url=\"var/site/storage/images/1/2/2/0/221-1-eng-GB/science2.jpg\"\n    original_filename=\"science2.jpg\" mime_type=\"image/jpeg\" width=\"218\"\n    height=\"218\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493043377\">\n  <original attribute_id=\"221\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"218\" Width=\"218\" IsColor=\"1\"/>\n</ezimage>','ezimage',221,'eng-GB',3,0,'',1),(0,182,60,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"bad-science.jpg\"\n    suffix=\"jpg\" basename=\"bad-science\" dirpath=\"var/site/storage/images/1/2/2/0/221-2-eng-GB\" url=\"var/site/storage/images/1/2/2/0/221-2-eng-GB/bad-science.jpg\"\n    original_filename=\"bad-science.jpg\" mime_type=\"image/jpeg\" width=\"218\"\n    height=\"218\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493802806\">\n  <original attribute_id=\"221\" attribute_version=\"2\" attribute_language=\"eng-GB\"/>\n  <information Height=\"218\" Width=\"218\" IsColor=\"1\"/>\n</ezimage>','ezimage',221,'eng-GB',3,0,'',2),(0,183,60,NULL,NULL,'Ben Goldacre’s wise and witty bestseller, shortlisted for the Samuel Johnson Prize, lifts the lid on quack doctors, flaky statistics, scaremongering journalists and evil pharmaceutical corporations.','eztext',222,'eng-GB',3,0,'ben goldacre’s wise and witty bestseller, shortlisted for the samuel johnson prize, lifts the lid on quack doctors, flaky statistics, scaremongering journalists and evil pharmaceutical corporations.',1),(0,183,60,NULL,NULL,'Ben Goldacre’s wise and witty bestseller, shortlisted for the Samuel Johnson Prize, lifts the lid on quack doctors, flaky statistics, scaremongering journalists and evil pharmaceutical corporations.','eztext',222,'eng-GB',3,0,'ben goldacre’s wise and witty bestseller, shortlisted for the samuel johnson prize, lifts the lid on quack doctors, flaky statistics, scaremongering journalists and evil pharmaceutical corporations.',2),(0,184,60,4.49,NULL,NULL,'ezfloat',223,'eng-GB',3,0,'',1),(0,184,60,4.49,NULL,NULL,'ezfloat',223,'eng-GB',3,0,'',2),(0,187,60,NULL,NULL,'3','ezselection',224,'eng-GB',3,0,'3',1),(0,187,60,NULL,NULL,'3','ezselection',224,'eng-GB',3,0,'3',2),(0,181,61,NULL,NULL,'An Astronaut\'s Guide to Life on Earth','ezstring',225,'eng-GB',3,0,'an astronaut\'s guide to life on earth',1),(0,181,61,NULL,NULL,'An Astronaut\'s Guide to Life on Earth','ezstring',225,'eng-GB',3,0,'an astronaut\'s guide to life on earth',2),(0,181,61,NULL,NULL,'An Astronaut\'s Guide to Life on Earth','ezstring',225,'eng-GB',3,0,'an astronaut\'s guide to life on earth',3),(0,182,61,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"science3.jpg\"\n    suffix=\"jpg\" basename=\"science3\" dirpath=\"var/site/storage/images/6/2/2/0/226-1-eng-GB\" url=\"var/site/storage/images/6/2/2/0/226-1-eng-GB/science3.jpg\"\n    original_filename=\"science3.jpg\" mime_type=\"image/jpeg\" width=\"330\"\n    height=\"500\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493043496\">\n  <original attribute_id=\"226\" attribute_version=\"1\" attribute_language=\"eng-GB\"/>\n  <information Height=\"500\" Width=\"330\" IsColor=\"1\"/>\n</ezimage>','ezimage',226,'eng-GB',3,0,'',1),(0,182,61,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"science3.jpg\"\n    suffix=\"jpg\" basename=\"science3\" dirpath=\"var/site/storage/images/6/2/2/0/226-1-eng-GB\" url=\"var/site/storage/images/6/2/2/0/226-1-eng-GB/science3.jpg\"\n    original_filename=\"science3.jpg\" mime_type=\"image/jpeg\" width=\"330\"\n    height=\"500\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493802670\">\n  <original attribute_id=\"226\" attribute_version=\"2\" attribute_language=\"eng-GB\"/>\n  <information Height=\"500\" Width=\"330\" IsColor=\"1\"/>\n</ezimage>','ezimage',226,'eng-GB',3,0,'',2),(0,182,61,NULL,NULL,'<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<ezimage serial_number=\"1\" is_valid=\"1\" filename=\"astronaut.jpg\"\n    suffix=\"jpg\" basename=\"astronaut\" dirpath=\"var/site/storage/images/6/2/2/0/226-3-eng-GB\" url=\"var/site/storage/images/6/2/2/0/226-3-eng-GB/astronaut.jpg\"\n    original_filename=\"astronaut.jpg\" mime_type=\"image/jpeg\" width=\"218\"\n    height=\"218\" alternative_text=\"\" alias_key=\"1293033771\" timestamp=\"1493802711\">\n  <original attribute_id=\"226\" attribute_version=\"3\" attribute_language=\"eng-GB\"/>\n  <information Height=\"218\" Width=\"218\" IsColor=\"1\"/>\n</ezimage>','ezimage',226,'eng-GB',3,0,'',3),(0,183,61,NULL,NULL,'Colonel Chris Hadfield has spent decades training as an astronaut and has logged nearly 4,000 hours in space. During this time he has broken into a Space Station with a Swiss army knife, disposed of a live snake while piloting a plane, been temporarily blinded while clinging to the exterior of an orbiting spacecraft.','eztext',227,'eng-GB',3,0,'colonel chris hadfield has spent decades training as an astronaut and has logged nearly 4,000 hours in space. during this time he has broken into a space station with a swiss army knife, disposed of a live snake while piloting a plane, been temporarily bl',1),(0,183,61,NULL,NULL,'Colonel Chris Hadfield has spent decades training as an astronaut and has logged nearly 4,000 hours in space. During this time he has broken into a Space Station with a Swiss army knife, disposed of a live snake while piloting a plane, been temporarily blinded while clinging to the exterior of an orbiting spacecraft.','eztext',227,'eng-GB',3,0,'colonel chris hadfield has spent decades training as an astronaut and has logged nearly 4,000 hours in space. during this time he has broken into a space station with a swiss army knife, disposed of a live snake while piloting a plane, been temporarily bl',2),(0,183,61,NULL,NULL,'Colonel Chris Hadfield has spent decades training as an astronaut and has logged nearly 4,000 hours in space. During this time he has broken into a Space Station with a Swiss army knife, disposed of a live snake while piloting a plane, been temporarily blinded while clinging to the exterior of an orbiting spacecraft.','eztext',227,'eng-GB',3,0,'colonel chris hadfield has spent decades training as an astronaut and has logged nearly 4,000 hours in space. during this time he has broken into a space station with a swiss army knife, disposed of a live snake while piloting a plane, been temporarily bl',3),(0,184,61,18.99,NULL,NULL,'ezfloat',228,'eng-GB',3,0,'',1),(0,184,61,18.99,NULL,NULL,'ezfloat',228,'eng-GB',3,0,'',2),(0,184,61,18.99,NULL,NULL,'ezfloat',228,'eng-GB',3,0,'',3),(0,187,61,NULL,NULL,'3','ezselection',229,'eng-GB',3,0,'3',1),(0,187,61,NULL,NULL,'3','ezselection',229,'eng-GB',3,0,'3',2),(0,187,61,NULL,NULL,'3','ezselection',229,'eng-GB',3,0,'3',3);
/*!40000 ALTER TABLE `ezcontentobject_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_link`
--

DROP TABLE IF EXISTS `ezcontentobject_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_link` (
  `contentclassattribute_id` int(11) NOT NULL DEFAULT '0',
  `from_contentobject_id` int(11) NOT NULL DEFAULT '0',
  `from_contentobject_version` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relation_type` int(11) NOT NULL DEFAULT '1',
  `to_contentobject_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezco_link_from` (`from_contentobject_id`,`from_contentobject_version`,`contentclassattribute_id`),
  KEY `ezco_link_to_co_id` (`to_contentobject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_link`
--

LOCK TABLES `ezcontentobject_link` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcontentobject_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_name`
--

DROP TABLE IF EXISTS `ezcontentobject_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_name` (
  `content_translation` varchar(20) NOT NULL DEFAULT '',
  `content_version` int(11) NOT NULL DEFAULT '0',
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `language_id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `real_translation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`contentobject_id`,`content_version`,`content_translation`),
  KEY `ezcontentobject_name_cov_id` (`content_version`),
  KEY `ezcontentobject_name_lang_id` (`language_id`),
  KEY `ezcontentobject_name_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_name`
--

LOCK TABLES `ezcontentobject_name` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_name` DISABLE KEYS */;
INSERT INTO `ezcontentobject_name` VALUES ('eng-GB',9,1,2,'eZ Platform','eng-GB'),('eng-GB',1,4,3,'Users','eng-GB'),('eng-GB',2,10,3,'Anonymous User','eng-GB'),('eng-GB',1,11,3,'Guest accounts','eng-GB'),('eng-GB',1,12,3,'Administrator users','eng-GB'),('eng-GB',1,13,3,'Editors','eng-GB'),('eng-GB',3,14,3,'Administrator User','eng-GB'),('eng-GB',1,41,3,'Media','eng-GB'),('eng-GB',1,42,3,'Anonymous Users','eng-GB'),('eng-GB',1,45,3,'Setup','eng-GB'),('eng-GB',1,49,3,'Images','eng-GB'),('eng-GB',1,50,3,'Files','eng-GB'),('eng-GB',1,51,3,'Multimedia','eng-GB'),('eng-GB',1,52,2,'products','eng-GB'),('eng-GB',1,53,2,'Nikola Tesla: Imagination and the Man That Invented the 20th Century','eng-GB'),('eng-GB',2,53,2,'Nikola Tesla: Imagination and the Man That Invented the 20th Century','eng-GB'),('eng-GB',1,54,2,'Robin Williams: The Biography','eng-GB'),('eng-GB',2,54,2,'Robin Williams: The Biography','eng-GB'),('eng-GB',1,55,2,'J.K. Rowling: A Life of Magic','eng-GB'),('eng-GB',2,55,2,'J.K. Rowling: A Life of Magic','eng-GB'),('eng-GB',1,56,2,'The Letter: The #1 Bestseller that everyone is talking about','eng-GB'),('eng-GB',2,56,2,'The Letter: The #1 Bestseller that everyone is talking about','eng-GB'),('eng-GB',1,57,2,'The Phantom Tree','eng-GB'),('eng-GB',2,57,2,'The Phantom Tree','eng-GB'),('eng-GB',1,58,2,'The Circle','eng-GB'),('eng-GB',2,58,2,'The Circle','eng-GB'),('eng-GB',1,59,2,'The Science Book (Big Ideas)','eng-GB'),('eng-GB',2,59,2,'The Science Book (Big Ideas)','eng-GB'),('eng-GB',1,60,2,'Bad Science','eng-GB'),('eng-GB',2,60,2,'Bad Science','eng-GB'),('eng-GB',1,61,2,'An Astronaut\'s Guide to Life on Earth','eng-GB'),('eng-GB',2,61,2,'An Astronaut\'s Guide to Life on Earth','eng-GB'),('eng-GB',3,61,2,'An Astronaut\'s Guide to Life on Earth','eng-GB');
/*!40000 ALTER TABLE `ezcontentobject_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_trash`
--

DROP TABLE IF EXISTS `ezcontentobject_trash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_trash` (
  `contentobject_id` int(11) DEFAULT NULL,
  `contentobject_version` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT '0',
  `is_hidden` int(11) NOT NULL DEFAULT '0',
  `is_invisible` int(11) NOT NULL DEFAULT '0',
  `main_node_id` int(11) DEFAULT NULL,
  `modified_subnode` int(11) DEFAULT '0',
  `node_id` int(11) NOT NULL DEFAULT '0',
  `parent_node_id` int(11) NOT NULL DEFAULT '0',
  `path_identification_string` longtext,
  `path_string` varchar(255) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '0',
  `remote_id` varchar(100) NOT NULL DEFAULT '',
  `sort_field` int(11) DEFAULT '1',
  `sort_order` int(11) DEFAULT '1',
  PRIMARY KEY (`node_id`),
  KEY `ezcobj_trash_co_id` (`contentobject_id`),
  KEY `ezcobj_trash_depth` (`depth`),
  KEY `ezcobj_trash_modified_subnode` (`modified_subnode`),
  KEY `ezcobj_trash_p_node_id` (`parent_node_id`),
  KEY `ezcobj_trash_path` (`path_string`),
  KEY `ezcobj_trash_path_ident` (`path_identification_string`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_trash`
--

LOCK TABLES `ezcontentobject_trash` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_trash` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcontentobject_trash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_tree`
--

DROP TABLE IF EXISTS `ezcontentobject_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_tree` (
  `contentobject_id` int(11) DEFAULT NULL,
  `contentobject_is_published` int(11) DEFAULT NULL,
  `contentobject_version` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT '0',
  `is_hidden` int(11) NOT NULL DEFAULT '0',
  `is_invisible` int(11) NOT NULL DEFAULT '0',
  `main_node_id` int(11) DEFAULT NULL,
  `modified_subnode` int(11) DEFAULT '0',
  `node_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_node_id` int(11) NOT NULL DEFAULT '0',
  `path_identification_string` longtext,
  `path_string` varchar(255) NOT NULL DEFAULT '',
  `priority` int(11) NOT NULL DEFAULT '0',
  `remote_id` varchar(100) NOT NULL DEFAULT '',
  `sort_field` int(11) DEFAULT '1',
  `sort_order` int(11) DEFAULT '1',
  PRIMARY KEY (`node_id`),
  KEY `ezcontentobject_tree_remote_id` (`remote_id`),
  KEY `ezcontentobject_tree_co_id` (`contentobject_id`),
  KEY `ezcontentobject_tree_depth` (`depth`),
  KEY `ezcontentobject_tree_p_node_id` (`parent_node_id`),
  KEY `ezcontentobject_tree_path` (`path_string`),
  KEY `ezcontentobject_tree_path_ident` (`path_identification_string`(50)),
  KEY `modified_subnode` (`modified_subnode`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_tree`
--

LOCK TABLES `ezcontentobject_tree` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_tree` DISABLE KEYS */;
INSERT INTO `ezcontentobject_tree` VALUES (0,1,1,0,0,0,1,1448999778,1,1,'','/1/',0,'629709ba256fe317c3ddcee35453a96a',1,1),(1,1,9,1,0,0,2,1301073466,2,1,'node_2','/1/2/',0,'f3e90596361e31d496d4026eb624c983',8,1),(4,1,1,1,0,0,5,1301062024,5,1,'users','/1/5/',0,'3f6d92f8044aed134f32153517850f5a',1,1),(11,1,1,2,0,0,12,1081860719,12,5,'users/guest_accounts','/1/5/12/',0,'602dcf84765e56b7f999eaafd3821dd3',1,1),(12,1,1,2,0,0,13,1301062024,13,5,'users/administrator_users','/1/5/13/',0,'769380b7aa94541679167eab817ca893',1,1),(13,1,1,2,0,0,14,1081860719,14,5,'users/editors','/1/5/14/',0,'f7dda2854fc68f7c8455d9cb14bd04a9',1,1),(14,1,3,3,0,0,15,1301062024,15,13,'users/administrator_users/administrator_user','/1/5/13/15/',0,'e5161a99f733200b9ed4e80f9c16187b',1,1),(41,1,1,1,0,0,43,1081860720,43,1,'media','/1/43/',0,'75c715a51699d2d309a924eca6a95145',9,1),(42,1,1,2,0,0,44,1081860719,44,5,'users/anonymous_users','/1/5/44/',0,'4fdf0072da953bb276c0c7e0141c5c9b',9,1),(10,1,2,3,0,0,45,1081860719,45,44,'users/anonymous_users/anonymous_user','/1/5/44/45/',0,'2cf8343bee7b482bab82b269d8fecd76',9,1),(45,1,1,1,0,0,48,1448833726,48,1,'setup2','/1/48/',0,'182ce1b5af0c09fa378557c462ba2617',9,1),(49,1,1,2,0,0,51,1081860720,51,43,'media/images','/1/43/51/',0,'1b26c0454b09bb49dfb1b9190ffd67cb',9,1),(50,1,1,2,0,0,52,1081860720,52,43,'media/files','/1/43/52/',0,'0b113a208f7890f9ad3c24444ff5988c',9,1),(51,1,1,2,0,0,53,1081860720,53,43,'media/multimedia','/1/43/53/',0,'4f18b82c75f10aad476cae5adf98c11f',9,1),(52,1,1,2,0,0,54,1493040495,54,2,'node_2/products','/1/2/54/',0,'10d045e67f1593a76f041ed91d97f308',1,1),(53,1,2,3,0,0,55,1493040781,55,54,'node_2/products/nikola_tesla_imagination_and_the_man_that_invented_the_20th_century','/1/2/54/55/',0,'db6bb5fea3161cdc30445e1d4c095931',1,1),(54,1,2,3,0,0,56,1493041272,56,54,'node_2/products/robin_williams_the_biography','/1/2/54/56/',0,'86f1e735f1c354db0d355982cf496fce',1,1),(55,1,2,3,0,0,57,1493041511,57,54,'node_2/products/j_k_rowling_a_life_of_magic','/1/2/54/57/',0,'bd954a953cd64b85a22f33963452f868',1,1),(56,1,2,3,0,0,58,1493042677,58,54,'node_2/products/the_letter_the_1_bestseller_that_everyone_is_talking_about','/1/2/54/58/',0,'a1ca1c8f2b316088065294c8e332ad0c',1,1),(57,1,2,3,0,0,59,1493042810,59,54,'node_2/products/the_phantom_tree','/1/2/54/59/',0,'c3c005bd32750e9b04259479c28bf681',1,1),(58,1,2,3,0,0,60,1493042976,60,54,'node_2/products/the_circle','/1/2/54/60/',0,'5aaf0e63469bec779b139b6c1078e43b',1,1),(59,1,2,3,0,0,61,1493043098,61,54,'node_2/products/the_science_book_big_ideas','/1/2/54/61/',0,'3ac8f94040d9a38a57138b498a508a2e',1,1),(60,1,2,3,0,0,62,1493043378,62,54,'node_2/products/bad_science','/1/2/54/62/',0,'15c7bd3830fc7bab8420a323f58e6fac',1,1),(61,1,3,3,0,0,63,1493043498,63,54,'node_2/products/an_astronaut_s_guide_to_life_on_earth','/1/2/54/63/',0,'d1898b61dd1710897df79da71396df83',1,1);
/*!40000 ALTER TABLE `ezcontentobject_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcontentobject_version`
--

DROP TABLE IF EXISTS `ezcontentobject_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcontentobject_version` (
  `contentobject_id` int(11) DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `initial_language_id` bigint(20) NOT NULL DEFAULT '0',
  `language_mask` bigint(20) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `workflow_event_pos` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezcobj_version_creator_id` (`creator_id`),
  KEY `ezcobj_version_status` (`status`),
  KEY `idx_object_version_objver` (`contentobject_id`,`version`),
  KEY `ezcontobj_version_obj_status` (`contentobject_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=527 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcontentobject_version`
--

LOCK TABLES `ezcontentobject_version` WRITE;
/*!40000 ALTER TABLE `ezcontentobject_version` DISABLE KEYS */;
INSERT INTO `ezcontentobject_version` VALUES (4,0,14,4,2,3,0,1,0,1,1),(11,1033920737,14,439,2,3,1033920746,1,0,1,0),(12,1033920760,14,440,2,3,1033920775,1,0,1,0),(13,1033920786,14,441,2,3,1033920794,1,0,1,0),(41,1060695450,14,472,2,3,1060695457,1,0,1,0),(42,1072180278,14,473,2,3,1072180330,1,0,1,0),(10,1072180337,14,474,2,3,1072180405,1,0,2,0),(45,1079684084,14,477,2,3,1079684190,1,0,1,0),(49,1080220181,14,488,2,3,1080220197,1,0,1,0),(50,1080220211,14,489,2,3,1080220220,1,0,1,0),(51,1080220225,14,490,2,3,1080220233,1,0,1,0),(14,1301061783,14,499,2,3,1301062024,1,0,3,0),(1,1448889045,14,506,2,3,1448889046,1,0,9,0),(52,1493040493,14,507,2,3,1493040495,1,0,1,0),(53,1493040778,14,508,2,3,1493803795,3,0,1,0),(54,1493041268,14,509,2,3,1493803725,3,0,1,0),(55,1493041509,14,510,2,3,1493803591,3,0,1,0),(56,1493042672,14,511,2,3,1493803475,3,0,1,0),(57,1493042807,14,512,2,3,1493803334,3,0,1,0),(58,1493042974,14,513,2,3,1493803025,3,0,1,0),(59,1493043096,14,514,2,3,1493802924,3,0,1,0),(60,1493043376,14,515,2,3,1493802807,3,0,1,0),(61,1493043495,14,516,2,3,1493802671,3,0,1,0),(61,1493802670,14,517,2,3,1493802711,3,0,2,0),(61,1493802710,14,518,2,3,1493802711,1,0,3,0),(60,1493802806,14,519,2,3,1493802807,1,0,2,0),(59,1493802922,14,520,2,3,1493802924,1,0,2,0),(58,1493803023,14,521,2,3,1493803025,1,0,2,0),(57,1493803332,14,522,2,3,1493803334,1,0,2,0),(56,1493803473,14,523,2,3,1493803475,1,0,2,0),(55,1493803589,14,524,2,3,1493803591,1,0,2,0),(54,1493803724,14,525,2,3,1493803725,1,0,2,0),(53,1493803793,14,526,2,3,1493803795,1,0,2,0);
/*!40000 ALTER TABLE `ezcontentobject_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezcurrencydata`
--

DROP TABLE IF EXISTS `ezcurrencydata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezcurrencydata` (
  `auto_rate_value` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `code` varchar(4) NOT NULL DEFAULT '',
  `custom_rate_value` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) NOT NULL DEFAULT '',
  `rate_factor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `status` int(11) NOT NULL DEFAULT '1',
  `symbol` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ezcurrencydata_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezcurrencydata`
--

LOCK TABLES `ezcurrencydata` WRITE;
/*!40000 ALTER TABLE `ezcurrencydata` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezcurrencydata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezdfsfile`
--

DROP TABLE IF EXISTS `ezdfsfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezdfsfile` (
  `name` text NOT NULL,
  `name_trunk` text NOT NULL,
  `name_hash` varchar(34) NOT NULL DEFAULT '',
  `datatype` varchar(255) NOT NULL DEFAULT 'application/octet-stream',
  `scope` varchar(25) NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `expired` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name_hash`),
  KEY `ezdfsfile_name` (`name`(250)),
  KEY `ezdfsfile_name_trunk` (`name_trunk`(250)),
  KEY `ezdfsfile_mtime` (`mtime`),
  KEY `ezdfsfile_expired_name` (`expired`,`name`(250))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezdfsfile`
--

LOCK TABLES `ezdfsfile` WRITE;
/*!40000 ALTER TABLE `ezdfsfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezdfsfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezdiscountrule`
--

DROP TABLE IF EXISTS `ezdiscountrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezdiscountrule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezdiscountrule`
--

LOCK TABLES `ezdiscountrule` WRITE;
/*!40000 ALTER TABLE `ezdiscountrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezdiscountrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezdiscountsubrule`
--

DROP TABLE IF EXISTS `ezdiscountsubrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezdiscountsubrule` (
  `discount_percent` float DEFAULT NULL,
  `discountrule_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `limitation` char(1) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezdiscountsubrule`
--

LOCK TABLES `ezdiscountsubrule` WRITE;
/*!40000 ALTER TABLE `ezdiscountsubrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezdiscountsubrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezdiscountsubrule_value`
--

DROP TABLE IF EXISTS `ezdiscountsubrule_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezdiscountsubrule_value` (
  `discountsubrule_id` int(11) NOT NULL DEFAULT '0',
  `issection` int(11) NOT NULL DEFAULT '0',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`discountsubrule_id`,`value`,`issection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezdiscountsubrule_value`
--

LOCK TABLES `ezdiscountsubrule_value` WRITE;
/*!40000 ALTER TABLE `ezdiscountsubrule_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezdiscountsubrule_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezenumobjectvalue`
--

DROP TABLE IF EXISTS `ezenumobjectvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezenumobjectvalue` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_attribute_version` int(11) NOT NULL DEFAULT '0',
  `enumelement` varchar(255) NOT NULL DEFAULT '',
  `enumid` int(11) NOT NULL DEFAULT '0',
  `enumvalue` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`contentobject_attribute_id`,`contentobject_attribute_version`,`enumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezenumobjectvalue`
--

LOCK TABLES `ezenumobjectvalue` WRITE;
/*!40000 ALTER TABLE `ezenumobjectvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezenumobjectvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezenumvalue`
--

DROP TABLE IF EXISTS `ezenumvalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezenumvalue` (
  `contentclass_attribute_id` int(11) NOT NULL DEFAULT '0',
  `contentclass_attribute_version` int(11) NOT NULL DEFAULT '0',
  `enumelement` varchar(255) NOT NULL DEFAULT '',
  `enumvalue` varchar(255) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placement` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`contentclass_attribute_id`,`contentclass_attribute_version`),
  KEY `ezenumvalue_co_cl_attr_id_co_class_att_ver` (`contentclass_attribute_id`,`contentclass_attribute_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezenumvalue`
--

LOCK TABLES `ezenumvalue` WRITE;
/*!40000 ALTER TABLE `ezenumvalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezenumvalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezforgot_password`
--

DROP TABLE IF EXISTS `ezforgot_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezforgot_password` (
  `hash_key` varchar(32) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezforgot_password_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezforgot_password`
--

LOCK TABLES `ezforgot_password` WRITE;
/*!40000 ALTER TABLE `ezforgot_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezforgot_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezgeneral_digest_user_settings`
--

DROP TABLE IF EXISTS `ezgeneral_digest_user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezgeneral_digest_user_settings` (
  `day` varchar(255) NOT NULL DEFAULT '',
  `digest_type` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receive_digest` int(11) NOT NULL DEFAULT '0',
  `time` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezgeneral_digest_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezgeneral_digest_user_settings`
--

LOCK TABLES `ezgeneral_digest_user_settings` WRITE;
/*!40000 ALTER TABLE `ezgeneral_digest_user_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezgeneral_digest_user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezgmaplocation`
--

DROP TABLE IF EXISTS `ezgmaplocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezgmaplocation` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_version` int(11) NOT NULL DEFAULT '0',
  `latitude` double NOT NULL DEFAULT '0',
  `longitude` double NOT NULL DEFAULT '0',
  `address` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`contentobject_attribute_id`,`contentobject_version`),
  KEY `latitude_longitude_key` (`latitude`,`longitude`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezgmaplocation`
--

LOCK TABLES `ezgmaplocation` WRITE;
/*!40000 ALTER TABLE `ezgmaplocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezgmaplocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezimagefile`
--

DROP TABLE IF EXISTS `ezimagefile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezimagefile` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT '0',
  `filepath` longtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `ezimagefile_coid` (`contentobject_attribute_id`),
  KEY `ezimagefile_file` (`filepath`(200))
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezimagefile`
--

LOCK TABLES `ezimagefile` WRITE;
/*!40000 ALTER TABLE `ezimagefile` DISABLE KEYS */;
INSERT INTO `ezimagefile` VALUES (186,'var/site/storage/images/6/8/1/0/186-1-eng-GB/tesla.jpg',1),(191,'var/site/storage/images/1/9/1/0/191-1-eng-GB/robin.jpg',2),(196,'var/site/storage/images/6/9/1/0/196-1-eng-GB/rowling.jpg',3),(201,'var/site/storage/images/1/0/2/0/201-1-eng-GB/letter.jpg',4),(206,'var/site/storage/images/6/0/2/0/206-1-eng-GB/phantom.jpg',5),(211,'var/site/storage/images/1/1/2/0/211-1-eng-GB/circle.jpg',6),(216,'var/site/storage/images/6/1/2/0/216-1-eng-GB/science1.jpg',7),(221,'var/site/storage/images/1/2/2/0/221-1-eng-GB/science2.jpg',8),(226,'var/site/storage/images/6/2/2/0/226-1-eng-GB/science3.jpg',9),(226,'var/site/storage/images/6/2/2/0/226-1-eng-GB/science3.jpg',10),(226,'var/site/storage/images/6/2/2/0/226-1-eng-GB/science3.jpg',11),(226,'var/site/storage/images/6/2/2/0/226-3-eng-GB/astronaut.jpg',12),(221,'var/site/storage/images/1/2/2/0/221-1-eng-GB/science2.jpg',13),(221,'var/site/storage/images/1/2/2/0/221-2-eng-GB/bad-science.jpg',14),(216,'var/site/storage/images/6/1/2/0/216-1-eng-GB/science1.jpg',15),(216,'var/site/storage/images/6/1/2/0/216-2-eng-GB/science.jpg',16),(211,'var/site/storage/images/1/1/2/0/211-1-eng-GB/circle.jpg',17),(211,'var/site/storage/images/1/1/2/0/211-2-eng-GB/circle.jpg',18),(206,'var/site/storage/images/6/0/2/0/206-1-eng-GB/phantom.jpg',19),(206,'var/site/storage/images/6/0/2/0/206-2-eng-GB/phantom.jpg',20),(201,'var/site/storage/images/1/0/2/0/201-1-eng-GB/letter.jpg',21),(201,'var/site/storage/images/1/0/2/0/201-2-eng-GB/letter.jpg',22),(196,'var/site/storage/images/6/9/1/0/196-1-eng-GB/rowling.jpg',23),(196,'var/site/storage/images/6/9/1/0/196-2-eng-GB/rowling.jpg',24),(191,'var/site/storage/images/1/9/1/0/191-1-eng-GB/robin.jpg',25),(191,'var/site/storage/images/1/9/1/0/191-2-eng-GB/robin.jpg',26),(186,'var/site/storage/images/6/8/1/0/186-1-eng-GB/tesla.jpg',27),(186,'var/site/storage/images/6/8/1/0/186-2-eng-GB/nikola.jpg',28);
/*!40000 ALTER TABLE `ezimagefile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezinfocollection`
--

DROP TABLE IF EXISTS `ezinfocollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezinfocollection` (
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` int(11) DEFAULT '0',
  `user_identifier` varchar(34) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezinfocollection_co_id_created` (`contentobject_id`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezinfocollection`
--

LOCK TABLES `ezinfocollection` WRITE;
/*!40000 ALTER TABLE `ezinfocollection` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezinfocollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezinfocollection_attribute`
--

DROP TABLE IF EXISTS `ezinfocollection_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezinfocollection_attribute` (
  `contentclass_attribute_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_attribute_id` int(11) DEFAULT NULL,
  `contentobject_id` int(11) DEFAULT NULL,
  `data_float` float DEFAULT NULL,
  `data_int` int(11) DEFAULT NULL,
  `data_text` longtext,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `informationcollection_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezinfocollection_attr_cca_id` (`contentclass_attribute_id`),
  KEY `ezinfocollection_attr_co_id` (`contentobject_id`),
  KEY `ezinfocollection_attr_coa_id` (`contentobject_attribute_id`),
  KEY `ezinfocollection_attr_ic_id` (`informationcollection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezinfocollection_attribute`
--

LOCK TABLES `ezinfocollection_attribute` WRITE;
/*!40000 ALTER TABLE `ezinfocollection_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezinfocollection_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezisbn_group`
--

DROP TABLE IF EXISTS `ezisbn_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezisbn_group` (
  `description` varchar(255) NOT NULL DEFAULT '',
  `group_number` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezisbn_group`
--

LOCK TABLES `ezisbn_group` WRITE;
/*!40000 ALTER TABLE `ezisbn_group` DISABLE KEYS */;
INSERT INTO `ezisbn_group` VALUES ('English language',0,1),('English language',1,2),('French language',2,3),('German language',3,4),('Japan',4,5),('Russian Federation and former USSR',5,6),('Iran',600,7),('Kazakhstan',601,8),('Indonesia',602,9),('Saudi Arabia',603,10),('Vietnam',604,11),('Turkey',605,12),('Romania',606,13),('Mexico',607,14),('Macedonia',608,15),('Lithuania',609,16),('Thailand',611,17),('Peru',612,18),('Mauritius',613,19),('Lebanon',614,20),('Hungary',615,21),('Thailand',616,22),('Ukraine',617,23),('China, People\'s Republic',7,24),('Czech Republic and Slovakia',80,25),('India',81,26),('Norway',82,27),('Poland',83,28),('Spain',84,29),('Brazil',85,30),('Serbia and Montenegro',86,31),('Denmark',87,32),('Italy',88,33),('Korea, Republic',89,34),('Netherlands',90,35),('Sweden',91,36),('International NGO Publishers and EC Organizations',92,37),('India',93,38),('Netherlands',94,39),('Argentina',950,40),('Finland',951,41),('Finland',952,42),('Croatia',953,43),('Bulgaria',954,44),('Sri Lanka',955,45),('Chile',956,46),('Taiwan',957,47),('Colombia',958,48),('Cuba',959,49),('Greece',960,50),('Slovenia',961,51),('Hong Kong, China',962,52),('Hungary',963,53),('Iran',964,54),('Israel',965,55),('Ukraine',966,56),('Malaysia',967,57),('Mexico',968,58),('Pakistan',969,59),('Mexico',970,60),('Philippines',971,61),('Portugal',972,62),('Romania',973,63),('Thailand',974,64),('Turkey',975,65),('Caribbean Community',976,66),('Egypt',977,67),('Nigeria',978,68),('Indonesia',979,69),('Venezuela',980,70),('Singapore',981,71),('South Pacific',982,72),('Malaysia',983,73),('Bangladesh',984,74),('Belarus',985,75),('Taiwan',986,76),('Argentina',987,77),('Hong Kong, China',988,78),('Portugal',989,79),('Qatar',9927,80),('Albania',9928,81),('Guatemala',9929,82),('Costa Rica',9930,83),('Algeria',9931,84),('Lao People\'s Democratic Republic',9932,85),('Syria',9933,86),('Latvia',9934,87),('Iceland',9935,88),('Afghanistan',9936,89),('Nepal',9937,90),('Tunisia',9938,91),('Armenia',9939,92),('Montenegro',9940,93),('Georgia',9941,94),('Ecuador',9942,95),('Uzbekistan',9943,96),('Turkey',9944,97),('Dominican Republic',9945,98),('Korea, P.D.R.',9946,99),('Algeria',9947,100),('United Arab Emirates',9948,101),('Estonia',9949,102),('Palestine',9950,103),('Kosova',9951,104),('Azerbaijan',9952,105),('Lebanon',9953,106),('Morocco',9954,107),('Lithuania',9955,108),('Cameroon',9956,109),('Jordan',9957,110),('Bosnia and Herzegovina',9958,111),('Libya',9959,112),('Saudi Arabia',9960,113),('Algeria',9961,114),('Panama',9962,115),('Cyprus',9963,116),('Ghana',9964,117),('Kazakhstan',9965,118),('Kenya',9966,119),('Kyrgyz Republic',9967,120),('Costa Rica',9968,121),('Uganda',9970,122),('Singapore',9971,123),('Peru',9972,124),('Tunisia',9973,125),('Uruguay',9974,126),('Moldova',9975,127),('Tanzania',9976,128),('Costa Rica',9977,129),('Ecuador',9978,130),('Iceland',9979,131),('Papua New Guinea',9980,132),('Morocco',9981,133),('Zambia',9982,134),('Gambia',9983,135),('Latvia',9984,136),('Estonia',9985,137),('Lithuania',9986,138),('Tanzania',9987,139),('Ghana',9988,140),('Macedonia',9989,141),('Bahrain',99901,142),('Gabon',99902,143),('Mauritius',99903,144),('Netherlands Antilles and Aruba',99904,145),('Bolivia',99905,146),('Kuwait',99906,147),('Malawi',99908,148),('Malta',99909,149),('Sierra Leone',99910,150),('Lesotho',99911,151),('Botswana',99912,152),('Andorra',99913,153),('Suriname',99914,154),('Maldives',99915,155),('Namibia',99916,156),('Brunei Darussalam',99917,157),('Faroe Islands',99918,158),('Benin',99919,159),('Andorra',99920,160),('Qatar',99921,161),('Guatemala',99922,162),('El Salvador',99923,163),('Nicaragua',99924,164),('Paraguay',99925,165),('Honduras',99926,166),('Albania',99927,167),('Georgia',99928,168),('Mongolia',99929,169),('Armenia',99930,170),('Seychelles',99931,171),('Malta',99932,172),('Nepal',99933,173),('Dominican Republic',99934,174),('Haiti',99935,175),('Bhutan',99936,176),('Macau',99937,177),('Srpska, Republic of',99938,178),('Guatemala',99939,179),('Georgia',99940,180),('Armenia',99941,181),('Sudan',99942,182),('Albania',99943,183),('Ethiopia',99944,184),('Namibia',99945,185),('Nepal',99946,186),('Tajikistan',99947,187),('Eritrea',99948,188),('Mauritius',99949,189),('Cambodia',99950,190),('Congo',99951,191),('Mali',99952,192),('Paraguay',99953,193),('Bolivia',99954,194),('Srpska, Republic of',99955,195),('Albania',99956,196),('Malta',99957,197),('Bahrain',99958,198),('Luxembourg',99959,199),('Malawi',99960,200),('El Salvador',99961,201),('Mongolia',99962,202),('Cambodia',99963,203),('Nicaragua',99964,204),('Macau',99965,205),('Kuwait',99966,206),('Paraguay',99967,207),('Botswana',99968,208),('France',10,209);
/*!40000 ALTER TABLE `ezisbn_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezisbn_group_range`
--

DROP TABLE IF EXISTS `ezisbn_group_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezisbn_group_range` (
  `from_number` int(11) NOT NULL DEFAULT '0',
  `group_from` varchar(32) NOT NULL DEFAULT '',
  `group_length` int(11) NOT NULL DEFAULT '0',
  `group_to` varchar(32) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezisbn_group_range`
--

LOCK TABLES `ezisbn_group_range` WRITE;
/*!40000 ALTER TABLE `ezisbn_group_range` DISABLE KEYS */;
INSERT INTO `ezisbn_group_range` VALUES (0,'0',1,'5',1,59999),(60000,'600',3,'649',2,64999),(70000,'7',1,'7',3,79999),(80000,'80',2,'94',4,94999),(95000,'950',3,'989',5,98999),(99000,'9900',4,'9989',6,99899),(99900,'99900',5,'99999',7,99999),(10000,'10',2,'10',8,10999);
/*!40000 ALTER TABLE `ezisbn_group_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezisbn_registrant_range`
--

DROP TABLE IF EXISTS `ezisbn_registrant_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezisbn_registrant_range` (
  `from_number` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn_group_id` int(11) NOT NULL DEFAULT '0',
  `registrant_from` varchar(32) NOT NULL DEFAULT '',
  `registrant_length` int(11) NOT NULL DEFAULT '0',
  `registrant_to` varchar(32) NOT NULL DEFAULT '',
  `to_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=927 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezisbn_registrant_range`
--

LOCK TABLES `ezisbn_registrant_range` WRITE;
/*!40000 ALTER TABLE `ezisbn_registrant_range` DISABLE KEYS */;
INSERT INTO `ezisbn_registrant_range` VALUES (0,1,1,'00',2,'19',19999),(20000,2,1,'200',3,'699',69999),(70000,3,1,'7000',4,'8499',84999),(85000,4,1,'85000',5,'89999',89999),(90000,5,1,'900000',6,'949999',94999),(95000,6,1,'9500000',7,'9999999',99999),(0,7,2,'00',2,'09',9999),(10000,8,2,'100',3,'399',39999),(40000,9,2,'4000',4,'5499',54999),(55000,10,2,'55000',5,'86979',86979),(86980,11,2,'869800',6,'998999',99899),(99900,12,2,'9990000',7,'9999999',99999),(0,13,3,'00',2,'19',19999),(20000,14,3,'200',3,'349',34999),(35000,15,3,'35000',5,'39999',39999),(40000,16,3,'400',3,'699',69999),(70000,17,3,'7000',4,'8399',83999),(84000,18,3,'84000',5,'89999',89999),(90000,19,3,'900000',6,'949999',94999),(95000,20,3,'9500000',7,'9999999',99999),(0,21,4,'00',2,'02',2999),(3000,22,4,'030',3,'033',3399),(3400,23,4,'0340',4,'0369',3699),(3700,24,4,'03700',5,'03999',3999),(4000,25,4,'04',2,'19',19999),(20000,26,4,'200',3,'699',69999),(70000,27,4,'7000',4,'8499',84999),(85000,28,4,'85000',5,'89999',89999),(90000,29,4,'900000',6,'949999',94999),(95000,30,4,'9500000',7,'9539999',95399),(95400,31,4,'95400',5,'96999',96999),(97000,32,4,'9700000',7,'9899999',98999),(99000,33,4,'99000',5,'99499',99499),(99500,34,4,'99500',5,'99999',99999),(0,35,5,'00',2,'19',19999),(20000,36,5,'200',3,'699',69999),(70000,37,5,'7000',4,'8499',84999),(85000,38,5,'85000',5,'89999',89999),(90000,39,5,'900000',6,'949999',94999),(95000,40,5,'9500000',7,'9999999',99999),(0,41,6,'00',2,'19',19999),(20000,42,6,'200',3,'420',42099),(42100,43,6,'4210',4,'4299',42999),(43000,44,6,'430',3,'430',43099),(43100,45,6,'4310',4,'4399',43999),(44000,46,6,'440',3,'440',44099),(44100,47,6,'4410',4,'4499',44999),(45000,48,6,'450',3,'699',69999),(70000,49,6,'7000',4,'8499',84999),(85000,50,6,'85000',5,'89999',89999),(90000,51,6,'900000',6,'909999',90999),(91000,52,6,'91000',5,'91999',91999),(92000,53,6,'9200',4,'9299',92999),(93000,54,6,'93000',5,'94999',94999),(95000,55,6,'9500000',7,'9500999',95009),(95010,56,6,'9501',4,'9799',97999),(98000,57,6,'98000',5,'98999',98999),(99000,58,6,'9900000',7,'9909999',99099),(99100,59,6,'9910',4,'9999',99999),(0,60,7,'00',2,'09',9999),(10000,61,7,'100',3,'499',49999),(50000,62,7,'5000',4,'8999',89999),(90000,63,7,'90000',5,'99999',99999),(0,64,8,'00',2,'19',19999),(20000,65,8,'200',3,'699',69999),(70000,66,8,'7000',4,'7999',79999),(80000,67,8,'80000',5,'84999',84999),(85000,68,8,'85',2,'99',99999),(0,69,9,'00',2,'19',19999),(20000,70,9,'200',3,'799',79999),(80000,71,9,'8000',4,'9499',94999),(95000,72,9,'95000',5,'99999',99999),(0,73,10,'00',2,'04',4999),(5000,74,10,'05',2,'49',49999),(50000,75,10,'500',3,'799',79999),(80000,76,10,'8000',4,'8999',89999),(90000,77,10,'90000',5,'99999',99999),(0,78,11,'0',1,'4',49999),(50000,79,11,'50',2,'89',89999),(90000,80,11,'900',3,'979',97999),(98000,81,11,'9800',4,'9999',99999),(1000,82,12,'01',2,'09',9999),(10000,83,12,'100',3,'399',39999),(40000,84,12,'4000',4,'5999',59999),(60000,85,12,'60000',5,'89999',89999),(90000,86,12,'90',2,'99',99999),(0,87,13,'0',1,'0',9999),(10000,88,13,'10',2,'49',49999),(50000,89,13,'500',3,'799',79999),(80000,90,13,'8000',4,'9199',91999),(92000,91,13,'92000',5,'99999',99999),(0,92,14,'00',2,'39',39999),(40000,93,14,'400',3,'749',74999),(75000,94,14,'7500',4,'9499',94999),(95000,95,14,'95000',5,'99999',99999),(0,96,15,'0',1,'0',9999),(10000,97,15,'10',2,'19',19999),(20000,98,15,'200',3,'449',44999),(45000,99,15,'4500',4,'6499',64999),(65000,100,15,'65000',5,'69999',69999),(70000,101,15,'7',1,'9',99999),(0,102,16,'00',2,'39',39999),(40000,103,16,'400',3,'799',79999),(80000,104,16,'8000',4,'9499',94999),(95000,105,16,'95000',5,'99999',99999),(0,106,18,'00',2,'29',29999),(30000,107,18,'300',3,'399',39999),(40000,108,18,'4000',4,'4499',44999),(45000,109,18,'45000',5,'49999',49999),(50000,110,18,'50',2,'99',99999),(0,111,19,'0',1,'9',99999),(0,112,20,'00',2,'39',39999),(40000,113,20,'400',3,'799',79999),(80000,114,20,'8000',4,'9499',94999),(95000,115,20,'95000',5,'99999',99999),(0,116,21,'00',2,'09',9999),(10000,117,21,'100',3,'499',49999),(50000,118,21,'5000',4,'7999',79999),(80000,119,21,'80000',5,'89999',89999),(0,120,22,'00',2,'19',19999),(20000,121,22,'200',3,'699',69999),(70000,122,22,'7000',4,'8999',89999),(90000,123,22,'90000',5,'99999',99999),(0,124,23,'00',2,'49',49999),(50000,125,23,'500',3,'699',69999),(70000,126,23,'7000',4,'8999',89999),(90000,127,23,'90000',5,'99999',99999),(0,128,24,'00',2,'09',9999),(10000,129,24,'100',3,'499',49999),(50000,130,24,'5000',4,'7999',79999),(80000,131,24,'80000',5,'89999',89999),(90000,132,24,'900000',6,'999999',99999),(0,133,25,'00',2,'19',19999),(20000,134,25,'200',3,'699',69999),(70000,135,25,'7000',4,'8499',84999),(85000,136,25,'85000',5,'89999',89999),(90000,137,25,'900000',6,'999999',99999),(0,138,26,'00',2,'19',19999),(20000,139,26,'200',3,'699',69999),(70000,140,26,'7000',4,'8499',84999),(85000,141,26,'85000',5,'89999',89999),(90000,142,26,'900000',6,'999999',99999),(0,143,27,'00',2,'19',19999),(20000,144,27,'200',3,'699',69999),(70000,145,27,'7000',4,'8999',89999),(90000,146,27,'90000',5,'98999',98999),(99000,147,27,'990000',6,'999999',99999),(0,148,28,'00',2,'19',19999),(20000,149,28,'200',3,'599',59999),(60000,150,28,'60000',5,'69999',69999),(70000,151,28,'7000',4,'8499',84999),(85000,152,28,'85000',5,'89999',89999),(90000,153,28,'900000',6,'999999',99999),(0,154,29,'00',2,'14',14999),(15000,155,29,'15000',5,'19999',19999),(20000,156,29,'200',3,'699',69999),(70000,157,29,'7000',4,'8499',84999),(85000,158,29,'85000',5,'89999',89999),(90000,159,29,'9000',4,'9199',91999),(92000,160,29,'920000',6,'923999',92399),(92400,161,29,'92400',5,'92999',92999),(93000,162,29,'930000',6,'949999',94999),(95000,163,29,'95000',5,'96999',96999),(97000,164,29,'9700',4,'9999',99999),(0,165,30,'00',2,'19',19999),(20000,166,30,'200',3,'599',59999),(60000,167,30,'60000',5,'69999',69999),(70000,168,30,'7000',4,'8499',84999),(85000,169,30,'85000',5,'89999',89999),(90000,170,30,'900000',6,'979999',97999),(98000,171,30,'98000',5,'99999',99999),(0,172,31,'00',2,'29',29999),(30000,173,31,'300',3,'599',59999),(60000,174,31,'6000',4,'7999',79999),(80000,175,31,'80000',5,'89999',89999),(90000,176,31,'900000',6,'999999',99999),(0,177,32,'00',2,'29',29999),(40000,178,32,'400',3,'649',64999),(70000,179,32,'7000',4,'7999',79999),(85000,180,32,'85000',5,'94999',94999),(97000,181,32,'970000',6,'999999',99999),(0,182,33,'00',2,'19',19999),(20000,183,33,'200',3,'599',59999),(60000,184,33,'6000',4,'8499',84999),(85000,185,33,'85000',5,'89999',89999),(90000,186,33,'900000',6,'949999',94999),(95000,187,33,'95000',5,'99999',99999),(0,188,34,'00',2,'24',24999),(25000,189,34,'250',3,'549',54999),(55000,190,34,'5500',4,'8499',84999),(85000,191,34,'85000',5,'94999',94999),(95000,192,34,'950000',6,'969999',96999),(97000,193,34,'97000',5,'98999',98999),(99000,194,34,'990',3,'999',99999),(0,195,35,'00',2,'19',19999),(20000,196,35,'200',3,'499',49999),(50000,197,35,'5000',4,'6999',69999),(70000,198,35,'70000',5,'79999',79999),(80000,199,35,'800000',6,'849999',84999),(85000,200,35,'8500',4,'8999',89999),(90000,201,35,'90',2,'90',90999),(91000,202,35,'910000',6,'939999',93999),(94000,203,35,'94',2,'94',94999),(95000,204,35,'950000',6,'999999',99999),(0,205,36,'0',1,'1',19999),(20000,206,36,'20',2,'49',49999),(50000,207,36,'500',3,'649',64999),(70000,208,36,'7000',4,'7999',79999),(85000,209,36,'85000',5,'94999',94999),(97000,210,36,'970000',6,'999999',99999),(0,211,37,'0',1,'5',59999),(60000,212,37,'60',2,'79',79999),(80000,213,37,'800',3,'899',89999),(90000,214,37,'9000',4,'9499',94999),(95000,215,37,'95000',5,'98999',98999),(99000,216,37,'990000',6,'999999',99999),(0,217,38,'00',2,'09',9999),(10000,218,38,'100',3,'499',49999),(50000,219,38,'5000',4,'7999',79999),(80000,220,38,'80000',5,'94999',94999),(95000,221,38,'950000',6,'999999',99999),(0,222,39,'000',3,'599',59999),(60000,223,39,'6000',4,'8999',89999),(90000,224,39,'90000',5,'99999',99999),(0,225,40,'00',2,'49',49999),(50000,226,40,'500',3,'899',89999),(90000,227,40,'9000',4,'9899',98999),(99000,228,40,'99000',5,'99999',99999),(0,229,41,'0',1,'1',19999),(20000,230,41,'20',2,'54',54999),(55000,231,41,'550',3,'889',88999),(89000,232,41,'8900',4,'9499',94999),(95000,233,41,'95000',5,'99999',99999),(0,234,42,'00',2,'19',19999),(20000,235,42,'200',3,'499',49999),(50000,236,42,'5000',4,'5999',59999),(60000,237,42,'60',2,'65',65999),(66000,238,42,'6600',4,'6699',66999),(67000,239,42,'67000',5,'69999',69999),(70000,240,42,'7000',4,'7999',79999),(80000,241,42,'80',2,'94',94999),(95000,242,42,'9500',4,'9899',98999),(99000,243,42,'99000',5,'99999',99999),(0,244,43,'0',1,'0',9999),(10000,245,43,'10',2,'14',14999),(15000,246,43,'150',3,'549',54999),(55000,247,43,'55000',5,'59999',59999),(60000,248,43,'6000',4,'9499',94999),(95000,249,43,'95000',5,'99999',99999),(0,250,44,'00',2,'28',28999),(29000,251,44,'2900',4,'2999',29999),(30000,252,44,'300',3,'799',79999),(80000,253,44,'8000',4,'8999',89999),(90000,254,44,'90000',5,'92999',92999),(93000,255,44,'9300',4,'9999',99999),(0,256,45,'0000',4,'1999',19999),(20000,257,45,'20',2,'49',49999),(50000,258,45,'50000',5,'54999',54999),(55000,259,45,'550',3,'799',79999),(80000,260,45,'8000',4,'9499',94999),(95000,261,45,'95000',5,'99999',99999),(0,262,46,'00',2,'19',19999),(20000,263,46,'200',3,'699',69999),(70000,264,46,'7000',4,'9999',99999),(0,265,47,'00',2,'02',2999),(3000,266,47,'0300',4,'0499',4999),(5000,267,47,'05',2,'19',19999),(20000,268,47,'2000',4,'2099',20999),(21000,269,47,'21',2,'27',27999),(28000,270,47,'28000',5,'30999',30999),(31000,271,47,'31',2,'43',43999),(44000,272,47,'440',3,'819',81999),(82000,273,47,'8200',4,'9699',96999),(97000,274,47,'97000',5,'99999',99999),(0,275,48,'00',2,'56',56999),(57000,276,48,'57000',5,'59999',59999),(60000,277,48,'600',3,'799',79999),(80000,278,48,'8000',4,'9499',94999),(95000,279,48,'95000',5,'99999',99999),(0,280,49,'00',2,'19',19999),(20000,281,49,'200',3,'699',69999),(70000,282,49,'7000',4,'8499',84999),(85000,283,49,'85000',5,'99999',99999),(0,284,50,'00',2,'19',19999),(20000,285,50,'200',3,'659',65999),(66000,286,50,'6600',4,'6899',68999),(69000,287,50,'690',3,'699',69999),(70000,288,50,'7000',4,'8499',84999),(85000,289,50,'85000',5,'92999',92999),(93000,290,50,'93',2,'93',93999),(94000,291,50,'9400',4,'9799',97999),(98000,292,50,'98000',5,'99999',99999),(0,293,51,'00',2,'19',19999),(20000,294,51,'200',3,'599',59999),(60000,295,51,'6000',4,'8999',89999),(90000,296,51,'90000',5,'94999',94999),(0,297,52,'00',2,'19',19999),(20000,298,52,'200',3,'699',69999),(70000,299,52,'7000',4,'8499',84999),(85000,300,52,'85000',5,'86999',86999),(87000,301,52,'8700',4,'8999',89999),(90000,302,52,'900',3,'999',99999),(0,303,53,'00',2,'19',19999),(20000,304,53,'200',3,'699',69999),(70000,305,53,'7000',4,'8499',84999),(85000,306,53,'85000',5,'89999',89999),(90000,307,53,'9000',4,'9999',99999),(0,308,54,'00',2,'14',14999),(15000,309,54,'150',3,'249',24999),(25000,310,54,'2500',4,'2999',29999),(30000,311,54,'300',3,'549',54999),(55000,312,54,'5500',4,'8999',89999),(90000,313,54,'90000',5,'96999',96999),(97000,314,54,'970',3,'989',98999),(99000,315,54,'9900',4,'9999',99999),(0,316,55,'00',2,'19',19999),(20000,317,55,'200',3,'599',59999),(70000,318,55,'7000',4,'7999',79999),(90000,319,55,'90000',5,'99999',99999),(0,320,56,'00',2,'14',14999),(15000,321,56,'1500',4,'1699',16999),(17000,322,56,'170',3,'199',19999),(20000,323,56,'2000',4,'2999',29999),(30000,324,56,'300',3,'699',69999),(70000,325,56,'7000',4,'8999',89999),(90000,326,56,'90000',5,'99999',99999),(0,327,57,'00',2,'00',999),(1000,328,57,'0100',4,'0999',9999),(10000,329,57,'10000',5,'19999',19999),(30000,330,57,'300',3,'499',49999),(50000,331,57,'5000',4,'5999',59999),(60000,332,57,'60',2,'89',89999),(90000,333,57,'900',3,'989',98999),(99000,334,57,'9900',4,'9989',99899),(99900,335,57,'99900',5,'99999',99999),(1000,336,58,'01',2,'39',39999),(40000,337,58,'400',3,'499',49999),(50000,338,58,'5000',4,'7999',79999),(80000,339,58,'800',3,'899',89999),(90000,340,58,'9000',4,'9999',99999),(0,341,59,'0',1,'1',19999),(20000,342,59,'20',2,'39',39999),(40000,343,59,'400',3,'799',79999),(80000,344,59,'8000',4,'9999',99999),(1000,345,60,'01',2,'59',59999),(60000,346,60,'600',3,'899',89999),(90000,347,60,'9000',4,'9099',90999),(91000,348,60,'91000',5,'96999',96999),(97000,349,60,'9700',4,'9999',99999),(0,350,61,'000',3,'015',1599),(1600,351,61,'0160',4,'0199',1999),(2000,352,61,'02',2,'02',2999),(3000,353,61,'0300',4,'0599',5999),(6000,354,61,'06',2,'09',9999),(10000,355,61,'10',2,'49',49999),(50000,356,61,'500',3,'849',84999),(85000,357,61,'8500',4,'9099',90999),(91000,358,61,'91000',5,'98999',98999),(99000,359,61,'9900',4,'9999',99999),(0,360,62,'0',1,'1',19999),(20000,361,62,'20',2,'54',54999),(55000,362,62,'550',3,'799',79999),(80000,363,62,'8000',4,'9499',94999),(95000,364,62,'95000',5,'99999',99999),(0,365,63,'0',1,'0',9999),(10000,366,63,'100',3,'169',16999),(17000,367,63,'1700',4,'1999',19999),(20000,368,63,'20',2,'54',54999),(55000,369,63,'550',3,'759',75999),(76000,370,63,'7600',4,'8499',84999),(85000,371,63,'85000',5,'88999',88999),(89000,372,63,'8900',4,'9499',94999),(95000,373,63,'95000',5,'99999',99999),(0,374,64,'00',2,'19',19999),(20000,375,64,'200',3,'699',69999),(70000,376,64,'7000',4,'8499',84999),(85000,377,64,'85000',5,'89999',89999),(90000,378,64,'90000',5,'94999',94999),(95000,379,64,'9500',4,'9999',99999),(0,380,65,'00000',5,'01999',1999),(2000,381,65,'02',2,'24',24999),(25000,382,65,'250',3,'599',59999),(60000,383,65,'6000',4,'9199',91999),(92000,384,65,'92000',5,'98999',98999),(99000,385,65,'990',3,'999',99999),(0,386,66,'0',1,'3',39999),(40000,387,66,'40',2,'59',59999),(60000,388,66,'600',3,'799',79999),(80000,389,66,'8000',4,'9499',94999),(95000,390,66,'95000',5,'99999',99999),(0,391,67,'00',2,'19',19999),(20000,392,67,'200',3,'499',49999),(50000,393,67,'5000',4,'6999',69999),(70000,394,67,'700',3,'999',99999),(0,395,68,'000',3,'199',19999),(20000,396,68,'2000',4,'2999',29999),(30000,397,68,'30000',5,'79999',79999),(80000,398,68,'8000',4,'8999',89999),(90000,399,68,'900',3,'999',99999),(0,400,69,'000',3,'099',9999),(10000,401,69,'1000',4,'1499',14999),(15000,402,69,'15000',5,'19999',19999),(20000,403,69,'20',2,'29',29999),(30000,404,69,'3000',4,'3999',39999),(40000,405,69,'400',3,'799',79999),(80000,406,69,'8000',4,'9499',94999),(95000,407,69,'95000',5,'99999',99999),(0,408,70,'00',2,'19',19999),(20000,409,70,'200',3,'599',59999),(60000,410,70,'6000',4,'9999',99999),(0,411,71,'00',2,'11',11999),(12000,412,71,'1200',4,'1999',19999),(20000,413,71,'200',3,'289',28999),(29000,414,71,'2900',4,'9999',99999),(0,415,72,'00',2,'09',9999),(10000,416,72,'100',3,'699',69999),(70000,417,72,'70',2,'89',89999),(90000,418,72,'9000',4,'9799',97999),(98000,419,72,'98000',5,'99999',99999),(0,420,73,'00',2,'01',1999),(2000,421,73,'020',3,'199',19999),(20000,422,73,'2000',4,'3999',39999),(40000,423,73,'40000',5,'44999',44999),(45000,424,73,'45',2,'49',49999),(50000,425,73,'50',2,'79',79999),(80000,426,73,'800',3,'899',89999),(90000,427,73,'9000',4,'9899',98999),(99000,428,73,'99000',5,'99999',99999),(0,429,74,'00',2,'39',39999),(40000,430,74,'400',3,'799',79999),(80000,431,74,'8000',4,'8999',89999),(90000,432,74,'90000',5,'99999',99999),(0,433,75,'00',2,'39',39999),(40000,434,75,'400',3,'599',59999),(60000,435,75,'6000',4,'8999',89999),(90000,436,75,'90000',5,'99999',99999),(0,437,76,'00',2,'11',11999),(12000,438,76,'120',3,'559',55999),(56000,439,76,'5600',4,'7999',79999),(80000,440,76,'80000',5,'99999',99999),(0,441,77,'00',2,'09',9999),(10000,442,77,'1000',4,'1999',19999),(20000,443,77,'20000',5,'29999',29999),(30000,444,77,'30',2,'49',49999),(50000,445,77,'500',3,'899',89999),(90000,446,77,'9000',4,'9499',94999),(95000,447,77,'95000',5,'99999',99999),(0,448,78,'00',2,'14',14999),(15000,449,78,'15000',5,'16999',16999),(17000,450,78,'17000',5,'19999',19999),(20000,451,78,'200',3,'799',79999),(80000,452,78,'8000',4,'9699',96999),(97000,453,78,'97000',5,'99999',99999),(0,454,79,'0',1,'1',19999),(20000,455,79,'20',2,'54',54999),(55000,456,79,'550',3,'799',79999),(80000,457,79,'8000',4,'9499',94999),(95000,458,79,'95000',5,'99999',99999),(0,459,80,'00',2,'09',9999),(10000,460,80,'100',3,'399',39999),(40000,461,80,'4000',4,'4999',49999),(0,462,81,'00',2,'09',9999),(10000,463,81,'100',3,'399',39999),(40000,464,81,'4000',4,'4999',49999),(0,465,82,'0',1,'3',39999),(40000,466,82,'40',2,'54',54999),(55000,467,82,'550',3,'799',79999),(80000,468,82,'8000',4,'9999',99999),(0,469,83,'00',2,'49',49999),(50000,470,83,'500',3,'939',93999),(94000,471,83,'9400',4,'9999',99999),(0,472,84,'00',2,'29',29999),(30000,473,84,'300',3,'899',89999),(90000,474,84,'9000',4,'9999',99999),(0,475,85,'00',2,'39',39999),(40000,476,85,'400',3,'849',84999),(85000,477,85,'8500',4,'9999',99999),(0,478,86,'0',1,'0',9999),(10000,479,86,'10',2,'39',39999),(40000,480,86,'400',3,'899',89999),(90000,481,86,'9000',4,'9999',99999),(0,482,87,'0',1,'0',9999),(10000,483,87,'10',2,'49',49999),(50000,484,87,'500',3,'799',79999),(80000,485,87,'8000',4,'9999',99999),(0,486,88,'0',1,'0',9999),(10000,487,88,'10',2,'39',39999),(40000,488,88,'400',3,'899',89999),(90000,489,88,'9000',4,'9999',99999),(0,490,89,'0',1,'1',19999),(20000,491,89,'20',2,'39',39999),(40000,492,89,'400',3,'799',79999),(80000,493,89,'8000',4,'9999',99999),(0,494,90,'0',1,'2',29999),(30000,495,90,'30',2,'49',49999),(50000,496,90,'500',3,'799',79999),(80000,497,90,'8000',4,'9999',99999),(0,498,91,'00',2,'79',79999),(80000,499,91,'800',3,'949',94999),(95000,500,91,'9500',4,'9999',99999),(0,501,92,'0',1,'4',49999),(50000,502,92,'50',2,'79',79999),(80000,503,92,'800',3,'899',89999),(90000,504,92,'9000',4,'9999',99999),(0,505,93,'0',1,'1',19999),(20000,506,93,'20',2,'49',49999),(50000,507,93,'500',3,'899',89999),(90000,508,93,'9000',4,'9999',99999),(0,509,94,'0',1,'0',9999),(10000,510,94,'10',2,'39',39999),(40000,511,94,'400',3,'899',89999),(90000,512,94,'9000',4,'9999',99999),(0,513,95,'00',2,'89',89999),(90000,514,95,'900',3,'984',98499),(98500,515,95,'9850',4,'9999',99999),(0,516,96,'00',2,'29',29999),(30000,517,96,'300',3,'399',39999),(40000,518,96,'4000',4,'9999',99999),(0,519,97,'0000',4,'0999',9999),(10000,520,97,'100',3,'499',49999),(50000,521,97,'5000',4,'5999',59999),(60000,522,97,'60',2,'69',69999),(70000,523,97,'700',3,'799',79999),(80000,524,97,'80',2,'89',89999),(90000,525,97,'900',3,'999',99999),(0,526,98,'00',2,'00',999),(1000,527,98,'010',3,'079',7999),(8000,528,98,'08',2,'39',39999),(40000,529,98,'400',3,'569',56999),(57000,530,98,'57',2,'57',57999),(58000,531,98,'580',3,'849',84999),(85000,532,98,'8500',4,'9999',99999),(0,533,99,'0',1,'1',19999),(20000,534,99,'20',2,'39',39999),(40000,535,99,'400',3,'899',89999),(90000,536,99,'9000',4,'9999',99999),(0,537,100,'0',1,'1',19999),(20000,538,100,'20',2,'79',79999),(80000,539,100,'800',3,'999',99999),(0,540,101,'00',2,'39',39999),(40000,541,101,'400',3,'849',84999),(85000,542,101,'8500',4,'9999',99999),(0,543,102,'0',1,'0',9999),(10000,544,102,'10',2,'39',39999),(40000,545,102,'400',3,'899',89999),(90000,546,102,'9000',4,'9999',99999),(0,547,103,'00',2,'29',29999),(30000,548,103,'300',3,'849',84999),(85000,549,103,'8500',4,'9999',99999),(0,550,104,'00',2,'39',39999),(40000,551,104,'400',3,'849',84999),(85000,552,104,'8500',4,'9999',99999),(0,553,105,'0',1,'1',19999),(20000,554,105,'20',2,'39',39999),(40000,555,105,'400',3,'799',79999),(80000,556,105,'8000',4,'9999',99999),(0,557,106,'0',1,'0',9999),(10000,558,106,'10',2,'39',39999),(40000,559,106,'400',3,'599',59999),(60000,560,106,'60',2,'89',89999),(90000,561,106,'9000',4,'9999',99999),(0,562,107,'0',1,'1',19999),(20000,563,107,'20',2,'39',39999),(40000,564,107,'400',3,'799',79999),(80000,565,107,'8000',4,'9999',99999),(0,566,108,'00',2,'39',39999),(40000,567,108,'400',3,'929',92999),(93000,568,108,'9300',4,'9999',99999),(0,569,109,'0',1,'0',9999),(10000,570,109,'10',2,'39',39999),(40000,571,109,'400',3,'899',89999),(90000,572,109,'9000',4,'9999',99999),(0,573,110,'00',2,'39',39999),(40000,574,110,'400',3,'699',69999),(70000,575,110,'70',2,'84',84999),(85000,576,110,'8500',4,'8799',87999),(88000,577,110,'88',2,'99',99999),(0,578,111,'0',1,'0',9999),(10000,579,111,'10',2,'18',18999),(19000,580,111,'1900',4,'1999',19999),(20000,581,111,'20',2,'49',49999),(50000,582,111,'500',3,'899',89999),(90000,583,111,'9000',4,'9999',99999),(0,584,112,'0',1,'1',19999),(20000,585,112,'20',2,'79',79999),(80000,586,112,'800',3,'949',94999),(95000,587,112,'9500',4,'9999',99999),(0,588,113,'00',2,'59',59999),(60000,589,113,'600',3,'899',89999),(90000,590,113,'9000',4,'9999',99999),(0,591,114,'0',1,'2',29999),(30000,592,114,'30',2,'69',69999),(70000,593,114,'700',3,'949',94999),(95000,594,114,'9500',4,'9999',99999),(0,595,115,'00',2,'54',54999),(55000,596,115,'5500',4,'5599',55999),(56000,597,115,'56',2,'59',59999),(60000,598,115,'600',3,'849',84999),(85000,599,115,'8500',4,'9999',99999),(0,600,116,'0',1,'2',29999),(30000,601,116,'30',2,'54',54999),(55000,602,116,'550',3,'734',73499),(73500,603,116,'7350',4,'7499',74999),(75000,604,116,'7500',4,'9999',99999),(0,605,117,'0',1,'6',69999),(70000,606,117,'70',2,'94',94999),(95000,607,117,'950',3,'999',99999),(0,608,118,'00',2,'39',39999),(40000,609,118,'400',3,'899',89999),(90000,610,118,'9000',4,'9999',99999),(0,611,119,'000',3,'149',14999),(15000,612,119,'1500',4,'1999',19999),(20000,613,119,'20',2,'69',69999),(70000,614,119,'7000',4,'7499',74999),(75000,615,119,'750',3,'959',95999),(96000,616,119,'9600',4,'9999',99999),(0,617,120,'00',2,'39',39999),(40000,618,120,'400',3,'899',89999),(90000,619,120,'9000',4,'9999',99999),(0,620,121,'00',2,'49',49999),(50000,621,121,'500',3,'939',93999),(94000,622,121,'9400',4,'9999',99999),(0,623,122,'00',2,'39',39999),(40000,624,122,'400',3,'899',89999),(90000,625,122,'9000',4,'9999',99999),(0,626,123,'0',1,'5',59999),(60000,627,123,'60',2,'89',89999),(90000,628,123,'900',3,'989',98999),(99000,629,123,'9900',4,'9999',99999),(0,630,124,'00',2,'09',9999),(10000,631,124,'1',1,'1',19999),(20000,632,124,'200',3,'249',24999),(25000,633,124,'2500',4,'2999',29999),(30000,634,124,'30',2,'59',59999),(60000,635,124,'600',3,'899',89999),(90000,636,124,'9000',4,'9999',99999),(0,637,125,'00',2,'05',5999),(6000,638,125,'060',3,'089',8999),(9000,639,125,'0900',4,'0999',9999),(10000,640,125,'10',2,'69',69999),(70000,641,125,'700',3,'969',96999),(97000,642,125,'9700',4,'9999',99999),(0,643,126,'0',1,'2',29999),(30000,644,126,'30',2,'54',54999),(55000,645,126,'550',3,'749',74999),(75000,646,126,'7500',4,'9499',94999),(95000,647,126,'95',2,'99',99999),(0,648,127,'0',1,'0',9999),(10000,649,127,'100',3,'399',39999),(40000,650,127,'4000',4,'4499',44999),(45000,651,127,'45',2,'89',89999),(90000,652,127,'900',3,'949',94999),(95000,653,127,'9500',4,'9999',99999),(0,654,128,'0',1,'5',59999),(60000,655,128,'60',2,'89',89999),(90000,656,128,'900',3,'989',98999),(99000,657,128,'9900',4,'9999',99999),(0,658,129,'00',2,'89',89999),(90000,659,129,'900',3,'989',98999),(99000,660,129,'9900',4,'9999',99999),(0,661,130,'00',2,'29',29999),(30000,662,130,'300',3,'399',39999),(40000,663,130,'40',2,'94',94999),(95000,664,130,'950',3,'989',98999),(99000,665,130,'9900',4,'9999',99999),(0,666,131,'0',1,'4',49999),(50000,667,131,'50',2,'64',64999),(65000,668,131,'650',3,'659',65999),(66000,669,131,'66',2,'75',75999),(76000,670,131,'760',3,'899',89999),(90000,671,131,'9000',4,'9999',99999),(0,672,132,'0',1,'3',39999),(40000,673,132,'40',2,'89',89999),(90000,674,132,'900',3,'989',98999),(99000,675,132,'9900',4,'9999',99999),(0,676,133,'00',2,'09',9999),(10000,677,133,'100',3,'159',15999),(16000,678,133,'1600',4,'1999',19999),(20000,679,133,'20',2,'79',79999),(80000,680,133,'800',3,'949',94999),(95000,681,133,'9500',4,'9999',99999),(0,682,134,'00',2,'79',79999),(80000,683,134,'800',3,'989',98999),(99000,684,134,'9900',4,'9999',99999),(80000,685,135,'80',2,'94',94999),(95000,686,135,'950',3,'989',98999),(99000,687,135,'9900',4,'9999',99999),(0,688,136,'00',2,'49',49999),(50000,689,136,'500',3,'899',89999),(90000,690,136,'9000',4,'9999',99999),(0,691,137,'0',1,'4',49999),(50000,692,137,'50',2,'79',79999),(80000,693,137,'800',3,'899',89999),(90000,694,137,'9000',4,'9999',99999),(0,695,138,'00',2,'39',39999),(40000,696,138,'400',3,'899',89999),(90000,697,138,'9000',4,'9399',93999),(94000,698,138,'940',3,'969',96999),(97000,699,138,'97',2,'99',99999),(0,700,139,'00',2,'39',39999),(40000,701,139,'400',3,'879',87999),(88000,702,139,'8800',4,'9999',99999),(0,703,140,'0',1,'2',29999),(30000,704,140,'30',2,'54',54999),(55000,705,140,'550',3,'749',74999),(75000,706,140,'7500',4,'9999',99999),(0,707,141,'0',1,'0',9999),(10000,708,141,'100',3,'199',19999),(20000,709,141,'2000',4,'2999',29999),(30000,710,141,'30',2,'59',59999),(60000,711,141,'600',3,'949',94999),(95000,712,141,'9500',4,'9999',99999),(0,713,142,'00',2,'49',49999),(50000,714,142,'500',3,'799',79999),(80000,715,142,'80',2,'99',99999),(0,716,144,'0',1,'1',19999),(20000,717,144,'20',2,'89',89999),(90000,718,144,'900',3,'999',99999),(0,719,145,'0',1,'5',59999),(60000,720,145,'60',2,'89',89999),(90000,721,145,'900',3,'999',99999),(0,722,146,'0',1,'3',39999),(40000,723,146,'40',2,'79',79999),(80000,724,146,'800',3,'999',99999),(0,725,147,'0',1,'2',29999),(30000,726,147,'30',2,'59',59999),(60000,727,147,'600',3,'699',69999),(70000,728,147,'70',2,'89',89999),(90000,729,147,'90',2,'94',94999),(95000,730,147,'950',3,'999',99999),(0,731,148,'0',1,'0',9999),(10000,732,148,'10',2,'89',89999),(90000,733,148,'900',3,'999',99999),(0,734,149,'0',1,'3',39999),(40000,735,149,'40',2,'94',94999),(95000,736,149,'950',3,'999',99999),(0,737,150,'0',1,'2',29999),(30000,738,150,'30',2,'89',89999),(90000,739,150,'900',3,'999',99999),(0,740,151,'00',2,'59',59999),(60000,741,151,'600',3,'999',99999),(0,742,152,'0',1,'3',39999),(40000,743,152,'400',3,'599',59999),(60000,744,152,'60',2,'89',89999),(90000,745,152,'900',3,'999',99999),(0,746,153,'0',1,'2',29999),(30000,747,153,'30',2,'35',35999),(60000,748,153,'600',3,'604',60499),(0,749,154,'0',1,'4',49999),(50000,750,154,'50',2,'89',89999),(90000,751,154,'900',3,'999',99999),(0,752,155,'0',1,'4',49999),(50000,753,155,'50',2,'79',79999),(80000,754,155,'800',3,'999',99999),(0,755,156,'0',1,'2',29999),(30000,756,156,'30',2,'69',69999),(70000,757,156,'700',3,'999',99999),(0,758,157,'0',1,'2',29999),(30000,759,157,'30',2,'89',89999),(90000,760,157,'900',3,'999',99999),(0,761,158,'0',1,'3',39999),(40000,762,158,'40',2,'79',79999),(80000,763,158,'800',3,'999',99999),(0,764,159,'0',1,'2',29999),(30000,765,159,'300',3,'399',39999),(40000,766,159,'40',2,'69',69999),(90000,767,159,'900',3,'999',99999),(0,768,160,'0',1,'4',49999),(50000,769,160,'50',2,'89',89999),(90000,770,160,'900',3,'999',99999),(0,771,161,'0',1,'1',19999),(20000,772,161,'20',2,'69',69999),(70000,773,161,'700',3,'799',79999),(80000,774,161,'8',1,'8',89999),(90000,775,161,'90',2,'99',99999),(0,776,162,'0',1,'3',39999),(40000,777,162,'40',2,'69',69999),(70000,778,162,'700',3,'999',99999),(0,779,163,'0',1,'1',19999),(20000,780,163,'20',2,'79',79999),(80000,781,163,'800',3,'999',99999),(0,782,164,'0',1,'1',19999),(20000,783,164,'20',2,'79',79999),(80000,784,164,'800',3,'999',99999),(0,785,165,'0',1,'3',39999),(40000,786,165,'40',2,'79',79999),(80000,787,165,'800',3,'999',99999),(0,788,166,'0',1,'0',9999),(10000,789,166,'10',2,'59',59999),(60000,790,166,'600',3,'999',99999),(0,791,167,'0',1,'2',29999),(30000,792,167,'30',2,'59',59999),(60000,793,167,'600',3,'999',99999),(0,794,168,'0',1,'0',9999),(10000,795,168,'10',2,'79',79999),(80000,796,168,'800',3,'999',99999),(0,797,169,'0',1,'4',49999),(50000,798,169,'50',2,'79',79999),(80000,799,169,'800',3,'999',99999),(0,800,170,'0',1,'4',49999),(50000,801,170,'50',2,'79',79999),(80000,802,170,'800',3,'999',99999),(0,803,171,'0',1,'4',49999),(50000,804,171,'50',2,'79',79999),(80000,805,171,'800',3,'999',99999),(0,806,172,'0',1,'0',9999),(10000,807,172,'10',2,'59',59999),(60000,808,172,'600',3,'699',69999),(70000,809,172,'7',1,'7',79999),(80000,810,172,'80',2,'99',99999),(0,811,173,'0',1,'2',29999),(30000,812,173,'30',2,'59',59999),(60000,813,173,'600',3,'999',99999),(0,814,174,'0',1,'1',19999),(20000,815,174,'20',2,'79',79999),(80000,816,174,'800',3,'999',99999),(0,817,175,'0',1,'2',29999),(30000,818,175,'30',2,'59',59999),(60000,819,175,'600',3,'699',69999),(70000,820,175,'7',1,'8',89999),(90000,821,175,'90',2,'99',99999),(0,822,176,'0',1,'0',9999),(10000,823,176,'10',2,'59',59999),(60000,824,176,'600',3,'999',99999),(0,825,177,'0',1,'1',19999),(20000,826,177,'20',2,'59',59999),(60000,827,177,'600',3,'999',99999),(0,828,178,'0',1,'1',19999),(20000,829,178,'20',2,'59',59999),(60000,830,178,'600',3,'899',89999),(90000,831,178,'90',2,'99',99999),(0,832,179,'0',1,'5',59999),(60000,833,179,'60',2,'89',89999),(90000,834,179,'900',3,'999',99999),(0,835,180,'0',1,'0',9999),(10000,836,180,'10',2,'69',69999),(70000,837,180,'700',3,'999',99999),(0,838,181,'0',1,'2',29999),(30000,839,181,'30',2,'79',79999),(80000,840,181,'800',3,'999',99999),(0,841,182,'0',1,'4',49999),(50000,842,182,'50',2,'79',79999),(80000,843,182,'800',3,'999',99999),(0,844,183,'0',1,'2',29999),(30000,845,183,'30',2,'59',59999),(60000,846,183,'600',3,'999',99999),(0,847,184,'0',1,'4',49999),(50000,848,184,'50',2,'79',79999),(80000,849,184,'800',3,'999',99999),(0,850,185,'0',1,'5',59999),(60000,851,185,'60',2,'89',89999),(90000,852,185,'900',3,'999',99999),(0,853,186,'0',1,'2',29999),(30000,854,186,'30',2,'59',59999),(60000,855,186,'600',3,'999',99999),(0,856,187,'0',1,'2',29999),(30000,857,187,'30',2,'69',69999),(70000,858,187,'700',3,'999',99999),(0,859,188,'0',1,'4',49999),(50000,860,188,'50',2,'79',79999),(80000,861,188,'800',3,'999',99999),(0,862,189,'0',1,'1',19999),(20000,863,189,'20',2,'89',89999),(90000,864,189,'900',3,'999',99999),(0,865,190,'0',1,'4',49999),(50000,866,190,'50',2,'79',79999),(80000,867,190,'800',3,'999',99999),(0,868,192,'0',1,'4',49999),(50000,869,192,'50',2,'79',79999),(80000,870,192,'800',3,'999',99999),(0,871,193,'0',1,'2',29999),(30000,872,193,'30',2,'79',79999),(80000,873,193,'800',3,'939',93999),(94000,874,193,'94',2,'99',99999),(0,875,194,'0',1,'2',29999),(30000,876,194,'30',2,'69',69999),(70000,877,194,'700',3,'999',99999),(0,878,195,'0',1,'1',19999),(20000,879,195,'20',2,'59',59999),(60000,880,195,'600',3,'799',79999),(80000,881,195,'80',2,'89',89999),(90000,882,195,'90',2,'99',99999),(0,883,196,'00',2,'59',59999),(60000,884,196,'600',3,'859',85999),(86000,885,196,'86',2,'99',99999),(0,886,197,'0',1,'1',19999),(20000,887,197,'20',2,'79',79999),(80000,888,197,'800',3,'999',99999),(0,889,198,'0',1,'4',49999),(50000,890,198,'50',2,'94',94999),(95000,891,198,'950',3,'999',99999),(0,892,199,'0',1,'2',29999),(30000,893,199,'30',2,'59',59999),(60000,894,199,'600',3,'999',99999),(0,895,200,'0',1,'0',9999),(10000,896,200,'10',2,'94',94999),(95000,897,200,'950',3,'999',99999),(0,898,201,'0',1,'3',39999),(40000,899,201,'40',2,'89',89999),(90000,900,201,'900',3,'999',99999),(0,901,202,'0',1,'4',49999),(50000,902,202,'50',2,'79',79999),(80000,903,202,'800',3,'999',99999),(0,904,203,'00',2,'49',49999),(50000,905,203,'500',3,'999',99999),(0,906,204,'0',1,'1',19999),(20000,907,204,'20',2,'79',79999),(80000,908,204,'800',3,'999',99999),(0,909,205,'0',1,'3',39999),(40000,910,205,'40',2,'79',79999),(80000,911,205,'800',3,'999',99999),(0,912,206,'0',1,'2',29999),(30000,913,206,'30',2,'69',69999),(70000,914,206,'700',3,'799',79999),(0,915,207,'0',1,'1',19999),(20000,916,207,'20',2,'59',59999),(60000,917,207,'600',3,'899',89999),(0,918,208,'0',1,'3',39999),(40000,919,208,'400',3,'599',59999),(60000,920,208,'60',2,'89',89999),(90000,921,208,'900',3,'999',99999),(0,922,209,'00',2,'19',19999),(20000,923,209,'200',3,'699',69999),(70000,924,209,'7000',4,'8999',89999),(90000,925,209,'90000',5,'97599',97599),(97600,926,209,'976000',6,'999999',99999);
/*!40000 ALTER TABLE `ezisbn_registrant_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezkeyword`
--

DROP TABLE IF EXISTS `ezkeyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezkeyword` (
  `class_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezkeyword_keyword` (`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezkeyword`
--

LOCK TABLES `ezkeyword` WRITE;
/*!40000 ALTER TABLE `ezkeyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezkeyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezkeyword_attribute_link`
--

DROP TABLE IF EXISTS `ezkeyword_attribute_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezkeyword_attribute_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_id` int(11) NOT NULL DEFAULT '0',
  `objectattribute_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezkeyword_attr_link_kid_oaid` (`keyword_id`,`objectattribute_id`),
  KEY `ezkeyword_attr_link_oaid` (`objectattribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezkeyword_attribute_link`
--

LOCK TABLES `ezkeyword_attribute_link` WRITE;
/*!40000 ALTER TABLE `ezkeyword_attribute_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezkeyword_attribute_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezm_block`
--

DROP TABLE IF EXISTS `ezm_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezm_block` (
  `id` char(32) NOT NULL,
  `zone_id` char(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `node_id` int(10) unsigned NOT NULL,
  `overflow_id` char(32) DEFAULT NULL,
  `last_update` int(10) unsigned DEFAULT '0',
  `block_type` varchar(255) DEFAULT NULL,
  `fetch_params` longtext,
  `rotation_type` int(10) unsigned DEFAULT NULL,
  `rotation_interval` int(10) unsigned DEFAULT NULL,
  `is_removed` int(2) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezm_block__is_removed` (`is_removed`),
  KEY `ezm_block__node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezm_block`
--

LOCK TABLES `ezm_block` WRITE;
/*!40000 ALTER TABLE `ezm_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezm_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezm_pool`
--

DROP TABLE IF EXISTS `ezm_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezm_pool` (
  `block_id` char(32) NOT NULL,
  `object_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  `priority` int(10) unsigned DEFAULT '0',
  `ts_publication` int(11) DEFAULT '0',
  `ts_visible` int(10) unsigned DEFAULT '0',
  `ts_hidden` int(10) unsigned DEFAULT '0',
  `rotation_until` int(10) unsigned DEFAULT '0',
  `moved_to` char(32) DEFAULT NULL,
  PRIMARY KEY (`block_id`,`object_id`),
  KEY `ezm_pool__block_id__ts_publication__priority` (`block_id`,`ts_publication`,`priority`),
  KEY `ezm_pool__block_id__ts_visible` (`block_id`,`ts_visible`),
  KEY `ezm_pool__block_id__ts_hidden` (`block_id`,`ts_hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezm_pool`
--

LOCK TABLES `ezm_pool` WRITE;
/*!40000 ALTER TABLE `ezm_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezm_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezmedia`
--

DROP TABLE IF EXISTS `ezmedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezmedia` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT '0',
  `controls` varchar(50) DEFAULT NULL,
  `filename` varchar(255) NOT NULL DEFAULT '',
  `has_controller` int(11) DEFAULT '0',
  `height` int(11) DEFAULT NULL,
  `is_autoplay` int(11) DEFAULT '0',
  `is_loop` int(11) DEFAULT '0',
  `mime_type` varchar(50) NOT NULL DEFAULT '',
  `original_filename` varchar(255) NOT NULL DEFAULT '',
  `pluginspage` varchar(255) DEFAULT NULL,
  `quality` varchar(50) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  `width` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentobject_attribute_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezmedia`
--

LOCK TABLES `ezmedia` WRITE;
/*!40000 ALTER TABLE `ezmedia` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezmedia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezmessage`
--

DROP TABLE IF EXISTS `ezmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezmessage` (
  `body` longtext,
  `destination_address` varchar(50) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_sent` int(11) NOT NULL DEFAULT '0',
  `send_method` varchar(50) NOT NULL DEFAULT '',
  `send_time` varchar(50) NOT NULL DEFAULT '',
  `send_weekday` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezmessage`
--

LOCK TABLES `ezmessage` WRITE;
/*!40000 ALTER TABLE `ezmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezmodule_run`
--

DROP TABLE IF EXISTS `ezmodule_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezmodule_run` (
  `function_name` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_data` longtext,
  `module_name` varchar(255) DEFAULT NULL,
  `workflow_process_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezmodule_run_workflow_process_id_s` (`workflow_process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezmodule_run`
--

LOCK TABLES `ezmodule_run` WRITE;
/*!40000 ALTER TABLE `ezmodule_run` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezmodule_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezmultipricedata`
--

DROP TABLE IF EXISTS `ezmultipricedata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezmultipricedata` (
  `contentobject_attr_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_attr_version` int(11) NOT NULL DEFAULT '0',
  `currency_code` varchar(4) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL DEFAULT '0',
  `value` decimal(15,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `ezmultipricedata_coa_id` (`contentobject_attr_id`),
  KEY `ezmultipricedata_coa_version` (`contentobject_attr_version`),
  KEY `ezmultipricedata_currency_code` (`currency_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezmultipricedata`
--

LOCK TABLES `ezmultipricedata` WRITE;
/*!40000 ALTER TABLE `ezmultipricedata` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezmultipricedata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eznode_assignment`
--

DROP TABLE IF EXISTS `eznode_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eznode_assignment` (
  `contentobject_id` int(11) DEFAULT NULL,
  `contentobject_version` int(11) DEFAULT NULL,
  `from_node_id` int(11) DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_main` int(11) NOT NULL DEFAULT '0',
  `op_code` int(11) NOT NULL DEFAULT '0',
  `parent_node` int(11) DEFAULT NULL,
  `parent_remote_id` varchar(100) NOT NULL DEFAULT '',
  `remote_id` varchar(100) NOT NULL DEFAULT '0',
  `sort_field` int(11) DEFAULT '1',
  `sort_order` int(11) DEFAULT '1',
  `priority` int(11) NOT NULL DEFAULT '0',
  `is_hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `eznode_assignment_co_version` (`contentobject_version`),
  KEY `eznode_assignment_coid_cov` (`contentobject_id`,`contentobject_version`),
  KEY `eznode_assignment_is_main` (`is_main`),
  KEY `eznode_assignment_parent_node` (`parent_node`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eznode_assignment`
--

LOCK TABLES `eznode_assignment` WRITE;
/*!40000 ALTER TABLE `eznode_assignment` DISABLE KEYS */;
INSERT INTO `eznode_assignment` VALUES (8,2,0,4,1,2,5,'','0',1,1,0,0),(42,1,0,5,1,2,5,'','0',9,1,0,0),(10,2,-1,6,1,2,44,'','0',9,1,0,0),(4,1,0,7,1,2,1,'','0',1,1,0,0),(12,1,0,8,1,2,5,'','0',1,1,0,0),(13,1,0,9,1,2,5,'','0',1,1,0,0),(41,1,0,11,1,2,1,'','0',1,1,0,0),(11,1,0,12,1,2,5,'','0',1,1,0,0),(45,1,-1,16,1,2,1,'','0',9,1,0,0),(49,1,0,27,1,2,43,'','0',9,1,0,0),(50,1,0,28,1,2,43,'','0',9,1,0,0),(51,1,0,29,1,2,43,'','0',9,1,0,0),(52,1,0,30,1,2,48,'','0',1,1,0,0),(56,1,0,34,1,2,1,'','0',2,0,0,0),(14,3,-1,38,1,2,13,'','0',1,1,0,0),(54,2,-1,39,1,2,58,'','0',1,1,0,0),(52,1,0,40,1,2,2,'10d045e67f1593a76f041ed91d97f308','0',1,1,0,0),(53,1,0,41,1,2,54,'db6bb5fea3161cdc30445e1d4c095931','0',1,1,0,0),(54,1,0,42,1,2,54,'86f1e735f1c354db0d355982cf496fce','0',1,1,0,0),(55,1,0,43,1,2,54,'bd954a953cd64b85a22f33963452f868','0',1,1,0,0),(56,1,0,44,1,2,54,'a1ca1c8f2b316088065294c8e332ad0c','0',1,1,0,0),(57,1,0,45,1,2,54,'c3c005bd32750e9b04259479c28bf681','0',1,1,0,0),(58,1,0,46,1,2,54,'5aaf0e63469bec779b139b6c1078e43b','0',1,1,0,0),(59,1,0,47,1,2,54,'3ac8f94040d9a38a57138b498a508a2e','0',1,1,0,0),(60,1,0,48,1,2,54,'15c7bd3830fc7bab8420a323f58e6fac','0',1,1,0,0),(61,1,0,49,1,2,54,'d1898b61dd1710897df79da71396df83','0',1,1,0,0);
/*!40000 ALTER TABLE `eznode_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eznotificationcollection`
--

DROP TABLE IF EXISTS `eznotificationcollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eznotificationcollection` (
  `data_subject` longtext NOT NULL,
  `data_text` longtext NOT NULL,
  `event_id` int(11) NOT NULL DEFAULT '0',
  `handler` varchar(255) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transport` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eznotificationcollection`
--

LOCK TABLES `eznotificationcollection` WRITE;
/*!40000 ALTER TABLE `eznotificationcollection` DISABLE KEYS */;
/*!40000 ALTER TABLE `eznotificationcollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eznotificationcollection_item`
--

DROP TABLE IF EXISTS `eznotificationcollection_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eznotificationcollection_item` (
  `address` varchar(255) NOT NULL DEFAULT '',
  `collection_id` int(11) NOT NULL DEFAULT '0',
  `event_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `send_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eznotificationcollection_item`
--

LOCK TABLES `eznotificationcollection_item` WRITE;
/*!40000 ALTER TABLE `eznotificationcollection_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `eznotificationcollection_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eznotificationevent`
--

DROP TABLE IF EXISTS `eznotificationevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eznotificationevent` (
  `data_int1` int(11) NOT NULL DEFAULT '0',
  `data_int2` int(11) NOT NULL DEFAULT '0',
  `data_int3` int(11) NOT NULL DEFAULT '0',
  `data_int4` int(11) NOT NULL DEFAULT '0',
  `data_text1` longtext NOT NULL,
  `data_text2` longtext NOT NULL,
  `data_text3` longtext NOT NULL,
  `data_text4` longtext NOT NULL,
  `event_type_string` varchar(255) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eznotificationevent`
--

LOCK TABLES `eznotificationevent` WRITE;
/*!40000 ALTER TABLE `eznotificationevent` DISABLE KEYS */;
/*!40000 ALTER TABLE `eznotificationevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezoperation_memento`
--

DROP TABLE IF EXISTS `ezoperation_memento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezoperation_memento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `main` int(11) NOT NULL DEFAULT '0',
  `main_key` varchar(32) NOT NULL DEFAULT '',
  `memento_data` longtext NOT NULL,
  `memento_key` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`memento_key`),
  KEY `ezoperation_memento_memento_key_main` (`memento_key`,`main`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezoperation_memento`
--

LOCK TABLES `ezoperation_memento` WRITE;
/*!40000 ALTER TABLE `ezoperation_memento` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezoperation_memento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezorder`
--

DROP TABLE IF EXISTS `ezorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezorder` (
  `account_identifier` varchar(100) NOT NULL DEFAULT 'default',
  `created` int(11) NOT NULL DEFAULT '0',
  `data_text_1` longtext,
  `data_text_2` longtext,
  `email` varchar(150) DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ignore_vat` int(11) NOT NULL DEFAULT '0',
  `is_archived` int(11) NOT NULL DEFAULT '0',
  `is_temporary` int(11) NOT NULL DEFAULT '1',
  `order_nr` int(11) NOT NULL DEFAULT '0',
  `productcollection_id` int(11) NOT NULL DEFAULT '0',
  `status_id` int(11) DEFAULT '0',
  `status_modified` int(11) DEFAULT '0',
  `status_modifier_id` int(11) DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezorder_is_archived` (`is_archived`),
  KEY `ezorder_is_tmp` (`is_temporary`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezorder`
--

LOCK TABLES `ezorder` WRITE;
/*!40000 ALTER TABLE `ezorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezorder_item`
--

DROP TABLE IF EXISTS `ezorder_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezorder_item` (
  `description` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_vat_inc` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `price` float DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `vat_value` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezorder_item_order_id` (`order_id`),
  KEY `ezorder_item_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezorder_item`
--

LOCK TABLES `ezorder_item` WRITE;
/*!40000 ALTER TABLE `ezorder_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezorder_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezorder_nr_incr`
--

DROP TABLE IF EXISTS `ezorder_nr_incr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezorder_nr_incr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezorder_nr_incr`
--

LOCK TABLES `ezorder_nr_incr` WRITE;
/*!40000 ALTER TABLE `ezorder_nr_incr` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezorder_nr_incr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezorder_status`
--

DROP TABLE IF EXISTS `ezorder_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezorder_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL DEFAULT '',
  `status_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezorder_status_active` (`is_active`),
  KEY `ezorder_status_name` (`name`),
  KEY `ezorder_status_sid` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezorder_status`
--

LOCK TABLES `ezorder_status` WRITE;
/*!40000 ALTER TABLE `ezorder_status` DISABLE KEYS */;
INSERT INTO `ezorder_status` VALUES (1,1,'Pending',1),(2,1,'Processing',2),(3,1,'Delivered',3);
/*!40000 ALTER TABLE `ezorder_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezorder_status_history`
--

DROP TABLE IF EXISTS `ezorder_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezorder_status_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` int(11) NOT NULL DEFAULT '0',
  `modifier_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `status_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezorder_status_history_mod` (`modified`),
  KEY `ezorder_status_history_oid` (`order_id`),
  KEY `ezorder_status_history_sid` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezorder_status_history`
--

LOCK TABLES `ezorder_status_history` WRITE;
/*!40000 ALTER TABLE `ezorder_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezorder_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpackage`
--

DROP TABLE IF EXISTS `ezpackage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpackage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `install_date` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `version` varchar(30) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpackage`
--

LOCK TABLES `ezpackage` WRITE;
/*!40000 ALTER TABLE `ezpackage` DISABLE KEYS */;
INSERT INTO `ezpackage` VALUES (1,1301057838,'plain_site_data','1.0-1');
/*!40000 ALTER TABLE `ezpackage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpaymentobject`
--

DROP TABLE IF EXISTS `ezpaymentobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpaymentobject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `payment_string` varchar(255) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `workflowprocess_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpaymentobject`
--

LOCK TABLES `ezpaymentobject` WRITE;
/*!40000 ALTER TABLE `ezpaymentobject` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezpaymentobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpdf_export`
--

DROP TABLE IF EXISTS `ezpdf_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpdf_export` (
  `created` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `export_classes` varchar(255) DEFAULT NULL,
  `export_structure` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intro_text` longtext,
  `modified` int(11) DEFAULT NULL,
  `modifier_id` int(11) DEFAULT NULL,
  `pdf_filename` varchar(255) DEFAULT NULL,
  `show_frontpage` int(11) DEFAULT NULL,
  `site_access` varchar(255) DEFAULT NULL,
  `source_node_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `sub_text` longtext,
  `title` varchar(255) DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpdf_export`
--

LOCK TABLES `ezpdf_export` WRITE;
/*!40000 ALTER TABLE `ezpdf_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezpdf_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpending_actions`
--

DROP TABLE IF EXISTS `ezpending_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpending_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(64) NOT NULL DEFAULT '',
  `created` int(11) DEFAULT NULL,
  `param` longtext,
  PRIMARY KEY (`id`),
  KEY `ezpending_actions_action` (`action`),
  KEY `ezpending_actions_created` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpending_actions`
--

LOCK TABLES `ezpending_actions` WRITE;
/*!40000 ALTER TABLE `ezpending_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezpending_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpolicy`
--

DROP TABLE IF EXISTS `ezpolicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpolicy` (
  `function_name` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) DEFAULT NULL,
  `original_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezpolicy_original_id` (`original_id`),
  KEY `ezpolicy_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpolicy`
--

LOCK TABLES `ezpolicy` WRITE;
/*!40000 ALTER TABLE `ezpolicy` DISABLE KEYS */;
INSERT INTO `ezpolicy` VALUES ('*',317,'content',0,3),('login',319,'user',0,3),('read',328,'content',0,1),('login',331,'user',0,1),('*',332,'*',0,2),('read',333,'content',0,4);
/*!40000 ALTER TABLE `ezpolicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpolicy_limitation`
--

DROP TABLE IF EXISTS `ezpolicy_limitation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpolicy_limitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `policy_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `policy_id` (`policy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpolicy_limitation`
--

LOCK TABLES `ezpolicy_limitation` WRITE;
/*!40000 ALTER TABLE `ezpolicy_limitation` DISABLE KEYS */;
INSERT INTO `ezpolicy_limitation` VALUES (251,'Section',328),(252,'Section',329),(253,'SiteAccess',331),(254,'Class',333),(255,'Owner',333);
/*!40000 ALTER TABLE `ezpolicy_limitation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpolicy_limitation_value`
--

DROP TABLE IF EXISTS `ezpolicy_limitation_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpolicy_limitation_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `limitation_id` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezpolicy_limitation_value_val` (`value`),
  KEY `ezpolicy_limit_value_limit_id` (`limitation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=482 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpolicy_limitation_value`
--

LOCK TABLES `ezpolicy_limitation_value` WRITE;
/*!40000 ALTER TABLE `ezpolicy_limitation_value` DISABLE KEYS */;
INSERT INTO `ezpolicy_limitation_value` VALUES (477,251,'1'),(478,252,'1'),(479,253,'1766001124'),(480,254,'4'),(481,255,'1');
/*!40000 ALTER TABLE `ezpolicy_limitation_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpreferences`
--

DROP TABLE IF EXISTS `ezpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpreferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `ezpreferences_name` (`name`),
  KEY `ezpreferences_user_id_idx` (`user_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpreferences`
--

LOCK TABLES `ezpreferences` WRITE;
/*!40000 ALTER TABLE `ezpreferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezprest_authcode`
--

DROP TABLE IF EXISTS `ezprest_authcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezprest_authcode` (
  `client_id` varchar(200) NOT NULL DEFAULT '',
  `expirytime` bigint(20) NOT NULL DEFAULT '0',
  `id` varchar(200) NOT NULL DEFAULT '',
  `scope` varchar(200) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `authcode_client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezprest_authcode`
--

LOCK TABLES `ezprest_authcode` WRITE;
/*!40000 ALTER TABLE `ezprest_authcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezprest_authcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezprest_authorized_clients`
--

DROP TABLE IF EXISTS `ezprest_authorized_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezprest_authorized_clients` (
  `created` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rest_client_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_user` (`rest_client_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezprest_authorized_clients`
--

LOCK TABLES `ezprest_authorized_clients` WRITE;
/*!40000 ALTER TABLE `ezprest_authorized_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezprest_authorized_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezprest_clients`
--

DROP TABLE IF EXISTS `ezprest_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezprest_clients` (
  `client_id` varchar(200) DEFAULT NULL,
  `client_secret` varchar(200) DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `description` longtext,
  `endpoint_uri` varchar(200) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `owner_id` int(11) NOT NULL DEFAULT '0',
  `updated` int(11) NOT NULL DEFAULT '0',
  `version` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id_unique` (`client_id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezprest_clients`
--

LOCK TABLES `ezprest_clients` WRITE;
/*!40000 ALTER TABLE `ezprest_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezprest_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezprest_token`
--

DROP TABLE IF EXISTS `ezprest_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezprest_token` (
  `client_id` varchar(200) NOT NULL DEFAULT '',
  `expirytime` bigint(20) NOT NULL DEFAULT '0',
  `id` varchar(200) NOT NULL DEFAULT '',
  `refresh_token` varchar(200) NOT NULL DEFAULT '',
  `scope` varchar(200) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `token_client_id` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezprest_token`
--

LOCK TABLES `ezprest_token` WRITE;
/*!40000 ALTER TABLE `ezprest_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezprest_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezproductcategory`
--

DROP TABLE IF EXISTS `ezproductcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezproductcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezproductcategory`
--

LOCK TABLES `ezproductcategory` WRITE;
/*!40000 ALTER TABLE `ezproductcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezproductcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezproductcollection`
--

DROP TABLE IF EXISTS `ezproductcollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezproductcollection` (
  `created` int(11) DEFAULT NULL,
  `currency_code` varchar(4) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezproductcollection`
--

LOCK TABLES `ezproductcollection` WRITE;
/*!40000 ALTER TABLE `ezproductcollection` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezproductcollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezproductcollection_item`
--

DROP TABLE IF EXISTS `ezproductcollection_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezproductcollection_item` (
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `discount` float DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_vat_inc` int(11) DEFAULT NULL,
  `item_count` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `price` float DEFAULT '0',
  `productcollection_id` int(11) NOT NULL DEFAULT '0',
  `vat_value` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezproductcollection_item_contentobject_id` (`contentobject_id`),
  KEY `ezproductcollection_item_productcollection_id` (`productcollection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezproductcollection_item`
--

LOCK TABLES `ezproductcollection_item` WRITE;
/*!40000 ALTER TABLE `ezproductcollection_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezproductcollection_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezproductcollection_item_opt`
--

DROP TABLE IF EXISTS `ezproductcollection_item_opt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezproductcollection_item_opt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `object_attribute_id` int(11) DEFAULT NULL,
  `option_item_id` int(11) NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `ezproductcollection_item_opt_item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezproductcollection_item_opt`
--

LOCK TABLES `ezproductcollection_item_opt` WRITE;
/*!40000 ALTER TABLE `ezproductcollection_item_opt` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezproductcollection_item_opt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezpublishingqueueprocesses`
--

DROP TABLE IF EXISTS `ezpublishingqueueprocesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezpublishingqueueprocesses` (
  `created` int(11) DEFAULT NULL,
  `ezcontentobject_version_id` int(11) NOT NULL DEFAULT '0',
  `finished` int(11) DEFAULT NULL,
  `pid` int(8) DEFAULT NULL,
  `started` int(11) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`ezcontentobject_version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezpublishingqueueprocesses`
--

LOCK TABLES `ezpublishingqueueprocesses` WRITE;
/*!40000 ALTER TABLE `ezpublishingqueueprocesses` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezpublishingqueueprocesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezrole`
--

DROP TABLE IF EXISTS `ezrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_new` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` char(1) DEFAULT NULL,
  `version` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezrole`
--

LOCK TABLES `ezrole` WRITE;
/*!40000 ALTER TABLE `ezrole` DISABLE KEYS */;
INSERT INTO `ezrole` VALUES (1,0,'Anonymous','',0),(2,0,'Administrator','0',0),(3,0,'Editor','',0),(4,0,'Member','',0);
/*!40000 ALTER TABLE `ezrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezrss_export`
--

DROP TABLE IF EXISTS `ezrss_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezrss_export` (
  `access_url` varchar(255) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `description` longtext,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_id` int(11) DEFAULT NULL,
  `main_node_only` int(11) NOT NULL DEFAULT '1',
  `modified` int(11) DEFAULT NULL,
  `modifier_id` int(11) DEFAULT NULL,
  `node_id` int(11) DEFAULT NULL,
  `number_of_objects` int(11) NOT NULL DEFAULT '0',
  `rss_version` varchar(255) DEFAULT NULL,
  `site_access` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezrss_export`
--

LOCK TABLES `ezrss_export` WRITE;
/*!40000 ALTER TABLE `ezrss_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezrss_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezrss_export_item`
--

DROP TABLE IF EXISTS `ezrss_export_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezrss_export_item` (
  `category` varchar(255) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `enclosure` varchar(255) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rssexport_id` int(11) DEFAULT NULL,
  `source_node_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `subnodes` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`status`),
  KEY `ezrss_export_rsseid` (`rssexport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezrss_export_item`
--

LOCK TABLES `ezrss_export_item` WRITE;
/*!40000 ALTER TABLE `ezrss_export_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezrss_export_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezrss_import`
--

DROP TABLE IF EXISTS `ezrss_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezrss_import` (
  `active` int(11) DEFAULT NULL,
  `class_description` varchar(255) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `class_title` varchar(255) DEFAULT NULL,
  `class_url` varchar(255) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `destination_node_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `import_description` longtext NOT NULL,
  `modified` int(11) DEFAULT NULL,
  `modifier_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `object_owner_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `url` longtext,
  PRIMARY KEY (`id`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezrss_import`
--

LOCK TABLES `ezrss_import` WRITE;
/*!40000 ALTER TABLE `ezrss_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezrss_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezscheduled_script`
--

DROP TABLE IF EXISTS `ezscheduled_script`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezscheduled_script` (
  `command` varchar(255) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_report_timestamp` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `process_id` int(11) NOT NULL DEFAULT '0',
  `progress` int(3) DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezscheduled_script_timestamp` (`last_report_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezscheduled_script`
--

LOCK TABLES `ezscheduled_script` WRITE;
/*!40000 ALTER TABLE `ezscheduled_script` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezscheduled_script` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsearch_object_word_link`
--

DROP TABLE IF EXISTS `ezsearch_object_word_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsearch_object_word_link` (
  `contentclass_attribute_id` int(11) NOT NULL DEFAULT '0',
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `frequency` float NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `integer_value` int(11) NOT NULL DEFAULT '0',
  `next_word_id` int(11) NOT NULL DEFAULT '0',
  `placement` int(11) NOT NULL DEFAULT '0',
  `prev_word_id` int(11) NOT NULL DEFAULT '0',
  `published` int(11) NOT NULL DEFAULT '0',
  `section_id` int(11) NOT NULL DEFAULT '0',
  `word_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezsearch_object_word_link_frequency` (`frequency`),
  KEY `ezsearch_object_word_link_identifier` (`identifier`),
  KEY `ezsearch_object_word_link_integer_value` (`integer_value`),
  KEY `ezsearch_object_word_link_object` (`contentobject_id`),
  KEY `ezsearch_object_word_link_word` (`word_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8073 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsearch_object_word_link`
--

LOCK TABLES `ezsearch_object_word_link` WRITE;
/*!40000 ALTER TABLE `ezsearch_object_word_link` DISABLE KEYS */;
INSERT INTO `ezsearch_object_word_link` VALUES (4,1,1,0,6798,'name',0,2104,0,0,1448889046,1,2103),(4,1,1,0,6799,'name',0,2105,1,2103,1448889046,1,2104),(4,1,1,0,6800,'name',0,2106,2,2104,1448889046,1,2105),(4,1,1,0,6801,'name',0,2107,3,2105,1448889046,1,2106),(119,1,1,0,6802,'short_description',0,2108,4,2106,1448889046,1,2107),(119,1,1,0,6803,'short_description',0,2109,5,2107,1448889046,1,2108),(119,1,1,0,6804,'short_description',0,2110,6,2108,1448889046,1,2109),(119,1,1,0,6805,'short_description',0,2111,7,2109,1448889046,1,2110),(119,1,1,0,6806,'short_description',0,2112,8,2110,1448889046,1,2111),(119,1,1,0,6807,'short_description',0,2113,9,2111,1448889046,1,2112),(119,1,1,0,6808,'short_description',0,2105,10,2112,1448889046,1,2113),(119,1,1,0,6809,'short_description',0,2106,11,2113,1448889046,1,2105),(119,1,1,0,6810,'short_description',0,2114,12,2105,1448889046,1,2106),(119,1,1,0,6811,'short_description',0,2115,13,2106,1448889046,1,2114),(119,1,1,0,6812,'short_description',0,2116,14,2114,1448889046,1,2115),(119,1,1,0,6813,'short_description',0,2117,15,2115,1448889046,1,2116),(119,1,1,0,6814,'short_description',0,2118,16,2116,1448889046,1,2117),(119,1,1,0,6815,'short_description',0,2119,17,2117,1448889046,1,2118),(119,1,1,0,6816,'short_description',0,2109,18,2118,1448889046,1,2119),(119,1,1,0,6817,'short_description',0,2106,19,2119,1448889046,1,2109),(119,1,1,0,6818,'short_description',0,2120,20,2109,1448889046,1,2106),(119,1,1,0,6819,'short_description',0,2121,21,2106,1448889046,1,2120),(119,1,1,0,6820,'short_description',0,2122,22,2120,1448889046,1,2121),(119,1,1,0,6821,'short_description',0,2104,23,2121,1448889046,1,2122),(119,1,1,0,6822,'short_description',0,2123,24,2122,1448889046,1,2104),(119,1,1,0,6823,'short_description',0,2124,25,2104,1448889046,1,2123),(119,1,1,0,6824,'short_description',0,2125,26,2123,1448889046,1,2124),(119,1,1,0,6825,'short_description',0,2126,27,2124,1448889046,1,2125),(119,1,1,0,6826,'short_description',0,2127,28,2125,1448889046,1,2126),(119,1,1,0,6827,'short_description',0,2104,29,2126,1448889046,1,2127),(119,1,1,0,6828,'short_description',0,2123,30,2127,1448889046,1,2104),(119,1,1,0,6829,'short_description',0,2128,31,2104,1448889046,1,2123),(119,1,1,0,6830,'short_description',0,2129,32,2123,1448889046,1,2128),(119,1,1,0,6831,'short_description',0,2130,33,2128,1448889046,1,2129),(119,1,1,0,6832,'short_description',0,2131,34,2129,1448889046,1,2130),(119,1,1,0,6833,'short_description',0,2132,35,2130,1448889046,1,2131),(119,1,1,0,6834,'short_description',0,2104,36,2131,1448889046,1,2132),(119,1,1,0,6835,'short_description',0,2133,37,2132,1448889046,1,2104),(119,1,1,0,6836,'short_description',0,2134,38,2104,1448889046,1,2133),(119,1,1,0,6837,'short_description',0,2135,39,2133,1448889046,1,2134),(119,1,1,0,6838,'short_description',0,2136,40,2134,1448889046,1,2135),(119,1,1,0,6839,'short_description',0,2137,41,2135,1448889046,1,2136),(119,1,1,0,6840,'short_description',0,2138,42,2136,1448889046,1,2137),(119,1,1,0,6841,'short_description',0,2139,43,2137,1448889046,1,2138),(119,1,1,0,6842,'short_description',0,2140,44,2138,1448889046,1,2139),(119,1,1,0,6843,'short_description',0,2109,45,2139,1448889046,1,2140),(119,1,1,0,6844,'short_description',0,2141,46,2140,1448889046,1,2109),(119,1,1,0,6845,'short_description',0,2105,47,2109,1448889046,1,2141),(155,1,1,0,6846,'short_name',0,2106,48,2141,1448889046,1,2105),(155,1,1,0,6847,'short_name',0,2103,49,2105,1448889046,1,2106),(156,1,1,0,6848,'description',0,2104,50,2106,1448889046,1,2103),(156,1,1,0,6849,'description',0,2105,51,2103,1448889046,1,2104),(156,1,1,0,6850,'description',0,2106,52,2104,1448889046,1,2105),(156,1,1,0,6851,'description',0,2142,53,2105,1448889046,1,2106),(156,1,1,0,6852,'description',0,2126,54,2106,1448889046,1,2142),(156,1,1,0,6853,'description',0,2143,55,2142,1448889046,1,2126),(156,1,1,0,6854,'description',0,2144,56,2126,1448889046,1,2143),(156,1,1,0,6855,'description',0,2105,57,2143,1448889046,1,2144),(156,1,1,0,6856,'description',0,2106,58,2144,1448889046,1,2105),(156,1,1,0,6857,'description',0,2105,59,2105,1448889046,1,2106),(156,1,1,0,6858,'description',0,2106,60,2106,1448889046,1,2105),(156,1,1,0,6859,'description',0,2108,61,2105,1448889046,1,2106),(156,1,1,0,6860,'description',0,2109,62,2106,1448889046,1,2108),(156,1,1,0,6861,'description',0,2145,63,2108,1448889046,1,2109),(156,1,1,0,6862,'description',0,2146,64,2109,1448889046,1,2145),(156,1,1,0,6863,'description',0,2147,65,2145,1448889046,1,2146),(156,1,1,0,6864,'description',0,2148,66,2146,1448889046,1,2147),(156,1,1,0,6865,'description',0,2106,67,2147,1448889046,1,2148),(156,1,1,0,6866,'description',0,2128,68,2148,1448889046,1,2106),(156,1,1,0,6867,'description',0,2105,69,2106,1448889046,1,2128),(156,1,1,0,6868,'description',0,2149,70,2128,1448889046,1,2105),(156,1,1,0,6869,'description',0,2150,71,2105,1448889046,1,2149),(156,1,1,0,6870,'description',0,2109,72,2149,1448889046,1,2150),(156,1,1,0,6871,'description',0,2105,73,2150,1448889046,1,2109),(156,1,1,0,6872,'description',0,2151,74,2109,1448889046,1,2105),(156,1,1,0,6873,'description',0,2152,75,2105,1448889046,1,2151),(156,1,1,0,6874,'description',0,2105,76,2151,1448889046,1,2152),(156,1,1,0,6875,'description',0,2153,77,2152,1448889046,1,2105),(156,1,1,0,6876,'description',0,2154,78,2105,1448889046,1,2153),(156,1,1,0,6877,'description',0,2155,79,2153,1448889046,1,2154),(156,1,1,0,6878,'description',0,2156,80,2154,1448889046,1,2155),(156,1,1,0,6879,'description',0,2157,81,2155,1448889046,1,2156),(156,1,1,0,6880,'description',0,2158,82,2156,1448889046,1,2157),(156,1,1,0,6881,'description',0,2159,83,2157,1448889046,1,2158),(156,1,1,0,6882,'description',0,2140,84,2158,1448889046,1,2159),(156,1,1,0,6883,'description',0,2160,85,2159,1448889046,1,2140),(156,1,1,0,6884,'description',0,2109,86,2140,1448889046,1,2160),(156,1,1,0,6885,'description',0,2161,87,2160,1448889046,1,2109),(156,1,1,0,6886,'description',0,2162,88,2109,1448889046,1,2161),(156,1,1,0,6887,'description',0,2163,89,2161,1448889046,1,2162),(156,1,1,0,6888,'description',0,2164,90,2162,1448889046,1,2163),(156,1,1,0,6889,'description',0,2130,91,2163,1448889046,1,2164),(156,1,1,0,6890,'description',0,2105,92,2164,1448889046,1,2130),(156,1,1,0,6891,'description',0,2106,93,2130,1448889046,1,2105),(156,1,1,0,6892,'description',0,2150,94,2105,1448889046,1,2106),(156,1,1,0,6893,'description',0,2105,95,2106,1448889046,1,2150),(156,1,1,0,6894,'description',0,2165,96,2150,1448889046,1,2105),(156,1,1,0,6895,'description',0,2166,97,2105,1448889046,1,2165),(156,1,1,0,6896,'description',0,2167,98,2165,1448889046,1,2166),(156,1,1,0,6897,'description',0,2130,99,2166,1448889046,1,2167),(156,1,1,0,6898,'description',0,2105,100,2167,1448889046,1,2130),(156,1,1,0,6899,'description',0,2106,101,2130,1448889046,1,2105),(156,1,1,0,6900,'description',0,2150,102,2105,1448889046,1,2106),(156,1,1,0,6901,'description',0,2105,103,2106,1448889046,1,2150),(156,1,1,0,6902,'description',0,2153,104,2150,1448889046,1,2105),(156,1,1,0,6903,'description',0,2106,105,2105,1448889046,1,2153),(156,1,1,0,6904,'description',0,2145,106,2153,1448889046,1,2106),(156,1,1,0,6905,'description',0,2168,107,2106,1448889046,1,2145),(156,1,1,0,6906,'description',0,2105,108,2145,1448889046,1,2168),(156,1,1,0,6907,'description',0,2106,109,2168,1448889046,1,2105),(156,1,1,0,6908,'description',0,2169,110,2105,1448889046,1,2106),(156,1,1,0,6909,'description',0,2170,111,2106,1448889046,1,2169),(156,1,1,0,6910,'description',0,2171,112,2169,1448889046,1,2170),(156,1,1,0,6911,'description',0,2172,113,2170,1448889046,1,2171),(156,1,1,0,6912,'description',0,2173,114,2171,1448889046,1,2172),(156,1,1,0,6913,'description',0,2105,115,2172,1448889046,1,2173),(156,1,1,0,6914,'description',0,2106,116,2173,1448889046,1,2105),(156,1,1,0,6915,'description',0,2150,117,2105,1448889046,1,2106),(156,1,1,0,6916,'description',0,2105,118,2106,1448889046,1,2150),(156,1,1,0,6917,'description',0,2153,119,2150,1448889046,1,2105),(156,1,1,0,6918,'description',0,2106,120,2105,1448889046,1,2153),(156,1,1,0,6919,'description',0,2174,121,2153,1448889046,1,2106),(156,1,1,0,6920,'description',0,2104,122,2106,1448889046,1,2174),(156,1,1,0,6921,'description',0,2109,123,2174,1448889046,1,2104),(156,1,1,0,6922,'description',0,2175,124,2104,1448889046,1,2109),(156,1,1,0,6923,'description',0,2176,125,2109,1448889046,1,2175),(156,1,1,0,6924,'description',0,2109,126,2175,1448889046,1,2176),(156,1,1,0,6925,'description',0,2151,127,2176,1448889046,1,2109),(156,1,1,0,6926,'description',0,2177,128,2109,1448889046,1,2151),(156,1,1,0,6927,'description',0,2178,129,2151,1448889046,1,2177),(156,1,1,0,6928,'description',0,2179,130,2177,1448889046,1,2178),(156,1,1,0,6929,'description',0,2104,131,2178,1448889046,1,2179),(156,1,1,0,6930,'description',0,2109,132,2179,1448889046,1,2104),(156,1,1,0,6931,'description',0,2180,133,2104,1448889046,1,2109),(156,1,1,0,6932,'description',0,2181,134,2109,1448889046,1,2180),(156,1,1,0,6933,'description',0,2104,135,2180,1448889046,1,2181),(156,1,1,0,6934,'description',0,2109,136,2181,1448889046,1,2104),(156,1,1,0,6935,'description',0,2151,137,2104,1448889046,1,2109),(156,1,1,0,6936,'description',0,2182,138,2109,1448889046,1,2151),(156,1,1,0,6937,'description',0,2183,139,2151,1448889046,1,2182),(156,1,1,0,6938,'description',0,2105,140,2182,1448889046,1,2183),(156,1,1,0,6939,'description',0,2184,141,2183,1448889046,1,2105),(156,1,1,0,6940,'description',0,2109,142,2105,1448889046,1,2184),(156,1,1,0,6941,'description',0,2151,143,2184,1448889046,1,2109),(156,1,1,0,6942,'description',0,2185,144,2109,1448889046,1,2151),(156,1,1,0,6943,'description',0,2104,145,2151,1448889046,1,2185),(156,1,1,0,6944,'description',0,2186,146,2185,1448889046,1,2104),(156,1,1,0,6945,'description',0,2187,147,2104,1448889046,1,2186),(156,1,1,0,6946,'description',0,2188,148,2186,1448889046,1,2187),(156,1,1,0,6947,'description',0,2150,149,2187,1448889046,1,2188),(156,1,1,0,6948,'description',0,2189,150,2188,1448889046,1,2150),(156,1,1,0,6949,'description',0,2176,151,2150,1448889046,1,2189),(156,1,1,0,6950,'description',0,2109,152,2189,1448889046,1,2176),(156,1,1,0,6951,'description',0,2190,153,2176,1448889046,1,2109),(156,1,1,0,6952,'description',0,2182,154,2109,1448889046,1,2190),(156,1,1,0,6953,'description',0,2109,155,2190,1448889046,1,2182),(156,1,1,0,6954,'description',0,2105,156,2182,1448889046,1,2109),(156,1,1,0,6955,'description',0,2151,157,2109,1448889046,1,2105),(156,1,1,0,6956,'description',0,2191,158,2105,1448889046,1,2151),(156,1,1,0,6957,'description',0,2192,159,2151,1448889046,1,2191),(156,1,1,0,6958,'description',0,2193,160,2191,1448889046,1,2192),(156,1,1,0,6959,'description',0,0,161,2192,1448889046,1,2193),(7,3,4,0,6960,'description',0,2195,0,0,1033917596,2,2194),(7,3,4,0,6961,'description',0,2196,1,2194,1033917596,2,2195),(6,3,4,0,6962,'name',0,0,2,2195,1033917596,2,2196),(8,4,10,0,6963,'first_name',0,2163,0,0,1033920665,2,2197),(9,4,10,0,6964,'last_name',0,0,1,2197,1033920665,2,2163),(6,3,11,0,6965,'name',0,2199,0,0,1033920746,2,2198),(6,3,11,0,6966,'name',0,0,1,2198,1033920746,2,2199),(6,3,12,0,6967,'name',0,2196,0,0,1033920775,2,2200),(6,3,12,0,6968,'name',0,0,1,2200,1033920775,2,2196),(6,3,13,0,6969,'name',0,0,0,0,1033920794,2,2201),(8,4,14,0,6970,'first_name',0,2163,0,0,1033920830,2,2200),(9,4,14,0,6971,'last_name',0,0,1,2200,1033920830,2,2163),(4,1,41,0,6972,'name',0,0,0,0,1060695457,3,2202),(6,3,42,0,6973,'name',0,2196,0,0,1072180330,2,2197),(6,3,42,0,6974,'name',0,2163,1,2197,1072180330,2,2196),(7,3,42,0,6975,'description',0,2195,2,2196,1072180330,2,2163),(7,3,42,0,6976,'description',0,2130,3,2163,1072180330,2,2195),(7,3,42,0,6977,'description',0,2109,4,2195,1072180330,2,2130),(7,3,42,0,6978,'description',0,2197,5,2130,1072180330,2,2109),(7,3,42,0,6979,'description',0,2163,6,2109,1072180330,2,2197),(7,3,42,0,6980,'description',0,0,7,2197,1072180330,2,2163),(4,1,45,0,6981,'name',0,0,0,0,1079684190,4,2118),(4,1,49,0,6982,'name',0,0,0,0,1080220197,3,2203),(4,1,50,0,6983,'name',0,0,0,0,1080220220,3,2204),(4,1,51,0,6984,'name',0,0,0,0,1080220233,3,2205),(4,1,52,0,6985,'name',0,2206,0,0,1493040495,1,2206),(155,1,52,0,6986,'short_name',0,0,1,2206,1493040495,1,2206),(181,13,61,0,7562,'title',0,2512,0,0,1493043498,1,2120),(181,13,61,0,7563,'title',0,2115,1,2120,1493043498,1,2512),(181,13,61,0,7564,'title',0,2172,2,2512,1493043498,1,2115),(181,13,61,0,7565,'title',0,2104,3,2115,1493043498,1,2172),(181,13,61,0,7566,'title',0,2261,4,2172,1493043498,1,2104),(181,13,61,0,7567,'title',0,2182,5,2104,1493043498,1,2261),(181,13,61,0,7568,'title',0,2513,6,2261,1493043498,1,2182),(181,13,61,0,7569,'title',0,2514,7,2182,1493043498,1,2513),(183,13,61,0,7570,'description',0,2515,8,2513,1493043498,1,2514),(183,13,61,0,7571,'description',0,2516,9,2514,1493043498,1,2515),(183,13,61,0,7572,'description',0,2334,10,2515,1493043498,1,2516),(183,13,61,0,7573,'description',0,2517,11,2516,1493043498,1,2334),(183,13,61,0,7574,'description',0,2518,12,2334,1493043498,1,2517),(183,13,61,0,7575,'description',0,2519,13,2517,1493043498,1,2518),(183,13,61,0,7576,'description',0,2290,14,2518,1493043498,1,2519),(183,13,61,0,7577,'description',0,2120,15,2519,1493043498,1,2290),(183,13,61,0,7578,'description',0,2512,16,2290,1493043498,1,2120),(183,13,61,0,7579,'description',0,2150,17,2120,1493043498,1,2512),(183,13,61,0,7580,'description',0,2334,18,2512,1493043498,1,2150),(183,13,61,0,7581,'description',0,2520,19,2150,1493043498,1,2334),(183,13,61,0,7582,'description',0,2521,20,2334,1493043498,1,2520),(183,13,61,0,7583,'description',0,2522,21,2520,1493043498,1,2521),(183,13,61,0,7584,'description',0,2523,22,2521,1493043498,1,2522),(183,13,61,0,7585,'description',0,2524,23,2522,1493043498,1,2523),(183,13,61,0,7586,'description',0,2264,24,2523,1493043498,1,2524),(183,13,61,0,7587,'description',0,2525,25,2524,1493043498,1,2264),(183,13,61,0,7588,'description',0,2526,26,2264,1493043498,1,2525),(183,13,61,0,7589,'description',0,2107,27,2525,1493043498,1,2526),(183,13,61,0,7590,'description',0,2232,28,2526,1493043498,1,2107),(183,13,61,0,7591,'description',0,2379,29,2107,1493043498,1,2232),(183,13,61,0,7592,'description',0,2334,30,2232,1493043498,1,2379),(183,13,61,0,7593,'description',0,2527,31,2379,1493043498,1,2334),(183,13,61,0,7594,'description',0,2244,32,2334,1493043498,1,2527),(183,13,61,0,7595,'description',0,2116,33,2527,1493043498,1,2244),(183,13,61,0,7596,'description',0,2525,34,2244,1493043498,1,2116),(183,13,61,0,7597,'description',0,2528,35,2116,1493043498,1,2525),(183,13,61,0,7598,'description',0,2113,36,2525,1493043498,1,2528),(183,13,61,0,7599,'description',0,2116,37,2528,1493043498,1,2113),(183,13,61,0,7600,'description',0,2529,38,2113,1493043498,1,2116),(183,13,61,0,7601,'description',0,2530,39,2116,1493043498,1,2529),(183,13,61,0,7602,'description',0,2531,40,2529,1493043498,1,2530),(183,13,61,0,7603,'description',0,2532,41,2530,1493043498,1,2531),(183,13,61,0,7604,'description',0,2119,42,2531,1493043498,1,2532),(183,13,61,0,7605,'description',0,2116,43,2532,1493043498,1,2119),(183,13,61,0,7606,'description',0,2396,44,2119,1493043498,1,2116),(183,13,61,0,7607,'description',0,2533,45,2116,1493043498,1,2396),(183,13,61,0,7608,'description',0,2534,46,2396,1493043498,1,2533),(183,13,61,0,7609,'description',0,2535,47,2533,1493043498,1,2534),(183,13,61,0,7610,'description',0,2116,48,2534,1493043498,1,2535),(183,13,61,0,7611,'description',0,2536,49,2535,1493043498,1,2116),(183,13,61,0,7612,'description',0,2427,50,2116,1493043498,1,2536),(183,13,61,0,7613,'description',0,2537,51,2536,1493043498,1,2427),(183,13,61,0,7614,'description',0,2538,52,2427,1493043498,1,2537),(183,13,61,0,7615,'description',0,2534,53,2537,1493043498,1,2538),(183,13,61,0,7616,'description',0,2539,54,2538,1493043498,1,2534),(183,13,61,0,7617,'description',0,2104,55,2534,1493043498,1,2539),(183,13,61,0,7618,'description',0,2109,56,2539,1493043498,1,2104),(183,13,61,0,7619,'description',0,2540,57,2104,1493043498,1,2109),(183,13,61,0,7620,'description',0,2119,58,2109,1493043498,1,2540),(183,13,61,0,7621,'description',0,2120,59,2540,1493043498,1,2119),(183,13,61,0,7622,'description',0,2541,60,2119,1493043498,1,2120),(183,13,61,0,7623,'description',0,2542,61,2120,1493043498,1,2541),(183,13,61,0,7624,'description',0,2429,62,2541,1493043498,1,2542),(187,13,61,0,7625,'category',0,0,63,2542,1493043498,1,2429),(181,13,60,0,7626,'title',0,2410,0,0,1493043378,1,2543),(181,13,60,0,7627,'title',0,2544,1,2543,1493043378,1,2410),(183,13,60,0,7628,'description',0,2545,2,2410,1493043378,1,2544),(183,13,60,0,7629,'description',0,2115,3,2544,1493043378,1,2545),(183,13,60,0,7630,'description',0,2546,4,2545,1493043378,1,2115),(183,13,60,0,7631,'description',0,2150,5,2115,1493043378,1,2546),(183,13,60,0,7632,'description',0,2547,6,2546,1493043378,1,2150),(183,13,60,0,7633,'description',0,2310,7,2150,1493043378,1,2547),(183,13,60,0,7634,'description',0,2548,8,2547,1493043378,1,2310),(183,13,60,0,7635,'description',0,2130,9,2310,1493043378,1,2548),(183,13,60,0,7636,'description',0,2109,10,2548,1493043378,1,2130),(183,13,60,0,7637,'description',0,2549,11,2130,1493043378,1,2109),(183,13,60,0,7638,'description',0,2550,12,2109,1493043378,1,2549),(183,13,60,0,7639,'description',0,2551,13,2549,1493043378,1,2550),(183,13,60,0,7640,'description',0,2552,14,2550,1493043378,1,2551),(183,13,60,0,7641,'description',0,2109,15,2551,1493043378,1,2552),(183,13,60,0,7642,'description',0,2553,16,2552,1493043378,1,2109),(183,13,60,0,7643,'description',0,2182,17,2109,1493043378,1,2553),(183,13,60,0,7644,'description',0,2554,18,2553,1493043378,1,2182),(183,13,60,0,7645,'description',0,2555,19,2182,1493043378,1,2554),(183,13,60,0,7646,'description',0,2556,20,2554,1493043378,1,2555),(183,13,60,0,7647,'description',0,2557,21,2555,1493043378,1,2556),(183,13,60,0,7648,'description',0,2558,22,2556,1493043378,1,2557),(183,13,60,0,7649,'description',0,2559,23,2557,1493043378,1,2558),(183,13,60,0,7650,'description',0,2150,24,2558,1493043378,1,2559),(183,13,60,0,7651,'description',0,2560,25,2559,1493043378,1,2150),(183,13,60,0,7652,'description',0,2561,26,2150,1493043378,1,2560),(183,13,60,0,7653,'description',0,2562,27,2560,1493043378,1,2561),(183,13,60,0,7654,'description',0,2429,28,2561,1493043378,1,2562),(187,13,60,0,7655,'category',0,0,29,2562,1493043378,1,2429),(181,13,59,0,7656,'title',0,2410,0,0,1493043098,1,2109),(181,13,59,0,7657,'title',0,2238,1,2109,1493043098,1,2410),(181,13,59,0,7658,'title',0,2563,2,2410,1493043098,1,2238),(181,13,59,0,7659,'title',0,2564,3,2238,1493043098,1,2563),(181,13,59,0,7660,'title',0,2565,4,2563,1493043098,1,2564),(183,13,59,0,7661,'description',0,2119,5,2564,1493043098,1,2565),(183,13,59,0,7662,'description',0,2109,6,2565,1493043098,1,2119),(183,13,59,0,7663,'description',0,2566,7,2119,1493043098,1,2109),(183,13,59,0,7664,'description',0,2563,8,2109,1493043098,1,2566),(183,13,59,0,7665,'description',0,2564,9,2566,1493043098,1,2563),(183,13,59,0,7666,'description',0,2567,10,2563,1493043098,1,2564),(183,13,59,0,7667,'description',0,2109,11,2564,1493043098,1,2567),(183,13,59,0,7668,'description',0,2410,12,2567,1493043098,1,2109),(183,13,59,0,7669,'description',0,2238,13,2109,1493043098,1,2410),(183,13,59,0,7670,'description',0,2568,14,2410,1493043098,1,2238),(183,13,59,0,7671,'description',0,2109,15,2238,1493043098,1,2568),(183,13,59,0,7672,'description',0,2218,16,2568,1493043098,1,2109),(183,13,59,0,7673,'description',0,2119,17,2109,1493043098,1,2218),(183,13,59,0,7674,'description',0,2410,18,2218,1493043098,1,2119),(183,13,59,0,7675,'description',0,2569,19,2119,1493043098,1,2410),(183,13,59,0,7676,'description',0,2570,20,2410,1493043098,1,2569),(183,13,59,0,7677,'description',0,2571,21,2569,1493043098,1,2570),(183,13,59,0,7678,'description',0,2572,22,2570,1493043098,1,2571),(183,13,59,0,7679,'description',0,2104,23,2571,1493043098,1,2572),(183,13,59,0,7680,'description',0,2573,24,2572,1493043098,1,2104),(183,13,59,0,7681,'description',0,2154,25,2104,1493043098,1,2573),(183,13,59,0,7682,'description',0,2574,26,2573,1493043098,1,2154),(183,13,59,0,7683,'description',0,2575,27,2154,1493043098,1,2574),(183,13,59,0,7684,'description',0,2150,28,2574,1493043098,1,2575),(183,13,59,0,7685,'description',0,2569,29,2575,1493043098,1,2150),(183,13,59,0,7686,'description',0,2576,30,2150,1493043098,1,2569),(183,13,59,0,7687,'description',0,2577,31,2569,1493043098,1,2576),(183,13,59,0,7688,'description',0,2578,32,2576,1493043098,1,2577),(183,13,59,0,7689,'description',0,2571,33,2577,1493043098,1,2578),(183,13,59,0,7690,'description',0,2427,34,2578,1493043098,1,2571),(183,13,59,0,7691,'description',0,2579,35,2571,1493043098,1,2427),(183,13,59,0,7692,'description',0,2429,36,2427,1493043098,1,2579),(187,13,59,0,7693,'category',0,0,37,2579,1493043098,1,2429),(181,13,58,0,7694,'title',0,2580,0,0,1493042976,1,2109),(181,13,58,0,7695,'title',0,2379,1,2109,1493042976,1,2580),(183,13,58,0,7696,'description',0,2365,2,2580,1493042976,1,2379),(183,13,58,0,7697,'description',0,2581,3,2379,1493042976,1,2365),(183,13,58,0,7698,'description',0,2130,4,2365,1493042976,1,2581),(183,13,58,0,7699,'description',0,2582,5,2581,1493042976,1,2130),(183,13,58,0,7700,'description',0,2217,6,2130,1493042976,1,2582),(183,13,58,0,7701,'description',0,2296,7,2582,1493042976,1,2217),(183,13,58,0,7702,'description',0,2583,8,2217,1493042976,1,2296),(183,13,58,0,7703,'description',0,2365,9,2296,1493042976,1,2583),(183,13,58,0,7704,'description',0,2584,10,2583,1493042976,1,2365),(183,13,58,0,7705,'description',0,2585,11,2365,1493042976,1,2584),(183,13,58,0,7706,'description',0,2104,12,2584,1493042976,1,2585),(183,13,58,0,7707,'description',0,2586,13,2585,1493042976,1,2104),(183,13,58,0,7708,'description',0,2109,14,2104,1493042976,1,2586),(183,13,58,0,7709,'description',0,2217,15,2586,1493042976,1,2109),(183,13,58,0,7710,'description',0,2114,16,2109,1493042976,1,2217),(183,13,58,0,7711,'description',0,2108,17,2217,1493042976,1,2114),(183,13,58,0,7712,'description',0,2587,18,2114,1493042976,1,2108),(183,13,58,0,7713,'description',0,2150,19,2108,1493042976,1,2587),(183,13,58,0,7714,'description',0,2588,20,2587,1493042976,1,2150),(183,13,58,0,7715,'description',0,2116,21,2150,1493042976,1,2588),(183,13,58,0,7716,'description',0,2589,22,2588,1493042976,1,2116),(183,13,58,0,7717,'description',0,2590,23,2116,1493042976,1,2589),(183,13,58,0,7718,'description',0,2591,24,2589,1493042976,1,2590),(183,13,58,0,7719,'description',0,2592,25,2590,1493042976,1,2591),(183,13,58,0,7720,'description',0,2113,26,2591,1493042976,1,2592),(183,13,58,0,7721,'description',0,2116,27,2592,1493042976,1,2113),(183,13,58,0,7722,'description',0,2593,28,2113,1493042976,1,2116),(183,13,58,0,7723,'description',0,2594,29,2116,1493042976,1,2593),(183,13,58,0,7724,'description',0,2595,30,2593,1493042976,1,2594),(183,13,58,0,7725,'description',0,2261,31,2594,1493042976,1,2595),(183,13,58,0,7726,'description',0,2108,32,2595,1493042976,1,2261),(183,13,58,0,7727,'description',0,2596,33,2261,1493042976,1,2108),(183,13,58,0,7728,'description',0,2104,34,2108,1493042976,1,2596),(183,13,58,0,7729,'description',0,2396,35,2596,1493042976,1,2104),(183,13,58,0,7730,'description',0,2160,36,2104,1493042976,1,2396),(183,13,58,0,7731,'description',0,2597,37,2396,1493042976,1,2160),(183,13,58,0,7732,'description',0,2598,38,2160,1493042976,1,2597),(183,13,58,0,7733,'description',0,2599,39,2597,1493042976,1,2598),(183,13,58,0,7734,'description',0,2266,40,2598,1493042976,1,2599),(183,13,58,0,7735,'description',0,2109,41,2599,1493042976,1,2266),(183,13,58,0,7736,'description',0,2600,42,2266,1493042976,1,2109),(183,13,58,0,7737,'description',0,2601,43,2109,1493042976,1,2600),(183,13,58,0,7738,'description',0,2119,44,2600,1493042976,1,2601),(183,13,58,0,7739,'description',0,2597,45,2601,1493042976,1,2119),(183,13,58,0,7740,'description',0,2602,46,2119,1493042976,1,2597),(183,13,58,0,7741,'description',0,2211,47,2597,1493042976,1,2602),(183,13,58,0,7742,'description',0,2278,48,2602,1493042976,1,2211),(183,13,58,0,7743,'description',0,2299,49,2211,1493042976,1,2278),(183,13,58,0,7744,'description',0,2603,50,2278,1493042976,1,2299),(183,13,58,0,7745,'description',0,2583,51,2299,1493042976,1,2603),(183,13,58,0,7746,'description',0,2604,52,2603,1493042976,1,2583),(183,13,58,0,7747,'description',0,2116,53,2583,1493042976,1,2604),(183,13,58,0,7748,'description',0,2605,54,2604,1493042976,1,2116),(183,13,58,0,7749,'description',0,2119,55,2116,1493042976,1,2605),(183,13,58,0,7750,'description',0,2109,56,2605,1493042976,1,2119),(183,13,58,0,7751,'description',0,2606,57,2119,1493042976,1,2109),(183,13,58,0,7752,'description',0,2607,58,2109,1493042976,1,2606),(183,13,58,0,7753,'description',0,2104,59,2606,1493042976,1,2607),(183,13,58,0,7754,'description',0,2109,60,2607,1493042976,1,2104),(183,13,58,0,7755,'description',0,2608,61,2104,1493042976,1,2109),(183,13,58,0,7756,'description',0,2145,62,2109,1493042976,1,2608),(183,13,58,0,7757,'description',0,2609,63,2608,1493042976,1,2145),(183,13,58,0,7758,'description',0,2242,64,2145,1493042976,1,2609),(187,13,58,0,7759,'category',0,0,65,2609,1493042976,1,2242),(181,13,57,0,7760,'title',0,2610,0,0,1493042810,1,2109),(181,13,57,0,7761,'title',0,2611,1,2109,1493042810,1,2610),(181,13,57,0,7762,'title',0,2612,2,2610,1493042810,1,2611),(183,13,57,0,7763,'description',0,2613,3,2611,1493042810,1,2612),(183,13,57,0,7764,'description',0,2614,4,2612,1493042810,1,2613),(183,13,57,0,7765,'description',0,2264,5,2613,1493042810,1,2614),(183,13,57,0,7766,'description',0,2615,6,2614,1493042810,1,2264),(183,13,57,0,7767,'description',0,2616,7,2264,1493042810,1,2615),(183,13,57,0,7768,'description',0,2617,8,2615,1493042810,1,2616),(183,13,57,0,7769,'description',0,2618,9,2616,1493042810,1,2617),(183,13,57,0,7770,'description',0,2619,10,2617,1493042810,1,2618),(183,13,57,0,7771,'description',0,2116,11,2618,1493042810,1,2619),(183,13,57,0,7772,'description',0,2620,12,2619,1493042810,1,2116),(183,13,57,0,7773,'description',0,2621,13,2116,1493042810,1,2620),(183,13,57,0,7774,'description',0,2622,14,2620,1493042810,1,2621),(183,13,57,0,7775,'description',0,2623,15,2621,1493042810,1,2622),(183,13,57,0,7776,'description',0,2119,16,2622,1493042810,1,2623),(183,13,57,0,7777,'description',0,2624,17,2623,1493042810,1,2119),(183,13,57,0,7778,'description',0,2625,18,2119,1493042810,1,2624),(183,13,57,0,7779,'description',0,2626,19,2624,1493042810,1,2625),(183,13,57,0,7780,'description',0,2616,20,2625,1493042810,1,2626),(183,13,57,0,7781,'description',0,2627,21,2626,1493042810,1,2616),(183,13,57,0,7782,'description',0,2628,22,2616,1493042810,1,2627),(183,13,57,0,7783,'description',0,2109,23,2627,1493042810,1,2628),(183,13,57,0,7784,'description',0,2629,24,2628,1493042810,1,2109),(183,13,57,0,7785,'description',0,2108,25,2109,1493042810,1,2629),(183,13,57,0,7786,'description',0,2630,26,2629,1493042810,1,2108),(183,13,57,0,7787,'description',0,2631,27,2108,1493042810,1,2630),(183,13,57,0,7788,'description',0,2109,28,2630,1493042810,1,2631),(183,13,57,0,7789,'description',0,2632,29,2631,1493042810,1,2109),(183,13,57,0,7790,'description',0,2119,30,2109,1493042810,1,2632),(183,13,57,0,7791,'description',0,2633,31,2632,1493042810,1,2119),(183,13,57,0,7792,'description',0,2634,32,2119,1493042810,1,2633),(183,13,57,0,7793,'description',0,2635,33,2633,1493042810,1,2634),(183,13,57,0,7794,'description',0,2365,34,2634,1493042810,1,2635),(183,13,57,0,7795,'description',0,2636,35,2635,1493042810,1,2365),(183,13,57,0,7796,'description',0,2104,36,2365,1493042810,1,2636),(183,13,57,0,7797,'description',0,2637,37,2636,1493042810,1,2104),(183,13,57,0,7798,'description',0,2638,38,2104,1493042810,1,2637),(183,13,57,0,7799,'description',0,2264,39,2637,1493042810,1,2638),(183,13,57,0,7800,'description',0,2639,40,2638,1493042810,1,2264),(183,13,57,0,7801,'description',0,2290,41,2264,1493042810,1,2639),(183,13,57,0,7802,'description',0,2120,42,2639,1493042810,1,2290),(183,13,57,0,7803,'description',0,2640,43,2290,1493042810,1,2120),(183,13,57,0,7804,'description',0,2641,44,2120,1493042810,1,2640),(183,13,57,0,7805,'description',0,2150,45,2640,1493042810,1,2641),(183,13,57,0,7806,'description',0,2642,46,2641,1493042810,1,2150),(183,13,57,0,7807,'description',0,2643,47,2150,1493042810,1,2642),(183,13,57,0,7808,'description',0,2644,48,2642,1493042810,1,2643),(183,13,57,0,7809,'description',0,2645,49,2643,1493042810,1,2644),(183,13,57,0,7810,'description',0,2646,50,2644,1493042810,1,2645),(183,13,57,0,7811,'description',0,2290,51,2645,1493042810,1,2646),(183,13,57,0,7812,'description',0,2116,52,2646,1493042810,1,2290),(183,13,57,0,7813,'description',0,2647,53,2290,1493042810,1,2116),(183,13,57,0,7814,'description',0,2242,54,2116,1493042810,1,2647),(187,13,57,0,7815,'category',0,0,55,2647,1493042810,1,2242),(181,13,56,0,7816,'title',0,2648,0,0,1493042677,1,2109),(181,13,56,0,7817,'title',0,2109,1,2109,1493042677,1,2648),(181,13,56,0,7818,'title',0,2649,2,2648,1493042677,1,2109),(181,13,56,0,7819,'title',0,2310,3,2109,1493042677,1,2649),(181,13,56,0,7820,'title',0,2211,4,2649,1493042677,1,2310),(181,13,56,0,7821,'title',0,2650,5,2310,1493042677,1,2211),(181,13,56,0,7822,'title',0,2108,6,2211,1493042677,1,2650),(181,13,56,0,7823,'title',0,2651,7,2650,1493042677,1,2108),(181,13,56,0,7824,'title',0,2216,8,2108,1493042677,1,2651),(181,13,56,0,7825,'title',0,2109,9,2651,1493042677,1,2216),(183,13,56,0,7826,'description',0,2649,10,2216,1493042677,1,2109),(183,13,56,0,7827,'description',0,2652,11,2109,1493042677,1,2649),(183,13,56,0,7828,'description',0,2310,12,2649,1493042677,1,2652),(183,13,56,0,7829,'description',0,2653,13,2652,1493042677,1,2310),(183,13,56,0,7830,'description',0,2300,14,2310,1493042677,1,2653),(183,13,56,0,7831,'description',0,2654,15,2653,1493042677,1,2300),(183,13,56,0,7832,'description',0,2116,16,2300,1493042677,1,2654),(183,13,56,0,7833,'description',0,2655,17,2654,1493042677,1,2116),(183,13,56,0,7834,'description',0,2656,18,2116,1493042677,1,2655),(183,13,56,0,7835,'description',0,2657,19,2655,1493042677,1,2656),(183,13,56,0,7836,'description',0,2658,20,2656,1493042677,1,2657),(183,13,56,0,7837,'description',0,2104,21,2657,1493042677,1,2658),(183,13,56,0,7838,'description',0,2659,22,2658,1493042677,1,2104),(183,13,56,0,7839,'description',0,2660,23,2104,1493042677,1,2659),(183,13,56,0,7840,'description',0,2211,24,2659,1493042677,1,2660),(183,13,56,0,7841,'description',0,2661,25,2660,1493042677,1,2211),(183,13,56,0,7842,'description',0,2264,26,2211,1493042677,1,2661),(183,13,56,0,7843,'description',0,2154,27,2661,1493042677,1,2264),(183,13,56,0,7844,'description',0,2662,28,2264,1493042677,1,2154),(183,13,56,0,7845,'description',0,2663,29,2154,1493042677,1,2662),(183,13,56,0,7846,'description',0,2664,30,2662,1493042677,1,2663),(183,13,56,0,7847,'description',0,2665,31,2663,1493042677,1,2664),(183,13,56,0,7848,'description',0,2116,32,2664,1493042677,1,2665),(183,13,56,0,7849,'description',0,2666,33,2665,1493042677,1,2116),(183,13,56,0,7850,'description',0,2104,34,2116,1493042677,1,2666),(183,13,56,0,7851,'description',0,2229,35,2666,1493042677,1,2104),(183,13,56,0,7852,'description',0,2154,36,2104,1493042677,1,2229),(183,13,56,0,7853,'description',0,2667,37,2229,1493042677,1,2154),(183,13,56,0,7854,'description',0,2668,38,2154,1493042677,1,2667),(183,13,56,0,7855,'description',0,2109,39,2667,1493042677,1,2668),(183,13,56,0,7856,'description',0,2648,40,2668,1493042677,1,2109),(183,13,56,0,7857,'description',0,2669,41,2109,1493042677,1,2648),(183,13,56,0,7858,'description',0,2670,42,2648,1493042677,1,2669),(183,13,56,0,7859,'description',0,2671,43,2669,1493042677,1,2670),(183,13,56,0,7860,'description',0,2109,44,2670,1493042677,1,2671),(183,13,56,0,7861,'description',0,2672,45,2671,1493042677,1,2109),(183,13,56,0,7862,'description',0,2217,46,2109,1493042677,1,2672),(183,13,56,0,7863,'description',0,2310,47,2672,1493042677,1,2217),(183,13,56,0,7864,'description',0,2211,48,2217,1493042677,1,2310),(183,13,56,0,7865,'description',0,2334,49,2310,1493042677,1,2211),(183,13,56,0,7866,'description',0,2673,50,2211,1493042677,1,2334),(183,13,56,0,7867,'description',0,2674,51,2334,1493042677,1,2673),(183,13,56,0,7868,'description',0,2119,52,2673,1493042677,1,2674),(183,13,56,0,7869,'description',0,2675,53,2674,1493042677,1,2119),(183,13,56,0,7870,'description',0,2676,54,2119,1493042677,1,2675),(183,13,56,0,7871,'description',0,2242,55,2675,1493042677,1,2676),(187,13,56,0,7872,'category',0,0,56,2676,1493042677,1,2242),(181,13,55,0,7873,'title',0,2678,0,0,1493041511,1,2677),(181,13,55,0,7874,'title',0,2679,1,2677,1493041511,1,2678),(181,13,55,0,7875,'title',0,2116,2,2678,1493041511,1,2679),(181,13,55,0,7876,'title',0,2261,3,2679,1493041511,1,2116),(181,13,55,0,7877,'title',0,2119,4,2116,1493041511,1,2261),(181,13,55,0,7878,'title',0,2680,5,2261,1493041511,1,2119),(181,13,55,0,7879,'title',0,2250,6,2119,1493041511,1,2680),(183,13,55,0,7880,'description',0,2116,7,2680,1493041511,1,2250),(183,13,55,0,7881,'description',0,2681,8,2250,1493041511,1,2116),(183,13,55,0,7882,'description',0,2238,9,2116,1493041511,1,2681),(183,13,55,0,7883,'description',0,2114,10,2681,1493041511,1,2238),(183,13,55,0,7884,'description',0,2108,11,2238,1493041511,1,2114),(183,13,55,0,7885,'description',0,2682,12,2114,1493041511,1,2108),(183,13,55,0,7886,'description',0,2683,13,2108,1493041511,1,2682),(183,13,55,0,7887,'description',0,2684,14,2682,1493041511,1,2683),(183,13,55,0,7888,'description',0,2685,15,2683,1493041511,1,2684),(183,13,55,0,7889,'description',0,2686,16,2684,1493041511,1,2685),(183,13,55,0,7890,'description',0,2266,17,2685,1493041511,1,2686),(183,13,55,0,7891,'description',0,2679,18,2686,1493041511,1,2266),(183,13,55,0,7892,'description',0,2115,19,2266,1493041511,1,2679),(183,13,55,0,7893,'description',0,2261,20,2679,1493041511,1,2115),(183,13,55,0,7894,'description',0,2687,21,2115,1493041511,1,2261),(183,13,55,0,7895,'description',0,2113,22,2261,1493041511,1,2687),(183,13,55,0,7896,'description',0,2278,23,2687,1493041511,1,2113),(183,13,55,0,7897,'description',0,2109,24,2113,1493041511,1,2278),(183,13,55,0,7898,'description',0,2688,25,2278,1493041511,1,2109),(183,13,55,0,7899,'description',0,2150,26,2109,1493041511,1,2688),(183,13,55,0,7900,'description',0,2689,27,2688,1493041511,1,2150),(183,13,55,0,7901,'description',0,2128,28,2150,1493041511,1,2689),(183,13,55,0,7902,'description',0,2120,29,2689,1493041511,1,2128),(183,13,55,0,7903,'description',0,2690,30,2128,1493041511,1,2120),(183,13,55,0,7904,'description',0,2691,31,2120,1493041511,1,2690),(183,13,55,0,7905,'description',0,2692,32,2690,1493041511,1,2691),(183,13,55,0,7906,'description',0,2693,33,2691,1493041511,1,2692),(183,13,55,0,7907,'description',0,2694,34,2692,1493041511,1,2693),(183,13,55,0,7908,'description',0,2695,35,2693,1493041511,1,2694),(183,13,55,0,7909,'description',0,2696,36,2694,1493041511,1,2695),(183,13,55,0,7910,'description',0,2697,37,2695,1493041511,1,2696),(183,13,55,0,7911,'description',0,2684,38,2696,1493041511,1,2697),(183,13,55,0,7912,'description',0,2698,39,2697,1493041511,1,2684),(183,13,55,0,7913,'description',0,2290,40,2684,1493041511,1,2698),(183,13,55,0,7914,'description',0,2692,41,2698,1493041511,1,2290),(183,13,55,0,7915,'description',0,2699,42,2290,1493041511,1,2692),(183,13,55,0,7916,'description',0,2692,43,2692,1493041511,1,2699),(183,13,55,0,7917,'description',0,2694,44,2699,1493041511,1,2692),(183,13,55,0,7918,'description',0,2695,45,2692,1493041511,1,2694),(183,13,55,0,7919,'description',0,2697,46,2694,1493041511,1,2695),(183,13,55,0,7920,'description',0,2127,47,2695,1493041511,1,2697),(183,13,55,0,7921,'description',0,2104,48,2697,1493041511,1,2127),(183,13,55,0,7922,'description',0,2700,49,2127,1493041511,1,2104),(183,13,55,0,7923,'description',0,2701,50,2104,1493041511,1,2700),(183,13,55,0,7924,'description',0,2216,51,2700,1493041511,1,2701),(183,13,55,0,7925,'description',0,2116,52,2701,1493041511,1,2216),(183,13,55,0,7926,'description',0,2702,53,2216,1493041511,1,2116),(183,13,55,0,7927,'description',0,2703,54,2116,1493041511,1,2702),(183,13,55,0,7928,'description',0,2296,55,2702,1493041511,1,2703),(183,13,55,0,7929,'description',0,2107,56,2703,1493041511,1,2296),(183,13,55,0,7930,'description',0,2238,57,2296,1493041511,1,2107),(183,13,55,0,7931,'description',0,2108,58,2107,1493041511,1,2238),(183,13,55,0,7932,'description',0,2143,59,2238,1493041511,1,2108),(183,13,55,0,7933,'description',0,2250,60,2108,1493041511,1,2143),(183,13,55,0,7934,'description',0,2692,61,2143,1493041511,1,2250),(183,13,55,0,7935,'description',0,2696,62,2250,1493041511,1,2692),(183,13,55,0,7936,'description',0,2114,63,2692,1493041511,1,2696),(183,13,55,0,7937,'description',0,2108,64,2696,1493041511,1,2114),(183,13,55,0,7938,'description',0,2704,65,2114,1493041511,1,2108),(183,13,55,0,7939,'description',0,2705,66,2108,1493041511,1,2704),(183,13,55,0,7940,'description',0,2150,67,2704,1493041511,1,2705),(183,13,55,0,7941,'description',0,2299,68,2705,1493041511,1,2150),(183,13,55,0,7942,'description',0,2128,69,2150,1493041511,1,2299),(183,13,55,0,7943,'description',0,2296,70,2299,1493041511,1,2128),(183,13,55,0,7944,'description',0,2104,71,2128,1493041511,1,2296),(183,13,55,0,7945,'description',0,2296,72,2296,1493041511,1,2104),(183,13,55,0,7946,'description',0,2300,73,2104,1493041511,1,2296),(183,13,55,0,7947,'description',0,2706,74,2296,1493041511,1,2300),(183,13,55,0,7948,'description',0,2707,75,2300,1493041511,1,2706),(183,13,55,0,7949,'description',0,2708,76,2706,1493041511,1,2707),(183,13,55,0,7950,'description',0,2109,77,2707,1493041511,1,2708),(183,13,55,0,7951,'description',0,2238,78,2708,1493041511,1,2109),(183,13,55,0,7952,'description',0,2709,79,2109,1493041511,1,2238),(183,13,55,0,7953,'description',0,2710,80,2238,1493041511,1,2709),(183,13,55,0,7954,'description',0,2136,81,2709,1493041511,1,2710),(183,13,55,0,7955,'description',0,2682,82,2710,1493041511,1,2136),(183,13,55,0,7956,'description',0,2711,83,2136,1493041511,1,2682),(183,13,55,0,7957,'description',0,2712,84,2682,1493041511,1,2711),(183,13,55,0,7958,'description',0,2239,85,2711,1493041511,1,2712),(187,13,55,0,7959,'category',0,2217,86,2712,1493041511,1,2239),(187,13,55,0,7960,'category',0,0,87,2239,1493041511,1,2217),(181,13,54,0,7961,'title',0,2714,0,0,1493041272,1,2713),(181,13,54,0,7962,'title',0,2109,1,2713,1493041272,1,2714),(181,13,54,0,7963,'title',0,2242,2,2714,1493041272,1,2109),(181,13,54,0,7964,'title',0,2107,3,2109,1493041272,1,2242),(183,13,54,0,7965,'description',0,2238,4,2242,1493041272,1,2107),(183,13,54,0,7966,'description',0,2715,5,2107,1493041272,1,2238),(183,13,54,0,7967,'description',0,2244,6,2238,1493041272,1,2715),(183,13,54,0,7968,'description',0,2109,7,2715,1493041272,1,2244),(183,13,54,0,7969,'description',0,2716,8,2244,1493041272,1,2109),(183,13,54,0,7970,'description',0,2717,9,2109,1493041272,1,2716),(183,13,54,0,7971,'description',0,2119,10,2716,1493041272,1,2717),(183,13,54,0,7972,'description',0,2713,11,2717,1493041272,1,2119),(183,13,54,0,7973,'description',0,2714,12,2119,1493041272,1,2713),(183,13,54,0,7974,'description',0,2114,13,2713,1493041272,1,2714),(183,13,54,0,7975,'description',0,2718,14,2714,1493041272,1,2114),(183,13,54,0,7976,'description',0,2719,15,2114,1493041272,1,2718),(183,13,54,0,7977,'description',0,2126,16,2718,1493041272,1,2719),(183,13,54,0,7978,'description',0,2720,17,2719,1493041272,1,2126),(183,13,54,0,7979,'description',0,2244,18,2126,1493041272,1,2720),(183,13,54,0,7980,'description',0,2250,19,2720,1493041272,1,2244),(183,13,54,0,7981,'description',0,2721,20,2244,1493041272,1,2250),(183,13,54,0,7982,'description',0,2119,21,2250,1493041272,1,2721),(183,13,54,0,7983,'description',0,2116,22,2721,1493041272,1,2119),(183,13,54,0,7984,'description',0,2722,23,2119,1493041272,1,2116),(183,13,54,0,7985,'description',0,2723,24,2116,1493041272,1,2722),(183,13,54,0,7986,'description',0,2104,25,2722,1493041272,1,2723),(183,13,54,0,7987,'description',0,2223,26,2723,1493041272,1,2104),(183,13,54,0,7988,'description',0,2724,27,2104,1493041272,1,2223),(183,13,54,0,7989,'description',0,2725,28,2223,1493041272,1,2724),(183,13,54,0,7990,'description',0,2220,29,2724,1493041272,1,2725),(183,13,54,0,7991,'description',0,2726,30,2725,1493041272,1,2220),(183,13,54,0,7992,'description',0,2727,31,2220,1493041272,1,2726),(183,13,54,0,7993,'description',0,2728,32,2726,1493041272,1,2727),(183,13,54,0,7994,'description',0,2216,33,2727,1493041272,1,2728),(183,13,54,0,7995,'description',0,2109,34,2728,1493041272,1,2216),(183,13,54,0,7996,'description',0,2729,35,2216,1493041272,1,2109),(183,13,54,0,7997,'description',0,2730,36,2109,1493041272,1,2729),(183,13,54,0,7998,'description',0,2261,37,2729,1493041272,1,2730),(183,13,54,0,7999,'description',0,2731,38,2730,1493041272,1,2261),(183,13,54,0,8000,'description',0,2211,39,2261,1493041272,1,2731),(183,13,54,0,8001,'description',0,2713,40,2731,1493041272,1,2211),(183,13,54,0,8002,'description',0,2732,41,2211,1493041272,1,2713),(183,13,54,0,8003,'description',0,2264,42,2713,1493041272,1,2732),(183,13,54,0,8004,'description',0,2223,43,2732,1493041272,1,2264),(183,13,54,0,8005,'description',0,2733,44,2264,1493041272,1,2223),(183,13,54,0,8006,'description',0,2266,45,2223,1493041272,1,2733),(183,13,54,0,8007,'description',0,2107,46,2733,1493041272,1,2266),(183,13,54,0,8008,'description',0,2235,47,2266,1493041272,1,2107),(183,13,54,0,8009,'description',0,2239,48,2107,1493041272,1,2235),(187,13,54,0,8010,'category',0,2217,49,2235,1493041272,1,2239),(187,13,54,0,8011,'category',0,0,50,2239,1493041272,1,2217),(181,13,53,0,8012,'title',0,2735,0,0,1493040781,1,2734),(181,13,53,0,8013,'title',0,2736,1,2734,1493040781,1,2735),(181,13,53,0,8014,'title',0,2150,2,2735,1493040781,1,2736),(181,13,53,0,8015,'title',0,2109,3,2736,1493040781,1,2150),(181,13,53,0,8016,'title',0,2737,4,2150,1493040781,1,2109),(181,13,53,0,8017,'title',0,2211,5,2109,1493040781,1,2737),(181,13,53,0,8018,'title',0,2738,6,2737,1493040781,1,2211),(181,13,53,0,8019,'title',0,2109,7,2211,1493040781,1,2738),(181,13,53,0,8020,'title',0,2739,8,2738,1493040781,1,2109),(181,13,53,0,8021,'title',0,2740,9,2109,1493040781,1,2739),(181,13,53,0,8022,'title',0,2125,10,2739,1493040781,1,2740),(183,13,53,0,8023,'description',0,2126,11,2740,1493040781,1,2125),(183,13,53,0,8024,'description',0,2127,12,2125,1493040781,1,2126),(183,13,53,0,8025,'description',0,2104,13,2126,1493040781,1,2127),(183,13,53,0,8026,'description',0,2741,14,2127,1493040781,1,2104),(183,13,53,0,8027,'description',0,2216,15,2104,1493040781,1,2741),(183,13,53,0,8028,'description',0,2217,16,2741,1493040781,1,2216),(183,13,53,0,8029,'description',0,2119,17,2216,1493040781,1,2217),(183,13,53,0,8030,'description',0,2218,18,2217,1493040781,1,2119),(183,13,53,0,8031,'description',0,2115,19,2119,1493040781,1,2218),(183,13,53,0,8032,'description',0,2742,20,2218,1493040781,1,2115),(183,13,53,0,8033,'description',0,2220,21,2115,1493040781,1,2742),(183,13,53,0,8034,'description',0,2743,22,2742,1493040781,1,2220),(183,13,53,0,8035,'description',0,2150,23,2220,1493040781,1,2743),(183,13,53,0,8036,'description',0,2744,24,2743,1493040781,1,2150),(183,13,53,0,8037,'description',0,2158,25,2150,1493040781,1,2744),(183,13,53,0,8038,'description',0,2119,26,2744,1493040781,1,2158),(183,13,53,0,8039,'description',0,2223,27,2158,1493040781,1,2119),(183,13,53,0,8040,'description',0,2745,28,2119,1493040781,1,2223),(183,13,53,0,8041,'description',0,2119,29,2223,1493040781,1,2745),(183,13,53,0,8042,'description',0,2736,30,2745,1493040781,1,2119),(183,13,53,0,8043,'description',0,2745,31,2119,1493040781,1,2736),(183,13,53,0,8044,'description',0,2211,32,2736,1493040781,1,2745),(183,13,53,0,8045,'description',0,2746,33,2745,1493040781,1,2211),(183,13,53,0,8046,'description',0,2747,34,2211,1493040781,1,2746),(183,13,53,0,8047,'description',0,2104,35,2746,1493040781,1,2747),(183,13,53,0,8048,'description',0,2748,36,2747,1493040781,1,2104),(183,13,53,0,8049,'description',0,2749,37,2104,1493040781,1,2748),(183,13,53,0,8050,'description',0,2229,38,2748,1493040781,1,2749),(183,13,53,0,8051,'description',0,2750,39,2749,1493040781,1,2229),(183,13,53,0,8052,'description',0,2751,40,2229,1493040781,1,2750),(183,13,53,0,8053,'description',0,2119,41,2750,1493040781,1,2751),(183,13,53,0,8054,'description',0,2223,42,2751,1493040781,1,2119),(183,13,53,0,8055,'description',0,2232,43,2119,1493040781,1,2223),(183,13,53,0,8056,'description',0,2150,44,2223,1493040781,1,2232),(183,13,53,0,8057,'description',0,2752,45,2232,1493040781,1,2150),(183,13,53,0,8058,'description',0,2753,46,2150,1493040781,1,2752),(183,13,53,0,8059,'description',0,2229,47,2752,1493040781,1,2753),(183,13,53,0,8060,'description',0,2104,48,2753,1493040781,1,2229),(183,13,53,0,8061,'description',0,2109,49,2229,1493040781,1,2104),(183,13,53,0,8062,'description',0,2235,50,2104,1493040781,1,2109),(183,13,53,0,8063,'description',0,2754,51,2109,1493040781,1,2235),(183,13,53,0,8064,'description',0,2126,52,2235,1493040781,1,2754),(183,13,53,0,8065,'description',0,2127,53,2754,1493040781,1,2126),(183,13,53,0,8066,'description',0,2104,54,2126,1493040781,1,2127),(183,13,53,0,8067,'description',0,2755,55,2127,1493040781,1,2104),(183,13,53,0,8068,'description',0,2107,56,2104,1493040781,1,2755),(183,13,53,0,8069,'description',0,2238,57,2755,1493040781,1,2107),(183,13,53,0,8070,'description',0,2239,58,2107,1493040781,1,2238),(187,13,53,0,8071,'category',0,2217,59,2238,1493040781,1,2239),(187,13,53,0,8072,'category',0,0,60,2239,1493040781,1,2217);
/*!40000 ALTER TABLE `ezsearch_object_word_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsearch_return_count`
--

DROP TABLE IF EXISTS `ezsearch_return_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsearch_return_count` (
  `count` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phrase_id` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezsearch_return_cnt_ph_id_cnt` (`phrase_id`,`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsearch_return_count`
--

LOCK TABLES `ezsearch_return_count` WRITE;
/*!40000 ALTER TABLE `ezsearch_return_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezsearch_return_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsearch_search_phrase`
--

DROP TABLE IF EXISTS `ezsearch_search_phrase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsearch_search_phrase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phrase` varchar(250) DEFAULT NULL,
  `phrase_count` int(11) DEFAULT '0',
  `result_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezsearch_search_phrase_phrase` (`phrase`),
  KEY `ezsearch_search_phrase_count` (`phrase_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsearch_search_phrase`
--

LOCK TABLES `ezsearch_search_phrase` WRITE;
/*!40000 ALTER TABLE `ezsearch_search_phrase` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezsearch_search_phrase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsearch_word`
--

DROP TABLE IF EXISTS `ezsearch_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsearch_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_count` int(11) NOT NULL DEFAULT '0',
  `word` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezsearch_word_obj_count` (`object_count`),
  KEY `ezsearch_word_word_i` (`word`)
) ENGINE=InnoDB AUTO_INCREMENT=2756 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsearch_word`
--

LOCK TABLES `ezsearch_word` WRITE;
/*!40000 ALTER TABLE `ezsearch_word` DISABLE KEYS */;
INSERT INTO `ezsearch_word` VALUES (2103,1,'welcome'),(2104,9,'to'),(2105,1,'ez'),(2106,1,'platform'),(2107,5,'this'),(2108,5,'is'),(2109,11,'the'),(2110,1,'clean'),(2111,1,'install'),(2112,1,'coming'),(2113,4,'with'),(2114,4,'it'),(2115,5,'s'),(2116,7,'a'),(2117,1,'barebone'),(2118,2,'setup'),(2119,9,'of'),(2120,4,'an'),(2121,1,'excellent'),(2122,1,'foundation'),(2123,1,'build'),(2124,1,'upon'),(2125,2,'if'),(2126,3,'you'),(2127,3,'want'),(2128,2,'from'),(2129,1,'scratch'),(2130,4,'for'),(2131,1,'more'),(2132,1,'ready'),(2133,1,'go'),(2134,1,'base'),(2135,1,'designs'),(2136,2,'or'),(2137,1,'demo'),(2138,1,'sites'),(2139,1,'please'),(2140,1,'check'),(2141,1,'documentation'),(2142,1,'congratulations'),(2143,2,'just'),(2144,1,'installed'),(2145,2,'new'),(2146,1,'generation'),(2147,1,'content'),(2148,1,'management'),(2149,1,'systems'),(2150,8,'and'),(2151,1,'community'),(2152,1,'replacing'),(2153,1,'publish'),(2154,3,'our'),(2155,1,'previous'),(2156,1,'software'),(2157,1,'need'),(2158,2,'some'),(2159,1,'guidance'),(2160,2,'out'),(2161,1,'following'),(2162,1,'resources'),(2163,4,'user'),(2164,1,'manual'),(2165,1,'studio'),(2166,1,'technical'),(2167,1,'doc'),(2168,1,'stack'),(2169,1,'developer'),(2170,1,'tutorial'),(2171,1,'comparison'),(2172,2,'guide'),(2173,1,'between'),(2174,1,'contribute'),(2175,1,'project'),(2176,1,'join'),(2177,1,'github'),(2178,1,'repositories'),(2179,1,'open'),(2180,1,'public'),(2181,1,'register'),(2182,3,'on'),(2183,1,'share'),(2184,1,'no'),(2185,1,'site'),(2186,1,'access'),(2187,1,'forums'),(2188,1,'tutorials'),(2189,1,'blogs'),(2190,1,'conversation'),(2191,1,'slack'),(2192,1,'good'),(2193,1,'luck'),(2194,1,'main'),(2195,2,'group'),(2196,3,'users'),(2197,2,'anonymous'),(2198,1,'guest'),(2199,1,'accounts'),(2200,2,'administrator'),(2201,1,'editors'),(2202,1,'media'),(2203,1,'images'),(2204,1,'files'),(2205,1,'multimedia'),(2206,1,'products'),(2211,4,'that'),(2216,4,'about'),(2217,5,'one'),(2218,2,'history'),(2220,2,'fascinating'),(2223,2,'his'),(2229,2,'light'),(2232,2,'time'),(2235,2,'world'),(2238,4,'book'),(2239,3,'choose'),(2242,4,'biography'),(2244,2,'into'),(2250,2,'what'),(2261,4,'life'),(2264,4,'in'),(2266,3,'through'),(2278,2,'all'),(2290,3,'as'),(2296,2,'person'),(2299,2,'changes'),(2300,2,'so'),(2310,2,'bestseller'),(2334,2,'has'),(2365,2,'was'),(2379,2,'he'),(2396,2,'live'),(2410,2,'science'),(2427,2,'been'),(2429,3,'fiction'),(2512,1,'astronaut'),(2513,1,'earth'),(2514,1,'colonel'),(2515,1,'chris'),(2516,1,'hadfield'),(2517,1,'spent'),(2518,1,'decades'),(2519,1,'training'),(2520,1,'logged'),(2521,1,'nearly'),(2522,1,'4'),(2523,1,'000'),(2524,1,'hours'),(2525,1,'space'),(2526,1,'during'),(2527,1,'broken'),(2528,1,'station'),(2529,1,'swiss'),(2530,1,'army'),(2531,1,'knife'),(2532,1,'disposed'),(2533,1,'snake'),(2534,1,'while'),(2535,1,'piloting'),(2536,1,'plane'),(2537,1,'temporarily'),(2538,1,'blinded'),(2539,1,'clinging'),(2540,1,'exterior'),(2541,1,'orbiting'),(2542,1,'spacecraft'),(2543,1,'bad'),(2544,1,'ben'),(2545,1,'goldacre'),(2546,1,'wise'),(2547,1,'witty'),(2548,1,'shortlisted'),(2549,1,'samuel'),(2550,1,'johnson'),(2551,1,'prize'),(2552,1,'lifts'),(2553,1,'lid'),(2554,1,'quack'),(2555,1,'doctors'),(2556,1,'flaky'),(2557,1,'statistics'),(2558,1,'scaremongering'),(2559,1,'journalists'),(2560,1,'evil'),(2561,1,'pharmaceutical'),(2562,1,'corporations'),(2563,1,'big'),(2564,1,'ideas'),(2565,1,'part'),(2566,1,'popular'),(2567,1,'series'),(2568,1,'explores'),(2569,1,'how'),(2570,1,'scientists'),(2571,1,'have'),(2572,1,'sought'),(2573,1,'explain'),(2574,1,'incredible'),(2575,1,'universe'),(2576,1,'amazing'),(2577,1,'scientific'),(2578,1,'discoveries'),(2579,1,'made'),(2580,1,'circle'),(2581,1,'created'),(2582,1,'only'),(2583,1,'she'),(2584,1,'never'),(2585,1,'supposed'),(2586,1,'be'),(2587,1,'1988'),(2588,1,'lilly'),(2589,1,'shy'),(2590,1,'high'),(2591,1,'school'),(2592,1,'senior'),(2593,1,'non'),(2594,1,'existent'),(2595,1,'social'),(2596,1,'forced'),(2597,1,'her'),(2598,1,'romantic'),(2599,1,'fantasies'),(2600,1,'fictional'),(2601,1,'characters'),(2602,1,'books'),(2603,1,'when'),(2604,1,'issues'),(2605,1,'spur'),(2606,1,'moment'),(2607,1,'invitation'),(2608,1,'strange'),(2609,1,'kid'),(2610,1,'phantom'),(2611,1,'tree'),(2612,1,'browsing'),(2613,1,'antiques'),(2614,1,'shops'),(2615,1,'wiltshire'),(2616,1,'alison'),(2617,1,'bannister'),(2618,1,'stumbles'),(2619,1,'across'),(2620,1,'delicate'),(2621,1,'old'),(2622,1,'portrait'),(2623,1,'supposedly'),(2624,1,'anne'),(2625,1,'boleyn'),(2626,1,'except'),(2627,1,'knows'),(2628,1,'better'),(2629,1,'woman'),(2630,1,'mary'),(2631,1,'seymour'),(2632,1,'daughter'),(2633,1,'katherine'),(2634,1,'parr'),(2635,1,'who'),(2636,1,'taken'),(2637,1,'wolf'),(2638,1,'hall'),(2639,1,'1557'),(2640,1,'unwanted'),(2641,1,'orphan'),(2642,1,'presumed'),(2643,1,'dead'),(2644,1,'after'),(2645,1,'going'),(2646,1,'missing'),(2647,1,'child'),(2648,1,'letter'),(2649,1,'1'),(2650,1,'everyone'),(2651,1,'talking'),(2652,1,'ebook'),(2653,1,'every'),(2654,1,'often'),(2655,1,'love'),(2656,1,'story'),(2657,1,'comes'),(2658,1,'along'),(2659,1,'remind'),(2660,1,'us'),(2661,1,'sometimes'),(2662,1,'darkest'),(2663,1,'hour'),(2664,1,'hope'),(2665,1,'shines'),(2666,1,'candle'),(2667,1,'way'),(2668,1,'discover'),(2669,1,'by'),(2670,1,'kathryn'),(2671,1,'hughes'),(2672,1,'number'),(2673,1,'captured'),(2674,1,'thousands'),(2675,1,'hearts'),(2676,1,'worldwide'),(2677,1,'j'),(2678,1,'k'),(2679,1,'rowling'),(2680,1,'magic'),(2681,1,'brilliant'),(2682,1,'not'),(2683,1,'extremely'),(2684,1,'long'),(2685,1,'but'),(2686,1,'goes'),(2687,1,'nicely'),(2688,1,'ups'),(2689,1,'down'),(2690,1,'early'),(2691,1,'ages'),(2692,1,'i'),(2693,1,'personally'),(2694,1,'don'),(2695,1,'t'),(2696,1,'like'),(2697,1,'really'),(2698,1,'biographies'),(2699,1,'feel'),(2700,1,'know'),(2701,1,'everything'),(2702,1,'certain'),(2703,1,'famous'),(2704,1,'personal'),(2705,1,'though'),(2706,1,'someone'),(2707,1,'may'),(2708,1,'find'),(2709,1,'too'),(2710,1,'short'),(2711,1,'enough'),(2712,1,'detail'),(2713,1,'robin'),(2714,1,'williams'),(2715,1,'delves'),(2716,1,'creative'),(2717,1,'genius'),(2718,1,'will'),(2719,1,'give'),(2720,1,'insight'),(2721,1,'sort'),(2722,1,'background'),(2723,1,'contributed'),(2724,1,'meteoric'),(2725,1,'success'),(2726,1,'details'),(2727,1,'are'),(2728,1,'revealed'),(2729,1,'larger'),(2730,1,'than'),(2731,1,'experiences'),(2732,1,'had'),(2733,1,'journey'),(2734,1,'nikola'),(2735,1,'tesla'),(2736,1,'imagination'),(2737,1,'man'),(2738,1,'invented'),(2739,1,'20th'),(2740,1,'century'),(2741,1,'learn'),(2742,1,'most'),(2743,1,'minds'),(2744,1,'uncover'),(2745,1,'secrets'),(2746,1,'enabled'),(2747,1,'him'),(2748,1,'invent'),(2749,1,'machines'),(2750,1,'years'),(2751,1,'ahead'),(2752,1,'literally'),(2753,1,'bring'),(2754,1,'then'),(2755,1,'read');
/*!40000 ALTER TABLE `ezsearch_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsection`
--

DROP TABLE IF EXISTS `ezsection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `navigation_part_identifier` varchar(100) DEFAULT 'ezcontentnavigationpart',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsection`
--

LOCK TABLES `ezsection` WRITE;
/*!40000 ALTER TABLE `ezsection` DISABLE KEYS */;
INSERT INTO `ezsection` VALUES (1,'standard','','Standard','ezcontentnavigationpart'),(2,'users','','Users','ezusernavigationpart'),(3,'media','','Media','ezmedianavigationpart'),(4,'setup','','Setup','ezsetupnavigationpart'),(5,'design','','Design','ezvisualnavigationpart');
/*!40000 ALTER TABLE `ezsection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsession`
--

DROP TABLE IF EXISTS `ezsession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsession` (
  `data` longtext NOT NULL,
  `expiration_time` int(11) NOT NULL DEFAULT '0',
  `session_key` varchar(32) NOT NULL DEFAULT '',
  `user_hash` varchar(32) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`session_key`),
  KEY `expiration_time` (`expiration_time`),
  KEY `ezsession_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsession`
--

LOCK TABLES `ezsession` WRITE;
/*!40000 ALTER TABLE `ezsession` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezsession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsite_data`
--

DROP TABLE IF EXISTS `ezsite_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsite_data` (
  `name` varchar(60) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsite_data`
--

LOCK TABLES `ezsite_data` WRITE;
/*!40000 ALTER TABLE `ezsite_data` DISABLE KEYS */;
INSERT INTO `ezsite_data` VALUES ('ezpublish-release','1'),('ezpublish-version','6.4.0');
/*!40000 ALTER TABLE `ezsite_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezstarrating`
--

DROP TABLE IF EXISTS `ezstarrating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezstarrating` (
  `contentobject_id` int(11) NOT NULL,
  `contentobject_attribute_id` int(11) NOT NULL,
  `rating_average` float NOT NULL,
  `rating_count` int(11) NOT NULL,
  PRIMARY KEY (`contentobject_id`,`contentobject_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezstarrating`
--

LOCK TABLES `ezstarrating` WRITE;
/*!40000 ALTER TABLE `ezstarrating` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezstarrating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezstarrating_data`
--

DROP TABLE IF EXISTS `ezstarrating_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezstarrating_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_key` varchar(32) NOT NULL,
  `rating` float NOT NULL,
  `contentobject_id` int(11) NOT NULL,
  `contentobject_attribute_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_session_key` (`user_id`,`session_key`),
  KEY `contentobject_id_contentobject_attribute_id` (`contentobject_id`,`contentobject_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezstarrating_data`
--

LOCK TABLES `ezstarrating_data` WRITE;
/*!40000 ALTER TABLE `ezstarrating_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezstarrating_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezsubtree_notification_rule`
--

DROP TABLE IF EXISTS `ezsubtree_notification_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezsubtree_notification_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL DEFAULT '0',
  `use_digest` int(11) DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezsubtree_notification_rule_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezsubtree_notification_rule`
--

LOCK TABLES `ezsubtree_notification_rule` WRITE;
/*!40000 ALTER TABLE `ezsubtree_notification_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezsubtree_notification_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eztipafriend_counter`
--

DROP TABLE IF EXISTS `eztipafriend_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eztipafriend_counter` (
  `count` int(11) NOT NULL DEFAULT '0',
  `node_id` int(11) NOT NULL DEFAULT '0',
  `requested` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`node_id`,`requested`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eztipafriend_counter`
--

LOCK TABLES `eztipafriend_counter` WRITE;
/*!40000 ALTER TABLE `eztipafriend_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `eztipafriend_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eztipafriend_request`
--

DROP TABLE IF EXISTS `eztipafriend_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eztipafriend_request` (
  `created` int(11) NOT NULL DEFAULT '0',
  `email_receiver` varchar(100) NOT NULL DEFAULT '',
  KEY `eztipafriend_request_created` (`created`),
  KEY `eztipafriend_request_email_rec` (`email_receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eztipafriend_request`
--

LOCK TABLES `eztipafriend_request` WRITE;
/*!40000 ALTER TABLE `eztipafriend_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `eztipafriend_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eztrigger`
--

DROP TABLE IF EXISTS `eztrigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eztrigger` (
  `connect_type` char(1) NOT NULL DEFAULT '',
  `function_name` varchar(200) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(200) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `workflow_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eztrigger_def_id` (`module_name`(50),`function_name`(50),`connect_type`),
  KEY `eztrigger_fetch` (`name`(25),`module_name`(50),`function_name`(50))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eztrigger`
--

LOCK TABLES `eztrigger` WRITE;
/*!40000 ALTER TABLE `eztrigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `eztrigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurl`
--

DROP TABLE IF EXISTS `ezurl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurl` (
  `created` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_valid` int(11) NOT NULL DEFAULT '1',
  `last_checked` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `original_url_md5` varchar(32) NOT NULL DEFAULT '',
  `url` longtext,
  PRIMARY KEY (`id`),
  KEY `ezurl_url` (`url`(255))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurl`
--

LOCK TABLES `ezurl` WRITE;
/*!40000 ALTER TABLE `ezurl` DISABLE KEYS */;
INSERT INTO `ezurl` VALUES (1448832197,23,1,0,1448832197,'f76e41d421b2a72232264943026a6ee5','https://doc.ez.no/display/USER/'),(1448832277,24,1,0,1448832277,'5ebaee4017bab35ed0157379fdeff0af','https://doc.ez.no/display/DEVELOPER/'),(1448832412,25,1,0,1448832412,'2657dfe060c0d56aca8ef8193e17ecf9','https://doc.ez.no/display/DEVELOPER/Building+a+Bicycle+Route+Tracker+in+eZ+Platform'),(1448832436,26,1,0,1448832436,'180577afbb87b0e2cfcb6758c62dfd5f','https://doc.ez.no/display/MAIN/Transitioning+from+eZ+Publish+to+eZ+Platform+and+eZ+Studio%3A+Feature+Comparison'),(1448832661,27,1,0,1448832661,'f9bf96304c434139d0ff5773b6eee157','https://github.com/ezsystems'),(1448832661,28,1,0,1448832661,'265d537bfba0e5ed4e85fbcd7f30ea84','http://share.ez.no'),(1448832661,29,1,0,1448832661,'7441963094866aa9d1cbb8a59cca541c','http://ez-community-on-slack.herokuapp.com/');
/*!40000 ALTER TABLE `ezurl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurl_object_link`
--

DROP TABLE IF EXISTS `ezurl_object_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurl_object_link` (
  `contentobject_attribute_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_attribute_version` int(11) NOT NULL DEFAULT '0',
  `url_id` int(11) NOT NULL DEFAULT '0',
  KEY `ezurl_ol_coa_id` (`contentobject_attribute_id`),
  KEY `ezurl_ol_coa_version` (`contentobject_attribute_version`),
  KEY `ezurl_ol_url_id` (`url_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurl_object_link`
--

LOCK TABLES `ezurl_object_link` WRITE;
/*!40000 ALTER TABLE `ezurl_object_link` DISABLE KEYS */;
INSERT INTO `ezurl_object_link` VALUES (104,9,23),(104,9,24),(104,9,25),(104,9,26),(104,9,27),(104,9,28),(104,9,29),(104,9,23),(104,9,24),(104,9,25),(104,9,26),(104,9,27),(104,9,28),(104,9,29);
/*!40000 ALTER TABLE `ezurl_object_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurlalias`
--

DROP TABLE IF EXISTS `ezurlalias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurlalias` (
  `destination_url` longtext NOT NULL,
  `forward_to_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_imported` int(11) NOT NULL DEFAULT '0',
  `is_internal` int(11) NOT NULL DEFAULT '1',
  `is_wildcard` int(11) NOT NULL DEFAULT '0',
  `source_md5` varchar(32) DEFAULT NULL,
  `source_url` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ezurlalias_desturl` (`destination_url`(200)),
  KEY `ezurlalias_forward_to_id` (`forward_to_id`),
  KEY `ezurlalias_imp_wcard_fwd` (`is_imported`,`is_wildcard`,`forward_to_id`),
  KEY `ezurlalias_source_md5` (`source_md5`),
  KEY `ezurlalias_source_url` (`source_url`(255)),
  KEY `ezurlalias_wcard_fwd` (`is_wildcard`,`forward_to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurlalias`
--

LOCK TABLES `ezurlalias` WRITE;
/*!40000 ALTER TABLE `ezurlalias` DISABLE KEYS */;
INSERT INTO `ezurlalias` VALUES ('content/view/full/2',0,12,1,1,0,'d41d8cd98f00b204e9800998ecf8427e',''),('content/view/full/5',0,13,1,1,0,'9bc65c2abec141778ffaa729489f3e87','users'),('content/view/full/12',0,15,1,1,0,'02d4e844e3a660857a3f81585995ffe1','users/guest_accounts'),('content/view/full/13',0,16,1,1,0,'1b1d79c16700fd6003ea7be233e754ba','users/administrator_users'),('content/view/full/14',0,17,1,1,0,'0bb9dd665c96bbc1cf36b79180786dea','users/editors'),('content/view/full/15',0,18,1,1,0,'f1305ac5f327a19b451d82719e0c3f5d','users/administrator_users/administrator_user'),('content/view/full/43',0,20,1,1,0,'62933a2951ef01f4eafd9bdf4d3cd2f0','media'),('content/view/full/44',0,21,1,1,0,'3ae1aac958e1c82013689d917d34967a','users/anonymous_users'),('content/view/full/45',0,22,1,1,0,'aad93975f09371695ba08292fd9698db','users/anonymous_users/anonymous_user'),('content/view/full/48',0,25,1,1,0,'a0f848942ce863cf53c0fa6cc684007d','setup'),('content/view/full/51',0,28,1,1,0,'38985339d4a5aadfc41ab292b4527046','media/images'),('content/view/full/52',0,29,1,1,0,'ad5a8c6f6aac3b1b9df267fe22e7aef6','media/files'),('content/view/full/53',0,30,1,1,0,'562a0ac498571c6c3529173184a2657c','media/multimedia');
/*!40000 ALTER TABLE `ezurlalias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurlalias_ml`
--

DROP TABLE IF EXISTS `ezurlalias_ml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurlalias_ml` (
  `action` longtext NOT NULL,
  `action_type` varchar(32) NOT NULL DEFAULT '',
  `alias_redirects` int(11) NOT NULL DEFAULT '1',
  `id` int(11) NOT NULL DEFAULT '0',
  `is_alias` int(11) NOT NULL DEFAULT '0',
  `is_original` int(11) NOT NULL DEFAULT '0',
  `lang_mask` bigint(20) NOT NULL DEFAULT '0',
  `link` int(11) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  `text` longtext NOT NULL,
  `text_md5` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`parent`,`text_md5`),
  KEY `ezurlalias_ml_act_org` (`action`(32),`is_original`),
  KEY `ezurlalias_ml_actt_org_al` (`action_type`,`is_original`,`is_alias`),
  KEY `ezurlalias_ml_id` (`id`),
  KEY `ezurlalias_ml_par_act_id_lnk` (`action`(32),`id`,`link`,`parent`),
  KEY `ezurlalias_ml_par_lnk_txt` (`parent`,`text`(32),`link`),
  KEY `ezurlalias_ml_text` (`text`(32),`id`,`link`),
  KEY `ezurlalias_ml_text_lang` (`text`(32),`lang_mask`,`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurlalias_ml`
--

LOCK TABLES `ezurlalias_ml` WRITE;
/*!40000 ALTER TABLE `ezurlalias_ml` DISABLE KEYS */;
INSERT INTO `ezurlalias_ml` VALUES ('eznode:48','eznode',1,13,0,1,3,13,0,'Setup2','475e97c0146bfb1c490339546d9e72ee'),('nop:','nop',1,17,0,0,1,17,0,'media2','50e2736330de124f6edea9b008556fe6'),('eznode:43','eznode',1,9,0,1,3,9,0,'Media','62933a2951ef01f4eafd9bdf4d3cd2f0'),('nop:','nop',1,21,0,0,1,21,0,'setup3','732cefcf28bf4547540609fb1a786a30'),('eznode:54','eznode',0,38,0,1,3,38,0,'products','86024cad1e83101d97359d7351051156'),('nop:','nop',1,3,0,0,1,3,0,'users2','86425c35a33507d479f71ade53a669aa'),('eznode:5','eznode',1,2,0,1,3,2,0,'Users','9bc65c2abec141778ffaa729489f3e87'),('eznode:2','eznode',1,1,0,1,3,1,0,'','d41d8cd98f00b204e9800998ecf8427e'),('eznode:14','eznode',1,6,0,1,3,6,2,'Editors','a147e136bfa717592f2bd70bd4b53b17'),('eznode:44','eznode',1,10,0,1,3,10,2,'Anonymous-Users','c2803c3fa1b0b5423237b4e018cae755'),('eznode:12','eznode',1,4,0,1,3,4,2,'Guest-accounts','e57843d836e3af8ab611fde9e2139b3a'),('eznode:13','eznode',1,5,0,1,3,5,2,'Administrator-users','f89fad7f8a3abc8c09e1deb46a420007'),('nop:','nop',1,11,0,0,1,11,3,'anonymous_users2','505e93077a6dde9034ad97a14ab022b1'),('eznode:12','eznode',1,26,0,0,1,4,3,'guest_accounts','70bb992820e73638731aa8de79b3329e'),('eznode:14','eznode',1,29,0,0,1,6,3,'editors','a147e136bfa717592f2bd70bd4b53b17'),('nop:','nop',1,7,0,0,1,7,3,'administrator_users2','a7da338c20bf65f9f789c87296379c2a'),('eznode:13','eznode',1,27,0,0,1,5,3,'administrator_users','aeb8609aa933b0899aa012c71139c58c'),('eznode:44','eznode',1,30,0,0,1,10,3,'anonymous_users','e9e5ad0c05ee1a43715572e5cc545926'),('eznode:15','eznode',1,8,0,1,3,8,5,'Administrator-User','5a9d7b0ec93173ef4fedee023209cb61'),('eznode:15','eznode',1,28,0,0,0,8,7,'administrator_user','a3cca2de936df1e2f805710399989971'),('eznode:53','eznode',1,20,0,1,3,20,9,'Multimedia','2e5bc8831f7ae6a29530e7f1bbf2de9c'),('eznode:52','eznode',1,19,0,1,3,19,9,'Files','45b963397aa40d4a0063e0d85e4fe7a1'),('eznode:51','eznode',1,18,0,1,3,18,9,'Images','59b514174bffe4ae402b3d63aad79fe0'),('eznode:45','eznode',1,12,0,1,3,12,10,'Anonymous-User','ccb62ebca03a31272430bc414bd5cd5b'),('eznode:45','eznode',1,31,0,0,1,12,11,'anonymous_user','c593ec85293ecb0e02d50d4c5c6c20eb'),('nop:','nop',1,15,0,0,1,15,14,'images','59b514174bffe4ae402b3d63aad79fe0'),('eznode:53','eznode',1,34,0,0,1,20,17,'multimedia','2e5bc8831f7ae6a29530e7f1bbf2de9c'),('eznode:52','eznode',1,33,0,0,1,19,17,'files','45b963397aa40d4a0063e0d85e4fe7a1'),('eznode:51','eznode',1,32,0,0,1,18,17,'images','59b514174bffe4ae402b3d63aad79fe0'),('eznode:61','eznode',1,45,0,1,3,45,38,'The-Science-Book-Big-Ideas','3c708a6bc2da198e380d006ea01c1246'),('eznode:58','eznode',1,42,0,1,3,42,38,'The-Letter-The-1-Bestseller-that-everyone-is-talking-about','6eb6cdc70cfa2b20a14dace2a9472982'),('eznode:55','eznode',1,39,0,1,3,39,38,'Nikola-Tesla-Imagination-and-the-Man-That-Invented-the-20th-Century','94969b6e8e230b36f16e59c8cd9515db'),('eznode:63','eznode',1,47,0,1,3,47,38,'An-Astronaut-s-Guide-to-Life-on-Earth','b4c2365eba8d33ec399d5f016159ffa9'),('eznode:62','eznode',1,46,0,1,3,46,38,'Bad-Science','b8fbe142c82a846c56809a3bb841a521'),('eznode:56','eznode',1,40,0,1,3,40,38,'Robin-Williams-The-Biography','bf907ae0af4d7f4945231ae4bc6e422e'),('eznode:60','eznode',1,44,0,1,3,44,38,'The-Circle','cdf570041d5de78adf8e276f5bb198b5'),('eznode:59','eznode',1,43,0,1,3,43,38,'The-Phantom-Tree','f1de6da98af28a36c4bc02e4aee1edaf'),('eznode:57','eznode',1,41,0,1,3,41,38,'J.K.-Rowling-A-Life-of-Magic','f3078188045a9f6139143830699f7f90');
/*!40000 ALTER TABLE `ezurlalias_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurlalias_ml_incr`
--

DROP TABLE IF EXISTS `ezurlalias_ml_incr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurlalias_ml_incr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurlalias_ml_incr`
--

LOCK TABLES `ezurlalias_ml_incr` WRITE;
/*!40000 ALTER TABLE `ezurlalias_ml_incr` DISABLE KEYS */;
INSERT INTO `ezurlalias_ml_incr` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47);
/*!40000 ALTER TABLE `ezurlalias_ml_incr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezurlwildcard`
--

DROP TABLE IF EXISTS `ezurlwildcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezurlwildcard` (
  `destination_url` longtext NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_url` longtext NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezurlwildcard`
--

LOCK TABLES `ezurlwildcard` WRITE;
/*!40000 ALTER TABLE `ezurlwildcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezurlwildcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezuser`
--

DROP TABLE IF EXISTS `ezuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezuser` (
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(150) NOT NULL DEFAULT '',
  `login` varchar(150) NOT NULL DEFAULT '',
  `password_hash` varchar(50) DEFAULT NULL,
  `password_hash_type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`contentobject_id`),
  UNIQUE KEY `ezuser_login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezuser`
--

LOCK TABLES `ezuser` WRITE;
/*!40000 ALTER TABLE `ezuser` DISABLE KEYS */;
INSERT INTO `ezuser` VALUES (10,'nospam@ez.no','anonymous','4e6f6184135228ccd45f8233d72a0363',2),(14,'nospam@ez.no','admin','c78e3b0f3d9244ed8c6d1c29464bdff9',2);
/*!40000 ALTER TABLE `ezuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezuser_accountkey`
--

DROP TABLE IF EXISTS `ezuser_accountkey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezuser_accountkey` (
  `hash_key` varchar(32) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hash_key` (`hash_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezuser_accountkey`
--

LOCK TABLES `ezuser_accountkey` WRITE;
/*!40000 ALTER TABLE `ezuser_accountkey` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezuser_accountkey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezuser_discountrule`
--

DROP TABLE IF EXISTS `ezuser_discountrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezuser_discountrule` (
  `contentobject_id` int(11) DEFAULT NULL,
  `discountrule_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezuser_discountrule`
--

LOCK TABLES `ezuser_discountrule` WRITE;
/*!40000 ALTER TABLE `ezuser_discountrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezuser_discountrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezuser_role`
--

DROP TABLE IF EXISTS `ezuser_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezuser_role` (
  `contentobject_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `limit_identifier` varchar(255) DEFAULT '',
  `limit_value` varchar(255) DEFAULT '',
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezuser_role_contentobject_id` (`contentobject_id`),
  KEY `ezuser_role_role_id` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezuser_role`
--

LOCK TABLES `ezuser_role` WRITE;
/*!40000 ALTER TABLE `ezuser_role` DISABLE KEYS */;
INSERT INTO `ezuser_role` VALUES (11,28,'','',1),(42,31,'','',1),(13,32,'Subtree','/1/2/',3),(13,33,'Subtree','/1/43/',3),(12,34,'','',2),(13,35,'','',4);
/*!40000 ALTER TABLE `ezuser_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezuser_setting`
--

DROP TABLE IF EXISTS `ezuser_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezuser_setting` (
  `is_enabled` int(11) NOT NULL DEFAULT '0',
  `max_login` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezuser_setting`
--

LOCK TABLES `ezuser_setting` WRITE;
/*!40000 ALTER TABLE `ezuser_setting` DISABLE KEYS */;
INSERT INTO `ezuser_setting` VALUES (1,1000,10),(1,10,14);
/*!40000 ALTER TABLE `ezuser_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezuservisit`
--

DROP TABLE IF EXISTS `ezuservisit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezuservisit` (
  `current_visit_timestamp` int(11) NOT NULL DEFAULT '0',
  `failed_login_attempts` int(11) NOT NULL DEFAULT '0',
  `last_visit_timestamp` int(11) NOT NULL DEFAULT '0',
  `login_count` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `ezuservisit_co_visit_count` (`current_visit_timestamp`,`login_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezuservisit`
--

LOCK TABLES `ezuservisit` WRITE;
/*!40000 ALTER TABLE `ezuservisit` DISABLE KEYS */;
INSERT INTO `ezuservisit` VALUES (1301057720,0,1301057720,0,14);
/*!40000 ALTER TABLE `ezuservisit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezvatrule`
--

DROP TABLE IF EXISTS `ezvatrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezvatrule` (
  `country_code` varchar(255) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vat_type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezvatrule`
--

LOCK TABLES `ezvatrule` WRITE;
/*!40000 ALTER TABLE `ezvatrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezvatrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezvatrule_product_category`
--

DROP TABLE IF EXISTS `ezvatrule_product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezvatrule_product_category` (
  `product_category_id` int(11) NOT NULL DEFAULT '0',
  `vatrule_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vatrule_id`,`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezvatrule_product_category`
--

LOCK TABLES `ezvatrule_product_category` WRITE;
/*!40000 ALTER TABLE `ezvatrule_product_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezvatrule_product_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezvattype`
--

DROP TABLE IF EXISTS `ezvattype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezvattype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `percentage` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezvattype`
--

LOCK TABLES `ezvattype` WRITE;
/*!40000 ALTER TABLE `ezvattype` DISABLE KEYS */;
INSERT INTO `ezvattype` VALUES (1,'Std',0);
/*!40000 ALTER TABLE `ezvattype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezview_counter`
--

DROP TABLE IF EXISTS `ezview_counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezview_counter` (
  `count` int(11) NOT NULL DEFAULT '0',
  `node_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezview_counter`
--

LOCK TABLES `ezview_counter` WRITE;
/*!40000 ALTER TABLE `ezview_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezview_counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezwaituntildatevalue`
--

DROP TABLE IF EXISTS `ezwaituntildatevalue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezwaituntildatevalue` (
  `contentclass_attribute_id` int(11) NOT NULL DEFAULT '0',
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_event_id` int(11) NOT NULL DEFAULT '0',
  `workflow_event_version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`workflow_event_id`,`workflow_event_version`),
  KEY `ezwaituntildateevalue_wf_ev_id_wf_ver` (`workflow_event_id`,`workflow_event_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezwaituntildatevalue`
--

LOCK TABLES `ezwaituntildatevalue` WRITE;
/*!40000 ALTER TABLE `ezwaituntildatevalue` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezwaituntildatevalue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezwishlist`
--

DROP TABLE IF EXISTS `ezwishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezwishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productcollection_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezwishlist`
--

LOCK TABLES `ezwishlist` WRITE;
/*!40000 ALTER TABLE `ezwishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezwishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezworkflow`
--

DROP TABLE IF EXISTS `ezworkflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezworkflow` (
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_enabled` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `modifier_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` int(11) NOT NULL DEFAULT '0',
  `workflow_type_string` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezworkflow`
--

LOCK TABLES `ezworkflow` WRITE;
/*!40000 ALTER TABLE `ezworkflow` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezworkflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezworkflow_assign`
--

DROP TABLE IF EXISTS `ezworkflow_assign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezworkflow_assign` (
  `access_type` int(11) NOT NULL DEFAULT '0',
  `as_tree` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node_id` int(11) NOT NULL DEFAULT '0',
  `workflow_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezworkflow_assign`
--

LOCK TABLES `ezworkflow_assign` WRITE;
/*!40000 ALTER TABLE `ezworkflow_assign` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezworkflow_assign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezworkflow_event`
--

DROP TABLE IF EXISTS `ezworkflow_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezworkflow_event` (
  `data_int1` int(11) DEFAULT NULL,
  `data_int2` int(11) DEFAULT NULL,
  `data_int3` int(11) DEFAULT NULL,
  `data_int4` int(11) DEFAULT NULL,
  `data_text1` varchar(255) DEFAULT NULL,
  `data_text2` varchar(255) DEFAULT NULL,
  `data_text3` varchar(255) DEFAULT NULL,
  `data_text4` varchar(255) DEFAULT NULL,
  `data_text5` longtext,
  `description` varchar(50) NOT NULL DEFAULT '',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `placement` int(11) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `workflow_id` int(11) NOT NULL DEFAULT '0',
  `workflow_type_string` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`version`),
  KEY `wid_version_placement` (`workflow_id`,`version`,`placement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezworkflow_event`
--

LOCK TABLES `ezworkflow_event` WRITE;
/*!40000 ALTER TABLE `ezworkflow_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezworkflow_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezworkflow_group`
--

DROP TABLE IF EXISTS `ezworkflow_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezworkflow_group` (
  `created` int(11) NOT NULL DEFAULT '0',
  `creator_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified` int(11) NOT NULL DEFAULT '0',
  `modifier_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezworkflow_group`
--

LOCK TABLES `ezworkflow_group` WRITE;
/*!40000 ALTER TABLE `ezworkflow_group` DISABLE KEYS */;
INSERT INTO `ezworkflow_group` VALUES (1024392098,14,1,1024392098,14,'Standard');
/*!40000 ALTER TABLE `ezworkflow_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezworkflow_group_link`
--

DROP TABLE IF EXISTS `ezworkflow_group_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezworkflow_group_link` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `group_name` varchar(255) DEFAULT NULL,
  `workflow_id` int(11) NOT NULL DEFAULT '0',
  `workflow_version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflow_id`,`group_id`,`workflow_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezworkflow_group_link`
--

LOCK TABLES `ezworkflow_group_link` WRITE;
/*!40000 ALTER TABLE `ezworkflow_group_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezworkflow_group_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ezworkflow_process`
--

DROP TABLE IF EXISTS `ezworkflow_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ezworkflow_process` (
  `activation_date` int(11) DEFAULT NULL,
  `content_id` int(11) NOT NULL DEFAULT '0',
  `content_version` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `event_id` int(11) NOT NULL DEFAULT '0',
  `event_position` int(11) NOT NULL DEFAULT '0',
  `event_state` int(11) DEFAULT NULL,
  `event_status` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_event_id` int(11) NOT NULL DEFAULT '0',
  `last_event_position` int(11) NOT NULL DEFAULT '0',
  `last_event_status` int(11) NOT NULL DEFAULT '0',
  `memento_key` varchar(32) DEFAULT NULL,
  `modified` int(11) NOT NULL DEFAULT '0',
  `node_id` int(11) NOT NULL DEFAULT '0',
  `parameters` longtext,
  `process_key` varchar(32) NOT NULL DEFAULT '',
  `session_key` varchar(32) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `workflow_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezworkflow_process_process_key` (`process_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ezworkflow_process`
--

LOCK TABLES `ezworkflow_process` WRITE;
/*!40000 ALTER TABLE `ezworkflow_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `ezworkflow_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_prefs`
--

DROP TABLE IF EXISTS `user_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_prefs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `biography_hide` tinyint(4) DEFAULT NULL,
  `science_hide` tinyint(4) DEFAULT NULL,
  `fiction_hide` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_prefs`
--

LOCK TABLES `user_prefs` WRITE;
/*!40000 ALTER TABLE `user_prefs` DISABLE KEYS */;
INSERT INTO `user_prefs` VALUES (1,'jane',NULL,1,NULL);
/*!40000 ALTER TABLE `user_prefs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-03 10:31:59
