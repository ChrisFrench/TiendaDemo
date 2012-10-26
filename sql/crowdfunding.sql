-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: crowdfunding
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `l38sx_assets`
--

DROP TABLE IF EXISTS `l38sx_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_assets`
--

LOCK TABLES `l38sx_assets` WRITE;
/*!40000 ALTER TABLE `l38sx_assets` DISABLE KEYS */;
INSERT INTO `l38sx_assets` VALUES (1,0,1,71,0,'root.1','Root Asset','{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}');
INSERT INTO `l38sx_assets` VALUES (2,1,1,2,1,'com_admin','com_admin','{}');
INSERT INTO `l38sx_assets` VALUES (3,1,3,8,1,'com_banners','com_banners','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `l38sx_assets` VALUES (4,1,9,10,1,'com_cache','com_cache','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}');
INSERT INTO `l38sx_assets` VALUES (5,1,11,12,1,'com_checkin','com_checkin','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}');
INSERT INTO `l38sx_assets` VALUES (6,1,13,14,1,'com_config','com_config','{}');
INSERT INTO `l38sx_assets` VALUES (7,1,15,18,1,'com_contact','com_contact','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `l38sx_assets` VALUES (8,1,19,22,1,'com_content','com_content','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}');
INSERT INTO `l38sx_assets` VALUES (9,1,23,24,1,'com_cpanel','com_cpanel','{}');
INSERT INTO `l38sx_assets` VALUES (10,1,25,26,1,'com_installer','com_installer','{\"core.admin\":[],\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}');
INSERT INTO `l38sx_assets` VALUES (11,1,27,28,1,'com_languages','com_languages','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `l38sx_assets` VALUES (12,1,29,30,1,'com_login','com_login','{}');
INSERT INTO `l38sx_assets` VALUES (13,1,31,32,1,'com_mailto','com_mailto','{}');
INSERT INTO `l38sx_assets` VALUES (14,1,33,34,1,'com_massmail','com_massmail','{}');
INSERT INTO `l38sx_assets` VALUES (15,1,35,36,1,'com_media','com_media','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}');
INSERT INTO `l38sx_assets` VALUES (16,1,37,38,1,'com_menus','com_menus','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `l38sx_assets` VALUES (17,1,39,40,1,'com_messages','com_messages','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}');
INSERT INTO `l38sx_assets` VALUES (18,1,41,42,1,'com_modules','com_modules','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `l38sx_assets` VALUES (19,1,43,46,1,'com_newsfeeds','com_newsfeeds','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `l38sx_assets` VALUES (20,1,47,48,1,'com_plugins','com_plugins','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `l38sx_assets` VALUES (21,1,49,50,1,'com_redirect','com_redirect','{\"core.admin\":{\"7\":1},\"core.manage\":[]}');
INSERT INTO `l38sx_assets` VALUES (22,1,51,52,1,'com_search','com_search','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}');
INSERT INTO `l38sx_assets` VALUES (23,1,53,54,1,'com_templates','com_templates','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `l38sx_assets` VALUES (24,1,55,58,1,'com_users','com_users','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `l38sx_assets` VALUES (25,1,59,62,1,'com_weblinks','com_weblinks','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}');
INSERT INTO `l38sx_assets` VALUES (26,1,63,64,1,'com_wrapper','com_wrapper','{}');
INSERT INTO `l38sx_assets` VALUES (27,8,20,21,2,'com_content.category.2','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `l38sx_assets` VALUES (28,3,4,5,2,'com_banners.category.3','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `l38sx_assets` VALUES (29,7,16,17,2,'com_contact.category.4','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `l38sx_assets` VALUES (30,19,44,45,2,'com_newsfeeds.category.5','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `l38sx_assets` VALUES (31,25,60,61,2,'com_weblinks.category.6','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}');
INSERT INTO `l38sx_assets` VALUES (32,24,56,57,1,'com_users.notes.category.7','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
INSERT INTO `l38sx_assets` VALUES (33,1,65,66,1,'com_finder','com_finder','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}');
INSERT INTO `l38sx_assets` VALUES (34,1,67,68,1,'com_joomlaupdate','com_joomlaupdate','{\"core.admin\":[],\"core.manage\":[],\"core.delete\":[],\"core.edit.state\":[]}');
INSERT INTO `l38sx_assets` VALUES (35,1,69,70,1,'com_tienda','tienda','{}');
INSERT INTO `l38sx_assets` VALUES (36,3,6,7,2,'com_banners.category.8','Home Page Banner 1024 X 195','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}');
/*!40000 ALTER TABLE `l38sx_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_associations`
--

DROP TABLE IF EXISTS `l38sx_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_associations` (
  `id` varchar(50) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_associations`
--

LOCK TABLES `l38sx_associations` WRITE;
/*!40000 ALTER TABLE `l38sx_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_banner_clients`
--

DROP TABLE IF EXISTS `l38sx_banner_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_banner_clients`
--

LOCK TABLES `l38sx_banner_clients` WRITE;
/*!40000 ALTER TABLE `l38sx_banner_clients` DISABLE KEYS */;
INSERT INTO `l38sx_banner_clients` VALUES (1,'ICrowdFund','ICrowdFund','ICrowdFund@ICrowdFund.com','',1,0,'0000-00-00 00:00:00','',0,'',-1,0,0);
/*!40000 ALTER TABLE `l38sx_banner_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_banner_tracks`
--

DROP TABLE IF EXISTS `l38sx_banner_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_banner_tracks`
--

LOCK TABLES `l38sx_banner_tracks` WRITE;
/*!40000 ALTER TABLE `l38sx_banner_tracks` DISABLE KEYS */;
INSERT INTO `l38sx_banner_tracks` VALUES ('2012-10-25 01:00:00',1,1,3);
INSERT INTO `l38sx_banner_tracks` VALUES ('2012-10-25 02:00:00',1,1,16);
INSERT INTO `l38sx_banner_tracks` VALUES ('2012-10-25 17:00:00',1,1,1);
/*!40000 ALTER TABLE `l38sx_banner_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_banners`
--

DROP TABLE IF EXISTS `l38sx_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `custombannercode` varchar(2048) NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `params` text NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(255) NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_banners`
--

LOCK TABLES `l38sx_banners` WRITE;
/*!40000 ALTER TABLE `l38sx_banners` DISABLE KEYS */;
INSERT INTO `l38sx_banners` VALUES (1,1,0,'Targeting the Entrepreneur','targeting-the-entrepreneur',0,20,0,'',1,8,'','',0,1,'','{\"imageurl\":\"images\\/banners\\/iCrowdFund-Home-banner.jpg\",\"width\":1020,\"height\":195,\"alt\":\"Targeting the Entrepreneur\"}',0,'',1,1,1,216,'2012-10-25 02:39:26','0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00','2012-10-25 01:53:05','*');
/*!40000 ALTER TABLE `l38sx_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_categories`
--

DROP TABLE IF EXISTS `l38sx_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `extension` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `metadesc` varchar(1024) NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_categories`
--

LOCK TABLES `l38sx_categories` WRITE;
/*!40000 ALTER TABLE `l38sx_categories` DISABLE KEYS */;
INSERT INTO `l38sx_categories` VALUES (1,0,0,0,15,0,'','system','ROOT','root','','',1,0,'0000-00-00 00:00:00',1,'{}','','','',0,'2009-10-18 16:07:09',0,'0000-00-00 00:00:00',0,'*');
INSERT INTO `l38sx_categories` VALUES (2,27,1,1,2,1,'uncategorised','com_content','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:26:37',0,'0000-00-00 00:00:00',0,'*');
INSERT INTO `l38sx_categories` VALUES (3,28,1,3,4,1,'uncategorised','com_banners','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\",\"foobar\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:27:35',0,'0000-00-00 00:00:00',0,'*');
INSERT INTO `l38sx_categories` VALUES (4,29,1,5,6,1,'uncategorised','com_contact','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:27:57',0,'0000-00-00 00:00:00',0,'*');
INSERT INTO `l38sx_categories` VALUES (5,30,1,7,8,1,'uncategorised','com_newsfeeds','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:28:15',0,'0000-00-00 00:00:00',0,'*');
INSERT INTO `l38sx_categories` VALUES (6,31,1,9,10,1,'uncategorised','com_weblinks','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:28:33',0,'0000-00-00 00:00:00',0,'*');
INSERT INTO `l38sx_categories` VALUES (7,32,1,11,12,1,'uncategorised','com_users.notes','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"target\":\"\",\"image\":\"\"}','','','{\"page_title\":\"\",\"author\":\"\",\"robots\":\"\"}',42,'2010-06-28 13:28:33',0,'0000-00-00 00:00:00',0,'*');
INSERT INTO `l38sx_categories` VALUES (8,36,1,13,14,1,'home-page-banner-1024-x-195','com_banners','Home Page Banner 1024 X 195','home-page-banner-1024-x-195','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',216,'2012-10-25 01:52:53',0,'0000-00-00 00:00:00',0,'*');
/*!40000 ALTER TABLE `l38sx_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_contact_details`
--

DROP TABLE IF EXISTS `l38sx_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  `sortname1` varchar(255) NOT NULL,
  `sortname2` varchar(255) NOT NULL,
  `sortname3` varchar(255) NOT NULL,
  `language` char(7) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_contact_details`
--

LOCK TABLES `l38sx_contact_details` WRITE;
/*!40000 ALTER TABLE `l38sx_contact_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_content`
--

DROP TABLE IF EXISTS `l38sx_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `title_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Deprecated in Joomla! 3.0',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(10) unsigned NOT NULL DEFAULT '0',
  `mask` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` varchar(5120) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `parentid` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_content`
--

LOCK TABLES `l38sx_content` WRITE;
/*!40000 ALTER TABLE `l38sx_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_content_frontpage`
--

DROP TABLE IF EXISTS `l38sx_content_frontpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_content_frontpage`
--

LOCK TABLES `l38sx_content_frontpage` WRITE;
/*!40000 ALTER TABLE `l38sx_content_frontpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_content_frontpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_content_rating`
--

DROP TABLE IF EXISTS `l38sx_content_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_content_rating`
--

LOCK TABLES `l38sx_content_rating` WRITE;
/*!40000 ALTER TABLE `l38sx_content_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_content_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_core_log_searches`
--

DROP TABLE IF EXISTS `l38sx_core_log_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_core_log_searches`
--

LOCK TABLES `l38sx_core_log_searches` WRITE;
/*!40000 ALTER TABLE `l38sx_core_log_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_core_log_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_extensions`
--

DROP TABLE IF EXISTS `l38sx_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `element` varchar(100) NOT NULL,
  `folder` varchar(100) NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text NOT NULL,
  `params` text NOT NULL,
  `custom_data` text NOT NULL,
  `system_data` text NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10069 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_extensions`
--

LOCK TABLES `l38sx_extensions` WRITE;
/*!40000 ALTER TABLE `l38sx_extensions` DISABLE KEYS */;
INSERT INTO `l38sx_extensions` VALUES (1,'com_mailto','component','com_mailto','',0,1,1,1,'{\"legacy\":false,\"name\":\"com_mailto\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MAILTO_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (2,'com_wrapper','component','com_wrapper','',0,1,1,1,'{\"legacy\":false,\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (3,'com_admin','component','com_admin','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (4,'com_banners','component','com_banners','',1,1,1,0,'{\"legacy\":false,\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\"}','{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (5,'com_cache','component','com_cache','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (6,'com_categories','component','com_categories','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (7,'com_checkin','component','com_checkin','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"Unknown\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (8,'com_contact','component','com_contact','',1,0,1,0,'{\"legacy\":false,\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\"}','{\"show_contact_category\":\"hide\",\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_misc\":\"1\",\"show_image\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"show_profile\":\"0\",\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"show_headings\":\"1\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"allow_vcard_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_email_form\":\"1\",\"show_email_copy\":\"1\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_category_crumb\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (9,'com_cpanel','component','com_cpanel','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10,'com_installer','component','com_installer','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (11,'com_languages','component','com_languages','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}','{\"administrator\":\"en-GB\",\"site\":\"en-GB\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (12,'com_login','component','com_login','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (13,'com_media','component','com_media','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\"}','{\"upload_extensions\":\"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\",\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\",\"upload_mime_illegal\":\"text\\/html\",\"enable_flash\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (14,'com_menus','component','com_menus','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (15,'com_messages','component','com_messages','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (16,'com_modules','component','com_modules','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (17,'com_newsfeeds','component','com_newsfeeds','',1,0,1,0,'{\"legacy\":false,\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\"}','{\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_word_count\":\"0\",\"show_headings\":\"1\",\"show_name\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"display_num\":\"\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\",\"show_cat_items\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (18,'com_plugins','component','com_plugins','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (19,'com_search','component','com_search','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_search\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_SEARCH_XML_DESCRIPTION\",\"group\":\"\"}','{\"enabled\":\"0\",\"show_date\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (20,'com_templates','component','com_templates','',1,1,1,1,'{\"legacy\":false,\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (21,'com_weblinks','component','com_weblinks','',1,0,1,0,'{\"legacy\":false,\"name\":\"com_weblinks\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}','{\"show_comp_description\":\"1\",\"comp_description\":\"\",\"show_link_hits\":\"1\",\"show_link_description\":\"1\",\"show_other_cats\":\"0\",\"show_headings\":\"0\",\"show_numbers\":\"0\",\"show_report\":\"1\",\"count_clicks\":\"1\",\"target\":\"0\",\"link_icons\":\"\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (22,'com_content','component','com_content','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}','{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"1\",\"show_category\":\"1\",\"link_category\":\"1\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"1\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"1\",\"show_item_navigation\":\"1\",\"show_vote\":\"0\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":\"100\",\"show_icons\":\"1\",\"show_print_icon\":\"1\",\"show_email_icon\":\"1\",\"show_hits\":\"1\",\"show_noauth\":\"0\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"4\",\"num_columns\":\"2\",\"num_links\":\"4\",\"multi_column_order\":\"0\",\"show_subcategory_content\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (23,'com_config','component','com_config','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\"}','{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (24,'com_redirect','component','com_redirect','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (25,'com_users','component','com_users','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\"}','{\"allowUserRegistration\":\"1\",\"new_usertype\":\"2\",\"useractivation\":\"1\",\"frontend_userparams\":\"1\",\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (27,'com_finder','component','com_finder','',1,1,0,0,'{\"legacy\":false,\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\"}','{\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_advanced\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stemmer\":\"snowball\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (28,'com_joomlaupdate','component','com_joomlaupdate','',1,1,0,1,'{\"legacy\":false,\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"February 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (100,'PHPMailer','library','phpmailer','',0,1,1,1,'{\"legacy\":false,\"name\":\"PHPMailer\",\"type\":\"library\",\"creationDate\":\"2001\",\"author\":\"PHPMailer\",\"copyright\":\"(c) 2001-2003, Brent R. Matzelle, (c) 2004-2009, Andy Prevost. All Rights Reserved., (c) 2010-2011, Jim Jagielski. All Rights Reserved.\",\"authorEmail\":\"jimjag@gmail.com\",\"authorUrl\":\"https:\\/\\/code.google.com\\/a\\/apache-extras.org\\/p\\/phpmailer\\/\",\"version\":\"5.2\",\"description\":\"LIB_PHPMAILER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (101,'SimplePie','library','simplepie','',0,1,1,1,'{\"legacy\":false,\"name\":\"SimplePie\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"SimplePie\",\"copyright\":\"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/simplepie.org\\/\",\"version\":\"1.2\",\"description\":\"LIB_SIMPLEPIE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (102,'phputf8','library','phputf8','',0,1,1,1,'{\"legacy\":false,\"name\":\"phputf8\",\"type\":\"library\",\"creationDate\":\"2006\",\"author\":\"Harry Fuecks\",\"copyright\":\"Copyright various authors\",\"authorEmail\":\"hfuecks@gmail.com\",\"authorUrl\":\"http:\\/\\/sourceforge.net\\/projects\\/phputf8\",\"version\":\"0.5\",\"description\":\"LIB_PHPUTF8_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (103,'Joomla! Platform','library','joomla','',0,1,1,1,'{\"legacy\":false,\"name\":\"Joomla! Platform\",\"type\":\"library\",\"creationDate\":\"2008\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"http:\\/\\/www.joomla.org\",\"version\":\"11.4\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (200,'mod_articles_archive','module','mod_articles_archive','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters.\\n\\t\\tAll rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (201,'mod_articles_latest','module','mod_articles_latest','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (202,'mod_articles_popular','module','mod_articles_popular','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (203,'mod_banners','module','mod_banners','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (204,'mod_breadcrumbs','module','mod_breadcrumbs','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (205,'mod_custom','module','mod_custom','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (206,'mod_feed','module','mod_feed','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (207,'mod_footer','module','mod_footer','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (208,'mod_login','module','mod_login','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (209,'mod_menu','module','mod_menu','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (210,'mod_articles_news','module','mod_articles_news','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (211,'mod_random_image','module','mod_random_image','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (212,'mod_related_items','module','mod_related_items','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (213,'mod_search','module','mod_search','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_search\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_SEARCH_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (214,'mod_stats','module','mod_stats','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (215,'mod_syndicate','module','mod_syndicate','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"May 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (216,'mod_users_latest','module','mod_users_latest','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"December 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (217,'mod_weblinks','module','mod_weblinks','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_weblinks\",\"type\":\"module\",\"creationDate\":\"July 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (218,'mod_whosonline','module','mod_whosonline','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (219,'mod_wrapper','module','mod_wrapper','',0,1,1,0,'{\"legacy\":false,\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"October 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (220,'mod_articles_category','module','mod_articles_category','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (221,'mod_articles_categories','module','mod_articles_categories','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (222,'mod_languages','module','mod_languages','',0,1,1,1,'{\"legacy\":false,\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (223,'mod_finder','module','mod_finder','',0,1,0,0,'{\"legacy\":false,\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (300,'mod_custom','module','mod_custom','',1,1,1,1,'{\"legacy\":false,\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (301,'mod_feed','module','mod_feed','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (302,'mod_latest','module','mod_latest','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (303,'mod_logged','module','mod_logged','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"January 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (304,'mod_login','module','mod_login','',1,1,1,1,'{\"legacy\":false,\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"March 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (305,'mod_menu','module','mod_menu','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (307,'mod_popular','module','mod_popular','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (308,'mod_quickicon','module','mod_quickicon','',1,1,1,1,'{\"legacy\":false,\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (309,'mod_status','module','mod_status','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_status\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_STATUS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (310,'mod_submenu','module','mod_submenu','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (311,'mod_title','module','mod_title','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (312,'mod_toolbar','module','mod_toolbar','',1,1,1,1,'{\"legacy\":false,\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (313,'mod_multilangstatus','module','mod_multilangstatus','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"September 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\"}','{\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (314,'mod_version','module','mod_version','',1,1,1,0,'{\"legacy\":false,\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\"}','{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (400,'plg_authentication_gmail','plugin','gmail','authentication',0,0,1,0,'{\"legacy\":false,\"name\":\"plg_authentication_gmail\",\"type\":\"plugin\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_GMAIL_XML_DESCRIPTION\",\"group\":\"\"}','{\"applysuffix\":\"0\",\"suffix\":\"\",\"verifypeer\":\"1\",\"user_blacklist\":\"\"}','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `l38sx_extensions` VALUES (401,'plg_authentication_joomla','plugin','joomla','authentication',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_AUTH_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (402,'plg_authentication_ldap','plugin','ldap','authentication',0,0,1,0,'{\"legacy\":false,\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\"}','{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}','','',0,'0000-00-00 00:00:00',3,0);
INSERT INTO `l38sx_extensions` VALUES (404,'plg_content_emailcloak','plugin','emailcloak','content',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\"}','{\"mode\":\"1\"}','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `l38sx_extensions` VALUES (405,'plg_content_geshi','plugin','geshi','content',0,0,1,0,'{\"legacy\":false,\"name\":\"plg_content_geshi\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"qbnz.com\\/highlighter\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_GESHI_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',2,0);
INSERT INTO `l38sx_extensions` VALUES (406,'plg_content_loadmodule','plugin','loadmodule','content',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\"}','{\"style\":\"xhtml\"}','','',0,'2011-09-18 15:22:50',0,0);
INSERT INTO `l38sx_extensions` VALUES (407,'plg_content_pagebreak','plugin','pagebreak','content',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\"}','{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}','','',0,'0000-00-00 00:00:00',4,0);
INSERT INTO `l38sx_extensions` VALUES (408,'plg_content_pagenavigation','plugin','pagenavigation','content',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"January 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\"}','{\"position\":\"1\"}','','',0,'0000-00-00 00:00:00',5,0);
INSERT INTO `l38sx_extensions` VALUES (409,'plg_content_vote','plugin','vote','content',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',6,0);
INSERT INTO `l38sx_extensions` VALUES (410,'plg_editors_codemirror','plugin','codemirror','editors',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\"}','{\"linenumbers\":\"0\",\"tabmode\":\"indent\"}','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `l38sx_extensions` VALUES (411,'plg_editors_none','plugin','none','editors',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Unknown\",\"copyright\":\"\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"\",\"version\":\"2.5.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',2,0);
INSERT INTO `l38sx_extensions` VALUES (412,'plg_editors_tinymce','plugin','tinymce','editors',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-2012\",\"author\":\"Moxiecode Systems AB\",\"copyright\":\"Moxiecode Systems AB\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"tinymce.moxiecode.com\\/\",\"version\":\"3.5.4.1\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\"}','{\"mode\":\"1\",\"skin\":\"0\",\"entity_encoding\":\"raw\",\"lang_mode\":\"0\",\"lang_code\":\"en\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"extended_elements\":\"\",\"toolbar\":\"top\",\"toolbar_align\":\"left\",\"html_height\":\"550\",\"html_width\":\"750\",\"resizing\":\"true\",\"resize_horizontal\":\"false\",\"element_path\":\"1\",\"fonts\":\"1\",\"paste\":\"1\",\"searchreplace\":\"1\",\"insertdate\":\"1\",\"format_date\":\"%Y-%m-%d\",\"inserttime\":\"1\",\"format_time\":\"%H:%M:%S\",\"colors\":\"1\",\"table\":\"1\",\"smilies\":\"1\",\"media\":\"1\",\"hr\":\"1\",\"directionality\":\"1\",\"fullscreen\":\"1\",\"style\":\"1\",\"layer\":\"1\",\"xhtmlxtras\":\"1\",\"visualchars\":\"1\",\"nonbreaking\":\"1\",\"template\":\"1\",\"blockquote\":\"1\",\"wordcount\":\"1\",\"advimage\":\"1\",\"advlink\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"inlinepopups\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}','','',0,'0000-00-00 00:00:00',3,0);
INSERT INTO `l38sx_extensions` VALUES (413,'plg_editors-xtd_article','plugin','article','editors-xtd',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"October 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `l38sx_extensions` VALUES (414,'plg_editors-xtd_image','plugin','image','editors-xtd',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',2,0);
INSERT INTO `l38sx_extensions` VALUES (415,'plg_editors-xtd_pagebreak','plugin','pagebreak','editors-xtd',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',3,0);
INSERT INTO `l38sx_extensions` VALUES (416,'plg_editors-xtd_readmore','plugin','readmore','editors-xtd',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',4,0);
INSERT INTO `l38sx_extensions` VALUES (417,'plg_search_categories','plugin','categories','search',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_search_categories\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (418,'plg_search_contacts','plugin','contacts','search',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_search_contacts\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_CONTACTS_XML_DESCRIPTION\",\"group\":\"\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (419,'plg_search_content','plugin','content','search',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_search_content\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (420,'plg_search_newsfeeds','plugin','newsfeeds','search',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_search_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (421,'plg_search_weblinks','plugin','weblinks','search',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_search_weblinks\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (422,'plg_system_languagefilter','plugin','languagefilter','system',0,0,1,1,'{\"legacy\":false,\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"July 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `l38sx_extensions` VALUES (423,'plg_system_p3p','plugin','p3p','system',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_system_p3p\",\"type\":\"plugin\",\"creationDate\":\"September 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_P3P_XML_DESCRIPTION\",\"group\":\"\"}','{\"headers\":\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\"}','','',0,'0000-00-00 00:00:00',2,0);
INSERT INTO `l38sx_extensions` VALUES (424,'plg_system_cache','plugin','cache','system',0,0,1,1,'{\"legacy\":false,\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"February 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\"}','{\"browsercache\":\"0\",\"cachetime\":\"15\"}','','',0,'0000-00-00 00:00:00',9,0);
INSERT INTO `l38sx_extensions` VALUES (425,'plg_system_debug','plugin','debug','system',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\"}','{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}','','',0,'0000-00-00 00:00:00',4,0);
INSERT INTO `l38sx_extensions` VALUES (426,'plg_system_log','plugin','log','system',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',5,0);
INSERT INTO `l38sx_extensions` VALUES (427,'plg_system_redirect','plugin','redirect','system',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',6,0);
INSERT INTO `l38sx_extensions` VALUES (428,'plg_system_remember','plugin','remember','system',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',7,0);
INSERT INTO `l38sx_extensions` VALUES (429,'plg_system_sef','plugin','sef','system',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',8,0);
INSERT INTO `l38sx_extensions` VALUES (430,'plg_system_logout','plugin','logout','system',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',3,0);
INSERT INTO `l38sx_extensions` VALUES (431,'plg_user_contactcreator','plugin','contactcreator','user',0,0,1,1,'{\"legacy\":false,\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"August 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\"}','{\"autowebpage\":\"\",\"category\":\"34\",\"autopublish\":\"0\"}','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `l38sx_extensions` VALUES (432,'plg_user_joomla','plugin','joomla','user',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2009 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','{\"autoregister\":\"1\"}','','',0,'0000-00-00 00:00:00',2,0);
INSERT INTO `l38sx_extensions` VALUES (433,'plg_user_profile','plugin','profile','user',0,0,1,1,'{\"legacy\":false,\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"January 2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\"}','{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (434,'plg_extension_joomla','plugin','joomla','extension',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"May 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `l38sx_extensions` VALUES (435,'plg_content_joomla','plugin','joomla','content',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (436,'plg_system_languagecode','plugin','languagecode','system',0,0,1,0,'{\"legacy\":false,\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"November 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',10,0);
INSERT INTO `l38sx_extensions` VALUES (437,'plg_quickicon_joomlaupdate','plugin','joomlaupdate','quickicon',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (438,'plg_quickicon_extensionupdate','plugin','extensionupdate','quickicon',0,1,1,1,'{\"legacy\":false,\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (439,'plg_captcha_recaptcha','plugin','recaptcha','captcha',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\"}','{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (440,'plg_system_highlight','plugin','highlight','system',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',7,0);
INSERT INTO `l38sx_extensions` VALUES (441,'plg_content_finder','plugin','finder','content',0,0,1,0,'{\"legacy\":false,\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (442,'plg_finder_categories','plugin','categories','finder',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `l38sx_extensions` VALUES (443,'plg_finder_contacts','plugin','contacts','finder',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',2,0);
INSERT INTO `l38sx_extensions` VALUES (444,'plg_finder_content','plugin','content','finder',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',3,0);
INSERT INTO `l38sx_extensions` VALUES (445,'plg_finder_newsfeeds','plugin','newsfeeds','finder',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',4,0);
INSERT INTO `l38sx_extensions` VALUES (446,'plg_finder_weblinks','plugin','weblinks','finder',0,1,1,0,'{\"legacy\":false,\"name\":\"plg_finder_weblinks\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PLG_FINDER_WEBLINKS_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',5,0);
INSERT INTO `l38sx_extensions` VALUES (500,'atomic','template','atomic','',0,1,1,0,'{\"legacy\":false,\"name\":\"atomic\",\"type\":\"template\",\"creationDate\":\"10\\/10\\/09\",\"author\":\"Ron Severdia\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"contact@kontentdesign.com\",\"authorUrl\":\"http:\\/\\/www.kontentdesign.com\",\"version\":\"2.5.0\",\"description\":\"TPL_ATOMIC_XML_DESCRIPTION\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (502,'bluestork','template','bluestork','',1,1,1,0,'{\"legacy\":false,\"name\":\"bluestork\",\"type\":\"template\",\"creationDate\":\"07\\/02\\/09\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"TPL_BLUESTORK_XML_DESCRIPTION\",\"group\":\"\"}','{\"useRoundedCorners\":\"1\",\"showSiteName\":\"0\",\"textBig\":\"0\",\"highContrast\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (503,'beez_20','template','beez_20','',0,1,1,0,'{\"legacy\":false,\"name\":\"beez_20\",\"type\":\"template\",\"creationDate\":\"25 November 2009\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"2.5.0\",\"description\":\"TPL_BEEZ2_XML_DESCRIPTION\",\"group\":\"\"}','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"templatecolor\":\"nature\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (504,'hathor','template','hathor','',1,1,1,0,'{\"legacy\":false,\"name\":\"hathor\",\"type\":\"template\",\"creationDate\":\"May 2010\",\"author\":\"Andrea Tarr\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"hathor@tarrconsulting.com\",\"authorUrl\":\"http:\\/\\/www.tarrconsulting.com\",\"version\":\"2.5.0\",\"description\":\"TPL_HATHOR_XML_DESCRIPTION\",\"group\":\"\"}','{\"showSiteName\":\"0\",\"colourChoice\":\"0\",\"boldText\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (505,'beez5','template','beez5','',0,1,1,0,'{\"legacy\":false,\"name\":\"beez5\",\"type\":\"template\",\"creationDate\":\"21 May 2010\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"2.5.0\",\"description\":\"TPL_BEEZ5_XML_DESCRIPTION\",\"group\":\"\"}','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"html5\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (600,'English (United Kingdom)','language','en-GB','',0,1,1,1,'{\"legacy\":false,\"name\":\"English (United Kingdom)\",\"type\":\"language\",\"creationDate\":\"2008-03-15\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.5\",\"description\":\"en-GB site language\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (601,'English (United Kingdom)','language','en-GB','',1,1,1,1,'{\"legacy\":false,\"name\":\"English (United Kingdom)\",\"type\":\"language\",\"creationDate\":\"2008-03-15\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.5\",\"description\":\"en-GB administrator language\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (700,'files_joomla','file','joomla','',0,1,1,1,'{\"legacy\":false,\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"September 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2012 Open Source Matters. All rights reserved\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"2.5.7\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (800,'PKG_JOOMLA','package','pkg_joomla','',0,1,1,1,'{\"legacy\":false,\"name\":\"PKG_JOOMLA\",\"type\":\"package\",\"creationDate\":\"2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"http:\\/\\/www.joomla.org\",\"version\":\"2.5.0\",\"description\":\"PKG_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10000,'System - Dioscouri','plugin','dioscouri','system',0,1,1,0,'{\"legacy\":false,\"name\":\"System - Dioscouri\",\"type\":\"plugin\",\"creationDate\":\"June 2012\",\"author\":\"Dioscouri Design\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"3.2.0\",\"description\":\"Adds the Dioscouri Library to the Autoloader\",\"group\":\"\"}','{\"embedjquery\":\"0\",\"embedjqueryui\":\"0\",\"embedjqueryuicss\":\"0\",\"embedjquerytools\":\"0\",\"jquerynoconflict\":\"1\",\"activeAdmin\":\"1\",\"embedbootstrap\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10001,'Dioscouri Library','library','dioscouri','',0,1,1,0,'{\"legacy\":false,\"name\":\"Dioscouri Library\",\"type\":\"library\",\"creationDate\":\"June 2012\",\"author\":\"Dioscouri Design\",\"copyright\":\"Copyright (C) 2012 Dioscouri Design. All rights reserved.\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"www.dioscouri.com\",\"version\":\"3.2.0\",\"description\":\"\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10002,'Dioscouri  - Admin-side Submenu','module','mod_dsc_submenu','',1,1,2,0,'{\"legacy\":true,\"name\":\"Dioscouri  - Admin-side Submenu\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.9.0\",\"description\":\"Displays the admin-side submen with optional bootstrapped theme and dropdowns\",\"group\":\"\"}','{\"moduleclass_sfx\":\"\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10003,'Tienda - Breadcrumbs','module','mod_tienda_breadcrumbs','',0,1,0,0,'{\"legacy\":true,\"name\":\"Tienda - Breadcrumbs\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"MOD_TIENDA_BREADCRUMBS_MODULEDESC\",\"group\":\"\"}','{\"showhome\":\"1\",\"hometext\":\"Home\",\"showcatroot\":\"1\",\"roottext\":\"\",\"showLast\":\"1\",\"linkself\":\"1\",\"separator\":\"\",\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10004,'Tienda - Shopping Cart','module','mod_tienda_cart','',0,1,0,0,'{\"legacy\":true,\"name\":\"Tienda - Shopping Cart\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"MOD_TIENDA_CART_MODULEDESC\",\"group\":\"\"}','{\"display_null\":\"1\",\"display_lightbox\":\"0\",\"null_text\":\"No items in your cart\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10005,'Tienda - Product Categories','module','mod_tienda_categories','',0,1,0,0,'{\"legacy\":true,\"name\":\"Tienda - Product Categories\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"MOD_TIENDA_CATEGORIES_MODULEDESC\",\"group\":\"\"}','{\"itemid\":\"\",\"depthlevel\":\"3\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10006,'Tienda - Compared Products','module','mod_tienda_compared_products','',0,1,0,0,'{\"legacy\":true,\"name\":\"Tienda - Compared Products\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"MOD_TIENDA_COMPARED_PRODUCTS_MODULEDESC\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10007,'Tienda - Currency Selector','module','mod_tienda_currency','',0,1,0,0,'{\"legacy\":true,\"name\":\"Tienda - Currency Selector\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"MOD_TIENDA_CURRENCY_MODULEDESC\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10008,'Tienda - Layered Navigation','module','mod_tienda_layered_navigation','',0,1,0,0,'{\"legacy\":true,\"name\":\"Tienda - Layered Navigation\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"Layered navigation that allow users to filter products by any parameter they want\",\"group\":\"\"}','{\"multi_mode\":\"1\",\"filter_category\":\"1\",\"roottext\":\"\",\"filter_manufacturer\":\"1\",\"filter_rating\":\"1\",\"filter_attributes\":\"1\",\"excluded_attributes\":\"\",\"filter_price\":\"1\",\"attributes_case_insensitive\":\"1\",\"auto_price_range\":\"1\",\"price_range_set\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10009,'Tienda - Product Manufacturers','module','mod_tienda_manufacturers','',0,1,0,0,'{\"legacy\":true,\"name\":\"Tienda - Product Manufacturers\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"MOD_TIENDA_MANUFACTURERS_MODULEDESC\",\"group\":\"\"}','{\"itemid\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10010,'Tienda - My Ordered Items','module','mod_tienda_my_orderitems','',0,1,0,0,'{\"legacy\":true,\"name\":\"Tienda - My Ordered Items\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"MOD_TIENDA_MY_ORDERITEMS_MODULEDESC\",\"group\":\"\"}','{\"display_title\":\"1\",\"display_image\":\"0\",\"display_image_width\":\"36\",\"display_image_height\":\"36\",\"display_downloads_only\":\"1\",\"max_number\":\"5\",\"null_text\":\"No Products Found\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10011,'Tienda - My Orders','module','mod_tienda_my_orders','',0,1,0,0,'{\"legacy\":true,\"name\":\"Tienda - My Orders\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"MOD_TIENDA_MY_ORDERITEMS_MODULEDESC\",\"group\":\"\"}','{\"display_id\":\"1\",\"display_date\":\"1\",\"display_image_link\":\"1\",\"display_amount\":\"1\",\"display_state\":\"1\",\"max_number\":\"5\",\"null_text\":\"No Orders Found\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10012,'Tienda - Popular Products','module','mod_tienda_popular_products','',0,1,0,0,'{\"legacy\":true,\"name\":\"Tienda - Popular Products\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"MOD_TIENDA_POPULAR_PRODUCTS_MODULEDESC\",\"group\":\"\"}','{\"display_title\":\"1\",\"display_image\":\"1\",\"display_image_link\":\"1\",\"display_image_width\":\"\",\"display_image_height\":\"\",\"display_description\":\"1\",\"display_price\":\"1\",\"max_number\":\"\",\"display_style\":\"flat\",\"display_grid_items\":\"3\",\"display_null\":\"1\",\"null_text\":\"No Products Set\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10013,'Tienda - Product Price Filters','module','mod_tienda_pricefilters','',0,1,0,0,'{\"legacy\":true,\"name\":\"Tienda - Product Price Filters\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"MOD_TIENDA_PRICEFILTERS_MODULEDESC\",\"group\":\"\"}','{\"filter_upper_limit\":\"1000\",\"round_digit\":\"100\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10014,'Tienda - Featured Products','module','mod_tienda_products','',0,1,0,0,'{\"legacy\":true,\"name\":\"Tienda - Featured Products\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"MOD_TIENDA_PRODUCTS_MODULEDESC\",\"group\":\"\"}','{\"category\":\"\",\"manufacturer\":\"\",\"id_set\":\"\",\"price_from\":\"\",\"price_to\":\"\",\"random\":\"0\",\"order\":\"0\",\"direction\":\"ASC\",\"itemid\":\"\",\"display_title\":\"1\",\"display_image\":\"1\",\"display_image_link\":\"1\",\"display_image_width\":\"\",\"display_image_height\":\"\",\"display_description\":\"1\",\"display_price\":\"1\",\"max_number\":\"\",\"display_style\":\"flat\",\"display_grid_items\":\"3\",\"display_null\":\"1\",\"null_text\":\"No Products Set\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10015,'Tienda - Quick Icon','module','mod_tienda_quickicon','',1,1,2,0,'{\"legacy\":true,\"name\":\"Tienda - Quick Icon\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"MOD_TIENDA_QUICKICON_MODULEDESC\",\"group\":\"\"}','{\"text\":\"Tienda Dashboard\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10016,'Tienda - Recent Orders','module','mod_tienda_recentorders','',1,1,2,0,'{\"legacy\":true,\"name\":\"Tienda - Recent Orders\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"MOD_TIENDA_RECENTORDERS_MODULEDESC\",\"group\":\"\"}','{\"hide_title\":\"1\",\"num_orders\":\"5\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10017,'Tienda - Sales Statistics','module','mod_tienda_salestatistics','',1,1,2,0,'{\"legacy\":true,\"name\":\"Tienda - Sales Statistics\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"MOD_TIENDA_SALESTATISTICS_MODULEDESC\",\"group\":\"\"}','{\"hide_title\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10018,'Tienda - Product Search','module','mod_tienda_search','',0,1,0,0,'{\"legacy\":true,\"name\":\"Tienda - Product Search\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"MOD_TIENDA_SEARCH_MODULEDESC\",\"group\":\"\"}','{\"filter_text\":\"\",\"category_filter\":\"1\",\"filter_fields\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10019,'Tienda - Admin Search','module','mod_tienda_search_admin','',1,1,2,0,'{\"legacy\":true,\"name\":\"Tienda - Admin Search\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"MOD_TIENDA_SEARCH_ADMIN_MODULEDESC\",\"group\":\"\"}','{\"display_link\":\"0\",\"text\":\"Tienda Dashboard\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10020,'Tienda - User Addresses','module','mod_tienda_useraddress','',1,1,2,0,'{\"legacy\":true,\"name\":\"Tienda - User Addresses\",\"type\":\"module\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"MOD_TIENDA_USERADDRESS_MODULEDESC\",\"group\":\"\"}','{\"display_null\":\"1\",\"null_text\":\"No Addresses Set\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10021,'Tienda - Bug Report','plugin','bug_report','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Bug Report\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_BUG_REPORT_PLUGINDESC\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10022,'Tienda - Product Content Plugin','plugin','tienda_content_product','content',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Product Content Plugin\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"PLG_TIENDA_CONTENT_PRODUCT_CONTENT_PRODUCT_PLUGINDESC\",\"group\":\"\"}','{\"quantity_restriction\":\"0\",\"show_description\":\"1\",\"show_name\":\"1\",\"show_model\":\"1\",\"show_sku\":\"1\",\"show_image\":\"1\",\"show_price\":\"1\",\"show_buy\":\"1\",\"show_children\":\"1\",\"show_files\":\"1\",\"show_relations\":\"1\",\"show_requirements\":\"1\",\"layout\":\"view\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10023,'Tienda - Custom Fields','plugin','customfields','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Custom Fields\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"PLG_TIENDA_CUSTOMFIELDS_PLUGINDESC\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10024,'Tienda - Generic Data Export','plugin','genericexporter','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Generic Data Export\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"PLG_TIENDA_GENERICEXPORT_PLUGINDESC\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10025,'Tienda - Plugin for sending products to Google Products','plugin','googleproducts','tienda',0,0,1,0,'{\"legacy\":true,\"name\":\"Tienda - Plugin for sending products to Google Products\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"PLG_TIENDA_GOOGLEPRODUCTS_PLUGINDESC\",\"group\":\"\"}','{\"username\":\"PLG_TIENDA_GOOGLEPRODUCTS_GOOGLE_ACCOUNT_USERNAME_DEFAULT\",\"password\":\"PLG_TIENDA_GOOGLEPRODUCTS_GOOGLE_ACCOUNT_PASSWORD_DEFAULT\",\"account_id\":\"PLG_TIENDA_GOOGLEPRODUCTS_ACCOUNT_ID_DEFAULT\",\"taxonomy\":\"PLG_TIENDA_GOOGLEPRODUCTS_TAXONOMY_SYSTEM_DEFAULT\",\"auto_sync\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10026,'Tienda - Payment - 2Checkout','plugin','payment_2checkout','tienda',0,0,1,0,'{\"legacy\":true,\"name\":\"Tienda - Payment - 2Checkout\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"PLG_TIENDA_PAYMENT_2CHECKOUT_PLGDESCR\",\"group\":\"\"}','{\"sid\":\"\",\"secret_word\":\"\",\"demo\":\"1\",\"sandbox\":\"0\",\"automatic_language\":\"1\",\"default_language\":\"en\",\"default_payment\":\"CC\",\"skip_landing\":\"0\",\"page\":\"multi\",\"failed_order_state\":\"10\",\"payment_received_order_state\":\"17\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10027,'Tienda - Payment - Offline Payments','plugin','payment_offline','tienda',0,0,1,0,'{\"legacy\":true,\"name\":\"Tienda - Payment - Offline Payments\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"PLG_TIENDA_PAYMENT_OFFLINE_PLUGINDESC\",\"group\":\"\"}','{\"enable_check\":\"1\",\"enable_moneyorder\":\"1\",\"enable_cash\":\"1\",\"enable_wire\":\"1\",\"enable_invoice\":\"1\",\"enable_other\":\"1\",\"articleid\":\"\",\"default\":\"check\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10028,'Tienda - Payment - Paypal Payments Std','plugin','payment_paypal','tienda',0,0,1,0,'{\"legacy\":true,\"name\":\"Tienda - Payment - Paypal Payments Std\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"PLG_TIENDA_PAYMENT_PAYPAL_PLUGINDESC\",\"group\":\"\"}','{\"merchant_email\":\"\",\"currency\":\"USD\",\"secure_post\":\"0\",\"img_url_std\":\"https:\\/\\/www.paypal.com\\/en_US\\/i\\/btn\\/x-click-but20.gif\",\"img_url_mixed\":\"https:\\/\\/www.paypal.com\\/en_US\\/i\\/btn\\/x-click-but02.gif\",\"sandbox\":\"0\",\"sandbox_merchant_email\":\"\",\"sandbox_customer_email\":\"\",\"articleid\":\"\",\"display_article_title\":\"0\",\"failed_order_state\":\"10\",\"payment_received_order_state\":\"17\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10029,'Tienda - Payment - Paypal Pro','plugin','payment_paypalpro','tienda',0,0,1,0,'{\"legacy\":true,\"name\":\"Tienda - Payment - Paypal Pro\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri Design\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"PLG_TIENDA_PAYEMNT_PAYPALPRO_PLUGINDESC\",\"group\":\"\"}','{\"api_username\":\"\",\"api_password\":\"\",\"api_signature\":\"\",\"currency\":\"PLG_TIENDA_PAYMENT_PAYPALPRO_PAYPALPRO_CURRENCY_DEFAULT\",\"secure_post\":\"0\",\"sandbox\":\"0\",\"sandbox_api_username\":\"\",\"sandbox_api_password\":\"\",\"sandbox_api_signature\":\"\",\"articleid\":\"\",\"display_article_title\":\"0\",\"failed_order_state\":\"10\",\"payment_received_order_state\":\"17\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10030,'Tienda - Report - List of User\'s with Abandoned Cart','plugin','report_abandoned_cart','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Report - List of User\'s with Abandoned Cart\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_THIS_REPORTS_ON_DISPLAYING_LIST_OF_USERS_WITH_ITEMS_NOT_PURCHASED\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10031,'Tienda - Report - Best Selling Products','plugin','report_bestsellers','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Report - Best Selling Products\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_THIS_REPORTS_ON_BEST_SELLING_PRODUCTS\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10032,'Tienda - Report - Products in User\'s Cart','plugin','report_cart','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Report - Products in User\'s Cart\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_THIS_REPORTS_ON_TOTAL_NUMBER_OF_CARTS_IN_EACH_PRODUCT\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10033,'Tienda - Report - Inventory Levels','plugin','report_inventory_levels','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Report - Inventory Levels\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_THIS_REPORTS_THE_INVENTORY_LEVELS\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10034,'Tienda - Report - Low Stock Products','plugin','report_lowstock','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Report - Low Stock Products\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_THIS_REPORTS_ON_LOW_STOCK_PRODUCTS\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10035,'Tienda - Report - Most Downloaded Files','plugin','report_mostdownloadedfiles','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Report - Most Downloaded Files\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_THIS_REPORTS_ON_MOST_DOWNLOADED_FILES\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10036,'Tienda - Report - Ordered Products','plugin','report_ordered_products','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Report - Ordered Products\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_THIS_REPORT_DISPLAYS_ORDERED_PRODUCTS\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10037,'Tienda - Report - Pre-Payment Orders','plugin','report_prepayments','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Report - Pre-Payment Orders\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_THIS_REPORTS_ON_PRE-PAYMENT_ORDERS\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10038,'Tienda - Report - Sales','plugin','report_sales','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Report - Sales\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_THIS_REPORTS_ON_SALES_DURING_DATE_RANGE\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10039,'Tienda - Report - Sales by Manufacturer','plugin','report_salesbymanufacturer','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Report - Sales by Manufacturer\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_THIS_REPORT_DISPLAYS_THE_SALES_BY_EACH_MANUFACTURER_DURING_A_SELECTED_TIME_PERIOD\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10040,'Tienda - Report - Subscriptions','plugin','report_subscriptions','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Report - Subscriptions\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_THIS_REPORT_LISTS_ALL_USERS_WHO_OPENED_A_NEW_SUBSCRIPTION_DURING_THE_SELECTED_TIME_PERIOD\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10041,'Search - Tienda','plugin','tienda','search',0,1,1,0,'{\"legacy\":true,\"name\":\"Search - Tienda\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_ENABLES_SEARCHING_TIENDA_PRODUCTS_AND_CATEGORIES_IN_CORE_SEARCH_COMPONENT\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10042,'Tienda - Shipping - Fedex','plugin','shipping_fedex','tienda',0,0,1,0,'{\"legacy\":true,\"name\":\"Tienda - Shipping - Fedex\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"PLG_TIENDA_SHIPPING_FEDEX_DESC\",\"group\":\"\"}','{\"site_mode\":\"0\",\"key\":\"\",\"password\":\"\",\"account\":\"\",\"meter\":\"\",\"dropoff\":\"0\",\"services\":\"FEDEX_GROUND, STANDARD_OVERNIGHT\",\"packaging\":\"YOUR_PACKAGING\",\"weight_unit\":\"KG\",\"dimension_unit\":\"CM\",\"charge_tax\":\"0\",\"taxclass\":\"\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10043,'Tienda - Shipping - Standard Shipping Methods','plugin','shipping_standard','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Shipping - Standard Shipping Methods\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_PLUGIN_SHIPPING_STANDARD_DESC\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10044,'Tienda - Shipping - UPS','plugin','shipping_ups','tienda',0,0,1,0,'{\"legacy\":true,\"name\":\"Tienda - Shipping - UPS\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"PLG_TIENDA_SHIPPING_UPS_DESC\",\"group\":\"\"}','{\"key\":\"\",\"password\":\"\",\"account\":\"\",\"shipper_number\":\"\",\"services\":\"11\",\"packaging\":\"02\",\"weight_unit\":\"KG\",\"dimension_unit\":\"CM\",\"pickup_type\":\"01\",\"customer_classification\":\"\",\"declare_value\":\"1\",\"currency_code\":\"USD\",\"charge_tax\":\"0\",\"taxclass\":\"\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10045,'Tienda - Shipping - USPS','plugin','shipping_usps','tienda',0,0,1,0,'{\"legacy\":true,\"name\":\"Tienda - Shipping - USPS\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"PLG_TIENDA_SHIPPING_USPS_DESC\",\"group\":\"\"}','{\"username\":\"\",\"password\":\"\",\"services\":\"PARCEL, PRIORITY\",\"packaging\":\"FLAT RATE BOX\",\"weight_unit\":\"LB\",\"dimension_unit\":\"IN\",\"charge_tax\":\"0\",\"taxclass\":\"\",\"show_debug\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10046,'Tienda - System Plugin for Checking Subscriptions','plugin','tienda_subscriptions','system',0,0,1,0,'{\"legacy\":true,\"name\":\"Tienda - System Plugin for Checking Subscriptions\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"PLG_TIENDA_SYSTEM_TIENDA_SUBSCRIPTIONS_DESC\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10047,'System - Tienda','plugin','tienda','system',0,1,1,0,'{\"legacy\":true,\"name\":\"System - Tienda\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"Handles system events and overrides for Tienda\",\"group\":\"\"}','{\"disable_error_reporting\":\"0\",\"site_override_user\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10048,'Tienda - Tool - Csv Importer','plugin','tool_csvimporter','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Tool - Csv Importer\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_THIS_TOOL_IMPORTS_DATA_FROM_A_CSV_FILE_TO_TIENDA\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10049,'Tienda - Tool - Install Sample Data','plugin','tool_installsampledata','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Tool - Install Sample Data\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_THIS_TOOL_INSTALL_SAMPLE_DATA_TO_TIENDA\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10050,'Tienda - Tool - RedShop Migration','plugin','tool_redshopmigration','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Tool - RedShop Migration\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_THIS_TOOL_MIGRATES_DATA_FROM_REDSHOP_TO_TIENDA\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10051,'Tienda - Tool - VirtueMart Migration','plugin','tool_virtuemartmigration','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Tool - VirtueMart Migration\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_THIS_TOOL_MIGRATES_DATA_FROM_VM_TO_TIENDA\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10052,'Tienda - Tool - XCart Migration','plugin','tool_xcartmigration','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Tool - XCart Migration\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_THIS_TOOL_MIGRATES_DATA_FROM_XCART_TO_TIENDA\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10053,'Tienda - Tool - XML Importer','plugin','tool_xmlimporter','tienda',0,1,1,0,'{\"legacy\":true,\"name\":\"Tienda - Tool - XML Importer\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_THIS_TOOL_IMPORTS_DATA_FROM_AN_XML_FILE_TO_TIENDA\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10054,'QuickIcon - Tienda Icon','plugin','tiendaicon','quickicon',0,1,1,0,'{\"legacy\":true,\"name\":\"QuickIcon - Tienda Icon\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"PLG_TIENDA_SYSTEM_TIENDA_QUICKICON_DESC\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10055,'User - Tienda','plugin','tienda','user',0,1,1,0,'{\"legacy\":true,\"name\":\"User - Tienda\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"COM_TIENDA_HANDLES_USER_EVENTS_FOR_TIENDA\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10056,'Tienda - Payment - Authorize.net','plugin','payment_authorizedotnet','tienda',0,0,1,0,'{\"legacy\":true,\"name\":\"Tienda - Payment - Authorize.net\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"PLG_TIENDA_PAYMENT_AUTHORIZEDOTNET_PLGDESC\",\"group\":\"\"}','{\"login_id\":\"\",\"tran_key\":\"\",\"md5_hash\":\"\",\"secure_post\":\"0\",\"sandbox\":\"0\",\"sandbox_login_id\":\"\",\"sandbox_tran_key\":\"\",\"sandbox_md5_hash\":\"\",\"failed_order_state\":\"10\",\"payment_received_order_state\":\"17\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10057,'Tienda - Payment - Google Checkout','plugin','payment_googlecheckout','tienda',0,0,1,0,'{\"legacy\":true,\"name\":\"Tienda - Payment - Google Checkout\",\"type\":\"plugin\",\"creationDate\":\"October 2011\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"PLG_TIENDA_GOOGLECHECKOUT_PLUGINDESCR\",\"group\":\"\"}','{\"merchant_id\":\"\",\"merchant_key\":\"\",\"currency\":\"COM_TIENDA_GOOGLECHECKOUT_CURRENCY_DEFAULT\",\"sandbox\":\"0\",\"sandbox_merchant_id\":\"\",\"sandbox_merchant_key\":\"\",\"articleid\":\"\",\"display_article_title\":\"0\",\"failed_order_state\":\"10\",\"payment_received_order_state\":\"17\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10058,'tienda','component','com_tienda','',1,1,0,0,'{\"legacy\":true,\"name\":\"Tienda\",\"type\":\"component\",\"creationDate\":\"March 12 2012\",\"author\":\"Dioscouri\",\"copyright\":\"2012 Dioscouri.com\",\"authorEmail\":\"info@dioscouri.com\",\"authorUrl\":\"http:\\/\\/www.dioscouri.com\",\"version\":\"0.10.0\",\"description\":\"An e-commerce application for Joomla\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10060,'rt_missioncontrol','template','rt_missioncontrol','',1,1,1,0,'{\"legacy\":false,\"name\":\"rt_missioncontrol\",\"type\":\"template\",\"creationDate\":\"April 10, 2012\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"2.6\",\"description\":\"MC_TEMPLATE_DESC\",\"group\":\"\"}','{\"adminTitle\":\"Joomla Administrator\",\"templateWidth\":\"variable\",\"dashboard\":\"MissionControl is a brand-new take on the Joomla Administrator template.  Primary objectives during development were clean modern design, optimal usability, configurable colors and logo, and enhanced functionality via optimizations and new extensions.\",\"menuwidth\":\"small\",\"extendmenu\":\"off\",\"enableGravatar\":\"1\",\"enableSessionBar\":\"1\",\"enableTransitions\":\"enabled\",\"enableQuickEditor\":\"1\",\"enableViewSite\":\"1\",\"enableQuickCheckin\":\"0\",\"enableQuickCacheClean\":\"1\",\"enableFancyHeaders\":\"fancy\",\"showhelp\":\"1\",\"showhelpbutton\":\"1\",\"showlangmenu\":\"1\",\"body_text_color\":\"#333333\",\"body_link_color\":\"#4486BA\",\"header_bg_color\":\"#333333\",\"header_text_color\":\"#CCCCCC\",\"header_link_color\":\"#FFFFFF\",\"header_shadow_color\":\"#000000\",\"tab_bg_color\":\"#4D4D4D\",\"tab_text_color\":\"#FFFFFF\",\"special_bg_color\":\"#C62D2D\",\"special_text_color\":\"#FFFFFF\",\"active_bg_color\":\"#4F9BD8\",\"active_text_color\":\"#FFFFFF\",\"hover_bg_color\":\"#88B719\",\"hover_text_color\":\"#FFFFFF\"}','{\"last_update\":1350943346}','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10061,'System - MissionControl Support','plugin','missioncontrol','system',0,1,1,0,'{\"legacy\":false,\"name\":\"System - MissionControl Support\",\"type\":\"plugin\",\"creationDate\":\"April 10, 2012\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"2.6\",\"description\":\"MissionControl Support Plugin\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `l38sx_extensions` VALUES (10062,'System - RokTracking','plugin','roktracking','system',0,1,1,0,'{\"legacy\":false,\"name\":\"System - RokTracking\",\"type\":\"plugin\",\"creationDate\":\"April 10, 2012\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"2.6\",\"description\":\"User Tracking Plugin\",\"group\":\"\"}','{\"userpurgedays\":\"14\",\"adminpurgedays\":\"14\",\"trackusers\":\"1\",\"trackadmins\":\"1\"}','','',0,'0000-00-00 00:00:00',1,0);
INSERT INTO `l38sx_extensions` VALUES (10063,'RokQuickLinks','module','mod_rokquicklinks','',1,1,1,0,'{\"legacy\":false,\"name\":\"RokQuickLinks\",\"type\":\"module\",\"creationDate\":\"April 10, 2012\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"2.6\",\"description\":\"MC_RQL_ROKQUICKLINKS_DESC\",\"group\":\"\"}','{\"iconpath\":\"\\/administrator\\/modules\\/mod_rokquicklinks\\/tmpl\\/icons\\/\",\"quickfields\":\"[{\'icon\':\'newspaper_add.png\',\'target\':\'self\',\'link\':\'index.php?option=com_content&task=article.edit\',\'title\':\'Add Article\'},{\'icon\':\'images.png\',\'target\':\'self\',\'link\':\'index.php?option=com_media\',\'title\':\'Media Manager\'},{\'icon\':\'drawer_open.png\',\'target\':\'self\',\'link\':\'index.php?option=com_categories&section=com_content\',\'title\':\'Category Manager\'},{\'icon\':\'cog.png\',\'target\':\'self\',\'link\':\'index.php?option=com_config\',\'title\':\'Configuration\'},{\'icon\':\'brick.png\',\'target\':\'self\',\'link\':\'index.php?option=com_installer\',\'title\':\'Install New\'},{\'icon\':\'color_management.png\',\'target\':\'self\',\'link\':\'index.php?option=com_templates\',\'title\':\'Templates\'}]\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10064,'RokUserStats','module','mod_rokuserstats','',1,1,1,0,'{\"legacy\":false,\"name\":\"RokUserStats\",\"type\":\"module\",\"creationDate\":\"April 10, 2012\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"2.6\",\"description\":\"MC_RUS_ROKUSERSTATS_DESC\",\"group\":\"\"}','{\"showstats\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10065,'RokStats','module','mod_rokstats','',0,1,1,0,'{\"legacy\":false,\"name\":\"RokStats\",\"type\":\"module\",\"creationDate\":\"April 10, 2012\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"2.6\",\"description\":\"MC_RS_ROKUSERSTATS_DESC\",\"group\":\"\"}','{\"sessiontime\":\"\",\"showcurrentactiveusers\":\"1\",\"showactiveguests\":\"1\",\"showactiveregistered\":\"1\",\"showregisteredusernames\":\"0\",\"showuniqueviststoday\":\"1\",\"showuniquevistsyesterday\":\"1\",\"showvisitsthisweek\":\"1\",\"showvisitspreviousweek\":\"1\",\"showtotalarticles\":\"0\",\"shownewarticlesthisweek\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10066,'RokUserChart','module','mod_rokuserchart','',1,1,1,0,'{\"legacy\":false,\"name\":\"RokUserChart\",\"type\":\"module\",\"creationDate\":\"April 10, 2012\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"2.6\",\"description\":\"MC_RUC_DESC\",\"group\":\"\"}','{\"extra_class\":\"\",\"history\":\"7\",\"width\":\"285\",\"height\":\"120\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10067,'RokAdminAudit','module','mod_rokadminaudit','',1,1,1,0,'{\"legacy\":false,\"name\":\"RokAdminAudit\",\"type\":\"module\",\"creationDate\":\"April 10, 2012\",\"author\":\"RocketTheme, LLC\",\"copyright\":\"(C) 2005 - 2012 RocketTheme, LLC. All rights reserved.\",\"authorEmail\":\"support@rockettheme.com\",\"authorUrl\":\"http:\\/\\/www.rockettheme.com\",\"version\":\"2.6\",\"description\":\"MC_RAA_ROKADMINAUDIT_DESC\",\"group\":\"\"}','{\"limit\":\"5\",\"detail_filter\":\"low\",\"enableGravatar\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
INSERT INTO `l38sx_extensions` VALUES (10068,'default','template','default','',0,1,1,0,'{\"legacy\":false,\"name\":\"default\",\"type\":\"template\",\"creationDate\":\"March 2012\",\"author\":\"Ammonite Networks\",\"copyright\":\"Ammonite Networks\",\"authorEmail\":\"chris@ammonitenetworks.com\",\"authorUrl\":\"http:\\/\\/www.ammonitenetworks.com\",\"version\":\"0.1.0\",\"description\":\"Default Template\",\"group\":\"\"}','{\"pagetitle_suffix\":\"\",\"generator\":\"\",\"layout\":\"default.php\",\"display_component\":\"1\",\"display_pagetitle\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0);
/*!40000 ALTER TABLE `l38sx_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_filters`
--

DROP TABLE IF EXISTS `l38sx_finder_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_filters`
--

LOCK TABLES `l38sx_finder_filters` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_links`
--

DROP TABLE IF EXISTS `l38sx_finder_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_links`
--

LOCK TABLES `l38sx_finder_links` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_links_terms0`
--

DROP TABLE IF EXISTS `l38sx_finder_links_terms0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_links_terms0`
--

LOCK TABLES `l38sx_finder_links_terms0` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_links_terms0` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_links_terms0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_links_terms1`
--

DROP TABLE IF EXISTS `l38sx_finder_links_terms1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_links_terms1`
--

LOCK TABLES `l38sx_finder_links_terms1` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_links_terms1` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_links_terms1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_links_terms2`
--

DROP TABLE IF EXISTS `l38sx_finder_links_terms2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_links_terms2`
--

LOCK TABLES `l38sx_finder_links_terms2` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_links_terms2` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_links_terms2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_links_terms3`
--

DROP TABLE IF EXISTS `l38sx_finder_links_terms3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_links_terms3`
--

LOCK TABLES `l38sx_finder_links_terms3` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_links_terms3` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_links_terms3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_links_terms4`
--

DROP TABLE IF EXISTS `l38sx_finder_links_terms4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_links_terms4`
--

LOCK TABLES `l38sx_finder_links_terms4` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_links_terms4` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_links_terms4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_links_terms5`
--

DROP TABLE IF EXISTS `l38sx_finder_links_terms5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_links_terms5`
--

LOCK TABLES `l38sx_finder_links_terms5` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_links_terms5` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_links_terms5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_links_terms6`
--

DROP TABLE IF EXISTS `l38sx_finder_links_terms6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_links_terms6`
--

LOCK TABLES `l38sx_finder_links_terms6` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_links_terms6` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_links_terms6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_links_terms7`
--

DROP TABLE IF EXISTS `l38sx_finder_links_terms7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_links_terms7`
--

LOCK TABLES `l38sx_finder_links_terms7` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_links_terms7` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_links_terms7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_links_terms8`
--

DROP TABLE IF EXISTS `l38sx_finder_links_terms8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_links_terms8`
--

LOCK TABLES `l38sx_finder_links_terms8` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_links_terms8` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_links_terms8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_links_terms9`
--

DROP TABLE IF EXISTS `l38sx_finder_links_terms9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_links_terms9`
--

LOCK TABLES `l38sx_finder_links_terms9` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_links_terms9` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_links_terms9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_links_termsa`
--

DROP TABLE IF EXISTS `l38sx_finder_links_termsa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_links_termsa`
--

LOCK TABLES `l38sx_finder_links_termsa` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_links_termsa` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_links_termsa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_links_termsb`
--

DROP TABLE IF EXISTS `l38sx_finder_links_termsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_links_termsb`
--

LOCK TABLES `l38sx_finder_links_termsb` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_links_termsb` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_links_termsb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_links_termsc`
--

DROP TABLE IF EXISTS `l38sx_finder_links_termsc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_links_termsc`
--

LOCK TABLES `l38sx_finder_links_termsc` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_links_termsc` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_links_termsc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_links_termsd`
--

DROP TABLE IF EXISTS `l38sx_finder_links_termsd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_links_termsd`
--

LOCK TABLES `l38sx_finder_links_termsd` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_links_termsd` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_links_termsd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_links_termse`
--

DROP TABLE IF EXISTS `l38sx_finder_links_termse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_links_termse`
--

LOCK TABLES `l38sx_finder_links_termse` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_links_termse` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_links_termse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_links_termsf`
--

DROP TABLE IF EXISTS `l38sx_finder_links_termsf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_links_termsf`
--

LOCK TABLES `l38sx_finder_links_termsf` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_links_termsf` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_links_termsf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_taxonomy`
--

DROP TABLE IF EXISTS `l38sx_finder_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_taxonomy`
--

LOCK TABLES `l38sx_finder_taxonomy` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_taxonomy` DISABLE KEYS */;
INSERT INTO `l38sx_finder_taxonomy` VALUES (1,0,'ROOT',0,0,0);
/*!40000 ALTER TABLE `l38sx_finder_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `l38sx_finder_taxonomy_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_taxonomy_map`
--

LOCK TABLES `l38sx_finder_taxonomy_map` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_taxonomy_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_taxonomy_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_terms`
--

DROP TABLE IF EXISTS `l38sx_finder_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_terms`
--

LOCK TABLES `l38sx_finder_terms` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_terms_common`
--

DROP TABLE IF EXISTS `l38sx_finder_terms_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_terms_common`
--

LOCK TABLES `l38sx_finder_terms_common` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_terms_common` DISABLE KEYS */;
INSERT INTO `l38sx_finder_terms_common` VALUES ('a','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('about','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('after','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('ago','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('all','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('am','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('an','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('and','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('ani','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('any','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('are','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('aren\'t','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('as','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('at','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('be','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('but','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('by','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('for','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('from','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('get','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('go','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('how','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('if','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('in','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('into','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('is','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('isn\'t','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('it','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('its','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('me','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('more','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('most','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('must','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('my','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('new','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('no','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('none','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('not','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('noth','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('nothing','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('of','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('off','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('often','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('old','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('on','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('onc','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('once','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('onli','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('only','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('or','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('other','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('our','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('ours','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('out','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('over','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('page','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('she','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('should','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('small','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('so','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('some','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('than','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('thank','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('that','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('the','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('their','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('theirs','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('them','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('then','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('there','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('these','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('they','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('this','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('those','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('thus','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('time','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('times','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('to','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('too','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('true','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('under','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('until','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('up','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('upon','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('use','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('user','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('users','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('veri','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('version','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('very','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('via','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('want','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('was','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('way','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('were','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('what','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('when','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('where','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('whi','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('which','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('who','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('whom','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('whose','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('why','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('wide','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('will','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('with','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('within','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('without','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('would','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('yes','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('yet','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('you','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('your','en');
INSERT INTO `l38sx_finder_terms_common` VALUES ('yours','en');
/*!40000 ALTER TABLE `l38sx_finder_terms_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_tokens`
--

DROP TABLE IF EXISTS `l38sx_finder_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_tokens`
--

LOCK TABLES `l38sx_finder_tokens` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `l38sx_finder_tokens_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_tokens_aggregate`
--

LOCK TABLES `l38sx_finder_tokens_aggregate` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_tokens_aggregate` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_tokens_aggregate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_finder_types`
--

DROP TABLE IF EXISTS `l38sx_finder_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_finder_types`
--

LOCK TABLES `l38sx_finder_types` WRITE;
/*!40000 ALTER TABLE `l38sx_finder_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_finder_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_languages`
--

DROP TABLE IF EXISTS `l38sx_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lang_code` char(7) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_native` varchar(50) NOT NULL,
  `sef` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `sitename` varchar(1024) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_languages`
--

LOCK TABLES `l38sx_languages` WRITE;
/*!40000 ALTER TABLE `l38sx_languages` DISABLE KEYS */;
INSERT INTO `l38sx_languages` VALUES (1,'en-GB','English (UK)','English (UK)','en','en','','','','',1,0,1);
/*!40000 ALTER TABLE `l38sx_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_menu`
--

DROP TABLE IF EXISTS `l38sx_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(1024) NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `ordering` int(11) NOT NULL DEFAULT '0' COMMENT 'The relative ordering of the menu item in the tree.',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`,`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_path` (`path`(255)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_menu`
--

LOCK TABLES `l38sx_menu` WRITE;
/*!40000 ALTER TABLE `l38sx_menu` DISABLE KEYS */;
INSERT INTO `l38sx_menu` VALUES (1,'','Menu_Item_Root','root','','','','',1,0,0,0,0,0,'0000-00-00 00:00:00',0,0,'',0,'',0,51,0,'*',0);
INSERT INTO `l38sx_menu` VALUES (2,'menu','com_banners','Banners','','Banners','index.php?option=com_banners','component',0,1,1,4,0,0,'0000-00-00 00:00:00',0,0,'class:banners',0,'',1,10,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (3,'menu','com_banners','Banners','','Banners/Banners','index.php?option=com_banners','component',0,2,2,4,0,0,'0000-00-00 00:00:00',0,0,'class:banners',0,'',2,3,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (4,'menu','com_banners_categories','Categories','','Banners/Categories','index.php?option=com_categories&extension=com_banners','component',0,2,2,6,0,0,'0000-00-00 00:00:00',0,0,'class:banners-cat',0,'',4,5,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (5,'menu','com_banners_clients','Clients','','Banners/Clients','index.php?option=com_banners&view=clients','component',0,2,2,4,0,0,'0000-00-00 00:00:00',0,0,'class:banners-clients',0,'',6,7,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (6,'menu','com_banners_tracks','Tracks','','Banners/Tracks','index.php?option=com_banners&view=tracks','component',0,2,2,4,0,0,'0000-00-00 00:00:00',0,0,'class:banners-tracks',0,'',8,9,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (7,'menu','com_contact','Contacts','','Contacts','index.php?option=com_contact','component',0,1,1,8,0,0,'0000-00-00 00:00:00',0,0,'class:contact',0,'',11,16,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (8,'menu','com_contact','Contacts','','Contacts/Contacts','index.php?option=com_contact','component',0,7,2,8,0,0,'0000-00-00 00:00:00',0,0,'class:contact',0,'',12,13,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (9,'menu','com_contact_categories','Categories','','Contacts/Categories','index.php?option=com_categories&extension=com_contact','component',0,7,2,6,0,0,'0000-00-00 00:00:00',0,0,'class:contact-cat',0,'',14,15,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (10,'menu','com_messages','Messaging','','Messaging','index.php?option=com_messages','component',0,1,1,15,0,0,'0000-00-00 00:00:00',0,0,'class:messages',0,'',17,22,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (11,'menu','com_messages_add','New Private Message','','Messaging/New Private Message','index.php?option=com_messages&task=message.add','component',0,10,2,15,0,0,'0000-00-00 00:00:00',0,0,'class:messages-add',0,'',18,19,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (12,'menu','com_messages_read','Read Private Message','','Messaging/Read Private Message','index.php?option=com_messages','component',0,10,2,15,0,0,'0000-00-00 00:00:00',0,0,'class:messages-read',0,'',20,21,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (13,'menu','com_newsfeeds','News Feeds','','News Feeds','index.php?option=com_newsfeeds','component',0,1,1,17,0,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds',0,'',23,28,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (14,'menu','com_newsfeeds_feeds','Feeds','','News Feeds/Feeds','index.php?option=com_newsfeeds','component',0,13,2,17,0,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds',0,'',24,25,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (15,'menu','com_newsfeeds_categories','Categories','','News Feeds/Categories','index.php?option=com_categories&extension=com_newsfeeds','component',0,13,2,6,0,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds-cat',0,'',26,27,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (16,'menu','com_redirect','Redirect','','Redirect','index.php?option=com_redirect','component',0,1,1,24,0,0,'0000-00-00 00:00:00',0,0,'class:redirect',0,'',41,42,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (17,'menu','com_search','Basic Search','','Basic Search','index.php?option=com_search','component',0,1,1,19,0,0,'0000-00-00 00:00:00',0,0,'class:search',0,'',33,34,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (18,'menu','com_weblinks','Weblinks','','Weblinks','index.php?option=com_weblinks','component',0,1,1,21,0,0,'0000-00-00 00:00:00',0,0,'class:weblinks',0,'',35,40,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (19,'menu','com_weblinks_links','Links','','Weblinks/Links','index.php?option=com_weblinks','component',0,18,2,21,0,0,'0000-00-00 00:00:00',0,0,'class:weblinks',0,'',36,37,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (20,'menu','com_weblinks_categories','Categories','','Weblinks/Categories','index.php?option=com_categories&extension=com_weblinks','component',0,18,2,6,0,0,'0000-00-00 00:00:00',0,0,'class:weblinks-cat',0,'',38,39,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (21,'menu','com_finder','Smart Search','','Smart Search','index.php?option=com_finder','component',0,1,1,27,0,0,'0000-00-00 00:00:00',0,0,'class:finder',0,'',31,32,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (22,'menu','com_joomlaupdate','Joomla! Update','','Joomla! Update','index.php?option=com_joomlaupdate','component',0,1,1,28,0,0,'0000-00-00 00:00:00',0,0,'class:joomlaupdate',0,'',41,42,0,'*',1);
INSERT INTO `l38sx_menu` VALUES (101,'mainmenu','Home','home','','home','index.php?option=com_content&view=featured','component',1,1,1,22,0,0,'0000-00-00 00:00:00',0,1,'',9,'{\"featured_categories\":[\"\"],\"layout_type\":\"blog\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"3\",\"num_columns\":\"3\",\"num_links\":\"0\",\"multi_column_order\":\"1\",\"orderby_pri\":\"\",\"orderby_sec\":\"front\",\"order_date\":\"\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_vote\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_icons\":\"\",\"show_print_icon\":\"\",\"show_email_icon\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"1\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',29,30,1,'*',0);
INSERT INTO `l38sx_menu` VALUES (102,'main','COM_TIENDA','com-tienda','','com-tienda','index.php?option=com_tienda','component',0,1,1,10058,0,0,'0000-00-00 00:00:00',0,1,'../media/com_tienda/images/tienda_16.png',0,'',43,44,0,'',1);
INSERT INTO `l38sx_menu` VALUES (103,'mainmenu','browse','browse','existing projects','browse','index.php?option=com_tienda&view=products&filter_category=1','component',1,1,1,10058,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',45,46,0,'*',0);
INSERT INTO `l38sx_menu` VALUES (104,'mainmenu','Start','start','your project','start','index.php?option=com_tienda&view=accounts','component',1,1,1,10058,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',47,48,0,'*',0);
INSERT INTO `l38sx_menu` VALUES (105,'mainmenu','learn','learn','how it works','learn','index.php?option=com_tienda&view=dashboard','component',1,1,1,10058,0,0,'0000-00-00 00:00:00',0,1,'',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',49,50,0,'*',0);
/*!40000 ALTER TABLE `l38sx_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_menu_types`
--

DROP TABLE IF EXISTS `l38sx_menu_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_menu_types`
--

LOCK TABLES `l38sx_menu_types` WRITE;
/*!40000 ALTER TABLE `l38sx_menu_types` DISABLE KEYS */;
INSERT INTO `l38sx_menu_types` VALUES (1,'mainmenu','Main Menu','The main menu for the site');
/*!40000 ALTER TABLE `l38sx_menu_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_messages`
--

DROP TABLE IF EXISTS `l38sx_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_messages`
--

LOCK TABLES `l38sx_messages` WRITE;
/*!40000 ALTER TABLE `l38sx_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_messages_cfg`
--

DROP TABLE IF EXISTS `l38sx_messages_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_messages_cfg`
--

LOCK TABLES `l38sx_messages_cfg` WRITE;
/*!40000 ALTER TABLE `l38sx_messages_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_messages_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_modules`
--

DROP TABLE IF EXISTS `l38sx_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `note` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_modules`
--

LOCK TABLES `l38sx_modules` WRITE;
/*!40000 ALTER TABLE `l38sx_modules` DISABLE KEYS */;
INSERT INTO `l38sx_modules` VALUES (1,'Main Menu','','',1,'primary-navigation',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',1,0,'{\"menutype\":\"mainmenu\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"0\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}',0,'*');
INSERT INTO `l38sx_modules` VALUES (2,'Login','','',1,'login',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_login',1,1,'',1,'*');
INSERT INTO `l38sx_modules` VALUES (3,'Popular Articles','','',3,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_popular',3,1,'{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}',1,'*');
INSERT INTO `l38sx_modules` VALUES (4,'Recently Added Articles','','',4,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_latest',3,1,'{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}',1,'*');
INSERT INTO `l38sx_modules` VALUES (8,'Toolbar','','',1,'toolbar',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_toolbar',3,1,'',1,'*');
INSERT INTO `l38sx_modules` VALUES (9,'Quick Icons','','',1,'icon',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_quickicon',3,1,'',1,'*');
INSERT INTO `l38sx_modules` VALUES (10,'Logged-in Users','','',2,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_logged',3,1,'{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\",\"automatic_title\":\"1\"}',1,'*');
INSERT INTO `l38sx_modules` VALUES (12,'Admin Menu','','',1,'menu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',3,1,'{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}',1,'*');
INSERT INTO `l38sx_modules` VALUES (13,'Admin Submenu','','',1,'submenu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_submenu',3,1,'',1,'*');
INSERT INTO `l38sx_modules` VALUES (14,'User Status','','',2,'status',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_status',3,1,'',1,'*');
INSERT INTO `l38sx_modules` VALUES (15,'Title','','',1,'title',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_title',3,1,'',1,'*');
INSERT INTO `l38sx_modules` VALUES (16,'Login Form','','',7,'position-7',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_login',1,1,'{\"greeting\":\"1\",\"name\":\"0\"}',0,'*');
INSERT INTO `l38sx_modules` VALUES (17,'Breadcrumbs','','',1,'position-2',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_breadcrumbs',1,1,'{\"moduleclass_sfx\":\"\",\"showHome\":\"1\",\"homeText\":\"Home\",\"showComponent\":\"1\",\"separator\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}',0,'*');
INSERT INTO `l38sx_modules` VALUES (79,'Multilanguage status','','',1,'status',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_multilangstatus',3,1,'{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*');
INSERT INTO `l38sx_modules` VALUES (86,'Joomla Version','','',1,'footer',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_version',3,1,'{\"format\":\"short\",\"product\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*');
INSERT INTO `l38sx_modules` VALUES (87,'Dioscouri  - Admin-side Submenu','','',1,'submenu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_dsc_submenu',1,1,'{\"moduleclass_sfx\":\"\",\"layout\":\"_:default\"}',1,'*');
INSERT INTO `l38sx_modules` VALUES (88,'Tienda - Breadcrumbs','','',0,'left',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_tienda_breadcrumbs',1,1,'',0,'*');
INSERT INTO `l38sx_modules` VALUES (89,'Tienda - Shopping Cart','','',0,'left',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_tienda_cart',1,1,'',0,'*');
INSERT INTO `l38sx_modules` VALUES (90,'Tienda - Product Categories','','',0,'left',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_tienda_categories',1,1,'',0,'*');
INSERT INTO `l38sx_modules` VALUES (91,'Tienda - Compared Products','','',0,'left',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_tienda_compared_products',1,1,'',0,'*');
INSERT INTO `l38sx_modules` VALUES (92,'Tienda - Currency Selector','','',0,'left',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_tienda_currency',1,1,'',0,'*');
INSERT INTO `l38sx_modules` VALUES (93,'Tienda - Layered Navigation','','',0,'left',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_tienda_layered_navigation',1,1,'',0,'*');
INSERT INTO `l38sx_modules` VALUES (94,'Tienda - Product Manufacturers','','',0,'left',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_tienda_manufacturers',1,1,'',0,'*');
INSERT INTO `l38sx_modules` VALUES (95,'Tienda - My Ordered Items','','',0,'left',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_tienda_my_orderitems',1,1,'',0,'*');
INSERT INTO `l38sx_modules` VALUES (96,'Tienda - My Orders','','',0,'left',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_tienda_my_orders',1,1,'',0,'*');
INSERT INTO `l38sx_modules` VALUES (97,'Tienda - Popular Products','','',0,'left',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_tienda_popular_products',1,1,'',0,'*');
INSERT INTO `l38sx_modules` VALUES (98,'Tienda - Product Price Filters','','',0,'left',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_tienda_pricefilters',1,1,'',0,'*');
INSERT INTO `l38sx_modules` VALUES (99,'Tienda - Featured Products','','',0,'left',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_tienda_products',1,1,'',0,'*');
INSERT INTO `l38sx_modules` VALUES (100,'Tienda - Quick Icon','','',0,'icon',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_tienda_quickicon',1,1,'',1,'*');
INSERT INTO `l38sx_modules` VALUES (101,'Tienda - Recent Orders','','',0,'tienda_dashboard_right',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_tienda_recentorders',1,1,'',1,'*');
INSERT INTO `l38sx_modules` VALUES (102,'Tienda - Sales Statistics','','',0,'tienda_dashboard_right',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_tienda_salestatistics',1,1,'',1,'*');
INSERT INTO `l38sx_modules` VALUES (103,'Tienda - Product Search','','',0,'left',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_tienda_search',1,1,'',0,'*');
INSERT INTO `l38sx_modules` VALUES (104,'Tienda - Admin Search','','',0,'tienda_dashboard_right',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_tienda_search_admin',1,1,'',1,'*');
INSERT INTO `l38sx_modules` VALUES (105,'Tienda - User Addresses','','',0,'tienda_user_main',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_tienda_useraddress',1,1,'',1,'*');
INSERT INTO `l38sx_modules` VALUES (107,'Quick Links','','',1,'dashboard',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_rokquicklinks',1,1,'{\"quickfields\":\"[{\'icon\':\'newspaper_add.png\',\'link\':\'index.php?option=com_content&amp;task=add\',\'title\':\'Add Article\'},{\'icon\':\'images.png\',\'link\':\'index.php?option=com_media\',\'title\':\'Media Manager\'},{\'icon\':\'drawer_open.png\',\'link\':\'index.php?option=com_categories&amp;section=com_content\',\'title\':\'Category Manager\'},{\'icon\':\'cog.png\',\'link\':\'index.php?option=com_config\',\'title\':\'Configuration\'},{\'icon\':\'brick.png\',\'link\':\'index.php?option=com_installer\',\'title\':\'Install New\'},{\'icon\':\'color_management.png\',\'link\':\'index.php?option=com_templates\',\'title\':\'Templates\'}]\"}',1,'en-GB');
INSERT INTO `l38sx_modules` VALUES (109,'Statistics Overview','','',1,'sidebar',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_rokuserstats',1,1,'{\"purgedays\":\"30\"}',1,'en-GB');
INSERT INTO `l38sx_modules` VALUES (111,'Site Statistics','','',1,'left',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_rokstats',1,1,'{\"sessiontime\":\"\",\"showcurrentactiveusers\":\"1\",\"showactiveguests\":\"1\",\"showactiveregistered\":\"1\",\"showregisteredusernames\":\"0\",\"showuniqueviststoday\":\"1\",\"showuniquevistsyesterday\":\"1\",\"showvisitsthisweek\":\"1\",\"showvisitspreviousweek\":\"1\",\"showtotalarticles\":\"0\",\"shownewarticlesthisweek\":\"0\"}',0,'en-GB');
INSERT INTO `l38sx_modules` VALUES (113,'User Activity Chart','','',2,'sidebar',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_rokuserchart',1,1,'{\"extra_class\":\"\",\"history\":\"7\",\"width\":\"285\",\"height\":\"120\"}',1,'en-GB');
INSERT INTO `l38sx_modules` VALUES (115,'Admin Audit Trail','','',3,'sidebar',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_rokadminaudit',1,1,'{\"userpurgedays\":\"14\",\"adminpurgedays\":\"14\",\"trackusers\":\"1\",\"trackadmins\":\"1\"}',1,'en-GB');
INSERT INTO `l38sx_modules` VALUES (116,'Search','','',1,'search',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_finder',1,0,'{\"searchfilter\":\"\",\"show_autosuggest\":\"1\",\"show_advanced\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"field_size\":25,\"alt_label\":\"\",\"show_label\":\"1\",\"label_pos\":\"top\",\"show_button\":\"0\",\"button_pos\":\"right\",\"opensearch\":\"1\",\"opensearch_title\":\"\"}',0,'*');
INSERT INTO `l38sx_modules` VALUES (117,'Home Page Banner','','',1,'banner',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_banners',1,0,'{\"target\":\"1\",\"count\":\"1\",\"cid\":\"1\",\"catid\":[\"8\"],\"tag_search\":\"0\",\"ordering\":\"0\",\"header_text\":\"\",\"footer_text\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\"}',0,'*');
INSERT INTO `l38sx_modules` VALUES (118,'Footer Terms','','<p>Terms<br />Privacy Policy<br />Distrobution</p>\r\n<p>Contact Us</p>',0,'footer1',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*');
INSERT INTO `l38sx_modules` VALUES (119,'Footer Learn More','','<p>Learn More<br />Why iCrowd Fund?<br />Features<br />Pricing<br />FAQ</p>\r\n<p>Help</p>',1,'footer2',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*');
INSERT INTO `l38sx_modules` VALUES (120,'Footer Customer Happiness','','<p>Customer Happiness<br />Campaigner<br />Contributor</p>\r\n<p>About Us<br />Press<br />Careers</p>',1,'footer3',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*');
INSERT INTO `l38sx_modules` VALUES (121,'Footer Social News','','<p>Visit our blog</p>\r\n<p> </p>\r\n<p> </p>\r\n<p>Sign up for iCrowdFund News</p>',1,'footer4',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_custom',1,0,'{\"prepare_content\":\"1\",\"backgroundimage\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}',0,'*');
/*!40000 ALTER TABLE `l38sx_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_modules_menu`
--

DROP TABLE IF EXISTS `l38sx_modules_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_modules_menu`
--

LOCK TABLES `l38sx_modules_menu` WRITE;
/*!40000 ALTER TABLE `l38sx_modules_menu` DISABLE KEYS */;
INSERT INTO `l38sx_modules_menu` VALUES (1,0);
INSERT INTO `l38sx_modules_menu` VALUES (2,0);
INSERT INTO `l38sx_modules_menu` VALUES (3,0);
INSERT INTO `l38sx_modules_menu` VALUES (4,0);
INSERT INTO `l38sx_modules_menu` VALUES (6,0);
INSERT INTO `l38sx_modules_menu` VALUES (7,0);
INSERT INTO `l38sx_modules_menu` VALUES (8,0);
INSERT INTO `l38sx_modules_menu` VALUES (9,0);
INSERT INTO `l38sx_modules_menu` VALUES (10,0);
INSERT INTO `l38sx_modules_menu` VALUES (12,0);
INSERT INTO `l38sx_modules_menu` VALUES (13,0);
INSERT INTO `l38sx_modules_menu` VALUES (14,0);
INSERT INTO `l38sx_modules_menu` VALUES (15,0);
INSERT INTO `l38sx_modules_menu` VALUES (16,0);
INSERT INTO `l38sx_modules_menu` VALUES (17,0);
INSERT INTO `l38sx_modules_menu` VALUES (79,0);
INSERT INTO `l38sx_modules_menu` VALUES (86,0);
INSERT INTO `l38sx_modules_menu` VALUES (87,0);
INSERT INTO `l38sx_modules_menu` VALUES (100,0);
INSERT INTO `l38sx_modules_menu` VALUES (101,0);
INSERT INTO `l38sx_modules_menu` VALUES (102,0);
INSERT INTO `l38sx_modules_menu` VALUES (104,0);
INSERT INTO `l38sx_modules_menu` VALUES (105,0);
INSERT INTO `l38sx_modules_menu` VALUES (107,0);
INSERT INTO `l38sx_modules_menu` VALUES (109,0);
INSERT INTO `l38sx_modules_menu` VALUES (111,0);
INSERT INTO `l38sx_modules_menu` VALUES (113,0);
INSERT INTO `l38sx_modules_menu` VALUES (115,0);
INSERT INTO `l38sx_modules_menu` VALUES (116,0);
INSERT INTO `l38sx_modules_menu` VALUES (117,101);
INSERT INTO `l38sx_modules_menu` VALUES (118,0);
INSERT INTO `l38sx_modules_menu` VALUES (119,0);
INSERT INTO `l38sx_modules_menu` VALUES (120,0);
INSERT INTO `l38sx_modules_menu` VALUES (121,0);
/*!40000 ALTER TABLE `l38sx_modules_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_newsfeeds`
--

DROP TABLE IF EXISTS `l38sx_newsfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_newsfeeds`
--

LOCK TABLES `l38sx_newsfeeds` WRITE;
/*!40000 ALTER TABLE `l38sx_newsfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_newsfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_overrider`
--

DROP TABLE IF EXISTS `l38sx_overrider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_overrider`
--

LOCK TABLES `l38sx_overrider` WRITE;
/*!40000 ALTER TABLE `l38sx_overrider` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_overrider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_redirect_links`
--

DROP TABLE IF EXISTS `l38sx_redirect_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(255) NOT NULL,
  `new_url` varchar(255) NOT NULL,
  `referer` varchar(150) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_link_old` (`old_url`),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_redirect_links`
--

LOCK TABLES `l38sx_redirect_links` WRITE;
/*!40000 ALTER TABLE `l38sx_redirect_links` DISABLE KEYS */;
INSERT INTO `l38sx_redirect_links` VALUES (1,'http://crowdfunding.local/index.php/media/com_tienda/images/noimage.png','','http://crowdfunding.local/index.php/browse','',5,0,'2012-10-25 02:00:40','0000-00-00 00:00:00');
INSERT INTO `l38sx_redirect_links` VALUES (2,'http://projects.ammonitenetworks.com/crowdfunding/index.php/media/com_tienda/images/noimage.png','','http://projects.ammonitenetworks.com/crowdfunding/index.php/browse','',2,0,'2012-10-25 02:57:53','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `l38sx_redirect_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_rokadminaudit`
--

DROP TABLE IF EXISTS `l38sx_rokadminaudit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_rokadminaudit` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `session_id` varchar(50) DEFAULT NULL,
  `option` varchar(100) DEFAULT NULL,
  `task` varchar(100) DEFAULT NULL,
  `cid` int(50) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `title` text,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ip` (`ip`),
  KEY `session_id` (`session_id`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM AUTO_INCREMENT=1321 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_rokadminaudit`
--

LOCK TABLES `l38sx_rokadminaudit` WRITE;
/*!40000 ALTER TABLE `l38sx_rokadminaudit` DISABLE KEYS */;
INSERT INTO `l38sx_rokadminaudit` VALUES (862,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=install','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer','','2012-10-22 21:49:55');
INSERT INTO `l38sx_rokadminaudit` VALUES (863,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_templates','',NULL,'/crowdfunding/administrator/index.php?option=com_templates','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer&view=install','','2012-10-22 21:50:01');
INSERT INTO `l38sx_rokadminaudit` VALUES (864,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_templates','setDefault',NULL,'/crowdfunding/administrator/index.php?option=com_templates&view=styles','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_templates','','2012-10-22 21:50:05');
INSERT INTO `l38sx_rokadminaudit` VALUES (865,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_templates','',NULL,'/crowdfunding/administrator/index.php?option=com_templates&view=styles','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_templates','','2012-10-22 21:50:06');
INSERT INTO `l38sx_rokadminaudit` VALUES (866,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_tienda','',NULL,'/crowdfunding/administrator/index.php?option=com_tienda','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_templates&view=styles','','2012-10-22 21:50:12');
INSERT INTO `l38sx_rokadminaudit` VALUES (867,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_tienda','',NULL,'/crowdfunding/administrator/index.php?option=com_tienda&view=orders','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_tienda','','2012-10-22 21:50:28');
INSERT INTO `l38sx_rokadminaudit` VALUES (868,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','',NULL,'/crowdfunding/administrator/index.php?option=com_installer','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_tienda&view=orders','','2012-10-22 21:51:01');
INSERT INTO `l38sx_rokadminaudit` VALUES (869,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_modules','',NULL,'/crowdfunding/administrator/index.php?option=com_modules&filter_client_id=1','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer','','2012-10-22 21:51:11');
INSERT INTO `l38sx_rokadminaudit` VALUES (870,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_modules','unpublish',NULL,'/crowdfunding/administrator/index.php?option=com_modules','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_modules&filter_client_id=1','','2012-10-22 21:51:20');
INSERT INTO `l38sx_rokadminaudit` VALUES (871,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_modules','',NULL,'/crowdfunding/administrator/index.php?option=com_modules&view=modules','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_modules&filter_client_id=1','','2012-10-22 21:51:20');
INSERT INTO `l38sx_rokadminaudit` VALUES (872,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_modules','publish',NULL,'/crowdfunding/administrator/index.php?option=com_modules','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_modules&view=modules','','2012-10-22 21:51:26');
INSERT INTO `l38sx_rokadminaudit` VALUES (873,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_modules','',NULL,'/crowdfunding/administrator/index.php?option=com_modules&view=modules','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_modules&view=modules','','2012-10-22 21:51:26');
INSERT INTO `l38sx_rokadminaudit` VALUES (874,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_modules','publish',NULL,'/crowdfunding/administrator/index.php?option=com_modules','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_modules&view=modules','','2012-10-22 21:51:30');
INSERT INTO `l38sx_rokadminaudit` VALUES (875,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_modules','',NULL,'/crowdfunding/administrator/index.php?option=com_modules&view=modules','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_modules&view=modules','','2012-10-22 21:51:31');
INSERT INTO `l38sx_rokadminaudit` VALUES (876,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_modules','unpublish',NULL,'/crowdfunding/administrator/index.php?option=com_modules','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_modules&view=modules','','2012-10-22 21:51:36');
INSERT INTO `l38sx_rokadminaudit` VALUES (877,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_modules','',NULL,'/crowdfunding/administrator/index.php?option=com_modules&view=modules','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_modules&view=modules','','2012-10-22 21:51:36');
INSERT INTO `l38sx_rokadminaudit` VALUES (878,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_modules','edit',87,'/crowdfunding/administrator/index.php?option=com_modules&task=module.edit&id=87','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_modules&view=modules','','2012-10-22 21:51:38');
INSERT INTO `l38sx_rokadminaudit` VALUES (879,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_modules','edit',87,'/crowdfunding/administrator/index.php?option=com_modules&view=module&layout=edit&id=87','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_modules&view=modules','','2012-10-22 21:51:38');
INSERT INTO `l38sx_rokadminaudit` VALUES (880,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_modules','apply',87,'/crowdfunding/administrator/index.php?option=com_modules&layout=edit&id=87','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_modules&view=module&layout=edit&id=87','Dioscouri  - Admin-side Submenu','2012-10-22 21:51:47');
INSERT INTO `l38sx_rokadminaudit` VALUES (881,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_modules','edit',87,'/crowdfunding/administrator/index.php?option=com_modules&view=module&layout=edit&id=87','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_modules&view=module&layout=edit&id=87','','2012-10-22 21:51:47');
INSERT INTO `l38sx_rokadminaudit` VALUES (882,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_modules','save',87,'/crowdfunding/administrator/index.php?option=com_modules&layout=edit&id=87','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_modules&view=module&layout=edit&id=87','Dioscouri  - Admin-side Submenu','2012-10-22 21:51:56');
INSERT INTO `l38sx_rokadminaudit` VALUES (883,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_modules','',NULL,'/crowdfunding/administrator/index.php?option=com_modules&view=modules','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_modules&view=module&layout=edit&id=87','','2012-10-22 21:51:56');
INSERT INTO `l38sx_rokadminaudit` VALUES (884,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_tienda','',NULL,'/crowdfunding/administrator/index.php?option=com_tienda','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_modules&view=modules','','2012-10-22 21:52:00');
INSERT INTO `l38sx_rokadminaudit` VALUES (885,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_tienda','',NULL,'/crowdfunding/administrator/index.php?option=com_tienda&view=orders','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_tienda','','2012-10-22 21:52:06');
INSERT INTO `l38sx_rokadminaudit` VALUES (886,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_tienda','',NULL,'/crowdfunding/administrator/index.php?option=com_tienda&view=pos','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_tienda&view=orders','','2012-10-22 21:52:23');
INSERT INTO `l38sx_rokadminaudit` VALUES (887,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_tienda','cancel',NULL,'/crowdfunding/administrator/index.php?option=com_tienda&view=pos','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_tienda&view=pos','','2012-10-22 21:52:29');
INSERT INTO `l38sx_rokadminaudit` VALUES (888,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_tienda','',NULL,'/crowdfunding/administrator/index.php?option=com_tienda&view=pos','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_tienda&view=pos','','2012-10-22 21:52:29');
INSERT INTO `l38sx_rokadminaudit` VALUES (889,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_tienda','',NULL,'/crowdfunding/administrator/index.php?option=com_tienda','','','2012-10-22 21:52:46');
INSERT INTO `l38sx_rokadminaudit` VALUES (890,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_tienda','',NULL,'/crowdfunding/administrator/index.php?option=com_tienda&view=catalog','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_tienda','','2012-10-22 21:52:51');
INSERT INTO `l38sx_rokadminaudit` VALUES (891,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_tienda','',NULL,'/crowdfunding/administrator/index.php?option=com_tienda&view=products','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_tienda','','2012-10-22 21:52:52');
INSERT INTO `l38sx_rokadminaudit` VALUES (892,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_tienda','add',0,'/crowdfunding/administrator/index.php?option=com_tienda&controller=products&view=products','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_tienda&view=products','','2012-10-22 21:52:57');
INSERT INTO `l38sx_rokadminaudit` VALUES (893,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_tienda','cancel',0,'/crowdfunding/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=0','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_tienda&controller=products&view=products','','2012-10-22 21:54:17');
INSERT INTO `l38sx_rokadminaudit` VALUES (894,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_tienda','',NULL,'/crowdfunding/administrator/index.php?option=com_tienda&view=products','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_tienda&controller=products&view=products','','2012-10-22 21:54:17');
INSERT INTO `l38sx_rokadminaudit` VALUES (895,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','add',NULL,'/crowdfunding/administrator/index.php?option=com_users&task=user.add','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_tienda&view=products','','2012-10-22 21:54:21');
INSERT INTO `l38sx_rokadminaudit` VALUES (896,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','edit',NULL,'/crowdfunding/administrator/index.php?option=com_users&view=user&layout=edit','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_tienda&view=products','','2012-10-22 21:54:21');
INSERT INTO `l38sx_rokadminaudit` VALUES (897,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','save',0,'/crowdfunding/administrator/index.php?option=com_users&layout=edit&id=0','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=user&layout=edit','John McHugh','2012-10-22 21:55:18');
INSERT INTO `l38sx_rokadminaudit` VALUES (898,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_cpanel','',NULL,'/crowdfunding/administrator/index.php','','','2012-10-22 21:57:10');
INSERT INTO `l38sx_rokadminaudit` VALUES (899,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_config','',NULL,'/crowdfunding/administrator/index.php?option=com_config','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php','','2012-10-22 21:57:13');
INSERT INTO `l38sx_rokadminaudit` VALUES (900,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','',NULL,'/crowdfunding/administrator/index.php?option=com_users&view=users','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=user&layout=edit','','2012-10-22 21:57:20');
INSERT INTO `l38sx_rokadminaudit` VALUES (901,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_config','apply',NULL,'/crowdfunding/administrator/index.php?option=com_config','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_config','','2012-10-22 21:59:40');
INSERT INTO `l38sx_rokadminaudit` VALUES (902,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_config','',NULL,'/crowdfunding/administrator/index.php?option=com_config','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_config','','2012-10-22 21:59:40');
INSERT INTO `l38sx_rokadminaudit` VALUES (903,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','add',NULL,'/crowdfunding/administrator/index.php?option=com_users&task=user.add','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_config','','2012-10-22 21:59:43');
INSERT INTO `l38sx_rokadminaudit` VALUES (904,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','edit',NULL,'/crowdfunding/administrator/index.php?option=com_users&view=user&layout=edit','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_config','','2012-10-22 21:59:44');
INSERT INTO `l38sx_rokadminaudit` VALUES (905,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','apply',0,'/crowdfunding/administrator/index.php?option=com_users&layout=edit&id=0','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=user&layout=edit','Chris French','2012-10-22 22:00:07');
INSERT INTO `l38sx_rokadminaudit` VALUES (906,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','edit',218,'/crowdfunding/administrator/index.php?option=com_users&view=user&layout=edit&id=218','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=user&layout=edit','','2012-10-22 22:00:12');
INSERT INTO `l38sx_rokadminaudit` VALUES (907,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','cancel',218,'/crowdfunding/administrator/index.php?option=com_users&layout=edit&id=218','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=user&layout=edit&id=218','Chris French','2012-10-22 22:00:39');
INSERT INTO `l38sx_rokadminaudit` VALUES (908,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','',NULL,'/crowdfunding/administrator/index.php?option=com_users&view=users','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=user&layout=edit&id=218','','2012-10-22 22:00:39');
INSERT INTO `l38sx_rokadminaudit` VALUES (909,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','delete',NULL,'/crowdfunding/administrator/index.php?option=com_users&view=users','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=users','','2012-10-22 22:00:49');
INSERT INTO `l38sx_rokadminaudit` VALUES (910,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','',NULL,'/crowdfunding/administrator/index.php?option=com_users&view=users','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=users','','2012-10-22 22:00:49');
INSERT INTO `l38sx_rokadminaudit` VALUES (911,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','edit',217,'/crowdfunding/administrator/index.php?option=com_users&task=user.edit&id=217','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=users','','2012-10-22 22:00:53');
INSERT INTO `l38sx_rokadminaudit` VALUES (912,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','edit',217,'/crowdfunding/administrator/index.php?option=com_users&view=user&layout=edit&id=217','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=users','','2012-10-22 22:00:53');
INSERT INTO `l38sx_rokadminaudit` VALUES (913,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','',NULL,'/crowdfunding/administrator/index.php?option=com_users&view=user','','','2012-10-22 22:01:03');
INSERT INTO `l38sx_rokadminaudit` VALUES (914,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','',NULL,'/crowdfunding/administrator/index.php?option=com_users','','','2012-10-22 22:01:06');
INSERT INTO `l38sx_rokadminaudit` VALUES (915,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','delete',NULL,'/crowdfunding/administrator/index.php?option=com_users&view=users','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users','','2012-10-22 22:01:25');
INSERT INTO `l38sx_rokadminaudit` VALUES (916,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','',NULL,'/crowdfunding/administrator/index.php?option=com_users&view=users','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users','','2012-10-22 22:01:25');
INSERT INTO `l38sx_rokadminaudit` VALUES (917,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','add',NULL,'/crowdfunding/administrator/index.php?option=com_users&view=users','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=users','','2012-10-22 22:01:29');
INSERT INTO `l38sx_rokadminaudit` VALUES (918,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','edit',NULL,'/crowdfunding/administrator/index.php?option=com_users&view=user&layout=edit','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=users','','2012-10-22 22:01:29');
INSERT INTO `l38sx_rokadminaudit` VALUES (919,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','save',0,'/crowdfunding/administrator/index.php?option=com_users&layout=edit&id=0','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=user&layout=edit','John McHugh','2012-10-22 22:01:59');
INSERT INTO `l38sx_rokadminaudit` VALUES (920,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','',NULL,'/crowdfunding/administrator/index.php?option=com_users&view=users','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=user&layout=edit','','2012-10-22 22:02:01');
INSERT INTO `l38sx_rokadminaudit` VALUES (921,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','cancel',217,'/crowdfunding/administrator/index.php?option=com_users&layout=edit&id=217','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=user&layout=edit&id=217','John McHugh','2012-10-22 22:02:13');
INSERT INTO `l38sx_rokadminaudit` VALUES (922,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','',NULL,'/crowdfunding/administrator/index.php?option=com_users&view=users','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=user&layout=edit&id=217','','2012-10-22 22:02:13');
INSERT INTO `l38sx_rokadminaudit` VALUES (923,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_templates','',NULL,'/crowdfunding/administrator/index.php?option=com_templates&filter_client_id=*','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=users','','2012-10-22 22:02:21');
INSERT INTO `l38sx_rokadminaudit` VALUES (924,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_templates','edit',7,'/crowdfunding/administrator/index.php?option=com_templates&task=style.edit&id=7','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_templates&filter_client_id=*','','2012-10-22 22:02:25');
INSERT INTO `l38sx_rokadminaudit` VALUES (925,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_templates','edit',7,'/crowdfunding/administrator/index.php?option=com_templates&view=style&layout=edit&id=7','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_templates&filter_client_id=*','','2012-10-22 22:02:25');
INSERT INTO `l38sx_rokadminaudit` VALUES (926,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_templates','save',7,'/crowdfunding/administrator/index.php?option=com_templates&layout=edit&id=7','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_templates&view=style&layout=edit&id=7','rt_missioncontrol - Default','2012-10-22 22:03:38');
INSERT INTO `l38sx_rokadminaudit` VALUES (927,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_templates','',NULL,'/crowdfunding/administrator/index.php?option=com_templates&view=styles','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_templates&view=style&layout=edit&id=7','','2012-10-22 22:03:38');
INSERT INTO `l38sx_rokadminaudit` VALUES (928,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','',NULL,'/crowdfunding/administrator/index.php?option=com_installer','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_templates&view=styles','','2012-10-22 22:03:42');
INSERT INTO `l38sx_rokadminaudit` VALUES (929,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=update','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer','','2012-10-22 22:03:45');
INSERT INTO `l38sx_rokadminaudit` VALUES (930,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=manage','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer&view=update','','2012-10-22 22:03:50');
INSERT INTO `l38sx_rokadminaudit` VALUES (931,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=manage','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer&view=manage','','2012-10-22 22:03:58');
INSERT INTO `l38sx_rokadminaudit` VALUES (932,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','unpublish',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=manage','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer&view=manage','','2012-10-22 22:04:01');
INSERT INTO `l38sx_rokadminaudit` VALUES (933,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=manage','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer&view=manage','','2012-10-22 22:04:01');
INSERT INTO `l38sx_rokadminaudit` VALUES (934,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','unpublish',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=manage','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer&view=manage','','2012-10-22 22:04:04');
INSERT INTO `l38sx_rokadminaudit` VALUES (935,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=manage','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer&view=manage','','2012-10-22 22:04:04');
INSERT INTO `l38sx_rokadminaudit` VALUES (936,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','unpublish',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=manage','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer&view=manage','','2012-10-22 22:04:07');
INSERT INTO `l38sx_rokadminaudit` VALUES (937,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=manage','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer&view=manage','','2012-10-22 22:04:07');
INSERT INTO `l38sx_rokadminaudit` VALUES (938,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=manage','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer&view=manage','','2012-10-22 22:04:10');
INSERT INTO `l38sx_rokadminaudit` VALUES (939,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','unpublish',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=manage','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer&view=manage','','2012-10-22 22:04:16');
INSERT INTO `l38sx_rokadminaudit` VALUES (940,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=manage','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer&view=manage','','2012-10-22 22:04:16');
INSERT INTO `l38sx_rokadminaudit` VALUES (941,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_cpanel','',NULL,'/crowdfunding/administrator/index.php','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer&view=manage','','2012-10-22 22:04:26');
INSERT INTO `l38sx_rokadminaudit` VALUES (942,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_templates','',NULL,'/crowdfunding/administrator/index.php?option=com_templates&filter_client_id=1','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php','','2012-10-22 22:09:23');
INSERT INTO `l38sx_rokadminaudit` VALUES (943,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_templates','',NULL,'/crowdfunding/administrator/index.php?option=com_templates&filter_client_id=*','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_templates&filter_client_id=1','','2012-10-22 22:09:27');
INSERT INTO `l38sx_rokadminaudit` VALUES (944,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','',NULL,'/crowdfunding/administrator/index.php?option=com_installer','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_templates&filter_client_id=*','','2012-10-22 22:09:31');
INSERT INTO `l38sx_rokadminaudit` VALUES (945,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','install',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=install','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer','','2012-10-22 22:09:50');
INSERT INTO `l38sx_rokadminaudit` VALUES (946,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=install','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer','','2012-10-22 22:09:50');
INSERT INTO `l38sx_rokadminaudit` VALUES (947,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','install',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=install','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer&view=install','','2012-10-22 22:10:42');
INSERT INTO `l38sx_rokadminaudit` VALUES (948,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=install','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer&view=install','','2012-10-22 22:10:42');
INSERT INTO `l38sx_rokadminaudit` VALUES (949,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_templates','',NULL,'/crowdfunding/administrator/index.php?option=com_templates&filter_client_id=0','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_installer&view=install','','2012-10-22 22:10:49');
INSERT INTO `l38sx_rokadminaudit` VALUES (950,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_templates','edit',8,'/crowdfunding/administrator/index.php?option=com_templates&task=style.edit&id=8','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_templates&filter_client_id=0','','2012-10-22 22:10:55');
INSERT INTO `l38sx_rokadminaudit` VALUES (951,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_templates','edit',8,'/crowdfunding/administrator/index.php?option=com_templates&view=style&layout=edit&id=8','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_templates&filter_client_id=0','','2012-10-22 22:10:55');
INSERT INTO `l38sx_rokadminaudit` VALUES (952,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_templates','save',8,'/crowdfunding/administrator/index.php?option=com_templates&layout=edit&id=8','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_templates&view=style&layout=edit&id=8','default - Default','2012-10-22 22:11:20');
INSERT INTO `l38sx_rokadminaudit` VALUES (953,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_templates','',NULL,'/crowdfunding/administrator/index.php?option=com_templates&view=styles','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_templates&view=style&layout=edit&id=8','','2012-10-22 22:11:21');
INSERT INTO `l38sx_rokadminaudit` VALUES (954,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_search','',NULL,'/crowdfunding/administrator/index.php?option=com_search','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=users','','2012-10-22 22:14:24');
INSERT INTO `l38sx_rokadminaudit` VALUES (955,0,'127.0.0.1','344bf477c839e266010f52ee23b91d99','com_cpanel','',NULL,'/administrator/','','','2012-10-22 22:55:43');
INSERT INTO `l38sx_rokadminaudit` VALUES (956,0,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_cpanel','',NULL,'/administrator/','','','2012-10-22 23:17:02');
INSERT INTO `l38sx_rokadminaudit` VALUES (957,0,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_login','login',NULL,'/administrator/index.php','http://crowdfunding.local/administrator/','','2012-10-22 23:17:16');
INSERT INTO `l38sx_rokadminaudit` VALUES (958,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_cpanel','',NULL,'/administrator/index.php','http://crowdfunding.local/administrator/','','2012-10-22 23:17:16');
INSERT INTO `l38sx_rokadminaudit` VALUES (959,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda','http://crowdfunding.local/administrator/index.php','','2012-10-22 23:17:42');
INSERT INTO `l38sx_rokadminaudit` VALUES (960,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda','http://crowdfunding.local/administrator/index.php','','2012-10-22 23:17:43');
INSERT INTO `l38sx_rokadminaudit` VALUES (961,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=catalog','http://crowdfunding.local/administrator/index.php?option=com_tienda','','2012-10-22 23:17:47');
INSERT INTO `l38sx_rokadminaudit` VALUES (962,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda','','2012-10-22 23:17:48');
INSERT INTO `l38sx_rokadminaudit` VALUES (963,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','add',0,'/administrator/index.php?option=com_tienda&controller=products&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:17:58');
INSERT INTO `l38sx_rokadminaudit` VALUES (964,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','cancel',0,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=products&view=products','','2012-10-22 23:21:30');
INSERT INTO `l38sx_rokadminaudit` VALUES (965,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=products&view=products','','2012-10-22 23:21:31');
INSERT INTO `l38sx_rokadminaudit` VALUES (966,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=eavattributes','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:21:35');
INSERT INTO `l38sx_rokadminaudit` VALUES (967,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','add',0,'/administrator/index.php?option=com_tienda&controller=eavattributes&view=eavattributes','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=eavattributes','','2012-10-22 23:21:41');
INSERT INTO `l38sx_rokadminaudit` VALUES (968,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','save',0,'/administrator/index.php?option=com_tienda&controller=eavattributes&view=eavattributes&task=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=eavattributes&view=eavattributes','','2012-10-22 23:22:42');
INSERT INTO `l38sx_rokadminaudit` VALUES (969,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=eavattributes','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=eavattributes&view=eavattributes','','2012-10-22 23:22:42');
INSERT INTO `l38sx_rokadminaudit` VALUES (970,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=catalog','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=eavattributes','','2012-10-22 23:22:49');
INSERT INTO `l38sx_rokadminaudit` VALUES (971,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=eavattributes','','2012-10-22 23:22:50');
INSERT INTO `l38sx_rokadminaudit` VALUES (972,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=categories','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:22:59');
INSERT INTO `l38sx_rokadminaudit` VALUES (973,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','add',0,'/administrator/index.php?option=com_tienda&controller=categories&view=categories','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=categories','','2012-10-22 23:23:17');
INSERT INTO `l38sx_rokadminaudit` VALUES (974,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','save',0,'/administrator/index.php?option=com_tienda&controller=categories&view=categories&task=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=categories&view=categories','','2012-10-22 23:24:13');
INSERT INTO `l38sx_rokadminaudit` VALUES (975,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=categories','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=categories&view=categories','','2012-10-22 23:24:14');
INSERT INTO `l38sx_rokadminaudit` VALUES (976,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','add',0,'/administrator/index.php?option=com_tienda&controller=categories&view=categories','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=categories','','2012-10-22 23:24:33');
INSERT INTO `l38sx_rokadminaudit` VALUES (977,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','save',0,'/administrator/index.php?option=com_tienda&controller=categories&view=categories&task=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=categories&view=categories','','2012-10-22 23:24:53');
INSERT INTO `l38sx_rokadminaudit` VALUES (978,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=categories','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=categories&view=categories','','2012-10-22 23:24:53');
INSERT INTO `l38sx_rokadminaudit` VALUES (979,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','add',0,'/administrator/index.php?option=com_tienda&controller=categories&view=categories','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=categories','','2012-10-22 23:25:58');
INSERT INTO `l38sx_rokadminaudit` VALUES (980,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','add',0,'/administrator/index.php?option=com_tienda&controller=categories&view=categories','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=categories','','2012-10-22 23:27:27');
INSERT INTO `l38sx_rokadminaudit` VALUES (981,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','add',0,'/administrator/index.php?option=com_tienda&controller=categories&view=categories','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=categories','','2012-10-22 23:27:31');
INSERT INTO `l38sx_rokadminaudit` VALUES (982,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','add',0,'/administrator/index.php?option=com_tienda&controller=categories&view=categories','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=categories','','2012-10-22 23:28:42');
INSERT INTO `l38sx_rokadminaudit` VALUES (983,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','cancel',0,'/administrator/index.php?option=com_tienda&controller=categories&view=categories&task=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=categories&view=categories','','2012-10-22 23:28:56');
INSERT INTO `l38sx_rokadminaudit` VALUES (984,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=categories','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=categories&view=categories','','2012-10-22 23:28:56');
INSERT INTO `l38sx_rokadminaudit` VALUES (985,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=manufacturers','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=categories','','2012-10-22 23:29:13');
INSERT INTO `l38sx_rokadminaudit` VALUES (986,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=manufacturers','','2012-10-22 23:29:30');
INSERT INTO `l38sx_rokadminaudit` VALUES (987,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=users','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:29:36');
INSERT INTO `l38sx_rokadminaudit` VALUES (988,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=catalog','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=users','','2012-10-22 23:29:43');
INSERT INTO `l38sx_rokadminaudit` VALUES (989,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=users','','2012-10-22 23:29:44');
INSERT INTO `l38sx_rokadminaudit` VALUES (990,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=users','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:29:47');
INSERT INTO `l38sx_rokadminaudit` VALUES (991,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_users','add',NULL,'/administrator/index.php?option=com_users&task=user.add','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=users','','2012-10-22 23:29:55');
INSERT INTO `l38sx_rokadminaudit` VALUES (992,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_users','edit',NULL,'/administrator/index.php?option=com_users&view=user&layout=edit','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=users','','2012-10-22 23:29:55');
INSERT INTO `l38sx_rokadminaudit` VALUES (993,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_users','cancel',0,'/administrator/index.php?option=com_users&layout=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_users&view=user&layout=edit','','2012-10-22 23:30:21');
INSERT INTO `l38sx_rokadminaudit` VALUES (994,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_users','add',NULL,'/administrator/index.php?option=com_users&task=user.add&tmpl=component','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=users','','2012-10-22 23:30:59');
INSERT INTO `l38sx_rokadminaudit` VALUES (995,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_users','edit',NULL,'/administrator/index.php?option=com_users&view=user&tmpl=component&layout=edit','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=users','','2012-10-22 23:30:59');
INSERT INTO `l38sx_rokadminaudit` VALUES (996,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=reports','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=users','','2012-10-22 23:31:31');
INSERT INTO `l38sx_rokadminaudit` VALUES (997,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=catalog','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=users','','2012-10-22 23:31:31');
INSERT INTO `l38sx_rokadminaudit` VALUES (998,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=users','','2012-10-22 23:31:31');
INSERT INTO `l38sx_rokadminaudit` VALUES (999,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','add',0,'/administrator/index.php?option=com_tienda&controller=products&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:31:35');
INSERT INTO `l38sx_rokadminaudit` VALUES (1000,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','cancel',0,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=products&view=products','','2012-10-22 23:32:59');
INSERT INTO `l38sx_rokadminaudit` VALUES (1001,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=products&view=products','','2012-10-22 23:32:59');
INSERT INTO `l38sx_rokadminaudit` VALUES (1002,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_plugins','',NULL,'/administrator/index.php?option=com_plugins','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:33:29');
INSERT INTO `l38sx_rokadminaudit` VALUES (1003,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_plugins','',NULL,'/administrator/index.php?option=com_plugins&view=plugins','http://crowdfunding.local/administrator/index.php?option=com_plugins','','2012-10-22 23:33:42');
INSERT INTO `l38sx_rokadminaudit` VALUES (1004,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_plugins','edit',NULL,'/administrator/index.php?option=com_plugins&task=plugin.edit&extension_id=10023','http://crowdfunding.local/administrator/index.php?option=com_plugins&view=plugins','','2012-10-22 23:33:49');
INSERT INTO `l38sx_rokadminaudit` VALUES (1005,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_plugins','edit',NULL,'/administrator/index.php?option=com_plugins&view=plugin&layout=edit&extension_id=10023','http://crowdfunding.local/administrator/index.php?option=com_plugins&view=plugins','','2012-10-22 23:33:50');
INSERT INTO `l38sx_rokadminaudit` VALUES (1006,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_plugins','cancel',NULL,'/administrator/index.php?option=com_plugins&layout=edit&extension_id=10023','http://crowdfunding.local/administrator/index.php?option=com_plugins&view=plugin&layout=edit&extension_id=10023','Tienda - Custom Fields','2012-10-22 23:34:00');
INSERT INTO `l38sx_rokadminaudit` VALUES (1007,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_plugins','',NULL,'/administrator/index.php?option=com_plugins&view=plugins','http://crowdfunding.local/administrator/index.php?option=com_plugins&view=plugin&layout=edit&extension_id=10023','','2012-10-22 23:34:01');
INSERT INTO `l38sx_rokadminaudit` VALUES (1008,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda','http://crowdfunding.local/administrator/index.php?option=com_plugins&view=plugins','','2012-10-22 23:34:20');
INSERT INTO `l38sx_rokadminaudit` VALUES (1009,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=eavattributes','http://crowdfunding.local/administrator/index.php?option=com_tienda','','2012-10-22 23:34:24');
INSERT INTO `l38sx_rokadminaudit` VALUES (1010,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=eavattributes&filter_entitytype=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=eavattributes','','2012-10-22 23:34:34');
INSERT INTO `l38sx_rokadminaudit` VALUES (1011,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=eavattributes','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=eavattributes&filter_entitytype=products','','2012-10-22 23:34:38');
INSERT INTO `l38sx_rokadminaudit` VALUES (1012,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=catalog','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=eavattributes','','2012-10-22 23:34:42');
INSERT INTO `l38sx_rokadminaudit` VALUES (1013,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=eavattributes','','2012-10-22 23:34:42');
INSERT INTO `l38sx_rokadminaudit` VALUES (1014,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','add',0,'/administrator/index.php?option=com_tienda&controller=products&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:34:46');
INSERT INTO `l38sx_rokadminaudit` VALUES (1015,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','apply',0,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=products&view=products','','2012-10-22 23:35:54');
INSERT INTO `l38sx_rokadminaudit` VALUES (1016,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=products&view=products','','2012-10-22 23:35:55');
INSERT INTO `l38sx_rokadminaudit` VALUES (1017,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','setattributes',1,'/administrator/index.php?option=com_tienda&view=products&task=setattributes&id=1&tmpl=component','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-22 23:36:03');
INSERT INTO `l38sx_rokadminaudit` VALUES (1018,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','setprices',1,'/administrator/index.php?option=com_tienda&view=products&task=setprices&id=1&tmpl=component','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-22 23:36:54');
INSERT INTO `l38sx_rokadminaudit` VALUES (1019,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','close',1,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-22 23:38:52');
INSERT INTO `l38sx_rokadminaudit` VALUES (1020,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-22 23:38:52');
INSERT INTO `l38sx_rokadminaudit` VALUES (1021,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_templates','',NULL,'/administrator/index.php?option=com_templates&filter_client_id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:39:34');
INSERT INTO `l38sx_rokadminaudit` VALUES (1022,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_templates','setDefault',NULL,'/administrator/index.php?option=com_templates&view=styles','http://crowdfunding.local/administrator/index.php?option=com_templates&filter_client_id=1','','2012-10-22 23:40:04');
INSERT INTO `l38sx_rokadminaudit` VALUES (1023,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_templates','',NULL,'/administrator/index.php?option=com_templates&view=styles','http://crowdfunding.local/administrator/index.php?option=com_templates&filter_client_id=1','','2012-10-22 23:40:05');
INSERT INTO `l38sx_rokadminaudit` VALUES (1024,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_templates','setDefault',NULL,'/administrator/index.php?option=com_templates&view=styles','http://crowdfunding.local/administrator/index.php?option=com_templates&view=styles','','2012-10-22 23:40:23');
INSERT INTO `l38sx_rokadminaudit` VALUES (1025,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_templates','',NULL,'/administrator/index.php?option=com_templates&view=styles','http://crowdfunding.local/administrator/index.php?option=com_templates&view=styles','','2012-10-22 23:40:23');
INSERT INTO `l38sx_rokadminaudit` VALUES (1026,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda','http://crowdfunding.local/administrator/index.php?option=com_templates&view=styles','','2012-10-22 23:40:27');
INSERT INTO `l38sx_rokadminaudit` VALUES (1027,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=catalog','http://crowdfunding.local/administrator/index.php?option=com_tienda','','2012-10-22 23:40:30');
INSERT INTO `l38sx_rokadminaudit` VALUES (1028,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda','','2012-10-22 23:40:31');
INSERT INTO `l38sx_rokadminaudit` VALUES (1029,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:40:38');
INSERT INTO `l38sx_rokadminaudit` VALUES (1030,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:46:50');
INSERT INTO `l38sx_rokadminaudit` VALUES (1031,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:51:51');
INSERT INTO `l38sx_rokadminaudit` VALUES (1032,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:52:31');
INSERT INTO `l38sx_rokadminaudit` VALUES (1033,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','close',1,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-22 23:52:40');
INSERT INTO `l38sx_rokadminaudit` VALUES (1034,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-22 23:52:41');
INSERT INTO `l38sx_rokadminaudit` VALUES (1035,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=eavattributes','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:53:07');
INSERT INTO `l38sx_rokadminaudit` VALUES (1036,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','selectentities',1,'/administrator/index.php?option=com_tienda&controller=eavattributes&task=selectentities&tmpl=component&eaventity_type=products&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=eavattributes','','2012-10-22 23:53:17');
INSERT INTO `l38sx_rokadminaudit` VALUES (1037,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','selected_enable',1,'/administrator/index.php?option=com_tienda&controller=eavattributes&task=selectentities&tmpl=component&eaventity_type=products&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=eavattributes&task=selectentities&tmpl=component&eaventity_type=products&id=1','','2012-10-22 23:53:26');
INSERT INTO `l38sx_rokadminaudit` VALUES (1038,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','selectentities',1,'/administrator/index.php?option=com_tienda&controller=eavattributes&task=selectentities&tmpl=component&eaventity_type=products&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=eavattributes&task=selectentities&tmpl=component&eaventity_type=products&id=1','','2012-10-22 23:53:27');
INSERT INTO `l38sx_rokadminaudit` VALUES (1039,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=catalog','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=eavattributes','','2012-10-22 23:54:46');
INSERT INTO `l38sx_rokadminaudit` VALUES (1040,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=eavattributes','','2012-10-22 23:54:53');
INSERT INTO `l38sx_rokadminaudit` VALUES (1041,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:55:26');
INSERT INTO `l38sx_rokadminaudit` VALUES (1042,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:56:00');
INSERT INTO `l38sx_rokadminaudit` VALUES (1043,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:56:57');
INSERT INTO `l38sx_rokadminaudit` VALUES (1044,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:57:14');
INSERT INTO `l38sx_rokadminaudit` VALUES (1045,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:57:51');
INSERT INTO `l38sx_rokadminaudit` VALUES (1046,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-22 23:59:42');
INSERT INTO `l38sx_rokadminaudit` VALUES (1047,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:00:02');
INSERT INTO `l38sx_rokadminaudit` VALUES (1048,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:01:15');
INSERT INTO `l38sx_rokadminaudit` VALUES (1049,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:04:04');
INSERT INTO `l38sx_rokadminaudit` VALUES (1050,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:06:41');
INSERT INTO `l38sx_rokadminaudit` VALUES (1051,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:08:35');
INSERT INTO `l38sx_rokadminaudit` VALUES (1052,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:13:01');
INSERT INTO `l38sx_rokadminaudit` VALUES (1053,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:13:05');
INSERT INTO `l38sx_rokadminaudit` VALUES (1054,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:16:41');
INSERT INTO `l38sx_rokadminaudit` VALUES (1055,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:17:31');
INSERT INTO `l38sx_rokadminaudit` VALUES (1056,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:17:41');
INSERT INTO `l38sx_rokadminaudit` VALUES (1057,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:21:26');
INSERT INTO `l38sx_rokadminaudit` VALUES (1058,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:24:32');
INSERT INTO `l38sx_rokadminaudit` VALUES (1059,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:25:51');
INSERT INTO `l38sx_rokadminaudit` VALUES (1060,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:28:57');
INSERT INTO `l38sx_rokadminaudit` VALUES (1061,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:30:01');
INSERT INTO `l38sx_rokadminaudit` VALUES (1062,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','close',1,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 00:33:26');
INSERT INTO `l38sx_rokadminaudit` VALUES (1063,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 00:33:26');
INSERT INTO `l38sx_rokadminaudit` VALUES (1064,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=eavattributes','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:33:36');
INSERT INTO `l38sx_rokadminaudit` VALUES (1065,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&controller=eavattributes&view=eavattributes&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=eavattributes','','2012-10-23 00:33:46');
INSERT INTO `l38sx_rokadminaudit` VALUES (1066,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','save',0,'/administrator/index.php?option=com_tienda&controller=eavattributes&view=eavattributes&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=eavattributes&view=eavattributes&task=edit&id=1','','2012-10-23 00:34:03');
INSERT INTO `l38sx_rokadminaudit` VALUES (1067,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=eavattributes','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=eavattributes&view=eavattributes&task=edit&id=1','','2012-10-23 00:34:04');
INSERT INTO `l38sx_rokadminaudit` VALUES (1068,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=catalog','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=eavattributes','','2012-10-23 00:36:02');
INSERT INTO `l38sx_rokadminaudit` VALUES (1069,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=eavattributes','','2012-10-23 00:36:02');
INSERT INTO `l38sx_rokadminaudit` VALUES (1070,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','enable',0,'/administrator/index.php?option=com_tienda&controller=products&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:36:06');
INSERT INTO `l38sx_rokadminaudit` VALUES (1071,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:36:06');
INSERT INTO `l38sx_rokadminaudit` VALUES (1072,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:36:10');
INSERT INTO `l38sx_rokadminaudit` VALUES (1073,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:37:02');
INSERT INTO `l38sx_rokadminaudit` VALUES (1074,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:38:43');
INSERT INTO `l38sx_rokadminaudit` VALUES (1075,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:39:13');
INSERT INTO `l38sx_rokadminaudit` VALUES (1076,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','close',1,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 00:40:29');
INSERT INTO `l38sx_rokadminaudit` VALUES (1077,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 00:40:30');
INSERT INTO `l38sx_rokadminaudit` VALUES (1078,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:41:23');
INSERT INTO `l38sx_rokadminaudit` VALUES (1079,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','setprices',1,'/administrator/index.php?option=com_tienda&view=products&task=setprices&id=1&tmpl=component','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 00:47:10');
INSERT INTO `l38sx_rokadminaudit` VALUES (1080,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:47:44');
INSERT INTO `l38sx_rokadminaudit` VALUES (1081,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:48:34');
INSERT INTO `l38sx_rokadminaudit` VALUES (1082,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:48:48');
INSERT INTO `l38sx_rokadminaudit` VALUES (1083,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','close',1,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 00:53:15');
INSERT INTO `l38sx_rokadminaudit` VALUES (1084,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 00:53:16');
INSERT INTO `l38sx_rokadminaudit` VALUES (1085,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 00:53:47');
INSERT INTO `l38sx_rokadminaudit` VALUES (1086,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','close',1,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 01:00:04');
INSERT INTO `l38sx_rokadminaudit` VALUES (1087,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 01:00:05');
INSERT INTO `l38sx_rokadminaudit` VALUES (1088,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=categories','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 01:01:01');
INSERT INTO `l38sx_rokadminaudit` VALUES (1089,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=categories','','2012-10-23 01:01:04');
INSERT INTO `l38sx_rokadminaudit` VALUES (1090,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=categories','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 01:01:49');
INSERT INTO `l38sx_rokadminaudit` VALUES (1091,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=categories','','2012-10-23 01:03:29');
INSERT INTO `l38sx_rokadminaudit` VALUES (1092,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 01:13:29');
INSERT INTO `l38sx_rokadminaudit` VALUES (1093,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=catalog','http://crowdfunding.local/administrator/index.php?option=com_tienda','','2012-10-23 01:14:55');
INSERT INTO `l38sx_rokadminaudit` VALUES (1094,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda','','2012-10-23 01:14:56');
INSERT INTO `l38sx_rokadminaudit` VALUES (1095,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 01:15:18');
INSERT INTO `l38sx_rokadminaudit` VALUES (1096,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','close',1,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 01:15:34');
INSERT INTO `l38sx_rokadminaudit` VALUES (1097,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 01:15:35');
INSERT INTO `l38sx_rokadminaudit` VALUES (1098,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 01:23:17');
INSERT INTO `l38sx_rokadminaudit` VALUES (1099,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','close',1,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 01:23:54');
INSERT INTO `l38sx_rokadminaudit` VALUES (1100,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 01:23:54');
INSERT INTO `l38sx_rokadminaudit` VALUES (1101,216,'127.0.0.1','16e916bdbc36c37b5ae9903b3ec22d48','com_tienda','selectcategories',1,'/administrator/index.php?option=com_tienda&controller=products&task=selectcategories&id=1&tmpl=component','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 01:25:14');
INSERT INTO `l38sx_rokadminaudit` VALUES (1102,0,'127.0.0.1','a9f4ee7f8b9224b6aaecd0520397a6f1','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=campaigns','','','2012-10-23 01:46:29');
INSERT INTO `l38sx_rokadminaudit` VALUES (1103,0,'127.0.0.1','a9f4ee7f8b9224b6aaecd0520397a6f1','com_login','login',NULL,'/administrator/index.php','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=campaigns','','2012-10-23 01:46:33');
INSERT INTO `l38sx_rokadminaudit` VALUES (1104,216,'127.0.0.1','a9f4ee7f8b9224b6aaecd0520397a6f1','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=campaigns','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=campaigns','','2012-10-23 01:46:33');
INSERT INTO `l38sx_rokadminaudit` VALUES (1105,216,'127.0.0.1','a9f4ee7f8b9224b6aaecd0520397a6f1','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=campaigns','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=campaigns','','2012-10-23 01:52:54');
INSERT INTO `l38sx_rokadminaudit` VALUES (1106,216,'127.0.0.1','a9f4ee7f8b9224b6aaecd0520397a6f1','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=campaigns','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=campaigns','','2012-10-23 01:56:32');
INSERT INTO `l38sx_rokadminaudit` VALUES (1107,216,'127.0.0.1','a9f4ee7f8b9224b6aaecd0520397a6f1','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=campaigns','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=campaigns','','2012-10-23 01:59:28');
INSERT INTO `l38sx_rokadminaudit` VALUES (1108,216,'127.0.0.1','a9f4ee7f8b9224b6aaecd0520397a6f1','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=campaigns','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=campaigns','','2012-10-23 02:04:10');
INSERT INTO `l38sx_rokadminaudit` VALUES (1109,216,'127.0.0.1','a9f4ee7f8b9224b6aaecd0520397a6f1','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=campaigns','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=campaigns','','2012-10-23 02:04:46');
INSERT INTO `l38sx_rokadminaudit` VALUES (1110,216,'127.0.0.1','a9f4ee7f8b9224b6aaecd0520397a6f1','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=campaigns','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=campaigns','','2012-10-23 02:05:27');
INSERT INTO `l38sx_rokadminaudit` VALUES (1111,216,'127.0.0.1','a9f4ee7f8b9224b6aaecd0520397a6f1','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=users','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=campaigns','','2012-10-23 02:11:00');
INSERT INTO `l38sx_rokadminaudit` VALUES (1112,216,'127.0.0.1','a9f4ee7f8b9224b6aaecd0520397a6f1','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=catalog','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=users','','2012-10-23 02:13:09');
INSERT INTO `l38sx_rokadminaudit` VALUES (1113,216,'127.0.0.1','a9f4ee7f8b9224b6aaecd0520397a6f1','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=users','','2012-10-23 02:13:09');
INSERT INTO `l38sx_rokadminaudit` VALUES (1114,216,'127.0.0.1','a9f4ee7f8b9224b6aaecd0520397a6f1','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=campaigns','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 02:13:13');
INSERT INTO `l38sx_rokadminaudit` VALUES (1115,216,'127.0.0.1','a9f4ee7f8b9224b6aaecd0520397a6f1','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=campaigns','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 02:18:38');
INSERT INTO `l38sx_rokadminaudit` VALUES (1116,216,'127.0.0.1','a9f4ee7f8b9224b6aaecd0520397a6f1','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=campaigns','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 02:23:22');
INSERT INTO `l38sx_rokadminaudit` VALUES (1117,216,'127.0.0.1','a9f4ee7f8b9224b6aaecd0520397a6f1','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=campaigns','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 02:25:24');
INSERT INTO `l38sx_rokadminaudit` VALUES (1118,0,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=campaigns','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 05:25:22');
INSERT INTO `l38sx_rokadminaudit` VALUES (1119,0,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_login','login',NULL,'/administrator/index.php','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=campaigns','','2012-10-23 05:25:27');
INSERT INTO `l38sx_rokadminaudit` VALUES (1120,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=campaigns','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=campaigns','','2012-10-23 05:25:27');
INSERT INTO `l38sx_rokadminaudit` VALUES (1121,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=campaigns&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=campaigns','','2012-10-23 05:25:33');
INSERT INTO `l38sx_rokadminaudit` VALUES (1122,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=campaigns&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=campaigns','','2012-10-23 05:25:46');
INSERT INTO `l38sx_rokadminaudit` VALUES (1123,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=campaigns','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=campaigns','','2012-10-23 05:34:28');
INSERT INTO `l38sx_rokadminaudit` VALUES (1124,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=campaigns&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=campaigns','','2012-10-23 05:42:19');
INSERT INTO `l38sx_rokadminaudit` VALUES (1125,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','close',0,'/administrator/index.php?option=com_tienda&controller=campaigns&view=campaigns&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=campaigns&task=edit&id=1','','2012-10-23 05:47:24');
INSERT INTO `l38sx_rokadminaudit` VALUES (1126,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=categories','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=campaigns&task=edit&id=1','','2012-10-23 05:47:24');
INSERT INTO `l38sx_rokadminaudit` VALUES (1127,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=categories','','2012-10-23 05:47:54');
INSERT INTO `l38sx_rokadminaudit` VALUES (1128,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 05:48:07');
INSERT INTO `l38sx_rokadminaudit` VALUES (1129,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','',1,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 05:49:29');
INSERT INTO `l38sx_rokadminaudit` VALUES (1130,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','','2012-10-23 05:49:43');
INSERT INTO `l38sx_rokadminaudit` VALUES (1131,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','addRelationship',NULL,'/administrator/index.php?option=com_tienda&view=products&task=addRelationship&protocol=json','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 05:50:12');
INSERT INTO `l38sx_rokadminaudit` VALUES (1132,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','',1,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 05:50:16');
INSERT INTO `l38sx_rokadminaudit` VALUES (1133,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','','2012-10-23 05:51:04');
INSERT INTO `l38sx_rokadminaudit` VALUES (1134,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','save_as',1,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 05:51:11');
INSERT INTO `l38sx_rokadminaudit` VALUES (1135,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','edit',2,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=2','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 05:51:12');
INSERT INTO `l38sx_rokadminaudit` VALUES (1136,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','apply',2,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=2','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=2','','2012-10-23 05:51:26');
INSERT INTO `l38sx_rokadminaudit` VALUES (1137,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','edit',2,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=2','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=2','','2012-10-23 05:51:26');
INSERT INTO `l38sx_rokadminaudit` VALUES (1138,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','save',2,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=2','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=2','','2012-10-23 05:51:46');
INSERT INTO `l38sx_rokadminaudit` VALUES (1139,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=2','','2012-10-23 05:51:46');
INSERT INTO `l38sx_rokadminaudit` VALUES (1140,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','enable',0,'/administrator/index.php?option=com_tienda&controller=products&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 05:52:06');
INSERT INTO `l38sx_rokadminaudit` VALUES (1141,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','',NULL,'/administrator/index.php?option=com_tienda&view=products','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 05:52:07');
INSERT INTO `l38sx_rokadminaudit` VALUES (1142,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products','','2012-10-23 05:52:10');
INSERT INTO `l38sx_rokadminaudit` VALUES (1143,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','addRelationship',NULL,'/administrator/index.php?option=com_tienda&view=products&task=addRelationship&protocol=json','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 05:56:51');
INSERT INTO `l38sx_rokadminaudit` VALUES (1144,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','',1,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 05:57:01');
INSERT INTO `l38sx_rokadminaudit` VALUES (1145,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','','2012-10-23 05:57:11');
INSERT INTO `l38sx_rokadminaudit` VALUES (1146,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','removeRelationship',NULL,'/administrator/index.php?option=com_tienda&view=products&task=removeRelationship&protocol=json&productrelation_id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 05:57:49');
INSERT INTO `l38sx_rokadminaudit` VALUES (1147,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','',1,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 05:57:49');
INSERT INTO `l38sx_rokadminaudit` VALUES (1148,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','','2012-10-23 05:57:59');
INSERT INTO `l38sx_rokadminaudit` VALUES (1149,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','',1,'/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 05:58:47');
INSERT INTO `l38sx_rokadminaudit` VALUES (1150,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','addRelationship',NULL,'/administrator/index.php?option=com_tienda&view=products&task=addRelationship&protocol=json','http://crowdfunding.local/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','','2012-10-23 05:58:47');
INSERT INTO `l38sx_rokadminaudit` VALUES (1151,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_tienda','edit',1,'/administrator/index.php?option=com_tienda&view=products&task=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_tienda&controller=products&view=products&task=edit&id=1','','2012-10-23 06:02:26');
INSERT INTO `l38sx_rokadminaudit` VALUES (1152,0,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_cpanel','',NULL,'/administrator/','','','2012-10-24 21:39:17');
INSERT INTO `l38sx_rokadminaudit` VALUES (1153,0,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_cpanel','',NULL,'/administrator/','','','2012-10-24 21:39:29');
INSERT INTO `l38sx_rokadminaudit` VALUES (1154,0,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_login','login',NULL,'/administrator/index.php','http://crowdfunding.local/administrator/','','2012-10-24 21:39:39');
INSERT INTO `l38sx_rokadminaudit` VALUES (1155,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_cpanel','',NULL,'/administrator/index.php','http://crowdfunding.local/administrator/','','2012-10-24 21:39:39');
INSERT INTO `l38sx_rokadminaudit` VALUES (1156,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_installer','ajax',NULL,'/administrator/index.php?option=com_installer&view=update&task=update.ajax','http://crowdfunding.local/administrator/index.php','','2012-10-24 21:39:40');
INSERT INTO `l38sx_rokadminaudit` VALUES (1157,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_installer','ajax',NULL,'/administrator/index.php?option=com_installer&view=update&task=update.ajax','http://crowdfunding.local/administrator/index.php','','2012-10-24 21:39:44');
INSERT INTO `l38sx_rokadminaudit` VALUES (1158,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_modules','',NULL,'/administrator/index.php?option=com_modules','http://crowdfunding.local/administrator/index.php','','2012-10-24 21:39:47');
INSERT INTO `l38sx_rokadminaudit` VALUES (1159,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_modules','edit',1,'/administrator/index.php?option=com_modules&task=module.edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_modules','','2012-10-24 21:40:04');
INSERT INTO `l38sx_rokadminaudit` VALUES (1160,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_modules','edit',1,'/administrator/index.php?option=com_modules&view=module&layout=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_modules','','2012-10-24 21:40:04');
INSERT INTO `l38sx_rokadminaudit` VALUES (1161,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_modules','save',1,'/administrator/index.php?option=com_modules&layout=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=1','Main Menu','2012-10-24 21:40:19');
INSERT INTO `l38sx_rokadminaudit` VALUES (1162,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_modules','',NULL,'/administrator/index.php?option=com_modules&view=modules','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=1','','2012-10-24 21:40:19');
INSERT INTO `l38sx_rokadminaudit` VALUES (1163,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_menus','edit',NULL,'/administrator/index.php?option=com_menus&view=item&layout=edit&menutype=mainmenu','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-24 21:40:25');
INSERT INTO `l38sx_rokadminaudit` VALUES (1164,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_menus','',NULL,'/administrator/index.php?option=com_menus&view=menutypes&tmpl=component&recordId=0','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit&menutype=mainmenu','','2012-10-24 21:40:29');
INSERT INTO `l38sx_rokadminaudit` VALUES (1165,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_menus','setType',0,'/administrator/index.php?option=com_menus&layout=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit&menutype=mainmenu','','2012-10-24 21:41:05');
INSERT INTO `l38sx_rokadminaudit` VALUES (1166,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_menus','edit',NULL,'/administrator/index.php?option=com_menus&view=item&layout=edit','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit&menutype=mainmenu','','2012-10-24 21:41:05');
INSERT INTO `l38sx_rokadminaudit` VALUES (1167,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_menus','save2new',0,'/administrator/index.php?option=com_menus&layout=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit','browse','2012-10-24 21:41:59');
INSERT INTO `l38sx_rokadminaudit` VALUES (1168,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_menus','edit',NULL,'/administrator/index.php?option=com_menus&view=item&layout=edit','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit','','2012-10-24 21:41:59');
INSERT INTO `l38sx_rokadminaudit` VALUES (1169,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_menus','',NULL,'/administrator/index.php?option=com_menus&view=menutypes&tmpl=component&recordId=0','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit','','2012-10-24 21:42:03');
INSERT INTO `l38sx_rokadminaudit` VALUES (1170,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_menus','setType',0,'/administrator/index.php?option=com_menus&layout=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit','','2012-10-24 21:42:17');
INSERT INTO `l38sx_rokadminaudit` VALUES (1171,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_menus','edit',NULL,'/administrator/index.php?option=com_menus&view=item&layout=edit','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit','','2012-10-24 21:42:17');
INSERT INTO `l38sx_rokadminaudit` VALUES (1172,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_menus','apply',0,'/administrator/index.php?option=com_menus&layout=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit','Start','2012-10-24 21:42:40');
INSERT INTO `l38sx_rokadminaudit` VALUES (1173,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_menus','edit',104,'/administrator/index.php?option=com_menus&view=item&layout=edit&id=104','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit','','2012-10-24 21:42:40');
INSERT INTO `l38sx_rokadminaudit` VALUES (1174,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_menus','save2new',104,'/administrator/index.php?option=com_menus&layout=edit&id=104','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit&id=104','Start','2012-10-24 21:42:44');
INSERT INTO `l38sx_rokadminaudit` VALUES (1175,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_menus','edit',NULL,'/administrator/index.php?option=com_menus&view=item&layout=edit','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit&id=104','','2012-10-24 21:42:44');
INSERT INTO `l38sx_rokadminaudit` VALUES (1176,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_menus','',NULL,'/administrator/index.php?option=com_menus&view=menutypes&tmpl=component&recordId=0','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit','','2012-10-24 21:42:48');
INSERT INTO `l38sx_rokadminaudit` VALUES (1177,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_menus','setType',0,'/administrator/index.php?option=com_menus&layout=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit','','2012-10-24 21:43:05');
INSERT INTO `l38sx_rokadminaudit` VALUES (1178,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_menus','edit',NULL,'/administrator/index.php?option=com_menus&view=item&layout=edit','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit','','2012-10-24 21:43:05');
INSERT INTO `l38sx_rokadminaudit` VALUES (1179,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_menus','save',0,'/administrator/index.php?option=com_menus&layout=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit','learn','2012-10-24 21:43:16');
INSERT INTO `l38sx_rokadminaudit` VALUES (1180,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_menus','',NULL,'/administrator/index.php?option=com_menus&view=items','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit','','2012-10-24 21:43:16');
INSERT INTO `l38sx_rokadminaudit` VALUES (1181,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_modules','',NULL,'/administrator/index.php?option=com_modules','http://crowdfunding.local/administrator/index.php?option=com_menus&view=items','','2012-10-24 21:44:00');
INSERT INTO `l38sx_rokadminaudit` VALUES (1182,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_modules','',NULL,'/administrator/index.php?option=com_modules&view=select&tmpl=component','http://crowdfunding.local/administrator/index.php?option=com_modules','','2012-10-24 21:44:13');
INSERT INTO `l38sx_rokadminaudit` VALUES (1183,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_modules','add',NULL,'/administrator/index.php?option=com_modules&task=module.add&eid=223','http://crowdfunding.local/administrator/index.php?option=com_modules&view=select&tmpl=component','','2012-10-24 21:44:23');
INSERT INTO `l38sx_rokadminaudit` VALUES (1184,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_modules','edit',NULL,'/administrator/index.php?option=com_modules&view=module&layout=edit','http://crowdfunding.local/administrator/index.php?option=com_modules&view=select&tmpl=component','','2012-10-24 21:44:23');
INSERT INTO `l38sx_rokadminaudit` VALUES (1185,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_modules','save',0,'/administrator/index.php?option=com_modules&layout=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit','Search','2012-10-24 21:44:43');
INSERT INTO `l38sx_rokadminaudit` VALUES (1186,216,'127.0.0.1','4c78f47a8215c4ccd718f0375a6e715c','com_modules','',NULL,'/administrator/index.php?option=com_modules&view=modules','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit','','2012-10-24 21:44:44');
INSERT INTO `l38sx_rokadminaudit` VALUES (1187,0,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',1,'/administrator/index.php?option=com_modules&task=module.edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 01:10:52');
INSERT INTO `l38sx_rokadminaudit` VALUES (1188,0,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',116,'/administrator/index.php?option=com_modules&task=module.edit&id=116','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 01:11:02');
INSERT INTO `l38sx_rokadminaudit` VALUES (1189,0,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_login','login',NULL,'/administrator/index.php','http://crowdfunding.local/administrator/index.php?option=com_modules&task=module.edit&id=1','','2012-10-25 01:11:02');
INSERT INTO `l38sx_rokadminaudit` VALUES (1190,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',1,'/administrator/index.php?option=com_modules&task=module.edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_modules&task=module.edit&id=1','','2012-10-25 01:11:02');
INSERT INTO `l38sx_rokadminaudit` VALUES (1191,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',1,'/administrator/index.php?option=com_modules&view=module&layout=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_modules&task=module.edit&id=1','','2012-10-25 01:11:02');
INSERT INTO `l38sx_rokadminaudit` VALUES (1192,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_login','login',NULL,'/administrator/index.php','http://crowdfunding.local/administrator/index.php?option=com_modules&task=module.edit&id=116','','2012-10-25 01:11:06');
INSERT INTO `l38sx_rokadminaudit` VALUES (1193,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','save',1,'/administrator/index.php?option=com_modules&layout=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=1','Main Menu','2012-10-25 01:11:16');
INSERT INTO `l38sx_rokadminaudit` VALUES (1194,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','',NULL,'/administrator/index.php?option=com_modules&view=modules','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=1','','2012-10-25 01:11:16');
INSERT INTO `l38sx_rokadminaudit` VALUES (1195,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',116,'/administrator/index.php?option=com_modules&task=module.edit&id=116','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 01:11:37');
INSERT INTO `l38sx_rokadminaudit` VALUES (1196,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',116,'/administrator/index.php?option=com_modules&view=module&layout=edit&id=116','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 01:11:37');
INSERT INTO `l38sx_rokadminaudit` VALUES (1197,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','save',116,'/administrator/index.php?option=com_modules&layout=edit&id=116','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=116','Search','2012-10-25 01:11:40');
INSERT INTO `l38sx_rokadminaudit` VALUES (1198,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','',NULL,'/administrator/index.php?option=com_modules&view=modules','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=116','','2012-10-25 01:11:41');
INSERT INTO `l38sx_rokadminaudit` VALUES (1199,0,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','',NULL,'/administrator/index.php?option=com_modules&view=modules','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=116','','2012-10-25 01:46:53');
INSERT INTO `l38sx_rokadminaudit` VALUES (1200,0,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_login','login',NULL,'/administrator/index.php','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 01:46:56');
INSERT INTO `l38sx_rokadminaudit` VALUES (1201,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','',NULL,'/administrator/index.php?option=com_modules&view=modules','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 01:46:56');
INSERT INTO `l38sx_rokadminaudit` VALUES (1202,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','unpublish',NULL,'/administrator/index.php?option=com_modules','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 01:47:26');
INSERT INTO `l38sx_rokadminaudit` VALUES (1203,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','unpublish',NULL,'/administrator/index.php?option=com_modules','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 01:47:26');
INSERT INTO `l38sx_rokadminaudit` VALUES (1204,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','',NULL,'/administrator/index.php?option=com_modules&view=modules','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 01:47:27');
INSERT INTO `l38sx_rokadminaudit` VALUES (1205,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_installer','',NULL,'/administrator/index.php?option=com_installer','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 01:51:31');
INSERT INTO `l38sx_rokadminaudit` VALUES (1206,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_installer','',NULL,'/administrator/index.php?option=com_installer&view=manage','http://crowdfunding.local/administrator/index.php?option=com_installer','','2012-10-25 01:51:40');
INSERT INTO `l38sx_rokadminaudit` VALUES (1207,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_installer','publish',NULL,'/administrator/index.php?option=com_installer&view=manage','http://crowdfunding.local/administrator/index.php?option=com_installer&view=manage','','2012-10-25 01:51:45');
INSERT INTO `l38sx_rokadminaudit` VALUES (1208,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_installer','',NULL,'/administrator/index.php?option=com_installer&view=manage','http://crowdfunding.local/administrator/index.php?option=com_installer&view=manage','','2012-10-25 01:51:45');
INSERT INTO `l38sx_rokadminaudit` VALUES (1209,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_banners','',NULL,'/administrator/index.php?option=com_banners&view=clients','http://crowdfunding.local/administrator/index.php?option=com_installer&view=manage','','2012-10-25 01:51:49');
INSERT INTO `l38sx_rokadminaudit` VALUES (1210,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_banners','add',NULL,'/administrator/index.php?option=com_banners&view=clients','http://crowdfunding.local/administrator/index.php?option=com_banners&view=clients','','2012-10-25 01:51:52');
INSERT INTO `l38sx_rokadminaudit` VALUES (1211,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_banners','edit',NULL,'/administrator/index.php?option=com_banners&view=client&layout=edit','http://crowdfunding.local/administrator/index.php?option=com_banners&view=clients','','2012-10-25 01:51:52');
INSERT INTO `l38sx_rokadminaudit` VALUES (1212,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_banners','save',0,'/administrator/index.php?option=com_banners&layout=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_banners&view=client&layout=edit','ICrowdFund','2012-10-25 01:52:16');
INSERT INTO `l38sx_rokadminaudit` VALUES (1213,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_banners','',NULL,'/administrator/index.php?option=com_banners&view=clients','http://crowdfunding.local/administrator/index.php?option=com_banners&view=client&layout=edit','','2012-10-25 01:52:16');
INSERT INTO `l38sx_rokadminaudit` VALUES (1214,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_categories','',NULL,'/administrator/index.php?option=com_categories&extension=com_banners','http://crowdfunding.local/administrator/index.php?option=com_banners&view=clients','','2012-10-25 01:52:20');
INSERT INTO `l38sx_rokadminaudit` VALUES (1215,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_categories','add',NULL,'/administrator/index.php?option=com_categories&view=categories','http://crowdfunding.local/administrator/index.php?option=com_categories&extension=com_banners','','2012-10-25 01:52:24');
INSERT INTO `l38sx_rokadminaudit` VALUES (1216,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_categories','edit',NULL,'/administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_banners','http://crowdfunding.local/administrator/index.php?option=com_categories&extension=com_banners','','2012-10-25 01:52:24');
INSERT INTO `l38sx_rokadminaudit` VALUES (1217,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_categories','save',0,'/administrator/index.php?option=com_categories&extension=com_banners&layout=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_banners','Home Page Banner 1024 X 195','2012-10-25 01:52:53');
INSERT INTO `l38sx_rokadminaudit` VALUES (1218,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_categories','',NULL,'/administrator/index.php?option=com_categories&view=categories&extension=com_banners','http://crowdfunding.local/administrator/index.php?option=com_categories&view=category&layout=edit&extension=com_banners','','2012-10-25 01:52:53');
INSERT INTO `l38sx_rokadminaudit` VALUES (1219,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_banners','',NULL,'/administrator/index.php?option=com_banners&view=banners','http://crowdfunding.local/administrator/index.php?option=com_categories&view=categories&extension=com_banners','','2012-10-25 01:53:00');
INSERT INTO `l38sx_rokadminaudit` VALUES (1220,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_banners','add',NULL,'/administrator/index.php?option=com_banners&view=banners','http://crowdfunding.local/administrator/index.php?option=com_banners&view=banners','','2012-10-25 01:53:04');
INSERT INTO `l38sx_rokadminaudit` VALUES (1221,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_banners','edit',NULL,'/administrator/index.php?option=com_banners&view=banner&layout=edit','http://crowdfunding.local/administrator/index.php?option=com_banners&view=banners','','2012-10-25 01:53:05');
INSERT INTO `l38sx_rokadminaudit` VALUES (1222,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_media','',NULL,'/administrator/index.php?option=com_media&view=images&tmpl=component&asset=com_banners&author=&fieldid=jform_params_imageurl&folder=banners','http://crowdfunding.local/administrator/index.php?option=com_banners&view=banner&layout=edit','','2012-10-25 01:53:31');
INSERT INTO `l38sx_rokadminaudit` VALUES (1223,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_media','',NULL,'/administrator/index.php?option=com_media&view=imagesList&tmpl=component&folder=banners&asset=com_banners&author=','http://crowdfunding.local/administrator/index.php?option=com_media&view=images&tmpl=component&asset=com_banners&author=&fieldid=jform_params_imageurl&folder=banners','','2012-10-25 01:53:31');
INSERT INTO `l38sx_rokadminaudit` VALUES (1224,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_banners','save',0,'/administrator/index.php?option=com_banners&layout=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_banners&view=banner&layout=edit','Targeting the Entrepreneur','2012-10-25 01:54:08');
INSERT INTO `l38sx_rokadminaudit` VALUES (1225,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_banners','',NULL,'/administrator/index.php?option=com_banners&view=banners','http://crowdfunding.local/administrator/index.php?option=com_banners&view=banner&layout=edit','','2012-10-25 01:54:08');
INSERT INTO `l38sx_rokadminaudit` VALUES (1226,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','',NULL,'/administrator/index.php?option=com_modules','http://crowdfunding.local/administrator/index.php?option=com_banners&view=banners','','2012-10-25 01:54:11');
INSERT INTO `l38sx_rokadminaudit` VALUES (1227,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','',NULL,'/administrator/index.php?option=com_modules&view=select&tmpl=component','http://crowdfunding.local/administrator/index.php?option=com_modules','','2012-10-25 01:54:18');
INSERT INTO `l38sx_rokadminaudit` VALUES (1228,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','add',NULL,'/administrator/index.php?option=com_modules&task=module.add&eid=203','http://crowdfunding.local/administrator/index.php?option=com_modules&view=select&tmpl=component','','2012-10-25 01:54:21');
INSERT INTO `l38sx_rokadminaudit` VALUES (1229,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',NULL,'/administrator/index.php?option=com_modules&view=module&layout=edit','http://crowdfunding.local/administrator/index.php?option=com_modules&view=select&tmpl=component','','2012-10-25 01:54:21');
INSERT INTO `l38sx_rokadminaudit` VALUES (1230,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','save',0,'/administrator/index.php?option=com_modules&layout=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit','Home Page Banner','2012-10-25 01:54:58');
INSERT INTO `l38sx_rokadminaudit` VALUES (1231,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','',NULL,'/administrator/index.php?option=com_modules&view=modules','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit','','2012-10-25 01:54:58');
INSERT INTO `l38sx_rokadminaudit` VALUES (1232,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','',NULL,'/administrator/index.php?option=com_modules&view=modules','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 01:55:15');
INSERT INTO `l38sx_rokadminaudit` VALUES (1233,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',117,'/administrator/index.php?option=com_modules&task=module.edit&id=117','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 01:55:18');
INSERT INTO `l38sx_rokadminaudit` VALUES (1234,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',117,'/administrator/index.php?option=com_modules&view=module&layout=edit&id=117','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 01:55:19');
INSERT INTO `l38sx_rokadminaudit` VALUES (1235,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','save',117,'/administrator/index.php?option=com_modules&layout=edit&id=117','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=117','Home Page Banner','2012-10-25 01:55:25');
INSERT INTO `l38sx_rokadminaudit` VALUES (1236,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','',NULL,'/administrator/index.php?option=com_modules&view=modules','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=117','','2012-10-25 01:55:25');
INSERT INTO `l38sx_rokadminaudit` VALUES (1237,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',117,'/administrator/index.php?option=com_modules&task=module.edit&id=117','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 01:57:58');
INSERT INTO `l38sx_rokadminaudit` VALUES (1238,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',117,'/administrator/index.php?option=com_modules&view=module&layout=edit&id=117','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 01:57:58');
INSERT INTO `l38sx_rokadminaudit` VALUES (1239,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','save',117,'/administrator/index.php?option=com_modules&layout=edit&id=117','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=117','Home Page Banner','2012-10-25 01:58:09');
INSERT INTO `l38sx_rokadminaudit` VALUES (1240,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','',NULL,'/administrator/index.php?option=com_modules&view=modules','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=117','','2012-10-25 01:58:16');
INSERT INTO `l38sx_rokadminaudit` VALUES (1241,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',117,'/administrator/index.php?option=com_modules&task=module.edit&id=117','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 01:58:25');
INSERT INTO `l38sx_rokadminaudit` VALUES (1242,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',117,'/administrator/index.php?option=com_modules&view=module&layout=edit&id=117','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 01:58:25');
INSERT INTO `l38sx_rokadminaudit` VALUES (1243,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','save',117,'/administrator/index.php?option=com_modules&layout=edit&id=117','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=117','Home Page Banner','2012-10-25 01:58:32');
INSERT INTO `l38sx_rokadminaudit` VALUES (1244,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','',NULL,'/administrator/index.php?option=com_modules&view=modules','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=117','','2012-10-25 01:58:33');
INSERT INTO `l38sx_rokadminaudit` VALUES (1245,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_menus','',NULL,'/administrator/index.php?option=com_menus&view=items&menutype=mainmenu','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 02:08:41');
INSERT INTO `l38sx_rokadminaudit` VALUES (1246,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_menus','edit',101,'/administrator/index.php?option=com_menus&task=item.edit&id=101','http://crowdfunding.local/administrator/index.php?option=com_menus&view=items&menutype=mainmenu','','2012-10-25 02:08:44');
INSERT INTO `l38sx_rokadminaudit` VALUES (1247,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_menus','edit',101,'/administrator/index.php?option=com_menus&view=item&layout=edit&id=101','http://crowdfunding.local/administrator/index.php?option=com_menus&view=items&menutype=mainmenu','','2012-10-25 02:08:44');
INSERT INTO `l38sx_rokadminaudit` VALUES (1248,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_menus','apply',101,'/administrator/index.php?option=com_menus&layout=edit&id=101','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit&id=101','Home','2012-10-25 02:09:10');
INSERT INTO `l38sx_rokadminaudit` VALUES (1249,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_menus','edit',101,'/administrator/index.php?option=com_menus&view=item&layout=edit&id=101','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit&id=101','','2012-10-25 02:09:10');
INSERT INTO `l38sx_rokadminaudit` VALUES (1250,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_menus','cancel',101,'/administrator/index.php?option=com_menus&layout=edit&id=101','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit&id=101','Home','2012-10-25 02:09:33');
INSERT INTO `l38sx_rokadminaudit` VALUES (1251,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_menus','',NULL,'/administrator/index.php?option=com_menus&view=items','http://crowdfunding.local/administrator/index.php?option=com_menus&view=item&layout=edit&id=101','','2012-10-25 02:09:33');
INSERT INTO `l38sx_rokadminaudit` VALUES (1252,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','',NULL,'/administrator/index.php?option=com_templates','http://crowdfunding.local/administrator/index.php?option=com_menus&view=items','','2012-10-25 02:09:36');
INSERT INTO `l38sx_rokadminaudit` VALUES (1253,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','edit',8,'/administrator/index.php?option=com_templates&task=style.edit&id=8','http://crowdfunding.local/administrator/index.php?option=com_templates','','2012-10-25 02:09:43');
INSERT INTO `l38sx_rokadminaudit` VALUES (1254,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','edit',8,'/administrator/index.php?option=com_templates&view=style&layout=edit&id=8','http://crowdfunding.local/administrator/index.php?option=com_templates','','2012-10-25 02:09:43');
INSERT INTO `l38sx_rokadminaudit` VALUES (1255,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','save',8,'/administrator/index.php?option=com_templates&layout=edit&id=8','http://crowdfunding.local/administrator/index.php?option=com_templates&view=style&layout=edit&id=8','default - Default','2012-10-25 02:09:57');
INSERT INTO `l38sx_rokadminaudit` VALUES (1256,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','',NULL,'/administrator/index.php?option=com_templates&view=styles','http://crowdfunding.local/administrator/index.php?option=com_templates&view=style&layout=edit&id=8','','2012-10-25 02:09:58');
INSERT INTO `l38sx_rokadminaudit` VALUES (1257,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','edit',8,'/administrator/index.php?option=com_templates&task=style.edit&id=8','http://crowdfunding.local/administrator/index.php?option=com_templates&view=styles','','2012-10-25 02:10:05');
INSERT INTO `l38sx_rokadminaudit` VALUES (1258,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','edit',8,'/administrator/index.php?option=com_templates&view=style&layout=edit&id=8','http://crowdfunding.local/administrator/index.php?option=com_templates&view=styles','','2012-10-25 02:10:05');
INSERT INTO `l38sx_rokadminaudit` VALUES (1259,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','save2copy',8,'/administrator/index.php?option=com_templates&layout=edit&id=8','http://crowdfunding.local/administrator/index.php?option=com_templates&view=style&layout=edit&id=8','Homepage - Default','2012-10-25 02:10:22');
INSERT INTO `l38sx_rokadminaudit` VALUES (1260,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','edit',9,'/administrator/index.php?option=com_templates&view=style&layout=edit&id=9','http://crowdfunding.local/administrator/index.php?option=com_templates&view=style&layout=edit&id=8','','2012-10-25 02:10:22');
INSERT INTO `l38sx_rokadminaudit` VALUES (1261,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','save',9,'/administrator/index.php?option=com_templates&layout=edit&id=9','http://crowdfunding.local/administrator/index.php?option=com_templates&view=style&layout=edit&id=9','Homepage - Default','2012-10-25 02:10:39');
INSERT INTO `l38sx_rokadminaudit` VALUES (1262,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','',NULL,'/administrator/index.php?option=com_templates&view=styles','http://crowdfunding.local/administrator/index.php?option=com_templates&view=style&layout=edit&id=9','','2012-10-25 02:10:39');
INSERT INTO `l38sx_rokadminaudit` VALUES (1263,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','edit',8,'/administrator/index.php?option=com_templates&task=style.edit&id=8','http://crowdfunding.local/administrator/index.php?option=com_templates&view=styles','','2012-10-25 02:10:42');
INSERT INTO `l38sx_rokadminaudit` VALUES (1264,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','edit',8,'/administrator/index.php?option=com_templates&view=style&layout=edit&id=8','http://crowdfunding.local/administrator/index.php?option=com_templates&view=styles','','2012-10-25 02:10:42');
INSERT INTO `l38sx_rokadminaudit` VALUES (1265,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','save',8,'/administrator/index.php?option=com_templates&layout=edit&id=8','http://crowdfunding.local/administrator/index.php?option=com_templates&view=style&layout=edit&id=8','default - Default','2012-10-25 02:11:06');
INSERT INTO `l38sx_rokadminaudit` VALUES (1266,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','',NULL,'/administrator/index.php?option=com_templates&view=styles','http://crowdfunding.local/administrator/index.php?option=com_templates&view=style&layout=edit&id=8','','2012-10-25 02:11:06');
INSERT INTO `l38sx_rokadminaudit` VALUES (1267,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','edit',9,'/administrator/index.php?option=com_templates&task=style.edit&id=9','http://crowdfunding.local/administrator/index.php?option=com_templates&view=styles','','2012-10-25 02:11:09');
INSERT INTO `l38sx_rokadminaudit` VALUES (1268,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','edit',9,'/administrator/index.php?option=com_templates&view=style&layout=edit&id=9','http://crowdfunding.local/administrator/index.php?option=com_templates&view=styles','','2012-10-25 02:11:10');
INSERT INTO `l38sx_rokadminaudit` VALUES (1269,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','save',9,'/administrator/index.php?option=com_templates&layout=edit&id=9','http://crowdfunding.local/administrator/index.php?option=com_templates&view=style&layout=edit&id=9','Homepage - Default','2012-10-25 02:11:13');
INSERT INTO `l38sx_rokadminaudit` VALUES (1270,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_templates','',NULL,'/administrator/index.php?option=com_templates&view=styles','http://crowdfunding.local/administrator/index.php?option=com_templates&view=style&layout=edit&id=9','','2012-10-25 02:11:13');
INSERT INTO `l38sx_rokadminaudit` VALUES (1271,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','',NULL,'/administrator/index.php?option=com_modules','http://crowdfunding.local/administrator/index.php?option=com_templates&view=styles','','2012-10-25 02:13:33');
INSERT INTO `l38sx_rokadminaudit` VALUES (1272,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','',NULL,'/administrator/index.php?option=com_modules&view=select&tmpl=component','http://crowdfunding.local/administrator/index.php?option=com_modules','','2012-10-25 02:13:43');
INSERT INTO `l38sx_rokadminaudit` VALUES (1273,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','add',NULL,'/administrator/index.php?option=com_modules&task=module.add&eid=205','http://crowdfunding.local/administrator/index.php?option=com_modules&view=select&tmpl=component','','2012-10-25 02:14:05');
INSERT INTO `l38sx_rokadminaudit` VALUES (1274,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',NULL,'/administrator/index.php?option=com_modules&view=module&layout=edit','http://crowdfunding.local/administrator/index.php?option=com_modules&view=select&tmpl=component','','2012-10-25 02:14:05');
INSERT INTO `l38sx_rokadminaudit` VALUES (1275,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','add',NULL,'/administrator/index.php?option=com_modules&task=module.add&eid=205','http://crowdfunding.local/administrator/index.php?option=com_modules&view=select&tmpl=component','','2012-10-25 02:14:06');
INSERT INTO `l38sx_rokadminaudit` VALUES (1276,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',NULL,'/administrator/index.php?option=com_modules&view=module&layout=edit','http://crowdfunding.local/administrator/index.php?option=com_modules&view=select&tmpl=component','','2012-10-25 02:14:12');
INSERT INTO `l38sx_rokadminaudit` VALUES (1277,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','apply',0,'/administrator/index.php?option=com_modules&layout=edit&id=0','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit','Footer Terms','2012-10-25 02:19:43');
INSERT INTO `l38sx_rokadminaudit` VALUES (1278,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',118,'/administrator/index.php?option=com_modules&view=module&layout=edit&id=118','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit','','2012-10-25 02:19:43');
INSERT INTO `l38sx_rokadminaudit` VALUES (1279,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','save2copy',118,'/administrator/index.php?option=com_modules&layout=edit&id=118','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=118','Footer Terms','2012-10-25 02:19:50');
INSERT INTO `l38sx_rokadminaudit` VALUES (1280,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',119,'/administrator/index.php?option=com_modules&view=module&layout=edit&id=119','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=118','','2012-10-25 02:19:50');
INSERT INTO `l38sx_rokadminaudit` VALUES (1281,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','apply',119,'/administrator/index.php?option=com_modules&layout=edit&id=119','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=119','Footer Learn More','2012-10-25 02:20:52');
INSERT INTO `l38sx_rokadminaudit` VALUES (1282,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',119,'/administrator/index.php?option=com_modules&view=module&layout=edit&id=119','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=119','','2012-10-25 02:20:52');
INSERT INTO `l38sx_rokadminaudit` VALUES (1283,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','save2copy',119,'/administrator/index.php?option=com_modules&layout=edit&id=119','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=119','Footer Learn More','2012-10-25 02:21:06');
INSERT INTO `l38sx_rokadminaudit` VALUES (1284,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',120,'/administrator/index.php?option=com_modules&view=module&layout=edit&id=120','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=119','','2012-10-25 02:21:06');
INSERT INTO `l38sx_rokadminaudit` VALUES (1285,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','apply',120,'/administrator/index.php?option=com_modules&layout=edit&id=120','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=120','Footer Customer Happiness','2012-10-25 02:22:22');
INSERT INTO `l38sx_rokadminaudit` VALUES (1286,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',120,'/administrator/index.php?option=com_modules&view=module&layout=edit&id=120','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=120','','2012-10-25 02:22:22');
INSERT INTO `l38sx_rokadminaudit` VALUES (1287,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','save2copy',120,'/administrator/index.php?option=com_modules&layout=edit&id=120','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=120','Footer Customer Happiness','2012-10-25 02:22:49');
INSERT INTO `l38sx_rokadminaudit` VALUES (1288,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','edit',121,'/administrator/index.php?option=com_modules&view=module&layout=edit&id=121','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=120','','2012-10-25 02:22:50');
INSERT INTO `l38sx_rokadminaudit` VALUES (1289,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','save',121,'/administrator/index.php?option=com_modules&layout=edit&id=121','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=121','Footer Social News','2012-10-25 02:23:18');
INSERT INTO `l38sx_rokadminaudit` VALUES (1290,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','',NULL,'/administrator/index.php?option=com_modules&view=modules','http://crowdfunding.local/administrator/index.php?option=com_modules&view=module&layout=edit&id=121','','2012-10-25 02:23:18');
INSERT INTO `l38sx_rokadminaudit` VALUES (1291,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','publish',NULL,'/administrator/index.php?option=com_modules','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 02:23:22');
INSERT INTO `l38sx_rokadminaudit` VALUES (1292,216,'127.0.0.1','e37c774224fea1e37e40696e2c262433','com_modules','',NULL,'/administrator/index.php?option=com_modules&view=modules','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 02:23:22');
INSERT INTO `l38sx_rokadminaudit` VALUES (1293,0,'127.0.0.1','4cae9d4b97602e41e367f68c8f0017b1','com_banners','',NULL,'/administrator/index.php?option=com_banners','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 02:39:01');
INSERT INTO `l38sx_rokadminaudit` VALUES (1294,0,'127.0.0.1','4cae9d4b97602e41e367f68c8f0017b1','com_login','login',NULL,'/administrator/index.php','http://crowdfunding.local/administrator/index.php?option=com_banners','','2012-10-25 02:39:04');
INSERT INTO `l38sx_rokadminaudit` VALUES (1295,216,'127.0.0.1','4cae9d4b97602e41e367f68c8f0017b1','com_banners','',NULL,'/administrator/index.php?option=com_banners','http://crowdfunding.local/administrator/index.php?option=com_banners','','2012-10-25 02:39:04');
INSERT INTO `l38sx_rokadminaudit` VALUES (1296,216,'127.0.0.1','4cae9d4b97602e41e367f68c8f0017b1','com_banners','edit',1,'/administrator/index.php?option=com_banners&task=banner.edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_banners','','2012-10-25 02:39:11');
INSERT INTO `l38sx_rokadminaudit` VALUES (1297,216,'127.0.0.1','4cae9d4b97602e41e367f68c8f0017b1','com_banners','edit',1,'/administrator/index.php?option=com_banners&view=banner&layout=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_banners','','2012-10-25 02:39:12');
INSERT INTO `l38sx_rokadminaudit` VALUES (1298,216,'127.0.0.1','4cae9d4b97602e41e367f68c8f0017b1','com_banners','apply',1,'/administrator/index.php?option=com_banners&layout=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_banners&view=banner&layout=edit&id=1','Targeting the Entrepreneur','2012-10-25 02:39:26');
INSERT INTO `l38sx_rokadminaudit` VALUES (1299,216,'127.0.0.1','4cae9d4b97602e41e367f68c8f0017b1','com_banners','edit',1,'/administrator/index.php?option=com_banners&view=banner&layout=edit&id=1','http://crowdfunding.local/administrator/index.php?option=com_banners&view=banner&layout=edit&id=1','','2012-10-25 02:39:26');
INSERT INTO `l38sx_rokadminaudit` VALUES (1300,216,'127.0.0.1','4cae9d4b97602e41e367f68c8f0017b1','com_tienda','',NULL,'/administrator/index.php?option=com_tienda','http://crowdfunding.local/administrator/index.php?option=com_modules&view=modules','','2012-10-25 02:40:34');
INSERT INTO `l38sx_rokadminaudit` VALUES (1301,0,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_cpanel','',NULL,'/crowdfunding/administrator/index.php','','','2012-10-25 17:03:15');
INSERT INTO `l38sx_rokadminaudit` VALUES (1302,0,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_login','login',NULL,'/crowdfunding/administrator/index.php','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php','','2012-10-25 17:03:19');
INSERT INTO `l38sx_rokadminaudit` VALUES (1303,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_cpanel','',NULL,'/crowdfunding/administrator/index.php','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php','','2012-10-25 17:03:19');
INSERT INTO `l38sx_rokadminaudit` VALUES (1304,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','ajax',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=update&task=update.ajax','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php','','2012-10-25 17:03:20');
INSERT INTO `l38sx_rokadminaudit` VALUES (1305,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','ajax',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=update&task=update.ajax','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php','','2012-10-25 17:03:22');
INSERT INTO `l38sx_rokadminaudit` VALUES (1306,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_config','',NULL,'/crowdfunding/administrator/index.php?option=com_config','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php','','2012-10-25 17:03:28');
INSERT INTO `l38sx_rokadminaudit` VALUES (1307,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_config','save',NULL,'/crowdfunding/administrator/index.php?option=com_config','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_config','','2012-10-25 17:04:52');
INSERT INTO `l38sx_rokadminaudit` VALUES (1308,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_cpanel','',NULL,'/crowdfunding/administrator/index.php','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_config','','2012-10-25 17:04:53');
INSERT INTO `l38sx_rokadminaudit` VALUES (1309,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','ajax',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=update&task=update.ajax','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php','','2012-10-25 17:04:54');
INSERT INTO `l38sx_rokadminaudit` VALUES (1310,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_installer','ajax',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=update&task=update.ajax','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php','','2012-10-25 17:04:56');
INSERT INTO `l38sx_rokadminaudit` VALUES (1311,216,'71.213.51.78','52284efff72619d36dee8f6220e975d3','com_users','',NULL,'/crowdfunding/administrator/index.php?option=com_users&view=users','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php','','2012-10-25 17:05:02');
INSERT INTO `l38sx_rokadminaudit` VALUES (1312,0,'71.213.51.78','uunvupl9upnppdfv5lviqnev66','com_cpanel','',NULL,'/crowdfunding/administrator/index.php','','','2012-10-26 16:31:08');
INSERT INTO `l38sx_rokadminaudit` VALUES (1313,0,'71.213.51.78','uunvupl9upnppdfv5lviqnev66','com_login','login',NULL,'/crowdfunding/administrator/index.php','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php','','2012-10-26 16:31:12');
INSERT INTO `l38sx_rokadminaudit` VALUES (1314,216,'71.213.51.78','uunvupl9upnppdfv5lviqnev66','com_cpanel','',NULL,'/crowdfunding/administrator/index.php','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php','','2012-10-26 16:31:13');
INSERT INTO `l38sx_rokadminaudit` VALUES (1315,216,'71.213.51.78','uunvupl9upnppdfv5lviqnev66','com_installer','ajax',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=update&task=update.ajax','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php','','2012-10-26 16:31:15');
INSERT INTO `l38sx_rokadminaudit` VALUES (1316,216,'71.213.51.78','uunvupl9upnppdfv5lviqnev66','com_installer','ajax',NULL,'/crowdfunding/administrator/index.php?option=com_installer&view=update&task=update.ajax','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php','','2012-10-26 16:31:18');
INSERT INTO `l38sx_rokadminaudit` VALUES (1317,216,'71.213.51.78','uunvupl9upnppdfv5lviqnev66','com_users','add',NULL,'/crowdfunding/administrator/index.php?option=com_users&task=user.add','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php','','2012-10-26 16:36:19');
INSERT INTO `l38sx_rokadminaudit` VALUES (1318,216,'71.213.51.78','uunvupl9upnppdfv5lviqnev66','com_users','edit',NULL,'/crowdfunding/administrator/index.php?option=com_users&view=user&layout=edit','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php','','2012-10-26 16:36:20');
INSERT INTO `l38sx_rokadminaudit` VALUES (1319,216,'71.213.51.78','uunvupl9upnppdfv5lviqnev66','com_users','save',0,'/crowdfunding/administrator/index.php?option=com_users&layout=edit&id=0','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=user&layout=edit','Bruce','2012-10-26 16:37:03');
INSERT INTO `l38sx_rokadminaudit` VALUES (1320,216,'71.213.51.78','uunvupl9upnppdfv5lviqnev66','com_users','',NULL,'/crowdfunding/administrator/index.php?option=com_users&view=users','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_users&view=user&layout=edit','','2012-10-26 16:37:06');
/*!40000 ALTER TABLE `l38sx_rokadminaudit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_rokuserstats`
--

DROP TABLE IF EXISTS `l38sx_rokuserstats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_rokuserstats` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `session_id` varchar(50) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ip` (`ip`),
  KEY `session_id` (`session_id`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_rokuserstats`
--

LOCK TABLES `l38sx_rokuserstats` WRITE;
/*!40000 ALTER TABLE `l38sx_rokuserstats` DISABLE KEYS */;
INSERT INTO `l38sx_rokuserstats` VALUES (68,0,'71.213.51.78','njefhacebpja7dq6vrcd1g71b3','/crowdfunding/index.php','http://projects.ammonitenetworks.com/crowdfunding/','2012-10-22 22:01:02');
INSERT INTO `l38sx_rokuserstats` VALUES (69,0,'24.187.136.255','05i4kaalc3nhlm0ofs0mmnfog1','/crowdfunding/','','2012-10-22 22:02:25');
INSERT INTO `l38sx_rokuserstats` VALUES (70,0,'71.213.51.78','njefhacebpja7dq6vrcd1g71b3','/crowdfunding/','http://projects.ammonitenetworks.com/crowdfunding/administrator/index.php?option=com_templates&view=styles','2012-10-22 22:11:32');
INSERT INTO `l38sx_rokuserstats` VALUES (71,0,'71.213.51.78','njefhacebpja7dq6vrcd1g71b3','/crowdfunding/index.php','http://projects.ammonitenetworks.com/crowdfunding/','2012-10-22 22:15:00');
INSERT INTO `l38sx_rokuserstats` VALUES (72,0,'127.0.0.1','88eb3603c6ab233f7de5e669c949a33c','/','','2012-10-22 22:55:58');
INSERT INTO `l38sx_rokuserstats` VALUES (73,0,'127.0.0.1','88eb3603c6ab233f7de5e669c949a33c','/','','2012-10-24 19:09:12');
INSERT INTO `l38sx_rokuserstats` VALUES (74,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','','2012-10-24 21:31:23');
INSERT INTO `l38sx_rokuserstats` VALUES (75,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','','2012-10-24 21:39:17');
INSERT INTO `l38sx_rokuserstats` VALUES (76,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','','2012-10-24 21:43:26');
INSERT INTO `l38sx_rokuserstats` VALUES (77,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','','2012-10-24 21:44:50');
INSERT INTO `l38sx_rokuserstats` VALUES (78,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/index.php/component/finder/?task=suggestions.display&format=json&tmpl=component','http://crowdfunding.local/','2012-10-24 21:45:11');
INSERT INTO `l38sx_rokuserstats` VALUES (79,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-24 21:45:14');
INSERT INTO `l38sx_rokuserstats` VALUES (80,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-24 21:46:02');
INSERT INTO `l38sx_rokuserstats` VALUES (81,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:11:44');
INSERT INTO `l38sx_rokuserstats` VALUES (82,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:13:49');
INSERT INTO `l38sx_rokuserstats` VALUES (83,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:14:45');
INSERT INTO `l38sx_rokuserstats` VALUES (84,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:15:36');
INSERT INTO `l38sx_rokuserstats` VALUES (85,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:16:43');
INSERT INTO `l38sx_rokuserstats` VALUES (86,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:19:27');
INSERT INTO `l38sx_rokuserstats` VALUES (87,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:22:04');
INSERT INTO `l38sx_rokuserstats` VALUES (88,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:22:28');
INSERT INTO `l38sx_rokuserstats` VALUES (89,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:24:58');
INSERT INTO `l38sx_rokuserstats` VALUES (90,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:28:26');
INSERT INTO `l38sx_rokuserstats` VALUES (91,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:33:27');
INSERT INTO `l38sx_rokuserstats` VALUES (92,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:34:49');
INSERT INTO `l38sx_rokuserstats` VALUES (93,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:40:50');
INSERT INTO `l38sx_rokuserstats` VALUES (94,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:41:55');
INSERT INTO `l38sx_rokuserstats` VALUES (95,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:42:41');
INSERT INTO `l38sx_rokuserstats` VALUES (96,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:43:17');
INSERT INTO `l38sx_rokuserstats` VALUES (97,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:44:15');
INSERT INTO `l38sx_rokuserstats` VALUES (98,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:45:10');
INSERT INTO `l38sx_rokuserstats` VALUES (99,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:46:26');
INSERT INTO `l38sx_rokuserstats` VALUES (100,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:47:30');
INSERT INTO `l38sx_rokuserstats` VALUES (101,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:55:04');
INSERT INTO `l38sx_rokuserstats` VALUES (102,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:55:29');
INSERT INTO `l38sx_rokuserstats` VALUES (103,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:58:25');
INSERT INTO `l38sx_rokuserstats` VALUES (104,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 01:58:42');
INSERT INTO `l38sx_rokuserstats` VALUES (105,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/index.php/browse','http://crowdfunding.local/','2012-10-25 02:00:40');
INSERT INTO `l38sx_rokuserstats` VALUES (106,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/index.php/media/com_tienda/images/noimage.png','http://crowdfunding.local/index.php/browse','2012-10-25 02:00:40');
INSERT INTO `l38sx_rokuserstats` VALUES (107,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/index.php/browse/products/2-media','http://crowdfunding.local/index.php/browse','2012-10-25 02:00:47');
INSERT INTO `l38sx_rokuserstats` VALUES (108,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/index.php/start','http://crowdfunding.local/index.php/browse/products/2-media','2012-10-25 02:01:13');
INSERT INTO `l38sx_rokuserstats` VALUES (109,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/index.php/component/users/?view=login&return=L2luZGV4LnBocC9zdGFydA==','http://crowdfunding.local/index.php/browse/products/2-media','2012-10-25 02:01:14');
INSERT INTO `l38sx_rokuserstats` VALUES (110,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/index.php/learn','http://crowdfunding.local/index.php/component/users/?view=login&return=L2luZGV4LnBocC9zdGFydA==','2012-10-25 02:01:23');
INSERT INTO `l38sx_rokuserstats` VALUES (111,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/index.php/component/users/?view=login&return=L2luZGV4LnBocC9sZWFybg==','http://crowdfunding.local/index.php/component/users/?view=login&return=L2luZGV4LnBocC9zdGFydA==','2012-10-25 02:01:24');
INSERT INTO `l38sx_rokuserstats` VALUES (112,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/index.php/component/users/?view=login&return=L2luZGV4LnBocC9zdGFydA==','2012-10-25 02:01:24');
INSERT INTO `l38sx_rokuserstats` VALUES (113,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/','2012-10-25 02:01:49');
INSERT INTO `l38sx_rokuserstats` VALUES (114,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/index.php/browse','http://crowdfunding.local/','2012-10-25 02:04:59');
INSERT INTO `l38sx_rokuserstats` VALUES (115,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/index.php/media/com_tienda/images/noimage.png','http://crowdfunding.local/index.php/browse','2012-10-25 02:05:00');
INSERT INTO `l38sx_rokuserstats` VALUES (116,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/index.php/browse','2012-10-25 02:05:57');
INSERT INTO `l38sx_rokuserstats` VALUES (117,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/index.php/browse','2012-10-25 02:09:15');
INSERT INTO `l38sx_rokuserstats` VALUES (118,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/index.php/browse','2012-10-25 02:11:17');
INSERT INTO `l38sx_rokuserstats` VALUES (119,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/index.php/browse','2012-10-25 02:22:49');
INSERT INTO `l38sx_rokuserstats` VALUES (120,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/index.php/browse','2012-10-25 02:23:56');
INSERT INTO `l38sx_rokuserstats` VALUES (121,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/index.php/browse','2012-10-25 02:25:01');
INSERT INTO `l38sx_rokuserstats` VALUES (122,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/index.php/browse','2012-10-25 02:25:56');
INSERT INTO `l38sx_rokuserstats` VALUES (123,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/index.php/browse','2012-10-25 02:34:32');
INSERT INTO `l38sx_rokuserstats` VALUES (124,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/index.php/browse','http://crowdfunding.local/','2012-10-25 02:36:17');
INSERT INTO `l38sx_rokuserstats` VALUES (125,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/index.php/media/com_tienda/images/noimage.png','http://crowdfunding.local/index.php/browse','2012-10-25 02:36:19');
INSERT INTO `l38sx_rokuserstats` VALUES (126,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/index.php/browse','http://crowdfunding.local/','2012-10-25 02:37:35');
INSERT INTO `l38sx_rokuserstats` VALUES (127,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/index.php/media/com_tienda/images/noimage.png','http://crowdfunding.local/index.php/browse','2012-10-25 02:37:39');
INSERT INTO `l38sx_rokuserstats` VALUES (128,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/index.php/browse','2012-10-25 02:38:02');
INSERT INTO `l38sx_rokuserstats` VALUES (129,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/index.php/browse','2012-10-25 02:39:58');
INSERT INTO `l38sx_rokuserstats` VALUES (130,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/index.php/browse','http://crowdfunding.local/','2012-10-25 02:40:33');
INSERT INTO `l38sx_rokuserstats` VALUES (131,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/index.php/media/com_tienda/images/noimage.png','http://crowdfunding.local/index.php/browse','2012-10-25 02:40:34');
INSERT INTO `l38sx_rokuserstats` VALUES (132,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/index.php/browse/products/2-media','http://crowdfunding.local/index.php/browse','2012-10-25 02:42:22');
INSERT INTO `l38sx_rokuserstats` VALUES (133,0,'127.0.0.1','6ecb9f5ab4058a96f32d329c4654e22e','/','http://crowdfunding.local/index.php/browse/products/2-media','2012-10-25 02:43:07');
INSERT INTO `l38sx_rokuserstats` VALUES (134,0,'71.213.51.78','njefhacebpja7dq6vrcd1g71b3','/crowdfunding/','','2012-10-25 02:55:20');
INSERT INTO `l38sx_rokuserstats` VALUES (135,0,'71.213.51.78','njefhacebpja7dq6vrcd1g71b3','/crowdfunding/','','2012-10-25 02:56:30');
INSERT INTO `l38sx_rokuserstats` VALUES (136,0,'71.213.51.78','njefhacebpja7dq6vrcd1g71b3','/crowdfunding/','','2012-10-25 02:57:44');
INSERT INTO `l38sx_rokuserstats` VALUES (137,0,'71.213.51.78','njefhacebpja7dq6vrcd1g71b3','/crowdfunding/index.php/browse','http://projects.ammonitenetworks.com/crowdfunding/','2012-10-25 02:57:48');
INSERT INTO `l38sx_rokuserstats` VALUES (138,0,'71.213.51.78','njefhacebpja7dq6vrcd1g71b3','/crowdfunding/index.php/media/com_tienda/images/noimage.png','http://projects.ammonitenetworks.com/crowdfunding/index.php/browse','2012-10-25 02:57:53');
INSERT INTO `l38sx_rokuserstats` VALUES (139,0,'71.213.51.78','njefhacebpja7dq6vrcd1g71b3','/crowdfunding/index.php/browse/products/2-media','http://projects.ammonitenetworks.com/crowdfunding/index.php/browse','2012-10-25 02:57:55');
INSERT INTO `l38sx_rokuserstats` VALUES (140,0,'71.213.51.78','njefhacebpja7dq6vrcd1g71b3','/crowdfunding/index.php/browse','http://projects.ammonitenetworks.com/crowdfunding/index.php/browse/products/2-media','2012-10-25 03:03:32');
INSERT INTO `l38sx_rokuserstats` VALUES (141,0,'71.213.51.78','njefhacebpja7dq6vrcd1g71b3','/crowdfunding/index.php/media/com_tienda/images/noimage.png','http://projects.ammonitenetworks.com/crowdfunding/index.php/browse','2012-10-25 03:03:32');
INSERT INTO `l38sx_rokuserstats` VALUES (142,0,'71.213.51.78','1a9b8cc673584bd6a60d9668cec033f7','/crowdfunding/','','2012-10-25 17:01:19');
/*!40000 ALTER TABLE `l38sx_rokuserstats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_schemas`
--

DROP TABLE IF EXISTS `l38sx_schemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_schemas`
--

LOCK TABLES `l38sx_schemas` WRITE;
/*!40000 ALTER TABLE `l38sx_schemas` DISABLE KEYS */;
INSERT INTO `l38sx_schemas` VALUES (700,'2.5.7');
/*!40000 ALTER TABLE `l38sx_schemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_session`
--

DROP TABLE IF EXISTS `l38sx_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  `usertype` varchar(50) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_session`
--

LOCK TABLES `l38sx_session` WRITE;
/*!40000 ALTER TABLE `l38sx_session` DISABLE KEYS */;
INSERT INTO `l38sx_session` VALUES ('uunvupl9upnppdfv5lviqnev66',1,0,'1351269426','__default|a:8:{s:15:\"session.counter\";i:9;s:19:\"session.timer.start\";i:1351269067;s:18:\"session.timer.last\";i:1351269423;s:17:\"session.timer.now\";i:1351269426;s:22:\"session.client.browser\";s:117:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/537.4 (KHTML, like Gecko) Chrome/22.0.1229.94 Safari/537.4\";s:8:\"registry\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":3:{s:11:\"application\";O:8:\"stdClass\":1:{s:4:\"lang\";s:0:\"\";}s:13:\"com_installer\";O:8:\"stdClass\":2:{s:7:\"message\";s:0:\"\";s:17:\"extension_message\";s:0:\"\";}s:9:\"com_users\";O:8:\"stdClass\":1:{s:4:\"edit\";O:8:\"stdClass\":1:{s:4:\"user\";O:8:\"stdClass\":1:{s:4:\"data\";N;}}}}}s:4:\"user\";O:5:\"JUser\":25:{s:9:\"\0*\0isRoot\";b:1;s:2:\"id\";s:3:\"216\";s:4:\"name\";s:10:\"Super User\";s:8:\"username\";s:5:\"chris\";s:5:\"email\";s:26:\"chris@ammonitenetworks.com\";s:8:\"password\";s:65:\"a93018706181164e6f3da204883dc4aa:sw3UsgUeT1wXvd5HeLi4aCng99azuz6S\";s:14:\"password_clear\";s:0:\"\";s:8:\"usertype\";s:10:\"deprecated\";s:5:\"block\";s:1:\"0\";s:9:\"sendEmail\";s:1:\"1\";s:12:\"registerDate\";s:19:\"2012-10-22 21:12:15\";s:13:\"lastvisitDate\";s:19:\"2012-10-25 17:03:19\";s:10:\"activation\";s:1:\"0\";s:6:\"params\";s:0:\"\";s:6:\"groups\";a:1:{i:8;s:1:\"8\";}s:5:\"guest\";i:0;s:13:\"lastResetTime\";s:19:\"0000-00-00 00:00:00\";s:10:\"resetCount\";s:1:\"0\";s:10:\"\0*\0_params\";O:9:\"JRegistry\":1:{s:7:\"\0*\0data\";O:8:\"stdClass\":2:{s:16:\"mc_default_style\";N;s:11:\"admin_style\";s:1:\"2\";}}s:14:\"\0*\0_authGroups\";a:2:{i:0;i:1;i:1;i:8;}s:14:\"\0*\0_authLevels\";a:4:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;}s:15:\"\0*\0_authActions\";N;s:12:\"\0*\0_errorMsg\";N;s:10:\"\0*\0_errors\";a:0:{}s:3:\"aid\";i:0;}s:13:\"session.token\";s:32:\"8b3221bc08168aa79756e7aad8e71da6\";}',216,'chris','');
/*!40000 ALTER TABLE `l38sx_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_template_styles`
--

DROP TABLE IF EXISTS `l38sx_template_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_template_styles`
--

LOCK TABLES `l38sx_template_styles` WRITE;
/*!40000 ALTER TABLE `l38sx_template_styles` DISABLE KEYS */;
INSERT INTO `l38sx_template_styles` VALUES (2,'bluestork',1,'1','Bluestork - Default','{\"useRoundedCorners\":\"1\",\"showSiteName\":\"0\"}');
INSERT INTO `l38sx_template_styles` VALUES (3,'atomic',0,'0','Atomic - Default','{}');
INSERT INTO `l38sx_template_styles` VALUES (4,'beez_20',0,'0','Beez2 - Default','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/joomla_black.gif\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"templatecolor\":\"personal\",\"html5\":\"0\"}');
INSERT INTO `l38sx_template_styles` VALUES (5,'hathor',1,'0','Hathor - Default','{\"showSiteName\":\"0\",\"colourChoice\":\"\",\"boldText\":\"0\"}');
INSERT INTO `l38sx_template_styles` VALUES (6,'beez5',0,'0','Beez5 - Default','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/sampledata\\/fruitshop\\/fruits.gif\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"html5\":\"0\"}');
INSERT INTO `l38sx_template_styles` VALUES (7,'rt_missioncontrol',1,'0','rt_missioncontrol - Default','{\"adminTitle\":\"Administrator\",\"templateWidth\":\"variable\",\"dashboard\":\"This is the crowd funding site this text is customizable\",\"menuwidth\":\"small\",\"extendmenu\":\"off\",\"enableGravatar\":\"1\",\"enableSessionBar\":\"1\",\"enableTransitions\":\"enabled\",\"enableQuickEditor\":\"1\",\"enableViewSite\":\"1\",\"enableQuickCheckin\":\"0\",\"enableQuickCacheClean\":\"1\",\"enableFancyHeaders\":\"fancy\",\"showhelp\":\"1\",\"showhelpbutton\":\"1\",\"showlangmenu\":\"1\",\"body_text_color\":\"#333333\",\"body_link_color\":\"#4486BA\",\"header_bg_color\":\"#333333\",\"header_text_color\":\"#CCCCCC\",\"header_link_color\":\"#FFFFFF\",\"header_shadow_color\":\"#000000\",\"tab_bg_color\":\"#4D4D4D\",\"tab_text_color\":\"#FFFFFF\",\"special_bg_color\":\"#C62D2D\",\"special_text_color\":\"#FFFFFF\",\"active_bg_color\":\"#4F9BD8\",\"active_text_color\":\"#FFFFFF\",\"hover_bg_color\":\"#88B719\",\"hover_text_color\":\"#FFFFFF\",\"blackliststyle\":\"2\"}');
INSERT INTO `l38sx_template_styles` VALUES (8,'default',0,'1','default - Default','{\"pagetitle_suffix\":\"ICrowdFund\",\"generator\":\"ICrowdFund\",\"layout\":\"default.php\",\"display_component\":\"1\",\"display_pagetitle\":\"0\"}');
INSERT INTO `l38sx_template_styles` VALUES (9,'default',0,'0','Homepage - Default','{\"pagetitle_suffix\":\"ICrowdFund\",\"generator\":\"ICrowdFund\",\"layout\":\"default.php\",\"display_component\":\"0\",\"display_pagetitle\":\"0\"}');
/*!40000 ALTER TABLE `l38sx_template_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_addresses`
--

DROP TABLE IF EXISTS `l38sx_tienda_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_addresses` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `addresstype_id` int(2) DEFAULT NULL,
  `address_name` varchar(45) DEFAULT NULL,
  `company` varchar(64) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `middle_name` varchar(32) DEFAULT NULL,
  `phone_1` varchar(32) DEFAULT NULL,
  `phone_2` varchar(32) DEFAULT NULL,
  `fax` varchar(32) DEFAULT NULL,
  `address_1` varchar(64) NOT NULL DEFAULT '',
  `address_2` varchar(64) DEFAULT NULL,
  `city` varchar(32) NOT NULL DEFAULT '',
  `postal_code` varchar(32) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `tax_number` varchar(32) NOT NULL,
  `is_default_shipping` tinyint(1) DEFAULT NULL,
  `is_default_billing` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_id`),
  KEY `idx_address_id` (`address_id`),
  KEY `fk_addresses_countries` (`country_id`),
  KEY `fk_zones_addresses` (`zone_id`),
  CONSTRAINT `fk_addresses_countries` FOREIGN KEY (`country_id`) REFERENCES `l38sx_tienda_countries` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_zones_addresses` FOREIGN KEY (`zone_id`) REFERENCES `l38sx_tienda_zones` (`zone_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_addresses`
--

LOCK TABLES `l38sx_tienda_addresses` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_campaigns`
--

DROP TABLE IF EXISTS `l38sx_tienda_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_campaigns` (
  `campaign_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `campaign_name` varchar(255) DEFAULT NULL,
  `campaign_alias` varchar(255) DEFAULT NULL,
  `campaign_description` text,
  `campaign_enabled` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`campaign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_campaigns`
--

LOCK TABLES `l38sx_tienda_campaigns` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_campaigns` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_campaigns` VALUES (1,216,'Funding the Crowd Funding Site',NULL,'Here is the description',1);
/*!40000 ALTER TABLE `l38sx_tienda_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_campaigns_products`
--

DROP TABLE IF EXISTS `l38sx_tienda_campaigns_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_campaigns_products` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `campaign_id` tinyint(4) DEFAULT NULL,
  `product_id` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_campaigns_products`
--

LOCK TABLES `l38sx_tienda_campaigns_products` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_campaigns_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_campaigns_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_carts`
--

DROP TABLE IF EXISTS `l38sx_tienda_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_carts` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(200) NOT NULL,
  `product_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `product_attributes` text NOT NULL COMMENT 'A CSV of productattributeoption_id values, always in numerical order',
  `product_qty` int(11) NOT NULL DEFAULT '1',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cartitem_params` text COMMENT 'Params for the cart item',
  PRIMARY KEY (`cart_id`),
  KEY `idx_user_product` (`user_id`,`product_id`),
  KEY `fk_carts_products` (`product_id`),
  CONSTRAINT `fk_carts_products` FOREIGN KEY (`product_id`) REFERENCES `l38sx_tienda_products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_carts`
--

LOCK TABLES `l38sx_tienda_carts` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_categories`
--

DROP TABLE IF EXISTS `l38sx_tienda_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(128) NOT NULL DEFAULT '',
  `category_alias` varchar(255) NOT NULL DEFAULT '',
  `category_description` text,
  `category_thumb_image` varchar(255) DEFAULT NULL,
  `category_full_image` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL COMMENT 'GMT',
  `modified_date` datetime NOT NULL COMMENT 'GMT',
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `category_enabled` tinyint(1) NOT NULL,
  `isroot` tinyint(1) NOT NULL,
  `display_name_category` tinyint(4) NOT NULL DEFAULT '1',
  `display_name_subcategory` tinyint(4) NOT NULL DEFAULT '1',
  `category_params` text,
  `category_layout` varchar(255) DEFAULT '' COMMENT 'The layout file for this category',
  `categoryproducts_layout` varchar(255) DEFAULT '' COMMENT 'The layout file for all products in this category',
  PRIMARY KEY (`category_id`),
  KEY `idx_category_name` (`category_name`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_categories`
--

LOCK TABLES `l38sx_tienda_categories` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_categories` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_categories` VALUES (1,'All Categories','','',NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',1,6,0,0,1,1,1,1,NULL,'','');
INSERT INTO `l38sx_tienda_categories` VALUES (2,'Media','media','',NULL,'','2012-10-22 23:24:13','2012-10-22 23:24:13',2,3,1,2,1,0,1,1,'','','');
INSERT INTO `l38sx_tienda_categories` VALUES (3,'Technology','technology','',NULL,'','2012-10-22 23:24:53','2012-10-22 23:24:53',4,5,1,1,1,0,1,1,'','','');
/*!40000 ALTER TABLE `l38sx_tienda_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_config`
--

DROP TABLE IF EXISTS `l38sx_tienda_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_config`
--

LOCK TABLES `l38sx_tienda_config` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_config` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_config` VALUES (1,'last_deleted_expired_sessioncarts','2012-10-26 16:37:06');
INSERT INTO `l38sx_tienda_config` VALUES (2,'last_deleted_expired_sessionproductscompared','2012-10-26 16:37:06');
INSERT INTO `l38sx_tienda_config` VALUES (3,'checkProductFiles','1');
INSERT INTO `l38sx_tienda_config` VALUES (4,'checkOrdersOrderCurrency','1');
INSERT INTO `l38sx_tienda_config` VALUES (5,'checkProductsInventory','1');
INSERT INTO `l38sx_tienda_config` VALUES (6,'checkCategoriesRootDesc','1');
INSERT INTO `l38sx_tienda_config` VALUES (7,'checkProductsParamsLayout','1');
INSERT INTO `l38sx_tienda_config` VALUES (8,'checkCategoriesParamsLayout','1');
INSERT INTO `l38sx_tienda_config` VALUES (9,'checkCountriesEnabled','1');
INSERT INTO `l38sx_tienda_config` VALUES (10,'checkCountriesOrdering','1');
INSERT INTO `l38sx_tienda_config` VALUES (11,'checkOrderHistory','1');
INSERT INTO `l38sx_tienda_config` VALUES (12,'checkProductsShortDesc','1');
INSERT INTO `l38sx_tienda_config` VALUES (13,'checkTaxclassesOrdering','1');
INSERT INTO `l38sx_tienda_config` VALUES (14,'checkOrdersOrderNumber','1');
INSERT INTO `l38sx_tienda_config` VALUES (15,'checkOrderInfoZones','1');
INSERT INTO `l38sx_tienda_config` VALUES (16,'checkCurrenciesExchange','1');
INSERT INTO `l38sx_tienda_config` VALUES (17,'checkCartsSessionId','1');
INSERT INTO `l38sx_tienda_config` VALUES (18,'checkOrderZoneAndUser','1');
INSERT INTO `l38sx_tienda_config` VALUES (19,'checkOrderCompletedTasks','1');
INSERT INTO `l38sx_tienda_config` VALUES (20,'checkOrderQuantitiesUpdated','1');
INSERT INTO `l38sx_tienda_config` VALUES (21,'checkOrdersOrderShips','1');
INSERT INTO `l38sx_tienda_config` VALUES (22,'checkProductsName','1');
INSERT INTO `l38sx_tienda_config` VALUES (23,'checkUserInfoEmailDropId','1');
INSERT INTO `l38sx_tienda_config` VALUES (24,'checkProductsOrdering','1');
INSERT INTO `l38sx_tienda_config` VALUES (25,'checkOrderitemsRecurringPrice','1');
INSERT INTO `l38sx_tienda_config` VALUES (26,'checkProductsCheckInventory','1');
INSERT INTO `l38sx_tienda_config` VALUES (27,'checkProductRelationsExisting','1');
INSERT INTO `l38sx_tienda_config` VALUES (28,'checkProductRelationsType','1');
INSERT INTO `l38sx_tienda_config` VALUES (29,'checkSubscriptionsExpire','1');
INSERT INTO `l38sx_tienda_config` VALUES (30,'checkProductsSubscriptions','1');
INSERT INTO `l38sx_tienda_config` VALUES (31,'checkOrderItemsSubscriptions','1');
INSERT INTO `l38sx_tienda_config` VALUES (32,'checkProductsNotForSale','1');
INSERT INTO `l38sx_tienda_config` VALUES (33,'checkSubscriptionsCheckFiles','1');
INSERT INTO `l38sx_tienda_config` VALUES (34,'checkProductsSQL','1');
INSERT INTO `l38sx_tienda_config` VALUES (35,'checkProductcommentshelpful_votes','1');
INSERT INTO `l38sx_tienda_config` VALUES (36,'checkOrderitemsDiscount','1');
INSERT INTO `l38sx_tienda_config` VALUES (37,'checkOrdershippings','1');
INSERT INTO `l38sx_tienda_config` VALUES (38,'checkProductCommentsReported','1');
INSERT INTO `l38sx_tienda_config` VALUES (39,'checkProductFilesMaxDownload','1');
INSERT INTO `l38sx_tienda_config` VALUES (40,'checkProductsProductListprice','1');
INSERT INTO `l38sx_tienda_config` VALUES (41,'checkProductCommentsRatingUpdated','1');
INSERT INTO `l38sx_tienda_config` VALUES (42,'checkProductsOverallRating','1');
INSERT INTO `l38sx_tienda_config` VALUES (43,'updateOverallRatings','1');
INSERT INTO `l38sx_tienda_config` VALUES (44,'checkCartParams','1');
INSERT INTO `l38sx_tienda_config` VALUES (45,'checkOrderitemParams','1');
INSERT INTO `l38sx_tienda_config` VALUES (46,'checkPricesGroupId','1');
INSERT INTO `l38sx_tienda_config` VALUES (47,'updatePriceUserGroups','1');
INSERT INTO `l38sx_tienda_config` VALUES (48,'checkProductQuantityLimits','1');
INSERT INTO `l38sx_tienda_config` VALUES (49,'checkProductAttributeOptionCode','1');
INSERT INTO `l38sx_tienda_config` VALUES (50,'checkOrderItemAttributeCode','1');
INSERT INTO `l38sx_tienda_config` VALUES (51,'checkZoneRelationsZipRange','1');
INSERT INTO `l38sx_tienda_config` VALUES (52,'checkProductCommentsUserEmail','1');
INSERT INTO `l38sx_tienda_config` VALUES (53,'checkCategoriesOrdering','1');
INSERT INTO `l38sx_tienda_config` VALUES (54,'checkProductsArticle','1');
INSERT INTO `l38sx_tienda_config` VALUES (55,'checkEavEntityID','1');
INSERT INTO `l38sx_tienda_config` VALUES (56,'checkEavEditableBy','1');
INSERT INTO `l38sx_tienda_config` VALUES (57,'checkEavEntityType','1');
INSERT INTO `l38sx_tienda_config` VALUES (58,'checkProductCommentsUserName','1');
INSERT INTO `l38sx_tienda_config` VALUES (59,'checkCartsCartId','1');
INSERT INTO `l38sx_tienda_config` VALUES (60,'checkManufacturersDescParams','1');
INSERT INTO `l38sx_tienda_config` VALUES (61,'checkGroupsOrdering','1');
INSERT INTO `l38sx_tienda_config` VALUES (62,'checkParentAttributeOption','1');
INSERT INTO `l38sx_tienda_config` VALUES (63,'checkEavRequired','1');
INSERT INTO `l38sx_tienda_config` VALUES (64,'checkParentAttributeOption2','1');
INSERT INTO `l38sx_tienda_config` VALUES (65,'checkEavAlias','1');
INSERT INTO `l38sx_tienda_config` VALUES (66,'checkProRatedSubscriptionProducts','1');
INSERT INTO `l38sx_tienda_config` VALUES (67,'checkProRatedSubscriptionOrderitems','1');
INSERT INTO `l38sx_tienda_config` VALUES (68,'checkSubscriptionByIssue','1');
INSERT INTO `l38sx_tienda_config` VALUES (69,'checkSubNumUserInfo','1');
INSERT INTO `l38sx_tienda_config` VALUES (70,'checkSubNumSubscriptions','1');
INSERT INTO `l38sx_tienda_config` VALUES (71,'checkOrderInfoTaxNumber','1');
INSERT INTO `l38sx_tienda_config` VALUES (72,'checkAddressTaxNumber','1');
INSERT INTO `l38sx_tienda_config` VALUES (73,'checkSubByIssueGtmField','1');
INSERT INTO `l38sx_tienda_config` VALUES (74,'checkCategoryDisplayFields','1');
INSERT INTO `l38sx_tienda_config` VALUES (75,'checkEmptyEavTable','1');
INSERT INTO `l38sx_tienda_config` VALUES (76,'checkOrderCreditFields','1');
INSERT INTO `l38sx_tienda_config` VALUES (77,'checkUserInfoCreditFields','1');
INSERT INTO `l38sx_tienda_config` VALUES (78,'checkProductAttributeOptionsBlank','1');
INSERT INTO `l38sx_tienda_config` VALUES (79,'checkLevelTaxes','1');
INSERT INTO `l38sx_tienda_config` VALUES (80,'checkOrderitemLevelTaxes','1');
INSERT INTO `l38sx_tienda_config` VALUES (81,'secret_word','! ooV.wvOywZndeZpa:tXz*K#pwuMb3p');
INSERT INTO `l38sx_tienda_config` VALUES (82,'dropZoneIdOrderInfo','1');
INSERT INTO `l38sx_tienda_config` VALUES (83,'checkOrderHashField','1');
INSERT INTO `l38sx_tienda_config` VALUES (84,'checkSubtotalMax','1');
INSERT INTO `l38sx_tienda_config` VALUES (85,'checkProductAttributesWeight','1');
INSERT INTO `l38sx_tienda_config` VALUES (86,'checkOrderItemAttributesWeight','1');
INSERT INTO `l38sx_tienda_config` VALUES (87,'checkOrderItemsWeight','1');
INSERT INTO `l38sx_tienda_config` VALUES (88,'secret_word','yn^e*0SSL Su?>b9C%QqIhF0@SMytI8a');
INSERT INTO `l38sx_tienda_config` VALUES (89,'page_tooltip_dashboard_disabled','1');
INSERT INTO `l38sx_tienda_config` VALUES (90,'secret_word','6k@&l*lM1awm9jH&+E0.X_{o1PrtxQzO');
INSERT INTO `l38sx_tienda_config` VALUES (91,'secret_word','a$ZxQQ8<B{ckV$@NJr7HQsdTpgiWGuA<');
INSERT INTO `l38sx_tienda_config` VALUES (92,'secret_word','mN(,kS9gFqr0fs.oclP{$n0S8L+na__L');
INSERT INTO `l38sx_tienda_config` VALUES (93,'secret_word','!$VL:3G@y_^Ittw!&FmYBb$xIW|$djxC');
INSERT INTO `l38sx_tienda_config` VALUES (94,'secret_word','HUEd*S<v71>A1Jd?v.|8cno?Sus>W?>O');
INSERT INTO `l38sx_tienda_config` VALUES (95,'secret_word','*HNeM3NjPUxM<) C!<cgN1?1}<602at_');
INSERT INTO `l38sx_tienda_config` VALUES (96,'secret_word','#&Qc{4CI)k tBE(YSU^EDm2P#Iks3RG}');
INSERT INTO `l38sx_tienda_config` VALUES (97,'secret_word','4E%,Ql!OAvxsw{52T4gOAr,&6>AXCT5@');
INSERT INTO `l38sx_tienda_config` VALUES (98,'secret_word',')cf.y}M80yCGYQl#^d9O#HwjfecjkvaJ');
INSERT INTO `l38sx_tienda_config` VALUES (99,'secret_word','5V@8nD7Mk6?fv@vj*v69{4d*ST@nt{V?');
INSERT INTO `l38sx_tienda_config` VALUES (100,'secret_word','4_&euX1EqNQ@ m36@^gqi642xoe3|B5,');
INSERT INTO `l38sx_tienda_config` VALUES (101,'secret_word',':6Zd8m:8SUlIahQm.p{EZIc6Fh)jFGbj');
INSERT INTO `l38sx_tienda_config` VALUES (102,'secret_word','*R(XqOL#?{pCsaE:$%0m#qRu#w9>(?2o');
INSERT INTO `l38sx_tienda_config` VALUES (103,'secret_word','RZ7+sYOs&D^*QQ!*POq$?RWC><d(jBy|');
INSERT INTO `l38sx_tienda_config` VALUES (104,'secret_word','@i%&tR.*Lj6*%FuF7*)g6*.mdfu! 2$6');
INSERT INTO `l38sx_tienda_config` VALUES (105,'secret_word','j3G8#Jun4iB0M65PHc_q?30M)K h%f,7');
INSERT INTO `l38sx_tienda_config` VALUES (106,'secret_word','rcjm3FpNOC2}RAToCJg^$37gDav%FgK7');
INSERT INTO `l38sx_tienda_config` VALUES (107,'secret_word','QXzGNeR,Q_VM,Oclu5Wc<W8VTe7NG9%f');
INSERT INTO `l38sx_tienda_config` VALUES (108,'secret_word','(^tkoh1+1tUPI}*Qv#:pyrI@2<*#DThM');
INSERT INTO `l38sx_tienda_config` VALUES (109,'secret_word',' pk^hW 0feIa#wovso6o}W9Ij1+kT+VS');
INSERT INTO `l38sx_tienda_config` VALUES (110,'secret_word','rcLEm8OqF:|bZxRCyNLJfisYNCvtn^1P');
INSERT INTO `l38sx_tienda_config` VALUES (111,'secret_word','GEh<..xD*u.3V_a)HU%6vOizDh|^Oe*<');
INSERT INTO `l38sx_tienda_config` VALUES (112,'secret_word','7{nsP8?Yl#XMFPh5v6..2+alu(X$Te8K');
INSERT INTO `l38sx_tienda_config` VALUES (113,'secret_word','}_rtC3I.K<DcE#Q}z>_gG&J,zIz+G@Vq');
INSERT INTO `l38sx_tienda_config` VALUES (114,'secret_word','c.?XZT?z!5WN_TDgYL>:g7@WTO::@:i%');
INSERT INTO `l38sx_tienda_config` VALUES (115,'secret_word','_4!v$k6!_.f.}?. 5CxwR$y#QUCTrPQ+');
INSERT INTO `l38sx_tienda_config` VALUES (116,'secret_word','W2Uq+zv!U1t@Rk2,:@kwA#BghlY(?K?1');
INSERT INTO `l38sx_tienda_config` VALUES (117,'secret_word','CbGEg8354A}$g7YEmajx+eRFcK5$b5V{');
INSERT INTO `l38sx_tienda_config` VALUES (118,'secret_word',' EKBy4&ZH*EigxQDBjpL>8c%:+6@j*bt');
INSERT INTO `l38sx_tienda_config` VALUES (119,'secret_word','Jjz#7D3v|^TFp(FFXeCry%M!N$+f7Neh');
INSERT INTO `l38sx_tienda_config` VALUES (120,'secret_word','4q8Kp>4|X>PYv8Ry&.D|tLr,Cz5$uF7_');
INSERT INTO `l38sx_tienda_config` VALUES (121,'secret_word','TxmQpk&B{:Hphsl!+aQbRI}TOH@+eghI');
INSERT INTO `l38sx_tienda_config` VALUES (122,'secret_word','vYY2lGy<&%v0.1k{O>VsZdN{m1oEofjm');
INSERT INTO `l38sx_tienda_config` VALUES (123,'secret_word','S^yh*NNEnr27b<:?hS2zT+w5Ia3sj|JS');
INSERT INTO `l38sx_tienda_config` VALUES (124,'secret_word','&Oa)a*Vzk)Ghtj&#Yae.^.it&Sv{nCR>');
INSERT INTO `l38sx_tienda_config` VALUES (125,'secret_word','cK*P7bhw<&F#PX_SU7qQp22DX:LbG4uq');
INSERT INTO `l38sx_tienda_config` VALUES (126,'secret_word','seT+9Q3WIsT RO? IkksN*w5lbBUfTFl');
INSERT INTO `l38sx_tienda_config` VALUES (127,'secret_word','tZh#!J)N_oP#r#$%+ln%vQAf##B22%|B');
INSERT INTO `l38sx_tienda_config` VALUES (128,'secret_word','Zy56$O&Lw{A0YM?#sxNJhca32z1#PBYl');
INSERT INTO `l38sx_tienda_config` VALUES (129,'secret_word','#(EX3,.sK<18pF%{44C#jwEq7_J0j*.J');
INSERT INTO `l38sx_tienda_config` VALUES (130,'secret_word','.LqsUsjQ:ZwBYS2%7UT7_Kh6l}L<bCTl');
INSERT INTO `l38sx_tienda_config` VALUES (131,'secret_word','gD )wbzWZA_T3c+C.k_BL2Lu(t{)$cSP');
INSERT INTO `l38sx_tienda_config` VALUES (132,'secret_word','yV(cEGQg4gHyNy:3IhR.yLo_{ VnzwdP');
INSERT INTO `l38sx_tienda_config` VALUES (133,'secret_word','Ag+n,yu.0,T?!4zq8<I.Eg,nIn9kU1Z$');
INSERT INTO `l38sx_tienda_config` VALUES (134,'secret_word','^{J4E*y$Tp|0vZsd:4qC@,eA3PybxMmK');
INSERT INTO `l38sx_tienda_config` VALUES (135,'secret_word','2:|Xt$|{Kxl})k4M%q6tEk:?RZ@_TgV7');
INSERT INTO `l38sx_tienda_config` VALUES (136,'secret_word','b*GE(bqn5qioky)_<Ls,*01u1{yoV>.n');
INSERT INTO `l38sx_tienda_config` VALUES (137,'secret_word','pruhi?zUE*#A!!4| ?gR>FPfD{D*uUdj');
INSERT INTO `l38sx_tienda_config` VALUES (138,'secret_word','9gbbRkvWu_(^&Wc,j??Eu69mjg52mo,p');
INSERT INTO `l38sx_tienda_config` VALUES (139,'secret_word','V.x66W|hlh>%fh|thUKo+rTYvnG_JWNf');
INSERT INTO `l38sx_tienda_config` VALUES (140,'secret_word','4vK7eGe<IIsLMJ&X<r0NlHQIBOGWkyM@');
INSERT INTO `l38sx_tienda_config` VALUES (141,'secret_word','j?uO%PQwKwQ0L4?2ov{9XzOSm*4B|sD(');
INSERT INTO `l38sx_tienda_config` VALUES (142,'secret_word','L+nRGVweu>lL**<?xU,njPO1!:fS ,{B');
INSERT INTO `l38sx_tienda_config` VALUES (143,'secret_word','VU+?E0t{@d9X#:PxvRa$)W4WWIs.?>8p');
INSERT INTO `l38sx_tienda_config` VALUES (144,'secret_word','FNgSqew}JFnJ29_IDpfWZXg)J?Pq,Snj');
INSERT INTO `l38sx_tienda_config` VALUES (145,'secret_word','wt@%O#M+h8i3:VTH3bVhKL9gG9!Qow}?');
INSERT INTO `l38sx_tienda_config` VALUES (146,'secret_word','hS>tVUa2#ALsuw%p!Ut7Fd9E@ouig%Ha');
INSERT INTO `l38sx_tienda_config` VALUES (147,'secret_word','hcfup15Q}j)nbwRQsnL(jndfy7o.76Rn');
INSERT INTO `l38sx_tienda_config` VALUES (148,'secret_word','A Ogj%hImFp$gQnM7P)?{s Cly1{|G%n');
INSERT INTO `l38sx_tienda_config` VALUES (149,'secret_word','3 .*i}m:e#>LrMRs9qN2fZq9e2vl^g@^');
INSERT INTO `l38sx_tienda_config` VALUES (150,'secret_word','{h+J6d}gz>FUNdyGpH!_!A#5(k3!uspG');
INSERT INTO `l38sx_tienda_config` VALUES (151,'secret_word','SJuhG9DcwBcY*N*4H@mLVX2LCQ|fP$jQ');
INSERT INTO `l38sx_tienda_config` VALUES (152,'secret_word','kB$b3nq7A^_)A$2!hwQU!*0aBLtyFx$M');
INSERT INTO `l38sx_tienda_config` VALUES (153,'secret_word','*UO%qsgEuLs38UHVU.h^_e<X%0f>$JbH');
INSERT INTO `l38sx_tienda_config` VALUES (154,'secret_word','i39y)By9<N3ylFCKTA.5OeXQ$j<KO>a&');
INSERT INTO `l38sx_tienda_config` VALUES (155,'secret_word','&uNbnyXfusLUfnNY$RkhTz&#i@u>m5c%');
INSERT INTO `l38sx_tienda_config` VALUES (156,'secret_word','%G0_J)f^{bYx@3+{vM$hu3A<0&^sR6)i');
INSERT INTO `l38sx_tienda_config` VALUES (157,'secret_word','>:&oDyC1y:>3SH$Mn7VRkikw%lAdl2B!');
INSERT INTO `l38sx_tienda_config` VALUES (158,'secret_word','ve}2$DDE>IUGWP|Y6Nijpems)g Ojn+R');
INSERT INTO `l38sx_tienda_config` VALUES (159,'secret_word','6A4d5yGr$djGZ{onU7+|H%tzGC>Z}@eU');
INSERT INTO `l38sx_tienda_config` VALUES (160,'secret_word','8$MR$dWB@D$Ns#}$@_E3>P^_K?xg?w:F');
INSERT INTO `l38sx_tienda_config` VALUES (161,'secret_word','G:%uGX9Q17pK!5pyilj#rqw<j aPE2K#');
INSERT INTO `l38sx_tienda_config` VALUES (162,'secret_word','qUuQm%eq3b@@e|b_8amHUks0*VfbB:GZ');
INSERT INTO `l38sx_tienda_config` VALUES (163,'secret_word','pV(b7xB<m3<#N.&mwEuV9(njKoPZi.%t');
INSERT INTO `l38sx_tienda_config` VALUES (164,'secret_word','I5#W%qV)R#8NqdBT!gL0*Ag0TkKWig(}');
INSERT INTO `l38sx_tienda_config` VALUES (165,'secret_word','>^W>TOX:R)w0K:4CjU 0<_n%y5B^wHWj');
INSERT INTO `l38sx_tienda_config` VALUES (166,'secret_word','K G9LaY8W7zJ_cChhzJCUGTH@hhSy@,,');
INSERT INTO `l38sx_tienda_config` VALUES (167,'secret_word',':E0CEcf%LiA0Sf(CV@G$eki>(U&zF2Lf');
INSERT INTO `l38sx_tienda_config` VALUES (168,'secret_word','98Z>w^AArJ0,LmCPs_vU4^l26iRul<5r');
INSERT INTO `l38sx_tienda_config` VALUES (169,'secret_word','>iB@(sv8oT4LX8Y 6 h)o t@mW7dV<AY');
INSERT INTO `l38sx_tienda_config` VALUES (170,'secret_word','3$Q)hP|%B|0ovF.(zPZo9rlPhUC8M$3K');
INSERT INTO `l38sx_tienda_config` VALUES (171,'secret_word','NvbTZv14EAS3JQe1jznAzmyieM2%*rV{');
INSERT INTO `l38sx_tienda_config` VALUES (172,'secret_word','knFs|<A>biRi&5oeVxD9fa1HC?02jw36');
INSERT INTO `l38sx_tienda_config` VALUES (173,'secret_word','1|upM&O_4+,E+iuZQA!aV^@7yAO6g@4.');
INSERT INTO `l38sx_tienda_config` VALUES (174,'secret_word','^g$^k13#4}{.+7 ph}PTUQ@kgT7Ga 3B');
INSERT INTO `l38sx_tienda_config` VALUES (175,'secret_word','3^(s8p0$lku.LmR XH7F>u8IUw0}jvG}');
INSERT INTO `l38sx_tienda_config` VALUES (176,'secret_word','pq.mfw01ibI+3Oharx7&y8n0zs1OmGq*');
INSERT INTO `l38sx_tienda_config` VALUES (177,'secret_word','Dh_$<>fP0v2^twnVSvi(s+Se%BAsgGhh');
INSERT INTO `l38sx_tienda_config` VALUES (178,'secret_word','{psO9Z*cR%M,D}JZbRg!{<ow&^h}#ML?');
INSERT INTO `l38sx_tienda_config` VALUES (179,'secret_word','CS%7PH!H<E5wS#m:^gEQ)+vgL@z 6t%>');
INSERT INTO `l38sx_tienda_config` VALUES (180,'secret_word','ZyvBDe>MY$h@L+>J{%8t}8h41B:zU?ct');
INSERT INTO `l38sx_tienda_config` VALUES (181,'secret_word','5 Jc?F3}fX4^}CcK85&dy}#,f{w?*E#n');
INSERT INTO `l38sx_tienda_config` VALUES (182,'secret_word','%PM$+_Z6sEJw <J8t$,XxLq9JMla*#To');
INSERT INTO `l38sx_tienda_config` VALUES (183,'secret_word','7>jAVHW9H+#xRcxQx<xx?JGoAfR+Kr((');
INSERT INTO `l38sx_tienda_config` VALUES (184,'secret_word','QFZSyQj$ |Q%N?5VehZyIa 2A56NrpJ>');
INSERT INTO `l38sx_tienda_config` VALUES (185,'secret_word','%I3xJGQzM&{oo*%Q6>nH<p{8WWZLSqC?');
INSERT INTO `l38sx_tienda_config` VALUES (186,'secret_word','Ou>c>fWN41sH{Hb20.gIpaJL5bD7CrB ');
INSERT INTO `l38sx_tienda_config` VALUES (187,'secret_word','MzEWg?6jFK1D,,7UGj):^mxGZQDV$imi');
INSERT INTO `l38sx_tienda_config` VALUES (188,'secret_word','7N^pV4X2F.wlJ{2$G0X2OwctEHC,pjO.');
INSERT INTO `l38sx_tienda_config` VALUES (189,'secret_word','k@QJ2Cdb|In0dC|Njs_FoQ|Z(u3p74>Y');
INSERT INTO `l38sx_tienda_config` VALUES (190,'secret_word','FtVBcMrO0JJvBk+A%_Mzv)0m<hcyxiYg');
INSERT INTO `l38sx_tienda_config` VALUES (191,'secret_word','Cd@R0f^A5Aie+|r&I301_agV%4Vl%@9Z');
INSERT INTO `l38sx_tienda_config` VALUES (192,'secret_word','Egj>z%wK%7,q{KSymu>q:mlO#rPydoT.');
INSERT INTO `l38sx_tienda_config` VALUES (193,'secret_word','LEe3hrrqGKe,uDLeLmqaOd%hgUdsl0cG');
INSERT INTO `l38sx_tienda_config` VALUES (194,'secret_word','PoU>wDin8*njrEhaLPJs<hC!!X1eh7<+');
INSERT INTO `l38sx_tienda_config` VALUES (195,'secret_word','AS3.q7{Fx9rvqo1swKtng:prYHSv5+f,');
INSERT INTO `l38sx_tienda_config` VALUES (196,'secret_word','6LM|?D,o +D.g#NwQ$lc(?RRXfRq(Tx|');
INSERT INTO `l38sx_tienda_config` VALUES (197,'secret_word','o{492V#mlR8!hJNnCSo*n,T12#!Y_J9e');
INSERT INTO `l38sx_tienda_config` VALUES (198,'secret_word','1alD(:g1M|Qh4*ilELf,MVh3AT4FGuve');
INSERT INTO `l38sx_tienda_config` VALUES (199,'secret_word','Z,F#MDd7H*_{It17@5c3(,r)Uq5V@9(L');
INSERT INTO `l38sx_tienda_config` VALUES (200,'secret_word','Zh,2M9pigIVjs1o.j_1oq}B:^fK+e0}%');
INSERT INTO `l38sx_tienda_config` VALUES (201,'secret_word','InU0F)hxNK6v<^(ubsH}:(hz*Zv_0:$&');
INSERT INTO `l38sx_tienda_config` VALUES (202,'secret_word','_pg9m|RLZzJu4JQqU@)nEt}3)HMnf}P+');
INSERT INTO `l38sx_tienda_config` VALUES (203,'secret_word','3kv(x_Uu$Q(5#X gYWq5sQR8?J6$Kd%V');
INSERT INTO `l38sx_tienda_config` VALUES (204,'secret_word','r}.Sg$oKJ3n<k$&z4v6LL&0PKRd2m.ha');
INSERT INTO `l38sx_tienda_config` VALUES (205,'secret_word','FU{{V2zeGP>6Gs:vwNmGgL^W1C{a,n@o');
INSERT INTO `l38sx_tienda_config` VALUES (206,'secret_word','R!t16LvsNF9aB@gtwT>&fvx{?,4XV^E!');
INSERT INTO `l38sx_tienda_config` VALUES (207,'secret_word','VtOBmCJV2!GWgNz7ioH!cu<A%4wfI+6$');
INSERT INTO `l38sx_tienda_config` VALUES (208,'secret_word','F#RZ(Kt8aS#BDlo<OIQPi5PA8lU2e)0{');
INSERT INTO `l38sx_tienda_config` VALUES (209,'secret_word','@%q>TnCW5S%,PdZDcr$q J)A6.Uf@@5|');
INSERT INTO `l38sx_tienda_config` VALUES (210,'secret_word','b,IxfxxVNU8IpNVz8+O7NCN6B.&7(Hw.');
INSERT INTO `l38sx_tienda_config` VALUES (211,'secret_word','CSOUyhzG}$}o#z>^oRE7crVK@Y6uXM($');
INSERT INTO `l38sx_tienda_config` VALUES (212,'secret_word','ekHauzg9TN(|<%V3oZl%(Al1t!B1zWN1');
INSERT INTO `l38sx_tienda_config` VALUES (213,'secret_word','N*^YGcsyovw*9mYM:q!4{Fd4G}|nk*O!');
INSERT INTO `l38sx_tienda_config` VALUES (214,'secret_word','8H|V(XfA}oS0d2GRbpA(S4Y?)0nFv|S!');
INSERT INTO `l38sx_tienda_config` VALUES (215,'secret_word','HXj+SNP<TjtHl_L7JB@YgrU$bTTkB(9R');
INSERT INTO `l38sx_tienda_config` VALUES (216,'secret_word','YFWF<c&F0IskCKmS4Yni*btJ36U>TEsN');
INSERT INTO `l38sx_tienda_config` VALUES (217,'secret_word','SniyEqoJV9eIl{rJVqV*mvxd_m!&f}yn');
INSERT INTO `l38sx_tienda_config` VALUES (218,'secret_word','T@z_&4U.CFIx,uqL1*}6Or+CC>2z#?0b');
INSERT INTO `l38sx_tienda_config` VALUES (219,'secret_word','xW_fBFGN:}04^)m8WXQmKs{P_<T#gP+}');
INSERT INTO `l38sx_tienda_config` VALUES (220,'secret_word','I)u)^2Rh^Y!iOq+BrjrKm5PYPO,<6!|7');
INSERT INTO `l38sx_tienda_config` VALUES (221,'secret_word','FOrSd_#7TyK6,dNi^0ISC7x}aUB+xi ?');
INSERT INTO `l38sx_tienda_config` VALUES (222,'secret_word','}*X.HTYgS,MX|(cdlFGIZu+tEC6ozlE6');
INSERT INTO `l38sx_tienda_config` VALUES (223,'secret_word','qxd$0Kjj6Gt49T:ykVNzm.aS>&STI8eI');
INSERT INTO `l38sx_tienda_config` VALUES (224,'secret_word','yDCYEleK*{R.mm.ztx@tyJA({Ii,Yui0');
INSERT INTO `l38sx_tienda_config` VALUES (225,'secret_word','vN{N5@2bt(keWf.dd4Z%z!|jFxxw0Bby');
INSERT INTO `l38sx_tienda_config` VALUES (226,'secret_word','ReN,&aoHK&.#tncrxlRbpq&r 2XZ0#p%');
INSERT INTO `l38sx_tienda_config` VALUES (227,'secret_word','.*a?70&qWNlks&ZbuJ8^vLvaPvpZy2>h');
INSERT INTO `l38sx_tienda_config` VALUES (228,'secret_word','IWSk_>BK>F|}&NKhT8GDSo_.fvt>J.Li');
INSERT INTO `l38sx_tienda_config` VALUES (229,'secret_word','. jW{,gREfP3K#<hw380!niL F$1fIHY');
INSERT INTO `l38sx_tienda_config` VALUES (230,'secret_word','98kE3+ULpVv1&o_{|$nwv< :GcfKBOf*');
INSERT INTO `l38sx_tienda_config` VALUES (231,'secret_word','Y2h^O,W$^I:1e)>q2Eo,QRDlw>39F05W');
INSERT INTO `l38sx_tienda_config` VALUES (232,'secret_word','p(PoW2L)Ui^zkUbjaOl<ia,GOR?oFeyM');
INSERT INTO `l38sx_tienda_config` VALUES (233,'secret_word','zpO|,3_ilJI&AHcD|u$yrr6}W!tTe&Sd');
INSERT INTO `l38sx_tienda_config` VALUES (234,'secret_word','Wte?WN+558HThIn}vEbJ3Glv.{p0Fmo%');
INSERT INTO `l38sx_tienda_config` VALUES (235,'secret_word','Kiyl.6k.Ye9+KV|?H{wN$&^$OkP*{!.u');
INSERT INTO `l38sx_tienda_config` VALUES (236,'secret_word',')9xZ!gejU0K?$VNPXt)!%yzm5P8uh:@+');
INSERT INTO `l38sx_tienda_config` VALUES (237,'secret_word','fP,(oU)(X#&NCNUz<JYOdZyKDRaSJ:+R');
INSERT INTO `l38sx_tienda_config` VALUES (238,'secret_word','SVMtZ9Spq0hCFkQ|)@R0U$:BqSpu>MlS');
INSERT INTO `l38sx_tienda_config` VALUES (239,'secret_word','D70_ndwqYb}p4d%b,lf8(jNlGP4mXE3@');
INSERT INTO `l38sx_tienda_config` VALUES (240,'secret_word','k(!0E{hXto}Ffugjr,7QT!oB3VD}Jv@L');
INSERT INTO `l38sx_tienda_config` VALUES (241,'secret_word','4dBC^)mXdf1iPqw0Lb3xN<_tpeYc#oSF');
INSERT INTO `l38sx_tienda_config` VALUES (242,'secret_word','F,ShISy7}GR{.&AJRa$wzJu#,tYotu8D');
INSERT INTO `l38sx_tienda_config` VALUES (243,'secret_word','Q5mId8uILhY&AI{lE +awZq978%9R,!G');
INSERT INTO `l38sx_tienda_config` VALUES (244,'secret_word','Nj6z<SBvJKRetLl(>{@F3)gh$,+4B|Y_');
INSERT INTO `l38sx_tienda_config` VALUES (245,'secret_word','TcyX_J:G.yQ,f%z+c)vdozEeBMvvkxp.');
INSERT INTO `l38sx_tienda_config` VALUES (246,'secret_word','u8^dM5pwZhTqkaHd,rERiamec8|.$GLn');
INSERT INTO `l38sx_tienda_config` VALUES (247,'secret_word','k?W<6eQB+W8$@sqRAvJ8BH7pPRjYqL+q');
INSERT INTO `l38sx_tienda_config` VALUES (248,'secret_word','kxT<A2qC4<_@)ULZKW%fyTC>XfMM(I:2');
INSERT INTO `l38sx_tienda_config` VALUES (249,'secret_word','rX9@Kx*y,#4K^70NY_|#2jfIewdj+P?S');
INSERT INTO `l38sx_tienda_config` VALUES (250,'secret_word','a{@xo:LZ6agnA,)u.&)jG*GMs|8r:CZw');
INSERT INTO `l38sx_tienda_config` VALUES (251,'secret_word','cHJHn>f3fr$!(ZPlm&ZALh!OuVnksKOG');
INSERT INTO `l38sx_tienda_config` VALUES (252,'secret_word','cUo0z57ZL2C2K9%cO>!&t)0O_fBzp4??');
INSERT INTO `l38sx_tienda_config` VALUES (253,'secret_word','mYKW!|@RU!BC%@iA1Iq_U,z+.uPBB<S,');
INSERT INTO `l38sx_tienda_config` VALUES (254,'secret_word','@3k:zt1l>A{tI|6k^<w&AKFkBSC 3MbO');
INSERT INTO `l38sx_tienda_config` VALUES (255,'secret_word','1h>(Q$up@QRWEn0!u?W,7$8k4K4#>&cC');
INSERT INTO `l38sx_tienda_config` VALUES (256,'secret_word','*Jq+vZt_^NFGx&8zdj@51aU7%!Aduz6f');
INSERT INTO `l38sx_tienda_config` VALUES (257,'secret_word','H9es.$ONgt%AEP>l0$^OUDQ&L|v>n7hq');
INSERT INTO `l38sx_tienda_config` VALUES (258,'secret_word','Wc {^FJ:zO>tkd|>?8e*(BuP|jl7sxfq');
INSERT INTO `l38sx_tienda_config` VALUES (259,'secret_word','!Vu|3ufO+s3 ,MTjn$A$muMgR?I&Ymn*');
INSERT INTO `l38sx_tienda_config` VALUES (260,'secret_word','WL8V1yza!e)Qxh.ejV}rFIXX}B5DzcDc');
INSERT INTO `l38sx_tienda_config` VALUES (261,'secret_word','nSGQsY+^MqEmszU}@liZ^2Le1S)fCO4Z');
INSERT INTO `l38sx_tienda_config` VALUES (262,'secret_word','b:yDbHCBUNmkyaJjkY4PW$sEsNMKMY3K');
INSERT INTO `l38sx_tienda_config` VALUES (263,'secret_word','>?3S}&G@bR{_bCv657{ sfw4QMFe!!uI');
INSERT INTO `l38sx_tienda_config` VALUES (264,'secret_word',')M9LP}YH+m.>Vk0sQ_nOfnn&2bQ8ZJ>P');
INSERT INTO `l38sx_tienda_config` VALUES (265,'secret_word','AU} D@t chutI?L.a{R2n.K@GDxL5m<}');
INSERT INTO `l38sx_tienda_config` VALUES (266,'secret_word','dgt?<3b 2pDcgsD2+5Nc{uV+J2.KJ*1p');
INSERT INTO `l38sx_tienda_config` VALUES (267,'secret_word','d{}xBAgcp+fmnWZU,.|5iruKR.*XzZ)K');
INSERT INTO `l38sx_tienda_config` VALUES (268,'secret_word',',#)7C8Xh^q_T u92)7OXH(RIuKN$!<8)');
INSERT INTO `l38sx_tienda_config` VALUES (269,'secret_word','eTd1fwOPNhbX, q)IMXCrhNsaYHQWyOw');
INSERT INTO `l38sx_tienda_config` VALUES (270,'secret_word','ZVg!Ia7ydz@CeEvde@4_S||ryic1jUi.');
INSERT INTO `l38sx_tienda_config` VALUES (271,'secret_word','W@kW5NHDB?5o&ED G|*s%)uv6c)GILxq');
INSERT INTO `l38sx_tienda_config` VALUES (272,'secret_word','fR@x|TQk0l6{hE_Ior{,bd**?uqJwxm#');
INSERT INTO `l38sx_tienda_config` VALUES (273,'secret_word','Ws0f$E+x}@V3NRJYB&73$RdpZ_W5q5g>');
INSERT INTO `l38sx_tienda_config` VALUES (274,'secret_word','Q mtBRHWZ|1)(_%%lGz Yw{Mq2Y9%f(2');
INSERT INTO `l38sx_tienda_config` VALUES (275,'secret_word','YD7xr3OGpqeXYPts24cDdKtgI?aDGU*4');
INSERT INTO `l38sx_tienda_config` VALUES (276,'secret_word','3hEzj@$zRxJ>76#tWN2@!a)GM|l8xw|H');
INSERT INTO `l38sx_tienda_config` VALUES (277,'secret_word','NF(P#%ppFCuP@GFsVK, Zyz.Vc+#h|Z:');
INSERT INTO `l38sx_tienda_config` VALUES (278,'secret_word','gZ&ykD)i#ZXditkPzPY>T@+,d9sOy,Fa');
/*!40000 ALTER TABLE `l38sx_tienda_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_countries`
--

DROP TABLE IF EXISTS `l38sx_tienda_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_countries` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(64) DEFAULT NULL,
  `country_isocode_2` char(2) DEFAULT NULL,
  `country_isocode_3` char(3) DEFAULT NULL,
  `country_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`country_id`),
  KEY `idx_country_name` (`country_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_countries`
--

LOCK TABLES `l38sx_tienda_countries` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_countries` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_countries` VALUES (1,'Afghanistan','AF','AFG',1,1);
INSERT INTO `l38sx_tienda_countries` VALUES (2,'Albania','AL','ALB',1,2);
INSERT INTO `l38sx_tienda_countries` VALUES (3,'Algeria','DZ','DZA',1,3);
INSERT INTO `l38sx_tienda_countries` VALUES (4,'American Samoa','AS','ASM',1,4);
INSERT INTO `l38sx_tienda_countries` VALUES (5,'Andorra','AD','AND',1,5);
INSERT INTO `l38sx_tienda_countries` VALUES (6,'Angola','AO','AGO',1,6);
INSERT INTO `l38sx_tienda_countries` VALUES (7,'Anguilla','AI','AIA',1,7);
INSERT INTO `l38sx_tienda_countries` VALUES (8,'Antarctica','AQ','ATA',1,8);
INSERT INTO `l38sx_tienda_countries` VALUES (9,'Antigua and Barbuda','AG','ATG',1,9);
INSERT INTO `l38sx_tienda_countries` VALUES (10,'Argentina','AR','ARG',1,10);
INSERT INTO `l38sx_tienda_countries` VALUES (11,'Armenia','AM','ARM',1,11);
INSERT INTO `l38sx_tienda_countries` VALUES (12,'Aruba','AW','ABW',1,12);
INSERT INTO `l38sx_tienda_countries` VALUES (13,'Australia','AU','AUS',1,13);
INSERT INTO `l38sx_tienda_countries` VALUES (14,'Austria','AT','AUT',1,14);
INSERT INTO `l38sx_tienda_countries` VALUES (15,'Azerbaijan','AZ','AZE',1,15);
INSERT INTO `l38sx_tienda_countries` VALUES (16,'Bahamas','BS','BHS',1,16);
INSERT INTO `l38sx_tienda_countries` VALUES (17,'Bahrain','BH','BHR',1,17);
INSERT INTO `l38sx_tienda_countries` VALUES (18,'Bangladesh','BD','BGD',1,18);
INSERT INTO `l38sx_tienda_countries` VALUES (19,'Barbados','BB','BRB',1,19);
INSERT INTO `l38sx_tienda_countries` VALUES (20,'Belarus','BY','BLR',1,20);
INSERT INTO `l38sx_tienda_countries` VALUES (21,'Belgium','BE','BEL',1,21);
INSERT INTO `l38sx_tienda_countries` VALUES (22,'Belize','BZ','BLZ',1,22);
INSERT INTO `l38sx_tienda_countries` VALUES (23,'Benin','BJ','BEN',1,23);
INSERT INTO `l38sx_tienda_countries` VALUES (24,'Bermuda','BM','BMU',1,24);
INSERT INTO `l38sx_tienda_countries` VALUES (25,'Bhutan','BT','BTN',1,25);
INSERT INTO `l38sx_tienda_countries` VALUES (26,'Bolivia','BO','BOL',1,26);
INSERT INTO `l38sx_tienda_countries` VALUES (27,'Bosnia and Herzegowina','BA','BIH',1,27);
INSERT INTO `l38sx_tienda_countries` VALUES (28,'Botswana','BW','BWA',1,28);
INSERT INTO `l38sx_tienda_countries` VALUES (29,'Bouvet Island','BV','BVT',1,29);
INSERT INTO `l38sx_tienda_countries` VALUES (30,'Brazil','BR','BRA',1,30);
INSERT INTO `l38sx_tienda_countries` VALUES (31,'British Indian Ocean Territory','IO','IOT',1,31);
INSERT INTO `l38sx_tienda_countries` VALUES (32,'Brunei Darussalam','BN','BRN',1,32);
INSERT INTO `l38sx_tienda_countries` VALUES (33,'Bulgaria','BG','BGR',1,33);
INSERT INTO `l38sx_tienda_countries` VALUES (34,'Burkina Faso','BF','BFA',1,34);
INSERT INTO `l38sx_tienda_countries` VALUES (35,'Burundi','BI','BDI',1,35);
INSERT INTO `l38sx_tienda_countries` VALUES (36,'Cambodia','KH','KHM',1,36);
INSERT INTO `l38sx_tienda_countries` VALUES (37,'Cameroon','CM','CMR',1,37);
INSERT INTO `l38sx_tienda_countries` VALUES (38,'Canada','CA','CAN',1,38);
INSERT INTO `l38sx_tienda_countries` VALUES (39,'Cape Verde','CV','CPV',1,39);
INSERT INTO `l38sx_tienda_countries` VALUES (40,'Cayman Islands','KY','CYM',1,40);
INSERT INTO `l38sx_tienda_countries` VALUES (41,'Central African Republic','CF','CAF',1,41);
INSERT INTO `l38sx_tienda_countries` VALUES (42,'Chad','TD','TCD',1,42);
INSERT INTO `l38sx_tienda_countries` VALUES (43,'Chile','CL','CHL',1,43);
INSERT INTO `l38sx_tienda_countries` VALUES (44,'China','CN','CHN',1,44);
INSERT INTO `l38sx_tienda_countries` VALUES (45,'Christmas Island','CX','CXR',1,45);
INSERT INTO `l38sx_tienda_countries` VALUES (46,'Cocos (Keeling) Islands','CC','CCK',1,46);
INSERT INTO `l38sx_tienda_countries` VALUES (47,'Colombia','CO','COL',1,47);
INSERT INTO `l38sx_tienda_countries` VALUES (48,'Comoros','KM','COM',1,48);
INSERT INTO `l38sx_tienda_countries` VALUES (49,'Congo','CG','COG',1,49);
INSERT INTO `l38sx_tienda_countries` VALUES (50,'Cook Islands','CK','COK',1,50);
INSERT INTO `l38sx_tienda_countries` VALUES (51,'Costa Rica','CR','CRI',1,51);
INSERT INTO `l38sx_tienda_countries` VALUES (52,'Cote D\'Ivoire','CI','CIV',1,52);
INSERT INTO `l38sx_tienda_countries` VALUES (53,'Croatia','HR','HRV',1,53);
INSERT INTO `l38sx_tienda_countries` VALUES (54,'Cuba','CU','CUB',1,54);
INSERT INTO `l38sx_tienda_countries` VALUES (55,'Cyprus','CY','CYP',1,55);
INSERT INTO `l38sx_tienda_countries` VALUES (56,'Czech Republic','CZ','CZE',1,56);
INSERT INTO `l38sx_tienda_countries` VALUES (57,'Denmark','DK','DNK',1,57);
INSERT INTO `l38sx_tienda_countries` VALUES (58,'Djibouti','DJ','DJI',1,58);
INSERT INTO `l38sx_tienda_countries` VALUES (59,'Dominica','DM','DMA',1,59);
INSERT INTO `l38sx_tienda_countries` VALUES (60,'Dominican Republic','DO','DOM',1,60);
INSERT INTO `l38sx_tienda_countries` VALUES (61,'East Timor','TP','TMP',1,61);
INSERT INTO `l38sx_tienda_countries` VALUES (62,'Ecuador','EC','ECU',1,62);
INSERT INTO `l38sx_tienda_countries` VALUES (63,'Egypt','EG','EGY',1,63);
INSERT INTO `l38sx_tienda_countries` VALUES (64,'El Salvador','SV','SLV',1,64);
INSERT INTO `l38sx_tienda_countries` VALUES (65,'Equatorial Guinea','GQ','GNQ',1,65);
INSERT INTO `l38sx_tienda_countries` VALUES (66,'Eritrea','ER','ERI',1,66);
INSERT INTO `l38sx_tienda_countries` VALUES (67,'Estonia','EE','EST',1,67);
INSERT INTO `l38sx_tienda_countries` VALUES (68,'Ethiopia','ET','ETH',1,68);
INSERT INTO `l38sx_tienda_countries` VALUES (69,'Falkland Islands (Malvinas)','FK','FLK',1,69);
INSERT INTO `l38sx_tienda_countries` VALUES (70,'Faroe Islands','FO','FRO',1,70);
INSERT INTO `l38sx_tienda_countries` VALUES (71,'Fiji','FJ','FJI',1,71);
INSERT INTO `l38sx_tienda_countries` VALUES (72,'Finland','FI','FIN',1,72);
INSERT INTO `l38sx_tienda_countries` VALUES (73,'France','FR','FRA',1,73);
INSERT INTO `l38sx_tienda_countries` VALUES (74,'France, Metropolitan','FX','FXX',1,74);
INSERT INTO `l38sx_tienda_countries` VALUES (75,'French Guiana','GF','GUF',1,75);
INSERT INTO `l38sx_tienda_countries` VALUES (76,'French Polynesia','PF','PYF',1,76);
INSERT INTO `l38sx_tienda_countries` VALUES (77,'French Southern Territories','TF','ATF',1,77);
INSERT INTO `l38sx_tienda_countries` VALUES (78,'Gabon','GA','GAB',1,78);
INSERT INTO `l38sx_tienda_countries` VALUES (79,'Gambia','GM','GMB',1,79);
INSERT INTO `l38sx_tienda_countries` VALUES (80,'Georgia','GE','GEO',1,80);
INSERT INTO `l38sx_tienda_countries` VALUES (81,'Germany','DE','DEU',1,81);
INSERT INTO `l38sx_tienda_countries` VALUES (82,'Ghana','GH','GHA',1,82);
INSERT INTO `l38sx_tienda_countries` VALUES (83,'Gibraltar','GI','GIB',1,83);
INSERT INTO `l38sx_tienda_countries` VALUES (84,'Greece','GR','GRC',1,84);
INSERT INTO `l38sx_tienda_countries` VALUES (85,'Greenland','GL','GRL',1,85);
INSERT INTO `l38sx_tienda_countries` VALUES (86,'Grenada','GD','GRD',1,86);
INSERT INTO `l38sx_tienda_countries` VALUES (87,'Guadeloupe','GP','GLP',1,87);
INSERT INTO `l38sx_tienda_countries` VALUES (88,'Guam','GU','GUM',1,88);
INSERT INTO `l38sx_tienda_countries` VALUES (89,'Guatemala','GT','GTM',1,89);
INSERT INTO `l38sx_tienda_countries` VALUES (90,'Guinea','GN','GIN',1,90);
INSERT INTO `l38sx_tienda_countries` VALUES (91,'Guinea-bissau','GW','GNB',1,91);
INSERT INTO `l38sx_tienda_countries` VALUES (92,'Guyana','GY','GUY',1,92);
INSERT INTO `l38sx_tienda_countries` VALUES (93,'Haiti','HT','HTI',1,93);
INSERT INTO `l38sx_tienda_countries` VALUES (94,'Heard and Mc Donald Islands','HM','HMD',1,94);
INSERT INTO `l38sx_tienda_countries` VALUES (95,'Honduras','HN','HND',1,95);
INSERT INTO `l38sx_tienda_countries` VALUES (96,'Hong Kong','HK','HKG',1,96);
INSERT INTO `l38sx_tienda_countries` VALUES (97,'Hungary','HU','HUN',1,97);
INSERT INTO `l38sx_tienda_countries` VALUES (98,'Iceland','IS','ISL',1,98);
INSERT INTO `l38sx_tienda_countries` VALUES (99,'India','IN','IND',1,99);
INSERT INTO `l38sx_tienda_countries` VALUES (100,'Indonesia','ID','IDN',1,100);
INSERT INTO `l38sx_tienda_countries` VALUES (101,'Iran (Islamic Republic of)','IR','IRN',1,101);
INSERT INTO `l38sx_tienda_countries` VALUES (102,'Iraq','IQ','IRQ',1,102);
INSERT INTO `l38sx_tienda_countries` VALUES (103,'Ireland','IE','IRL',1,103);
INSERT INTO `l38sx_tienda_countries` VALUES (104,'Israel','IL','ISR',1,104);
INSERT INTO `l38sx_tienda_countries` VALUES (105,'Italy','IT','ITA',1,105);
INSERT INTO `l38sx_tienda_countries` VALUES (106,'Jamaica','JM','JAM',1,106);
INSERT INTO `l38sx_tienda_countries` VALUES (107,'Japan','JP','JPN',1,107);
INSERT INTO `l38sx_tienda_countries` VALUES (108,'Jordan','JO','JOR',1,108);
INSERT INTO `l38sx_tienda_countries` VALUES (109,'Kazakhstan','KZ','KAZ',1,109);
INSERT INTO `l38sx_tienda_countries` VALUES (110,'Kenya','KE','KEN',1,110);
INSERT INTO `l38sx_tienda_countries` VALUES (111,'Kiribati','KI','KIR',1,111);
INSERT INTO `l38sx_tienda_countries` VALUES (112,'Korea Democratic People&#039;s Republic Of (North Korea)','KP','PRK',1,112);
INSERT INTO `l38sx_tienda_countries` VALUES (113,'Korea, Republic of','KR','KOR',1,113);
INSERT INTO `l38sx_tienda_countries` VALUES (114,'Kuwait','KW','KWT',1,114);
INSERT INTO `l38sx_tienda_countries` VALUES (115,'Kyrgyzstan','KG','KGZ',1,115);
INSERT INTO `l38sx_tienda_countries` VALUES (116,'Lao People\'s Democratic Republic','LA','LAO',1,116);
INSERT INTO `l38sx_tienda_countries` VALUES (117,'Latvia','LV','LVA',1,117);
INSERT INTO `l38sx_tienda_countries` VALUES (118,'Lebanon','LB','LBN',1,118);
INSERT INTO `l38sx_tienda_countries` VALUES (119,'Lesotho','LS','LSO',1,119);
INSERT INTO `l38sx_tienda_countries` VALUES (120,'Liberia','LR','LBR',1,120);
INSERT INTO `l38sx_tienda_countries` VALUES (121,'Libyan Arab Jamahiriya','LY','LBY',1,121);
INSERT INTO `l38sx_tienda_countries` VALUES (122,'Liechtenstein','LI','LIE',1,122);
INSERT INTO `l38sx_tienda_countries` VALUES (123,'Lithuania','LT','LTU',1,123);
INSERT INTO `l38sx_tienda_countries` VALUES (124,'Luxembourg','LU','LUX',1,124);
INSERT INTO `l38sx_tienda_countries` VALUES (125,'Macau','MO','MAC',1,125);
INSERT INTO `l38sx_tienda_countries` VALUES (126,'Macedonia, The Former Yugoslav Republic of','MK','MKD',1,126);
INSERT INTO `l38sx_tienda_countries` VALUES (127,'Madagascar','MG','MDG',1,127);
INSERT INTO `l38sx_tienda_countries` VALUES (128,'Malawi','MW','MWI',1,128);
INSERT INTO `l38sx_tienda_countries` VALUES (129,'Malaysia','MY','MYS',1,129);
INSERT INTO `l38sx_tienda_countries` VALUES (130,'Maldives','MV','MDV',1,130);
INSERT INTO `l38sx_tienda_countries` VALUES (131,'Mali','ML','MLI',1,131);
INSERT INTO `l38sx_tienda_countries` VALUES (132,'Malta','MT','MLT',1,132);
INSERT INTO `l38sx_tienda_countries` VALUES (133,'Marshall Islands','MH','MHL',1,133);
INSERT INTO `l38sx_tienda_countries` VALUES (134,'Martinique','MQ','MTQ',1,134);
INSERT INTO `l38sx_tienda_countries` VALUES (135,'Mauritania','MR','MRT',1,135);
INSERT INTO `l38sx_tienda_countries` VALUES (136,'Mauritius','MU','MUS',1,136);
INSERT INTO `l38sx_tienda_countries` VALUES (137,'Mayotte','YT','MYT',1,137);
INSERT INTO `l38sx_tienda_countries` VALUES (138,'Mexico','MX','MEX',1,138);
INSERT INTO `l38sx_tienda_countries` VALUES (139,'Micronesia, Federated States of','FM','FSM',1,139);
INSERT INTO `l38sx_tienda_countries` VALUES (140,'Moldova, Republic of','MD','MDA',1,140);
INSERT INTO `l38sx_tienda_countries` VALUES (141,'Monaco','MC','MCO',1,141);
INSERT INTO `l38sx_tienda_countries` VALUES (142,'Mongolia','MN','MNG',1,142);
INSERT INTO `l38sx_tienda_countries` VALUES (143,'Montserrat','MS','MSR',1,144);
INSERT INTO `l38sx_tienda_countries` VALUES (144,'Morocco','MA','MAR',1,145);
INSERT INTO `l38sx_tienda_countries` VALUES (145,'Mozambique','MZ','MOZ',1,146);
INSERT INTO `l38sx_tienda_countries` VALUES (146,'Myanmar','MM','MMR',1,147);
INSERT INTO `l38sx_tienda_countries` VALUES (147,'Namibia','NA','NAM',1,148);
INSERT INTO `l38sx_tienda_countries` VALUES (148,'Nauru','NR','NRU',1,149);
INSERT INTO `l38sx_tienda_countries` VALUES (149,'Nepal','NP','NPL',1,150);
INSERT INTO `l38sx_tienda_countries` VALUES (150,'Netherlands','NL','NLD',1,151);
INSERT INTO `l38sx_tienda_countries` VALUES (151,'Netherlands Antilles','AN','ANT',1,152);
INSERT INTO `l38sx_tienda_countries` VALUES (152,'New Caledonia','NC','NCL',1,153);
INSERT INTO `l38sx_tienda_countries` VALUES (153,'New Zealand','NZ','NZL',1,154);
INSERT INTO `l38sx_tienda_countries` VALUES (154,'Nicaragua','NI','NIC',1,155);
INSERT INTO `l38sx_tienda_countries` VALUES (155,'Niger','NE','NER',1,156);
INSERT INTO `l38sx_tienda_countries` VALUES (156,'Nigeria','NG','NGA',1,157);
INSERT INTO `l38sx_tienda_countries` VALUES (157,'Niue','NU','NIU',1,158);
INSERT INTO `l38sx_tienda_countries` VALUES (158,'Norfolk Island','NF','NFK',1,159);
INSERT INTO `l38sx_tienda_countries` VALUES (159,'Northern Mariana Islands','MP','MNP',1,160);
INSERT INTO `l38sx_tienda_countries` VALUES (160,'Norway','NO','NOR',1,161);
INSERT INTO `l38sx_tienda_countries` VALUES (161,'Oman','OM','OMN',1,162);
INSERT INTO `l38sx_tienda_countries` VALUES (162,'Pakistan','PK','PAK',1,163);
INSERT INTO `l38sx_tienda_countries` VALUES (163,'Palau','PW','PLW',1,164);
INSERT INTO `l38sx_tienda_countries` VALUES (164,'Panama','PA','PAN',1,165);
INSERT INTO `l38sx_tienda_countries` VALUES (165,'Papua New Guinea','PG','PNG',1,166);
INSERT INTO `l38sx_tienda_countries` VALUES (166,'Paraguay','PY','PRY',1,167);
INSERT INTO `l38sx_tienda_countries` VALUES (167,'Peru','PE','PER',1,168);
INSERT INTO `l38sx_tienda_countries` VALUES (168,'Philippines','PH','PHL',1,169);
INSERT INTO `l38sx_tienda_countries` VALUES (169,'Pitcairn','PN','PCN',1,170);
INSERT INTO `l38sx_tienda_countries` VALUES (170,'Poland','PL','POL',1,171);
INSERT INTO `l38sx_tienda_countries` VALUES (171,'Portugal','PT','PRT',1,172);
INSERT INTO `l38sx_tienda_countries` VALUES (172,'Puerto Rico','PR','PRI',1,173);
INSERT INTO `l38sx_tienda_countries` VALUES (173,'Qatar','QA','QAT',1,174);
INSERT INTO `l38sx_tienda_countries` VALUES (174,'Reunion','RE','REU',1,175);
INSERT INTO `l38sx_tienda_countries` VALUES (175,'Romania','RO','ROM',1,176);
INSERT INTO `l38sx_tienda_countries` VALUES (176,'Russian Federation','RU','RUS',1,177);
INSERT INTO `l38sx_tienda_countries` VALUES (177,'Rwanda','RW','RWA',1,178);
INSERT INTO `l38sx_tienda_countries` VALUES (178,'Saint Kitts and Nevis','KN','KNA',1,179);
INSERT INTO `l38sx_tienda_countries` VALUES (179,'Saint Lucia','LC','LCA',1,180);
INSERT INTO `l38sx_tienda_countries` VALUES (180,'Saint Vincent and the Grenadines','VC','VCT',1,181);
INSERT INTO `l38sx_tienda_countries` VALUES (181,'Samoa','WS','WSM',1,182);
INSERT INTO `l38sx_tienda_countries` VALUES (182,'San Marino','SM','SMR',1,183);
INSERT INTO `l38sx_tienda_countries` VALUES (183,'Sao Tome and Principe','ST','STP',1,184);
INSERT INTO `l38sx_tienda_countries` VALUES (184,'Saudi Arabia','SA','SAU',1,185);
INSERT INTO `l38sx_tienda_countries` VALUES (185,'Senegal','SN','SEN',1,186);
INSERT INTO `l38sx_tienda_countries` VALUES (186,'Seychelles','SC','SYC',1,188);
INSERT INTO `l38sx_tienda_countries` VALUES (187,'Sierra Leone','SL','SLE',1,189);
INSERT INTO `l38sx_tienda_countries` VALUES (188,'Singapore','SG','SGP',1,190);
INSERT INTO `l38sx_tienda_countries` VALUES (189,'Slovakia (Slovak Republic)','SK','SVK',1,191);
INSERT INTO `l38sx_tienda_countries` VALUES (190,'Slovenia','SI','SVN',1,192);
INSERT INTO `l38sx_tienda_countries` VALUES (191,'Solomon Islands','SB','SLB',1,193);
INSERT INTO `l38sx_tienda_countries` VALUES (192,'Somalia','SO','SOM',1,194);
INSERT INTO `l38sx_tienda_countries` VALUES (193,'South Africa','ZA','ZAF',1,195);
INSERT INTO `l38sx_tienda_countries` VALUES (194,'South Georgia and the South Sandwich Islands','GS','SGS',1,196);
INSERT INTO `l38sx_tienda_countries` VALUES (195,'Spain','ES','ESP',1,197);
INSERT INTO `l38sx_tienda_countries` VALUES (196,'Sri Lanka','LK','LKA',1,198);
INSERT INTO `l38sx_tienda_countries` VALUES (197,'St. Helena','SH','SHN',1,199);
INSERT INTO `l38sx_tienda_countries` VALUES (198,'St. Pierre and Miquelon','PM','SPM',1,200);
INSERT INTO `l38sx_tienda_countries` VALUES (199,'Sudan','SD','SDN',1,201);
INSERT INTO `l38sx_tienda_countries` VALUES (200,'Suriname','SR','SUR',1,202);
INSERT INTO `l38sx_tienda_countries` VALUES (201,'Svalbard and Jan Mayen Islands','SJ','SJM',1,203);
INSERT INTO `l38sx_tienda_countries` VALUES (202,'Swaziland','SZ','SWZ',1,204);
INSERT INTO `l38sx_tienda_countries` VALUES (203,'Sweden','SE','SWE',1,205);
INSERT INTO `l38sx_tienda_countries` VALUES (204,'Switzerland','CH','CHE',1,206);
INSERT INTO `l38sx_tienda_countries` VALUES (205,'Syrian Arab Republic','SY','SYR',1,207);
INSERT INTO `l38sx_tienda_countries` VALUES (206,'Taiwan','TW','TWN',1,208);
INSERT INTO `l38sx_tienda_countries` VALUES (207,'Tajikistan','TJ','TJK',1,209);
INSERT INTO `l38sx_tienda_countries` VALUES (208,'Tanzania, United Republic of','TZ','TZA',1,210);
INSERT INTO `l38sx_tienda_countries` VALUES (209,'Thailand','TH','THA',1,211);
INSERT INTO `l38sx_tienda_countries` VALUES (210,'Togo','TG','TGO',1,212);
INSERT INTO `l38sx_tienda_countries` VALUES (211,'Tokelau','TK','TKL',1,213);
INSERT INTO `l38sx_tienda_countries` VALUES (212,'Tonga','TO','TON',1,214);
INSERT INTO `l38sx_tienda_countries` VALUES (213,'Trinidad and Tobago','TT','TTO',1,215);
INSERT INTO `l38sx_tienda_countries` VALUES (214,'Tunisia','TN','TUN',1,216);
INSERT INTO `l38sx_tienda_countries` VALUES (215,'Turkey','TR','TUR',1,217);
INSERT INTO `l38sx_tienda_countries` VALUES (216,'Turkmenistan','TM','TKM',1,218);
INSERT INTO `l38sx_tienda_countries` VALUES (217,'Turks and Caicos Islands','TC','TCA',1,219);
INSERT INTO `l38sx_tienda_countries` VALUES (218,'Tuvalu','TV','TUV',1,220);
INSERT INTO `l38sx_tienda_countries` VALUES (219,'Uganda','UG','UGA',1,221);
INSERT INTO `l38sx_tienda_countries` VALUES (220,'Ukraine','UA','UKR',1,222);
INSERT INTO `l38sx_tienda_countries` VALUES (221,'United Arab Emirates','AE','ARE',1,223);
INSERT INTO `l38sx_tienda_countries` VALUES (222,'United Kingdom','GB','GBR',1,224);
INSERT INTO `l38sx_tienda_countries` VALUES (223,'United States','US','USA',1,225);
INSERT INTO `l38sx_tienda_countries` VALUES (224,'United States Minor Outlying Islands','UM','UMI',1,226);
INSERT INTO `l38sx_tienda_countries` VALUES (225,'Uruguay','UY','URY',1,227);
INSERT INTO `l38sx_tienda_countries` VALUES (226,'Uzbekistan','UZ','UZB',1,228);
INSERT INTO `l38sx_tienda_countries` VALUES (227,'Vanuatu','VU','VUT',1,229);
INSERT INTO `l38sx_tienda_countries` VALUES (228,'Vatican City State (Holy See)','VA','VAT',1,230);
INSERT INTO `l38sx_tienda_countries` VALUES (229,'Venezuela','VE','VEN',1,231);
INSERT INTO `l38sx_tienda_countries` VALUES (230,'Viet Nam','VN','VNM',1,232);
INSERT INTO `l38sx_tienda_countries` VALUES (231,'Virgin Islands (British)','VG','VGB',1,233);
INSERT INTO `l38sx_tienda_countries` VALUES (232,'Virgin Islands (U.S.)','VI','VIR',1,234);
INSERT INTO `l38sx_tienda_countries` VALUES (233,'Wallis and Futuna Islands','WF','WLF',1,235);
INSERT INTO `l38sx_tienda_countries` VALUES (234,'Western Sahara','EH','ESH',1,236);
INSERT INTO `l38sx_tienda_countries` VALUES (235,'Yemen','YE','YEM',1,237);
INSERT INTO `l38sx_tienda_countries` VALUES (237,'Zaire','ZR','ZAR',1,238);
INSERT INTO `l38sx_tienda_countries` VALUES (238,'Zambia','ZM','ZMB',1,239);
INSERT INTO `l38sx_tienda_countries` VALUES (239,'Zimbabwe','ZW','ZWE',1,240);
INSERT INTO `l38sx_tienda_countries` VALUES (240,'Serbia','RS','SRB',1,187);
INSERT INTO `l38sx_tienda_countries` VALUES (241,'Montenegro','ME','MNE',1,143);
INSERT INTO `l38sx_tienda_countries` VALUES (9999,'Dummy Country','!!','!!!',1,241);
/*!40000 ALTER TABLE `l38sx_tienda_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_coupons`
--

DROP TABLE IF EXISTS `l38sx_tienda_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_coupons` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_name` varchar(64) DEFAULT NULL,
  `coupon_code` varchar(64) DEFAULT NULL,
  `coupon_type` tinyint(1) NOT NULL COMMENT '0=Per Order, 1=Per Product',
  `coupon_group` varchar(32) NOT NULL COMMENT 'price, tax, shipping',
  `coupon_automatic` tinyint(1) NOT NULL COMMENT '0=User-Submitted, 1=Automatic',
  `coupon_value` decimal(12,5) DEFAULT NULL,
  `coupon_value_type` tinyint(1) NOT NULL COMMENT '0=Flat-rate, 1=Percentage',
  `currency_id` int(11) DEFAULT NULL,
  `coupon_description` text,
  `coupon_params` text NOT NULL,
  `created_date` datetime NOT NULL COMMENT 'GMT Only',
  `modified_date` datetime NOT NULL COMMENT 'GMT Only',
  `start_date` datetime NOT NULL COMMENT 'GMT Only',
  `expiration_date` datetime DEFAULT NULL COMMENT 'GMT Only',
  `coupon_enabled` tinyint(1) NOT NULL,
  `coupon_uses` int(11) NOT NULL COMMENT 'Running count of the number of uses of this coupon',
  `coupon_max_uses` int(11) NOT NULL DEFAULT '-1' COMMENT '-1=Infinite',
  `coupon_max_uses_per_user` int(11) NOT NULL DEFAULT '-1' COMMENT '-1=Infinite',
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_coupons`
--

LOCK TABLES `l38sx_tienda_coupons` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_credits`
--

DROP TABLE IF EXISTS `l38sx_tienda_credits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_credits` (
  `credit_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT 'if this credit is related to an order',
  `currency_id` int(11) NOT NULL,
  `credit_code` varchar(45) DEFAULT NULL,
  `credittype_code` varchar(255) NOT NULL,
  `credit_enabled` tinyint(1) DEFAULT NULL,
  `credit_withdrawable` tinyint(1) DEFAULT NULL,
  `credit_amount` decimal(12,5) NOT NULL COMMENT 'can be negative',
  `credit_balance_before` decimal(12,5) DEFAULT NULL,
  `credit_balance_after` decimal(12,5) DEFAULT NULL,
  `withdrawable_balance_before` decimal(12,5) DEFAULT NULL,
  `withdrawable_balance_after` decimal(12,5) DEFAULT NULL,
  `credit_comments` text,
  `created_date` datetime NOT NULL COMMENT 'GMT Only',
  `modified_date` datetime NOT NULL COMMENT 'GMT Only',
  `expiration_date` datetime DEFAULT NULL COMMENT 'GMT Only',
  `credits_updated` tinyint(1) DEFAULT NULL COMMENT 'Were the users credit totals updated by this credit?',
  PRIMARY KEY (`credit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_credits`
--

LOCK TABLES `l38sx_tienda_credits` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_credits` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_credits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_credittypes`
--

DROP TABLE IF EXISTS `l38sx_tienda_credittypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_credittypes` (
  `credittype_id` int(11) NOT NULL AUTO_INCREMENT,
  `credittype_code` varchar(255) NOT NULL,
  `credittype_name` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`credittype_id`),
  UNIQUE KEY `credittype_code` (`credittype_code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_credittypes`
--

LOCK TABLES `l38sx_tienda_credittypes` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_credittypes` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_credittypes` VALUES (1,'refund','Refund',NULL,NULL);
INSERT INTO `l38sx_tienda_credittypes` VALUES (2,'coupon','Coupon',NULL,NULL);
INSERT INTO `l38sx_tienda_credittypes` VALUES (3,'giftcard','Gift Card',NULL,NULL);
INSERT INTO `l38sx_tienda_credittypes` VALUES (4,'vendorcredit','Vendor Credit',NULL,NULL);
INSERT INTO `l38sx_tienda_credittypes` VALUES (5,'usage','Usage History',NULL,NULL);
INSERT INTO `l38sx_tienda_credittypes` VALUES (6,'credit','Other Credit',NULL,NULL);
/*!40000 ALTER TABLE `l38sx_tienda_credittypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_currencies`
--

DROP TABLE IF EXISTS `l38sx_tienda_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_currencies` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_name` varchar(64) DEFAULT NULL,
  `currency_code` char(3) DEFAULT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `currency_decimals` tinyint(1) NOT NULL DEFAULT '2',
  `decimal_separator` varchar(1) NOT NULL DEFAULT '.',
  `thousands_separator` varchar(1) NOT NULL DEFAULT ',',
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `currency_enabled` tinyint(1) NOT NULL,
  `exchange_rate` decimal(15,8) NOT NULL DEFAULT '0.00000000' COMMENT 'Value of currency in USD',
  `updated_date` datetime NOT NULL COMMENT 'The last time the currency was updated',
  PRIMARY KEY (`currency_id`),
  KEY `idx_currency_name` (`currency_name`),
  KEY `idx_currency_code` (`currency_code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_currencies`
--

LOCK TABLES `l38sx_tienda_currencies` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_currencies` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_currencies` VALUES (1,'US Dollar','USD','$','',2,'.',',','2012-10-22 21:40:43','2012-10-22 21:40:43',1,0.00000000,'0000-00-00 00:00:00');
INSERT INTO `l38sx_tienda_currencies` VALUES (2,'Japanese Yen','JPY','¥','',3,'.',',','2012-10-22 21:40:43','2012-10-22 21:40:43',1,0.00000000,'0000-00-00 00:00:00');
INSERT INTO `l38sx_tienda_currencies` VALUES (3,'Euro','EUR','€','',2,'.',',','2012-10-22 21:40:43','2012-10-22 21:40:43',1,0.00000000,'0000-00-00 00:00:00');
INSERT INTO `l38sx_tienda_currencies` VALUES (4,'British Pound','GBP','£','',2,'.',',','2012-10-22 21:40:43','2012-10-22 21:40:43',1,0.00000000,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `l38sx_tienda_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_eavattributeentityxref`
--

DROP TABLE IF EXISTS `l38sx_tienda_eavattributeentityxref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_eavattributeentityxref` (
  `eavattribute_id` int(11) NOT NULL,
  `eaventity_id` int(11) NOT NULL,
  `eaventity_type` varchar(255) NOT NULL COMMENT 'For example: if eavattribute is for products, this could be product, category, etc',
  KEY `fk_EavAttribute_EavAttributes` (`eavattribute_id`),
  KEY `fk_entity_entities` (`eaventity_id`),
  CONSTRAINT `fk_EavAttribute_EavAttributes` FOREIGN KEY (`eavattribute_id`) REFERENCES `l38sx_tienda_eavattributes` (`eavattribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_eavattributeentityxref`
--

LOCK TABLES `l38sx_tienda_eavattributeentityxref` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_eavattributeentityxref` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_eavattributeentityxref` VALUES (1,1,'products');
INSERT INTO `l38sx_tienda_eavattributeentityxref` VALUES (1,2,'products');
/*!40000 ALTER TABLE `l38sx_tienda_eavattributeentityxref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_eavattributeoptions`
--

DROP TABLE IF EXISTS `l38sx_tienda_eavattributeoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_eavattributeoptions` (
  `eavattributeoption_id` int(11) NOT NULL AUTO_INCREMENT,
  `eavattribute_id` int(11) NOT NULL COMMENT 'FK to eavattributes',
  `eavattributeoption_label` varchar(255) NOT NULL,
  `eavattributeoption_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`eavattributeoption_id`),
  KEY `eavattribute_id` (`eavattribute_id`),
  CONSTRAINT `fk_eavattributeoptions_eavattribute` FOREIGN KEY (`eavattribute_id`) REFERENCES `l38sx_tienda_eavattributes` (`eavattribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_eavattributeoptions`
--

LOCK TABLES `l38sx_tienda_eavattributeoptions` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_eavattributeoptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_eavattributeoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_eavattributes`
--

DROP TABLE IF EXISTS `l38sx_tienda_eavattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_eavattributes` (
  `eavattribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `eaventity_type` varchar(255) NOT NULL COMMENT 'Suffix of the Table we are extending',
  `eaventity_id` int(11) NOT NULL COMMENT 'PK of the entity we are extending',
  `eavattribute_type` varchar(255) NOT NULL COMMENT 'type of the variable (int, varchar, etc)',
  `enum_type` varchar(255) NOT NULL COMMENT 'If it is a list, what type of list',
  `is_multiple` tinyint(1) NOT NULL COMMENT 'If it is a list, are multiple choices allowed?',
  `ordering` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `editable_by` tinyint(1) NOT NULL,
  `eavattribute_required` tinyint(1) NOT NULL,
  `eavattribute_label` varchar(255) NOT NULL,
  `eavattribute_alias` varchar(255) NOT NULL,
  PRIMARY KEY (`eavattribute_id`),
  KEY `eaventity_id` (`eaventity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_eavattributes`
--

LOCK TABLES `l38sx_tienda_eavattributes` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_eavattributes` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_eavattributes` VALUES (1,'products',0,'int','',0,1,'0000-00-00 00:00:00','0000-00-00 00:00:00',1,1,1,'Funding Goal','fundinggoal');
/*!40000 ALTER TABLE `l38sx_tienda_eavattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_eavvaluesdatetime`
--

DROP TABLE IF EXISTS `l38sx_tienda_eavvaluesdatetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_eavvaluesdatetime` (
  `eavvalue_id` int(11) NOT NULL AUTO_INCREMENT,
  `eavattribute_id` int(11) NOT NULL,
  `eaventity_type` varchar(255) NOT NULL COMMENT 'table name of the entity',
  `eaventity_id` int(11) NOT NULL,
  `eavvalue_value` datetime NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`eavvalue_id`),
  KEY `eavattribute_id` (`eavattribute_id`,`eaventity_id`),
  CONSTRAINT `fk_eavvaluesdatetime_eavattribute` FOREIGN KEY (`eavattribute_id`) REFERENCES `l38sx_tienda_eavattributes` (`eavattribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_eavvaluesdatetime`
--

LOCK TABLES `l38sx_tienda_eavvaluesdatetime` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_eavvaluesdatetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_eavvaluesdatetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_eavvaluesdecimal`
--

DROP TABLE IF EXISTS `l38sx_tienda_eavvaluesdecimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_eavvaluesdecimal` (
  `eavvalue_id` int(11) NOT NULL AUTO_INCREMENT,
  `eavattribute_id` int(11) NOT NULL,
  `eaventity_type` varchar(255) NOT NULL COMMENT 'table name of the entity',
  `eaventity_id` int(11) NOT NULL,
  `eavvalue_value` decimal(10,2) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`eavvalue_id`),
  KEY `eavattribute_id` (`eavattribute_id`,`eaventity_id`),
  CONSTRAINT `fk_eavvaluesdecimal_eavattribute` FOREIGN KEY (`eavattribute_id`) REFERENCES `l38sx_tienda_eavattributes` (`eavattribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_eavvaluesdecimal`
--

LOCK TABLES `l38sx_tienda_eavvaluesdecimal` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_eavvaluesdecimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_eavvaluesdecimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_eavvaluesint`
--

DROP TABLE IF EXISTS `l38sx_tienda_eavvaluesint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_eavvaluesint` (
  `eavvalue_id` int(11) NOT NULL AUTO_INCREMENT,
  `eavattribute_id` int(11) NOT NULL,
  `eaventity_type` varchar(255) NOT NULL COMMENT 'table name of the entity',
  `eaventity_id` int(11) NOT NULL,
  `eavvalue_value` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`eavvalue_id`),
  KEY `eavattribute_id` (`eavattribute_id`,`eaventity_id`),
  CONSTRAINT `fk_eavvaluesint_eavattribute` FOREIGN KEY (`eavattribute_id`) REFERENCES `l38sx_tienda_eavattributes` (`eavattribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_eavvaluesint`
--

LOCK TABLES `l38sx_tienda_eavvaluesint` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_eavvaluesint` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_eavvaluesint` VALUES (1,1,'products',1,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `l38sx_tienda_eavvaluesint` VALUES (2,1,'products',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
INSERT INTO `l38sx_tienda_eavvaluesint` VALUES (3,1,'products',2,0,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `l38sx_tienda_eavvaluesint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_eavvaluestext`
--

DROP TABLE IF EXISTS `l38sx_tienda_eavvaluestext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_eavvaluestext` (
  `eavvalue_id` int(11) NOT NULL AUTO_INCREMENT,
  `eavattribute_id` int(11) NOT NULL,
  `eaventity_type` varchar(255) NOT NULL COMMENT 'table name of the entity',
  `eaventity_id` int(11) NOT NULL,
  `eavvalue_value` text NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`eavvalue_id`),
  KEY `eavattribute_id` (`eavattribute_id`,`eaventity_id`),
  CONSTRAINT `fk_eavvaluestext_eavattribute` FOREIGN KEY (`eavattribute_id`) REFERENCES `l38sx_tienda_eavattributes` (`eavattribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_eavvaluestext`
--

LOCK TABLES `l38sx_tienda_eavvaluestext` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_eavvaluestext` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_eavvaluestext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_eavvaluesvarchar`
--

DROP TABLE IF EXISTS `l38sx_tienda_eavvaluesvarchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_eavvaluesvarchar` (
  `eavvalue_id` int(11) NOT NULL AUTO_INCREMENT,
  `eavattribute_id` int(11) NOT NULL,
  `eaventity_type` varchar(255) NOT NULL COMMENT 'table name of the entity',
  `eaventity_id` int(11) NOT NULL,
  `eavvalue_value` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`eavvalue_id`),
  KEY `eavattribute_id` (`eavattribute_id`,`eaventity_id`),
  CONSTRAINT `fk_eavvaluesvarchar_eavattribute` FOREIGN KEY (`eavattribute_id`) REFERENCES `l38sx_tienda_eavattributes` (`eavattribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_eavvaluesvarchar`
--

LOCK TABLES `l38sx_tienda_eavvaluesvarchar` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_eavvaluesvarchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_eavvaluesvarchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_geozones`
--

DROP TABLE IF EXISTS `l38sx_tienda_geozones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_geozones` (
  `geozone_id` int(11) NOT NULL AUTO_INCREMENT,
  `geozone_name` varchar(32) NOT NULL DEFAULT '',
  `geozone_description` text,
  `geozonetype_id` int(11) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`geozone_id`),
  KEY `fk_geozonetype` (`geozonetype_id`),
  CONSTRAINT `fk_geozonetype` FOREIGN KEY (`geozonetype_id`) REFERENCES `l38sx_tienda_geozonetypes` (`geozonetype_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_geozones`
--

LOCK TABLES `l38sx_tienda_geozones` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_geozones` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_geozones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_geozonetypes`
--

DROP TABLE IF EXISTS `l38sx_tienda_geozonetypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_geozonetypes` (
  `geozonetype_id` int(11) NOT NULL AUTO_INCREMENT,
  `geozonetype_name` varchar(32) NOT NULL DEFAULT '',
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`geozonetype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_geozonetypes`
--

LOCK TABLES `l38sx_tienda_geozonetypes` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_geozonetypes` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_geozonetypes` VALUES (1,'Tax Zones','2012-10-22 21:40:43','2012-10-22 21:40:43');
INSERT INTO `l38sx_tienda_geozonetypes` VALUES (2,'Shipping Zones','2012-10-22 21:40:43','2012-10-22 21:40:43');
/*!40000 ALTER TABLE `l38sx_tienda_geozonetypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_groups`
--

DROP TABLE IF EXISTS `l38sx_tienda_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_groups` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `group_description` text NOT NULL,
  `ordering` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_groups`
--

LOCK TABLES `l38sx_tienda_groups` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_groups` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_groups` VALUES (1,'Default','<p>Default</p>',0,'2010-09-19 10:27:00','2010-09-19 10:27:03');
/*!40000 ALTER TABLE `l38sx_tienda_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_manufacturers`
--

DROP TABLE IF EXISTS `l38sx_tienda_manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_manufacturers` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturer_name` varchar(255) NOT NULL,
  `manufacturer_image` varchar(255) NOT NULL,
  `manufacturer_enabled` tinyint(1) NOT NULL,
  `created_date` datetime NOT NULL COMMENT 'GMT',
  `modified_date` datetime NOT NULL COMMENT 'GMT',
  `manufacturer_description` text,
  `manufacturer_params` text,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_manufacturers`
--

LOCK TABLES `l38sx_tienda_manufacturers` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_manufacturers` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_ordercoupons`
--

DROP TABLE IF EXISTS `l38sx_tienda_ordercoupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_ordercoupons` (
  `ordercoupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `ordercoupon_name` varchar(64) DEFAULT NULL,
  `ordercoupon_code` varchar(64) DEFAULT NULL,
  `ordercoupon_type` tinyint(1) NOT NULL COMMENT '0=Per Order, 1=Per Product',
  `ordercoupon_group` varchar(32) NOT NULL COMMENT 'price, tax, shipping',
  `ordercoupon_automatic` tinyint(1) NOT NULL COMMENT '0=User-Submitted, 1=Automatic',
  `ordercoupon_value` decimal(12,5) DEFAULT NULL COMMENT 'The coupon face value',
  `ordercoupon_value_type` tinyint(1) NOT NULL COMMENT '0=Flat-rate, 1=Percentage',
  `ordercoupon_amount` decimal(12,5) NOT NULL COMMENT 'The total discount amount of this coupon',
  PRIMARY KEY (`ordercoupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_ordercoupons`
--

LOCK TABLES `l38sx_tienda_ordercoupons` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_ordercoupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_ordercoupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_orderhistory`
--

DROP TABLE IF EXISTS `l38sx_tienda_orderhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_orderhistory` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `order_state_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `notify_customer` int(1) DEFAULT '0',
  `comments` text,
  PRIMARY KEY (`order_history_id`),
  KEY `fk_OrderState_OrderHistory` (`order_state_id`),
  KEY `fk_Orders_OrderHistory` (`order_id`),
  CONSTRAINT `fk_OrderState_OrderHistory` FOREIGN KEY (`order_state_id`) REFERENCES `l38sx_tienda_orderstates` (`order_state_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_Orders_OrderHistory` FOREIGN KEY (`order_id`) REFERENCES `l38sx_tienda_orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_orderhistory`
--

LOCK TABLES `l38sx_tienda_orderhistory` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_orderhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_orderhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_orderinfo`
--

DROP TABLE IF EXISTS `l38sx_tienda_orderinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_orderinfo` (
  `orderinfo_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `billing_company` varchar(64) DEFAULT NULL,
  `billing_last_name` varchar(32) DEFAULT NULL,
  `billing_first_name` varchar(32) DEFAULT NULL,
  `billing_middle_name` varchar(32) DEFAULT NULL,
  `billing_phone_1` varchar(32) DEFAULT NULL,
  `billing_phone_2` varchar(32) DEFAULT NULL,
  `billing_fax` varchar(32) DEFAULT NULL,
  `billing_address_1` varchar(64) NOT NULL DEFAULT '',
  `billing_address_2` varchar(64) DEFAULT NULL,
  `billing_city` varchar(32) NOT NULL DEFAULT '',
  `billing_zone_name` varchar(32) NOT NULL DEFAULT '',
  `billing_country_name` varchar(64) NOT NULL DEFAULT '',
  `billing_zone_id` int(11) NOT NULL DEFAULT '0',
  `billing_country_id` int(11) NOT NULL DEFAULT '0',
  `billing_postal_code` varchar(32) NOT NULL DEFAULT '',
  `billing_tax_number` varchar(32) DEFAULT NULL,
  `shipping_company` varchar(64) DEFAULT NULL,
  `shipping_last_name` varchar(32) DEFAULT NULL,
  `shipping_first_name` varchar(32) DEFAULT NULL,
  `shipping_middle_name` varchar(32) DEFAULT NULL,
  `shipping_phone_1` varchar(32) DEFAULT NULL,
  `shipping_phone_2` varchar(32) DEFAULT NULL,
  `shipping_fax` varchar(32) DEFAULT NULL,
  `shipping_address_1` varchar(64) NOT NULL DEFAULT '',
  `shipping_address_2` varchar(64) DEFAULT NULL,
  `shipping_city` varchar(32) NOT NULL DEFAULT '',
  `shipping_zone_name` varchar(32) NOT NULL DEFAULT '',
  `shipping_country_name` varchar(64) NOT NULL DEFAULT '',
  `shipping_zone_id` int(11) NOT NULL DEFAULT '0',
  `shipping_country_id` int(11) NOT NULL DEFAULT '0',
  `shipping_postal_code` varchar(32) NOT NULL DEFAULT '',
  `shipping_tax_number` varchar(32) DEFAULT NULL,
  `user_email` varchar(255) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orderinfo_id`),
  KEY `idx_orderinfo_order_id` (`order_id`),
  KEY `fk_Orders_OrderInfo` (`order_id`),
  CONSTRAINT `fk_Orders_OrderInfo` FOREIGN KEY (`order_id`) REFERENCES `l38sx_tienda_orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_orderinfo`
--

LOCK TABLES `l38sx_tienda_orderinfo` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_orderinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_orderinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_orderitemattributes`
--

DROP TABLE IF EXISTS `l38sx_tienda_orderitemattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_orderitemattributes` (
  `orderitemattribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `orderitem_id` int(11) NOT NULL,
  `productattributeoption_id` int(11) NOT NULL,
  `orderitemattribute_name` varchar(255) NOT NULL,
  `orderitemattribute_price` decimal(12,5) NOT NULL,
  `orderitemattribute_code` varchar(255) NOT NULL,
  `orderitemattribute_prefix` varchar(1) NOT NULL,
  `orderitemattribute_prefix_weight` decimal(12,5) NOT NULL DEFAULT '0.00000',
  `orderitemattribute_weight` varchar(1) NOT NULL DEFAULT '+',
  PRIMARY KEY (`orderitemattribute_id`),
  KEY `productattribute_id` (`productattributeoption_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_orderitemattributes`
--

LOCK TABLES `l38sx_tienda_orderitemattributes` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_orderitemattributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_orderitemattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_orderitems`
--

DROP TABLE IF EXISTS `l38sx_tienda_orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_orderitems` (
  `orderitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `orderitem_attributes` text NOT NULL COMMENT 'A CSV of productattributeoption_id values, always in numerical order',
  `orderitem_attribute_names` text NOT NULL COMMENT 'A CSV of productattributeoption_name values',
  `orderitem_sku` varchar(64) NOT NULL DEFAULT '',
  `orderitem_name` varchar(64) NOT NULL DEFAULT '',
  `orderitem_quantity` int(11) DEFAULT NULL,
  `orderitem_price` decimal(15,5) NOT NULL DEFAULT '0.00000' COMMENT 'Base price of the item',
  `orderitem_attributes_price` varchar(64) NOT NULL COMMENT 'The increase or decrease in price per item as a result of attributes. Includes + or - sign',
  `orderitem_discount` decimal(15,5) NOT NULL DEFAULT '0.00000' COMMENT 'Coupon discount applied to each item',
  `orderitem_final_price` decimal(15,5) NOT NULL DEFAULT '0.00000' COMMENT 'Price of item inclusive of quantity, attributes, tax, and shipping',
  `orderitem_tax` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `orderitem_shipping` decimal(12,5) NOT NULL DEFAULT '0.00000',
  `orderitem_shipping_tax` decimal(12,5) NOT NULL DEFAULT '0.00000',
  `orderitem_status` char(1) DEFAULT NULL,
  `orderitem_attributes_weight` decimal(12,5) DEFAULT NULL,
  `orderitem_weight` varchar(64) NOT NULL,
  `modified_date` datetime NOT NULL COMMENT 'GMT',
  `orderitem_recurs` tinyint(1) NOT NULL COMMENT 'Do any payments for this orderitem recur?',
  `recurring_price` decimal(15,5) NOT NULL DEFAULT '0.00000' COMMENT 'Recurring price of the item',
  `recurring_payments` int(11) NOT NULL COMMENT 'How many recurring payments?',
  `recurring_period_interval` int(3) NOT NULL COMMENT 'How many period-units between payments?',
  `recurring_period_unit` varchar(1) NOT NULL COMMENT 'D, W, M, Y = Day, Week, Month, Year',
  `recurring_trial` tinyint(1) NOT NULL COMMENT 'Is there a trial period?',
  `recurring_trial_period_interval` int(3) NOT NULL COMMENT 'How many trial-period-units before payments begin?',
  `recurring_trial_period_unit` varchar(1) NOT NULL COMMENT 'D, W, M, Y = Day, Week, Month, Year',
  `recurring_trial_price` decimal(12,5) NOT NULL COMMENT 'Cost of trial period',
  `subscription_prorated` tinyint(1) NOT NULL DEFAULT '0',
  `orderitem_subscription` tinyint(1) NOT NULL COMMENT 'Orderitem creates a subscription?',
  `subscription_lifetime` tinyint(1) NOT NULL COMMENT 'Lifetime subscription?',
  `subscription_period_interval` int(3) NOT NULL COMMENT 'How many period-units does the subscription last?',
  `subscription_period_unit` varchar(1) NOT NULL COMMENT 'D, W, M, Y = Day, Week, Month, Year',
  `orderitem_params` text COMMENT 'Params for the orderitem',
  PRIMARY KEY (`orderitem_id`),
  KEY `idx_order_item_order_id` (`order_id`),
  KEY `idx_order_item_vendor_id` (`vendor_id`),
  KEY `fk_Order_OrderItem` (`order_id`),
  KEY `fk_Product_OrderItem` (`product_id`),
  CONSTRAINT `fk_Order_OrderItem` FOREIGN KEY (`order_id`) REFERENCES `l38sx_tienda_orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Product_OrderItem` FOREIGN KEY (`product_id`) REFERENCES `l38sx_tienda_products` (`product_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_orderitems`
--

LOCK TABLES `l38sx_tienda_orderitems` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_orderitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_orderpayments`
--

DROP TABLE IF EXISTS `l38sx_tienda_orderpayments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_orderpayments` (
  `orderpayment_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `orderpayment_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'Element name of payment plugin',
  `orderpayment_amount` decimal(15,5) DEFAULT '0.00000',
  `transaction_id` varchar(255) NOT NULL DEFAULT '',
  `transaction_status` varchar(255) NOT NULL DEFAULT '',
  `transaction_details` text NOT NULL,
  `created_date` datetime NOT NULL COMMENT 'GMT',
  PRIMARY KEY (`orderpayment_id`),
  KEY `idx_order_payment_order_id` (`order_id`),
  KEY `fk_Orders_OrderPayment` (`order_id`),
  CONSTRAINT `fk_Orders_OrderPayment` FOREIGN KEY (`order_id`) REFERENCES `l38sx_tienda_orders` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_orderpayments`
--

LOCK TABLES `l38sx_tienda_orderpayments` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_orderpayments` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_orderpayments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_orders`
--

DROP TABLE IF EXISTS `l38sx_tienda_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `shipping_method_id` int(11) NOT NULL DEFAULT '0',
  `order_number` varchar(255) DEFAULT '' COMMENT 'The Invoice Number that Can be Set by Admins',
  `order_total` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `order_subtotal` decimal(15,5) DEFAULT '0.00000',
  `order_tax` decimal(10,2) DEFAULT '0.00',
  `order_shipping` decimal(10,2) DEFAULT '0.00',
  `order_shipping_tax` decimal(10,2) DEFAULT '0.00',
  `order_discount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `order_credit` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT 'Stores the sum of all credits applied to this order',
  `order_currency` text NOT NULL COMMENT 'Stores a DSCParameter formatted version of the current currency. Used to maintain the order integrity',
  `currency_id` int(11) DEFAULT NULL,
  `order_state_id` int(11) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL COMMENT 'GMT',
  `modified_date` datetime DEFAULT NULL COMMENT 'GMT',
  `customer_note` text NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `order_ships` tinyint(1) NOT NULL COMMENT 'Does this order require shipping?',
  `order_recurs` tinyint(1) NOT NULL COMMENT 'Does any amount from this order recur?',
  `recurring_amount` decimal(12,5) NOT NULL COMMENT 'The amount of the recurring charge',
  `recurring_payments` int(11) NOT NULL COMMENT 'How many recurring payments?',
  `recurring_period_interval` int(3) NOT NULL COMMENT 'How many period-units between payments?',
  `recurring_period_unit` varchar(1) NOT NULL COMMENT 'D, W, M, Y = Day, Week, Month, Year',
  `recurring_trial` tinyint(1) NOT NULL COMMENT 'Is there a trial period?',
  `recurring_trial_period_interval` int(3) NOT NULL COMMENT 'How many trial-period-units before regular payments begin?',
  `recurring_trial_period_unit` varchar(1) NOT NULL COMMENT 'D, W, M, Y = Day, Week, Month, Year',
  `recurring_trial_price` decimal(12,5) NOT NULL COMMENT 'Cost of trial period',
  `completed_tasks` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Were the OrderCompleted tasks executed?',
  `quantities_updated` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Were the Product Quantities updated?',
  `order_hash` varchar(40) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `idx_orders_user_id` (`user_id`),
  KEY `idx_orders_order_hash` (`order_hash`),
  KEY `fk_OrderState_Order` (`order_state_id`),
  KEY `fk_currencies_orders` (`currency_id`),
  CONSTRAINT `fk_OrderState_Order` FOREIGN KEY (`order_state_id`) REFERENCES `l38sx_tienda_orderstates` (`order_state_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_currencies_orders` FOREIGN KEY (`currency_id`) REFERENCES `l38sx_tienda_currencies` (`currency_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_orders`
--

LOCK TABLES `l38sx_tienda_orders` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_ordershippings`
--

DROP TABLE IF EXISTS `l38sx_tienda_ordershippings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_ordershippings` (
  `ordershipping_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `ordershipping_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'Element name of shipping plugin',
  `ordershipping_price` decimal(15,5) DEFAULT '0.00000',
  `ordershipping_name` varchar(255) NOT NULL DEFAULT '',
  `ordershipping_code` varchar(255) NOT NULL DEFAULT '',
  `ordershipping_tax` decimal(15,5) DEFAULT '0.00000',
  `ordershipping_extra` decimal(15,5) DEFAULT '0.00000',
  `ordershipping_tracking_id` mediumtext NOT NULL,
  `created_date` datetime NOT NULL COMMENT 'GMT',
  PRIMARY KEY (`ordershipping_id`),
  KEY `idx_order_shipping_order_id` (`order_id`),
  KEY `fk_Orders_OrderShipping` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores each of the shipping records for orders';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_ordershippings`
--

LOCK TABLES `l38sx_tienda_ordershippings` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_ordershippings` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_ordershippings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_orderstates`
--

DROP TABLE IF EXISTS `l38sx_tienda_orderstates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_orderstates` (
  `order_state_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_state_code` char(1) NOT NULL DEFAULT '',
  `order_state_name` varchar(64) DEFAULT NULL,
  `order_state_description` text NOT NULL,
  PRIMARY KEY (`order_state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_orderstates`
--

LOCK TABLES `l38sx_tienda_orderstates` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_orderstates` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_orderstates` VALUES (1,'','Pending','');
INSERT INTO `l38sx_tienda_orderstates` VALUES (2,'','Processing','');
INSERT INTO `l38sx_tienda_orderstates` VALUES (3,'','Shipped','');
INSERT INTO `l38sx_tienda_orderstates` VALUES (5,'','Complete','');
INSERT INTO `l38sx_tienda_orderstates` VALUES (7,'','Canceled','');
INSERT INTO `l38sx_tienda_orderstates` VALUES (8,'','Denied','');
INSERT INTO `l38sx_tienda_orderstates` VALUES (9,'','Canceled Reversal','');
INSERT INTO `l38sx_tienda_orderstates` VALUES (10,'','Failed','');
INSERT INTO `l38sx_tienda_orderstates` VALUES (11,'','Refunded','');
INSERT INTO `l38sx_tienda_orderstates` VALUES (12,'','Reversed','');
INSERT INTO `l38sx_tienda_orderstates` VALUES (13,'','Chargeback','');
INSERT INTO `l38sx_tienda_orderstates` VALUES (14,'','Unspecified Error','');
INSERT INTO `l38sx_tienda_orderstates` VALUES (15,'','Pre-payment','');
INSERT INTO `l38sx_tienda_orderstates` VALUES (16,'','Payment Scheduled','');
INSERT INTO `l38sx_tienda_orderstates` VALUES (17,'','Payment Received','');
/*!40000 ALTER TABLE `l38sx_tienda_orderstates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_ordertaxclasses`
--

DROP TABLE IF EXISTS `l38sx_tienda_ordertaxclasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_ordertaxclasses` (
  `ordertaxclass_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `ordertaxclass_amount` decimal(15,5) DEFAULT '0.00000',
  `ordertaxclass_description` varchar(255) NOT NULL DEFAULT '' COMMENT 'Display name of the tax class',
  `tax_class_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ordertaxclass_id`),
  KEY `order_id` (`order_id`),
  KEY `tax_class_id` (`tax_class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_ordertaxclasses`
--

LOCK TABLES `l38sx_tienda_ordertaxclasses` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_ordertaxclasses` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_ordertaxclasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_ordertaxrates`
--

DROP TABLE IF EXISTS `l38sx_tienda_ordertaxrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_ordertaxrates` (
  `ordertaxrate_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `ordertaxrate_rate` decimal(7,4) DEFAULT '0.0000',
  `ordertaxrate_amount` decimal(15,5) DEFAULT '0.00000',
  `ordertaxrate_description` varchar(255) NOT NULL DEFAULT '' COMMENT 'Display name of the tax rate',
  `ordertaxrate_level` int(11) NOT NULL DEFAULT '0',
  `ordertaxclass_id` int(11) NOT NULL DEFAULT '0',
  `tax_rate_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ordertaxrate_id`),
  KEY `order_id` (`order_id`),
  KEY `tax_rate_id` (`tax_rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_ordertaxrates`
--

LOCK TABLES `l38sx_tienda_ordertaxrates` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_ordertaxrates` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_ordertaxrates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_ordervendors`
--

DROP TABLE IF EXISTS `l38sx_tienda_ordervendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_ordervendors` (
  `ordervendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `vendor_id` int(11) NOT NULL DEFAULT '0',
  `ordervendor_total` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `ordervendor_subtotal` decimal(15,5) DEFAULT '0.00000',
  `ordervendor_tax` decimal(10,2) DEFAULT '0.00',
  `ordervendor_shipping` decimal(10,2) DEFAULT '0.00',
  `ordervendor_shipping_tax` decimal(10,2) DEFAULT '0.00',
  `ordervendor_state_id` int(11) DEFAULT NULL COMMENT 'The shipment status of the portion of the order belonging to the vendor',
  `modified_date` datetime DEFAULT NULL COMMENT 'GMT',
  PRIMARY KEY (`ordervendor_id`),
  KEY `idx_orders_vendor_id` (`vendor_id`),
  KEY `idx_orders_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_ordervendors`
--

LOCK TABLES `l38sx_tienda_ordervendors` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_ordervendors` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_ordervendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_productattributeoptions`
--

DROP TABLE IF EXISTS `l38sx_tienda_productattributeoptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_productattributeoptions` (
  `productattributeoption_id` int(11) NOT NULL AUTO_INCREMENT,
  `productattribute_id` int(11) NOT NULL,
  `productattributeoption_name` varchar(255) NOT NULL,
  `parent_productattributeoption_id` int(11) NOT NULL,
  `productattributeoption_price` decimal(12,5) NOT NULL,
  `productattributeoption_code` varchar(255) NOT NULL,
  `productattributeoption_prefix` varchar(1) NOT NULL,
  `productattributeoption_weight` decimal(12,5) NOT NULL DEFAULT '0.00000',
  `productattributeoption_prefix_weight` varchar(1) NOT NULL DEFAULT '+',
  `is_blank` tinyint(1) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`productattributeoption_id`),
  KEY `productattribute_id` (`productattribute_id`),
  KEY `parent_productattributeoption_id` (`parent_productattributeoption_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_productattributeoptions`
--

LOCK TABLES `l38sx_tienda_productattributeoptions` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_productattributeoptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_productattributeoptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_productattributeoptionvalues`
--

DROP TABLE IF EXISTS `l38sx_tienda_productattributeoptionvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_productattributeoptionvalues` (
  `productattributeoptionvalue_id` int(11) NOT NULL AUTO_INCREMENT,
  `productattributeoption_id` int(11) NOT NULL,
  `productattributeoptionvalue_field` varchar(255) NOT NULL,
  `productattributeoptionvalue_operator` varchar(255) NOT NULL,
  `productattributeoptionvalue_value` varchar(255) NOT NULL,
  PRIMARY KEY (`productattributeoptionvalue_id`),
  KEY `fk_paov_pao` (`productattributeoption_id`),
  CONSTRAINT `fk_paov_pao` FOREIGN KEY (`productattributeoption_id`) REFERENCES `l38sx_tienda_productattributeoptions` (`productattributeoption_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_productattributeoptionvalues`
--

LOCK TABLES `l38sx_tienda_productattributeoptionvalues` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_productattributeoptionvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_productattributeoptionvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_productattributes`
--

DROP TABLE IF EXISTS `l38sx_tienda_productattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_productattributes` (
  `productattribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `productattribute_name` varchar(255) NOT NULL,
  `parent_productattributeoption_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`productattribute_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_productattributes`
--

LOCK TABLES `l38sx_tienda_productattributes` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_productattributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_productattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_productcategoryxref`
--

DROP TABLE IF EXISTS `l38sx_tienda_productcategoryxref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_productcategoryxref` (
  `category_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_product_category_xref_category_id` (`category_id`),
  KEY `idx_product_category_xref_product_id` (`product_id`),
  KEY `fk_Product_ProductCategory` (`product_id`),
  KEY `fk_Category_ProductCategory` (`category_id`),
  CONSTRAINT `fk_Product_ProductCategory` FOREIGN KEY (`product_id`) REFERENCES `l38sx_tienda_products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Category_ProductCategory` FOREIGN KEY (`category_id`) REFERENCES `l38sx_tienda_categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_productcategoryxref`
--

LOCK TABLES `l38sx_tienda_productcategoryxref` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_productcategoryxref` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_productcategoryxref` VALUES (2,1);
INSERT INTO `l38sx_tienda_productcategoryxref` VALUES (2,2);
/*!40000 ALTER TABLE `l38sx_tienda_productcategoryxref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_productcomments`
--

DROP TABLE IF EXISTS `l38sx_tienda_productcomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_productcomments` (
  `productcomment_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `productcomment_text` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL COMMENT 'GMT Only',
  `productcomment_rating` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'User rating for the product on a scale of 1 to 5',
  `productcomment_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `helpful_votes` int(11) NOT NULL DEFAULT '0',
  `helpful_votes_total` int(11) NOT NULL DEFAULT '0',
  `reported_count` int(11) NOT NULL DEFAULT '0',
  `rating_updated` tinyint(1) NOT NULL COMMENT 'Was the product overall rating updated?',
  PRIMARY KEY (`productcomment_id`),
  KEY `fk_Product_ProductReview` (`product_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_productcomments`
--

LOCK TABLES `l38sx_tienda_productcomments` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_productcomments` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_productcomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_productcommentshelpfulness`
--

DROP TABLE IF EXISTS `l38sx_tienda_productcommentshelpfulness`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_productcommentshelpfulness` (
  `productcommentshelpfulness_id` int(11) NOT NULL AUTO_INCREMENT,
  `productcomment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `helpful` tinyint(1) NOT NULL COMMENT 'Was this review helpful to the user?',
  `reported` tinyint(1) NOT NULL COMMENT 'Is the user reporting this comment as inappropriate?',
  PRIMARY KEY (`productcommentshelpfulness_id`),
  UNIQUE KEY `review_id` (`productcomment_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_productcommentshelpfulness`
--

LOCK TABLES `l38sx_tienda_productcommentshelpfulness` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_productcommentshelpfulness` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_productcommentshelpfulness` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_productcompare`
--

DROP TABLE IF EXISTS `l38sx_tienda_productcompare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_productcompare` (
  `productcompare_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(200) NOT NULL,
  `product_id` int(11) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`productcompare_id`),
  KEY `idx_user_product` (`user_id`,`product_id`),
  KEY `fk_productcompare_products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_productcompare`
--

LOCK TABLES `l38sx_tienda_productcompare` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_productcompare` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_productcompare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_productcouponxref`
--

DROP TABLE IF EXISTS `l38sx_tienda_productcouponxref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_productcouponxref` (
  `coupon_id` int(11) NOT NULL DEFAULT '0',
  `product_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_product_coupon_xref_coupon_id` (`coupon_id`),
  KEY `idx_product_coupon_xref_product_id` (`product_id`),
  KEY `fk_Product_ProductCoupon` (`product_id`),
  KEY `fk_Coupon_ProductCoupon` (`coupon_id`),
  CONSTRAINT `fk_Product_ProductCoupon` FOREIGN KEY (`product_id`) REFERENCES `l38sx_tienda_products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Coupon_ProductCoupon` FOREIGN KEY (`coupon_id`) REFERENCES `l38sx_tienda_coupons` (`coupon_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_productcouponxref`
--

LOCK TABLES `l38sx_tienda_productcouponxref` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_productcouponxref` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_productcouponxref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_productdownloadlogs`
--

DROP TABLE IF EXISTS `l38sx_tienda_productdownloadlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_productdownloadlogs` (
  `productdownloadlog_id` int(11) NOT NULL AUTO_INCREMENT,
  `productfile_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `productdownloadlog_datetime` datetime NOT NULL COMMENT 'GMT Only',
  `productdownloadlog_ipaddress` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`productdownloadlog_id`),
  KEY `fk_ProductFile_ProductDownloadLog` (`productfile_id`),
  CONSTRAINT `fk_ProductFile_ProductDownloadLog` FOREIGN KEY (`productfile_id`) REFERENCES `l38sx_tienda_productfiles` (`productfile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_productdownloadlogs`
--

LOCK TABLES `l38sx_tienda_productdownloadlogs` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_productdownloadlogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_productdownloadlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_productdownloads`
--

DROP TABLE IF EXISTS `l38sx_tienda_productdownloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_productdownloads` (
  `productdownload_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `productfile_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `productdownload_startdate` datetime NOT NULL COMMENT 'GMT Only',
  `productdownload_enddate` datetime NOT NULL COMMENT 'GMT Only',
  `productdownload_max` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`productdownload_id`),
  KEY `fk_Product_ProductDownload` (`product_id`),
  CONSTRAINT `fk_Product_ProductDownload` FOREIGN KEY (`product_id`) REFERENCES `l38sx_tienda_products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_productdownloads`
--

LOCK TABLES `l38sx_tienda_productdownloads` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_productdownloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_productdownloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_productfiles`
--

DROP TABLE IF EXISTS `l38sx_tienda_productfiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_productfiles` (
  `productfile_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `purchase_required` tinyint(1) NOT NULL,
  `productfile_name` varchar(128) NOT NULL DEFAULT '',
  `productfile_path` varchar(255) NOT NULL,
  `productfile_description` mediumtext NOT NULL,
  `productfile_extension` varchar(6) NOT NULL DEFAULT '',
  `productfile_mimetype` varchar(64) NOT NULL DEFAULT '',
  `productfile_url` varchar(255) NOT NULL DEFAULT '',
  `productfile_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `max_download` int(11) DEFAULT '-1',
  `ordering` int(11) NOT NULL,
  `created_date` datetime NOT NULL COMMENT 'GMT Only',
  `modified_date` datetime NOT NULL COMMENT 'GMT Only',
  PRIMARY KEY (`productfile_id`),
  KEY `fk_Product_ProductFiles` (`product_id`),
  CONSTRAINT `fk_Product_ProductFiles` FOREIGN KEY (`product_id`) REFERENCES `l38sx_tienda_products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_productfiles`
--

LOCK TABLES `l38sx_tienda_productfiles` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_productfiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_productfiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_productissues`
--

DROP TABLE IF EXISTS `l38sx_tienda_productissues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_productissues` (
  `product_issue_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `issue_num` varchar(10) NOT NULL,
  `volume_num` varchar(10) NOT NULL,
  `publishing_date` datetime NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`product_issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_productissues`
--

LOCK TABLES `l38sx_tienda_productissues` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_productissues` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_productissues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_productprices`
--

DROP TABLE IF EXISTS `l38sx_tienda_productprices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_productprices` (
  `product_price_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `product_price` decimal(12,5) DEFAULT '0.00000',
  `product_price_startdate` datetime NOT NULL COMMENT 'GMT Only',
  `product_price_enddate` datetime NOT NULL COMMENT 'GMT Only',
  `created_date` datetime NOT NULL COMMENT 'GMT Only',
  `modified_date` datetime NOT NULL COMMENT 'GMT Only',
  `group_id` int(11) DEFAULT '0',
  `price_quantity_start` int(11) unsigned NOT NULL DEFAULT '0',
  `price_quantity_end` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_price_id`),
  KEY `idx_product_price_product_id` (`product_id`),
  KEY `idx_product_price_group_id` (`group_id`),
  KEY `fk_Product_ProductPrice` (`product_id`),
  CONSTRAINT `fk_Product_ProductPrices` FOREIGN KEY (`product_id`) REFERENCES `l38sx_tienda_products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_productprices`
--

LOCK TABLES `l38sx_tienda_productprices` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_productprices` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_productprices` VALUES (1,1,0.00000,'0000-00-00 00:00:00','0000-00-00 00:00:00','2012-10-22 23:35:54','2012-10-22 23:35:54',1,0,0);
INSERT INTO `l38sx_tienda_productprices` VALUES (2,2,0.00000,'0000-00-00 00:00:00','0000-00-00 00:00:00','2012-10-22 23:35:54','2012-10-23 05:51:11',1,0,0);
/*!40000 ALTER TABLE `l38sx_tienda_productprices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_productquantities`
--

DROP TABLE IF EXISTS `l38sx_tienda_productquantities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_productquantities` (
  `productquantity_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_attributes` text NOT NULL COMMENT 'A CSV of productattributeoption_id values, always in numerical order',
  `product_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`productquantity_id`),
  KEY `product_id` (`product_id`),
  KEY `vendor_id` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_productquantities`
--

LOCK TABLES `l38sx_tienda_productquantities` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_productquantities` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_productquantities` VALUES (1,'',1,0,0);
INSERT INTO `l38sx_tienda_productquantities` VALUES (2,'',2,0,0);
/*!40000 ALTER TABLE `l38sx_tienda_productquantities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_productrelations`
--

DROP TABLE IF EXISTS `l38sx_tienda_productrelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_productrelations` (
  `productrelation_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id_from` int(11) NOT NULL DEFAULT '0',
  `product_id_to` int(11) NOT NULL DEFAULT '0',
  `relation_type` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`productrelation_id`),
  KEY `fk_Product_ProductRelationsA` (`product_id_from`),
  KEY `fk_Product_ProductRelationsB` (`product_id_to`),
  CONSTRAINT `fk_Product_ProductRelationsA` FOREIGN KEY (`product_id_from`) REFERENCES `l38sx_tienda_products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Product_ProductRelationsB` FOREIGN KEY (`product_id_to`) REFERENCES `l38sx_tienda_products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_productrelations`
--

LOCK TABLES `l38sx_tienda_productrelations` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_productrelations` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_productrelations` VALUES (2,1,2,'relates');
/*!40000 ALTER TABLE `l38sx_tienda_productrelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_products`
--

DROP TABLE IF EXISTS `l38sx_tienda_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL DEFAULT '0',
  `manufacturer_id` int(11) NOT NULL DEFAULT '0',
  `product_description` text,
  `product_description_short` text,
  `product_full_image` varchar(255) DEFAULT NULL,
  `product_weight` decimal(10,4) DEFAULT '0.0000',
  `product_length` decimal(10,4) DEFAULT '0.0000',
  `product_width` decimal(10,4) DEFAULT '0.0000',
  `product_height` decimal(10,4) DEFAULT '0.0000',
  `product_url` varchar(255) DEFAULT NULL,
  `product_sku` varchar(64) DEFAULT NULL,
  `product_model` varchar(255) DEFAULT NULL,
  `product_check_inventory` tinyint(1) DEFAULT '0' COMMENT 'Check Inventory for this Product?',
  `product_ships` tinyint(1) DEFAULT '0' COMMENT 'Product Requires Shipping?',
  `product_article` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `created_date` datetime NOT NULL COMMENT 'GMT Only',
  `modified_date` datetime NOT NULL COMMENT 'GMT Only',
  `publish_date` datetime NOT NULL COMMENT 'GMT Only',
  `unpublish_date` datetime NOT NULL COMMENT 'GMT Only',
  `product_name` varchar(255) NOT NULL DEFAULT '',
  `product_alias` varchar(255) NOT NULL,
  `tax_class_id` int(11) DEFAULT NULL,
  `product_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `product_notforsale` tinyint(1) NOT NULL DEFAULT '0',
  `quantity_restriction` tinyint(1) NOT NULL DEFAULT '0',
  `quantity_min` int(11) DEFAULT NULL,
  `quantity_max` int(11) DEFAULT NULL,
  `quantity_step` int(11) DEFAULT NULL,
  `product_images_path` varchar(255) NOT NULL,
  `product_files_path` varchar(255) NOT NULL,
  `product_recurs` tinyint(1) NOT NULL COMMENT 'Do payments for this product recur?',
  `recurring_payments` int(11) NOT NULL COMMENT 'How many recurring payments?',
  `recurring_period_interval` int(3) NOT NULL COMMENT 'How many period-units between payments?',
  `recurring_period_unit` varchar(1) NOT NULL COMMENT 'D, W, M, Y = Day, Week, Month, Year',
  `recurring_trial` tinyint(1) NOT NULL COMMENT 'Is there a trial period?',
  `recurring_trial_period_interval` int(3) NOT NULL COMMENT 'How many trial-period-units before payments begin?',
  `recurring_trial_period_unit` varchar(1) NOT NULL COMMENT 'D, W, M, Y = Day, Week, Month, Year',
  `recurring_trial_price` decimal(12,5) NOT NULL COMMENT 'Cost of trial period',
  `subscription_prorated` tinyint(1) NOT NULL DEFAULT '0',
  `subscription_prorated_date` varchar(5) DEFAULT NULL,
  `subscription_prorated_charge` tinyint(1) NOT NULL DEFAULT '0',
  `subscription_prorated_term` varchar(1) NOT NULL DEFAULT 'M',
  `product_params` text,
  `product_layout` varchar(255) DEFAULT '' COMMENT 'The layout file for this product',
  `product_subscription` tinyint(1) NOT NULL COMMENT 'Product creates a subscription?',
  `subscription_lifetime` tinyint(1) NOT NULL COMMENT 'Lifetime subscription?',
  `subscription_period_interval` int(3) NOT NULL COMMENT 'How many period-units does the subscription last?',
  `subscription_period_unit` varchar(1) NOT NULL COMMENT 'D, W, M, Y = Day, Week, Month, Year',
  `product_sql` text NOT NULL COMMENT 'SQL queries to be executed after the product is purchased',
  `product_listprice` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `product_listprice_enabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Display the product_listprice field?',
  `product_rating` decimal(15,5) NOT NULL DEFAULT '0.00000' COMMENT 'The overall rating for the product. Is x out of 5',
  `product_comments` int(11) NOT NULL DEFAULT '0' COMMENT 'The number of enabled comments the product has',
  PRIMARY KEY (`product_id`),
  KEY `idx_product_vendor_id` (`vendor_id`),
  KEY `idx_product_name` (`product_name`),
  KEY `fk_taxclasses_products` (`tax_class_id`),
  CONSTRAINT `fk_taxclasses_products` FOREIGN KEY (`tax_class_id`) REFERENCES `l38sx_tienda_taxclasses` (`tax_class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_products`
--

LOCK TABLES `l38sx_tienda_products` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_products` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_products` VALUES (1,0,0,'','',NULL,0.0000,0.0000,0.0000,0.0000,NULL,'','',0,0,0,1,'2012-10-22 23:35:54','2012-10-23 00:36:06','0000-00-00 00:00:00','0000-00-00 00:00:00','HI Tech Chips','hi-tech-chips',1,1,0,0,0,0,0,'','',0,0,0,'D',0,0,'D',0.00000,0,'',0,'M','{\"amigos_commission_override\":null,\"billets_ticket_limit_increase\":null,\"billets_ticket_limit_exclusion\":null,\"billets_hour_limit_increase\":null,\"billets_hour_limit_exclusion\":null,\"juga_group_csv_add\":null,\"juga_group_csv_remove\":null,\"juga_group_csv_add_expiration\":null,\"juga_group_csv_remove_expiration\":null,\"core_user_change_gid\":\"0\",\"core_user_new_gid\":\"\",\"ambrasubs_type_id\":null,\"hide_quantity_input\":\"0\",\"default_quantity\":\"\",\"hide_quantity_cart\":\"0\",\"show_product_compare\":\"1\"}','',0,0,0,'D','',0.00000,0,0.00000,0);
INSERT INTO `l38sx_tienda_products` VALUES (2,0,0,'','',NULL,0.0000,0.0000,0.0000,0.0000,NULL,'','',0,0,0,2,'2012-10-22 23:35:54','2012-10-23 05:52:06','0000-00-00 00:00:00','0000-00-00 00:00:00','HI Tech Chips 2','hi-tech-chips',1,1,0,0,0,0,0,'','',0,0,0,'D',0,0,'D',0.00000,0,'',0,'M','{\"amigos_commission_override\":null,\"billets_ticket_limit_increase\":null,\"billets_ticket_limit_exclusion\":null,\"billets_hour_limit_increase\":null,\"billets_hour_limit_exclusion\":null,\"juga_group_csv_add\":null,\"juga_group_csv_remove\":null,\"juga_group_csv_add_expiration\":null,\"juga_group_csv_remove_expiration\":null,\"core_user_change_gid\":\"0\",\"core_user_new_gid\":\"\",\"ambrasubs_type_id\":null,\"hide_quantity_input\":\"0\",\"default_quantity\":\"\",\"hide_quantity_cart\":\"0\",\"show_product_compare\":\"1\"}','',0,0,0,'D','',0.00000,0,0.00000,0);
/*!40000 ALTER TABLE `l38sx_tienda_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_shippingmethods`
--

DROP TABLE IF EXISTS `l38sx_tienda_shippingmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_shippingmethods` (
  `shipping_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `shipping_method_name` varchar(255) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `shipping_method_enabled` tinyint(1) NOT NULL,
  `shipping_method_type` tinyint(1) NOT NULL COMMENT '0=weight-based, 1=per-item, 2=per-order',
  `subtotal_minimum` decimal(12,5) NOT NULL COMMENT 'Minimum Subtotal required for shipping method to be active',
  `subtotal_maximum` decimal(12,5) NOT NULL DEFAULT '-1.00000',
  PRIMARY KEY (`shipping_method_id`),
  KEY `fk_taxclasses_shippingmethods` (`tax_class_id`),
  CONSTRAINT `fk_taxclass_shippingmethods` FOREIGN KEY (`tax_class_id`) REFERENCES `l38sx_tienda_taxclasses` (`tax_class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_shippingmethods`
--

LOCK TABLES `l38sx_tienda_shippingmethods` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_shippingmethods` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_shippingmethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_shippingrates`
--

DROP TABLE IF EXISTS `l38sx_tienda_shippingrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_shippingrates` (
  `shipping_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geozone_id` int(11) NOT NULL,
  `shipping_method_id` int(11) NOT NULL,
  `shipping_rate_price` decimal(12,5) NOT NULL,
  `shipping_rate_weight_start` decimal(11,3) NOT NULL,
  `shipping_rate_weight_end` decimal(11,3) NOT NULL,
  `shipping_rate_handling` decimal(12,5) NOT NULL,
  `created_date` datetime NOT NULL COMMENT 'GMT Only',
  `modified_date` datetime NOT NULL COMMENT 'GMT Only',
  PRIMARY KEY (`shipping_rate_id`),
  KEY `fk_geozone_shippingrates` (`geozone_id`),
  CONSTRAINT `fk_geozone_shippingrates` FOREIGN KEY (`geozone_id`) REFERENCES `l38sx_tienda_geozones` (`geozone_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_shippingrates`
--

LOCK TABLES `l38sx_tienda_shippingrates` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_shippingrates` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_shippingrates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_subscriptionhistory`
--

DROP TABLE IF EXISTS `l38sx_tienda_subscriptionhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_subscriptionhistory` (
  `subscriptionhistory_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) NOT NULL,
  `subscriptionhistory_type` varchar(64) NOT NULL COMMENT 'payment, email, download, creation, modification, cancellation',
  `created_datetime` datetime NOT NULL,
  `notify_customer` tinyint(1) NOT NULL,
  `comments` text NOT NULL,
  PRIMARY KEY (`subscriptionhistory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_subscriptionhistory`
--

LOCK TABLES `l38sx_tienda_subscriptionhistory` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_subscriptionhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_subscriptionhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_subscriptions`
--

DROP TABLE IF EXISTS `l38sx_tienda_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_subscriptions` (
  `subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `orderitem_id` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL COMMENT 'The unique id for this subscription from the payment processor',
  `created_datetime` datetime NOT NULL,
  `expires_datetime` datetime NOT NULL,
  `subscription_enabled` tinyint(1) NOT NULL,
  `lifetime_enabled` tinyint(1) NOT NULL,
  `checkedfiles_datetime` datetime NOT NULL COMMENT 'When were this subscriptions files last checked?',
  `sub_number` int(11) DEFAULT NULL,
  `subscription_issue_end_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_subscriptions`
--

LOCK TABLES `l38sx_tienda_subscriptions` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_taxclasses`
--

DROP TABLE IF EXISTS `l38sx_tienda_taxclasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_taxclasses` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_name` varchar(32) NOT NULL DEFAULT '',
  `tax_class_description` varchar(255) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_taxclasses`
--

LOCK TABLES `l38sx_tienda_taxclasses` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_taxclasses` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_taxclasses` VALUES (1,'Taxable Goods','',1,'2012-10-22 21:40:43','2012-10-22 21:40:43');
INSERT INTO `l38sx_tienda_taxclasses` VALUES (2,'Non-Taxable Goods','',2,'2012-10-22 21:40:43','2012-10-22 21:40:43');
/*!40000 ALTER TABLE `l38sx_tienda_taxclasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_taxrates`
--

DROP TABLE IF EXISTS `l38sx_tienda_taxrates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_taxrates` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geozone_id` int(11) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `tax_rate` decimal(7,4) NOT NULL DEFAULT '0.0000',
  `tax_rate_description` varchar(255) NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '0',
  `created_date` datetime NOT NULL COMMENT 'GMT Only',
  `modified_date` datetime NOT NULL COMMENT 'GMT Only',
  PRIMARY KEY (`tax_rate_id`),
  KEY `fk_TaxClass_TaxRates` (`tax_class_id`),
  KEY `fk_geozones_taxrates` (`geozone_id`),
  CONSTRAINT `fk_TaxClass_TaxRates` FOREIGN KEY (`tax_class_id`) REFERENCES `l38sx_tienda_taxclasses` (`tax_class_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_geozones_taxrates` FOREIGN KEY (`geozone_id`) REFERENCES `l38sx_tienda_geozones` (`geozone_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_taxrates`
--

LOCK TABLES `l38sx_tienda_taxrates` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_taxrates` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_taxrates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_usergroupxref`
--

DROP TABLE IF EXISTS `l38sx_tienda_usergroupxref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_usergroupxref` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  KEY `idx_user_group_xref_group_id` (`group_id`),
  KEY `idx_user_group_xref_user_id` (`user_id`),
  KEY `fk_Group_UserGroup` (`group_id`),
  CONSTRAINT `fk_Group_UserGroup` FOREIGN KEY (`group_id`) REFERENCES `l38sx_tienda_groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_usergroupxref`
--

LOCK TABLES `l38sx_tienda_usergroupxref` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_usergroupxref` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_usergroupxref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_userinfo`
--

DROP TABLE IF EXISTS `l38sx_tienda_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_userinfo` (
  `user_info_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `middle_name` varchar(32) DEFAULT NULL,
  `company` varchar(64) DEFAULT NULL,
  `phone_1` varchar(32) DEFAULT NULL,
  `phone_2` varchar(32) DEFAULT NULL,
  `fax` varchar(32) DEFAULT NULL,
  `html_emails` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `sub_number` int(11) DEFAULT NULL,
  `credits_total` decimal(12,5) NOT NULL,
  `credits_withdrawable_total` decimal(12,5) NOT NULL,
  PRIMARY KEY (`user_info_id`),
  KEY `idx_user_info_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_userinfo`
--

LOCK TABLES `l38sx_tienda_userinfo` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_userinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_wishlists`
--

DROP TABLE IF EXISTS `l38sx_tienda_wishlists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_wishlists` (
  `wishlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `product_attributes` text NOT NULL COMMENT 'A CSV of productattributeoption_id values, always in numerical order',
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `wishlistitem_params` text COMMENT 'Params for the wishlist item',
  PRIMARY KEY (`wishlist_id`),
  KEY `idx_user_product` (`user_id`,`product_id`),
  KEY `fk_wishlists_products` (`product_id`),
  CONSTRAINT `fk_wishlists_products` FOREIGN KEY (`product_id`) REFERENCES `l38sx_tienda_products` (`product_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_wishlists`
--

LOCK TABLES `l38sx_tienda_wishlists` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_wishlists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_zonerelations`
--

DROP TABLE IF EXISTS `l38sx_tienda_zonerelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_zonerelations` (
  `zonerelation_id` int(11) NOT NULL AUTO_INCREMENT,
  `zone_id` int(11) DEFAULT NULL,
  `geozone_id` int(11) DEFAULT NULL,
  `zip_range` varchar(255) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`zonerelation_id`),
  KEY `fk_geozone_zonerelations` (`geozone_id`),
  KEY `fk_geozone_zones` (`zone_id`),
  CONSTRAINT `fk_geozone_zonerelations` FOREIGN KEY (`geozone_id`) REFERENCES `l38sx_tienda_geozones` (`geozone_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_geozone_zones` FOREIGN KEY (`zone_id`) REFERENCES `l38sx_tienda_zones` (`zone_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_zonerelations`
--

LOCK TABLES `l38sx_tienda_zonerelations` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_zonerelations` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_tienda_zonerelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_tienda_zones`
--

DROP TABLE IF EXISTS `l38sx_tienda_zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_tienda_zones` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL DEFAULT '',
  `zone_name` varchar(128) NOT NULL,
  PRIMARY KEY (`zone_id`),
  KEY `fk_countries_zones` (`country_id`),
  CONSTRAINT `fk_countries_zones` FOREIGN KEY (`country_id`) REFERENCES `l38sx_tienda_countries` (`country_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_tienda_zones`
--

LOCK TABLES `l38sx_tienda_zones` WRITE;
/*!40000 ALTER TABLE `l38sx_tienda_zones` DISABLE KEYS */;
INSERT INTO `l38sx_tienda_zones` VALUES (1,1,'BDS','Badakhshan');
INSERT INTO `l38sx_tienda_zones` VALUES (2,1,'BDG','Badghis');
INSERT INTO `l38sx_tienda_zones` VALUES (3,1,'BGL','Baghlan');
INSERT INTO `l38sx_tienda_zones` VALUES (4,1,'BAL','Balkh');
INSERT INTO `l38sx_tienda_zones` VALUES (5,1,'BAM','Bamian');
INSERT INTO `l38sx_tienda_zones` VALUES (6,1,'FRA','Farah');
INSERT INTO `l38sx_tienda_zones` VALUES (7,1,'FYB','Faryab');
INSERT INTO `l38sx_tienda_zones` VALUES (8,1,'GHA','Ghazni');
INSERT INTO `l38sx_tienda_zones` VALUES (9,1,'GHO','Ghowr');
INSERT INTO `l38sx_tienda_zones` VALUES (10,1,'HEL','Helmand');
INSERT INTO `l38sx_tienda_zones` VALUES (11,1,'HER','Herat');
INSERT INTO `l38sx_tienda_zones` VALUES (12,1,'JOW','Jowzjan');
INSERT INTO `l38sx_tienda_zones` VALUES (13,1,'KAB','Kabul');
INSERT INTO `l38sx_tienda_zones` VALUES (14,1,'KAN','Kandahar');
INSERT INTO `l38sx_tienda_zones` VALUES (15,1,'KAP','Kapisa');
INSERT INTO `l38sx_tienda_zones` VALUES (16,1,'KHO','Khost');
INSERT INTO `l38sx_tienda_zones` VALUES (17,1,'KNR','Konar');
INSERT INTO `l38sx_tienda_zones` VALUES (18,1,'KDZ','Kondoz');
INSERT INTO `l38sx_tienda_zones` VALUES (19,1,'LAG','Laghman');
INSERT INTO `l38sx_tienda_zones` VALUES (20,1,'LOW','Lowgar');
INSERT INTO `l38sx_tienda_zones` VALUES (21,1,'NAN','Nangrahar');
INSERT INTO `l38sx_tienda_zones` VALUES (22,1,'NIM','Nimruz');
INSERT INTO `l38sx_tienda_zones` VALUES (23,1,'NUR','Nurestan');
INSERT INTO `l38sx_tienda_zones` VALUES (24,1,'ORU','Oruzgan');
INSERT INTO `l38sx_tienda_zones` VALUES (25,1,'PIA','Paktia');
INSERT INTO `l38sx_tienda_zones` VALUES (26,1,'PKA','Paktika');
INSERT INTO `l38sx_tienda_zones` VALUES (27,1,'PAR','Parwan');
INSERT INTO `l38sx_tienda_zones` VALUES (28,1,'SAM','Samangan');
INSERT INTO `l38sx_tienda_zones` VALUES (29,1,'SAR','Sar-e Pol');
INSERT INTO `l38sx_tienda_zones` VALUES (30,1,'TAK','Takhar');
INSERT INTO `l38sx_tienda_zones` VALUES (31,1,'WAR','Wardak');
INSERT INTO `l38sx_tienda_zones` VALUES (32,1,'ZAB','Zabol');
INSERT INTO `l38sx_tienda_zones` VALUES (33,2,'BR','Berat');
INSERT INTO `l38sx_tienda_zones` VALUES (34,2,'BU','Bulqize');
INSERT INTO `l38sx_tienda_zones` VALUES (35,2,'DL','Delvine');
INSERT INTO `l38sx_tienda_zones` VALUES (36,2,'DV','Devoll');
INSERT INTO `l38sx_tienda_zones` VALUES (37,2,'DI','Diber');
INSERT INTO `l38sx_tienda_zones` VALUES (38,2,'DR','Durres');
INSERT INTO `l38sx_tienda_zones` VALUES (39,2,'EL','Elbasan');
INSERT INTO `l38sx_tienda_zones` VALUES (40,2,'ER','Kolonje');
INSERT INTO `l38sx_tienda_zones` VALUES (41,2,'FR','Fier');
INSERT INTO `l38sx_tienda_zones` VALUES (42,2,'GJ','Gjirokaster');
INSERT INTO `l38sx_tienda_zones` VALUES (43,2,'GR','Gramsh');
INSERT INTO `l38sx_tienda_zones` VALUES (44,2,'HA','Has');
INSERT INTO `l38sx_tienda_zones` VALUES (45,2,'KA','Kavaje');
INSERT INTO `l38sx_tienda_zones` VALUES (46,2,'KB','Kurbin');
INSERT INTO `l38sx_tienda_zones` VALUES (47,2,'KC','Kucove');
INSERT INTO `l38sx_tienda_zones` VALUES (48,2,'KO','Korce');
INSERT INTO `l38sx_tienda_zones` VALUES (49,2,'KR','Kruje');
INSERT INTO `l38sx_tienda_zones` VALUES (50,2,'KU','Kukes');
INSERT INTO `l38sx_tienda_zones` VALUES (51,2,'LB','Librazhd');
INSERT INTO `l38sx_tienda_zones` VALUES (52,2,'LE','Lezhe');
INSERT INTO `l38sx_tienda_zones` VALUES (53,2,'LU','Lushnje');
INSERT INTO `l38sx_tienda_zones` VALUES (54,2,'MM','Malesi e Madhe');
INSERT INTO `l38sx_tienda_zones` VALUES (55,2,'MK','Mallakaster');
INSERT INTO `l38sx_tienda_zones` VALUES (56,2,'MT','Mat');
INSERT INTO `l38sx_tienda_zones` VALUES (57,2,'MR','Mirdite');
INSERT INTO `l38sx_tienda_zones` VALUES (58,2,'PQ','Peqin');
INSERT INTO `l38sx_tienda_zones` VALUES (59,2,'PR','Permet');
INSERT INTO `l38sx_tienda_zones` VALUES (60,2,'PG','Pogradec');
INSERT INTO `l38sx_tienda_zones` VALUES (61,2,'PU','Puke');
INSERT INTO `l38sx_tienda_zones` VALUES (62,2,'SH','Shkoder');
INSERT INTO `l38sx_tienda_zones` VALUES (63,2,'SK','Skrapar');
INSERT INTO `l38sx_tienda_zones` VALUES (64,2,'SR','Sarande');
INSERT INTO `l38sx_tienda_zones` VALUES (65,2,'TE','Tepelene');
INSERT INTO `l38sx_tienda_zones` VALUES (66,2,'TP','Tropoje');
INSERT INTO `l38sx_tienda_zones` VALUES (67,2,'TR','Tirane');
INSERT INTO `l38sx_tienda_zones` VALUES (68,2,'VL','Vlore');
INSERT INTO `l38sx_tienda_zones` VALUES (69,3,'ADR','Adrar');
INSERT INTO `l38sx_tienda_zones` VALUES (70,3,'ADE','Ain Defla');
INSERT INTO `l38sx_tienda_zones` VALUES (71,3,'ATE','Ain Temouchent');
INSERT INTO `l38sx_tienda_zones` VALUES (72,3,'ALG','Alger');
INSERT INTO `l38sx_tienda_zones` VALUES (73,3,'ANN','Annaba');
INSERT INTO `l38sx_tienda_zones` VALUES (74,3,'BAT','Batna');
INSERT INTO `l38sx_tienda_zones` VALUES (75,3,'BEC','Bechar');
INSERT INTO `l38sx_tienda_zones` VALUES (76,3,'BEJ','Bejaia');
INSERT INTO `l38sx_tienda_zones` VALUES (77,3,'BIS','Biskra');
INSERT INTO `l38sx_tienda_zones` VALUES (78,3,'BLI','Blida');
INSERT INTO `l38sx_tienda_zones` VALUES (79,3,'BBA','Bordj Bou Arreridj');
INSERT INTO `l38sx_tienda_zones` VALUES (80,3,'BOA','Bouira');
INSERT INTO `l38sx_tienda_zones` VALUES (81,3,'BMD','Boumerdes');
INSERT INTO `l38sx_tienda_zones` VALUES (82,3,'CHL','Chlef');
INSERT INTO `l38sx_tienda_zones` VALUES (83,3,'CON','Constantine');
INSERT INTO `l38sx_tienda_zones` VALUES (84,3,'DJE','Djelfa');
INSERT INTO `l38sx_tienda_zones` VALUES (85,3,'EBA','El Bayadh');
INSERT INTO `l38sx_tienda_zones` VALUES (86,3,'EOU','El Oued');
INSERT INTO `l38sx_tienda_zones` VALUES (87,3,'ETA','El Tarf');
INSERT INTO `l38sx_tienda_zones` VALUES (88,3,'GHA','Ghardaia');
INSERT INTO `l38sx_tienda_zones` VALUES (89,3,'GUE','Guelma');
INSERT INTO `l38sx_tienda_zones` VALUES (90,3,'ILL','Illizi');
INSERT INTO `l38sx_tienda_zones` VALUES (91,3,'JIJ','Jijel');
INSERT INTO `l38sx_tienda_zones` VALUES (92,3,'KHE','Khenchela');
INSERT INTO `l38sx_tienda_zones` VALUES (93,3,'LAG','Laghouat');
INSERT INTO `l38sx_tienda_zones` VALUES (94,3,'MUA','Muaskar');
INSERT INTO `l38sx_tienda_zones` VALUES (95,3,'MED','Medea');
INSERT INTO `l38sx_tienda_zones` VALUES (96,3,'MIL','Mila');
INSERT INTO `l38sx_tienda_zones` VALUES (97,3,'MOS','Mostaganem');
INSERT INTO `l38sx_tienda_zones` VALUES (98,3,'MSI','M\'Sila');
INSERT INTO `l38sx_tienda_zones` VALUES (99,3,'NAA','Naama');
INSERT INTO `l38sx_tienda_zones` VALUES (100,3,'ORA','Oran');
INSERT INTO `l38sx_tienda_zones` VALUES (101,3,'OUA','Ouargla');
INSERT INTO `l38sx_tienda_zones` VALUES (102,3,'OEB','Oum el-Bouaghi');
INSERT INTO `l38sx_tienda_zones` VALUES (103,3,'REL','Relizane');
INSERT INTO `l38sx_tienda_zones` VALUES (104,3,'SAI','Saida');
INSERT INTO `l38sx_tienda_zones` VALUES (105,3,'SET','Setif');
INSERT INTO `l38sx_tienda_zones` VALUES (106,3,'SBA','Sidi Bel Abbes');
INSERT INTO `l38sx_tienda_zones` VALUES (107,3,'SKI','Skikda');
INSERT INTO `l38sx_tienda_zones` VALUES (108,3,'SAH','Souk Ahras');
INSERT INTO `l38sx_tienda_zones` VALUES (109,3,'TAM','Tamanghasset');
INSERT INTO `l38sx_tienda_zones` VALUES (110,3,'TEB','Tebessa');
INSERT INTO `l38sx_tienda_zones` VALUES (111,3,'TIA','Tiaret');
INSERT INTO `l38sx_tienda_zones` VALUES (112,3,'TIN','Tindouf');
INSERT INTO `l38sx_tienda_zones` VALUES (113,3,'TIP','Tipaza');
INSERT INTO `l38sx_tienda_zones` VALUES (114,3,'TIS','Tissemsilt');
INSERT INTO `l38sx_tienda_zones` VALUES (115,3,'TOU','Tizi Ouzou');
INSERT INTO `l38sx_tienda_zones` VALUES (116,3,'TLE','Tlemcen');
INSERT INTO `l38sx_tienda_zones` VALUES (117,4,'E','Eastern');
INSERT INTO `l38sx_tienda_zones` VALUES (118,4,'M','Manu\'a');
INSERT INTO `l38sx_tienda_zones` VALUES (119,4,'R','Rose Island');
INSERT INTO `l38sx_tienda_zones` VALUES (120,4,'S','Swains Island');
INSERT INTO `l38sx_tienda_zones` VALUES (121,4,'W','Western');
INSERT INTO `l38sx_tienda_zones` VALUES (122,5,'ALV','Andorra la Vella');
INSERT INTO `l38sx_tienda_zones` VALUES (123,5,'CAN','Canillo');
INSERT INTO `l38sx_tienda_zones` VALUES (124,5,'ENC','Encamp');
INSERT INTO `l38sx_tienda_zones` VALUES (125,5,'ESE','Escaldes-Engordany');
INSERT INTO `l38sx_tienda_zones` VALUES (126,5,'LMA','La Massana');
INSERT INTO `l38sx_tienda_zones` VALUES (127,5,'ORD','Ordino');
INSERT INTO `l38sx_tienda_zones` VALUES (128,5,'SJL','Sant Julia de Loria');
INSERT INTO `l38sx_tienda_zones` VALUES (129,6,'BGO','Bengo');
INSERT INTO `l38sx_tienda_zones` VALUES (130,6,'BGU','Benguela');
INSERT INTO `l38sx_tienda_zones` VALUES (131,6,'BIE','Bie');
INSERT INTO `l38sx_tienda_zones` VALUES (132,6,'CAB','Cabinda');
INSERT INTO `l38sx_tienda_zones` VALUES (133,6,'CCU','Cuando-Cubango');
INSERT INTO `l38sx_tienda_zones` VALUES (134,6,'CNO','Cuanza Norte');
INSERT INTO `l38sx_tienda_zones` VALUES (135,6,'CUS','Cuanza Sul');
INSERT INTO `l38sx_tienda_zones` VALUES (136,6,'CNN','Cunene');
INSERT INTO `l38sx_tienda_zones` VALUES (137,6,'HUA','Huambo');
INSERT INTO `l38sx_tienda_zones` VALUES (138,6,'HUI','Huila');
INSERT INTO `l38sx_tienda_zones` VALUES (139,6,'LUA','Luanda');
INSERT INTO `l38sx_tienda_zones` VALUES (140,6,'LNO','Lunda Norte');
INSERT INTO `l38sx_tienda_zones` VALUES (141,6,'LSU','Lunda Sul');
INSERT INTO `l38sx_tienda_zones` VALUES (142,6,'MAL','Malange');
INSERT INTO `l38sx_tienda_zones` VALUES (143,6,'MOX','Moxico');
INSERT INTO `l38sx_tienda_zones` VALUES (144,6,'NAM','Namibe');
INSERT INTO `l38sx_tienda_zones` VALUES (145,6,'UIG','Uige');
INSERT INTO `l38sx_tienda_zones` VALUES (146,6,'ZAI','Zaire');
INSERT INTO `l38sx_tienda_zones` VALUES (147,9,'ASG','Saint George');
INSERT INTO `l38sx_tienda_zones` VALUES (148,9,'ASJ','Saint John');
INSERT INTO `l38sx_tienda_zones` VALUES (149,9,'ASM','Saint Mary');
INSERT INTO `l38sx_tienda_zones` VALUES (150,9,'ASL','Saint Paul');
INSERT INTO `l38sx_tienda_zones` VALUES (151,9,'ASR','Saint Peter');
INSERT INTO `l38sx_tienda_zones` VALUES (152,9,'ASH','Saint Philip');
INSERT INTO `l38sx_tienda_zones` VALUES (153,9,'BAR','Barbuda');
INSERT INTO `l38sx_tienda_zones` VALUES (154,9,'RED','Redonda');
INSERT INTO `l38sx_tienda_zones` VALUES (155,10,'AN','Antartida e Islas del Atlantico');
INSERT INTO `l38sx_tienda_zones` VALUES (156,10,'BA','Buenos Aires');
INSERT INTO `l38sx_tienda_zones` VALUES (157,10,'CA','Catamarca');
INSERT INTO `l38sx_tienda_zones` VALUES (158,10,'CH','Chaco');
INSERT INTO `l38sx_tienda_zones` VALUES (159,10,'CU','Chubut');
INSERT INTO `l38sx_tienda_zones` VALUES (160,10,'CO','Cordoba');
INSERT INTO `l38sx_tienda_zones` VALUES (161,10,'CR','Corrientes');
INSERT INTO `l38sx_tienda_zones` VALUES (162,10,'DF','Distrito Federal');
INSERT INTO `l38sx_tienda_zones` VALUES (163,10,'ER','Entre Rios');
INSERT INTO `l38sx_tienda_zones` VALUES (164,10,'FO','Formosa');
INSERT INTO `l38sx_tienda_zones` VALUES (165,10,'JU','Jujuy');
INSERT INTO `l38sx_tienda_zones` VALUES (166,10,'LP','La Pampa');
INSERT INTO `l38sx_tienda_zones` VALUES (167,10,'LR','La Rioja');
INSERT INTO `l38sx_tienda_zones` VALUES (168,10,'ME','Mendoza');
INSERT INTO `l38sx_tienda_zones` VALUES (169,10,'MI','Misiones');
INSERT INTO `l38sx_tienda_zones` VALUES (170,10,'NE','Neuquen');
INSERT INTO `l38sx_tienda_zones` VALUES (171,10,'RN','Rio Negro');
INSERT INTO `l38sx_tienda_zones` VALUES (172,10,'SA','Salta');
INSERT INTO `l38sx_tienda_zones` VALUES (173,10,'SJ','San Juan');
INSERT INTO `l38sx_tienda_zones` VALUES (174,10,'SL','San Luis');
INSERT INTO `l38sx_tienda_zones` VALUES (175,10,'SC','Santa Cruz');
INSERT INTO `l38sx_tienda_zones` VALUES (176,10,'SF','Santa Fe');
INSERT INTO `l38sx_tienda_zones` VALUES (177,10,'SD','Santiago del Estero');
INSERT INTO `l38sx_tienda_zones` VALUES (178,10,'TF','Tierra del Fuego');
INSERT INTO `l38sx_tienda_zones` VALUES (179,10,'TU','Tucuman');
INSERT INTO `l38sx_tienda_zones` VALUES (180,11,'AGT','Aragatsotn');
INSERT INTO `l38sx_tienda_zones` VALUES (181,11,'ARR','Ararat');
INSERT INTO `l38sx_tienda_zones` VALUES (182,11,'ARM','Armavir');
INSERT INTO `l38sx_tienda_zones` VALUES (183,11,'GEG','Geghark\'unik\'');
INSERT INTO `l38sx_tienda_zones` VALUES (184,11,'KOT','Kotayk\'');
INSERT INTO `l38sx_tienda_zones` VALUES (185,11,'LOR','Lorri');
INSERT INTO `l38sx_tienda_zones` VALUES (186,11,'SHI','Shirak');
INSERT INTO `l38sx_tienda_zones` VALUES (187,11,'SYU','Syunik\'');
INSERT INTO `l38sx_tienda_zones` VALUES (188,11,'TAV','Tavush');
INSERT INTO `l38sx_tienda_zones` VALUES (189,11,'VAY','Vayots\' Dzor');
INSERT INTO `l38sx_tienda_zones` VALUES (190,11,'YER','Yerevan');
INSERT INTO `l38sx_tienda_zones` VALUES (191,13,'ACT','Australian Capital Territory');
INSERT INTO `l38sx_tienda_zones` VALUES (192,13,'NSW','New South Wales');
INSERT INTO `l38sx_tienda_zones` VALUES (193,13,'NT','Northern Territory');
INSERT INTO `l38sx_tienda_zones` VALUES (194,13,'QLD','Queensland');
INSERT INTO `l38sx_tienda_zones` VALUES (195,13,'SA','South Australia');
INSERT INTO `l38sx_tienda_zones` VALUES (196,13,'TAS','Tasmania');
INSERT INTO `l38sx_tienda_zones` VALUES (197,13,'VIC','Victoria');
INSERT INTO `l38sx_tienda_zones` VALUES (198,13,'WA','Western Australia');
INSERT INTO `l38sx_tienda_zones` VALUES (199,14,'BUR','Burgenland');
INSERT INTO `l38sx_tienda_zones` VALUES (200,14,'KAR','Kärnten');
INSERT INTO `l38sx_tienda_zones` VALUES (201,14,'NOS','Nieder&ouml;esterreich');
INSERT INTO `l38sx_tienda_zones` VALUES (202,14,'OOS','Ober&ouml;esterreich');
INSERT INTO `l38sx_tienda_zones` VALUES (203,14,'SAL','Salzburg');
INSERT INTO `l38sx_tienda_zones` VALUES (204,14,'STE','Steiermark');
INSERT INTO `l38sx_tienda_zones` VALUES (205,14,'TIR','Tirol');
INSERT INTO `l38sx_tienda_zones` VALUES (206,14,'VOR','Vorarlberg');
INSERT INTO `l38sx_tienda_zones` VALUES (207,14,'WIE','Wien');
INSERT INTO `l38sx_tienda_zones` VALUES (208,15,'AB','Ali Bayramli');
INSERT INTO `l38sx_tienda_zones` VALUES (209,15,'ABS','Abseron');
INSERT INTO `l38sx_tienda_zones` VALUES (210,15,'AGC','AgcabAdi');
INSERT INTO `l38sx_tienda_zones` VALUES (211,15,'AGM','Agdam');
INSERT INTO `l38sx_tienda_zones` VALUES (212,15,'AGS','Agdas');
INSERT INTO `l38sx_tienda_zones` VALUES (213,15,'AGA','Agstafa');
INSERT INTO `l38sx_tienda_zones` VALUES (214,15,'AGU','Agsu');
INSERT INTO `l38sx_tienda_zones` VALUES (215,15,'AST','Astara');
INSERT INTO `l38sx_tienda_zones` VALUES (216,15,'BA','Baki');
INSERT INTO `l38sx_tienda_zones` VALUES (217,15,'BAB','BabAk');
INSERT INTO `l38sx_tienda_zones` VALUES (218,15,'BAL','BalakAn');
INSERT INTO `l38sx_tienda_zones` VALUES (219,15,'BAR','BArdA');
INSERT INTO `l38sx_tienda_zones` VALUES (220,15,'BEY','Beylaqan');
INSERT INTO `l38sx_tienda_zones` VALUES (221,15,'BIL','Bilasuvar');
INSERT INTO `l38sx_tienda_zones` VALUES (222,15,'CAB','Cabrayil');
INSERT INTO `l38sx_tienda_zones` VALUES (223,15,'CAL','Calilabab');
INSERT INTO `l38sx_tienda_zones` VALUES (224,15,'CUL','Culfa');
INSERT INTO `l38sx_tienda_zones` VALUES (225,15,'DAS','Daskasan');
INSERT INTO `l38sx_tienda_zones` VALUES (226,15,'DAV','Davaci');
INSERT INTO `l38sx_tienda_zones` VALUES (227,15,'FUZ','Fuzuli');
INSERT INTO `l38sx_tienda_zones` VALUES (228,15,'GA','Ganca');
INSERT INTO `l38sx_tienda_zones` VALUES (229,15,'GAD','Gadabay');
INSERT INTO `l38sx_tienda_zones` VALUES (230,15,'GOR','Goranboy');
INSERT INTO `l38sx_tienda_zones` VALUES (231,15,'GOY','Goycay');
INSERT INTO `l38sx_tienda_zones` VALUES (232,15,'HAC','Haciqabul');
INSERT INTO `l38sx_tienda_zones` VALUES (233,15,'IMI','Imisli');
INSERT INTO `l38sx_tienda_zones` VALUES (234,15,'ISM','Ismayilli');
INSERT INTO `l38sx_tienda_zones` VALUES (235,15,'KAL','Kalbacar');
INSERT INTO `l38sx_tienda_zones` VALUES (236,15,'KUR','Kurdamir');
INSERT INTO `l38sx_tienda_zones` VALUES (237,15,'LA','Lankaran');
INSERT INTO `l38sx_tienda_zones` VALUES (238,15,'LAC','Lacin');
INSERT INTO `l38sx_tienda_zones` VALUES (239,15,'LAN','Lankaran');
INSERT INTO `l38sx_tienda_zones` VALUES (240,15,'LER','Lerik');
INSERT INTO `l38sx_tienda_zones` VALUES (241,15,'MAS','Masalli');
INSERT INTO `l38sx_tienda_zones` VALUES (242,15,'MI','Mingacevir');
INSERT INTO `l38sx_tienda_zones` VALUES (243,15,'NA','Naftalan');
INSERT INTO `l38sx_tienda_zones` VALUES (244,15,'NEF','Neftcala');
INSERT INTO `l38sx_tienda_zones` VALUES (245,15,'OGU','Oguz');
INSERT INTO `l38sx_tienda_zones` VALUES (246,15,'ORD','Ordubad');
INSERT INTO `l38sx_tienda_zones` VALUES (247,15,'QAB','Qabala');
INSERT INTO `l38sx_tienda_zones` VALUES (248,15,'QAX','Qax');
INSERT INTO `l38sx_tienda_zones` VALUES (249,15,'QAZ','Qazax');
INSERT INTO `l38sx_tienda_zones` VALUES (250,15,'QOB','Qobustan');
INSERT INTO `l38sx_tienda_zones` VALUES (251,15,'QBA','Quba');
INSERT INTO `l38sx_tienda_zones` VALUES (252,15,'QBI','Qubadli');
INSERT INTO `l38sx_tienda_zones` VALUES (253,15,'QUS','Qusar');
INSERT INTO `l38sx_tienda_zones` VALUES (254,15,'SA','Saki');
INSERT INTO `l38sx_tienda_zones` VALUES (255,15,'SAT','Saatli');
INSERT INTO `l38sx_tienda_zones` VALUES (256,15,'SAB','Sabirabad');
INSERT INTO `l38sx_tienda_zones` VALUES (257,15,'SAD','Sadarak');
INSERT INTO `l38sx_tienda_zones` VALUES (258,15,'SAH','Sahbuz');
INSERT INTO `l38sx_tienda_zones` VALUES (259,15,'SAK','Saki');
INSERT INTO `l38sx_tienda_zones` VALUES (260,15,'SAL','Salyan');
INSERT INTO `l38sx_tienda_zones` VALUES (261,15,'SM','Sumqayit');
INSERT INTO `l38sx_tienda_zones` VALUES (262,15,'SMI','Samaxi');
INSERT INTO `l38sx_tienda_zones` VALUES (263,15,'SKR','Samkir');
INSERT INTO `l38sx_tienda_zones` VALUES (264,15,'SMX','Samux');
INSERT INTO `l38sx_tienda_zones` VALUES (265,15,'SAR','Sarur');
INSERT INTO `l38sx_tienda_zones` VALUES (266,15,'SIY','Siyazan');
INSERT INTO `l38sx_tienda_zones` VALUES (267,15,'SS','Susa');
INSERT INTO `l38sx_tienda_zones` VALUES (268,15,'SUS','Susa');
INSERT INTO `l38sx_tienda_zones` VALUES (269,15,'TAR','Tartar');
INSERT INTO `l38sx_tienda_zones` VALUES (270,15,'TOV','Tovuz');
INSERT INTO `l38sx_tienda_zones` VALUES (271,15,'UCA','Ucar');
INSERT INTO `l38sx_tienda_zones` VALUES (272,15,'XA','Xankandi');
INSERT INTO `l38sx_tienda_zones` VALUES (273,15,'XAC','Xacmaz');
INSERT INTO `l38sx_tienda_zones` VALUES (274,15,'XAN','Xanlar');
INSERT INTO `l38sx_tienda_zones` VALUES (275,15,'XIZ','Xizi');
INSERT INTO `l38sx_tienda_zones` VALUES (276,15,'XCI','Xocali');
INSERT INTO `l38sx_tienda_zones` VALUES (277,15,'XVD','Xocavand');
INSERT INTO `l38sx_tienda_zones` VALUES (278,15,'YAR','Yardimli');
INSERT INTO `l38sx_tienda_zones` VALUES (279,15,'YEV','Yevlax');
INSERT INTO `l38sx_tienda_zones` VALUES (280,15,'ZAN','Zangilan');
INSERT INTO `l38sx_tienda_zones` VALUES (281,15,'ZAQ','Zaqatala');
INSERT INTO `l38sx_tienda_zones` VALUES (282,15,'ZAR','Zardab');
INSERT INTO `l38sx_tienda_zones` VALUES (283,15,'NX','Naxcivan');
INSERT INTO `l38sx_tienda_zones` VALUES (284,16,'ACK','Acklins');
INSERT INTO `l38sx_tienda_zones` VALUES (285,16,'BER','Berry Islands');
INSERT INTO `l38sx_tienda_zones` VALUES (286,16,'BIM','Bimini');
INSERT INTO `l38sx_tienda_zones` VALUES (287,16,'BLK','Black Point');
INSERT INTO `l38sx_tienda_zones` VALUES (288,16,'CAT','Cat Island');
INSERT INTO `l38sx_tienda_zones` VALUES (289,16,'CAB','Central Abaco');
INSERT INTO `l38sx_tienda_zones` VALUES (290,16,'CAN','Central Andros');
INSERT INTO `l38sx_tienda_zones` VALUES (291,16,'CEL','Central Eleuthera');
INSERT INTO `l38sx_tienda_zones` VALUES (292,16,'FRE','City of Freeport');
INSERT INTO `l38sx_tienda_zones` VALUES (293,16,'CRO','Crooked Island');
INSERT INTO `l38sx_tienda_zones` VALUES (294,16,'EGB','East Grand Bahama');
INSERT INTO `l38sx_tienda_zones` VALUES (295,16,'EXU','Exuma');
INSERT INTO `l38sx_tienda_zones` VALUES (296,16,'GRD','Grand Cay');
INSERT INTO `l38sx_tienda_zones` VALUES (297,16,'HAR','Harbour Island');
INSERT INTO `l38sx_tienda_zones` VALUES (298,16,'HOP','Hope Town');
INSERT INTO `l38sx_tienda_zones` VALUES (299,16,'INA','Inagua');
INSERT INTO `l38sx_tienda_zones` VALUES (300,16,'LNG','Long Island');
INSERT INTO `l38sx_tienda_zones` VALUES (301,16,'MAN','Mangrove Cay');
INSERT INTO `l38sx_tienda_zones` VALUES (302,16,'MAY','Mayaguana');
INSERT INTO `l38sx_tienda_zones` VALUES (303,16,'MOO','Moore\'s Island');
INSERT INTO `l38sx_tienda_zones` VALUES (304,16,'NAB','North Abaco');
INSERT INTO `l38sx_tienda_zones` VALUES (305,16,'NAN','North Andros');
INSERT INTO `l38sx_tienda_zones` VALUES (306,16,'NEL','North Eleuthera');
INSERT INTO `l38sx_tienda_zones` VALUES (307,16,'RAG','Ragged Island');
INSERT INTO `l38sx_tienda_zones` VALUES (308,16,'RUM','Rum Cay');
INSERT INTO `l38sx_tienda_zones` VALUES (309,16,'SAL','San Salvador');
INSERT INTO `l38sx_tienda_zones` VALUES (310,16,'SAB','South Abaco');
INSERT INTO `l38sx_tienda_zones` VALUES (311,16,'SAN','South Andros');
INSERT INTO `l38sx_tienda_zones` VALUES (312,16,'SEL','South Eleuthera');
INSERT INTO `l38sx_tienda_zones` VALUES (313,16,'SWE','Spanish Wells');
INSERT INTO `l38sx_tienda_zones` VALUES (314,16,'WGB','West Grand Bahama');
INSERT INTO `l38sx_tienda_zones` VALUES (315,17,'CAP','Capital');
INSERT INTO `l38sx_tienda_zones` VALUES (316,17,'CEN','Central');
INSERT INTO `l38sx_tienda_zones` VALUES (317,17,'MUH','Muharraq');
INSERT INTO `l38sx_tienda_zones` VALUES (318,17,'NOR','Northern');
INSERT INTO `l38sx_tienda_zones` VALUES (319,17,'SOU','Southern');
INSERT INTO `l38sx_tienda_zones` VALUES (320,18,'BAR','Barisal');
INSERT INTO `l38sx_tienda_zones` VALUES (321,18,'CHI','Chittagong');
INSERT INTO `l38sx_tienda_zones` VALUES (322,18,'DHA','Dhaka');
INSERT INTO `l38sx_tienda_zones` VALUES (323,18,'KHU','Khulna');
INSERT INTO `l38sx_tienda_zones` VALUES (324,18,'RAJ','Rajshahi');
INSERT INTO `l38sx_tienda_zones` VALUES (325,18,'SYL','Sylhet');
INSERT INTO `l38sx_tienda_zones` VALUES (326,19,'CC','Christ Church');
INSERT INTO `l38sx_tienda_zones` VALUES (327,19,'AND','Saint Andrew');
INSERT INTO `l38sx_tienda_zones` VALUES (328,19,'GEO','Saint George');
INSERT INTO `l38sx_tienda_zones` VALUES (329,19,'JAM','Saint James');
INSERT INTO `l38sx_tienda_zones` VALUES (330,19,'JOH','Saint John');
INSERT INTO `l38sx_tienda_zones` VALUES (331,19,'JOS','Saint Joseph');
INSERT INTO `l38sx_tienda_zones` VALUES (332,19,'LUC','Saint Lucy');
INSERT INTO `l38sx_tienda_zones` VALUES (333,19,'MIC','Saint Michael');
INSERT INTO `l38sx_tienda_zones` VALUES (334,19,'PET','Saint Peter');
INSERT INTO `l38sx_tienda_zones` VALUES (335,19,'PHI','Saint Philip');
INSERT INTO `l38sx_tienda_zones` VALUES (336,19,'THO','Saint Thomas');
INSERT INTO `l38sx_tienda_zones` VALUES (337,20,'BR','Brestskaya (Brest)');
INSERT INTO `l38sx_tienda_zones` VALUES (338,20,'HO','Homyel\'skaya (Homyel\')');
INSERT INTO `l38sx_tienda_zones` VALUES (339,20,'HM','Horad Minsk');
INSERT INTO `l38sx_tienda_zones` VALUES (340,20,'HR','Hrodzyenskaya (Hrodna)');
INSERT INTO `l38sx_tienda_zones` VALUES (341,20,'MA','Mahilyowskaya (Mahilyow)');
INSERT INTO `l38sx_tienda_zones` VALUES (342,20,'MI','Minskaya');
INSERT INTO `l38sx_tienda_zones` VALUES (343,20,'VI','Vitsyebskaya (Vitsyebsk)');
INSERT INTO `l38sx_tienda_zones` VALUES (344,21,'VAN','Antwerpen');
INSERT INTO `l38sx_tienda_zones` VALUES (345,21,'WBR','Brabant Wallon');
INSERT INTO `l38sx_tienda_zones` VALUES (346,21,'WHT','Hainaut');
INSERT INTO `l38sx_tienda_zones` VALUES (347,21,'WLG','Liege');
INSERT INTO `l38sx_tienda_zones` VALUES (348,21,'VLI','Limburg');
INSERT INTO `l38sx_tienda_zones` VALUES (349,21,'WLX','Luxembourg');
INSERT INTO `l38sx_tienda_zones` VALUES (350,21,'WNA','Namur');
INSERT INTO `l38sx_tienda_zones` VALUES (351,21,'VOV','Oost-Vlaanderen');
INSERT INTO `l38sx_tienda_zones` VALUES (352,21,'VBR','Vlaams Brabant');
INSERT INTO `l38sx_tienda_zones` VALUES (353,21,'VWV','West-Vlaanderen');
INSERT INTO `l38sx_tienda_zones` VALUES (354,22,'BZ','Belize');
INSERT INTO `l38sx_tienda_zones` VALUES (355,22,'CY','Cayo');
INSERT INTO `l38sx_tienda_zones` VALUES (356,22,'CR','Corozal');
INSERT INTO `l38sx_tienda_zones` VALUES (357,22,'OW','Orange Walk');
INSERT INTO `l38sx_tienda_zones` VALUES (358,22,'SC','Stann Creek');
INSERT INTO `l38sx_tienda_zones` VALUES (359,22,'TO','Toledo');
INSERT INTO `l38sx_tienda_zones` VALUES (360,23,'AL','Alibori');
INSERT INTO `l38sx_tienda_zones` VALUES (361,23,'AK','Atakora');
INSERT INTO `l38sx_tienda_zones` VALUES (362,23,'AQ','Atlantique');
INSERT INTO `l38sx_tienda_zones` VALUES (363,23,'BO','Borgou');
INSERT INTO `l38sx_tienda_zones` VALUES (364,23,'CO','Collines');
INSERT INTO `l38sx_tienda_zones` VALUES (365,23,'DO','Donga');
INSERT INTO `l38sx_tienda_zones` VALUES (366,23,'KO','Kouffo');
INSERT INTO `l38sx_tienda_zones` VALUES (367,23,'LI','Littoral');
INSERT INTO `l38sx_tienda_zones` VALUES (368,23,'MO','Mono');
INSERT INTO `l38sx_tienda_zones` VALUES (369,23,'OU','Oueme');
INSERT INTO `l38sx_tienda_zones` VALUES (370,23,'PL','Plateau');
INSERT INTO `l38sx_tienda_zones` VALUES (371,23,'ZO','Zou');
INSERT INTO `l38sx_tienda_zones` VALUES (372,24,'DS','Devonshire');
INSERT INTO `l38sx_tienda_zones` VALUES (373,24,'HC','Hamilton City');
INSERT INTO `l38sx_tienda_zones` VALUES (374,24,'HA','Hamilton');
INSERT INTO `l38sx_tienda_zones` VALUES (375,24,'PG','Paget');
INSERT INTO `l38sx_tienda_zones` VALUES (376,24,'PB','Pembroke');
INSERT INTO `l38sx_tienda_zones` VALUES (377,24,'GC','Saint George City');
INSERT INTO `l38sx_tienda_zones` VALUES (378,24,'SG','Saint George\'s');
INSERT INTO `l38sx_tienda_zones` VALUES (379,24,'SA','Sandys');
INSERT INTO `l38sx_tienda_zones` VALUES (380,24,'SM','Smith\'s');
INSERT INTO `l38sx_tienda_zones` VALUES (381,24,'SH','Southampton');
INSERT INTO `l38sx_tienda_zones` VALUES (382,24,'WA','Warwick');
INSERT INTO `l38sx_tienda_zones` VALUES (383,25,'BUM','Bumthang');
INSERT INTO `l38sx_tienda_zones` VALUES (384,25,'CHU','Chukha');
INSERT INTO `l38sx_tienda_zones` VALUES (385,25,'DAG','Dagana');
INSERT INTO `l38sx_tienda_zones` VALUES (386,25,'GAS','Gasa');
INSERT INTO `l38sx_tienda_zones` VALUES (387,25,'HAA','Haa');
INSERT INTO `l38sx_tienda_zones` VALUES (388,25,'LHU','Lhuntse');
INSERT INTO `l38sx_tienda_zones` VALUES (389,25,'MON','Mongar');
INSERT INTO `l38sx_tienda_zones` VALUES (390,25,'PAR','Paro');
INSERT INTO `l38sx_tienda_zones` VALUES (391,25,'PEM','Pemagatshel');
INSERT INTO `l38sx_tienda_zones` VALUES (392,25,'PUN','Punakha');
INSERT INTO `l38sx_tienda_zones` VALUES (393,25,'SJO','Samdrup Jongkhar');
INSERT INTO `l38sx_tienda_zones` VALUES (394,25,'SAT','Samtse');
INSERT INTO `l38sx_tienda_zones` VALUES (395,25,'SAR','Sarpang');
INSERT INTO `l38sx_tienda_zones` VALUES (396,25,'THI','Thimphu');
INSERT INTO `l38sx_tienda_zones` VALUES (397,25,'TRG','Trashigang');
INSERT INTO `l38sx_tienda_zones` VALUES (398,25,'TRY','Trashiyangste');
INSERT INTO `l38sx_tienda_zones` VALUES (399,25,'TRO','Trongsa');
INSERT INTO `l38sx_tienda_zones` VALUES (400,25,'TSI','Tsirang');
INSERT INTO `l38sx_tienda_zones` VALUES (401,25,'WPH','Wangdue Phodrang');
INSERT INTO `l38sx_tienda_zones` VALUES (402,25,'ZHE','Zhemgang');
INSERT INTO `l38sx_tienda_zones` VALUES (403,26,'BEN','Beni');
INSERT INTO `l38sx_tienda_zones` VALUES (404,26,'CHU','Chuquisaca');
INSERT INTO `l38sx_tienda_zones` VALUES (405,26,'COC','Cochabamba');
INSERT INTO `l38sx_tienda_zones` VALUES (406,26,'LPZ','La Paz');
INSERT INTO `l38sx_tienda_zones` VALUES (407,26,'ORU','Oruro');
INSERT INTO `l38sx_tienda_zones` VALUES (408,26,'PAN','Pando');
INSERT INTO `l38sx_tienda_zones` VALUES (409,26,'POT','Potosi');
INSERT INTO `l38sx_tienda_zones` VALUES (410,26,'SCZ','Santa Cruz');
INSERT INTO `l38sx_tienda_zones` VALUES (411,26,'TAR','Tarija');
INSERT INTO `l38sx_tienda_zones` VALUES (412,27,'RS','Republika Srpska');
INSERT INTO `l38sx_tienda_zones` VALUES (413,27,'BRO','Brčko District');
INSERT INTO `l38sx_tienda_zones` VALUES (414,27,'FUS','Unsko-Sanski Kanton');
INSERT INTO `l38sx_tienda_zones` VALUES (415,27,'FPO','Posavski Kanton');
INSERT INTO `l38sx_tienda_zones` VALUES (416,27,'FTU','Tuzlanski Kanton');
INSERT INTO `l38sx_tienda_zones` VALUES (417,27,'FZE','Zeničko-Dobojski Kanton');
INSERT INTO `l38sx_tienda_zones` VALUES (418,27,'FBP','Bosanskopodrinjski Kanton');
INSERT INTO `l38sx_tienda_zones` VALUES (419,27,'FSB','Srednjebosanski Kanton');
INSERT INTO `l38sx_tienda_zones` VALUES (420,27,'FHN','Hercegovačko-neretvanski Kanton');
INSERT INTO `l38sx_tienda_zones` VALUES (421,27,'FZH','Zapadnohercegovački Kanton');
INSERT INTO `l38sx_tienda_zones` VALUES (422,27,'FSA','Kanton Sarajevo');
INSERT INTO `l38sx_tienda_zones` VALUES (423,27,'FZA','Zapadnobosanski Kanton');
INSERT INTO `l38sx_tienda_zones` VALUES (430,28,'CE','Central');
INSERT INTO `l38sx_tienda_zones` VALUES (431,28,'GH','Ghanzi');
INSERT INTO `l38sx_tienda_zones` VALUES (432,28,'KD','Kgalagadi');
INSERT INTO `l38sx_tienda_zones` VALUES (433,28,'KT','Kgatleng');
INSERT INTO `l38sx_tienda_zones` VALUES (434,28,'KW','Kweneng');
INSERT INTO `l38sx_tienda_zones` VALUES (435,28,'NG','Ngamiland');
INSERT INTO `l38sx_tienda_zones` VALUES (436,28,'NE','North East');
INSERT INTO `l38sx_tienda_zones` VALUES (437,28,'NW','North West');
INSERT INTO `l38sx_tienda_zones` VALUES (438,28,'SE','South East');
INSERT INTO `l38sx_tienda_zones` VALUES (439,28,'SO','Southern');
INSERT INTO `l38sx_tienda_zones` VALUES (440,30,'AC','Acre');
INSERT INTO `l38sx_tienda_zones` VALUES (441,30,'AL','Alagoas');
INSERT INTO `l38sx_tienda_zones` VALUES (442,30,'AP','Amapa');
INSERT INTO `l38sx_tienda_zones` VALUES (443,30,'AM','Amazonas');
INSERT INTO `l38sx_tienda_zones` VALUES (444,30,'BA','Bahia');
INSERT INTO `l38sx_tienda_zones` VALUES (445,30,'CE','Ceara');
INSERT INTO `l38sx_tienda_zones` VALUES (446,30,'DF','Distrito Federal');
INSERT INTO `l38sx_tienda_zones` VALUES (447,30,'ES','Espirito Santo');
INSERT INTO `l38sx_tienda_zones` VALUES (448,30,'GO','Goias');
INSERT INTO `l38sx_tienda_zones` VALUES (449,30,'MA','Maranhao');
INSERT INTO `l38sx_tienda_zones` VALUES (450,30,'MT','Mato Grosso');
INSERT INTO `l38sx_tienda_zones` VALUES (451,30,'MS','Mato Grosso do Sul');
INSERT INTO `l38sx_tienda_zones` VALUES (452,30,'MG','Minas Gerais');
INSERT INTO `l38sx_tienda_zones` VALUES (453,30,'PA','Para');
INSERT INTO `l38sx_tienda_zones` VALUES (454,30,'PB','Paraiba');
INSERT INTO `l38sx_tienda_zones` VALUES (455,30,'PR','Parana');
INSERT INTO `l38sx_tienda_zones` VALUES (456,30,'PE','Pernambuco');
INSERT INTO `l38sx_tienda_zones` VALUES (457,30,'PI','Piaui');
INSERT INTO `l38sx_tienda_zones` VALUES (458,30,'RJ','Rio de Janeiro');
INSERT INTO `l38sx_tienda_zones` VALUES (459,30,'RN','Rio Grande do Norte');
INSERT INTO `l38sx_tienda_zones` VALUES (460,30,'RS','Rio Grande do Sul');
INSERT INTO `l38sx_tienda_zones` VALUES (461,30,'RO','Rondonia');
INSERT INTO `l38sx_tienda_zones` VALUES (462,30,'RR','Roraima');
INSERT INTO `l38sx_tienda_zones` VALUES (463,30,'SC','Santa Catarina');
INSERT INTO `l38sx_tienda_zones` VALUES (464,30,'SP','Sao Paulo');
INSERT INTO `l38sx_tienda_zones` VALUES (465,30,'SE','Sergipe');
INSERT INTO `l38sx_tienda_zones` VALUES (466,30,'TO','Tocantins');
INSERT INTO `l38sx_tienda_zones` VALUES (467,31,'PB','Peros Banhos');
INSERT INTO `l38sx_tienda_zones` VALUES (468,31,'SI','Salomon Islands');
INSERT INTO `l38sx_tienda_zones` VALUES (469,31,'NI','Nelsons Island');
INSERT INTO `l38sx_tienda_zones` VALUES (470,31,'TB','Three Brothers');
INSERT INTO `l38sx_tienda_zones` VALUES (471,31,'EA','Eagle Islands');
INSERT INTO `l38sx_tienda_zones` VALUES (472,31,'DI','Danger Island');
INSERT INTO `l38sx_tienda_zones` VALUES (473,31,'EG','Egmont Islands');
INSERT INTO `l38sx_tienda_zones` VALUES (474,31,'DG','Diego Garcia');
INSERT INTO `l38sx_tienda_zones` VALUES (475,32,'BEL','Belait');
INSERT INTO `l38sx_tienda_zones` VALUES (476,32,'BRM','Brunei and Muara');
INSERT INTO `l38sx_tienda_zones` VALUES (477,32,'TEM','Temburong');
INSERT INTO `l38sx_tienda_zones` VALUES (478,32,'TUT','Tutong');
INSERT INTO `l38sx_tienda_zones` VALUES (479,33,'','Blagoevgrad');
INSERT INTO `l38sx_tienda_zones` VALUES (480,33,'','Burgas');
INSERT INTO `l38sx_tienda_zones` VALUES (481,33,'','Dobrich');
INSERT INTO `l38sx_tienda_zones` VALUES (482,33,'','Gabrovo');
INSERT INTO `l38sx_tienda_zones` VALUES (483,33,'','Haskovo');
INSERT INTO `l38sx_tienda_zones` VALUES (484,33,'','Kardjali');
INSERT INTO `l38sx_tienda_zones` VALUES (485,33,'','Kyustendil');
INSERT INTO `l38sx_tienda_zones` VALUES (486,33,'','Lovech');
INSERT INTO `l38sx_tienda_zones` VALUES (487,33,'','Montana');
INSERT INTO `l38sx_tienda_zones` VALUES (488,33,'','Pazardjik');
INSERT INTO `l38sx_tienda_zones` VALUES (489,33,'','Pernik');
INSERT INTO `l38sx_tienda_zones` VALUES (490,33,'','Pleven');
INSERT INTO `l38sx_tienda_zones` VALUES (491,33,'','Plovdiv');
INSERT INTO `l38sx_tienda_zones` VALUES (492,33,'','Razgrad');
INSERT INTO `l38sx_tienda_zones` VALUES (493,33,'','Shumen');
INSERT INTO `l38sx_tienda_zones` VALUES (494,33,'','Silistra');
INSERT INTO `l38sx_tienda_zones` VALUES (495,33,'','Sliven');
INSERT INTO `l38sx_tienda_zones` VALUES (496,33,'','Smolyan');
INSERT INTO `l38sx_tienda_zones` VALUES (497,33,'','Sofia');
INSERT INTO `l38sx_tienda_zones` VALUES (498,33,'','Sofia - town');
INSERT INTO `l38sx_tienda_zones` VALUES (499,33,'','Stara Zagora');
INSERT INTO `l38sx_tienda_zones` VALUES (500,33,'','Targovishte');
INSERT INTO `l38sx_tienda_zones` VALUES (501,33,'','Varna');
INSERT INTO `l38sx_tienda_zones` VALUES (502,33,'','Veliko Tarnovo');
INSERT INTO `l38sx_tienda_zones` VALUES (503,33,'','Vidin');
INSERT INTO `l38sx_tienda_zones` VALUES (504,33,'','Vratza');
INSERT INTO `l38sx_tienda_zones` VALUES (505,33,'','Yambol');
INSERT INTO `l38sx_tienda_zones` VALUES (506,34,'BAL','Bale');
INSERT INTO `l38sx_tienda_zones` VALUES (507,34,'BAM','Bam');
INSERT INTO `l38sx_tienda_zones` VALUES (508,34,'BAN','Banwa');
INSERT INTO `l38sx_tienda_zones` VALUES (509,34,'BAZ','Bazega');
INSERT INTO `l38sx_tienda_zones` VALUES (510,34,'BOR','Bougouriba');
INSERT INTO `l38sx_tienda_zones` VALUES (511,34,'BLG','Boulgou');
INSERT INTO `l38sx_tienda_zones` VALUES (512,34,'BOK','Boulkiemde');
INSERT INTO `l38sx_tienda_zones` VALUES (513,34,'COM','Comoe');
INSERT INTO `l38sx_tienda_zones` VALUES (514,34,'GAN','Ganzourgou');
INSERT INTO `l38sx_tienda_zones` VALUES (515,34,'GNA','Gnagna');
INSERT INTO `l38sx_tienda_zones` VALUES (516,34,'GOU','Gourma');
INSERT INTO `l38sx_tienda_zones` VALUES (517,34,'HOU','Houet');
INSERT INTO `l38sx_tienda_zones` VALUES (518,34,'IOA','Ioba');
INSERT INTO `l38sx_tienda_zones` VALUES (519,34,'KAD','Kadiogo');
INSERT INTO `l38sx_tienda_zones` VALUES (520,34,'KEN','Kenedougou');
INSERT INTO `l38sx_tienda_zones` VALUES (521,34,'KOD','Komondjari');
INSERT INTO `l38sx_tienda_zones` VALUES (522,34,'KOP','Kompienga');
INSERT INTO `l38sx_tienda_zones` VALUES (523,34,'KOS','Kossi');
INSERT INTO `l38sx_tienda_zones` VALUES (524,34,'KOL','Koulpelogo');
INSERT INTO `l38sx_tienda_zones` VALUES (525,34,'KOT','Kouritenga');
INSERT INTO `l38sx_tienda_zones` VALUES (526,34,'KOW','Kourweogo');
INSERT INTO `l38sx_tienda_zones` VALUES (527,34,'LER','Leraba');
INSERT INTO `l38sx_tienda_zones` VALUES (528,34,'LOR','Loroum');
INSERT INTO `l38sx_tienda_zones` VALUES (529,34,'MOU','Mouhoun');
INSERT INTO `l38sx_tienda_zones` VALUES (530,34,'NAH','Nahouri');
INSERT INTO `l38sx_tienda_zones` VALUES (531,34,'NAM','Namentenga');
INSERT INTO `l38sx_tienda_zones` VALUES (532,34,'NAY','Nayala');
INSERT INTO `l38sx_tienda_zones` VALUES (533,34,'NOU','Noumbiel');
INSERT INTO `l38sx_tienda_zones` VALUES (534,34,'OUB','Oubritenga');
INSERT INTO `l38sx_tienda_zones` VALUES (535,34,'OUD','Oudalan');
INSERT INTO `l38sx_tienda_zones` VALUES (536,34,'PAS','Passore');
INSERT INTO `l38sx_tienda_zones` VALUES (537,34,'PON','Poni');
INSERT INTO `l38sx_tienda_zones` VALUES (538,34,'SAG','Sanguie');
INSERT INTO `l38sx_tienda_zones` VALUES (539,34,'SAM','Sanmatenga');
INSERT INTO `l38sx_tienda_zones` VALUES (540,34,'SEN','Seno');
INSERT INTO `l38sx_tienda_zones` VALUES (541,34,'SIS','Sissili');
INSERT INTO `l38sx_tienda_zones` VALUES (542,34,'SOM','Soum');
INSERT INTO `l38sx_tienda_zones` VALUES (543,34,'SOR','Sourou');
INSERT INTO `l38sx_tienda_zones` VALUES (544,34,'TAP','Tapoa');
INSERT INTO `l38sx_tienda_zones` VALUES (545,34,'TUY','Tuy');
INSERT INTO `l38sx_tienda_zones` VALUES (546,34,'YAG','Yagha');
INSERT INTO `l38sx_tienda_zones` VALUES (547,34,'YAT','Yatenga');
INSERT INTO `l38sx_tienda_zones` VALUES (548,34,'ZIR','Ziro');
INSERT INTO `l38sx_tienda_zones` VALUES (549,34,'ZOD','Zondoma');
INSERT INTO `l38sx_tienda_zones` VALUES (550,34,'ZOW','Zoundweogo');
INSERT INTO `l38sx_tienda_zones` VALUES (551,35,'BB','Bubanza');
INSERT INTO `l38sx_tienda_zones` VALUES (552,35,'BJ','Bujumbura');
INSERT INTO `l38sx_tienda_zones` VALUES (553,35,'BR','Bururi');
INSERT INTO `l38sx_tienda_zones` VALUES (554,35,'CA','Cankuzo');
INSERT INTO `l38sx_tienda_zones` VALUES (555,35,'CI','Cibitoke');
INSERT INTO `l38sx_tienda_zones` VALUES (556,35,'GI','Gitega');
INSERT INTO `l38sx_tienda_zones` VALUES (557,35,'KR','Karuzi');
INSERT INTO `l38sx_tienda_zones` VALUES (558,35,'KY','Kayanza');
INSERT INTO `l38sx_tienda_zones` VALUES (559,35,'KI','Kirundo');
INSERT INTO `l38sx_tienda_zones` VALUES (560,35,'MA','Makamba');
INSERT INTO `l38sx_tienda_zones` VALUES (561,35,'MU','Muramvya');
INSERT INTO `l38sx_tienda_zones` VALUES (562,35,'MY','Muyinga');
INSERT INTO `l38sx_tienda_zones` VALUES (563,35,'MW','Mwaro');
INSERT INTO `l38sx_tienda_zones` VALUES (564,35,'NG','Ngozi');
INSERT INTO `l38sx_tienda_zones` VALUES (565,35,'RT','Rutana');
INSERT INTO `l38sx_tienda_zones` VALUES (566,35,'RY','Ruyigi');
INSERT INTO `l38sx_tienda_zones` VALUES (567,36,'PP','Phnom Penh');
INSERT INTO `l38sx_tienda_zones` VALUES (568,36,'PS','Preah Seihanu (Kompong Som or Sihanoukville)');
INSERT INTO `l38sx_tienda_zones` VALUES (569,36,'PA','Pailin');
INSERT INTO `l38sx_tienda_zones` VALUES (570,36,'KB','Keb');
INSERT INTO `l38sx_tienda_zones` VALUES (571,36,'BM','Banteay Meanchey');
INSERT INTO `l38sx_tienda_zones` VALUES (572,36,'BA','Battambang');
INSERT INTO `l38sx_tienda_zones` VALUES (573,36,'KM','Kampong Cham');
INSERT INTO `l38sx_tienda_zones` VALUES (574,36,'KN','Kampong Chhnang');
INSERT INTO `l38sx_tienda_zones` VALUES (575,36,'KU','Kampong Speu');
INSERT INTO `l38sx_tienda_zones` VALUES (576,36,'KO','Kampong Som');
INSERT INTO `l38sx_tienda_zones` VALUES (577,36,'KT','Kampong Thom');
INSERT INTO `l38sx_tienda_zones` VALUES (578,36,'KP','Kampot');
INSERT INTO `l38sx_tienda_zones` VALUES (579,36,'KL','Kandal');
INSERT INTO `l38sx_tienda_zones` VALUES (580,36,'KK','Kaoh Kong');
INSERT INTO `l38sx_tienda_zones` VALUES (581,36,'KR','Kratie');
INSERT INTO `l38sx_tienda_zones` VALUES (582,36,'MK','Mondul Kiri');
INSERT INTO `l38sx_tienda_zones` VALUES (583,36,'OM','Oddar Meancheay');
INSERT INTO `l38sx_tienda_zones` VALUES (584,36,'PU','Pursat');
INSERT INTO `l38sx_tienda_zones` VALUES (585,36,'PR','Preah Vihear');
INSERT INTO `l38sx_tienda_zones` VALUES (586,36,'PG','Prey Veng');
INSERT INTO `l38sx_tienda_zones` VALUES (587,36,'RK','Ratanak Kiri');
INSERT INTO `l38sx_tienda_zones` VALUES (588,36,'SI','Siemreap');
INSERT INTO `l38sx_tienda_zones` VALUES (589,36,'ST','Stung Treng');
INSERT INTO `l38sx_tienda_zones` VALUES (590,36,'SR','Svay Rieng');
INSERT INTO `l38sx_tienda_zones` VALUES (591,36,'TK','Takeo');
INSERT INTO `l38sx_tienda_zones` VALUES (592,37,'ADA','Adamawa (Adamaoua)');
INSERT INTO `l38sx_tienda_zones` VALUES (593,37,'CEN','Centre');
INSERT INTO `l38sx_tienda_zones` VALUES (594,37,'EST','East (Est)');
INSERT INTO `l38sx_tienda_zones` VALUES (595,37,'EXN','Extreme North (Extreme-Nord)');
INSERT INTO `l38sx_tienda_zones` VALUES (596,37,'LIT','Littoral');
INSERT INTO `l38sx_tienda_zones` VALUES (597,37,'NOR','North (Nord)');
INSERT INTO `l38sx_tienda_zones` VALUES (598,37,'NOT','Northwest (Nord-Ouest)');
INSERT INTO `l38sx_tienda_zones` VALUES (599,37,'OUE','West (Ouest)');
INSERT INTO `l38sx_tienda_zones` VALUES (600,37,'SUD','South (Sud)');
INSERT INTO `l38sx_tienda_zones` VALUES (601,37,'SOU','Southwest (Sud-Ouest).');
INSERT INTO `l38sx_tienda_zones` VALUES (602,38,'AB','Alberta');
INSERT INTO `l38sx_tienda_zones` VALUES (603,38,'BC','British Columbia');
INSERT INTO `l38sx_tienda_zones` VALUES (604,38,'MB','Manitoba');
INSERT INTO `l38sx_tienda_zones` VALUES (605,38,'NB','New Brunswick');
INSERT INTO `l38sx_tienda_zones` VALUES (606,38,'NL','Newfoundland and Labrador');
INSERT INTO `l38sx_tienda_zones` VALUES (607,38,'NT','Northwest Territories');
INSERT INTO `l38sx_tienda_zones` VALUES (608,38,'NS','Nova Scotia');
INSERT INTO `l38sx_tienda_zones` VALUES (609,38,'NU','Nunavut');
INSERT INTO `l38sx_tienda_zones` VALUES (610,38,'ON','Ontario');
INSERT INTO `l38sx_tienda_zones` VALUES (611,38,'PE','Prince Edward Island');
INSERT INTO `l38sx_tienda_zones` VALUES (612,38,'QC','Qu&eacute;bec');
INSERT INTO `l38sx_tienda_zones` VALUES (613,38,'SK','Saskatchewan');
INSERT INTO `l38sx_tienda_zones` VALUES (614,38,'YT','Yukon Territory');
INSERT INTO `l38sx_tienda_zones` VALUES (615,39,'BV','Boa Vista');
INSERT INTO `l38sx_tienda_zones` VALUES (616,39,'BR','Brava');
INSERT INTO `l38sx_tienda_zones` VALUES (617,39,'CS','Calheta de Sao Miguel');
INSERT INTO `l38sx_tienda_zones` VALUES (618,39,'MA','Maio');
INSERT INTO `l38sx_tienda_zones` VALUES (619,39,'MO','Mosteiros');
INSERT INTO `l38sx_tienda_zones` VALUES (620,39,'PA','Paul');
INSERT INTO `l38sx_tienda_zones` VALUES (621,39,'PN','Porto Novo');
INSERT INTO `l38sx_tienda_zones` VALUES (622,39,'PR','Praia');
INSERT INTO `l38sx_tienda_zones` VALUES (623,39,'RG','Ribeira Grande');
INSERT INTO `l38sx_tienda_zones` VALUES (624,39,'SL','Sal');
INSERT INTO `l38sx_tienda_zones` VALUES (625,39,'CA','Santa Catarina');
INSERT INTO `l38sx_tienda_zones` VALUES (626,39,'CR','Santa Cruz');
INSERT INTO `l38sx_tienda_zones` VALUES (627,39,'SD','Sao Domingos');
INSERT INTO `l38sx_tienda_zones` VALUES (628,39,'SF','Sao Filipe');
INSERT INTO `l38sx_tienda_zones` VALUES (629,39,'SN','Sao Nicolau');
INSERT INTO `l38sx_tienda_zones` VALUES (630,39,'SV','Sao Vicente');
INSERT INTO `l38sx_tienda_zones` VALUES (631,39,'TA','Tarrafal');
INSERT INTO `l38sx_tienda_zones` VALUES (632,40,'CR','Creek');
INSERT INTO `l38sx_tienda_zones` VALUES (633,40,'EA','Eastern');
INSERT INTO `l38sx_tienda_zones` VALUES (634,40,'ML','Midland');
INSERT INTO `l38sx_tienda_zones` VALUES (635,40,'ST','South Town');
INSERT INTO `l38sx_tienda_zones` VALUES (636,40,'SP','Spot Bay');
INSERT INTO `l38sx_tienda_zones` VALUES (637,40,'SK','Stake Bay');
INSERT INTO `l38sx_tienda_zones` VALUES (638,40,'WD','West End');
INSERT INTO `l38sx_tienda_zones` VALUES (639,40,'WN','Western');
INSERT INTO `l38sx_tienda_zones` VALUES (640,41,'BBA','Bamingui-Bangoran');
INSERT INTO `l38sx_tienda_zones` VALUES (641,41,'BKO','Basse-Kotto');
INSERT INTO `l38sx_tienda_zones` VALUES (642,41,'HKO','Haute-Kotto');
INSERT INTO `l38sx_tienda_zones` VALUES (643,41,'HMB','Haut-Mbomou');
INSERT INTO `l38sx_tienda_zones` VALUES (644,41,'KEM','Kemo');
INSERT INTO `l38sx_tienda_zones` VALUES (645,41,'LOB','Lobaye');
INSERT INTO `l38sx_tienda_zones` VALUES (646,41,'MKD','Mambéré-Kadéï');
INSERT INTO `l38sx_tienda_zones` VALUES (647,41,'MBO','Mbomou');
INSERT INTO `l38sx_tienda_zones` VALUES (648,41,'NMM','Nana-Mambere');
INSERT INTO `l38sx_tienda_zones` VALUES (649,41,'OMP','Ombella-M\'Poko');
INSERT INTO `l38sx_tienda_zones` VALUES (650,41,'OUK','Ouaka');
INSERT INTO `l38sx_tienda_zones` VALUES (651,41,'OUH','Ouham');
INSERT INTO `l38sx_tienda_zones` VALUES (652,41,'OPE','Ouham-Pende');
INSERT INTO `l38sx_tienda_zones` VALUES (653,41,'VAK','Vakaga');
INSERT INTO `l38sx_tienda_zones` VALUES (654,41,'NGR','Nana-Grebizi');
INSERT INTO `l38sx_tienda_zones` VALUES (655,41,'SMB','Sangha-Mbaere');
INSERT INTO `l38sx_tienda_zones` VALUES (656,41,'BAN','Bangui');
INSERT INTO `l38sx_tienda_zones` VALUES (657,42,'BA','Batha');
INSERT INTO `l38sx_tienda_zones` VALUES (658,42,'BI','Biltine');
INSERT INTO `l38sx_tienda_zones` VALUES (659,42,'BE','Borkou-Ennedi-Tibesti');
INSERT INTO `l38sx_tienda_zones` VALUES (660,42,'CB','Chari-Baguirmi');
INSERT INTO `l38sx_tienda_zones` VALUES (661,42,'GU','Guera');
INSERT INTO `l38sx_tienda_zones` VALUES (662,42,'KA','Kanem');
INSERT INTO `l38sx_tienda_zones` VALUES (663,42,'LA','Lac');
INSERT INTO `l38sx_tienda_zones` VALUES (664,42,'LC','Logone Occidental');
INSERT INTO `l38sx_tienda_zones` VALUES (665,42,'LR','Logone Oriental');
INSERT INTO `l38sx_tienda_zones` VALUES (666,42,'MK','Mayo-Kebbi');
INSERT INTO `l38sx_tienda_zones` VALUES (667,42,'MC','Moyen-Chari');
INSERT INTO `l38sx_tienda_zones` VALUES (668,42,'OU','Ouaddai');
INSERT INTO `l38sx_tienda_zones` VALUES (669,42,'SA','Salamat');
INSERT INTO `l38sx_tienda_zones` VALUES (670,42,'TA','Tandjile');
INSERT INTO `l38sx_tienda_zones` VALUES (671,43,'AI','Aisen del General Carlos Ibanez');
INSERT INTO `l38sx_tienda_zones` VALUES (672,43,'AN','Antofagasta');
INSERT INTO `l38sx_tienda_zones` VALUES (673,43,'AR','Araucania');
INSERT INTO `l38sx_tienda_zones` VALUES (674,43,'AT','Atacama');
INSERT INTO `l38sx_tienda_zones` VALUES (675,43,'BI','Bio-Bio');
INSERT INTO `l38sx_tienda_zones` VALUES (676,43,'CO','Coquimbo');
INSERT INTO `l38sx_tienda_zones` VALUES (677,43,'LI','Libertador General Bernardo O\'Hi');
INSERT INTO `l38sx_tienda_zones` VALUES (678,43,'LL','Los Lagos');
INSERT INTO `l38sx_tienda_zones` VALUES (679,43,'MA','Magallanes y de la Antartica Chi');
INSERT INTO `l38sx_tienda_zones` VALUES (680,43,'ML','Maule');
INSERT INTO `l38sx_tienda_zones` VALUES (681,43,'RM','Region Metropolitana');
INSERT INTO `l38sx_tienda_zones` VALUES (682,43,'TA','Tarapaca');
INSERT INTO `l38sx_tienda_zones` VALUES (683,43,'VS','Valparaiso');
INSERT INTO `l38sx_tienda_zones` VALUES (684,44,'AN','Anhui');
INSERT INTO `l38sx_tienda_zones` VALUES (685,44,'BE','Beijing');
INSERT INTO `l38sx_tienda_zones` VALUES (686,44,'CH','Chongqing');
INSERT INTO `l38sx_tienda_zones` VALUES (687,44,'FU','Fujian');
INSERT INTO `l38sx_tienda_zones` VALUES (688,44,'GA','Gansu');
INSERT INTO `l38sx_tienda_zones` VALUES (689,44,'GU','Guangdong');
INSERT INTO `l38sx_tienda_zones` VALUES (690,44,'GX','Guangxi');
INSERT INTO `l38sx_tienda_zones` VALUES (691,44,'GZ','Guizhou');
INSERT INTO `l38sx_tienda_zones` VALUES (692,44,'HA','Hainan');
INSERT INTO `l38sx_tienda_zones` VALUES (693,44,'HB','Hebei');
INSERT INTO `l38sx_tienda_zones` VALUES (694,44,'HL','Heilongjiang');
INSERT INTO `l38sx_tienda_zones` VALUES (695,44,'HE','Henan');
INSERT INTO `l38sx_tienda_zones` VALUES (696,44,'HK','Hong Kong');
INSERT INTO `l38sx_tienda_zones` VALUES (697,44,'HU','Hubei');
INSERT INTO `l38sx_tienda_zones` VALUES (698,44,'HN','Hunan');
INSERT INTO `l38sx_tienda_zones` VALUES (699,44,'IM','Inner Mongolia');
INSERT INTO `l38sx_tienda_zones` VALUES (700,44,'JI','Jiangsu');
INSERT INTO `l38sx_tienda_zones` VALUES (701,44,'JX','Jiangxi');
INSERT INTO `l38sx_tienda_zones` VALUES (702,44,'JL','Jilin');
INSERT INTO `l38sx_tienda_zones` VALUES (703,44,'LI','Liaoning');
INSERT INTO `l38sx_tienda_zones` VALUES (704,44,'MA','Macau');
INSERT INTO `l38sx_tienda_zones` VALUES (705,44,'NI','Ningxia');
INSERT INTO `l38sx_tienda_zones` VALUES (706,44,'SH','Shaanxi');
INSERT INTO `l38sx_tienda_zones` VALUES (707,44,'SA','Shandong');
INSERT INTO `l38sx_tienda_zones` VALUES (708,44,'SG','Shanghai');
INSERT INTO `l38sx_tienda_zones` VALUES (709,44,'SX','Shanxi');
INSERT INTO `l38sx_tienda_zones` VALUES (710,44,'SI','Sichuan');
INSERT INTO `l38sx_tienda_zones` VALUES (711,44,'TI','Tianjin');
INSERT INTO `l38sx_tienda_zones` VALUES (712,44,'XI','Xinjiang');
INSERT INTO `l38sx_tienda_zones` VALUES (713,44,'YU','Yunnan');
INSERT INTO `l38sx_tienda_zones` VALUES (714,44,'ZH','Zhejiang');
INSERT INTO `l38sx_tienda_zones` VALUES (715,46,'D','Direction Island');
INSERT INTO `l38sx_tienda_zones` VALUES (716,46,'H','Home Island');
INSERT INTO `l38sx_tienda_zones` VALUES (717,46,'O','Horsburgh Island');
INSERT INTO `l38sx_tienda_zones` VALUES (718,46,'S','South Island');
INSERT INTO `l38sx_tienda_zones` VALUES (719,46,'W','West Island');
INSERT INTO `l38sx_tienda_zones` VALUES (720,47,'AMZ','Amazonas');
INSERT INTO `l38sx_tienda_zones` VALUES (721,47,'ANT','Antioquia');
INSERT INTO `l38sx_tienda_zones` VALUES (722,47,'ARA','Arauca');
INSERT INTO `l38sx_tienda_zones` VALUES (723,47,'ATL','Atlantico');
INSERT INTO `l38sx_tienda_zones` VALUES (724,47,'BDC','Bogota D.C.');
INSERT INTO `l38sx_tienda_zones` VALUES (725,47,'BOL','Bolivar');
INSERT INTO `l38sx_tienda_zones` VALUES (726,47,'BOY','Boyaca');
INSERT INTO `l38sx_tienda_zones` VALUES (727,47,'CAL','Caldas');
INSERT INTO `l38sx_tienda_zones` VALUES (728,47,'CAQ','Caqueta');
INSERT INTO `l38sx_tienda_zones` VALUES (729,47,'CAS','Casanare');
INSERT INTO `l38sx_tienda_zones` VALUES (730,47,'CAU','Cauca');
INSERT INTO `l38sx_tienda_zones` VALUES (731,47,'CES','Cesar');
INSERT INTO `l38sx_tienda_zones` VALUES (732,47,'CHO','Choco');
INSERT INTO `l38sx_tienda_zones` VALUES (733,47,'COR','Cordoba');
INSERT INTO `l38sx_tienda_zones` VALUES (734,47,'CAM','Cundinamarca');
INSERT INTO `l38sx_tienda_zones` VALUES (735,47,'GNA','Guainia');
INSERT INTO `l38sx_tienda_zones` VALUES (736,47,'GJR','Guajira');
INSERT INTO `l38sx_tienda_zones` VALUES (737,47,'GVR','Guaviare');
INSERT INTO `l38sx_tienda_zones` VALUES (738,47,'HUI','Huila');
INSERT INTO `l38sx_tienda_zones` VALUES (739,47,'MAG','Magdalena');
INSERT INTO `l38sx_tienda_zones` VALUES (740,47,'MET','Meta');
INSERT INTO `l38sx_tienda_zones` VALUES (741,47,'NAR','Narino');
INSERT INTO `l38sx_tienda_zones` VALUES (742,47,'NDS','Norte de Santander');
INSERT INTO `l38sx_tienda_zones` VALUES (743,47,'PUT','Putumayo');
INSERT INTO `l38sx_tienda_zones` VALUES (744,47,'QUI','Quindio');
INSERT INTO `l38sx_tienda_zones` VALUES (745,47,'RIS','Risaralda');
INSERT INTO `l38sx_tienda_zones` VALUES (746,47,'SAP','San Andres y Providencia');
INSERT INTO `l38sx_tienda_zones` VALUES (747,47,'SAN','Santander');
INSERT INTO `l38sx_tienda_zones` VALUES (748,47,'SUC','Sucre');
INSERT INTO `l38sx_tienda_zones` VALUES (749,47,'TOL','Tolima');
INSERT INTO `l38sx_tienda_zones` VALUES (750,47,'VDC','Valle del Cauca');
INSERT INTO `l38sx_tienda_zones` VALUES (751,47,'VAU','Vaupes');
INSERT INTO `l38sx_tienda_zones` VALUES (752,47,'VIC','Vichada');
INSERT INTO `l38sx_tienda_zones` VALUES (753,48,'G','Grande Comore');
INSERT INTO `l38sx_tienda_zones` VALUES (754,48,'A','Anjouan');
INSERT INTO `l38sx_tienda_zones` VALUES (755,48,'M','Moheli');
INSERT INTO `l38sx_tienda_zones` VALUES (756,49,'BO','Bouenza');
INSERT INTO `l38sx_tienda_zones` VALUES (757,49,'BR','Brazzaville');
INSERT INTO `l38sx_tienda_zones` VALUES (758,49,'CU','Cuvette');
INSERT INTO `l38sx_tienda_zones` VALUES (759,49,'CO','Cuvette-Ouest');
INSERT INTO `l38sx_tienda_zones` VALUES (760,49,'KO','Kouilou');
INSERT INTO `l38sx_tienda_zones` VALUES (761,49,'LE','Lekoumou');
INSERT INTO `l38sx_tienda_zones` VALUES (762,49,'LI','Likouala');
INSERT INTO `l38sx_tienda_zones` VALUES (763,49,'NI','Niari');
INSERT INTO `l38sx_tienda_zones` VALUES (764,49,'PL','Plateaux');
INSERT INTO `l38sx_tienda_zones` VALUES (765,49,'PO','Pool');
INSERT INTO `l38sx_tienda_zones` VALUES (766,49,'SA','Sangha');
INSERT INTO `l38sx_tienda_zones` VALUES (767,50,'PU','Pukapuka');
INSERT INTO `l38sx_tienda_zones` VALUES (768,50,'RK','Rakahanga');
INSERT INTO `l38sx_tienda_zones` VALUES (769,50,'MK','Manihiki');
INSERT INTO `l38sx_tienda_zones` VALUES (770,50,'PE','Penrhyn');
INSERT INTO `l38sx_tienda_zones` VALUES (771,50,'NI','Nassau Island');
INSERT INTO `l38sx_tienda_zones` VALUES (772,50,'SU','Surwarrow');
INSERT INTO `l38sx_tienda_zones` VALUES (773,50,'PA','Palmerston');
INSERT INTO `l38sx_tienda_zones` VALUES (774,50,'AI','Aitutaki');
INSERT INTO `l38sx_tienda_zones` VALUES (775,50,'MA','Manuae');
INSERT INTO `l38sx_tienda_zones` VALUES (776,50,'TA','Takutea');
INSERT INTO `l38sx_tienda_zones` VALUES (777,50,'MT','Mitiaro');
INSERT INTO `l38sx_tienda_zones` VALUES (778,50,'AT','Atiu');
INSERT INTO `l38sx_tienda_zones` VALUES (779,50,'MU','Mauke');
INSERT INTO `l38sx_tienda_zones` VALUES (780,50,'RR','Rarotonga');
INSERT INTO `l38sx_tienda_zones` VALUES (781,50,'MG','Mangaia');
INSERT INTO `l38sx_tienda_zones` VALUES (782,51,'AL','Alajuela');
INSERT INTO `l38sx_tienda_zones` VALUES (783,51,'CA','Cartago');
INSERT INTO `l38sx_tienda_zones` VALUES (784,51,'GU','Guanacaste');
INSERT INTO `l38sx_tienda_zones` VALUES (785,51,'HE','Heredia');
INSERT INTO `l38sx_tienda_zones` VALUES (786,51,'LI','Limon');
INSERT INTO `l38sx_tienda_zones` VALUES (787,51,'PU','Puntarenas');
INSERT INTO `l38sx_tienda_zones` VALUES (788,51,'SJ','San Jose');
INSERT INTO `l38sx_tienda_zones` VALUES (789,52,'ABE','Abengourou');
INSERT INTO `l38sx_tienda_zones` VALUES (790,52,'ABI','Abidjan');
INSERT INTO `l38sx_tienda_zones` VALUES (791,52,'ABO','Aboisso');
INSERT INTO `l38sx_tienda_zones` VALUES (792,52,'ADI','Adiake');
INSERT INTO `l38sx_tienda_zones` VALUES (793,52,'ADZ','Adzope');
INSERT INTO `l38sx_tienda_zones` VALUES (794,52,'AGB','Agboville');
INSERT INTO `l38sx_tienda_zones` VALUES (795,52,'AGN','Agnibilekrou');
INSERT INTO `l38sx_tienda_zones` VALUES (796,52,'ALE','Alepe');
INSERT INTO `l38sx_tienda_zones` VALUES (797,52,'BOC','Bocanda');
INSERT INTO `l38sx_tienda_zones` VALUES (798,52,'BAN','Bangolo');
INSERT INTO `l38sx_tienda_zones` VALUES (799,52,'BEO','Beoumi');
INSERT INTO `l38sx_tienda_zones` VALUES (800,52,'BIA','Biankouma');
INSERT INTO `l38sx_tienda_zones` VALUES (801,52,'BDK','Bondoukou');
INSERT INTO `l38sx_tienda_zones` VALUES (802,52,'BGN','Bongouanou');
INSERT INTO `l38sx_tienda_zones` VALUES (803,52,'BFL','Bouafle');
INSERT INTO `l38sx_tienda_zones` VALUES (804,52,'BKE','Bouake');
INSERT INTO `l38sx_tienda_zones` VALUES (805,52,'BNA','Bouna');
INSERT INTO `l38sx_tienda_zones` VALUES (806,52,'BDL','Boundiali');
INSERT INTO `l38sx_tienda_zones` VALUES (807,52,'DKL','Dabakala');
INSERT INTO `l38sx_tienda_zones` VALUES (808,52,'DBU','Dabou');
INSERT INTO `l38sx_tienda_zones` VALUES (809,52,'DAL','Daloa');
INSERT INTO `l38sx_tienda_zones` VALUES (810,52,'DAN','Danane');
INSERT INTO `l38sx_tienda_zones` VALUES (811,52,'DAO','Daoukro');
INSERT INTO `l38sx_tienda_zones` VALUES (812,52,'DIM','Dimbokro');
INSERT INTO `l38sx_tienda_zones` VALUES (813,52,'DIV','Divo');
INSERT INTO `l38sx_tienda_zones` VALUES (814,52,'DUE','Duekoue');
INSERT INTO `l38sx_tienda_zones` VALUES (815,52,'FER','Ferkessedougou');
INSERT INTO `l38sx_tienda_zones` VALUES (816,52,'GAG','Gagnoa');
INSERT INTO `l38sx_tienda_zones` VALUES (817,52,'GBA','Grand-Bassam');
INSERT INTO `l38sx_tienda_zones` VALUES (818,52,'GLA','Grand-Lahou');
INSERT INTO `l38sx_tienda_zones` VALUES (819,52,'GUI','Guiglo');
INSERT INTO `l38sx_tienda_zones` VALUES (820,52,'ISS','Issia');
INSERT INTO `l38sx_tienda_zones` VALUES (821,52,'JAC','Jacqueville');
INSERT INTO `l38sx_tienda_zones` VALUES (822,52,'KAT','Katiola');
INSERT INTO `l38sx_tienda_zones` VALUES (823,52,'KOR','Korhogo');
INSERT INTO `l38sx_tienda_zones` VALUES (824,52,'LAK','Lakota');
INSERT INTO `l38sx_tienda_zones` VALUES (825,52,'MAN','Man');
INSERT INTO `l38sx_tienda_zones` VALUES (826,52,'MKN','Mankono');
INSERT INTO `l38sx_tienda_zones` VALUES (827,52,'MBA','Mbahiakro');
INSERT INTO `l38sx_tienda_zones` VALUES (828,52,'ODI','Odienne');
INSERT INTO `l38sx_tienda_zones` VALUES (829,52,'OUM','Oume');
INSERT INTO `l38sx_tienda_zones` VALUES (830,52,'SAK','Sakassou');
INSERT INTO `l38sx_tienda_zones` VALUES (831,52,'SPE','San-Pedro');
INSERT INTO `l38sx_tienda_zones` VALUES (832,52,'SAS','Sassandra');
INSERT INTO `l38sx_tienda_zones` VALUES (833,52,'SEG','Seguela');
INSERT INTO `l38sx_tienda_zones` VALUES (834,52,'SIN','Sinfra');
INSERT INTO `l38sx_tienda_zones` VALUES (835,52,'SOU','Soubre');
INSERT INTO `l38sx_tienda_zones` VALUES (836,52,'TAB','Tabou');
INSERT INTO `l38sx_tienda_zones` VALUES (837,52,'TAN','Tanda');
INSERT INTO `l38sx_tienda_zones` VALUES (838,52,'TIE','Tiebissou');
INSERT INTO `l38sx_tienda_zones` VALUES (839,52,'TIN','Tingrela');
INSERT INTO `l38sx_tienda_zones` VALUES (840,52,'TIA','Tiassale');
INSERT INTO `l38sx_tienda_zones` VALUES (841,52,'TBA','Touba');
INSERT INTO `l38sx_tienda_zones` VALUES (842,52,'TLP','Toulepleu');
INSERT INTO `l38sx_tienda_zones` VALUES (843,52,'TMD','Toumodi');
INSERT INTO `l38sx_tienda_zones` VALUES (844,52,'VAV','Vavoua');
INSERT INTO `l38sx_tienda_zones` VALUES (845,52,'YAM','Yamoussoukro');
INSERT INTO `l38sx_tienda_zones` VALUES (846,52,'ZUE','Zuenoula');
INSERT INTO `l38sx_tienda_zones` VALUES (847,53,'BB','Bjelovar-Bilogora');
INSERT INTO `l38sx_tienda_zones` VALUES (848,53,'CZ','City of Zagreb');
INSERT INTO `l38sx_tienda_zones` VALUES (849,53,'DN','Dubrovnik-Neretva');
INSERT INTO `l38sx_tienda_zones` VALUES (850,53,'IS','Istra');
INSERT INTO `l38sx_tienda_zones` VALUES (851,53,'KA','Karlovac');
INSERT INTO `l38sx_tienda_zones` VALUES (852,53,'KK','Koprivnica-Krizevci');
INSERT INTO `l38sx_tienda_zones` VALUES (853,53,'KZ','Krapina-Zagorje');
INSERT INTO `l38sx_tienda_zones` VALUES (854,53,'LS','Lika-Senj');
INSERT INTO `l38sx_tienda_zones` VALUES (855,53,'ME','Medimurje');
INSERT INTO `l38sx_tienda_zones` VALUES (856,53,'OB','Osijek-Baranja');
INSERT INTO `l38sx_tienda_zones` VALUES (857,53,'PS','Pozega-Slavonia');
INSERT INTO `l38sx_tienda_zones` VALUES (858,53,'PG','Primorje-Gorski Kotar');
INSERT INTO `l38sx_tienda_zones` VALUES (859,53,'SI','Sibenik');
INSERT INTO `l38sx_tienda_zones` VALUES (860,53,'SM','Sisak-Moslavina');
INSERT INTO `l38sx_tienda_zones` VALUES (861,53,'SB','Slavonski Brod-Posavina');
INSERT INTO `l38sx_tienda_zones` VALUES (862,53,'SD','Split-Dalmatia');
INSERT INTO `l38sx_tienda_zones` VALUES (863,53,'VA','Varazdin');
INSERT INTO `l38sx_tienda_zones` VALUES (864,53,'VP','Virovitica-Podravina');
INSERT INTO `l38sx_tienda_zones` VALUES (865,53,'VS','Vukovar-Srijem');
INSERT INTO `l38sx_tienda_zones` VALUES (866,53,'ZK','Zadar-Knin');
INSERT INTO `l38sx_tienda_zones` VALUES (867,53,'ZA','Zagreb');
INSERT INTO `l38sx_tienda_zones` VALUES (868,54,'CA','Camaguey');
INSERT INTO `l38sx_tienda_zones` VALUES (869,54,'CD','Ciego de Avila');
INSERT INTO `l38sx_tienda_zones` VALUES (870,54,'CI','Cienfuegos');
INSERT INTO `l38sx_tienda_zones` VALUES (871,54,'CH','Ciudad de La Habana');
INSERT INTO `l38sx_tienda_zones` VALUES (872,54,'GR','Granma');
INSERT INTO `l38sx_tienda_zones` VALUES (873,54,'GU','Guantanamo');
INSERT INTO `l38sx_tienda_zones` VALUES (874,54,'HO','Holguin');
INSERT INTO `l38sx_tienda_zones` VALUES (875,54,'IJ','Isla de la Juventud');
INSERT INTO `l38sx_tienda_zones` VALUES (876,54,'LH','La Habana');
INSERT INTO `l38sx_tienda_zones` VALUES (877,54,'LT','Las Tunas');
INSERT INTO `l38sx_tienda_zones` VALUES (878,54,'MA','Matanzas');
INSERT INTO `l38sx_tienda_zones` VALUES (879,54,'PR','Pinar del Rio');
INSERT INTO `l38sx_tienda_zones` VALUES (880,54,'SS','Sancti Spiritus');
INSERT INTO `l38sx_tienda_zones` VALUES (881,54,'SC','Santiago de Cuba');
INSERT INTO `l38sx_tienda_zones` VALUES (882,54,'VC','Villa Clara');
INSERT INTO `l38sx_tienda_zones` VALUES (883,55,'F','Famagusta');
INSERT INTO `l38sx_tienda_zones` VALUES (884,55,'K','Kyrenia');
INSERT INTO `l38sx_tienda_zones` VALUES (885,55,'A','Larnaca');
INSERT INTO `l38sx_tienda_zones` VALUES (886,55,'I','Limassol');
INSERT INTO `l38sx_tienda_zones` VALUES (887,55,'N','Nicosia');
INSERT INTO `l38sx_tienda_zones` VALUES (888,55,'P','Paphos');
INSERT INTO `l38sx_tienda_zones` VALUES (889,56,'U','Ustecky');
INSERT INTO `l38sx_tienda_zones` VALUES (890,56,'C','Jihocesky');
INSERT INTO `l38sx_tienda_zones` VALUES (891,56,'B','Jihomoravsky');
INSERT INTO `l38sx_tienda_zones` VALUES (892,56,'K','Karlovarsky');
INSERT INTO `l38sx_tienda_zones` VALUES (893,56,'H','Kralovehradecky');
INSERT INTO `l38sx_tienda_zones` VALUES (894,56,'L','Liberecky');
INSERT INTO `l38sx_tienda_zones` VALUES (895,56,'T','Moravskoslezsky');
INSERT INTO `l38sx_tienda_zones` VALUES (896,56,'M','Olomoucky');
INSERT INTO `l38sx_tienda_zones` VALUES (897,56,'E','Pardubicky');
INSERT INTO `l38sx_tienda_zones` VALUES (898,56,'P','Plzensky');
INSERT INTO `l38sx_tienda_zones` VALUES (899,56,'A','Praha');
INSERT INTO `l38sx_tienda_zones` VALUES (900,56,'S','Stredocesky');
INSERT INTO `l38sx_tienda_zones` VALUES (901,56,'J','Vysocina');
INSERT INTO `l38sx_tienda_zones` VALUES (902,56,'Z','Zlinsky');
INSERT INTO `l38sx_tienda_zones` VALUES (903,57,'HS','Hovedstaden');
INSERT INTO `l38sx_tienda_zones` VALUES (904,57,'MJ','Midtjylland');
INSERT INTO `l38sx_tienda_zones` VALUES (905,57,'ND','Nordjylland');
INSERT INTO `l38sx_tienda_zones` VALUES (906,57,'SL','Sjælland');
INSERT INTO `l38sx_tienda_zones` VALUES (907,57,'SD','Syddanmark');
INSERT INTO `l38sx_tienda_zones` VALUES (908,57,'FO','Faroe Islands');
INSERT INTO `l38sx_tienda_zones` VALUES (909,57,'GL','Greenland');
INSERT INTO `l38sx_tienda_zones` VALUES (919,58,'S','\'Ali Sabih');
INSERT INTO `l38sx_tienda_zones` VALUES (920,58,'K','Dikhil');
INSERT INTO `l38sx_tienda_zones` VALUES (921,58,'J','Djibouti');
INSERT INTO `l38sx_tienda_zones` VALUES (922,58,'O','Obock');
INSERT INTO `l38sx_tienda_zones` VALUES (923,58,'T','Tadjoura');
INSERT INTO `l38sx_tienda_zones` VALUES (924,59,'AND','Saint Andrew Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (925,59,'DAV','Saint David Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (926,59,'GEO','Saint George Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (927,59,'JOH','Saint John Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (928,59,'JOS','Saint Joseph Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (929,59,'LUK','Saint Luke Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (930,59,'MAR','Saint Mark Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (931,59,'PAT','Saint Patrick Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (932,59,'PAU','Saint Paul Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (933,59,'PET','Saint Peter Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (934,60,'DN','Distrito Nacional');
INSERT INTO `l38sx_tienda_zones` VALUES (935,60,'AZ','Azua');
INSERT INTO `l38sx_tienda_zones` VALUES (936,60,'BC','Baoruco');
INSERT INTO `l38sx_tienda_zones` VALUES (937,60,'BH','Barahona');
INSERT INTO `l38sx_tienda_zones` VALUES (938,60,'DJ','Dajabon');
INSERT INTO `l38sx_tienda_zones` VALUES (939,60,'DU','Duarte');
INSERT INTO `l38sx_tienda_zones` VALUES (940,60,'EL','Elias Pina');
INSERT INTO `l38sx_tienda_zones` VALUES (941,60,'SY','El Seybo');
INSERT INTO `l38sx_tienda_zones` VALUES (942,60,'ET','Espaillat');
INSERT INTO `l38sx_tienda_zones` VALUES (943,60,'HM','Hato Mayor');
INSERT INTO `l38sx_tienda_zones` VALUES (944,60,'IN','Independencia');
INSERT INTO `l38sx_tienda_zones` VALUES (945,60,'AL','La Altagracia');
INSERT INTO `l38sx_tienda_zones` VALUES (946,60,'RO','La Romana');
INSERT INTO `l38sx_tienda_zones` VALUES (947,60,'VE','La Vega');
INSERT INTO `l38sx_tienda_zones` VALUES (948,60,'MT','Maria Trinidad Sanchez');
INSERT INTO `l38sx_tienda_zones` VALUES (949,60,'MN','Monsenor Nouel');
INSERT INTO `l38sx_tienda_zones` VALUES (950,60,'MC','Monte Cristi');
INSERT INTO `l38sx_tienda_zones` VALUES (951,60,'MP','Monte Plata');
INSERT INTO `l38sx_tienda_zones` VALUES (952,60,'PD','Pedernales');
INSERT INTO `l38sx_tienda_zones` VALUES (953,60,'PR','Peravia (Bani)');
INSERT INTO `l38sx_tienda_zones` VALUES (954,60,'PP','Puerto Plata');
INSERT INTO `l38sx_tienda_zones` VALUES (955,60,'SL','Salcedo');
INSERT INTO `l38sx_tienda_zones` VALUES (956,60,'SM','Samana');
INSERT INTO `l38sx_tienda_zones` VALUES (957,60,'SH','Sanchez Ramirez');
INSERT INTO `l38sx_tienda_zones` VALUES (958,60,'SC','San Cristobal');
INSERT INTO `l38sx_tienda_zones` VALUES (959,60,'JO','San Jose de Ocoa');
INSERT INTO `l38sx_tienda_zones` VALUES (960,60,'SJ','San Juan');
INSERT INTO `l38sx_tienda_zones` VALUES (961,60,'PM','San Pedro de Macoris');
INSERT INTO `l38sx_tienda_zones` VALUES (962,60,'SA','Santiago');
INSERT INTO `l38sx_tienda_zones` VALUES (963,60,'ST','Santiago Rodriguez');
INSERT INTO `l38sx_tienda_zones` VALUES (964,60,'SD','Santo Domingo');
INSERT INTO `l38sx_tienda_zones` VALUES (965,60,'VA','Valverde');
INSERT INTO `l38sx_tienda_zones` VALUES (966,61,'AL','Aileu');
INSERT INTO `l38sx_tienda_zones` VALUES (967,61,'AN','Ainaro');
INSERT INTO `l38sx_tienda_zones` VALUES (968,61,'BA','Baucau');
INSERT INTO `l38sx_tienda_zones` VALUES (969,61,'BO','Bobonaro');
INSERT INTO `l38sx_tienda_zones` VALUES (970,61,'CO','Cova Lima');
INSERT INTO `l38sx_tienda_zones` VALUES (971,61,'DI','Dili');
INSERT INTO `l38sx_tienda_zones` VALUES (972,61,'ER','Ermera');
INSERT INTO `l38sx_tienda_zones` VALUES (973,61,'LA','Lautem');
INSERT INTO `l38sx_tienda_zones` VALUES (974,61,'LI','Liquica');
INSERT INTO `l38sx_tienda_zones` VALUES (975,61,'MT','Manatuto');
INSERT INTO `l38sx_tienda_zones` VALUES (976,61,'MF','Manufahi');
INSERT INTO `l38sx_tienda_zones` VALUES (977,61,'OE','Oecussi');
INSERT INTO `l38sx_tienda_zones` VALUES (978,61,'VI','Viqueque');
INSERT INTO `l38sx_tienda_zones` VALUES (979,62,'AZU','Azuay');
INSERT INTO `l38sx_tienda_zones` VALUES (980,62,'BOL','Bolivar');
INSERT INTO `l38sx_tienda_zones` VALUES (981,62,'CAN','Ca&ntilde;ar');
INSERT INTO `l38sx_tienda_zones` VALUES (982,62,'CAR','Carchi');
INSERT INTO `l38sx_tienda_zones` VALUES (983,62,'CHI','Chimborazo');
INSERT INTO `l38sx_tienda_zones` VALUES (984,62,'COT','Cotopaxi');
INSERT INTO `l38sx_tienda_zones` VALUES (985,62,'EOR','El Oro');
INSERT INTO `l38sx_tienda_zones` VALUES (986,62,'ESM','Esmeraldas');
INSERT INTO `l38sx_tienda_zones` VALUES (987,62,'GPS','Gal&aacute;pagos');
INSERT INTO `l38sx_tienda_zones` VALUES (988,62,'GUA','Guayas');
INSERT INTO `l38sx_tienda_zones` VALUES (989,62,'IMB','Imbabura');
INSERT INTO `l38sx_tienda_zones` VALUES (990,62,'LOJ','Loja');
INSERT INTO `l38sx_tienda_zones` VALUES (991,62,'LRO','Los Rios');
INSERT INTO `l38sx_tienda_zones` VALUES (992,62,'MAN','Manab&iacute;');
INSERT INTO `l38sx_tienda_zones` VALUES (993,62,'MSA','Morona Santiago');
INSERT INTO `l38sx_tienda_zones` VALUES (994,62,'NAP','Napo');
INSERT INTO `l38sx_tienda_zones` VALUES (995,62,'ORE','Orellana');
INSERT INTO `l38sx_tienda_zones` VALUES (996,62,'PAS','Pastaza');
INSERT INTO `l38sx_tienda_zones` VALUES (997,62,'PIC','Pichincha');
INSERT INTO `l38sx_tienda_zones` VALUES (998,62,'SUC','Sucumb&iacute;os');
INSERT INTO `l38sx_tienda_zones` VALUES (999,62,'TUN','Tungurahua');
INSERT INTO `l38sx_tienda_zones` VALUES (1000,62,'ZCH','Zamora Chinchipe');
INSERT INTO `l38sx_tienda_zones` VALUES (1001,63,'DHY','Ad Daqahliyah');
INSERT INTO `l38sx_tienda_zones` VALUES (1002,63,'BAM','Al Bahr al Ahmar');
INSERT INTO `l38sx_tienda_zones` VALUES (1003,63,'BHY','Al Buhayrah');
INSERT INTO `l38sx_tienda_zones` VALUES (1004,63,'FYM','Al Fayyum');
INSERT INTO `l38sx_tienda_zones` VALUES (1005,63,'GBY','Al Gharbiyah');
INSERT INTO `l38sx_tienda_zones` VALUES (1006,63,'IDR','Al Iskandariyah');
INSERT INTO `l38sx_tienda_zones` VALUES (1007,63,'IML','Al Isma\'iliyah');
INSERT INTO `l38sx_tienda_zones` VALUES (1008,63,'JZH','Al Jizah');
INSERT INTO `l38sx_tienda_zones` VALUES (1009,63,'MFY','Al Minufiyah');
INSERT INTO `l38sx_tienda_zones` VALUES (1010,63,'MNY','Al Minya');
INSERT INTO `l38sx_tienda_zones` VALUES (1011,63,'QHR','Al Qahirah');
INSERT INTO `l38sx_tienda_zones` VALUES (1012,63,'QLY','Al Qalyubiyah');
INSERT INTO `l38sx_tienda_zones` VALUES (1013,63,'WJD','Al Wadi al Jadid');
INSERT INTO `l38sx_tienda_zones` VALUES (1014,63,'SHQ','Ash Sharqiyah');
INSERT INTO `l38sx_tienda_zones` VALUES (1015,63,'SWY','As Suways');
INSERT INTO `l38sx_tienda_zones` VALUES (1016,63,'ASW','Aswan');
INSERT INTO `l38sx_tienda_zones` VALUES (1017,63,'ASY','Asyut');
INSERT INTO `l38sx_tienda_zones` VALUES (1018,63,'BSW','Bani Suwayf');
INSERT INTO `l38sx_tienda_zones` VALUES (1019,63,'BSD','Bur Sa\'id');
INSERT INTO `l38sx_tienda_zones` VALUES (1020,63,'DMY','Dumyat');
INSERT INTO `l38sx_tienda_zones` VALUES (1021,63,'JNS','Janub Sina\'');
INSERT INTO `l38sx_tienda_zones` VALUES (1022,63,'KSH','Kafr ash Shaykh');
INSERT INTO `l38sx_tienda_zones` VALUES (1023,63,'MAT','Matruh');
INSERT INTO `l38sx_tienda_zones` VALUES (1024,63,'QIN','Qina');
INSERT INTO `l38sx_tienda_zones` VALUES (1025,63,'SHS','Shamal Sina\'');
INSERT INTO `l38sx_tienda_zones` VALUES (1026,63,'SUH','Suhaj');
INSERT INTO `l38sx_tienda_zones` VALUES (1027,64,'AH','Ahuachapan');
INSERT INTO `l38sx_tienda_zones` VALUES (1028,64,'CA','Cabanas');
INSERT INTO `l38sx_tienda_zones` VALUES (1029,64,'CH','Chalatenango');
INSERT INTO `l38sx_tienda_zones` VALUES (1030,64,'CU','Cuscatlan');
INSERT INTO `l38sx_tienda_zones` VALUES (1031,64,'LB','La Libertad');
INSERT INTO `l38sx_tienda_zones` VALUES (1032,64,'PZ','La Paz');
INSERT INTO `l38sx_tienda_zones` VALUES (1033,64,'UN','La Union');
INSERT INTO `l38sx_tienda_zones` VALUES (1034,64,'MO','Morazan');
INSERT INTO `l38sx_tienda_zones` VALUES (1035,64,'SM','San Miguel');
INSERT INTO `l38sx_tienda_zones` VALUES (1036,64,'SS','San Salvador');
INSERT INTO `l38sx_tienda_zones` VALUES (1037,64,'SV','San Vicente');
INSERT INTO `l38sx_tienda_zones` VALUES (1038,64,'SA','Santa Ana');
INSERT INTO `l38sx_tienda_zones` VALUES (1039,64,'SO','Sonsonate');
INSERT INTO `l38sx_tienda_zones` VALUES (1040,64,'US','Usulutan');
INSERT INTO `l38sx_tienda_zones` VALUES (1041,65,'AN','Provincia Annobon');
INSERT INTO `l38sx_tienda_zones` VALUES (1042,65,'BN','Provincia Bioko Norte');
INSERT INTO `l38sx_tienda_zones` VALUES (1043,65,'BS','Provincia Bioko Sur');
INSERT INTO `l38sx_tienda_zones` VALUES (1044,65,'CS','Provincia Centro Sur');
INSERT INTO `l38sx_tienda_zones` VALUES (1045,65,'KN','Provincia Kie-Ntem');
INSERT INTO `l38sx_tienda_zones` VALUES (1046,65,'LI','Provincia Litoral');
INSERT INTO `l38sx_tienda_zones` VALUES (1047,65,'WN','Provincia Wele-Nzas');
INSERT INTO `l38sx_tienda_zones` VALUES (1048,66,'MA','Central (Maekel)');
INSERT INTO `l38sx_tienda_zones` VALUES (1049,66,'KE','Anseba (Keren)');
INSERT INTO `l38sx_tienda_zones` VALUES (1050,66,'DK','Southern Red Sea (Debub-Keih-Bahri)');
INSERT INTO `l38sx_tienda_zones` VALUES (1051,66,'SK','Northern Red Sea (Semien-Keih-Bahri)');
INSERT INTO `l38sx_tienda_zones` VALUES (1052,66,'DE','Southern (Debub)');
INSERT INTO `l38sx_tienda_zones` VALUES (1053,66,'BR','Gash-Barka (Barentu)');
INSERT INTO `l38sx_tienda_zones` VALUES (1054,67,'HA','Harjumaa (Tallinn)');
INSERT INTO `l38sx_tienda_zones` VALUES (1055,67,'HI','Hiiumaa (Kardla)');
INSERT INTO `l38sx_tienda_zones` VALUES (1056,67,'IV','Ida-Virumaa (Johvi)');
INSERT INTO `l38sx_tienda_zones` VALUES (1057,67,'JA','Jarvamaa (Paide)');
INSERT INTO `l38sx_tienda_zones` VALUES (1058,67,'JO','Jogevamaa (Jogeva)');
INSERT INTO `l38sx_tienda_zones` VALUES (1059,67,'LV','Laane-Virumaa (Rakvere)');
INSERT INTO `l38sx_tienda_zones` VALUES (1060,67,'LA','Laanemaa (Haapsalu)');
INSERT INTO `l38sx_tienda_zones` VALUES (1061,67,'PA','Parnumaa (Parnu)');
INSERT INTO `l38sx_tienda_zones` VALUES (1062,67,'PO','Polvamaa (Polva)');
INSERT INTO `l38sx_tienda_zones` VALUES (1063,67,'RA','Raplamaa (Rapla)');
INSERT INTO `l38sx_tienda_zones` VALUES (1064,67,'SA','Saaremaa (Kuessaare)');
INSERT INTO `l38sx_tienda_zones` VALUES (1065,67,'TA','Tartumaa (Tartu)');
INSERT INTO `l38sx_tienda_zones` VALUES (1066,67,'VA','Valgamaa (Valga)');
INSERT INTO `l38sx_tienda_zones` VALUES (1067,67,'VI','Viljandimaa (Viljandi)');
INSERT INTO `l38sx_tienda_zones` VALUES (1068,67,'VO','Vorumaa (Voru)');
INSERT INTO `l38sx_tienda_zones` VALUES (1069,68,'AF','Afar');
INSERT INTO `l38sx_tienda_zones` VALUES (1070,68,'AH','Amhara');
INSERT INTO `l38sx_tienda_zones` VALUES (1071,68,'BG','Benishangul-Gumaz');
INSERT INTO `l38sx_tienda_zones` VALUES (1072,68,'GB','Gambela');
INSERT INTO `l38sx_tienda_zones` VALUES (1073,68,'HR','Hariai');
INSERT INTO `l38sx_tienda_zones` VALUES (1074,68,'OR','Oromia');
INSERT INTO `l38sx_tienda_zones` VALUES (1075,68,'SM','Somali');
INSERT INTO `l38sx_tienda_zones` VALUES (1076,68,'SN','Southern Nations - Nationalities and Peoples Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1077,68,'TG','Tigray');
INSERT INTO `l38sx_tienda_zones` VALUES (1078,68,'AA','Addis Ababa');
INSERT INTO `l38sx_tienda_zones` VALUES (1079,68,'DD','Dire Dawa');
INSERT INTO `l38sx_tienda_zones` VALUES (1080,71,'C','Central Division');
INSERT INTO `l38sx_tienda_zones` VALUES (1081,71,'N','Northern Division');
INSERT INTO `l38sx_tienda_zones` VALUES (1082,71,'E','Eastern Division');
INSERT INTO `l38sx_tienda_zones` VALUES (1083,71,'W','Western Division');
INSERT INTO `l38sx_tienda_zones` VALUES (1084,71,'R','Rotuma');
INSERT INTO `l38sx_tienda_zones` VALUES (1085,72,'AL','Ahvenanmaan Laani');
INSERT INTO `l38sx_tienda_zones` VALUES (1086,72,'ES','Etela-Suomen Laani');
INSERT INTO `l38sx_tienda_zones` VALUES (1087,72,'IS','Ita-Suomen Laani');
INSERT INTO `l38sx_tienda_zones` VALUES (1088,72,'LS','Lansi-Suomen Laani');
INSERT INTO `l38sx_tienda_zones` VALUES (1089,72,'LA','Lapin Lanani');
INSERT INTO `l38sx_tienda_zones` VALUES (1090,72,'OU','Oulun Laani');
INSERT INTO `l38sx_tienda_zones` VALUES (1091,73,'AL','Alsace');
INSERT INTO `l38sx_tienda_zones` VALUES (1092,73,'AQ','Aquitaine');
INSERT INTO `l38sx_tienda_zones` VALUES (1093,73,'AU','Auvergne');
INSERT INTO `l38sx_tienda_zones` VALUES (1094,73,'BR','Brittany');
INSERT INTO `l38sx_tienda_zones` VALUES (1095,73,'BU','Burgundy');
INSERT INTO `l38sx_tienda_zones` VALUES (1096,73,'CE','Center Loire Valley');
INSERT INTO `l38sx_tienda_zones` VALUES (1097,73,'CH','Champagne');
INSERT INTO `l38sx_tienda_zones` VALUES (1098,73,'CO','Corse');
INSERT INTO `l38sx_tienda_zones` VALUES (1099,73,'FR','France Comte');
INSERT INTO `l38sx_tienda_zones` VALUES (1100,73,'LA','Languedoc Roussillon');
INSERT INTO `l38sx_tienda_zones` VALUES (1101,73,'LI','Limousin');
INSERT INTO `l38sx_tienda_zones` VALUES (1102,73,'LO','Lorraine');
INSERT INTO `l38sx_tienda_zones` VALUES (1103,73,'MI','Midi Pyrenees');
INSERT INTO `l38sx_tienda_zones` VALUES (1104,73,'NO','Nord Pas de Calais');
INSERT INTO `l38sx_tienda_zones` VALUES (1105,73,'NR','Normandy');
INSERT INTO `l38sx_tienda_zones` VALUES (1106,73,'PA','Paris / Ill de France');
INSERT INTO `l38sx_tienda_zones` VALUES (1107,73,'PI','Picardie');
INSERT INTO `l38sx_tienda_zones` VALUES (1108,73,'PO','Poitou Charente');
INSERT INTO `l38sx_tienda_zones` VALUES (1109,73,'PR','Provence');
INSERT INTO `l38sx_tienda_zones` VALUES (1110,73,'RH','Rhone Alps');
INSERT INTO `l38sx_tienda_zones` VALUES (1111,73,'RI','Riviera');
INSERT INTO `l38sx_tienda_zones` VALUES (1112,73,'WE','Western Loire Valley');
INSERT INTO `l38sx_tienda_zones` VALUES (1113,74,'Et','Etranger');
INSERT INTO `l38sx_tienda_zones` VALUES (1114,74,'01','Ain');
INSERT INTO `l38sx_tienda_zones` VALUES (1115,74,'02','Aisne');
INSERT INTO `l38sx_tienda_zones` VALUES (1116,74,'03','Allier');
INSERT INTO `l38sx_tienda_zones` VALUES (1117,74,'04','Alpes de Haute Provence');
INSERT INTO `l38sx_tienda_zones` VALUES (1118,74,'05','Hautes-Alpes');
INSERT INTO `l38sx_tienda_zones` VALUES (1119,74,'06','Alpes Maritimes');
INSERT INTO `l38sx_tienda_zones` VALUES (1120,74,'07','Ard&egrave;che');
INSERT INTO `l38sx_tienda_zones` VALUES (1121,74,'08','Ardennes');
INSERT INTO `l38sx_tienda_zones` VALUES (1122,74,'09','Ari&egrave;ge');
INSERT INTO `l38sx_tienda_zones` VALUES (1123,74,'10','Aube');
INSERT INTO `l38sx_tienda_zones` VALUES (1124,74,'11','Aude');
INSERT INTO `l38sx_tienda_zones` VALUES (1125,74,'12','Aveyron');
INSERT INTO `l38sx_tienda_zones` VALUES (1126,74,'13','Bouches du Rh&ocirc;ne');
INSERT INTO `l38sx_tienda_zones` VALUES (1127,74,'14','Calvados');
INSERT INTO `l38sx_tienda_zones` VALUES (1128,74,'15','Cantal');
INSERT INTO `l38sx_tienda_zones` VALUES (1129,74,'16','Charente');
INSERT INTO `l38sx_tienda_zones` VALUES (1130,74,'17','Charente Maritime');
INSERT INTO `l38sx_tienda_zones` VALUES (1131,74,'18','Cher');
INSERT INTO `l38sx_tienda_zones` VALUES (1132,74,'19','Corr&egrave;ze');
INSERT INTO `l38sx_tienda_zones` VALUES (1133,74,'2A','Corse du Sud');
INSERT INTO `l38sx_tienda_zones` VALUES (1134,74,'2B','Haute Corse');
INSERT INTO `l38sx_tienda_zones` VALUES (1135,74,'21','C&ocirc;te d&#039;or');
INSERT INTO `l38sx_tienda_zones` VALUES (1136,74,'22','C&ocirc;tes d&#039;Armor');
INSERT INTO `l38sx_tienda_zones` VALUES (1137,74,'23','Creuse');
INSERT INTO `l38sx_tienda_zones` VALUES (1138,74,'24','Dordogne');
INSERT INTO `l38sx_tienda_zones` VALUES (1139,74,'25','Doubs');
INSERT INTO `l38sx_tienda_zones` VALUES (1140,74,'26','Dr&ocirc;me');
INSERT INTO `l38sx_tienda_zones` VALUES (1141,74,'27','Eure');
INSERT INTO `l38sx_tienda_zones` VALUES (1142,74,'28','Eure et Loir');
INSERT INTO `l38sx_tienda_zones` VALUES (1143,74,'29','Finist&egrave;re');
INSERT INTO `l38sx_tienda_zones` VALUES (1144,74,'30','Gard');
INSERT INTO `l38sx_tienda_zones` VALUES (1145,74,'31','Haute Garonne');
INSERT INTO `l38sx_tienda_zones` VALUES (1146,74,'32','Gers');
INSERT INTO `l38sx_tienda_zones` VALUES (1147,74,'33','Gironde');
INSERT INTO `l38sx_tienda_zones` VALUES (1148,74,'34','H&eacute;rault');
INSERT INTO `l38sx_tienda_zones` VALUES (1149,74,'35','Ille et Vilaine');
INSERT INTO `l38sx_tienda_zones` VALUES (1150,74,'36','Indre');
INSERT INTO `l38sx_tienda_zones` VALUES (1151,74,'37','Indre et Loire');
INSERT INTO `l38sx_tienda_zones` VALUES (1152,74,'38','Is&eacute;re');
INSERT INTO `l38sx_tienda_zones` VALUES (1153,74,'39','Jura');
INSERT INTO `l38sx_tienda_zones` VALUES (1154,74,'40','Landes');
INSERT INTO `l38sx_tienda_zones` VALUES (1155,74,'41','Loir et Cher');
INSERT INTO `l38sx_tienda_zones` VALUES (1156,74,'42','Loire');
INSERT INTO `l38sx_tienda_zones` VALUES (1157,74,'43','Haute Loire');
INSERT INTO `l38sx_tienda_zones` VALUES (1158,74,'44','Loire Atlantique');
INSERT INTO `l38sx_tienda_zones` VALUES (1159,74,'45','Loiret');
INSERT INTO `l38sx_tienda_zones` VALUES (1160,74,'46','Lot');
INSERT INTO `l38sx_tienda_zones` VALUES (1161,74,'47','Lot et Garonne');
INSERT INTO `l38sx_tienda_zones` VALUES (1162,74,'48','Loz&egrave;re');
INSERT INTO `l38sx_tienda_zones` VALUES (1163,74,'49','Maine et Loire');
INSERT INTO `l38sx_tienda_zones` VALUES (1164,74,'50','Manche');
INSERT INTO `l38sx_tienda_zones` VALUES (1165,74,'51','Marne');
INSERT INTO `l38sx_tienda_zones` VALUES (1166,74,'52','Haute Marne');
INSERT INTO `l38sx_tienda_zones` VALUES (1167,74,'53','Mayenne');
INSERT INTO `l38sx_tienda_zones` VALUES (1168,74,'54','Meurthe et Moselle');
INSERT INTO `l38sx_tienda_zones` VALUES (1169,74,'55','Meuse');
INSERT INTO `l38sx_tienda_zones` VALUES (1170,74,'56','Morbihan');
INSERT INTO `l38sx_tienda_zones` VALUES (1171,74,'57','Moselle');
INSERT INTO `l38sx_tienda_zones` VALUES (1172,74,'58','Ni&egrave;vre');
INSERT INTO `l38sx_tienda_zones` VALUES (1173,74,'59','Nord');
INSERT INTO `l38sx_tienda_zones` VALUES (1174,74,'60','Oise');
INSERT INTO `l38sx_tienda_zones` VALUES (1175,74,'61','Orne');
INSERT INTO `l38sx_tienda_zones` VALUES (1176,74,'62','Pas de Calais');
INSERT INTO `l38sx_tienda_zones` VALUES (1177,74,'63','Puy de D&ocirc;me');
INSERT INTO `l38sx_tienda_zones` VALUES (1178,74,'64','Pyr&eacute;n&eacute;es Atlantiques');
INSERT INTO `l38sx_tienda_zones` VALUES (1179,74,'65','Hautes Pyr&eacute;n&eacute;es');
INSERT INTO `l38sx_tienda_zones` VALUES (1180,74,'66','Pyr&eacute;n&eacute;es Orientales');
INSERT INTO `l38sx_tienda_zones` VALUES (1181,74,'67','Bas Rhin');
INSERT INTO `l38sx_tienda_zones` VALUES (1182,74,'68','Haut Rhin');
INSERT INTO `l38sx_tienda_zones` VALUES (1183,74,'69','Rh&ocirc;ne');
INSERT INTO `l38sx_tienda_zones` VALUES (1184,74,'70','Haute Sa&ocirc;ne');
INSERT INTO `l38sx_tienda_zones` VALUES (1185,74,'71','Sa&ocirc;ne et Loire');
INSERT INTO `l38sx_tienda_zones` VALUES (1186,74,'72','Sarthe');
INSERT INTO `l38sx_tienda_zones` VALUES (1187,74,'73','Savoie');
INSERT INTO `l38sx_tienda_zones` VALUES (1188,74,'74','Haute Savoie');
INSERT INTO `l38sx_tienda_zones` VALUES (1189,74,'75','Paris');
INSERT INTO `l38sx_tienda_zones` VALUES (1190,74,'76','Seine Maritime');
INSERT INTO `l38sx_tienda_zones` VALUES (1191,74,'77','Seine et Marne');
INSERT INTO `l38sx_tienda_zones` VALUES (1192,74,'78','Yvelines');
INSERT INTO `l38sx_tienda_zones` VALUES (1193,74,'79','Deux S&egrave;vres');
INSERT INTO `l38sx_tienda_zones` VALUES (1194,74,'80','Somme');
INSERT INTO `l38sx_tienda_zones` VALUES (1195,74,'81','Tarn');
INSERT INTO `l38sx_tienda_zones` VALUES (1196,74,'82','Tarn et Garonne');
INSERT INTO `l38sx_tienda_zones` VALUES (1197,74,'83','Var');
INSERT INTO `l38sx_tienda_zones` VALUES (1198,74,'84','Vaucluse');
INSERT INTO `l38sx_tienda_zones` VALUES (1199,74,'85','Vend&eacute;e');
INSERT INTO `l38sx_tienda_zones` VALUES (1200,74,'86','Vienne');
INSERT INTO `l38sx_tienda_zones` VALUES (1201,74,'87','Haute Vienne');
INSERT INTO `l38sx_tienda_zones` VALUES (1202,74,'88','Vosges');
INSERT INTO `l38sx_tienda_zones` VALUES (1203,74,'89','Yonne');
INSERT INTO `l38sx_tienda_zones` VALUES (1204,74,'90','Territoire de Belfort');
INSERT INTO `l38sx_tienda_zones` VALUES (1205,74,'91','Essonne');
INSERT INTO `l38sx_tienda_zones` VALUES (1206,74,'92','Hauts de Seine');
INSERT INTO `l38sx_tienda_zones` VALUES (1207,74,'93','Seine St-Denis');
INSERT INTO `l38sx_tienda_zones` VALUES (1208,74,'94','Val de Marne');
INSERT INTO `l38sx_tienda_zones` VALUES (1209,74,'95','Val d\'Oise');
INSERT INTO `l38sx_tienda_zones` VALUES (1210,76,'M','Archipel des Marquises');
INSERT INTO `l38sx_tienda_zones` VALUES (1211,76,'T','Archipel des Tuamotu');
INSERT INTO `l38sx_tienda_zones` VALUES (1212,76,'I','Archipel des Tubuai');
INSERT INTO `l38sx_tienda_zones` VALUES (1213,76,'V','Iles du Vent');
INSERT INTO `l38sx_tienda_zones` VALUES (1214,76,'S','Iles Sous-le-Vent');
INSERT INTO `l38sx_tienda_zones` VALUES (1215,77,'C','Iles Crozet');
INSERT INTO `l38sx_tienda_zones` VALUES (1216,77,'K','Iles Kerguelen');
INSERT INTO `l38sx_tienda_zones` VALUES (1217,77,'A','Ile Amsterdam');
INSERT INTO `l38sx_tienda_zones` VALUES (1218,77,'P','Ile Saint-Paul');
INSERT INTO `l38sx_tienda_zones` VALUES (1219,77,'D','Adelie Land');
INSERT INTO `l38sx_tienda_zones` VALUES (1220,78,'ES','Estuaire');
INSERT INTO `l38sx_tienda_zones` VALUES (1221,78,'HO','Haut-Ogooue');
INSERT INTO `l38sx_tienda_zones` VALUES (1222,78,'MO','Moyen-Ogooue');
INSERT INTO `l38sx_tienda_zones` VALUES (1223,78,'NG','Ngounie');
INSERT INTO `l38sx_tienda_zones` VALUES (1224,78,'NY','Nyanga');
INSERT INTO `l38sx_tienda_zones` VALUES (1225,78,'OI','Ogooue-Ivindo');
INSERT INTO `l38sx_tienda_zones` VALUES (1226,78,'OL','Ogooue-Lolo');
INSERT INTO `l38sx_tienda_zones` VALUES (1227,78,'OM','Ogooue-Maritime');
INSERT INTO `l38sx_tienda_zones` VALUES (1228,78,'WN','Woleu-Ntem');
INSERT INTO `l38sx_tienda_zones` VALUES (1229,79,'BJ','Banjul');
INSERT INTO `l38sx_tienda_zones` VALUES (1230,79,'BS','Basse');
INSERT INTO `l38sx_tienda_zones` VALUES (1231,79,'BR','Brikama');
INSERT INTO `l38sx_tienda_zones` VALUES (1232,79,'JA','Janjangbure');
INSERT INTO `l38sx_tienda_zones` VALUES (1233,79,'KA','Kanifeng');
INSERT INTO `l38sx_tienda_zones` VALUES (1234,79,'KE','Kerewan');
INSERT INTO `l38sx_tienda_zones` VALUES (1235,79,'KU','Kuntaur');
INSERT INTO `l38sx_tienda_zones` VALUES (1236,79,'MA','Mansakonko');
INSERT INTO `l38sx_tienda_zones` VALUES (1237,79,'LR','Lower River');
INSERT INTO `l38sx_tienda_zones` VALUES (1238,79,'CR','Central River');
INSERT INTO `l38sx_tienda_zones` VALUES (1239,79,'NB','North Bank');
INSERT INTO `l38sx_tienda_zones` VALUES (1240,79,'UR','Upper River');
INSERT INTO `l38sx_tienda_zones` VALUES (1241,79,'WE','Western');
INSERT INTO `l38sx_tienda_zones` VALUES (1242,80,'AB','Abkhazia');
INSERT INTO `l38sx_tienda_zones` VALUES (1243,80,'AJ','Ajaria');
INSERT INTO `l38sx_tienda_zones` VALUES (1244,80,'TB','Tbilisi');
INSERT INTO `l38sx_tienda_zones` VALUES (1245,80,'GU','Guria');
INSERT INTO `l38sx_tienda_zones` VALUES (1246,80,'IM','Imereti');
INSERT INTO `l38sx_tienda_zones` VALUES (1247,80,'KA','Kakheti');
INSERT INTO `l38sx_tienda_zones` VALUES (1248,80,'KK','Kvemo Kartli');
INSERT INTO `l38sx_tienda_zones` VALUES (1249,80,'MM','Mtskheta-Mtianeti');
INSERT INTO `l38sx_tienda_zones` VALUES (1250,80,'RL','Racha Lechkhumi and Kvemo Svanet');
INSERT INTO `l38sx_tienda_zones` VALUES (1251,80,'SZ','Samegrelo-Zemo Svaneti');
INSERT INTO `l38sx_tienda_zones` VALUES (1252,80,'SJ','Samtskhe-Javakheti');
INSERT INTO `l38sx_tienda_zones` VALUES (1253,80,'SK','Shida Kartli');
INSERT INTO `l38sx_tienda_zones` VALUES (1254,81,'BAW','Baden-W&uuml;rttemberg');
INSERT INTO `l38sx_tienda_zones` VALUES (1255,81,'BAY','Bayern');
INSERT INTO `l38sx_tienda_zones` VALUES (1256,81,'BER','Berlin');
INSERT INTO `l38sx_tienda_zones` VALUES (1257,81,'BRG','Brandenburg');
INSERT INTO `l38sx_tienda_zones` VALUES (1258,81,'BRE','Bremen');
INSERT INTO `l38sx_tienda_zones` VALUES (1259,81,'HAM','Hamburg');
INSERT INTO `l38sx_tienda_zones` VALUES (1260,81,'HES','Hessen');
INSERT INTO `l38sx_tienda_zones` VALUES (1261,81,'MEC','Mecklenburg-Vorpommern');
INSERT INTO `l38sx_tienda_zones` VALUES (1262,81,'NDS','Niedersachsen');
INSERT INTO `l38sx_tienda_zones` VALUES (1263,81,'NRW','Nordrhein-Westfalen');
INSERT INTO `l38sx_tienda_zones` VALUES (1264,81,'RHE','Rheinland-Pfalz');
INSERT INTO `l38sx_tienda_zones` VALUES (1265,81,'SAR','Saarland');
INSERT INTO `l38sx_tienda_zones` VALUES (1266,81,'SAS','Sachsen');
INSERT INTO `l38sx_tienda_zones` VALUES (1267,81,'SAC','Sachsen-Anhalt');
INSERT INTO `l38sx_tienda_zones` VALUES (1268,81,'SCN','Schleswig-Holstein');
INSERT INTO `l38sx_tienda_zones` VALUES (1269,81,'THE','Th&uuml;ringen');
INSERT INTO `l38sx_tienda_zones` VALUES (1270,82,'AS','Ashanti Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1271,82,'BA','Brong-Ahafo Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1272,82,'CE','Central Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1273,82,'EA','Eastern Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1274,82,'GA','Greater Accra Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1275,82,'NO','Northern Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1276,82,'UE','Upper East Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1277,82,'UW','Upper West Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1278,82,'VO','Volta Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1279,82,'WE','Western Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1280,84,'AT','Attica');
INSERT INTO `l38sx_tienda_zones` VALUES (1281,84,'CN','Central Greece');
INSERT INTO `l38sx_tienda_zones` VALUES (1282,84,'CM','Central Macedonia');
INSERT INTO `l38sx_tienda_zones` VALUES (1283,84,'CR','Crete');
INSERT INTO `l38sx_tienda_zones` VALUES (1284,84,'EM','East Macedonia and Thrace');
INSERT INTO `l38sx_tienda_zones` VALUES (1285,84,'EP','Epirus');
INSERT INTO `l38sx_tienda_zones` VALUES (1286,84,'II','Ionian Islands');
INSERT INTO `l38sx_tienda_zones` VALUES (1287,84,'NA','North Aegean');
INSERT INTO `l38sx_tienda_zones` VALUES (1288,84,'PP','Peloponnesos');
INSERT INTO `l38sx_tienda_zones` VALUES (1289,84,'SA','South Aegean');
INSERT INTO `l38sx_tienda_zones` VALUES (1290,84,'TH','Thessaly');
INSERT INTO `l38sx_tienda_zones` VALUES (1291,84,'WG','West Greece');
INSERT INTO `l38sx_tienda_zones` VALUES (1292,84,'WM','West Macedonia');
INSERT INTO `l38sx_tienda_zones` VALUES (1293,85,'A','Avannaa');
INSERT INTO `l38sx_tienda_zones` VALUES (1294,85,'T','Tunu');
INSERT INTO `l38sx_tienda_zones` VALUES (1295,85,'K','Kitaa');
INSERT INTO `l38sx_tienda_zones` VALUES (1296,86,'A','Saint Andrew');
INSERT INTO `l38sx_tienda_zones` VALUES (1297,86,'D','Saint David');
INSERT INTO `l38sx_tienda_zones` VALUES (1298,86,'G','Saint George');
INSERT INTO `l38sx_tienda_zones` VALUES (1299,86,'J','Saint John');
INSERT INTO `l38sx_tienda_zones` VALUES (1300,86,'M','Saint Mark');
INSERT INTO `l38sx_tienda_zones` VALUES (1301,86,'P','Saint Patrick');
INSERT INTO `l38sx_tienda_zones` VALUES (1302,86,'C','Carriacou');
INSERT INTO `l38sx_tienda_zones` VALUES (1303,86,'Q','Petit Martinique');
INSERT INTO `l38sx_tienda_zones` VALUES (1304,89,'AV','Alta Verapaz');
INSERT INTO `l38sx_tienda_zones` VALUES (1305,89,'BV','Baja Verapaz');
INSERT INTO `l38sx_tienda_zones` VALUES (1306,89,'CM','Chimaltenango');
INSERT INTO `l38sx_tienda_zones` VALUES (1307,89,'CQ','Chiquimula');
INSERT INTO `l38sx_tienda_zones` VALUES (1308,89,'PE','El Peten');
INSERT INTO `l38sx_tienda_zones` VALUES (1309,89,'PR','El Progreso');
INSERT INTO `l38sx_tienda_zones` VALUES (1310,89,'QC','El Quiche');
INSERT INTO `l38sx_tienda_zones` VALUES (1311,89,'ES','Escuintla');
INSERT INTO `l38sx_tienda_zones` VALUES (1312,89,'GU','Guatemala');
INSERT INTO `l38sx_tienda_zones` VALUES (1313,89,'HU','Huehuetenango');
INSERT INTO `l38sx_tienda_zones` VALUES (1314,89,'IZ','Izabal');
INSERT INTO `l38sx_tienda_zones` VALUES (1315,89,'JA','Jalapa');
INSERT INTO `l38sx_tienda_zones` VALUES (1316,89,'JU','Jutiapa');
INSERT INTO `l38sx_tienda_zones` VALUES (1317,89,'QZ','Quetzaltenango');
INSERT INTO `l38sx_tienda_zones` VALUES (1318,89,'RE','Retalhuleu');
INSERT INTO `l38sx_tienda_zones` VALUES (1319,89,'ST','Sacatepequez');
INSERT INTO `l38sx_tienda_zones` VALUES (1320,89,'SM','San Marcos');
INSERT INTO `l38sx_tienda_zones` VALUES (1321,89,'SR','Santa Rosa');
INSERT INTO `l38sx_tienda_zones` VALUES (1322,89,'SO','Solola');
INSERT INTO `l38sx_tienda_zones` VALUES (1323,89,'SU','Suchitepequez');
INSERT INTO `l38sx_tienda_zones` VALUES (1324,89,'TO','Totonicapan');
INSERT INTO `l38sx_tienda_zones` VALUES (1325,89,'ZA','Zacapa');
INSERT INTO `l38sx_tienda_zones` VALUES (1326,90,'CNK','Conakry');
INSERT INTO `l38sx_tienda_zones` VALUES (1327,90,'BYL','Beyla');
INSERT INTO `l38sx_tienda_zones` VALUES (1328,90,'BFA','Boffa');
INSERT INTO `l38sx_tienda_zones` VALUES (1329,90,'BOK','Boke');
INSERT INTO `l38sx_tienda_zones` VALUES (1330,90,'COY','Coyah');
INSERT INTO `l38sx_tienda_zones` VALUES (1331,90,'DBL','Dabola');
INSERT INTO `l38sx_tienda_zones` VALUES (1332,90,'DLB','Dalaba');
INSERT INTO `l38sx_tienda_zones` VALUES (1333,90,'DGR','Dinguiraye');
INSERT INTO `l38sx_tienda_zones` VALUES (1334,90,'DBR','Dubreka');
INSERT INTO `l38sx_tienda_zones` VALUES (1335,90,'FRN','Faranah');
INSERT INTO `l38sx_tienda_zones` VALUES (1336,90,'FRC','Forecariah');
INSERT INTO `l38sx_tienda_zones` VALUES (1337,90,'FRI','Fria');
INSERT INTO `l38sx_tienda_zones` VALUES (1338,90,'GAO','Gaoual');
INSERT INTO `l38sx_tienda_zones` VALUES (1339,90,'GCD','Gueckedou');
INSERT INTO `l38sx_tienda_zones` VALUES (1340,90,'KNK','Kankan');
INSERT INTO `l38sx_tienda_zones` VALUES (1341,90,'KRN','Kerouane');
INSERT INTO `l38sx_tienda_zones` VALUES (1342,90,'KND','Kindia');
INSERT INTO `l38sx_tienda_zones` VALUES (1343,90,'KSD','Kissidougou');
INSERT INTO `l38sx_tienda_zones` VALUES (1344,90,'KBA','Koubia');
INSERT INTO `l38sx_tienda_zones` VALUES (1345,90,'KDA','Koundara');
INSERT INTO `l38sx_tienda_zones` VALUES (1346,90,'KRA','Kouroussa');
INSERT INTO `l38sx_tienda_zones` VALUES (1347,90,'LAB','Labe');
INSERT INTO `l38sx_tienda_zones` VALUES (1348,90,'LLM','Lelouma');
INSERT INTO `l38sx_tienda_zones` VALUES (1349,90,'LOL','Lola');
INSERT INTO `l38sx_tienda_zones` VALUES (1350,90,'MCT','Macenta');
INSERT INTO `l38sx_tienda_zones` VALUES (1351,90,'MAL','Mali');
INSERT INTO `l38sx_tienda_zones` VALUES (1352,90,'MAM','Mamou');
INSERT INTO `l38sx_tienda_zones` VALUES (1353,90,'MAN','Mandiana');
INSERT INTO `l38sx_tienda_zones` VALUES (1354,90,'NZR','Nzerekore');
INSERT INTO `l38sx_tienda_zones` VALUES (1355,90,'PIT','Pita');
INSERT INTO `l38sx_tienda_zones` VALUES (1356,90,'SIG','Siguiri');
INSERT INTO `l38sx_tienda_zones` VALUES (1357,90,'TLM','Telimele');
INSERT INTO `l38sx_tienda_zones` VALUES (1358,90,'TOG','Tougue');
INSERT INTO `l38sx_tienda_zones` VALUES (1359,90,'YOM','Yomou');
INSERT INTO `l38sx_tienda_zones` VALUES (1360,91,'BF','Bafata Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1361,91,'BB','Biombo Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1362,91,'BS','Bissau Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1363,91,'BL','Bolama Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1364,91,'CA','Cacheu Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1365,91,'GA','Gabu Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1366,91,'OI','Oio Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1367,91,'QU','Quinara Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1368,91,'TO','Tombali Region');
INSERT INTO `l38sx_tienda_zones` VALUES (1369,92,'BW','Barima-Waini');
INSERT INTO `l38sx_tienda_zones` VALUES (1370,92,'CM','Cuyuni-Mazaruni');
INSERT INTO `l38sx_tienda_zones` VALUES (1371,92,'DM','Demerara-Mahaica');
INSERT INTO `l38sx_tienda_zones` VALUES (1372,92,'EC','East Berbice-Corentyne');
INSERT INTO `l38sx_tienda_zones` VALUES (1373,92,'EW','Essequibo Islands-West Demerara');
INSERT INTO `l38sx_tienda_zones` VALUES (1374,92,'MB','Mahaica-Berbice');
INSERT INTO `l38sx_tienda_zones` VALUES (1375,92,'PM','Pomeroon-Supenaam');
INSERT INTO `l38sx_tienda_zones` VALUES (1376,92,'PI','Potaro-Siparuni');
INSERT INTO `l38sx_tienda_zones` VALUES (1377,92,'UD','Upper Demerara-Berbice');
INSERT INTO `l38sx_tienda_zones` VALUES (1378,92,'UT','Upper Takutu-Upper Essequibo');
INSERT INTO `l38sx_tienda_zones` VALUES (1379,93,'AR','Artibonite');
INSERT INTO `l38sx_tienda_zones` VALUES (1380,93,'CE','Centre');
INSERT INTO `l38sx_tienda_zones` VALUES (1381,93,'GA','Grand\'Anse');
INSERT INTO `l38sx_tienda_zones` VALUES (1382,93,'ND','Nord');
INSERT INTO `l38sx_tienda_zones` VALUES (1383,93,'NE','Nord-Est');
INSERT INTO `l38sx_tienda_zones` VALUES (1384,93,'NO','Nord-Ouest');
INSERT INTO `l38sx_tienda_zones` VALUES (1385,93,'OU','Ouest');
INSERT INTO `l38sx_tienda_zones` VALUES (1386,93,'SD','Sud');
INSERT INTO `l38sx_tienda_zones` VALUES (1387,93,'SE','Sud-Est');
INSERT INTO `l38sx_tienda_zones` VALUES (1388,94,'F','Flat Island');
INSERT INTO `l38sx_tienda_zones` VALUES (1389,94,'M','McDonald Island');
INSERT INTO `l38sx_tienda_zones` VALUES (1390,94,'S','Shag Island');
INSERT INTO `l38sx_tienda_zones` VALUES (1391,94,'H','Heard Island');
INSERT INTO `l38sx_tienda_zones` VALUES (1392,95,'AT','Atlantida');
INSERT INTO `l38sx_tienda_zones` VALUES (1393,95,'CH','Choluteca');
INSERT INTO `l38sx_tienda_zones` VALUES (1394,95,'CL','Colon');
INSERT INTO `l38sx_tienda_zones` VALUES (1395,95,'CM','Comayagua');
INSERT INTO `l38sx_tienda_zones` VALUES (1396,95,'CP','Copan');
INSERT INTO `l38sx_tienda_zones` VALUES (1397,95,'CR','Cortes');
INSERT INTO `l38sx_tienda_zones` VALUES (1398,95,'PA','El Paraiso');
INSERT INTO `l38sx_tienda_zones` VALUES (1399,95,'FM','Francisco Morazan');
INSERT INTO `l38sx_tienda_zones` VALUES (1400,95,'GD','Gracias a Dios');
INSERT INTO `l38sx_tienda_zones` VALUES (1401,95,'IN','Intibuca');
INSERT INTO `l38sx_tienda_zones` VALUES (1402,95,'IB','Islas de la Bahia (Bay Islands)');
INSERT INTO `l38sx_tienda_zones` VALUES (1403,95,'PZ','La Paz');
INSERT INTO `l38sx_tienda_zones` VALUES (1404,95,'LE','Lempira');
INSERT INTO `l38sx_tienda_zones` VALUES (1405,95,'OC','Ocotepeque');
INSERT INTO `l38sx_tienda_zones` VALUES (1406,95,'OL','Olancho');
INSERT INTO `l38sx_tienda_zones` VALUES (1407,95,'SB','Santa Barbara');
INSERT INTO `l38sx_tienda_zones` VALUES (1408,95,'VA','Valle');
INSERT INTO `l38sx_tienda_zones` VALUES (1409,95,'YO','Yoro');
INSERT INTO `l38sx_tienda_zones` VALUES (1410,96,'HCW','Central and Western Hong Kong Island');
INSERT INTO `l38sx_tienda_zones` VALUES (1411,96,'HEA','Eastern Hong Kong Island');
INSERT INTO `l38sx_tienda_zones` VALUES (1412,96,'HSO','Southern Hong Kong Island');
INSERT INTO `l38sx_tienda_zones` VALUES (1413,96,'HWC','Wan Chai Hong Kong Island');
INSERT INTO `l38sx_tienda_zones` VALUES (1414,96,'KKC','Kowloon City Kowloon');
INSERT INTO `l38sx_tienda_zones` VALUES (1415,96,'KKT','Kwun Tong Kowloon');
INSERT INTO `l38sx_tienda_zones` VALUES (1416,96,'KSS','Sham Shui Po Kowloon');
INSERT INTO `l38sx_tienda_zones` VALUES (1417,96,'KWT','Wong Tai Sin Kowloon');
INSERT INTO `l38sx_tienda_zones` VALUES (1418,96,'KYT','Yau Tsim Mong Kowloon');
INSERT INTO `l38sx_tienda_zones` VALUES (1419,96,'NIS','Islands New Territories');
INSERT INTO `l38sx_tienda_zones` VALUES (1420,96,'NKT','Kwai Tsing New Territories');
INSERT INTO `l38sx_tienda_zones` VALUES (1421,96,'NNO','North New Territories');
INSERT INTO `l38sx_tienda_zones` VALUES (1422,96,'NSK','Sai Kung New Territories');
INSERT INTO `l38sx_tienda_zones` VALUES (1423,96,'NST','Sha Tin New Territories');
INSERT INTO `l38sx_tienda_zones` VALUES (1424,96,'NTP','Tai Po New Territories');
INSERT INTO `l38sx_tienda_zones` VALUES (1425,96,'NTW','Tsuen Wan New Territories');
INSERT INTO `l38sx_tienda_zones` VALUES (1426,96,'NTM','Tuen Mun New Territories');
INSERT INTO `l38sx_tienda_zones` VALUES (1427,96,'NYL','Yuen Long New Territories');
INSERT INTO `l38sx_tienda_zones` VALUES (1428,97,'BK','Bacs-Kiskun');
INSERT INTO `l38sx_tienda_zones` VALUES (1429,97,'BA','Baranya');
INSERT INTO `l38sx_tienda_zones` VALUES (1430,97,'BE','Bekes');
INSERT INTO `l38sx_tienda_zones` VALUES (1431,97,'BS','Bekescsaba');
INSERT INTO `l38sx_tienda_zones` VALUES (1432,97,'BZ','Borsod-Abauj-Zemplen');
INSERT INTO `l38sx_tienda_zones` VALUES (1433,97,'BU','Budapest');
INSERT INTO `l38sx_tienda_zones` VALUES (1434,97,'CS','Csongrad');
INSERT INTO `l38sx_tienda_zones` VALUES (1435,97,'DE','Debrecen');
INSERT INTO `l38sx_tienda_zones` VALUES (1436,97,'DU','Dunaujvaros');
INSERT INTO `l38sx_tienda_zones` VALUES (1437,97,'EG','Eger');
INSERT INTO `l38sx_tienda_zones` VALUES (1438,97,'FE','Fejer');
INSERT INTO `l38sx_tienda_zones` VALUES (1439,97,'GY','Gyor');
INSERT INTO `l38sx_tienda_zones` VALUES (1440,97,'GM','Gyor-Moson-Sopron');
INSERT INTO `l38sx_tienda_zones` VALUES (1441,97,'HB','Hajdu-Bihar');
INSERT INTO `l38sx_tienda_zones` VALUES (1442,97,'HE','Heves');
INSERT INTO `l38sx_tienda_zones` VALUES (1443,97,'HO','Hodmezovasarhely');
INSERT INTO `l38sx_tienda_zones` VALUES (1444,97,'JN','Jasz-Nagykun-Szolnok');
INSERT INTO `l38sx_tienda_zones` VALUES (1445,97,'KA','Kaposvar');
INSERT INTO `l38sx_tienda_zones` VALUES (1446,97,'KE','Kecskemet');
INSERT INTO `l38sx_tienda_zones` VALUES (1447,97,'KO','Komarom-Esztergom');
INSERT INTO `l38sx_tienda_zones` VALUES (1448,97,'MI','Miskolc');
INSERT INTO `l38sx_tienda_zones` VALUES (1449,97,'NA','Nagykanizsa');
INSERT INTO `l38sx_tienda_zones` VALUES (1450,97,'NO','Nograd');
INSERT INTO `l38sx_tienda_zones` VALUES (1451,97,'NY','Nyiregyhaza');
INSERT INTO `l38sx_tienda_zones` VALUES (1452,97,'PE','Pecs');
INSERT INTO `l38sx_tienda_zones` VALUES (1453,97,'PS','Pest');
INSERT INTO `l38sx_tienda_zones` VALUES (1454,97,'SO','Somogy');
INSERT INTO `l38sx_tienda_zones` VALUES (1455,97,'SP','Sopron');
INSERT INTO `l38sx_tienda_zones` VALUES (1456,97,'SS','Szabolcs-Szatmar-Bereg');
INSERT INTO `l38sx_tienda_zones` VALUES (1457,97,'SZ','Szeged');
INSERT INTO `l38sx_tienda_zones` VALUES (1458,97,'SE','Szekesfehervar');
INSERT INTO `l38sx_tienda_zones` VALUES (1459,97,'SL','Szolnok');
INSERT INTO `l38sx_tienda_zones` VALUES (1460,97,'SM','Szombathely');
INSERT INTO `l38sx_tienda_zones` VALUES (1461,97,'TA','Tatabanya');
INSERT INTO `l38sx_tienda_zones` VALUES (1462,97,'TO','Tolna');
INSERT INTO `l38sx_tienda_zones` VALUES (1463,97,'VA','Vas');
INSERT INTO `l38sx_tienda_zones` VALUES (1464,97,'VE','Veszprem');
INSERT INTO `l38sx_tienda_zones` VALUES (1465,97,'ZA','Zala');
INSERT INTO `l38sx_tienda_zones` VALUES (1466,97,'ZZ','Zalaegerszeg');
INSERT INTO `l38sx_tienda_zones` VALUES (1467,98,'AL','Austurland');
INSERT INTO `l38sx_tienda_zones` VALUES (1468,98,'HF','Hofuoborgarsvaeoi');
INSERT INTO `l38sx_tienda_zones` VALUES (1469,98,'NE','Norourland eystra');
INSERT INTO `l38sx_tienda_zones` VALUES (1470,98,'NV','Norourland vestra');
INSERT INTO `l38sx_tienda_zones` VALUES (1471,98,'SL','Suourland');
INSERT INTO `l38sx_tienda_zones` VALUES (1472,98,'SN','Suournes');
INSERT INTO `l38sx_tienda_zones` VALUES (1473,98,'VF','Vestfiroir');
INSERT INTO `l38sx_tienda_zones` VALUES (1474,98,'VL','Vesturland');
INSERT INTO `l38sx_tienda_zones` VALUES (1475,99,'AN','Andaman and Nicobar Islands');
INSERT INTO `l38sx_tienda_zones` VALUES (1476,99,'AP','Andhra Pradesh');
INSERT INTO `l38sx_tienda_zones` VALUES (1477,99,'AR','Arunachal Pradesh');
INSERT INTO `l38sx_tienda_zones` VALUES (1478,99,'AS','Assam');
INSERT INTO `l38sx_tienda_zones` VALUES (1479,99,'BI','Bihar');
INSERT INTO `l38sx_tienda_zones` VALUES (1480,99,'CH','Chandigarh');
INSERT INTO `l38sx_tienda_zones` VALUES (1481,99,'DA','Dadra and Nagar Haveli');
INSERT INTO `l38sx_tienda_zones` VALUES (1482,99,'DM','Daman and Diu');
INSERT INTO `l38sx_tienda_zones` VALUES (1483,99,'DE','Delhi');
INSERT INTO `l38sx_tienda_zones` VALUES (1484,99,'GO','Goa');
INSERT INTO `l38sx_tienda_zones` VALUES (1485,99,'GU','Gujarat');
INSERT INTO `l38sx_tienda_zones` VALUES (1486,99,'HA','Haryana');
INSERT INTO `l38sx_tienda_zones` VALUES (1487,99,'HP','Himachal Pradesh');
INSERT INTO `l38sx_tienda_zones` VALUES (1488,99,'JA','Jammu and Kashmir');
INSERT INTO `l38sx_tienda_zones` VALUES (1489,99,'KA','Karnataka');
INSERT INTO `l38sx_tienda_zones` VALUES (1490,99,'KE','Kerala');
INSERT INTO `l38sx_tienda_zones` VALUES (1491,99,'LI','Lakshadweep Islands');
INSERT INTO `l38sx_tienda_zones` VALUES (1492,99,'MP','Madhya Pradesh');
INSERT INTO `l38sx_tienda_zones` VALUES (1493,99,'MA','Maharashtra');
INSERT INTO `l38sx_tienda_zones` VALUES (1494,99,'MN','Manipur');
INSERT INTO `l38sx_tienda_zones` VALUES (1495,99,'ME','Meghalaya');
INSERT INTO `l38sx_tienda_zones` VALUES (1496,99,'MI','Mizoram');
INSERT INTO `l38sx_tienda_zones` VALUES (1497,99,'NA','Nagaland');
INSERT INTO `l38sx_tienda_zones` VALUES (1498,99,'OR','Orissa');
INSERT INTO `l38sx_tienda_zones` VALUES (1499,99,'PO','Pondicherry');
INSERT INTO `l38sx_tienda_zones` VALUES (1500,99,'PU','Punjab');
INSERT INTO `l38sx_tienda_zones` VALUES (1501,99,'RA','Rajasthan');
INSERT INTO `l38sx_tienda_zones` VALUES (1502,99,'SI','Sikkim');
INSERT INTO `l38sx_tienda_zones` VALUES (1503,99,'TN','Tamil Nadu');
INSERT INTO `l38sx_tienda_zones` VALUES (1504,99,'TR','Tripura');
INSERT INTO `l38sx_tienda_zones` VALUES (1505,99,'UP','Uttar Pradesh');
INSERT INTO `l38sx_tienda_zones` VALUES (1506,99,'WB','West Bengal');
INSERT INTO `l38sx_tienda_zones` VALUES (1507,100,'AC','Aceh');
INSERT INTO `l38sx_tienda_zones` VALUES (1508,100,'BA','Bali');
INSERT INTO `l38sx_tienda_zones` VALUES (1509,100,'BT','Banten');
INSERT INTO `l38sx_tienda_zones` VALUES (1510,100,'BE','Bengkulu');
INSERT INTO `l38sx_tienda_zones` VALUES (1511,100,'BD','BoDeTaBek');
INSERT INTO `l38sx_tienda_zones` VALUES (1512,100,'GO','Gorontalo');
INSERT INTO `l38sx_tienda_zones` VALUES (1513,100,'JK','Jakarta Raya');
INSERT INTO `l38sx_tienda_zones` VALUES (1514,100,'JA','Jambi');
INSERT INTO `l38sx_tienda_zones` VALUES (1515,100,'JB','Jawa Barat');
INSERT INTO `l38sx_tienda_zones` VALUES (1516,100,'JT','Jawa Tengah');
INSERT INTO `l38sx_tienda_zones` VALUES (1517,100,'JI','Jawa Timur');
INSERT INTO `l38sx_tienda_zones` VALUES (1518,100,'KB','Kalimantan Barat');
INSERT INTO `l38sx_tienda_zones` VALUES (1519,100,'KS','Kalimantan Selatan');
INSERT INTO `l38sx_tienda_zones` VALUES (1520,100,'KT','Kalimantan Tengah');
INSERT INTO `l38sx_tienda_zones` VALUES (1521,100,'KI','Kalimantan Timur');
INSERT INTO `l38sx_tienda_zones` VALUES (1522,100,'BB','Kepulauan Bangka Belitung');
INSERT INTO `l38sx_tienda_zones` VALUES (1523,100,'LA','Lampung');
INSERT INTO `l38sx_tienda_zones` VALUES (1524,100,'MA','Maluku');
INSERT INTO `l38sx_tienda_zones` VALUES (1525,100,'MU','Maluku Utara');
INSERT INTO `l38sx_tienda_zones` VALUES (1526,100,'NB','Nusa Tenggara Barat');
INSERT INTO `l38sx_tienda_zones` VALUES (1527,100,'NT','Nusa Tenggara Timur');
INSERT INTO `l38sx_tienda_zones` VALUES (1528,100,'PA','Papua');
INSERT INTO `l38sx_tienda_zones` VALUES (1529,100,'RI','Riau');
INSERT INTO `l38sx_tienda_zones` VALUES (1530,100,'SN','Sulawesi Selatan');
INSERT INTO `l38sx_tienda_zones` VALUES (1531,100,'ST','Sulawesi Tengah');
INSERT INTO `l38sx_tienda_zones` VALUES (1532,100,'SG','Sulawesi Tenggara');
INSERT INTO `l38sx_tienda_zones` VALUES (1533,100,'SA','Sulawesi Utara');
INSERT INTO `l38sx_tienda_zones` VALUES (1534,100,'SB','Sumatera Barat');
INSERT INTO `l38sx_tienda_zones` VALUES (1535,100,'SS','Sumatera Selatan');
INSERT INTO `l38sx_tienda_zones` VALUES (1536,100,'SU','Sumatera Utara');
INSERT INTO `l38sx_tienda_zones` VALUES (1537,100,'YO','Yogyakarta');
INSERT INTO `l38sx_tienda_zones` VALUES (1538,101,'TEH','Tehran');
INSERT INTO `l38sx_tienda_zones` VALUES (1539,101,'QOM','Qom');
INSERT INTO `l38sx_tienda_zones` VALUES (1540,101,'MKZ','Markazi');
INSERT INTO `l38sx_tienda_zones` VALUES (1541,101,'QAZ','Qazvin');
INSERT INTO `l38sx_tienda_zones` VALUES (1542,101,'GIL','Gilan');
INSERT INTO `l38sx_tienda_zones` VALUES (1543,101,'ARD','Ardabil');
INSERT INTO `l38sx_tienda_zones` VALUES (1544,101,'ZAN','Zanjan');
INSERT INTO `l38sx_tienda_zones` VALUES (1545,101,'EAZ','East Azarbaijan');
INSERT INTO `l38sx_tienda_zones` VALUES (1546,101,'WEZ','West Azarbaijan');
INSERT INTO `l38sx_tienda_zones` VALUES (1547,101,'KRD','Kurdistan');
INSERT INTO `l38sx_tienda_zones` VALUES (1548,101,'HMD','Hamadan');
INSERT INTO `l38sx_tienda_zones` VALUES (1549,101,'KRM','Kermanshah');
INSERT INTO `l38sx_tienda_zones` VALUES (1550,101,'ILM','Ilam');
INSERT INTO `l38sx_tienda_zones` VALUES (1551,101,'LRS','Lorestan');
INSERT INTO `l38sx_tienda_zones` VALUES (1552,101,'KZT','Khuzestan');
INSERT INTO `l38sx_tienda_zones` VALUES (1553,101,'CMB','Chahar Mahaal and Bakhtiari');
INSERT INTO `l38sx_tienda_zones` VALUES (1554,101,'KBA','Kohkiluyeh and Buyer Ahmad');
INSERT INTO `l38sx_tienda_zones` VALUES (1555,101,'BSH','Bushehr');
INSERT INTO `l38sx_tienda_zones` VALUES (1556,101,'FAR','Fars');
INSERT INTO `l38sx_tienda_zones` VALUES (1557,101,'HRM','Hormozgan');
INSERT INTO `l38sx_tienda_zones` VALUES (1558,101,'SBL','Sistan and Baluchistan');
INSERT INTO `l38sx_tienda_zones` VALUES (1559,101,'KRB','Kerman');
INSERT INTO `l38sx_tienda_zones` VALUES (1560,101,'YZD','Yazd');
INSERT INTO `l38sx_tienda_zones` VALUES (1561,101,'EFH','Esfahan');
INSERT INTO `l38sx_tienda_zones` VALUES (1562,101,'SMN','Semnan');
INSERT INTO `l38sx_tienda_zones` VALUES (1563,101,'MZD','Mazandaran');
INSERT INTO `l38sx_tienda_zones` VALUES (1564,101,'GLS','Golestan');
INSERT INTO `l38sx_tienda_zones` VALUES (1565,101,'NKH','North Khorasan');
INSERT INTO `l38sx_tienda_zones` VALUES (1566,101,'RKH','Razavi Khorasan');
INSERT INTO `l38sx_tienda_zones` VALUES (1567,101,'SKH','South Khorasan');
INSERT INTO `l38sx_tienda_zones` VALUES (1568,102,'BD','Baghdad');
INSERT INTO `l38sx_tienda_zones` VALUES (1569,102,'SD','Salah ad Din');
INSERT INTO `l38sx_tienda_zones` VALUES (1570,102,'DY','Diyala');
INSERT INTO `l38sx_tienda_zones` VALUES (1571,102,'WS','Wasit');
INSERT INTO `l38sx_tienda_zones` VALUES (1572,102,'MY','Maysan');
INSERT INTO `l38sx_tienda_zones` VALUES (1573,102,'BA','Al Basrah');
INSERT INTO `l38sx_tienda_zones` VALUES (1574,102,'DQ','Dhi Qar');
INSERT INTO `l38sx_tienda_zones` VALUES (1575,102,'MU','Al Muthanna');
INSERT INTO `l38sx_tienda_zones` VALUES (1576,102,'QA','Al Qadisyah');
INSERT INTO `l38sx_tienda_zones` VALUES (1577,102,'BB','Babil');
INSERT INTO `l38sx_tienda_zones` VALUES (1578,102,'KB','Al Karbala');
INSERT INTO `l38sx_tienda_zones` VALUES (1579,102,'NJ','An Najaf');
INSERT INTO `l38sx_tienda_zones` VALUES (1580,102,'AB','Al Anbar');
INSERT INTO `l38sx_tienda_zones` VALUES (1581,102,'NN','Ninawa');
INSERT INTO `l38sx_tienda_zones` VALUES (1582,102,'DH','Dahuk');
INSERT INTO `l38sx_tienda_zones` VALUES (1583,102,'AL','Arbil');
INSERT INTO `l38sx_tienda_zones` VALUES (1584,102,'TM','At Ta\'mim');
INSERT INTO `l38sx_tienda_zones` VALUES (1585,102,'SL','As Sulaymaniyah');
INSERT INTO `l38sx_tienda_zones` VALUES (1586,103,'CA','Carlow');
INSERT INTO `l38sx_tienda_zones` VALUES (1587,103,'CV','Cavan');
INSERT INTO `l38sx_tienda_zones` VALUES (1588,103,'CL','Clare');
INSERT INTO `l38sx_tienda_zones` VALUES (1589,103,'CO','Cork');
INSERT INTO `l38sx_tienda_zones` VALUES (1590,103,'DO','Donegal');
INSERT INTO `l38sx_tienda_zones` VALUES (1591,103,'DU','Dublin');
INSERT INTO `l38sx_tienda_zones` VALUES (1592,103,'GA','Galway');
INSERT INTO `l38sx_tienda_zones` VALUES (1593,103,'KE','Kerry');
INSERT INTO `l38sx_tienda_zones` VALUES (1594,103,'KI','Kildare');
INSERT INTO `l38sx_tienda_zones` VALUES (1595,103,'KL','Kilkenny');
INSERT INTO `l38sx_tienda_zones` VALUES (1596,103,'LA','Laois');
INSERT INTO `l38sx_tienda_zones` VALUES (1597,103,'LE','Leitrim');
INSERT INTO `l38sx_tienda_zones` VALUES (1598,103,'LI','Limerick');
INSERT INTO `l38sx_tienda_zones` VALUES (1599,103,'LO','Longford');
INSERT INTO `l38sx_tienda_zones` VALUES (1600,103,'LU','Louth');
INSERT INTO `l38sx_tienda_zones` VALUES (1601,103,'MA','Mayo');
INSERT INTO `l38sx_tienda_zones` VALUES (1602,103,'ME','Meath');
INSERT INTO `l38sx_tienda_zones` VALUES (1603,103,'MO','Monaghan');
INSERT INTO `l38sx_tienda_zones` VALUES (1604,103,'OF','Offaly');
INSERT INTO `l38sx_tienda_zones` VALUES (1605,103,'RO','Roscommon');
INSERT INTO `l38sx_tienda_zones` VALUES (1606,103,'SL','Sligo');
INSERT INTO `l38sx_tienda_zones` VALUES (1607,103,'TI','Tipperary');
INSERT INTO `l38sx_tienda_zones` VALUES (1608,103,'WA','Waterford');
INSERT INTO `l38sx_tienda_zones` VALUES (1609,103,'WE','Westmeath');
INSERT INTO `l38sx_tienda_zones` VALUES (1610,103,'WX','Wexford');
INSERT INTO `l38sx_tienda_zones` VALUES (1611,103,'WI','Wicklow');
INSERT INTO `l38sx_tienda_zones` VALUES (1612,104,'BS','Be\'er Sheva');
INSERT INTO `l38sx_tienda_zones` VALUES (1613,104,'BH','Bika\'at Hayarden');
INSERT INTO `l38sx_tienda_zones` VALUES (1614,104,'EA','Eilat and Arava');
INSERT INTO `l38sx_tienda_zones` VALUES (1615,104,'GA','Galil');
INSERT INTO `l38sx_tienda_zones` VALUES (1616,104,'HA','Haifa');
INSERT INTO `l38sx_tienda_zones` VALUES (1617,104,'JM','Jehuda Mountains');
INSERT INTO `l38sx_tienda_zones` VALUES (1618,104,'JE','Jerusalem');
INSERT INTO `l38sx_tienda_zones` VALUES (1619,104,'NE','Negev');
INSERT INTO `l38sx_tienda_zones` VALUES (1620,104,'SE','Semaria');
INSERT INTO `l38sx_tienda_zones` VALUES (1621,104,'SH','Sharon');
INSERT INTO `l38sx_tienda_zones` VALUES (1622,104,'TA','Tel Aviv (Gosh Dan)');
INSERT INTO `l38sx_tienda_zones` VALUES (1643,106,'CLA','Clarendon Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1644,106,'HAN','Hanover Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1645,106,'KIN','Kingston Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1646,106,'MAN','Manchester Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1647,106,'POR','Portland Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1648,106,'AND','Saint Andrew Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1649,106,'ANN','Saint Ann Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1650,106,'CAT','Saint Catherine Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1651,106,'ELI','Saint Elizabeth Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1652,106,'JAM','Saint James Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1653,106,'MAR','Saint Mary Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1654,106,'THO','Saint Thomas Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1655,106,'TRL','Trelawny Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1656,106,'WML','Westmoreland Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1657,107,'AI','Aichi');
INSERT INTO `l38sx_tienda_zones` VALUES (1658,107,'AK','Akita');
INSERT INTO `l38sx_tienda_zones` VALUES (1659,107,'AO','Aomori');
INSERT INTO `l38sx_tienda_zones` VALUES (1660,107,'CH','Chiba');
INSERT INTO `l38sx_tienda_zones` VALUES (1661,107,'EH','Ehime');
INSERT INTO `l38sx_tienda_zones` VALUES (1662,107,'FK','Fukui');
INSERT INTO `l38sx_tienda_zones` VALUES (1663,107,'FU','Fukuoka');
INSERT INTO `l38sx_tienda_zones` VALUES (1664,107,'FS','Fukushima');
INSERT INTO `l38sx_tienda_zones` VALUES (1665,107,'GI','Gifu');
INSERT INTO `l38sx_tienda_zones` VALUES (1666,107,'GU','Gumma');
INSERT INTO `l38sx_tienda_zones` VALUES (1667,107,'HI','Hiroshima');
INSERT INTO `l38sx_tienda_zones` VALUES (1668,107,'HO','Hokkaido');
INSERT INTO `l38sx_tienda_zones` VALUES (1669,107,'HY','Hyogo');
INSERT INTO `l38sx_tienda_zones` VALUES (1670,107,'IB','Ibaraki');
INSERT INTO `l38sx_tienda_zones` VALUES (1671,107,'IS','Ishikawa');
INSERT INTO `l38sx_tienda_zones` VALUES (1672,107,'IW','Iwate');
INSERT INTO `l38sx_tienda_zones` VALUES (1673,107,'KA','Kagawa');
INSERT INTO `l38sx_tienda_zones` VALUES (1674,107,'KG','Kagoshima');
INSERT INTO `l38sx_tienda_zones` VALUES (1675,107,'KN','Kanagawa');
INSERT INTO `l38sx_tienda_zones` VALUES (1676,107,'KO','Kochi');
INSERT INTO `l38sx_tienda_zones` VALUES (1677,107,'KU','Kumamoto');
INSERT INTO `l38sx_tienda_zones` VALUES (1678,107,'KY','Kyoto');
INSERT INTO `l38sx_tienda_zones` VALUES (1679,107,'MI','Mie');
INSERT INTO `l38sx_tienda_zones` VALUES (1680,107,'MY','Miyagi');
INSERT INTO `l38sx_tienda_zones` VALUES (1681,107,'MZ','Miyazaki');
INSERT INTO `l38sx_tienda_zones` VALUES (1682,107,'NA','Nagano');
INSERT INTO `l38sx_tienda_zones` VALUES (1683,107,'NG','Nagasaki');
INSERT INTO `l38sx_tienda_zones` VALUES (1684,107,'NR','Nara');
INSERT INTO `l38sx_tienda_zones` VALUES (1685,107,'NI','Niigata');
INSERT INTO `l38sx_tienda_zones` VALUES (1686,107,'OI','Oita');
INSERT INTO `l38sx_tienda_zones` VALUES (1687,107,'OK','Okayama');
INSERT INTO `l38sx_tienda_zones` VALUES (1688,107,'ON','Okinawa');
INSERT INTO `l38sx_tienda_zones` VALUES (1689,107,'OS','Osaka');
INSERT INTO `l38sx_tienda_zones` VALUES (1690,107,'SA','Saga');
INSERT INTO `l38sx_tienda_zones` VALUES (1691,107,'SI','Saitama');
INSERT INTO `l38sx_tienda_zones` VALUES (1692,107,'SH','Shiga');
INSERT INTO `l38sx_tienda_zones` VALUES (1693,107,'SM','Shimane');
INSERT INTO `l38sx_tienda_zones` VALUES (1694,107,'SZ','Shizuoka');
INSERT INTO `l38sx_tienda_zones` VALUES (1695,107,'TO','Tochigi');
INSERT INTO `l38sx_tienda_zones` VALUES (1696,107,'TS','Tokushima');
INSERT INTO `l38sx_tienda_zones` VALUES (1697,107,'TK','Tokyo');
INSERT INTO `l38sx_tienda_zones` VALUES (1698,107,'TT','Tottori');
INSERT INTO `l38sx_tienda_zones` VALUES (1699,107,'TY','Toyama');
INSERT INTO `l38sx_tienda_zones` VALUES (1700,107,'WA','Wakayama');
INSERT INTO `l38sx_tienda_zones` VALUES (1701,107,'YA','Yamagata');
INSERT INTO `l38sx_tienda_zones` VALUES (1702,107,'YM','Yamaguchi');
INSERT INTO `l38sx_tienda_zones` VALUES (1703,107,'YN','Yamanashi');
INSERT INTO `l38sx_tienda_zones` VALUES (1704,108,'AM','\'Amman');
INSERT INTO `l38sx_tienda_zones` VALUES (1705,108,'AJ','Ajlun');
INSERT INTO `l38sx_tienda_zones` VALUES (1706,108,'AA','Al \'Aqabah');
INSERT INTO `l38sx_tienda_zones` VALUES (1707,108,'AB','Al Balqa\'');
INSERT INTO `l38sx_tienda_zones` VALUES (1708,108,'AK','Al Karak');
INSERT INTO `l38sx_tienda_zones` VALUES (1709,108,'AL','Al Mafraq');
INSERT INTO `l38sx_tienda_zones` VALUES (1710,108,'AT','At Tafilah');
INSERT INTO `l38sx_tienda_zones` VALUES (1711,108,'AZ','Az Zarqa\'');
INSERT INTO `l38sx_tienda_zones` VALUES (1712,108,'IR','Irbid');
INSERT INTO `l38sx_tienda_zones` VALUES (1713,108,'JA','Jarash');
INSERT INTO `l38sx_tienda_zones` VALUES (1714,108,'MA','Ma\'an');
INSERT INTO `l38sx_tienda_zones` VALUES (1715,108,'MD','Madaba');
INSERT INTO `l38sx_tienda_zones` VALUES (1716,109,'AL','Almaty');
INSERT INTO `l38sx_tienda_zones` VALUES (1717,109,'AC','Almaty City');
INSERT INTO `l38sx_tienda_zones` VALUES (1718,109,'AM','Aqmola');
INSERT INTO `l38sx_tienda_zones` VALUES (1719,109,'AQ','Aqtobe');
INSERT INTO `l38sx_tienda_zones` VALUES (1720,109,'AS','Astana City');
INSERT INTO `l38sx_tienda_zones` VALUES (1721,109,'AT','Atyrau');
INSERT INTO `l38sx_tienda_zones` VALUES (1722,109,'BA','Batys Qazaqstan');
INSERT INTO `l38sx_tienda_zones` VALUES (1723,109,'BY','Bayqongyr City');
INSERT INTO `l38sx_tienda_zones` VALUES (1724,109,'MA','Mangghystau');
INSERT INTO `l38sx_tienda_zones` VALUES (1725,109,'ON','Ongtustik Qazaqstan');
INSERT INTO `l38sx_tienda_zones` VALUES (1726,109,'PA','Pavlodar');
INSERT INTO `l38sx_tienda_zones` VALUES (1727,109,'QA','Qaraghandy');
INSERT INTO `l38sx_tienda_zones` VALUES (1728,109,'QO','Qostanay');
INSERT INTO `l38sx_tienda_zones` VALUES (1729,109,'QY','Qyzylorda');
INSERT INTO `l38sx_tienda_zones` VALUES (1730,109,'SH','Shyghys Qazaqstan');
INSERT INTO `l38sx_tienda_zones` VALUES (1731,109,'SO','Soltustik Qazaqstan');
INSERT INTO `l38sx_tienda_zones` VALUES (1732,109,'ZH','Zhambyl');
INSERT INTO `l38sx_tienda_zones` VALUES (1733,110,'CE','Central');
INSERT INTO `l38sx_tienda_zones` VALUES (1734,110,'CO','Coast');
INSERT INTO `l38sx_tienda_zones` VALUES (1735,110,'EA','Eastern');
INSERT INTO `l38sx_tienda_zones` VALUES (1736,110,'NA','Nairobi Area');
INSERT INTO `l38sx_tienda_zones` VALUES (1737,110,'NE','North Eastern');
INSERT INTO `l38sx_tienda_zones` VALUES (1738,110,'NY','Nyanza');
INSERT INTO `l38sx_tienda_zones` VALUES (1739,110,'RV','Rift Valley');
INSERT INTO `l38sx_tienda_zones` VALUES (1740,110,'WE','Western');
INSERT INTO `l38sx_tienda_zones` VALUES (1741,111,'AG','Abaiang');
INSERT INTO `l38sx_tienda_zones` VALUES (1742,111,'AM','Abemama');
INSERT INTO `l38sx_tienda_zones` VALUES (1743,111,'AK','Aranuka');
INSERT INTO `l38sx_tienda_zones` VALUES (1744,111,'AO','Arorae');
INSERT INTO `l38sx_tienda_zones` VALUES (1745,111,'BA','Banaba');
INSERT INTO `l38sx_tienda_zones` VALUES (1746,111,'BE','Beru');
INSERT INTO `l38sx_tienda_zones` VALUES (1747,111,'bT','Butaritari');
INSERT INTO `l38sx_tienda_zones` VALUES (1748,111,'KA','Kanton');
INSERT INTO `l38sx_tienda_zones` VALUES (1749,111,'KR','Kiritimati');
INSERT INTO `l38sx_tienda_zones` VALUES (1750,111,'KU','Kuria');
INSERT INTO `l38sx_tienda_zones` VALUES (1751,111,'MI','Maiana');
INSERT INTO `l38sx_tienda_zones` VALUES (1752,111,'MN','Makin');
INSERT INTO `l38sx_tienda_zones` VALUES (1753,111,'ME','Marakei');
INSERT INTO `l38sx_tienda_zones` VALUES (1754,111,'NI','Nikunau');
INSERT INTO `l38sx_tienda_zones` VALUES (1755,111,'NO','Nonouti');
INSERT INTO `l38sx_tienda_zones` VALUES (1756,111,'ON','Onotoa');
INSERT INTO `l38sx_tienda_zones` VALUES (1757,111,'TT','Tabiteuea');
INSERT INTO `l38sx_tienda_zones` VALUES (1758,111,'TR','Tabuaeran');
INSERT INTO `l38sx_tienda_zones` VALUES (1759,111,'TM','Tamana');
INSERT INTO `l38sx_tienda_zones` VALUES (1760,111,'TW','Tarawa');
INSERT INTO `l38sx_tienda_zones` VALUES (1761,111,'TE','Teraina');
INSERT INTO `l38sx_tienda_zones` VALUES (1762,112,'CHA','Chagang-do');
INSERT INTO `l38sx_tienda_zones` VALUES (1763,112,'HAB','Hamgyong-bukto');
INSERT INTO `l38sx_tienda_zones` VALUES (1764,112,'HAN','Hamgyong-namdo');
INSERT INTO `l38sx_tienda_zones` VALUES (1765,112,'HWB','Hwanghae-bukto');
INSERT INTO `l38sx_tienda_zones` VALUES (1766,112,'HWN','Hwanghae-namdo');
INSERT INTO `l38sx_tienda_zones` VALUES (1767,112,'KAN','Kangwon-do');
INSERT INTO `l38sx_tienda_zones` VALUES (1768,112,'PYB','P\'yongan-bukto');
INSERT INTO `l38sx_tienda_zones` VALUES (1769,112,'PYN','P\'yongan-namdo');
INSERT INTO `l38sx_tienda_zones` VALUES (1770,112,'YAN','Ryanggang-do (Yanggang-do)');
INSERT INTO `l38sx_tienda_zones` VALUES (1771,112,'NAJ','Rason Directly Governed City');
INSERT INTO `l38sx_tienda_zones` VALUES (1772,112,'PYO','P\'yongyang Special City');
INSERT INTO `l38sx_tienda_zones` VALUES (1773,113,'CO','Ch\'ungch\'ong-bukto');
INSERT INTO `l38sx_tienda_zones` VALUES (1774,113,'CH','Ch\'ungch\'ong-namdo');
INSERT INTO `l38sx_tienda_zones` VALUES (1775,113,'CD','Cheju-do');
INSERT INTO `l38sx_tienda_zones` VALUES (1776,113,'CB','Cholla-bukto');
INSERT INTO `l38sx_tienda_zones` VALUES (1777,113,'CN','Cholla-namdo');
INSERT INTO `l38sx_tienda_zones` VALUES (1778,113,'IG','Inch\'on-gwangyoksi');
INSERT INTO `l38sx_tienda_zones` VALUES (1779,113,'KA','Kangwon-do');
INSERT INTO `l38sx_tienda_zones` VALUES (1780,113,'KG','Kwangju-gwangyoksi');
INSERT INTO `l38sx_tienda_zones` VALUES (1781,113,'KD','Kyonggi-do');
INSERT INTO `l38sx_tienda_zones` VALUES (1782,113,'KB','Kyongsang-bukto');
INSERT INTO `l38sx_tienda_zones` VALUES (1783,113,'KN','Kyongsang-namdo');
INSERT INTO `l38sx_tienda_zones` VALUES (1784,113,'PG','Pusan-gwangyoksi');
INSERT INTO `l38sx_tienda_zones` VALUES (1785,113,'SO','Soul-t\'ukpyolsi');
INSERT INTO `l38sx_tienda_zones` VALUES (1786,113,'TA','Taegu-gwangyoksi');
INSERT INTO `l38sx_tienda_zones` VALUES (1787,113,'TG','Taejon-gwangyoksi');
INSERT INTO `l38sx_tienda_zones` VALUES (1788,114,'AL','Al \'Asimah');
INSERT INTO `l38sx_tienda_zones` VALUES (1789,114,'AA','Al Ahmadi');
INSERT INTO `l38sx_tienda_zones` VALUES (1790,114,'AF','Al Farwaniyah');
INSERT INTO `l38sx_tienda_zones` VALUES (1791,114,'AJ','Al Jahra\'');
INSERT INTO `l38sx_tienda_zones` VALUES (1792,114,'HA','Hawalli');
INSERT INTO `l38sx_tienda_zones` VALUES (1793,115,'GB','Bishkek');
INSERT INTO `l38sx_tienda_zones` VALUES (1794,115,'B','Batken');
INSERT INTO `l38sx_tienda_zones` VALUES (1795,115,'C','Chu');
INSERT INTO `l38sx_tienda_zones` VALUES (1796,115,'J','Jalal-Abad');
INSERT INTO `l38sx_tienda_zones` VALUES (1797,115,'N','Naryn');
INSERT INTO `l38sx_tienda_zones` VALUES (1798,115,'O','Osh');
INSERT INTO `l38sx_tienda_zones` VALUES (1799,115,'T','Talas');
INSERT INTO `l38sx_tienda_zones` VALUES (1800,115,'Y','Ysyk-Kol');
INSERT INTO `l38sx_tienda_zones` VALUES (1801,116,'VT','Vientiane');
INSERT INTO `l38sx_tienda_zones` VALUES (1802,116,'AT','Attapu');
INSERT INTO `l38sx_tienda_zones` VALUES (1803,116,'BK','Bokeo');
INSERT INTO `l38sx_tienda_zones` VALUES (1804,116,'BL','Bolikhamxai');
INSERT INTO `l38sx_tienda_zones` VALUES (1805,116,'CH','Champasak');
INSERT INTO `l38sx_tienda_zones` VALUES (1806,116,'HO','Houaphan');
INSERT INTO `l38sx_tienda_zones` VALUES (1807,116,'KH','Khammouan');
INSERT INTO `l38sx_tienda_zones` VALUES (1808,116,'LM','Louang Namtha');
INSERT INTO `l38sx_tienda_zones` VALUES (1809,116,'LP','Louangphabang');
INSERT INTO `l38sx_tienda_zones` VALUES (1810,116,'OU','Oudomxai');
INSERT INTO `l38sx_tienda_zones` VALUES (1811,116,'PH','Phongsali');
INSERT INTO `l38sx_tienda_zones` VALUES (1812,116,'SL','Salavan');
INSERT INTO `l38sx_tienda_zones` VALUES (1813,116,'SV','Savannakhet');
INSERT INTO `l38sx_tienda_zones` VALUES (1814,116,'VI','Vientiane');
INSERT INTO `l38sx_tienda_zones` VALUES (1815,116,'XA','Xaignabouli');
INSERT INTO `l38sx_tienda_zones` VALUES (1816,116,'XE','Xekong');
INSERT INTO `l38sx_tienda_zones` VALUES (1817,116,'XI','Xiangkhoang');
INSERT INTO `l38sx_tienda_zones` VALUES (1818,116,'XN','Xaisomboun');
INSERT INTO `l38sx_tienda_zones` VALUES (1819,117,'AIZ','Aizkraukles Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1820,117,'ALU','Aluksnes Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1821,117,'BAL','Balvu Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1822,117,'BAU','Bauskas Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1823,117,'CES','Cesu Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1824,117,'DGR','Daugavpils Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1825,117,'DOB','Dobeles Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1826,117,'GUL','Gulbenes Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1827,117,'JEK','Jekabpils Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1828,117,'JGR','Jelgavas Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1829,117,'KRA','Kraslavas Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1830,117,'KUL','Kuldigas Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1831,117,'LPR','Liepajas Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1832,117,'LIM','Limbazu Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1833,117,'LUD','Ludzas Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1834,117,'MAD','Madonas Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1835,117,'OGR','Ogres Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1836,117,'PRE','Preilu Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1837,117,'RZR','Rezeknes Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1838,117,'RGR','Rigas Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1839,117,'SAL','Saldus Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1840,117,'TAL','Talsu Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1841,117,'TUK','Tukuma Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1842,117,'VLK','Valkas Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1843,117,'VLM','Valmieras Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1844,117,'VSR','Ventspils Rajons');
INSERT INTO `l38sx_tienda_zones` VALUES (1845,117,'DGV','Daugavpils');
INSERT INTO `l38sx_tienda_zones` VALUES (1846,117,'JGV','Jelgava');
INSERT INTO `l38sx_tienda_zones` VALUES (1847,117,'JUR','Jurmala');
INSERT INTO `l38sx_tienda_zones` VALUES (1848,117,'LPK','Liepaja');
INSERT INTO `l38sx_tienda_zones` VALUES (1849,117,'RZK','Rezekne');
INSERT INTO `l38sx_tienda_zones` VALUES (1850,117,'RGA','Riga');
INSERT INTO `l38sx_tienda_zones` VALUES (1851,117,'VSL','Ventspils');
INSERT INTO `l38sx_tienda_zones` VALUES (1852,119,'BE','Berea');
INSERT INTO `l38sx_tienda_zones` VALUES (1853,119,'BB','Butha-Buthe');
INSERT INTO `l38sx_tienda_zones` VALUES (1854,119,'LE','Leribe');
INSERT INTO `l38sx_tienda_zones` VALUES (1855,119,'MF','Mafeteng');
INSERT INTO `l38sx_tienda_zones` VALUES (1856,119,'MS','Maseru');
INSERT INTO `l38sx_tienda_zones` VALUES (1857,119,'MH','Mohale\'s Hoek');
INSERT INTO `l38sx_tienda_zones` VALUES (1858,119,'MK','Mokhotlong');
INSERT INTO `l38sx_tienda_zones` VALUES (1859,119,'QN','Qacha\'s Nek');
INSERT INTO `l38sx_tienda_zones` VALUES (1860,119,'QT','Quthing');
INSERT INTO `l38sx_tienda_zones` VALUES (1861,119,'TT','Thaba-Tseka');
INSERT INTO `l38sx_tienda_zones` VALUES (1862,120,'BI','Bomi');
INSERT INTO `l38sx_tienda_zones` VALUES (1863,120,'BG','Bong');
INSERT INTO `l38sx_tienda_zones` VALUES (1864,120,'GB','Grand Bassa');
INSERT INTO `l38sx_tienda_zones` VALUES (1865,120,'CM','Grand Cape Mount');
INSERT INTO `l38sx_tienda_zones` VALUES (1866,120,'GG','Grand Gedeh');
INSERT INTO `l38sx_tienda_zones` VALUES (1867,120,'GK','Grand Kru');
INSERT INTO `l38sx_tienda_zones` VALUES (1868,120,'LO','Lofa');
INSERT INTO `l38sx_tienda_zones` VALUES (1869,120,'MG','Margibi');
INSERT INTO `l38sx_tienda_zones` VALUES (1870,120,'ML','Maryland');
INSERT INTO `l38sx_tienda_zones` VALUES (1871,120,'MS','Montserrado');
INSERT INTO `l38sx_tienda_zones` VALUES (1872,120,'NB','Nimba');
INSERT INTO `l38sx_tienda_zones` VALUES (1873,120,'RC','River Cess');
INSERT INTO `l38sx_tienda_zones` VALUES (1874,120,'SN','Sinoe');
INSERT INTO `l38sx_tienda_zones` VALUES (1875,121,'AJ','Ajdabiya');
INSERT INTO `l38sx_tienda_zones` VALUES (1876,121,'AZ','Al \'Aziziyah');
INSERT INTO `l38sx_tienda_zones` VALUES (1877,121,'FA','Al Fatih');
INSERT INTO `l38sx_tienda_zones` VALUES (1878,121,'JA','Al Jabal al Akhdar');
INSERT INTO `l38sx_tienda_zones` VALUES (1879,121,'JU','Al Jufrah');
INSERT INTO `l38sx_tienda_zones` VALUES (1880,121,'KH','Al Khums');
INSERT INTO `l38sx_tienda_zones` VALUES (1881,121,'KU','Al Kufrah');
INSERT INTO `l38sx_tienda_zones` VALUES (1882,121,'NK','An Nuqat al Khams');
INSERT INTO `l38sx_tienda_zones` VALUES (1883,121,'AS','Ash Shati\'');
INSERT INTO `l38sx_tienda_zones` VALUES (1884,121,'AW','Awbari');
INSERT INTO `l38sx_tienda_zones` VALUES (1885,121,'ZA','Az Zawiyah');
INSERT INTO `l38sx_tienda_zones` VALUES (1886,121,'BA','Banghazi');
INSERT INTO `l38sx_tienda_zones` VALUES (1887,121,'DA','Darnah');
INSERT INTO `l38sx_tienda_zones` VALUES (1888,121,'GD','Ghadamis');
INSERT INTO `l38sx_tienda_zones` VALUES (1889,121,'GY','Gharyan');
INSERT INTO `l38sx_tienda_zones` VALUES (1890,121,'MI','Misratah');
INSERT INTO `l38sx_tienda_zones` VALUES (1891,121,'MZ','Murzuq');
INSERT INTO `l38sx_tienda_zones` VALUES (1892,121,'SB','Sabha');
INSERT INTO `l38sx_tienda_zones` VALUES (1893,121,'SW','Sawfajjin');
INSERT INTO `l38sx_tienda_zones` VALUES (1894,121,'SU','Surt');
INSERT INTO `l38sx_tienda_zones` VALUES (1895,121,'TL','Tarabulus (Tripoli)');
INSERT INTO `l38sx_tienda_zones` VALUES (1896,121,'TH','Tarhunah');
INSERT INTO `l38sx_tienda_zones` VALUES (1897,121,'TU','Tubruq');
INSERT INTO `l38sx_tienda_zones` VALUES (1898,121,'YA','Yafran');
INSERT INTO `l38sx_tienda_zones` VALUES (1899,121,'ZL','Zlitan');
INSERT INTO `l38sx_tienda_zones` VALUES (1900,122,'V','Vaduz');
INSERT INTO `l38sx_tienda_zones` VALUES (1901,122,'A','Schaan');
INSERT INTO `l38sx_tienda_zones` VALUES (1902,122,'B','Balzers');
INSERT INTO `l38sx_tienda_zones` VALUES (1903,122,'N','Triesen');
INSERT INTO `l38sx_tienda_zones` VALUES (1904,122,'E','Eschen');
INSERT INTO `l38sx_tienda_zones` VALUES (1905,122,'M','Mauren');
INSERT INTO `l38sx_tienda_zones` VALUES (1906,122,'T','Triesenberg');
INSERT INTO `l38sx_tienda_zones` VALUES (1907,122,'R','Ruggell');
INSERT INTO `l38sx_tienda_zones` VALUES (1908,122,'G','Gamprin');
INSERT INTO `l38sx_tienda_zones` VALUES (1909,122,'L','Schellenberg');
INSERT INTO `l38sx_tienda_zones` VALUES (1910,122,'P','Planken');
INSERT INTO `l38sx_tienda_zones` VALUES (1911,123,'AL','Alytus');
INSERT INTO `l38sx_tienda_zones` VALUES (1912,123,'KA','Kaunas');
INSERT INTO `l38sx_tienda_zones` VALUES (1913,123,'KL','Klaipeda');
INSERT INTO `l38sx_tienda_zones` VALUES (1914,123,'MA','Marijampole');
INSERT INTO `l38sx_tienda_zones` VALUES (1915,123,'PA','Panevezys');
INSERT INTO `l38sx_tienda_zones` VALUES (1916,123,'SI','Siauliai');
INSERT INTO `l38sx_tienda_zones` VALUES (1917,123,'TA','Taurage');
INSERT INTO `l38sx_tienda_zones` VALUES (1918,123,'TE','Telsiai');
INSERT INTO `l38sx_tienda_zones` VALUES (1919,123,'UT','Utena');
INSERT INTO `l38sx_tienda_zones` VALUES (1920,123,'VI','Vilnius');
INSERT INTO `l38sx_tienda_zones` VALUES (1921,124,'DD','Diekirch');
INSERT INTO `l38sx_tienda_zones` VALUES (1922,124,'DC','Clervaux');
INSERT INTO `l38sx_tienda_zones` VALUES (1923,124,'DR','Redange');
INSERT INTO `l38sx_tienda_zones` VALUES (1924,124,'DV','Vianden');
INSERT INTO `l38sx_tienda_zones` VALUES (1925,124,'DW','Wiltz');
INSERT INTO `l38sx_tienda_zones` VALUES (1926,124,'GG','Grevenmacher');
INSERT INTO `l38sx_tienda_zones` VALUES (1927,124,'GE','Echternach');
INSERT INTO `l38sx_tienda_zones` VALUES (1928,124,'GR','Remich');
INSERT INTO `l38sx_tienda_zones` VALUES (1929,124,'LL','Luxembourg');
INSERT INTO `l38sx_tienda_zones` VALUES (1930,124,'LC','Capellen');
INSERT INTO `l38sx_tienda_zones` VALUES (1931,124,'LE','Esch-sur-Alzette');
INSERT INTO `l38sx_tienda_zones` VALUES (1932,124,'LM','Mersch');
INSERT INTO `l38sx_tienda_zones` VALUES (1933,125,'OLF','Our Lady Fatima Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1934,125,'ANT','St. Anthony Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1935,125,'LAZ','St. Lazarus Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1936,125,'CAT','Cathedral Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1937,125,'LAW','St. Lawrence Parish');
INSERT INTO `l38sx_tienda_zones` VALUES (1938,127,'AN','Antananarivo');
INSERT INTO `l38sx_tienda_zones` VALUES (1939,127,'AS','Antsiranana');
INSERT INTO `l38sx_tienda_zones` VALUES (1940,127,'FN','Fianarantsoa');
INSERT INTO `l38sx_tienda_zones` VALUES (1941,127,'MJ','Mahajanga');
INSERT INTO `l38sx_tienda_zones` VALUES (1942,127,'TM','Toamasina');
INSERT INTO `l38sx_tienda_zones` VALUES (1943,127,'TL','Toliara');
INSERT INTO `l38sx_tienda_zones` VALUES (1944,128,'BLK','Balaka');
INSERT INTO `l38sx_tienda_zones` VALUES (1945,128,'BLT','Blantyre');
INSERT INTO `l38sx_tienda_zones` VALUES (1946,128,'CKW','Chikwawa');
INSERT INTO `l38sx_tienda_zones` VALUES (1947,128,'CRD','Chiradzulu');
INSERT INTO `l38sx_tienda_zones` VALUES (1948,128,'CTP','Chitipa');
INSERT INTO `l38sx_tienda_zones` VALUES (1949,128,'DDZ','Dedza');
INSERT INTO `l38sx_tienda_zones` VALUES (1950,128,'DWA','Dowa');
INSERT INTO `l38sx_tienda_zones` VALUES (1951,128,'KRG','Karonga');
INSERT INTO `l38sx_tienda_zones` VALUES (1952,128,'KSG','Kasungu');
INSERT INTO `l38sx_tienda_zones` VALUES (1953,128,'LKM','Likoma');
INSERT INTO `l38sx_tienda_zones` VALUES (1954,128,'LLG','Lilongwe');
INSERT INTO `l38sx_tienda_zones` VALUES (1955,128,'MCG','Machinga');
INSERT INTO `l38sx_tienda_zones` VALUES (1956,128,'MGC','Mangochi');
INSERT INTO `l38sx_tienda_zones` VALUES (1957,128,'MCH','Mchinji');
INSERT INTO `l38sx_tienda_zones` VALUES (1958,128,'MLJ','Mulanje');
INSERT INTO `l38sx_tienda_zones` VALUES (1959,128,'MWZ','Mwanza');
INSERT INTO `l38sx_tienda_zones` VALUES (1960,128,'MZM','Mzimba');
INSERT INTO `l38sx_tienda_zones` VALUES (1961,128,'NTU','Ntcheu');
INSERT INTO `l38sx_tienda_zones` VALUES (1962,128,'NKB','Nkhata Bay');
INSERT INTO `l38sx_tienda_zones` VALUES (1963,128,'NKH','Nkhotakota');
INSERT INTO `l38sx_tienda_zones` VALUES (1964,128,'NSJ','Nsanje');
INSERT INTO `l38sx_tienda_zones` VALUES (1965,128,'NTI','Ntchisi');
INSERT INTO `l38sx_tienda_zones` VALUES (1966,128,'PHL','Phalombe');
INSERT INTO `l38sx_tienda_zones` VALUES (1967,128,'RMP','Rumphi');
INSERT INTO `l38sx_tienda_zones` VALUES (1968,128,'SLM','Salima');
INSERT INTO `l38sx_tienda_zones` VALUES (1969,128,'THY','Thyolo');
INSERT INTO `l38sx_tienda_zones` VALUES (1970,128,'ZBA','Zomba');
INSERT INTO `l38sx_tienda_zones` VALUES (1971,129,'JO','Johor');
INSERT INTO `l38sx_tienda_zones` VALUES (1972,129,'KE','Kedah');
INSERT INTO `l38sx_tienda_zones` VALUES (1973,129,'KL','Kelantan');
INSERT INTO `l38sx_tienda_zones` VALUES (1974,129,'LA','Labuan');
INSERT INTO `l38sx_tienda_zones` VALUES (1975,129,'ME','Melaka');
INSERT INTO `l38sx_tienda_zones` VALUES (1976,129,'NS','Negeri Sembilan');
INSERT INTO `l38sx_tienda_zones` VALUES (1977,129,'PA','Pahang');
INSERT INTO `l38sx_tienda_zones` VALUES (1978,129,'PE','Perak');
INSERT INTO `l38sx_tienda_zones` VALUES (1979,129,'PR','Perlis');
INSERT INTO `l38sx_tienda_zones` VALUES (1980,129,'PP','Pulau Pinang');
INSERT INTO `l38sx_tienda_zones` VALUES (1981,129,'SA','Sabah');
INSERT INTO `l38sx_tienda_zones` VALUES (1982,129,'SR','Sarawak');
INSERT INTO `l38sx_tienda_zones` VALUES (1983,129,'SE','Selangor');
INSERT INTO `l38sx_tienda_zones` VALUES (1984,129,'TE','Terengganu');
INSERT INTO `l38sx_tienda_zones` VALUES (1985,129,'WP','Wilayah Persekutuan');
INSERT INTO `l38sx_tienda_zones` VALUES (1986,130,'THU','Thiladhunmathi Uthuru');
INSERT INTO `l38sx_tienda_zones` VALUES (1987,130,'THD','Thiladhunmathi Dhekunu');
INSERT INTO `l38sx_tienda_zones` VALUES (1988,130,'MLU','Miladhunmadulu Uthuru');
INSERT INTO `l38sx_tienda_zones` VALUES (1989,130,'MLD','Miladhunmadulu Dhekunu');
INSERT INTO `l38sx_tienda_zones` VALUES (1990,130,'MAU','Maalhosmadulu Uthuru');
INSERT INTO `l38sx_tienda_zones` VALUES (1991,130,'MAD','Maalhosmadulu Dhekunu');
INSERT INTO `l38sx_tienda_zones` VALUES (1992,130,'FAA','Faadhippolhu');
INSERT INTO `l38sx_tienda_zones` VALUES (1993,130,'MAA','Male Atoll');
INSERT INTO `l38sx_tienda_zones` VALUES (1994,130,'AAU','Ari Atoll Uthuru');
INSERT INTO `l38sx_tienda_zones` VALUES (1995,130,'AAD','Ari Atoll Dheknu');
INSERT INTO `l38sx_tienda_zones` VALUES (1996,130,'FEA','Felidhe Atoll');
INSERT INTO `l38sx_tienda_zones` VALUES (1997,130,'MUA','Mulaku Atoll');
INSERT INTO `l38sx_tienda_zones` VALUES (1998,130,'NAU','Nilandhe Atoll Uthuru');
INSERT INTO `l38sx_tienda_zones` VALUES (1999,130,'NAD','Nilandhe Atoll Dhekunu');
INSERT INTO `l38sx_tienda_zones` VALUES (2000,130,'KLH','Kolhumadulu');
INSERT INTO `l38sx_tienda_zones` VALUES (2001,130,'HDH','Hadhdhunmathi');
INSERT INTO `l38sx_tienda_zones` VALUES (2002,130,'HAU','Huvadhu Atoll Uthuru');
INSERT INTO `l38sx_tienda_zones` VALUES (2003,130,'HAD','Huvadhu Atoll Dhekunu');
INSERT INTO `l38sx_tienda_zones` VALUES (2004,130,'FMU','Fua Mulaku');
INSERT INTO `l38sx_tienda_zones` VALUES (2005,130,'ADD','Addu');
INSERT INTO `l38sx_tienda_zones` VALUES (2006,131,'GA','Gao');
INSERT INTO `l38sx_tienda_zones` VALUES (2007,131,'KY','Kayes');
INSERT INTO `l38sx_tienda_zones` VALUES (2008,131,'KD','Kidal');
INSERT INTO `l38sx_tienda_zones` VALUES (2009,131,'KL','Koulikoro');
INSERT INTO `l38sx_tienda_zones` VALUES (2010,131,'MP','Mopti');
INSERT INTO `l38sx_tienda_zones` VALUES (2011,131,'SG','Segou');
INSERT INTO `l38sx_tienda_zones` VALUES (2012,131,'SK','Sikasso');
INSERT INTO `l38sx_tienda_zones` VALUES (2013,131,'TB','Tombouctou');
INSERT INTO `l38sx_tienda_zones` VALUES (2014,131,'CD','Bamako Capital District');
INSERT INTO `l38sx_tienda_zones` VALUES (2015,132,'ATT','Attard');
INSERT INTO `l38sx_tienda_zones` VALUES (2016,132,'BAL','Balzan');
INSERT INTO `l38sx_tienda_zones` VALUES (2017,132,'BGU','Birgu');
INSERT INTO `l38sx_tienda_zones` VALUES (2018,132,'BKK','Birkirkara');
INSERT INTO `l38sx_tienda_zones` VALUES (2019,132,'BRZ','Birzebbuga');
INSERT INTO `l38sx_tienda_zones` VALUES (2020,132,'BOR','Bormla');
INSERT INTO `l38sx_tienda_zones` VALUES (2021,132,'DIN','Dingli');
INSERT INTO `l38sx_tienda_zones` VALUES (2022,132,'FGU','Fgura');
INSERT INTO `l38sx_tienda_zones` VALUES (2023,132,'FLO','Floriana');
INSERT INTO `l38sx_tienda_zones` VALUES (2024,132,'GDJ','Gudja');
INSERT INTO `l38sx_tienda_zones` VALUES (2025,132,'GZR','Gzira');
INSERT INTO `l38sx_tienda_zones` VALUES (2026,132,'GRG','Gargur');
INSERT INTO `l38sx_tienda_zones` VALUES (2027,132,'GXQ','Gaxaq');
INSERT INTO `l38sx_tienda_zones` VALUES (2028,132,'HMR','Hamrun');
INSERT INTO `l38sx_tienda_zones` VALUES (2029,132,'IKL','Iklin');
INSERT INTO `l38sx_tienda_zones` VALUES (2030,132,'ISL','Isla');
INSERT INTO `l38sx_tienda_zones` VALUES (2031,132,'KLK','Kalkara');
INSERT INTO `l38sx_tienda_zones` VALUES (2032,132,'KRK','Kirkop');
INSERT INTO `l38sx_tienda_zones` VALUES (2033,132,'LIJ','Lija');
INSERT INTO `l38sx_tienda_zones` VALUES (2034,132,'LUQ','Luqa');
INSERT INTO `l38sx_tienda_zones` VALUES (2035,132,'MRS','Marsa');
INSERT INTO `l38sx_tienda_zones` VALUES (2036,132,'MKL','Marsaskala');
INSERT INTO `l38sx_tienda_zones` VALUES (2037,132,'MXL','Marsaxlokk');
INSERT INTO `l38sx_tienda_zones` VALUES (2038,132,'MDN','Mdina');
INSERT INTO `l38sx_tienda_zones` VALUES (2039,132,'MEL','Melliea');
INSERT INTO `l38sx_tienda_zones` VALUES (2040,132,'MGR','Mgarr');
INSERT INTO `l38sx_tienda_zones` VALUES (2041,132,'MST','Mosta');
INSERT INTO `l38sx_tienda_zones` VALUES (2042,132,'MQA','Mqabba');
INSERT INTO `l38sx_tienda_zones` VALUES (2043,132,'MSI','Msida');
INSERT INTO `l38sx_tienda_zones` VALUES (2044,132,'MTF','Mtarfa');
INSERT INTO `l38sx_tienda_zones` VALUES (2045,132,'NAX','Naxxar');
INSERT INTO `l38sx_tienda_zones` VALUES (2046,132,'PAO','Paola');
INSERT INTO `l38sx_tienda_zones` VALUES (2047,132,'PEM','Pembroke');
INSERT INTO `l38sx_tienda_zones` VALUES (2048,132,'PIE','Pieta');
INSERT INTO `l38sx_tienda_zones` VALUES (2049,132,'QOR','Qormi');
INSERT INTO `l38sx_tienda_zones` VALUES (2050,132,'QRE','Qrendi');
INSERT INTO `l38sx_tienda_zones` VALUES (2051,132,'RAB','Rabat');
INSERT INTO `l38sx_tienda_zones` VALUES (2052,132,'SAF','Safi');
INSERT INTO `l38sx_tienda_zones` VALUES (2053,132,'SGI','San Giljan');
INSERT INTO `l38sx_tienda_zones` VALUES (2054,132,'SLU','Santa Lucija');
INSERT INTO `l38sx_tienda_zones` VALUES (2055,132,'SPB','San Pawl il-Bahar');
INSERT INTO `l38sx_tienda_zones` VALUES (2056,132,'SGW','San Gwann');
INSERT INTO `l38sx_tienda_zones` VALUES (2057,132,'SVE','Santa Venera');
INSERT INTO `l38sx_tienda_zones` VALUES (2058,132,'SIG','Siggiewi');
INSERT INTO `l38sx_tienda_zones` VALUES (2059,132,'SLM','Sliema');
INSERT INTO `l38sx_tienda_zones` VALUES (2060,132,'SWQ','Swieqi');
INSERT INTO `l38sx_tienda_zones` VALUES (2061,132,'TXB','Ta Xbiex');
INSERT INTO `l38sx_tienda_zones` VALUES (2062,132,'TRX','Tarxien');
INSERT INTO `l38sx_tienda_zones` VALUES (2063,132,'VLT','Valletta');
INSERT INTO `l38sx_tienda_zones` VALUES (2064,132,'XGJ','Xgajra');
INSERT INTO `l38sx_tienda_zones` VALUES (2065,132,'ZBR','Zabbar');
INSERT INTO `l38sx_tienda_zones` VALUES (2066,132,'ZBG','Zebbug');
INSERT INTO `l38sx_tienda_zones` VALUES (2067,132,'ZJT','Zejtun');
INSERT INTO `l38sx_tienda_zones` VALUES (2068,132,'ZRQ','Zurrieq');
INSERT INTO `l38sx_tienda_zones` VALUES (2069,132,'FNT','Fontana');
INSERT INTO `l38sx_tienda_zones` VALUES (2070,132,'GHJ','Ghajnsielem');
INSERT INTO `l38sx_tienda_zones` VALUES (2071,132,'GHR','Gharb');
INSERT INTO `l38sx_tienda_zones` VALUES (2072,132,'GHS','Ghasri');
INSERT INTO `l38sx_tienda_zones` VALUES (2073,132,'KRC','Kercem');
INSERT INTO `l38sx_tienda_zones` VALUES (2074,132,'MUN','Munxar');
INSERT INTO `l38sx_tienda_zones` VALUES (2075,132,'NAD','Nadur');
INSERT INTO `l38sx_tienda_zones` VALUES (2076,132,'QAL','Qala');
INSERT INTO `l38sx_tienda_zones` VALUES (2077,132,'VIC','Victoria');
INSERT INTO `l38sx_tienda_zones` VALUES (2078,132,'SLA','San Lawrenz');
INSERT INTO `l38sx_tienda_zones` VALUES (2079,132,'SNT','Sannat');
INSERT INTO `l38sx_tienda_zones` VALUES (2080,132,'ZAG','Xagra');
INSERT INTO `l38sx_tienda_zones` VALUES (2081,132,'XEW','Xewkija');
INSERT INTO `l38sx_tienda_zones` VALUES (2082,132,'ZEB','Zebbug');
INSERT INTO `l38sx_tienda_zones` VALUES (2083,133,'ALG','Ailinginae');
INSERT INTO `l38sx_tienda_zones` VALUES (2084,133,'ALL','Ailinglaplap');
INSERT INTO `l38sx_tienda_zones` VALUES (2085,133,'ALK','Ailuk');
INSERT INTO `l38sx_tienda_zones` VALUES (2086,133,'ARN','Arno');
INSERT INTO `l38sx_tienda_zones` VALUES (2087,133,'AUR','Aur');
INSERT INTO `l38sx_tienda_zones` VALUES (2088,133,'BKR','Bikar');
INSERT INTO `l38sx_tienda_zones` VALUES (2089,133,'BKN','Bikini');
INSERT INTO `l38sx_tienda_zones` VALUES (2090,133,'BKK','Bokak');
INSERT INTO `l38sx_tienda_zones` VALUES (2091,133,'EBN','Ebon');
INSERT INTO `l38sx_tienda_zones` VALUES (2092,133,'ENT','Enewetak');
INSERT INTO `l38sx_tienda_zones` VALUES (2093,133,'EKB','Erikub');
INSERT INTO `l38sx_tienda_zones` VALUES (2094,133,'JBT','Jabat');
INSERT INTO `l38sx_tienda_zones` VALUES (2095,133,'JLT','Jaluit');
INSERT INTO `l38sx_tienda_zones` VALUES (2096,133,'JEM','Jemo');
INSERT INTO `l38sx_tienda_zones` VALUES (2097,133,'KIL','Kili');
INSERT INTO `l38sx_tienda_zones` VALUES (2098,133,'KWJ','Kwajalein');
INSERT INTO `l38sx_tienda_zones` VALUES (2099,133,'LAE','Lae');
INSERT INTO `l38sx_tienda_zones` VALUES (2100,133,'LIB','Lib');
INSERT INTO `l38sx_tienda_zones` VALUES (2101,133,'LKP','Likiep');
INSERT INTO `l38sx_tienda_zones` VALUES (2102,133,'MJR','Majuro');
INSERT INTO `l38sx_tienda_zones` VALUES (2103,133,'MLP','Maloelap');
INSERT INTO `l38sx_tienda_zones` VALUES (2104,133,'MJT','Mejit');
INSERT INTO `l38sx_tienda_zones` VALUES (2105,133,'MIL','Mili');
INSERT INTO `l38sx_tienda_zones` VALUES (2106,133,'NMK','Namorik');
INSERT INTO `l38sx_tienda_zones` VALUES (2107,133,'NAM','Namu');
INSERT INTO `l38sx_tienda_zones` VALUES (2108,133,'RGL','Rongelap');
INSERT INTO `l38sx_tienda_zones` VALUES (2109,133,'RGK','Rongrik');
INSERT INTO `l38sx_tienda_zones` VALUES (2110,133,'TOK','Toke');
INSERT INTO `l38sx_tienda_zones` VALUES (2111,133,'UJA','Ujae');
INSERT INTO `l38sx_tienda_zones` VALUES (2112,133,'UJL','Ujelang');
INSERT INTO `l38sx_tienda_zones` VALUES (2113,133,'UTK','Utirik');
INSERT INTO `l38sx_tienda_zones` VALUES (2114,133,'WTH','Wotho');
INSERT INTO `l38sx_tienda_zones` VALUES (2115,133,'WTJ','Wotje');
INSERT INTO `l38sx_tienda_zones` VALUES (2116,135,'AD','Adrar');
INSERT INTO `l38sx_tienda_zones` VALUES (2117,135,'AS','Assaba');
INSERT INTO `l38sx_tienda_zones` VALUES (2118,135,'BR','Brakna');
INSERT INTO `l38sx_tienda_zones` VALUES (2119,135,'DN','Dakhlet Nouadhibou');
INSERT INTO `l38sx_tienda_zones` VALUES (2120,135,'GO','Gorgol');
INSERT INTO `l38sx_tienda_zones` VALUES (2121,135,'GM','Guidimaka');
INSERT INTO `l38sx_tienda_zones` VALUES (2122,135,'HC','Hodh Ech Chargui');
INSERT INTO `l38sx_tienda_zones` VALUES (2123,135,'HG','Hodh El Gharbi');
INSERT INTO `l38sx_tienda_zones` VALUES (2124,135,'IN','Inchiri');
INSERT INTO `l38sx_tienda_zones` VALUES (2125,135,'TA','Tagant');
INSERT INTO `l38sx_tienda_zones` VALUES (2126,135,'TZ','Tiris Zemmour');
INSERT INTO `l38sx_tienda_zones` VALUES (2127,135,'TR','Trarza');
INSERT INTO `l38sx_tienda_zones` VALUES (2128,135,'NO','Nouakchott');
INSERT INTO `l38sx_tienda_zones` VALUES (2129,136,'BR','Beau Bassin-Rose Hill');
INSERT INTO `l38sx_tienda_zones` VALUES (2130,136,'CU','Curepipe');
INSERT INTO `l38sx_tienda_zones` VALUES (2131,136,'PU','Port Louis');
INSERT INTO `l38sx_tienda_zones` VALUES (2132,136,'QB','Quatre Bornes');
INSERT INTO `l38sx_tienda_zones` VALUES (2133,136,'VP','Vacoas-Phoenix');
INSERT INTO `l38sx_tienda_zones` VALUES (2134,136,'AG','Agalega Islands');
INSERT INTO `l38sx_tienda_zones` VALUES (2135,136,'CC','Cargados Cara#_ Shoals (Saint Brandon Islands)');
INSERT INTO `l38sx_tienda_zones` VALUES (2136,136,'RO','Rodrigues');
INSERT INTO `l38sx_tienda_zones` VALUES (2137,136,'BL','Black River');
INSERT INTO `l38sx_tienda_zones` VALUES (2138,136,'FL','Flacq');
INSERT INTO `l38sx_tienda_zones` VALUES (2139,136,'GP','Grand Port');
INSERT INTO `l38sx_tienda_zones` VALUES (2140,136,'MO','Moka');
INSERT INTO `l38sx_tienda_zones` VALUES (2141,136,'PA','Pamplemousses');
INSERT INTO `l38sx_tienda_zones` VALUES (2142,136,'PW','Plaines Wilhems');
INSERT INTO `l38sx_tienda_zones` VALUES (2143,136,'PL','Port Louis');
INSERT INTO `l38sx_tienda_zones` VALUES (2144,136,'RR','Riviere du Rempart');
INSERT INTO `l38sx_tienda_zones` VALUES (2145,136,'SA','Savanne');
INSERT INTO `l38sx_tienda_zones` VALUES (2146,138,'BA','Baja California Norte');
INSERT INTO `l38sx_tienda_zones` VALUES (2147,138,'BJ','Baja California Sur');
INSERT INTO `l38sx_tienda_zones` VALUES (2148,138,'CE','Campeche');
INSERT INTO `l38sx_tienda_zones` VALUES (2149,138,'CI','Chiapas');
INSERT INTO `l38sx_tienda_zones` VALUES (2150,138,'CH','Chihuahua');
INSERT INTO `l38sx_tienda_zones` VALUES (2151,138,'CU','Coahuila de Zaragoza');
INSERT INTO `l38sx_tienda_zones` VALUES (2152,138,'CL','Colima');
INSERT INTO `l38sx_tienda_zones` VALUES (2153,138,'DF','Distrito Federal');
INSERT INTO `l38sx_tienda_zones` VALUES (2154,138,'DO','Durango');
INSERT INTO `l38sx_tienda_zones` VALUES (2155,138,'GX','Guanajuato');
INSERT INTO `l38sx_tienda_zones` VALUES (2156,138,'GR','Guerrero');
INSERT INTO `l38sx_tienda_zones` VALUES (2157,138,'HL','Hidalgo');
INSERT INTO `l38sx_tienda_zones` VALUES (2158,138,'JL','Jalisco');
INSERT INTO `l38sx_tienda_zones` VALUES (2159,138,'MX','Estado de México');
INSERT INTO `l38sx_tienda_zones` VALUES (2160,138,'MC','Michoacan de Ocampo');
INSERT INTO `l38sx_tienda_zones` VALUES (2161,138,'MR','Morelos');
INSERT INTO `l38sx_tienda_zones` VALUES (2162,138,'NA','Nayarit');
INSERT INTO `l38sx_tienda_zones` VALUES (2163,138,'NN','Nuevo Leon');
INSERT INTO `l38sx_tienda_zones` VALUES (2164,138,'OA','Oaxaca');
INSERT INTO `l38sx_tienda_zones` VALUES (2165,138,'PU','Puebla');
INSERT INTO `l38sx_tienda_zones` VALUES (2166,138,'QU','Queretaro de Arteaga');
INSERT INTO `l38sx_tienda_zones` VALUES (2167,138,'QR','Quintana Roo');
INSERT INTO `l38sx_tienda_zones` VALUES (2168,138,'SL','San Luis Potosi');
INSERT INTO `l38sx_tienda_zones` VALUES (2169,138,'SI','Sinaloa');
INSERT INTO `l38sx_tienda_zones` VALUES (2170,138,'SO','Sonora');
INSERT INTO `l38sx_tienda_zones` VALUES (2171,138,'TB','Tabasco');
INSERT INTO `l38sx_tienda_zones` VALUES (2172,138,'TA','Tamaulipas');
INSERT INTO `l38sx_tienda_zones` VALUES (2173,138,'TL','Tlaxcala');
INSERT INTO `l38sx_tienda_zones` VALUES (2174,138,'VC','Veracruz-Llave');
INSERT INTO `l38sx_tienda_zones` VALUES (2175,138,'YU','Yucatan');
INSERT INTO `l38sx_tienda_zones` VALUES (2176,138,'ZA','Zacatecas');
INSERT INTO `l38sx_tienda_zones` VALUES (2177,139,'C','Chuuk');
INSERT INTO `l38sx_tienda_zones` VALUES (2178,139,'K','Kosrae');
INSERT INTO `l38sx_tienda_zones` VALUES (2179,139,'P','Pohnpei');
INSERT INTO `l38sx_tienda_zones` VALUES (2180,139,'Y','Yap');
INSERT INTO `l38sx_tienda_zones` VALUES (2181,140,'GA','Gagauzia');
INSERT INTO `l38sx_tienda_zones` VALUES (2182,140,'CU','Chisinau');
INSERT INTO `l38sx_tienda_zones` VALUES (2183,140,'BA','Balti');
INSERT INTO `l38sx_tienda_zones` VALUES (2184,140,'CA','Cahul');
INSERT INTO `l38sx_tienda_zones` VALUES (2185,140,'ED','Edinet');
INSERT INTO `l38sx_tienda_zones` VALUES (2186,140,'LA','Lapusna');
INSERT INTO `l38sx_tienda_zones` VALUES (2187,140,'OR','Orhei');
INSERT INTO `l38sx_tienda_zones` VALUES (2188,140,'SO','Soroca');
INSERT INTO `l38sx_tienda_zones` VALUES (2189,140,'TI','Tighina');
INSERT INTO `l38sx_tienda_zones` VALUES (2190,140,'UN','Ungheni');
INSERT INTO `l38sx_tienda_zones` VALUES (2191,140,'SN','Stînga Nistrului');
INSERT INTO `l38sx_tienda_zones` VALUES (2192,141,'FV','Fontvieille');
INSERT INTO `l38sx_tienda_zones` VALUES (2193,141,'LC','La Condamine');
INSERT INTO `l38sx_tienda_zones` VALUES (2194,141,'MV','Monaco-Ville');
INSERT INTO `l38sx_tienda_zones` VALUES (2195,141,'MC','Monte-Carlo');
INSERT INTO `l38sx_tienda_zones` VALUES (2196,142,'1','Ulanbaatar');
INSERT INTO `l38sx_tienda_zones` VALUES (2197,142,'035','Orhon');
INSERT INTO `l38sx_tienda_zones` VALUES (2198,142,'037','Darhan uul');
INSERT INTO `l38sx_tienda_zones` VALUES (2199,142,'039','Hentiy');
INSERT INTO `l38sx_tienda_zones` VALUES (2200,142,'041','Hovsgol');
INSERT INTO `l38sx_tienda_zones` VALUES (2201,142,'043','Hovd');
INSERT INTO `l38sx_tienda_zones` VALUES (2202,142,'046','Uvs');
INSERT INTO `l38sx_tienda_zones` VALUES (2203,142,'047','Tov');
INSERT INTO `l38sx_tienda_zones` VALUES (2204,142,'049','Selenge');
INSERT INTO `l38sx_tienda_zones` VALUES (2205,142,'051','Suhbaatar');
INSERT INTO `l38sx_tienda_zones` VALUES (2206,142,'053','Omnogovi');
INSERT INTO `l38sx_tienda_zones` VALUES (2207,142,'055','Ovorhangay');
INSERT INTO `l38sx_tienda_zones` VALUES (2208,142,'057','Dzavhan');
INSERT INTO `l38sx_tienda_zones` VALUES (2209,142,'059','DundgovL');
INSERT INTO `l38sx_tienda_zones` VALUES (2210,142,'061','Dornod');
INSERT INTO `l38sx_tienda_zones` VALUES (2211,142,'063','Dornogov');
INSERT INTO `l38sx_tienda_zones` VALUES (2212,142,'064','Govi-Sumber');
INSERT INTO `l38sx_tienda_zones` VALUES (2213,142,'065','Govi-Altay');
INSERT INTO `l38sx_tienda_zones` VALUES (2214,142,'067','Bulgan');
INSERT INTO `l38sx_tienda_zones` VALUES (2215,142,'069','Bayanhongor');
INSERT INTO `l38sx_tienda_zones` VALUES (2216,142,'071','Bayan-Olgiy');
INSERT INTO `l38sx_tienda_zones` VALUES (2217,142,'073','Arhangay');
INSERT INTO `l38sx_tienda_zones` VALUES (2218,143,'A','Saint Anthony');
INSERT INTO `l38sx_tienda_zones` VALUES (2219,143,'G','Saint Georges');
INSERT INTO `l38sx_tienda_zones` VALUES (2220,143,'P','Saint Peter');
INSERT INTO `l38sx_tienda_zones` VALUES (2221,144,'AGD','Agadir');
INSERT INTO `l38sx_tienda_zones` VALUES (2222,144,'HOC','Al Hoceima');
INSERT INTO `l38sx_tienda_zones` VALUES (2223,144,'AZI','Azilal');
INSERT INTO `l38sx_tienda_zones` VALUES (2224,144,'BME','Beni Mellal');
INSERT INTO `l38sx_tienda_zones` VALUES (2225,144,'BSL','Ben Slimane');
INSERT INTO `l38sx_tienda_zones` VALUES (2226,144,'BLM','Boulemane');
INSERT INTO `l38sx_tienda_zones` VALUES (2227,144,'CBL','Casablanca');
INSERT INTO `l38sx_tienda_zones` VALUES (2228,144,'CHA','Chaouen');
INSERT INTO `l38sx_tienda_zones` VALUES (2229,144,'EJA','El Jadida');
INSERT INTO `l38sx_tienda_zones` VALUES (2230,144,'EKS','El Kelaa des Sraghna');
INSERT INTO `l38sx_tienda_zones` VALUES (2231,144,'ERA','Er Rachidia');
INSERT INTO `l38sx_tienda_zones` VALUES (2232,144,'ESS','Essaouira');
INSERT INTO `l38sx_tienda_zones` VALUES (2233,144,'FES','Fes');
INSERT INTO `l38sx_tienda_zones` VALUES (2234,144,'FIG','Figuig');
INSERT INTO `l38sx_tienda_zones` VALUES (2235,144,'GLM','Guelmim');
INSERT INTO `l38sx_tienda_zones` VALUES (2236,144,'IFR','Ifrane');
INSERT INTO `l38sx_tienda_zones` VALUES (2237,144,'KEN','Kenitra');
INSERT INTO `l38sx_tienda_zones` VALUES (2238,144,'KHM','Khemisset');
INSERT INTO `l38sx_tienda_zones` VALUES (2239,144,'KHN','Khenifra');
INSERT INTO `l38sx_tienda_zones` VALUES (2240,144,'KHO','Khouribga');
INSERT INTO `l38sx_tienda_zones` VALUES (2241,144,'LYN','Laayoune');
INSERT INTO `l38sx_tienda_zones` VALUES (2242,144,'LAR','Larache');
INSERT INTO `l38sx_tienda_zones` VALUES (2243,144,'MRK','Marrakech');
INSERT INTO `l38sx_tienda_zones` VALUES (2244,144,'MKN','Meknes');
INSERT INTO `l38sx_tienda_zones` VALUES (2245,144,'NAD','Nador');
INSERT INTO `l38sx_tienda_zones` VALUES (2246,144,'ORZ','Ouarzazate');
INSERT INTO `l38sx_tienda_zones` VALUES (2247,144,'OUJ','Oujda');
INSERT INTO `l38sx_tienda_zones` VALUES (2248,144,'RSA','Rabat-Sale');
INSERT INTO `l38sx_tienda_zones` VALUES (2249,144,'SAF','Safi');
INSERT INTO `l38sx_tienda_zones` VALUES (2250,144,'SET','Settat');
INSERT INTO `l38sx_tienda_zones` VALUES (2251,144,'SKA','Sidi Kacem');
INSERT INTO `l38sx_tienda_zones` VALUES (2252,144,'TGR','Tangier');
INSERT INTO `l38sx_tienda_zones` VALUES (2253,144,'TAN','Tan-Tan');
INSERT INTO `l38sx_tienda_zones` VALUES (2254,144,'TAO','Taounate');
INSERT INTO `l38sx_tienda_zones` VALUES (2255,144,'TRD','Taroudannt');
INSERT INTO `l38sx_tienda_zones` VALUES (2256,144,'TAT','Tata');
INSERT INTO `l38sx_tienda_zones` VALUES (2257,144,'TAZ','Taza');
INSERT INTO `l38sx_tienda_zones` VALUES (2258,144,'TET','Tetouan');
INSERT INTO `l38sx_tienda_zones` VALUES (2259,144,'TIZ','Tiznit');
INSERT INTO `l38sx_tienda_zones` VALUES (2260,144,'ADK','Ad Dakhla');
INSERT INTO `l38sx_tienda_zones` VALUES (2261,144,'BJD','Boujdour');
INSERT INTO `l38sx_tienda_zones` VALUES (2262,144,'ESM','Es Smara');
INSERT INTO `l38sx_tienda_zones` VALUES (2263,145,'CD','Cabo Delgado');
INSERT INTO `l38sx_tienda_zones` VALUES (2264,145,'GZ','Gaza');
INSERT INTO `l38sx_tienda_zones` VALUES (2265,145,'IN','Inhambane');
INSERT INTO `l38sx_tienda_zones` VALUES (2266,145,'MN','Manica');
INSERT INTO `l38sx_tienda_zones` VALUES (2267,145,'MC','Maputo (city)');
INSERT INTO `l38sx_tienda_zones` VALUES (2268,145,'MP','Maputo');
INSERT INTO `l38sx_tienda_zones` VALUES (2269,145,'NA','Nampula');
INSERT INTO `l38sx_tienda_zones` VALUES (2270,145,'NI','Niassa');
INSERT INTO `l38sx_tienda_zones` VALUES (2271,145,'SO','Sofala');
INSERT INTO `l38sx_tienda_zones` VALUES (2272,145,'TE','Tete');
INSERT INTO `l38sx_tienda_zones` VALUES (2273,145,'ZA','Zambezia');
INSERT INTO `l38sx_tienda_zones` VALUES (2274,146,'AY','Ayeyarwady');
INSERT INTO `l38sx_tienda_zones` VALUES (2275,146,'BG','Bago');
INSERT INTO `l38sx_tienda_zones` VALUES (2276,146,'MG','Magway');
INSERT INTO `l38sx_tienda_zones` VALUES (2277,146,'MD','Mandalay');
INSERT INTO `l38sx_tienda_zones` VALUES (2278,146,'SG','Sagaing');
INSERT INTO `l38sx_tienda_zones` VALUES (2279,146,'TN','Tanintharyi');
INSERT INTO `l38sx_tienda_zones` VALUES (2280,146,'YG','Yangon');
INSERT INTO `l38sx_tienda_zones` VALUES (2281,146,'CH','Chin State');
INSERT INTO `l38sx_tienda_zones` VALUES (2282,146,'KC','Kachin State');
INSERT INTO `l38sx_tienda_zones` VALUES (2283,146,'KH','Kayah State');
INSERT INTO `l38sx_tienda_zones` VALUES (2284,146,'KN','Kayin State');
INSERT INTO `l38sx_tienda_zones` VALUES (2285,146,'MN','Mon State');
INSERT INTO `l38sx_tienda_zones` VALUES (2286,146,'RK','Rakhine State');
INSERT INTO `l38sx_tienda_zones` VALUES (2287,146,'SH','Shan State');
INSERT INTO `l38sx_tienda_zones` VALUES (2288,147,'CA','Caprivi');
INSERT INTO `l38sx_tienda_zones` VALUES (2289,147,'ER','Erongo');
INSERT INTO `l38sx_tienda_zones` VALUES (2290,147,'HA','Hardap');
INSERT INTO `l38sx_tienda_zones` VALUES (2291,147,'KR','Karas');
INSERT INTO `l38sx_tienda_zones` VALUES (2292,147,'KV','Kavango');
INSERT INTO `l38sx_tienda_zones` VALUES (2293,147,'KH','Khomas');
INSERT INTO `l38sx_tienda_zones` VALUES (2294,147,'KU','Kunene');
INSERT INTO `l38sx_tienda_zones` VALUES (2295,147,'OW','Ohangwena');
INSERT INTO `l38sx_tienda_zones` VALUES (2296,147,'OK','Omaheke');
INSERT INTO `l38sx_tienda_zones` VALUES (2297,147,'OT','Omusati');
INSERT INTO `l38sx_tienda_zones` VALUES (2298,147,'ON','Oshana');
INSERT INTO `l38sx_tienda_zones` VALUES (2299,147,'OO','Oshikoto');
INSERT INTO `l38sx_tienda_zones` VALUES (2300,147,'OJ','Otjozondjupa');
INSERT INTO `l38sx_tienda_zones` VALUES (2301,148,'AO','Aiwo');
INSERT INTO `l38sx_tienda_zones` VALUES (2302,148,'AA','Anabar');
INSERT INTO `l38sx_tienda_zones` VALUES (2303,148,'AT','Anetan');
INSERT INTO `l38sx_tienda_zones` VALUES (2304,148,'AI','Anibare');
INSERT INTO `l38sx_tienda_zones` VALUES (2305,148,'BA','Baiti');
INSERT INTO `l38sx_tienda_zones` VALUES (2306,148,'BO','Boe');
INSERT INTO `l38sx_tienda_zones` VALUES (2307,148,'BU','Buada');
INSERT INTO `l38sx_tienda_zones` VALUES (2308,148,'DE','Denigomodu');
INSERT INTO `l38sx_tienda_zones` VALUES (2309,148,'EW','Ewa');
INSERT INTO `l38sx_tienda_zones` VALUES (2310,148,'IJ','Ijuw');
INSERT INTO `l38sx_tienda_zones` VALUES (2311,148,'ME','Meneng');
INSERT INTO `l38sx_tienda_zones` VALUES (2312,148,'NI','Nibok');
INSERT INTO `l38sx_tienda_zones` VALUES (2313,148,'UA','Uaboe');
INSERT INTO `l38sx_tienda_zones` VALUES (2314,148,'YA','Yaren');
INSERT INTO `l38sx_tienda_zones` VALUES (2315,149,'BA','Bagmati');
INSERT INTO `l38sx_tienda_zones` VALUES (2316,149,'BH','Bheri');
INSERT INTO `l38sx_tienda_zones` VALUES (2317,149,'DH','Dhawalagiri');
INSERT INTO `l38sx_tienda_zones` VALUES (2318,149,'GA','Gandaki');
INSERT INTO `l38sx_tienda_zones` VALUES (2319,149,'JA','Janakpur');
INSERT INTO `l38sx_tienda_zones` VALUES (2320,149,'KA','Karnali');
INSERT INTO `l38sx_tienda_zones` VALUES (2321,149,'KO','Kosi');
INSERT INTO `l38sx_tienda_zones` VALUES (2322,149,'LU','Lumbini');
INSERT INTO `l38sx_tienda_zones` VALUES (2323,149,'MA','Mahakali');
INSERT INTO `l38sx_tienda_zones` VALUES (2324,149,'ME','Mechi');
INSERT INTO `l38sx_tienda_zones` VALUES (2325,149,'NA','Narayani');
INSERT INTO `l38sx_tienda_zones` VALUES (2326,149,'RA','Rapti');
INSERT INTO `l38sx_tienda_zones` VALUES (2327,149,'SA','Sagarmatha');
INSERT INTO `l38sx_tienda_zones` VALUES (2328,149,'SE','Seti');
INSERT INTO `l38sx_tienda_zones` VALUES (2329,150,'DR','Drenthe');
INSERT INTO `l38sx_tienda_zones` VALUES (2330,150,'FL','Flevoland');
INSERT INTO `l38sx_tienda_zones` VALUES (2331,150,'FR','Friesland');
INSERT INTO `l38sx_tienda_zones` VALUES (2332,150,'GE','Gelderland');
INSERT INTO `l38sx_tienda_zones` VALUES (2333,150,'GR','Groningen');
INSERT INTO `l38sx_tienda_zones` VALUES (2334,150,'LI','Limburg');
INSERT INTO `l38sx_tienda_zones` VALUES (2335,150,'NB','Noord Brabant');
INSERT INTO `l38sx_tienda_zones` VALUES (2336,150,'NH','Noord Holland');
INSERT INTO `l38sx_tienda_zones` VALUES (2337,150,'OV','Overijssel');
INSERT INTO `l38sx_tienda_zones` VALUES (2338,150,'UT','Utrecht');
INSERT INTO `l38sx_tienda_zones` VALUES (2339,150,'ZE','Zeeland');
INSERT INTO `l38sx_tienda_zones` VALUES (2340,150,'ZH','Zuid Holland');
INSERT INTO `l38sx_tienda_zones` VALUES (2341,152,'L','Iles Loyaute');
INSERT INTO `l38sx_tienda_zones` VALUES (2342,152,'N','Nord');
INSERT INTO `l38sx_tienda_zones` VALUES (2343,152,'S','Sud');
INSERT INTO `l38sx_tienda_zones` VALUES (2344,153,'AUK','Auckland');
INSERT INTO `l38sx_tienda_zones` VALUES (2345,153,'BOP','Bay of Plenty');
INSERT INTO `l38sx_tienda_zones` VALUES (2346,153,'CAN','Canterbury');
INSERT INTO `l38sx_tienda_zones` VALUES (2347,153,'COR','Coromandel');
INSERT INTO `l38sx_tienda_zones` VALUES (2348,153,'GIS','Gisborne');
INSERT INTO `l38sx_tienda_zones` VALUES (2349,153,'FIO','Fiordland');
INSERT INTO `l38sx_tienda_zones` VALUES (2350,153,'HKB','Hawke\'s Bay');
INSERT INTO `l38sx_tienda_zones` VALUES (2351,153,'MBH','Marlborough');
INSERT INTO `l38sx_tienda_zones` VALUES (2352,153,'MWT','Manawatu-Wanganui');
INSERT INTO `l38sx_tienda_zones` VALUES (2353,153,'MCM','Mt Cook-Mackenzie');
INSERT INTO `l38sx_tienda_zones` VALUES (2354,153,'NSN','Nelson');
INSERT INTO `l38sx_tienda_zones` VALUES (2355,153,'NTL','Northland');
INSERT INTO `l38sx_tienda_zones` VALUES (2356,153,'OTA','Otago');
INSERT INTO `l38sx_tienda_zones` VALUES (2357,153,'STL','Southland');
INSERT INTO `l38sx_tienda_zones` VALUES (2358,153,'TKI','Taranaki');
INSERT INTO `l38sx_tienda_zones` VALUES (2359,153,'WGN','Wellington');
INSERT INTO `l38sx_tienda_zones` VALUES (2360,153,'WKO','Waikato');
INSERT INTO `l38sx_tienda_zones` VALUES (2361,153,'WAI','Wairprarapa');
INSERT INTO `l38sx_tienda_zones` VALUES (2362,153,'WTC','West Coast');
INSERT INTO `l38sx_tienda_zones` VALUES (2363,154,'AN','Atlantico Norte');
INSERT INTO `l38sx_tienda_zones` VALUES (2364,154,'AS','Atlantico Sur');
INSERT INTO `l38sx_tienda_zones` VALUES (2365,154,'BO','Boaco');
INSERT INTO `l38sx_tienda_zones` VALUES (2366,154,'CA','Carazo');
INSERT INTO `l38sx_tienda_zones` VALUES (2367,154,'CI','Chinandega');
INSERT INTO `l38sx_tienda_zones` VALUES (2368,154,'CO','Chontales');
INSERT INTO `l38sx_tienda_zones` VALUES (2369,154,'ES','Esteli');
INSERT INTO `l38sx_tienda_zones` VALUES (2370,154,'GR','Granada');
INSERT INTO `l38sx_tienda_zones` VALUES (2371,154,'JI','Jinotega');
INSERT INTO `l38sx_tienda_zones` VALUES (2372,154,'LE','Leon');
INSERT INTO `l38sx_tienda_zones` VALUES (2373,154,'MD','Madriz');
INSERT INTO `l38sx_tienda_zones` VALUES (2374,154,'MN','Managua');
INSERT INTO `l38sx_tienda_zones` VALUES (2375,154,'MS','Masaya');
INSERT INTO `l38sx_tienda_zones` VALUES (2376,154,'MT','Matagalpa');
INSERT INTO `l38sx_tienda_zones` VALUES (2377,154,'NS','Nuevo Segovia');
INSERT INTO `l38sx_tienda_zones` VALUES (2378,154,'RS','Rio San Juan');
INSERT INTO `l38sx_tienda_zones` VALUES (2379,154,'RI','Rivas');
INSERT INTO `l38sx_tienda_zones` VALUES (2380,155,'AG','Agadez');
INSERT INTO `l38sx_tienda_zones` VALUES (2381,155,'DF','Diffa');
INSERT INTO `l38sx_tienda_zones` VALUES (2382,155,'DS','Dosso');
INSERT INTO `l38sx_tienda_zones` VALUES (2383,155,'MA','Maradi');
INSERT INTO `l38sx_tienda_zones` VALUES (2384,155,'NM','Niamey');
INSERT INTO `l38sx_tienda_zones` VALUES (2385,155,'TH','Tahoua');
INSERT INTO `l38sx_tienda_zones` VALUES (2386,155,'TL','Tillaberi');
INSERT INTO `l38sx_tienda_zones` VALUES (2387,155,'ZD','Zinder');
INSERT INTO `l38sx_tienda_zones` VALUES (2388,156,'AB','Abia');
INSERT INTO `l38sx_tienda_zones` VALUES (2389,156,'CT','Abuja Federal Capital Territory');
INSERT INTO `l38sx_tienda_zones` VALUES (2390,156,'AD','Adamawa');
INSERT INTO `l38sx_tienda_zones` VALUES (2391,156,'AK','Akwa Ibom');
INSERT INTO `l38sx_tienda_zones` VALUES (2392,156,'AN','Anambra');
INSERT INTO `l38sx_tienda_zones` VALUES (2393,156,'BC','Bauchi');
INSERT INTO `l38sx_tienda_zones` VALUES (2394,156,'BY','Bayelsa');
INSERT INTO `l38sx_tienda_zones` VALUES (2395,156,'BN','Benue');
INSERT INTO `l38sx_tienda_zones` VALUES (2396,156,'BO','Borno');
INSERT INTO `l38sx_tienda_zones` VALUES (2397,156,'CR','Cross River');
INSERT INTO `l38sx_tienda_zones` VALUES (2398,156,'DE','Delta');
INSERT INTO `l38sx_tienda_zones` VALUES (2399,156,'EB','Ebonyi');
INSERT INTO `l38sx_tienda_zones` VALUES (2400,156,'ED','Edo');
INSERT INTO `l38sx_tienda_zones` VALUES (2401,156,'EK','Ekiti');
INSERT INTO `l38sx_tienda_zones` VALUES (2402,156,'EN','Enugu');
INSERT INTO `l38sx_tienda_zones` VALUES (2403,156,'GO','Gombe');
INSERT INTO `l38sx_tienda_zones` VALUES (2404,156,'IM','Imo');
INSERT INTO `l38sx_tienda_zones` VALUES (2405,156,'JI','Jigawa');
INSERT INTO `l38sx_tienda_zones` VALUES (2406,156,'KD','Kaduna');
INSERT INTO `l38sx_tienda_zones` VALUES (2407,156,'KN','Kano');
INSERT INTO `l38sx_tienda_zones` VALUES (2408,156,'KT','Katsina');
INSERT INTO `l38sx_tienda_zones` VALUES (2409,156,'KE','Kebbi');
INSERT INTO `l38sx_tienda_zones` VALUES (2410,156,'KO','Kogi');
INSERT INTO `l38sx_tienda_zones` VALUES (2411,156,'KW','Kwara');
INSERT INTO `l38sx_tienda_zones` VALUES (2412,156,'LA','Lagos');
INSERT INTO `l38sx_tienda_zones` VALUES (2413,156,'NA','Nassarawa');
INSERT INTO `l38sx_tienda_zones` VALUES (2414,156,'NI','Niger');
INSERT INTO `l38sx_tienda_zones` VALUES (2415,156,'OG','Ogun');
INSERT INTO `l38sx_tienda_zones` VALUES (2416,156,'ONG','Ondo');
INSERT INTO `l38sx_tienda_zones` VALUES (2417,156,'OS','Osun');
INSERT INTO `l38sx_tienda_zones` VALUES (2418,156,'OY','Oyo');
INSERT INTO `l38sx_tienda_zones` VALUES (2419,156,'PL','Plateau');
INSERT INTO `l38sx_tienda_zones` VALUES (2420,156,'RI','Rivers');
INSERT INTO `l38sx_tienda_zones` VALUES (2421,156,'SO','Sokoto');
INSERT INTO `l38sx_tienda_zones` VALUES (2422,156,'TA','Taraba');
INSERT INTO `l38sx_tienda_zones` VALUES (2423,156,'YO','Yobe');
INSERT INTO `l38sx_tienda_zones` VALUES (2424,156,'ZA','Zamfara');
INSERT INTO `l38sx_tienda_zones` VALUES (2425,159,'N','Northern Islands');
INSERT INTO `l38sx_tienda_zones` VALUES (2426,159,'R','Rota');
INSERT INTO `l38sx_tienda_zones` VALUES (2427,159,'S','Saipan');
INSERT INTO `l38sx_tienda_zones` VALUES (2428,159,'T','Tinian');
INSERT INTO `l38sx_tienda_zones` VALUES (2429,160,'AK','Akershus');
INSERT INTO `l38sx_tienda_zones` VALUES (2430,160,'AA','Aust-Agder');
INSERT INTO `l38sx_tienda_zones` VALUES (2431,160,'BU','Buskerud');
INSERT INTO `l38sx_tienda_zones` VALUES (2432,160,'FM','Finnmark');
INSERT INTO `l38sx_tienda_zones` VALUES (2433,160,'HM','Hedmark');
INSERT INTO `l38sx_tienda_zones` VALUES (2434,160,'HL','Hordaland');
INSERT INTO `l38sx_tienda_zones` VALUES (2435,160,'MR','More og Romdal');
INSERT INTO `l38sx_tienda_zones` VALUES (2436,160,'NT','Nord-Trondelag');
INSERT INTO `l38sx_tienda_zones` VALUES (2437,160,'NL','Nordland');
INSERT INTO `l38sx_tienda_zones` VALUES (2438,160,'OF','Ostfold');
INSERT INTO `l38sx_tienda_zones` VALUES (2439,160,'OP','Oppland');
INSERT INTO `l38sx_tienda_zones` VALUES (2440,160,'OL','Oslo');
INSERT INTO `l38sx_tienda_zones` VALUES (2441,160,'RL','Rogaland');
INSERT INTO `l38sx_tienda_zones` VALUES (2442,160,'ST','Sor-Trondelag');
INSERT INTO `l38sx_tienda_zones` VALUES (2443,160,'SJ','Sogn og Fjordane');
INSERT INTO `l38sx_tienda_zones` VALUES (2444,160,'SV','Svalbard');
INSERT INTO `l38sx_tienda_zones` VALUES (2445,160,'TM','Telemark');
INSERT INTO `l38sx_tienda_zones` VALUES (2446,160,'TR','Troms');
INSERT INTO `l38sx_tienda_zones` VALUES (2447,160,'VA','Vest-Agder');
INSERT INTO `l38sx_tienda_zones` VALUES (2448,160,'VF','Vestfold');
INSERT INTO `l38sx_tienda_zones` VALUES (2449,161,'DA','Ad Dakhiliyah');
INSERT INTO `l38sx_tienda_zones` VALUES (2450,161,'BA','Al Batinah');
INSERT INTO `l38sx_tienda_zones` VALUES (2451,161,'WU','Al Wusta');
INSERT INTO `l38sx_tienda_zones` VALUES (2452,161,'SH','Ash Sharqiyah');
INSERT INTO `l38sx_tienda_zones` VALUES (2453,161,'ZA','Az Zahirah');
INSERT INTO `l38sx_tienda_zones` VALUES (2454,161,'MA','Masqat');
INSERT INTO `l38sx_tienda_zones` VALUES (2455,161,'MU','Musandam');
INSERT INTO `l38sx_tienda_zones` VALUES (2456,161,'ZU','Zufar');
INSERT INTO `l38sx_tienda_zones` VALUES (2457,162,'B','Balochistan');
INSERT INTO `l38sx_tienda_zones` VALUES (2458,162,'T','Federally Administered Tribal Areas');
INSERT INTO `l38sx_tienda_zones` VALUES (2459,162,'I','Islamabad Capital Territory');
INSERT INTO `l38sx_tienda_zones` VALUES (2460,162,'N','North-West Frontier');
INSERT INTO `l38sx_tienda_zones` VALUES (2461,162,'P','Punjab');
INSERT INTO `l38sx_tienda_zones` VALUES (2462,162,'S','Sindh');
INSERT INTO `l38sx_tienda_zones` VALUES (2463,163,'AM','Aimeliik');
INSERT INTO `l38sx_tienda_zones` VALUES (2464,163,'AR','Airai');
INSERT INTO `l38sx_tienda_zones` VALUES (2465,163,'AN','Angaur');
INSERT INTO `l38sx_tienda_zones` VALUES (2466,163,'HA','Hatohobei');
INSERT INTO `l38sx_tienda_zones` VALUES (2467,163,'KA','Kayangel');
INSERT INTO `l38sx_tienda_zones` VALUES (2468,163,'KO','Koror');
INSERT INTO `l38sx_tienda_zones` VALUES (2469,163,'ME','Melekeok');
INSERT INTO `l38sx_tienda_zones` VALUES (2470,163,'NA','Ngaraard');
INSERT INTO `l38sx_tienda_zones` VALUES (2471,163,'NG','Ngarchelong');
INSERT INTO `l38sx_tienda_zones` VALUES (2472,163,'ND','Ngardmau');
INSERT INTO `l38sx_tienda_zones` VALUES (2473,163,'NT','Ngatpang');
INSERT INTO `l38sx_tienda_zones` VALUES (2474,163,'NC','Ngchesar');
INSERT INTO `l38sx_tienda_zones` VALUES (2475,163,'NR','Ngeremlengui');
INSERT INTO `l38sx_tienda_zones` VALUES (2476,163,'NW','Ngiwal');
INSERT INTO `l38sx_tienda_zones` VALUES (2477,163,'PE','Peleliu');
INSERT INTO `l38sx_tienda_zones` VALUES (2478,163,'SO','Sonsorol');
INSERT INTO `l38sx_tienda_zones` VALUES (2479,164,'BT','Bocas del Toro');
INSERT INTO `l38sx_tienda_zones` VALUES (2480,164,'CH','Chiriqui');
INSERT INTO `l38sx_tienda_zones` VALUES (2481,164,'CC','Cocle');
INSERT INTO `l38sx_tienda_zones` VALUES (2482,164,'CL','Colon');
INSERT INTO `l38sx_tienda_zones` VALUES (2483,164,'DA','Darien');
INSERT INTO `l38sx_tienda_zones` VALUES (2484,164,'HE','Herrera');
INSERT INTO `l38sx_tienda_zones` VALUES (2485,164,'LS','Los Santos');
INSERT INTO `l38sx_tienda_zones` VALUES (2486,164,'PA','Panama');
INSERT INTO `l38sx_tienda_zones` VALUES (2487,164,'SB','San Blas');
INSERT INTO `l38sx_tienda_zones` VALUES (2488,164,'VG','Veraguas');
INSERT INTO `l38sx_tienda_zones` VALUES (2489,165,'BV','Bougainville');
INSERT INTO `l38sx_tienda_zones` VALUES (2490,165,'CE','Central');
INSERT INTO `l38sx_tienda_zones` VALUES (2491,165,'CH','Chimbu');
INSERT INTO `l38sx_tienda_zones` VALUES (2492,165,'EH','Eastern Highlands');
INSERT INTO `l38sx_tienda_zones` VALUES (2493,165,'EB','East New Britain');
INSERT INTO `l38sx_tienda_zones` VALUES (2494,165,'ES','East Sepik');
INSERT INTO `l38sx_tienda_zones` VALUES (2495,165,'EN','Enga');
INSERT INTO `l38sx_tienda_zones` VALUES (2496,165,'GU','Gulf');
INSERT INTO `l38sx_tienda_zones` VALUES (2497,165,'MD','Madang');
INSERT INTO `l38sx_tienda_zones` VALUES (2498,165,'MN','Manus');
INSERT INTO `l38sx_tienda_zones` VALUES (2499,165,'MB','Milne Bay');
INSERT INTO `l38sx_tienda_zones` VALUES (2500,165,'MR','Morobe');
INSERT INTO `l38sx_tienda_zones` VALUES (2501,165,'NC','National Capital');
INSERT INTO `l38sx_tienda_zones` VALUES (2502,165,'NI','New Ireland');
INSERT INTO `l38sx_tienda_zones` VALUES (2503,165,'NO','Northern');
INSERT INTO `l38sx_tienda_zones` VALUES (2504,165,'SA','Sandaun');
INSERT INTO `l38sx_tienda_zones` VALUES (2505,165,'SH','Southern Highlands');
INSERT INTO `l38sx_tienda_zones` VALUES (2506,165,'WE','Western');
INSERT INTO `l38sx_tienda_zones` VALUES (2507,165,'WH','Western Highlands');
INSERT INTO `l38sx_tienda_zones` VALUES (2508,165,'WB','West New Britain');
INSERT INTO `l38sx_tienda_zones` VALUES (2509,166,'AG','Alto Paraguay');
INSERT INTO `l38sx_tienda_zones` VALUES (2510,166,'AN','Alto Parana');
INSERT INTO `l38sx_tienda_zones` VALUES (2511,166,'AM','Amambay');
INSERT INTO `l38sx_tienda_zones` VALUES (2512,166,'AS','Asuncion');
INSERT INTO `l38sx_tienda_zones` VALUES (2513,166,'BO','Boqueron');
INSERT INTO `l38sx_tienda_zones` VALUES (2514,166,'CG','Caaguazu');
INSERT INTO `l38sx_tienda_zones` VALUES (2515,166,'CZ','Caazapa');
INSERT INTO `l38sx_tienda_zones` VALUES (2516,166,'CN','Canindeyu');
INSERT INTO `l38sx_tienda_zones` VALUES (2517,166,'CE','Central');
INSERT INTO `l38sx_tienda_zones` VALUES (2518,166,'CC','Concepcion');
INSERT INTO `l38sx_tienda_zones` VALUES (2519,166,'CD','Cordillera');
INSERT INTO `l38sx_tienda_zones` VALUES (2520,166,'GU','Guaira');
INSERT INTO `l38sx_tienda_zones` VALUES (2521,166,'IT','Itapua');
INSERT INTO `l38sx_tienda_zones` VALUES (2522,166,'MI','Misiones');
INSERT INTO `l38sx_tienda_zones` VALUES (2523,166,'NE','Neembucu');
INSERT INTO `l38sx_tienda_zones` VALUES (2524,166,'PA','Paraguari');
INSERT INTO `l38sx_tienda_zones` VALUES (2525,166,'PH','Presidente Hayes');
INSERT INTO `l38sx_tienda_zones` VALUES (2526,166,'SP','San Pedro');
INSERT INTO `l38sx_tienda_zones` VALUES (2527,167,'AM','Amazonas');
INSERT INTO `l38sx_tienda_zones` VALUES (2528,167,'AN','Ancash');
INSERT INTO `l38sx_tienda_zones` VALUES (2529,167,'AP','Apurimac');
INSERT INTO `l38sx_tienda_zones` VALUES (2530,167,'AR','Arequipa');
INSERT INTO `l38sx_tienda_zones` VALUES (2531,167,'AY','Ayacucho');
INSERT INTO `l38sx_tienda_zones` VALUES (2532,167,'CJ','Cajamarca');
INSERT INTO `l38sx_tienda_zones` VALUES (2533,167,'CL','Callao');
INSERT INTO `l38sx_tienda_zones` VALUES (2534,167,'CU','Cusco');
INSERT INTO `l38sx_tienda_zones` VALUES (2535,167,'HV','Huancavelica');
INSERT INTO `l38sx_tienda_zones` VALUES (2536,167,'HO','Huanuco');
INSERT INTO `l38sx_tienda_zones` VALUES (2537,167,'IC','Ica');
INSERT INTO `l38sx_tienda_zones` VALUES (2538,167,'JU','Junin');
INSERT INTO `l38sx_tienda_zones` VALUES (2539,167,'LD','La Libertad');
INSERT INTO `l38sx_tienda_zones` VALUES (2540,167,'LY','Lambayeque');
INSERT INTO `l38sx_tienda_zones` VALUES (2541,167,'LI','Lima');
INSERT INTO `l38sx_tienda_zones` VALUES (2542,167,'LO','Loreto');
INSERT INTO `l38sx_tienda_zones` VALUES (2543,167,'MD','Madre de Dios');
INSERT INTO `l38sx_tienda_zones` VALUES (2544,167,'MO','Moquegua');
INSERT INTO `l38sx_tienda_zones` VALUES (2545,167,'PA','Pasco');
INSERT INTO `l38sx_tienda_zones` VALUES (2546,167,'PI','Piura');
INSERT INTO `l38sx_tienda_zones` VALUES (2547,167,'PU','Puno');
INSERT INTO `l38sx_tienda_zones` VALUES (2548,167,'SM','San Martin');
INSERT INTO `l38sx_tienda_zones` VALUES (2549,167,'TA','Tacna');
INSERT INTO `l38sx_tienda_zones` VALUES (2550,167,'TU','Tumbes');
INSERT INTO `l38sx_tienda_zones` VALUES (2551,167,'UC','Ucayali');
INSERT INTO `l38sx_tienda_zones` VALUES (2552,168,'ABR','Abra');
INSERT INTO `l38sx_tienda_zones` VALUES (2553,168,'ANO','Agusan del Norte');
INSERT INTO `l38sx_tienda_zones` VALUES (2554,168,'ASU','Agusan del Sur');
INSERT INTO `l38sx_tienda_zones` VALUES (2555,168,'AKL','Aklan');
INSERT INTO `l38sx_tienda_zones` VALUES (2556,168,'ALB','Albay');
INSERT INTO `l38sx_tienda_zones` VALUES (2557,168,'ANT','Antique');
INSERT INTO `l38sx_tienda_zones` VALUES (2558,168,'APY','Apayao');
INSERT INTO `l38sx_tienda_zones` VALUES (2559,168,'AUR','Aurora');
INSERT INTO `l38sx_tienda_zones` VALUES (2560,168,'BAS','Basilan');
INSERT INTO `l38sx_tienda_zones` VALUES (2561,168,'BTA','Bataan');
INSERT INTO `l38sx_tienda_zones` VALUES (2562,168,'BTE','Batanes');
INSERT INTO `l38sx_tienda_zones` VALUES (2563,168,'BTG','Batangas');
INSERT INTO `l38sx_tienda_zones` VALUES (2564,168,'BLR','Biliran');
INSERT INTO `l38sx_tienda_zones` VALUES (2565,168,'BEN','Benguet');
INSERT INTO `l38sx_tienda_zones` VALUES (2566,168,'BOL','Bohol');
INSERT INTO `l38sx_tienda_zones` VALUES (2567,168,'BUK','Bukidnon');
INSERT INTO `l38sx_tienda_zones` VALUES (2568,168,'BUL','Bulacan');
INSERT INTO `l38sx_tienda_zones` VALUES (2569,168,'CAG','Cagayan');
INSERT INTO `l38sx_tienda_zones` VALUES (2570,168,'CNO','Camarines Norte');
INSERT INTO `l38sx_tienda_zones` VALUES (2571,168,'CSU','Camarines Sur');
INSERT INTO `l38sx_tienda_zones` VALUES (2572,168,'CAM','Camiguin');
INSERT INTO `l38sx_tienda_zones` VALUES (2573,168,'CAP','Capiz');
INSERT INTO `l38sx_tienda_zones` VALUES (2574,168,'CAT','Catanduanes');
INSERT INTO `l38sx_tienda_zones` VALUES (2575,168,'CAV','Cavite');
INSERT INTO `l38sx_tienda_zones` VALUES (2576,168,'CEB','Cebu');
INSERT INTO `l38sx_tienda_zones` VALUES (2577,168,'CMP','Compostela');
INSERT INTO `l38sx_tienda_zones` VALUES (2578,168,'DNO','Davao del Norte');
INSERT INTO `l38sx_tienda_zones` VALUES (2579,168,'DSU','Davao del Sur');
INSERT INTO `l38sx_tienda_zones` VALUES (2580,168,'DOR','Davao Oriental');
INSERT INTO `l38sx_tienda_zones` VALUES (2581,168,'ESA','Eastern Samar');
INSERT INTO `l38sx_tienda_zones` VALUES (2582,168,'GUI','Guimaras');
INSERT INTO `l38sx_tienda_zones` VALUES (2583,168,'IFU','Ifugao');
INSERT INTO `l38sx_tienda_zones` VALUES (2584,168,'INO','Ilocos Norte');
INSERT INTO `l38sx_tienda_zones` VALUES (2585,168,'ISU','Ilocos Sur');
INSERT INTO `l38sx_tienda_zones` VALUES (2586,168,'ILO','Iloilo');
INSERT INTO `l38sx_tienda_zones` VALUES (2587,168,'ISA','Isabela');
INSERT INTO `l38sx_tienda_zones` VALUES (2588,168,'KAL','Kalinga');
INSERT INTO `l38sx_tienda_zones` VALUES (2589,168,'LAG','Laguna');
INSERT INTO `l38sx_tienda_zones` VALUES (2590,168,'LNO','Lanao del Norte');
INSERT INTO `l38sx_tienda_zones` VALUES (2591,168,'LSU','Lanao del Sur');
INSERT INTO `l38sx_tienda_zones` VALUES (2592,168,'UNI','La Union');
INSERT INTO `l38sx_tienda_zones` VALUES (2593,168,'LEY','Leyte');
INSERT INTO `l38sx_tienda_zones` VALUES (2594,168,'MAG','Maguindanao');
INSERT INTO `l38sx_tienda_zones` VALUES (2595,168,'MRN','Marinduque');
INSERT INTO `l38sx_tienda_zones` VALUES (2596,168,'MSB','Masbate');
INSERT INTO `l38sx_tienda_zones` VALUES (2597,168,'MIC','Mindoro Occidental');
INSERT INTO `l38sx_tienda_zones` VALUES (2598,168,'MIR','Mindoro Oriental');
INSERT INTO `l38sx_tienda_zones` VALUES (2599,168,'MSC','Misamis Occidental');
INSERT INTO `l38sx_tienda_zones` VALUES (2600,168,'MOR','Misamis Oriental');
INSERT INTO `l38sx_tienda_zones` VALUES (2601,168,'MOP','Mountain');
INSERT INTO `l38sx_tienda_zones` VALUES (2602,168,'NOC','Negros Occidental');
INSERT INTO `l38sx_tienda_zones` VALUES (2603,168,'NOR','Negros Oriental');
INSERT INTO `l38sx_tienda_zones` VALUES (2604,168,'NCT','North Cotabato');
INSERT INTO `l38sx_tienda_zones` VALUES (2605,168,'NSM','Northern Samar');
INSERT INTO `l38sx_tienda_zones` VALUES (2606,168,'NEC','Nueva Ecija');
INSERT INTO `l38sx_tienda_zones` VALUES (2607,168,'NVZ','Nueva Vizcaya');
INSERT INTO `l38sx_tienda_zones` VALUES (2608,168,'PLW','Palawan');
INSERT INTO `l38sx_tienda_zones` VALUES (2609,168,'PMP','Pampanga');
INSERT INTO `l38sx_tienda_zones` VALUES (2610,168,'PNG','Pangasinan');
INSERT INTO `l38sx_tienda_zones` VALUES (2611,168,'QZN','Quezon');
INSERT INTO `l38sx_tienda_zones` VALUES (2612,168,'QRN','Quirino');
INSERT INTO `l38sx_tienda_zones` VALUES (2613,168,'RIZ','Rizal');
INSERT INTO `l38sx_tienda_zones` VALUES (2614,168,'ROM','Romblon');
INSERT INTO `l38sx_tienda_zones` VALUES (2615,168,'SMR','Samar');
INSERT INTO `l38sx_tienda_zones` VALUES (2616,168,'SRG','Sarangani');
INSERT INTO `l38sx_tienda_zones` VALUES (2617,168,'SQJ','Siquijor');
INSERT INTO `l38sx_tienda_zones` VALUES (2618,168,'SRS','Sorsogon');
INSERT INTO `l38sx_tienda_zones` VALUES (2619,168,'SCO','South Cotabato');
INSERT INTO `l38sx_tienda_zones` VALUES (2620,168,'SLE','Southern Leyte');
INSERT INTO `l38sx_tienda_zones` VALUES (2621,168,'SKU','Sultan Kudarat');
INSERT INTO `l38sx_tienda_zones` VALUES (2622,168,'SLU','Sulu');
INSERT INTO `l38sx_tienda_zones` VALUES (2623,168,'SNO','Surigao del Norte');
INSERT INTO `l38sx_tienda_zones` VALUES (2624,168,'SSU','Surigao del Sur');
INSERT INTO `l38sx_tienda_zones` VALUES (2625,168,'TAR','Tarlac');
INSERT INTO `l38sx_tienda_zones` VALUES (2626,168,'TAW','Tawi-Tawi');
INSERT INTO `l38sx_tienda_zones` VALUES (2627,168,'ZBL','Zambales');
INSERT INTO `l38sx_tienda_zones` VALUES (2628,168,'ZNO','Zamboanga del Norte');
INSERT INTO `l38sx_tienda_zones` VALUES (2629,168,'ZSU','Zamboanga del Sur');
INSERT INTO `l38sx_tienda_zones` VALUES (2630,168,'ZSI','Zamboanga Sibugay');
INSERT INTO `l38sx_tienda_zones` VALUES (2631,170,'DO','Dolnoslaskie');
INSERT INTO `l38sx_tienda_zones` VALUES (2632,170,'KP','Kujawsko-Pomorskie');
INSERT INTO `l38sx_tienda_zones` VALUES (2633,170,'LO','Lodzkie');
INSERT INTO `l38sx_tienda_zones` VALUES (2634,170,'LL','Lubelskie');
INSERT INTO `l38sx_tienda_zones` VALUES (2635,170,'LU','Lubuskie');
INSERT INTO `l38sx_tienda_zones` VALUES (2636,170,'ML','Malopolskie');
INSERT INTO `l38sx_tienda_zones` VALUES (2637,170,'MZ','Mazowieckie');
INSERT INTO `l38sx_tienda_zones` VALUES (2638,170,'OP','Opolskie');
INSERT INTO `l38sx_tienda_zones` VALUES (2639,170,'PP','Podkarpackie');
INSERT INTO `l38sx_tienda_zones` VALUES (2640,170,'PL','Podlaskie');
INSERT INTO `l38sx_tienda_zones` VALUES (2641,170,'PM','Pomorskie');
INSERT INTO `l38sx_tienda_zones` VALUES (2642,170,'SL','Slaskie');
INSERT INTO `l38sx_tienda_zones` VALUES (2643,170,'SW','Swietokrzyskie');
INSERT INTO `l38sx_tienda_zones` VALUES (2644,170,'WM','Warminsko-Mazurskie');
INSERT INTO `l38sx_tienda_zones` VALUES (2645,170,'WP','Wielkopolskie');
INSERT INTO `l38sx_tienda_zones` VALUES (2646,170,'ZA','Zachodniopomorskie');
INSERT INTO `l38sx_tienda_zones` VALUES (2647,198,'P','Saint Pierre');
INSERT INTO `l38sx_tienda_zones` VALUES (2648,198,'M','Miquelon');
INSERT INTO `l38sx_tienda_zones` VALUES (2649,171,'AC','A&ccedil;ores');
INSERT INTO `l38sx_tienda_zones` VALUES (2650,171,'AV','Aveiro');
INSERT INTO `l38sx_tienda_zones` VALUES (2651,171,'BE','Beja');
INSERT INTO `l38sx_tienda_zones` VALUES (2652,171,'BR','Braga');
INSERT INTO `l38sx_tienda_zones` VALUES (2653,171,'BA','Bragan&ccedil;a');
INSERT INTO `l38sx_tienda_zones` VALUES (2654,171,'CB','Castelo Branco');
INSERT INTO `l38sx_tienda_zones` VALUES (2655,171,'CO','Coimbra');
INSERT INTO `l38sx_tienda_zones` VALUES (2656,171,'EV','&Eacute;vora');
INSERT INTO `l38sx_tienda_zones` VALUES (2657,171,'FA','Faro');
INSERT INTO `l38sx_tienda_zones` VALUES (2658,171,'GU','Guarda');
INSERT INTO `l38sx_tienda_zones` VALUES (2659,171,'LE','Leiria');
INSERT INTO `l38sx_tienda_zones` VALUES (2660,171,'LI','Lisboa');
INSERT INTO `l38sx_tienda_zones` VALUES (2661,171,'ME','Madeira');
INSERT INTO `l38sx_tienda_zones` VALUES (2662,171,'PO','Portalegre');
INSERT INTO `l38sx_tienda_zones` VALUES (2663,171,'PR','Porto');
INSERT INTO `l38sx_tienda_zones` VALUES (2664,171,'SA','Santar&eacute;m');
INSERT INTO `l38sx_tienda_zones` VALUES (2665,171,'SE','Set&uacute;bal');
INSERT INTO `l38sx_tienda_zones` VALUES (2666,171,'VC','Viana do Castelo');
INSERT INTO `l38sx_tienda_zones` VALUES (2667,171,'VR','Vila Real');
INSERT INTO `l38sx_tienda_zones` VALUES (2668,171,'VI','Viseu');
INSERT INTO `l38sx_tienda_zones` VALUES (2669,173,'DW','Ad Dawhah');
INSERT INTO `l38sx_tienda_zones` VALUES (2670,173,'GW','Al Ghuwayriyah');
INSERT INTO `l38sx_tienda_zones` VALUES (2671,173,'JM','Al Jumayliyah');
INSERT INTO `l38sx_tienda_zones` VALUES (2672,173,'KR','Al Khawr');
INSERT INTO `l38sx_tienda_zones` VALUES (2673,173,'WK','Al Wakrah');
INSERT INTO `l38sx_tienda_zones` VALUES (2674,173,'RN','Ar Rayyan');
INSERT INTO `l38sx_tienda_zones` VALUES (2675,173,'JB','Jarayan al Batinah');
INSERT INTO `l38sx_tienda_zones` VALUES (2676,173,'MS','Madinat ash Shamal');
INSERT INTO `l38sx_tienda_zones` VALUES (2677,173,'UD','Umm Sa\'id');
INSERT INTO `l38sx_tienda_zones` VALUES (2678,173,'UL','Umm Salal');
INSERT INTO `l38sx_tienda_zones` VALUES (2679,175,'AB','Alba');
INSERT INTO `l38sx_tienda_zones` VALUES (2680,175,'AR','Arad');
INSERT INTO `l38sx_tienda_zones` VALUES (2681,175,'AG','Arges');
INSERT INTO `l38sx_tienda_zones` VALUES (2682,175,'BC','Bacau');
INSERT INTO `l38sx_tienda_zones` VALUES (2683,175,'BH','Bihor');
INSERT INTO `l38sx_tienda_zones` VALUES (2684,175,'BN','Bistrita-Nasaud');
INSERT INTO `l38sx_tienda_zones` VALUES (2685,175,'BT','Botosani');
INSERT INTO `l38sx_tienda_zones` VALUES (2686,175,'BV','Brasov');
INSERT INTO `l38sx_tienda_zones` VALUES (2687,175,'BR','Braila');
INSERT INTO `l38sx_tienda_zones` VALUES (2688,175,'B','Bucuresti');
INSERT INTO `l38sx_tienda_zones` VALUES (2689,175,'BZ','Buzau');
INSERT INTO `l38sx_tienda_zones` VALUES (2690,175,'CS','Caras-Severin');
INSERT INTO `l38sx_tienda_zones` VALUES (2691,175,'CL','Calarasi');
INSERT INTO `l38sx_tienda_zones` VALUES (2692,175,'CJ','Cluj');
INSERT INTO `l38sx_tienda_zones` VALUES (2693,175,'CT','Constanta');
INSERT INTO `l38sx_tienda_zones` VALUES (2694,175,'CV','Covasna');
INSERT INTO `l38sx_tienda_zones` VALUES (2695,175,'DB','Dimbovita');
INSERT INTO `l38sx_tienda_zones` VALUES (2696,175,'DJ','Dolj');
INSERT INTO `l38sx_tienda_zones` VALUES (2697,175,'GL','Galati');
INSERT INTO `l38sx_tienda_zones` VALUES (2698,175,'GR','Giurgiu');
INSERT INTO `l38sx_tienda_zones` VALUES (2699,175,'GJ','Gorj');
INSERT INTO `l38sx_tienda_zones` VALUES (2700,175,'HR','Harghita');
INSERT INTO `l38sx_tienda_zones` VALUES (2701,175,'HD','Hunedoara');
INSERT INTO `l38sx_tienda_zones` VALUES (2702,175,'IL','Ialomita');
INSERT INTO `l38sx_tienda_zones` VALUES (2703,175,'IS','Iasi');
INSERT INTO `l38sx_tienda_zones` VALUES (2704,175,'IF','Ilfov');
INSERT INTO `l38sx_tienda_zones` VALUES (2705,175,'MM','Maramures');
INSERT INTO `l38sx_tienda_zones` VALUES (2706,175,'MH','Mehedinti');
INSERT INTO `l38sx_tienda_zones` VALUES (2707,175,'MS','Mures');
INSERT INTO `l38sx_tienda_zones` VALUES (2708,175,'NT','Neamt');
INSERT INTO `l38sx_tienda_zones` VALUES (2709,175,'OT','Olt');
INSERT INTO `l38sx_tienda_zones` VALUES (2710,175,'PH','Prahova');
INSERT INTO `l38sx_tienda_zones` VALUES (2711,175,'SM','Satu-Mare');
INSERT INTO `l38sx_tienda_zones` VALUES (2712,175,'SJ','Salaj');
INSERT INTO `l38sx_tienda_zones` VALUES (2713,175,'SB','Sibiu');
INSERT INTO `l38sx_tienda_zones` VALUES (2714,175,'SV','Suceava');
INSERT INTO `l38sx_tienda_zones` VALUES (2715,175,'TR','Teleorman');
INSERT INTO `l38sx_tienda_zones` VALUES (2716,175,'TM','Timis');
INSERT INTO `l38sx_tienda_zones` VALUES (2717,175,'TL','Tulcea');
INSERT INTO `l38sx_tienda_zones` VALUES (2718,175,'VS','Vaslui');
INSERT INTO `l38sx_tienda_zones` VALUES (2719,175,'VL','Valcea');
INSERT INTO `l38sx_tienda_zones` VALUES (2720,175,'VN','Vrancea');
INSERT INTO `l38sx_tienda_zones` VALUES (2721,176,'AB','Abakan');
INSERT INTO `l38sx_tienda_zones` VALUES (2722,176,'AG','Aginskoye');
INSERT INTO `l38sx_tienda_zones` VALUES (2723,176,'AN','Anadyr');
INSERT INTO `l38sx_tienda_zones` VALUES (2724,176,'AR','Arkahangelsk');
INSERT INTO `l38sx_tienda_zones` VALUES (2725,176,'AS','Astrakhan');
INSERT INTO `l38sx_tienda_zones` VALUES (2726,176,'BA','Barnaul');
INSERT INTO `l38sx_tienda_zones` VALUES (2727,176,'BE','Belgorod');
INSERT INTO `l38sx_tienda_zones` VALUES (2728,176,'BI','Birobidzhan');
INSERT INTO `l38sx_tienda_zones` VALUES (2729,176,'BL','Blagoveshchensk');
INSERT INTO `l38sx_tienda_zones` VALUES (2730,176,'BR','Bryansk');
INSERT INTO `l38sx_tienda_zones` VALUES (2731,176,'CH','Cheboksary');
INSERT INTO `l38sx_tienda_zones` VALUES (2732,176,'CL','Chelyabinsk');
INSERT INTO `l38sx_tienda_zones` VALUES (2733,176,'CR','Cherkessk');
INSERT INTO `l38sx_tienda_zones` VALUES (2734,176,'CI','Chita');
INSERT INTO `l38sx_tienda_zones` VALUES (2735,176,'DU','Dudinka');
INSERT INTO `l38sx_tienda_zones` VALUES (2736,176,'EL','Elista');
INSERT INTO `l38sx_tienda_zones` VALUES (2737,176,'GO','Gomo-Altaysk');
INSERT INTO `l38sx_tienda_zones` VALUES (2738,176,'GA','Gorno-Altaysk');
INSERT INTO `l38sx_tienda_zones` VALUES (2739,176,'GR','Groznyy');
INSERT INTO `l38sx_tienda_zones` VALUES (2740,176,'IR','Irkutsk');
INSERT INTO `l38sx_tienda_zones` VALUES (2741,176,'IV','Ivanovo');
INSERT INTO `l38sx_tienda_zones` VALUES (2742,176,'IZ','Izhevsk');
INSERT INTO `l38sx_tienda_zones` VALUES (2743,176,'KA','Kalinigrad');
INSERT INTO `l38sx_tienda_zones` VALUES (2744,176,'KL','Kaluga');
INSERT INTO `l38sx_tienda_zones` VALUES (2745,176,'KS','Kasnodar');
INSERT INTO `l38sx_tienda_zones` VALUES (2746,176,'KZ','Kazan');
INSERT INTO `l38sx_tienda_zones` VALUES (2747,176,'KE','Kemerovo');
INSERT INTO `l38sx_tienda_zones` VALUES (2748,176,'KH','Khabarovsk');
INSERT INTO `l38sx_tienda_zones` VALUES (2749,176,'KM','Khanty-Mansiysk');
INSERT INTO `l38sx_tienda_zones` VALUES (2750,176,'KO','Kostroma');
INSERT INTO `l38sx_tienda_zones` VALUES (2751,176,'KR','Krasnodar');
INSERT INTO `l38sx_tienda_zones` VALUES (2752,176,'KN','Krasnoyarsk');
INSERT INTO `l38sx_tienda_zones` VALUES (2753,176,'KU','Kudymkar');
INSERT INTO `l38sx_tienda_zones` VALUES (2754,176,'KG','Kurgan');
INSERT INTO `l38sx_tienda_zones` VALUES (2755,176,'KK','Kursk');
INSERT INTO `l38sx_tienda_zones` VALUES (2756,176,'KY','Kyzyl');
INSERT INTO `l38sx_tienda_zones` VALUES (2757,176,'LI','Lipetsk');
INSERT INTO `l38sx_tienda_zones` VALUES (2758,176,'MA','Magadan');
INSERT INTO `l38sx_tienda_zones` VALUES (2759,176,'MK','Makhachkala');
INSERT INTO `l38sx_tienda_zones` VALUES (2760,176,'MY','Maykop');
INSERT INTO `l38sx_tienda_zones` VALUES (2761,176,'MO','Moscow');
INSERT INTO `l38sx_tienda_zones` VALUES (2762,176,'MU','Murmansk');
INSERT INTO `l38sx_tienda_zones` VALUES (2763,176,'NA','Nalchik');
INSERT INTO `l38sx_tienda_zones` VALUES (2764,176,'NR','Naryan Mar');
INSERT INTO `l38sx_tienda_zones` VALUES (2765,176,'NZ','Nazran');
INSERT INTO `l38sx_tienda_zones` VALUES (2766,176,'NI','Nizhniy Novgorod');
INSERT INTO `l38sx_tienda_zones` VALUES (2767,176,'NO','Novgorod');
INSERT INTO `l38sx_tienda_zones` VALUES (2768,176,'NV','Novosibirsk');
INSERT INTO `l38sx_tienda_zones` VALUES (2769,176,'OM','Omsk');
INSERT INTO `l38sx_tienda_zones` VALUES (2770,176,'OR','Orel');
INSERT INTO `l38sx_tienda_zones` VALUES (2771,176,'OE','Orenburg');
INSERT INTO `l38sx_tienda_zones` VALUES (2772,176,'PA','Palana');
INSERT INTO `l38sx_tienda_zones` VALUES (2773,176,'PE','Penza');
INSERT INTO `l38sx_tienda_zones` VALUES (2774,176,'PR','Perm');
INSERT INTO `l38sx_tienda_zones` VALUES (2775,176,'PK','Petropavlovsk-Kamchatskiy');
INSERT INTO `l38sx_tienda_zones` VALUES (2776,176,'PT','Petrozavodsk');
INSERT INTO `l38sx_tienda_zones` VALUES (2777,176,'PS','Pskov');
INSERT INTO `l38sx_tienda_zones` VALUES (2778,176,'RO','Rostov-na-Donu');
INSERT INTO `l38sx_tienda_zones` VALUES (2779,176,'RY','Ryazan');
INSERT INTO `l38sx_tienda_zones` VALUES (2780,176,'SL','Salekhard');
INSERT INTO `l38sx_tienda_zones` VALUES (2781,176,'SA','Samara');
INSERT INTO `l38sx_tienda_zones` VALUES (2782,176,'SR','Saransk');
INSERT INTO `l38sx_tienda_zones` VALUES (2783,176,'SV','Saratov');
INSERT INTO `l38sx_tienda_zones` VALUES (2784,176,'SM','Smolensk');
INSERT INTO `l38sx_tienda_zones` VALUES (2785,176,'SP','St. Petersburg');
INSERT INTO `l38sx_tienda_zones` VALUES (2786,176,'ST','Stavropol');
INSERT INTO `l38sx_tienda_zones` VALUES (2787,176,'SY','Syktyvkar');
INSERT INTO `l38sx_tienda_zones` VALUES (2788,176,'TA','Tambov');
INSERT INTO `l38sx_tienda_zones` VALUES (2789,176,'TO','Tomsk');
INSERT INTO `l38sx_tienda_zones` VALUES (2790,176,'TU','Tula');
INSERT INTO `l38sx_tienda_zones` VALUES (2791,176,'TR','Tura');
INSERT INTO `l38sx_tienda_zones` VALUES (2792,176,'TV','Tver');
INSERT INTO `l38sx_tienda_zones` VALUES (2793,176,'TY','Tyumen');
INSERT INTO `l38sx_tienda_zones` VALUES (2794,176,'UF','Ufa');
INSERT INTO `l38sx_tienda_zones` VALUES (2795,176,'UL','Ul\'yanovsk');
INSERT INTO `l38sx_tienda_zones` VALUES (2796,176,'UU','Ulan-Ude');
INSERT INTO `l38sx_tienda_zones` VALUES (2797,176,'US','Ust\'-Ordynskiy');
INSERT INTO `l38sx_tienda_zones` VALUES (2798,176,'VL','Vladikavkaz');
INSERT INTO `l38sx_tienda_zones` VALUES (2799,176,'VA','Vladimir');
INSERT INTO `l38sx_tienda_zones` VALUES (2800,176,'VV','Vladivostok');
INSERT INTO `l38sx_tienda_zones` VALUES (2801,176,'VG','Volgograd');
INSERT INTO `l38sx_tienda_zones` VALUES (2802,176,'VD','Vologda');
INSERT INTO `l38sx_tienda_zones` VALUES (2803,176,'VO','Voronezh');
INSERT INTO `l38sx_tienda_zones` VALUES (2804,176,'VY','Vyatka');
INSERT INTO `l38sx_tienda_zones` VALUES (2805,176,'YA','Yakutsk');
INSERT INTO `l38sx_tienda_zones` VALUES (2806,176,'YR','Yaroslavl');
INSERT INTO `l38sx_tienda_zones` VALUES (2807,176,'YE','Yekaterinburg');
INSERT INTO `l38sx_tienda_zones` VALUES (2808,176,'YO','Yoshkar-Ola');
INSERT INTO `l38sx_tienda_zones` VALUES (2809,177,'BU','Butare');
INSERT INTO `l38sx_tienda_zones` VALUES (2810,177,'BY','Byumba');
INSERT INTO `l38sx_tienda_zones` VALUES (2811,177,'CY','Cyangugu');
INSERT INTO `l38sx_tienda_zones` VALUES (2812,177,'GK','Gikongoro');
INSERT INTO `l38sx_tienda_zones` VALUES (2813,177,'GS','Gisenyi');
INSERT INTO `l38sx_tienda_zones` VALUES (2814,177,'GT','Gitarama');
INSERT INTO `l38sx_tienda_zones` VALUES (2815,177,'KG','Kibungo');
INSERT INTO `l38sx_tienda_zones` VALUES (2816,177,'KY','Kibuye');
INSERT INTO `l38sx_tienda_zones` VALUES (2817,177,'KR','Kigali Rurale');
INSERT INTO `l38sx_tienda_zones` VALUES (2818,177,'KV','Kigali-ville');
INSERT INTO `l38sx_tienda_zones` VALUES (2819,177,'RU','Ruhengeri');
INSERT INTO `l38sx_tienda_zones` VALUES (2820,177,'UM','Umutara');
INSERT INTO `l38sx_tienda_zones` VALUES (2821,178,'CCN','Christ Church Nichola Town');
INSERT INTO `l38sx_tienda_zones` VALUES (2822,178,'SAS','Saint Anne Sandy Point');
INSERT INTO `l38sx_tienda_zones` VALUES (2823,178,'SGB','Saint George Basseterre');
INSERT INTO `l38sx_tienda_zones` VALUES (2824,178,'SGG','Saint George Gingerland');
INSERT INTO `l38sx_tienda_zones` VALUES (2825,178,'SJW','Saint James Windward');
INSERT INTO `l38sx_tienda_zones` VALUES (2826,178,'SJC','Saint John Capesterre');
INSERT INTO `l38sx_tienda_zones` VALUES (2827,178,'SJF','Saint John Figtree');
INSERT INTO `l38sx_tienda_zones` VALUES (2828,178,'SMC','Saint Mary Cayon');
INSERT INTO `l38sx_tienda_zones` VALUES (2829,178,'CAP','Saint Paul Capesterre');
INSERT INTO `l38sx_tienda_zones` VALUES (2830,178,'CHA','Saint Paul Charlestown');
INSERT INTO `l38sx_tienda_zones` VALUES (2831,178,'SPB','Saint Peter Basseterre');
INSERT INTO `l38sx_tienda_zones` VALUES (2832,178,'STL','Saint Thomas Lowland');
INSERT INTO `l38sx_tienda_zones` VALUES (2833,178,'STM','Saint Thomas Middle Island');
INSERT INTO `l38sx_tienda_zones` VALUES (2834,178,'TPP','Trinity Palmetto Point');
INSERT INTO `l38sx_tienda_zones` VALUES (2835,179,'AR','Anse-la-Raye');
INSERT INTO `l38sx_tienda_zones` VALUES (2836,179,'CA','Castries');
INSERT INTO `l38sx_tienda_zones` VALUES (2837,179,'CH','Choiseul');
INSERT INTO `l38sx_tienda_zones` VALUES (2838,179,'DA','Dauphin');
INSERT INTO `l38sx_tienda_zones` VALUES (2839,179,'DE','Dennery');
INSERT INTO `l38sx_tienda_zones` VALUES (2840,179,'GI','Gros-Islet');
INSERT INTO `l38sx_tienda_zones` VALUES (2841,179,'LA','Laborie');
INSERT INTO `l38sx_tienda_zones` VALUES (2842,179,'MI','Micoud');
INSERT INTO `l38sx_tienda_zones` VALUES (2843,179,'PR','Praslin');
INSERT INTO `l38sx_tienda_zones` VALUES (2844,179,'SO','Soufriere');
INSERT INTO `l38sx_tienda_zones` VALUES (2845,179,'VF','Vieux-Fort');
INSERT INTO `l38sx_tienda_zones` VALUES (2846,180,'C','Charlotte');
INSERT INTO `l38sx_tienda_zones` VALUES (2847,180,'R','Grenadines');
INSERT INTO `l38sx_tienda_zones` VALUES (2848,180,'A','Saint Andrew');
INSERT INTO `l38sx_tienda_zones` VALUES (2849,180,'D','Saint David');
INSERT INTO `l38sx_tienda_zones` VALUES (2850,180,'G','Saint George');
INSERT INTO `l38sx_tienda_zones` VALUES (2851,180,'P','Saint Patrick');
INSERT INTO `l38sx_tienda_zones` VALUES (2852,181,'AN','A\'ana');
INSERT INTO `l38sx_tienda_zones` VALUES (2853,181,'AI','Aiga-i-le-Tai');
INSERT INTO `l38sx_tienda_zones` VALUES (2854,181,'AT','Atua');
INSERT INTO `l38sx_tienda_zones` VALUES (2855,181,'FA','Fa\'asaleleaga');
INSERT INTO `l38sx_tienda_zones` VALUES (2856,181,'GE','Gaga\'emauga');
INSERT INTO `l38sx_tienda_zones` VALUES (2857,181,'GF','Gagaifomauga');
INSERT INTO `l38sx_tienda_zones` VALUES (2858,181,'PA','Palauli');
INSERT INTO `l38sx_tienda_zones` VALUES (2859,181,'SA','Satupa\'itea');
INSERT INTO `l38sx_tienda_zones` VALUES (2860,181,'TU','Tuamasaga');
INSERT INTO `l38sx_tienda_zones` VALUES (2861,181,'VF','Va\'a-o-Fonoti');
INSERT INTO `l38sx_tienda_zones` VALUES (2862,181,'VS','Vaisigano');
INSERT INTO `l38sx_tienda_zones` VALUES (2863,182,'AC','Acquaviva');
INSERT INTO `l38sx_tienda_zones` VALUES (2864,182,'BM','Borgo Maggiore');
INSERT INTO `l38sx_tienda_zones` VALUES (2865,182,'CH','Chiesanuova');
INSERT INTO `l38sx_tienda_zones` VALUES (2866,182,'DO','Domagnano');
INSERT INTO `l38sx_tienda_zones` VALUES (2867,182,'FA','Faetano');
INSERT INTO `l38sx_tienda_zones` VALUES (2868,182,'FI','Fiorentino');
INSERT INTO `l38sx_tienda_zones` VALUES (2869,182,'MO','Montegiardino');
INSERT INTO `l38sx_tienda_zones` VALUES (2870,182,'SM','Citta di San Marino');
INSERT INTO `l38sx_tienda_zones` VALUES (2871,182,'SE','Serravalle');
INSERT INTO `l38sx_tienda_zones` VALUES (2872,183,'S','Sao Tome');
INSERT INTO `l38sx_tienda_zones` VALUES (2873,183,'P','Principe');
INSERT INTO `l38sx_tienda_zones` VALUES (2874,184,'BH','Al Bahah');
INSERT INTO `l38sx_tienda_zones` VALUES (2875,184,'HS','Al Hudud ash Shamaliyah');
INSERT INTO `l38sx_tienda_zones` VALUES (2876,184,'JF','Al Jawf');
INSERT INTO `l38sx_tienda_zones` VALUES (2877,184,'MD','Al Madinah');
INSERT INTO `l38sx_tienda_zones` VALUES (2878,184,'QS','Al Qasim');
INSERT INTO `l38sx_tienda_zones` VALUES (2879,184,'RD','Ar Riyad');
INSERT INTO `l38sx_tienda_zones` VALUES (2880,184,'AQ','Ash Sharqiyah (Eastern)');
INSERT INTO `l38sx_tienda_zones` VALUES (2881,184,'AS','\'Asir');
INSERT INTO `l38sx_tienda_zones` VALUES (2882,184,'HL','Ha\'il');
INSERT INTO `l38sx_tienda_zones` VALUES (2883,184,'JZ','Jizan');
INSERT INTO `l38sx_tienda_zones` VALUES (2884,184,'ML','Makkah');
INSERT INTO `l38sx_tienda_zones` VALUES (2885,184,'NR','Najran');
INSERT INTO `l38sx_tienda_zones` VALUES (2886,184,'TB','Tabuk');
INSERT INTO `l38sx_tienda_zones` VALUES (2887,185,'DA','Dakar');
INSERT INTO `l38sx_tienda_zones` VALUES (2888,185,'DI','Diourbel');
INSERT INTO `l38sx_tienda_zones` VALUES (2889,185,'FA','Fatick');
INSERT INTO `l38sx_tienda_zones` VALUES (2890,185,'KA','Kaolack');
INSERT INTO `l38sx_tienda_zones` VALUES (2891,185,'KO','Kolda');
INSERT INTO `l38sx_tienda_zones` VALUES (2892,185,'LO','Louga');
INSERT INTO `l38sx_tienda_zones` VALUES (2893,185,'MA','Matam');
INSERT INTO `l38sx_tienda_zones` VALUES (2894,185,'SL','Saint-Louis');
INSERT INTO `l38sx_tienda_zones` VALUES (2895,185,'TA','Tambacounda');
INSERT INTO `l38sx_tienda_zones` VALUES (2896,185,'TH','Thies');
INSERT INTO `l38sx_tienda_zones` VALUES (2897,185,'ZI','Ziguinchor');
INSERT INTO `l38sx_tienda_zones` VALUES (2898,186,'AP','Anse aux Pins');
INSERT INTO `l38sx_tienda_zones` VALUES (2899,186,'AB','Anse Boileau');
INSERT INTO `l38sx_tienda_zones` VALUES (2900,186,'AE','Anse Etoile');
INSERT INTO `l38sx_tienda_zones` VALUES (2901,186,'AL','Anse Louis');
INSERT INTO `l38sx_tienda_zones` VALUES (2902,186,'AR','Anse Royale');
INSERT INTO `l38sx_tienda_zones` VALUES (2903,186,'BL','Baie Lazare');
INSERT INTO `l38sx_tienda_zones` VALUES (2904,186,'BS','Baie Sainte Anne');
INSERT INTO `l38sx_tienda_zones` VALUES (2905,186,'BV','Beau Vallon');
INSERT INTO `l38sx_tienda_zones` VALUES (2906,186,'BA','Bel Air');
INSERT INTO `l38sx_tienda_zones` VALUES (2907,186,'BO','Bel Ombre');
INSERT INTO `l38sx_tienda_zones` VALUES (2908,186,'CA','Cascade');
INSERT INTO `l38sx_tienda_zones` VALUES (2909,186,'GL','Glacis');
INSERT INTO `l38sx_tienda_zones` VALUES (2910,186,'GM','Grand\' Anse (on Mahe)');
INSERT INTO `l38sx_tienda_zones` VALUES (2911,186,'GP','Grand\' Anse (on Praslin)');
INSERT INTO `l38sx_tienda_zones` VALUES (2912,186,'DG','La Digue');
INSERT INTO `l38sx_tienda_zones` VALUES (2913,186,'RA','La Riviere Anglaise');
INSERT INTO `l38sx_tienda_zones` VALUES (2914,186,'MB','Mont Buxton');
INSERT INTO `l38sx_tienda_zones` VALUES (2915,186,'MF','Mont Fleuri');
INSERT INTO `l38sx_tienda_zones` VALUES (2916,186,'PL','Plaisance');
INSERT INTO `l38sx_tienda_zones` VALUES (2917,186,'PR','Pointe La Rue');
INSERT INTO `l38sx_tienda_zones` VALUES (2918,186,'PG','Port Glaud');
INSERT INTO `l38sx_tienda_zones` VALUES (2919,186,'SL','Saint Louis');
INSERT INTO `l38sx_tienda_zones` VALUES (2920,186,'TA','Takamaka');
INSERT INTO `l38sx_tienda_zones` VALUES (2921,187,'E','Eastern');
INSERT INTO `l38sx_tienda_zones` VALUES (2922,187,'N','Northern');
INSERT INTO `l38sx_tienda_zones` VALUES (2923,187,'S','Southern');
INSERT INTO `l38sx_tienda_zones` VALUES (2924,187,'W','Western');
INSERT INTO `l38sx_tienda_zones` VALUES (2925,189,'BA','Banskobystricky');
INSERT INTO `l38sx_tienda_zones` VALUES (2926,189,'BR','Bratislavsky');
INSERT INTO `l38sx_tienda_zones` VALUES (2927,189,'KO','Kosicky');
INSERT INTO `l38sx_tienda_zones` VALUES (2928,189,'NI','Nitriansky');
INSERT INTO `l38sx_tienda_zones` VALUES (2929,189,'PR','Presovsky');
INSERT INTO `l38sx_tienda_zones` VALUES (2930,189,'TC','Trenciansky');
INSERT INTO `l38sx_tienda_zones` VALUES (2931,189,'TV','Trnavsky');
INSERT INTO `l38sx_tienda_zones` VALUES (2932,189,'ZI','Zilinsky');
INSERT INTO `l38sx_tienda_zones` VALUES (2933,191,'CE','Central');
INSERT INTO `l38sx_tienda_zones` VALUES (2934,191,'CH','Choiseul');
INSERT INTO `l38sx_tienda_zones` VALUES (2935,191,'GC','Guadalcanal');
INSERT INTO `l38sx_tienda_zones` VALUES (2936,191,'HO','Honiara');
INSERT INTO `l38sx_tienda_zones` VALUES (2937,191,'IS','Isabel');
INSERT INTO `l38sx_tienda_zones` VALUES (2938,191,'MK','Makira');
INSERT INTO `l38sx_tienda_zones` VALUES (2939,191,'ML','Malaita');
INSERT INTO `l38sx_tienda_zones` VALUES (2940,191,'RB','Rennell and Bellona');
INSERT INTO `l38sx_tienda_zones` VALUES (2941,191,'TM','Temotu');
INSERT INTO `l38sx_tienda_zones` VALUES (2942,191,'WE','Western');
INSERT INTO `l38sx_tienda_zones` VALUES (2943,192,'AW','Awdal');
INSERT INTO `l38sx_tienda_zones` VALUES (2944,192,'BK','Bakool');
INSERT INTO `l38sx_tienda_zones` VALUES (2945,192,'BN','Banaadir');
INSERT INTO `l38sx_tienda_zones` VALUES (2946,192,'BR','Bari');
INSERT INTO `l38sx_tienda_zones` VALUES (2947,192,'BY','Bay');
INSERT INTO `l38sx_tienda_zones` VALUES (2948,192,'GA','Galguduud');
INSERT INTO `l38sx_tienda_zones` VALUES (2949,192,'GE','Gedo');
INSERT INTO `l38sx_tienda_zones` VALUES (2950,192,'HI','Hiiraan');
INSERT INTO `l38sx_tienda_zones` VALUES (2951,192,'JD','Jubbada Dhexe');
INSERT INTO `l38sx_tienda_zones` VALUES (2952,192,'JH','Jubbada Hoose');
INSERT INTO `l38sx_tienda_zones` VALUES (2953,192,'MU','Mudug');
INSERT INTO `l38sx_tienda_zones` VALUES (2954,192,'NU','Nugaal');
INSERT INTO `l38sx_tienda_zones` VALUES (2955,192,'SA','Sanaag');
INSERT INTO `l38sx_tienda_zones` VALUES (2956,192,'SD','Shabeellaha Dhexe');
INSERT INTO `l38sx_tienda_zones` VALUES (2957,192,'SH','Shabeellaha Hoose');
INSERT INTO `l38sx_tienda_zones` VALUES (2958,192,'SL','Sool');
INSERT INTO `l38sx_tienda_zones` VALUES (2959,192,'TO','Togdheer');
INSERT INTO `l38sx_tienda_zones` VALUES (2960,192,'WG','Woqooyi Galbeed');
INSERT INTO `l38sx_tienda_zones` VALUES (2961,193,'EC','Eastern Cape');
INSERT INTO `l38sx_tienda_zones` VALUES (2962,193,'FS','Free State');
INSERT INTO `l38sx_tienda_zones` VALUES (2963,193,'GT','Gauteng');
INSERT INTO `l38sx_tienda_zones` VALUES (2964,193,'KN','KwaZulu-Natal');
INSERT INTO `l38sx_tienda_zones` VALUES (2965,193,'LP','Limpopo');
INSERT INTO `l38sx_tienda_zones` VALUES (2966,193,'MP','Mpumalanga');
INSERT INTO `l38sx_tienda_zones` VALUES (2967,193,'NW','North West');
INSERT INTO `l38sx_tienda_zones` VALUES (2968,193,'NC','Northern Cape');
INSERT INTO `l38sx_tienda_zones` VALUES (2969,193,'WC','Western Cape');
INSERT INTO `l38sx_tienda_zones` VALUES (2970,195,'CA','La Coru&ntilde;a');
INSERT INTO `l38sx_tienda_zones` VALUES (2971,195,'AL','&Aacute;lava');
INSERT INTO `l38sx_tienda_zones` VALUES (2972,195,'AB','Albacete');
INSERT INTO `l38sx_tienda_zones` VALUES (2973,195,'AC','Alicante');
INSERT INTO `l38sx_tienda_zones` VALUES (2974,195,'AM','Almeria');
INSERT INTO `l38sx_tienda_zones` VALUES (2975,195,'AS','Asturias');
INSERT INTO `l38sx_tienda_zones` VALUES (2976,195,'AV','&Aacute;vila');
INSERT INTO `l38sx_tienda_zones` VALUES (2977,195,'BJ','Badajoz');
INSERT INTO `l38sx_tienda_zones` VALUES (2978,195,'IB','Baleares');
INSERT INTO `l38sx_tienda_zones` VALUES (2979,195,'BA','Barcelona');
INSERT INTO `l38sx_tienda_zones` VALUES (2980,195,'BU','Burgos');
INSERT INTO `l38sx_tienda_zones` VALUES (2981,195,'CC','C&aacute;ceres');
INSERT INTO `l38sx_tienda_zones` VALUES (2982,195,'CZ','C&aacute;diz');
INSERT INTO `l38sx_tienda_zones` VALUES (2983,195,'CT','Cantabria');
INSERT INTO `l38sx_tienda_zones` VALUES (2984,195,'CL','Castell&oacute;n');
INSERT INTO `l38sx_tienda_zones` VALUES (2985,195,'CE','Ceuta');
INSERT INTO `l38sx_tienda_zones` VALUES (2986,195,'CR','Ciudad Real');
INSERT INTO `l38sx_tienda_zones` VALUES (2987,195,'CD','C&oacute;rdoba');
INSERT INTO `l38sx_tienda_zones` VALUES (2988,195,'CU','Cuenca');
INSERT INTO `l38sx_tienda_zones` VALUES (2989,195,'GI','Girona');
INSERT INTO `l38sx_tienda_zones` VALUES (2990,195,'GD','Granada');
INSERT INTO `l38sx_tienda_zones` VALUES (2991,195,'GJ','Guadalajara');
INSERT INTO `l38sx_tienda_zones` VALUES (2992,195,'GP','Guip&uacute;zcoa');
INSERT INTO `l38sx_tienda_zones` VALUES (2993,195,'HL','Huelva');
INSERT INTO `l38sx_tienda_zones` VALUES (2994,195,'HS','Huesca');
INSERT INTO `l38sx_tienda_zones` VALUES (2995,195,'JN','Ja&eacute;n');
INSERT INTO `l38sx_tienda_zones` VALUES (2996,195,'RJ','La Rioja');
INSERT INTO `l38sx_tienda_zones` VALUES (2997,195,'PM','Las Palmas');
INSERT INTO `l38sx_tienda_zones` VALUES (2998,195,'LE','Leon');
INSERT INTO `l38sx_tienda_zones` VALUES (2999,195,'LL','Lleida');
INSERT INTO `l38sx_tienda_zones` VALUES (3000,195,'LG','Lugo');
INSERT INTO `l38sx_tienda_zones` VALUES (3001,195,'MD','Madrid');
INSERT INTO `l38sx_tienda_zones` VALUES (3002,195,'MA','Malaga');
INSERT INTO `l38sx_tienda_zones` VALUES (3003,195,'ML','Melilla');
INSERT INTO `l38sx_tienda_zones` VALUES (3004,195,'MU','Murcia');
INSERT INTO `l38sx_tienda_zones` VALUES (3005,195,'NV','Navarra');
INSERT INTO `l38sx_tienda_zones` VALUES (3006,195,'OU','Ourense');
INSERT INTO `l38sx_tienda_zones` VALUES (3007,195,'PL','Palencia');
INSERT INTO `l38sx_tienda_zones` VALUES (3008,195,'PO','Pontevedra');
INSERT INTO `l38sx_tienda_zones` VALUES (3009,195,'SL','Salamanca');
INSERT INTO `l38sx_tienda_zones` VALUES (3010,195,'SC','Santa Cruz de Tenerife');
INSERT INTO `l38sx_tienda_zones` VALUES (3011,195,'SG','Segovia');
INSERT INTO `l38sx_tienda_zones` VALUES (3012,195,'SV','Sevilla');
INSERT INTO `l38sx_tienda_zones` VALUES (3013,195,'SO','Soria');
INSERT INTO `l38sx_tienda_zones` VALUES (3014,195,'TA','Tarragona');
INSERT INTO `l38sx_tienda_zones` VALUES (3015,195,'TE','Teruel');
INSERT INTO `l38sx_tienda_zones` VALUES (3016,195,'TO','Toledo');
INSERT INTO `l38sx_tienda_zones` VALUES (3017,195,'VC','Valencia');
INSERT INTO `l38sx_tienda_zones` VALUES (3018,195,'VD','Valladolid');
INSERT INTO `l38sx_tienda_zones` VALUES (3019,195,'VZ','Vizcaya');
INSERT INTO `l38sx_tienda_zones` VALUES (3020,195,'ZM','Zamora');
INSERT INTO `l38sx_tienda_zones` VALUES (3021,195,'ZR','Zaragoza');
INSERT INTO `l38sx_tienda_zones` VALUES (3022,196,'CE','Central');
INSERT INTO `l38sx_tienda_zones` VALUES (3023,196,'EA','Eastern');
INSERT INTO `l38sx_tienda_zones` VALUES (3024,196,'NC','North Central');
INSERT INTO `l38sx_tienda_zones` VALUES (3025,196,'NO','Northern');
INSERT INTO `l38sx_tienda_zones` VALUES (3026,196,'NW','North Western');
INSERT INTO `l38sx_tienda_zones` VALUES (3027,196,'SA','Sabaragamuwa');
INSERT INTO `l38sx_tienda_zones` VALUES (3028,196,'SO','Southern');
INSERT INTO `l38sx_tienda_zones` VALUES (3029,196,'UV','Uva');
INSERT INTO `l38sx_tienda_zones` VALUES (3030,196,'WE','Western');
INSERT INTO `l38sx_tienda_zones` VALUES (3031,197,'A','Ascension');
INSERT INTO `l38sx_tienda_zones` VALUES (3032,197,'S','Saint Helena');
INSERT INTO `l38sx_tienda_zones` VALUES (3033,197,'T','Tristan da Cunha');
INSERT INTO `l38sx_tienda_zones` VALUES (3034,199,'ANL','A\'ali an Nil');
INSERT INTO `l38sx_tienda_zones` VALUES (3035,199,'BAM','Al Bahr al Ahmar');
INSERT INTO `l38sx_tienda_zones` VALUES (3036,199,'BRT','Al Buhayrat');
INSERT INTO `l38sx_tienda_zones` VALUES (3037,199,'JZR','Al Jazirah');
INSERT INTO `l38sx_tienda_zones` VALUES (3038,199,'KRT','Al Khartum');
INSERT INTO `l38sx_tienda_zones` VALUES (3039,199,'QDR','Al Qadarif');
INSERT INTO `l38sx_tienda_zones` VALUES (3040,199,'WDH','Al Wahdah');
INSERT INTO `l38sx_tienda_zones` VALUES (3041,199,'ANB','An Nil al Abyad');
INSERT INTO `l38sx_tienda_zones` VALUES (3042,199,'ANZ','An Nil al Azraq');
INSERT INTO `l38sx_tienda_zones` VALUES (3043,199,'ASH','Ash Shamaliyah');
INSERT INTO `l38sx_tienda_zones` VALUES (3044,199,'BJA','Bahr al Jabal');
INSERT INTO `l38sx_tienda_zones` VALUES (3045,199,'GIS','Gharb al Istiwa\'iyah');
INSERT INTO `l38sx_tienda_zones` VALUES (3046,199,'GBG','Gharb Bahr al Ghazal');
INSERT INTO `l38sx_tienda_zones` VALUES (3047,199,'GDA','Gharb Darfur');
INSERT INTO `l38sx_tienda_zones` VALUES (3048,199,'GKU','Gharb Kurdufan');
INSERT INTO `l38sx_tienda_zones` VALUES (3049,199,'JDA','Janub Darfur');
INSERT INTO `l38sx_tienda_zones` VALUES (3050,199,'JKU','Janub Kurdufan');
INSERT INTO `l38sx_tienda_zones` VALUES (3051,199,'JQL','Junqali');
INSERT INTO `l38sx_tienda_zones` VALUES (3052,199,'KSL','Kassala');
INSERT INTO `l38sx_tienda_zones` VALUES (3053,199,'NNL','Nahr an Nil');
INSERT INTO `l38sx_tienda_zones` VALUES (3054,199,'SBG','Shamal Bahr al Ghazal');
INSERT INTO `l38sx_tienda_zones` VALUES (3055,199,'SDA','Shamal Darfur');
INSERT INTO `l38sx_tienda_zones` VALUES (3056,199,'SKU','Shamal Kurdufan');
INSERT INTO `l38sx_tienda_zones` VALUES (3057,199,'SIS','Sharq al Istiwa\'iyah');
INSERT INTO `l38sx_tienda_zones` VALUES (3058,199,'SNR','Sinnar');
INSERT INTO `l38sx_tienda_zones` VALUES (3059,199,'WRB','Warab');
INSERT INTO `l38sx_tienda_zones` VALUES (3060,200,'BR','Brokopondo');
INSERT INTO `l38sx_tienda_zones` VALUES (3061,200,'CM','Commewijne');
INSERT INTO `l38sx_tienda_zones` VALUES (3062,200,'CR','Coronie');
INSERT INTO `l38sx_tienda_zones` VALUES (3063,200,'MA','Marowijne');
INSERT INTO `l38sx_tienda_zones` VALUES (3064,200,'NI','Nickerie');
INSERT INTO `l38sx_tienda_zones` VALUES (3065,200,'PA','Para');
INSERT INTO `l38sx_tienda_zones` VALUES (3066,200,'PM','Paramaribo');
INSERT INTO `l38sx_tienda_zones` VALUES (3067,200,'SA','Saramacca');
INSERT INTO `l38sx_tienda_zones` VALUES (3068,200,'SI','Sipaliwini');
INSERT INTO `l38sx_tienda_zones` VALUES (3069,200,'WA','Wanica');
INSERT INTO `l38sx_tienda_zones` VALUES (3070,202,'H','Hhohho');
INSERT INTO `l38sx_tienda_zones` VALUES (3071,202,'L','Lubombo');
INSERT INTO `l38sx_tienda_zones` VALUES (3072,202,'M','Manzini');
INSERT INTO `l38sx_tienda_zones` VALUES (3073,202,'S','Shishelweni');
INSERT INTO `l38sx_tienda_zones` VALUES (3074,203,'K','Blekinge');
INSERT INTO `l38sx_tienda_zones` VALUES (3075,203,'W','Dalama');
INSERT INTO `l38sx_tienda_zones` VALUES (3076,203,'X','G&auml;vleborg');
INSERT INTO `l38sx_tienda_zones` VALUES (3077,203,'I','Gotland');
INSERT INTO `l38sx_tienda_zones` VALUES (3078,203,'N','Halland');
INSERT INTO `l38sx_tienda_zones` VALUES (3079,203,'Z','J&auml;mtland');
INSERT INTO `l38sx_tienda_zones` VALUES (3080,203,'F','J&ouml;nk&ouml;ping');
INSERT INTO `l38sx_tienda_zones` VALUES (3081,203,'H','Kalmar');
INSERT INTO `l38sx_tienda_zones` VALUES (3082,203,'G','Kronoberg');
INSERT INTO `l38sx_tienda_zones` VALUES (3083,203,'BD','Norrbotten');
INSERT INTO `l38sx_tienda_zones` VALUES (3084,203,'T','&Ouml;rebro');
INSERT INTO `l38sx_tienda_zones` VALUES (3085,203,'E','&Ouml;sterg&ouml;tland');
INSERT INTO `l38sx_tienda_zones` VALUES (3086,203,'M','Sk&aring;ne');
INSERT INTO `l38sx_tienda_zones` VALUES (3087,203,'D','S&ouml;dermanland');
INSERT INTO `l38sx_tienda_zones` VALUES (3088,203,'AB','Stockholm');
INSERT INTO `l38sx_tienda_zones` VALUES (3089,203,'C','Uppsala');
INSERT INTO `l38sx_tienda_zones` VALUES (3090,203,'S','V&auml;rmland');
INSERT INTO `l38sx_tienda_zones` VALUES (3091,203,'AC','V&auml;sterbotten');
INSERT INTO `l38sx_tienda_zones` VALUES (3092,203,'Y','V&auml;sternorrland');
INSERT INTO `l38sx_tienda_zones` VALUES (3093,203,'U','V&auml;stmanland');
INSERT INTO `l38sx_tienda_zones` VALUES (3094,203,'O','V&auml;stra G&ouml;taland');
INSERT INTO `l38sx_tienda_zones` VALUES (3095,204,'AG','Aargau');
INSERT INTO `l38sx_tienda_zones` VALUES (3096,204,'AR','Appenzell Ausserrhoden');
INSERT INTO `l38sx_tienda_zones` VALUES (3097,204,'AI','Appenzell Innerrhoden');
INSERT INTO `l38sx_tienda_zones` VALUES (3098,204,'BS','Basel-Stadt');
INSERT INTO `l38sx_tienda_zones` VALUES (3099,204,'BL','Basel-Landschaft');
INSERT INTO `l38sx_tienda_zones` VALUES (3100,204,'BE','Bern');
INSERT INTO `l38sx_tienda_zones` VALUES (3101,204,'FR','Fribourg');
INSERT INTO `l38sx_tienda_zones` VALUES (3102,204,'GE','Gen&egrave;ve');
INSERT INTO `l38sx_tienda_zones` VALUES (3103,204,'GL','Glarus');
INSERT INTO `l38sx_tienda_zones` VALUES (3104,204,'GR','Graub&uuml;nden');
INSERT INTO `l38sx_tienda_zones` VALUES (3105,204,'JU','Jura');
INSERT INTO `l38sx_tienda_zones` VALUES (3106,204,'LU','Luzern');
INSERT INTO `l38sx_tienda_zones` VALUES (3107,204,'NE','Neuch&acirc;tel');
INSERT INTO `l38sx_tienda_zones` VALUES (3108,204,'NW','Nidwald');
INSERT INTO `l38sx_tienda_zones` VALUES (3109,204,'OW','Obwald');
INSERT INTO `l38sx_tienda_zones` VALUES (3110,204,'SG','St. Gallen');
INSERT INTO `l38sx_tienda_zones` VALUES (3111,204,'SH','Schaffhausen');
INSERT INTO `l38sx_tienda_zones` VALUES (3112,204,'SZ','Schwyz');
INSERT INTO `l38sx_tienda_zones` VALUES (3113,204,'SO','Solothurn');
INSERT INTO `l38sx_tienda_zones` VALUES (3114,204,'TG','Thurgau');
INSERT INTO `l38sx_tienda_zones` VALUES (3115,204,'TI','Ticino');
INSERT INTO `l38sx_tienda_zones` VALUES (3116,204,'UR','Uri');
INSERT INTO `l38sx_tienda_zones` VALUES (3117,204,'VS','Valais');
INSERT INTO `l38sx_tienda_zones` VALUES (3118,204,'VD','Vaud');
INSERT INTO `l38sx_tienda_zones` VALUES (3119,204,'ZG','Zug');
INSERT INTO `l38sx_tienda_zones` VALUES (3120,204,'ZH','Z&uuml;rich');
INSERT INTO `l38sx_tienda_zones` VALUES (3121,205,'HA','Al Hasakah');
INSERT INTO `l38sx_tienda_zones` VALUES (3122,205,'LA','Al Ladhiqiyah');
INSERT INTO `l38sx_tienda_zones` VALUES (3123,205,'QU','Al Qunaytirah');
INSERT INTO `l38sx_tienda_zones` VALUES (3124,205,'RQ','Ar Raqqah');
INSERT INTO `l38sx_tienda_zones` VALUES (3125,205,'SU','As Suwayda');
INSERT INTO `l38sx_tienda_zones` VALUES (3126,205,'DA','Dara');
INSERT INTO `l38sx_tienda_zones` VALUES (3127,205,'DZ','Dayr az Zawr');
INSERT INTO `l38sx_tienda_zones` VALUES (3128,205,'DI','Dimashq');
INSERT INTO `l38sx_tienda_zones` VALUES (3129,205,'HL','Halab');
INSERT INTO `l38sx_tienda_zones` VALUES (3130,205,'HM','Hamah');
INSERT INTO `l38sx_tienda_zones` VALUES (3131,205,'HI','Hims');
INSERT INTO `l38sx_tienda_zones` VALUES (3132,205,'ID','Idlib');
INSERT INTO `l38sx_tienda_zones` VALUES (3133,205,'RD','Rif Dimashq');
INSERT INTO `l38sx_tienda_zones` VALUES (3134,205,'TA','Tartus');
INSERT INTO `l38sx_tienda_zones` VALUES (3135,206,'CH','Chang-hua');
INSERT INTO `l38sx_tienda_zones` VALUES (3136,206,'CI','Chia-i');
INSERT INTO `l38sx_tienda_zones` VALUES (3137,206,'HS','Hsin-chu');
INSERT INTO `l38sx_tienda_zones` VALUES (3138,206,'HL','Hua-lien');
INSERT INTO `l38sx_tienda_zones` VALUES (3139,206,'IL','I-lan');
INSERT INTO `l38sx_tienda_zones` VALUES (3140,206,'KH','Kao-hsiung county');
INSERT INTO `l38sx_tienda_zones` VALUES (3141,206,'KM','Kin-men');
INSERT INTO `l38sx_tienda_zones` VALUES (3142,206,'LC','Lien-chiang');
INSERT INTO `l38sx_tienda_zones` VALUES (3143,206,'ML','Miao-li');
INSERT INTO `l38sx_tienda_zones` VALUES (3144,206,'NT','Nan-t\'ou');
INSERT INTO `l38sx_tienda_zones` VALUES (3145,206,'PH','P\'eng-hu');
INSERT INTO `l38sx_tienda_zones` VALUES (3146,206,'PT','P\'ing-tung');
INSERT INTO `l38sx_tienda_zones` VALUES (3147,206,'TG','T\'ai-chung');
INSERT INTO `l38sx_tienda_zones` VALUES (3148,206,'TA','T\'ai-nan');
INSERT INTO `l38sx_tienda_zones` VALUES (3149,206,'TP','T\'ai-pei county');
INSERT INTO `l38sx_tienda_zones` VALUES (3150,206,'TT','T\'ai-tung');
INSERT INTO `l38sx_tienda_zones` VALUES (3151,206,'TY','T\'ao-yuan');
INSERT INTO `l38sx_tienda_zones` VALUES (3152,206,'YL','Yun-lin');
INSERT INTO `l38sx_tienda_zones` VALUES (3153,206,'CC','Chia-i city');
INSERT INTO `l38sx_tienda_zones` VALUES (3154,206,'CL','Chi-lung');
INSERT INTO `l38sx_tienda_zones` VALUES (3155,206,'HC','Hsin-chu');
INSERT INTO `l38sx_tienda_zones` VALUES (3156,206,'TH','T\'ai-chung');
INSERT INTO `l38sx_tienda_zones` VALUES (3157,206,'TN','T\'ai-nan');
INSERT INTO `l38sx_tienda_zones` VALUES (3158,206,'KC','Kao-hsiung city');
INSERT INTO `l38sx_tienda_zones` VALUES (3159,206,'TC','T\'ai-pei city');
INSERT INTO `l38sx_tienda_zones` VALUES (3160,207,'GB','Gorno-Badakhstan');
INSERT INTO `l38sx_tienda_zones` VALUES (3161,207,'KT','Khatlon');
INSERT INTO `l38sx_tienda_zones` VALUES (3162,207,'SU','Sughd');
INSERT INTO `l38sx_tienda_zones` VALUES (3163,208,'AR','Arusha');
INSERT INTO `l38sx_tienda_zones` VALUES (3164,208,'DS','Dar es Salaam');
INSERT INTO `l38sx_tienda_zones` VALUES (3165,208,'DO','Dodoma');
INSERT INTO `l38sx_tienda_zones` VALUES (3166,208,'IR','Iringa');
INSERT INTO `l38sx_tienda_zones` VALUES (3167,208,'KA','Kagera');
INSERT INTO `l38sx_tienda_zones` VALUES (3168,208,'KI','Kigoma');
INSERT INTO `l38sx_tienda_zones` VALUES (3169,208,'KJ','Kilimanjaro');
INSERT INTO `l38sx_tienda_zones` VALUES (3170,208,'LN','Lindi');
INSERT INTO `l38sx_tienda_zones` VALUES (3171,208,'MY','Manyara');
INSERT INTO `l38sx_tienda_zones` VALUES (3172,208,'MR','Mara');
INSERT INTO `l38sx_tienda_zones` VALUES (3173,208,'MB','Mbeya');
INSERT INTO `l38sx_tienda_zones` VALUES (3174,208,'MO','Morogoro');
INSERT INTO `l38sx_tienda_zones` VALUES (3175,208,'MT','Mtwara');
INSERT INTO `l38sx_tienda_zones` VALUES (3176,208,'MW','Mwanza');
INSERT INTO `l38sx_tienda_zones` VALUES (3177,208,'PN','Pemba North');
INSERT INTO `l38sx_tienda_zones` VALUES (3178,208,'PS','Pemba South');
INSERT INTO `l38sx_tienda_zones` VALUES (3179,208,'PW','Pwani');
INSERT INTO `l38sx_tienda_zones` VALUES (3180,208,'RK','Rukwa');
INSERT INTO `l38sx_tienda_zones` VALUES (3181,208,'RV','Ruvuma');
INSERT INTO `l38sx_tienda_zones` VALUES (3182,208,'SH','Shinyanga');
INSERT INTO `l38sx_tienda_zones` VALUES (3183,208,'SI','Singida');
INSERT INTO `l38sx_tienda_zones` VALUES (3184,208,'TB','Tabora');
INSERT INTO `l38sx_tienda_zones` VALUES (3185,208,'TN','Tanga');
INSERT INTO `l38sx_tienda_zones` VALUES (3186,208,'ZC','Zanzibar Central/South');
INSERT INTO `l38sx_tienda_zones` VALUES (3187,208,'ZN','Zanzibar North');
INSERT INTO `l38sx_tienda_zones` VALUES (3188,208,'ZU','Zanzibar Urban/West');
INSERT INTO `l38sx_tienda_zones` VALUES (3189,209,'Amnat Charoen','Amnat Charoen');
INSERT INTO `l38sx_tienda_zones` VALUES (3190,209,'Ang Thong','Ang Thong');
INSERT INTO `l38sx_tienda_zones` VALUES (3191,209,'Ayutthaya','Ayutthaya');
INSERT INTO `l38sx_tienda_zones` VALUES (3192,209,'Bangkok','Bangkok');
INSERT INTO `l38sx_tienda_zones` VALUES (3193,209,'Buriram','Buriram');
INSERT INTO `l38sx_tienda_zones` VALUES (3194,209,'Chachoengsao','Chachoengsao');
INSERT INTO `l38sx_tienda_zones` VALUES (3195,209,'Chai Nat','Chai Nat');
INSERT INTO `l38sx_tienda_zones` VALUES (3196,209,'Chaiyaphum','Chaiyaphum');
INSERT INTO `l38sx_tienda_zones` VALUES (3197,209,'Chanthaburi','Chanthaburi');
INSERT INTO `l38sx_tienda_zones` VALUES (3198,209,'Chiang Mai','Chiang Mai');
INSERT INTO `l38sx_tienda_zones` VALUES (3199,209,'Chiang Rai','Chiang Rai');
INSERT INTO `l38sx_tienda_zones` VALUES (3200,209,'Chon Buri','Chon Buri');
INSERT INTO `l38sx_tienda_zones` VALUES (3201,209,'Chumphon','Chumphon');
INSERT INTO `l38sx_tienda_zones` VALUES (3202,209,'Kalasin','Kalasin');
INSERT INTO `l38sx_tienda_zones` VALUES (3203,209,'Kamphaeng Phet','Kamphaeng Phet');
INSERT INTO `l38sx_tienda_zones` VALUES (3204,209,'Kanchanaburi','Kanchanaburi');
INSERT INTO `l38sx_tienda_zones` VALUES (3205,209,'Khon Kaen','Khon Kaen');
INSERT INTO `l38sx_tienda_zones` VALUES (3206,209,'Krabi','Krabi');
INSERT INTO `l38sx_tienda_zones` VALUES (3207,209,'Lampang','Lampang');
INSERT INTO `l38sx_tienda_zones` VALUES (3208,209,'Lamphun','Lamphun');
INSERT INTO `l38sx_tienda_zones` VALUES (3209,209,'Loei','Loei');
INSERT INTO `l38sx_tienda_zones` VALUES (3210,209,'Lop Buri','Lop Buri');
INSERT INTO `l38sx_tienda_zones` VALUES (3211,209,'Mae Hong Son','Mae Hong Son');
INSERT INTO `l38sx_tienda_zones` VALUES (3212,209,'Maha Sarakham','Maha Sarakham');
INSERT INTO `l38sx_tienda_zones` VALUES (3213,209,'Mukdahan','Mukdahan');
INSERT INTO `l38sx_tienda_zones` VALUES (3214,209,'Nakhon Nayok','Nakhon Nayok');
INSERT INTO `l38sx_tienda_zones` VALUES (3215,209,'Nakhon Pathom','Nakhon Pathom');
INSERT INTO `l38sx_tienda_zones` VALUES (3216,209,'Nakhon Phanom','Nakhon Phanom');
INSERT INTO `l38sx_tienda_zones` VALUES (3217,209,'Nakhon Ratchasima','Nakhon Ratchasima');
INSERT INTO `l38sx_tienda_zones` VALUES (3218,209,'Nakhon Sawan','Nakhon Sawan');
INSERT INTO `l38sx_tienda_zones` VALUES (3219,209,'Nakhon Si Thammarat','Nakhon Si Thammarat');
INSERT INTO `l38sx_tienda_zones` VALUES (3220,209,'Nan','Nan');
INSERT INTO `l38sx_tienda_zones` VALUES (3221,209,'Narathiwat','Narathiwat');
INSERT INTO `l38sx_tienda_zones` VALUES (3222,209,'Nong Bua Lamphu','Nong Bua Lamphu');
INSERT INTO `l38sx_tienda_zones` VALUES (3223,209,'Nong Khai','Nong Khai');
INSERT INTO `l38sx_tienda_zones` VALUES (3224,209,'Nonthaburi','Nonthaburi');
INSERT INTO `l38sx_tienda_zones` VALUES (3225,209,'Pathum Thani','Pathum Thani');
INSERT INTO `l38sx_tienda_zones` VALUES (3226,209,'Pattani','Pattani');
INSERT INTO `l38sx_tienda_zones` VALUES (3227,209,'Phangnga','Phangnga');
INSERT INTO `l38sx_tienda_zones` VALUES (3228,209,'Phatthalung','Phatthalung');
INSERT INTO `l38sx_tienda_zones` VALUES (3229,209,'Phayao','Phayao');
INSERT INTO `l38sx_tienda_zones` VALUES (3230,209,'Phetchabun','Phetchabun');
INSERT INTO `l38sx_tienda_zones` VALUES (3231,209,'Phetchaburi','Phetchaburi');
INSERT INTO `l38sx_tienda_zones` VALUES (3232,209,'Phichit','Phichit');
INSERT INTO `l38sx_tienda_zones` VALUES (3233,209,'Phitsanulok','Phitsanulok');
INSERT INTO `l38sx_tienda_zones` VALUES (3234,209,'Phrae','Phrae');
INSERT INTO `l38sx_tienda_zones` VALUES (3235,209,'Phuket','Phuket');
INSERT INTO `l38sx_tienda_zones` VALUES (3236,209,'Prachin Buri','Prachin Buri');
INSERT INTO `l38sx_tienda_zones` VALUES (3237,209,'Prachuap Khiri Khan','Prachuap Khiri Khan');
INSERT INTO `l38sx_tienda_zones` VALUES (3238,209,'Ranong','Ranong');
INSERT INTO `l38sx_tienda_zones` VALUES (3239,209,'Ratchaburi','Ratchaburi');
INSERT INTO `l38sx_tienda_zones` VALUES (3240,209,'Rayong','Rayong');
INSERT INTO `l38sx_tienda_zones` VALUES (3241,209,'Roi Et','Roi Et');
INSERT INTO `l38sx_tienda_zones` VALUES (3242,209,'Sa Kaeo','Sa Kaeo');
INSERT INTO `l38sx_tienda_zones` VALUES (3243,209,'Sakon Nakhon','Sakon Nakhon');
INSERT INTO `l38sx_tienda_zones` VALUES (3244,209,'Samut Prakan','Samut Prakan');
INSERT INTO `l38sx_tienda_zones` VALUES (3245,209,'Samut Sakhon','Samut Sakhon');
INSERT INTO `l38sx_tienda_zones` VALUES (3246,209,'Samut Songkhram','Samut Songkhram');
INSERT INTO `l38sx_tienda_zones` VALUES (3247,209,'Sara Buri','Sara Buri');
INSERT INTO `l38sx_tienda_zones` VALUES (3248,209,'Satun','Satun');
INSERT INTO `l38sx_tienda_zones` VALUES (3249,209,'Sing Buri','Sing Buri');
INSERT INTO `l38sx_tienda_zones` VALUES (3250,209,'Sisaket','Sisaket');
INSERT INTO `l38sx_tienda_zones` VALUES (3251,209,'Songkhla','Songkhla');
INSERT INTO `l38sx_tienda_zones` VALUES (3252,209,'Sukhothai','Sukhothai');
INSERT INTO `l38sx_tienda_zones` VALUES (3253,209,'Suphan Buri','Suphan Buri');
INSERT INTO `l38sx_tienda_zones` VALUES (3254,209,'Surat Thani','Surat Thani');
INSERT INTO `l38sx_tienda_zones` VALUES (3255,209,'Surin','Surin');
INSERT INTO `l38sx_tienda_zones` VALUES (3256,209,'Tak','Tak');
INSERT INTO `l38sx_tienda_zones` VALUES (3257,209,'Trang','Trang');
INSERT INTO `l38sx_tienda_zones` VALUES (3258,209,'Trat','Trat');
INSERT INTO `l38sx_tienda_zones` VALUES (3259,209,'Ubon Ratchathani','Ubon Ratchathani');
INSERT INTO `l38sx_tienda_zones` VALUES (3260,209,'Udon Thani','Udon Thani');
INSERT INTO `l38sx_tienda_zones` VALUES (3261,209,'Uthai Thani','Uthai Thani');
INSERT INTO `l38sx_tienda_zones` VALUES (3262,209,'Uttaradit','Uttaradit');
INSERT INTO `l38sx_tienda_zones` VALUES (3263,209,'Yala','Yala');
INSERT INTO `l38sx_tienda_zones` VALUES (3264,209,'Yasothon','Yasothon');
INSERT INTO `l38sx_tienda_zones` VALUES (3265,210,'K','Kara');
INSERT INTO `l38sx_tienda_zones` VALUES (3266,210,'P','Plateaux');
INSERT INTO `l38sx_tienda_zones` VALUES (3267,210,'S','Savanes');
INSERT INTO `l38sx_tienda_zones` VALUES (3268,210,'C','Centrale');
INSERT INTO `l38sx_tienda_zones` VALUES (3269,210,'M','Maritime');
INSERT INTO `l38sx_tienda_zones` VALUES (3270,211,'A','Atafu');
INSERT INTO `l38sx_tienda_zones` VALUES (3271,211,'F','Fakaofo');
INSERT INTO `l38sx_tienda_zones` VALUES (3272,211,'N','Nukunonu');
INSERT INTO `l38sx_tienda_zones` VALUES (3273,212,'H','Ha\'apai');
INSERT INTO `l38sx_tienda_zones` VALUES (3274,212,'T','Tongatapu');
INSERT INTO `l38sx_tienda_zones` VALUES (3275,212,'V','Vava\'u');
INSERT INTO `l38sx_tienda_zones` VALUES (3276,213,'CT','Couva/Tabaquite/Talparo');
INSERT INTO `l38sx_tienda_zones` VALUES (3277,213,'DM','Diego Martin');
INSERT INTO `l38sx_tienda_zones` VALUES (3278,213,'MR','Mayaro/Rio Claro');
INSERT INTO `l38sx_tienda_zones` VALUES (3279,213,'PD','Penal/Debe');
INSERT INTO `l38sx_tienda_zones` VALUES (3280,213,'PT','Princes Town');
INSERT INTO `l38sx_tienda_zones` VALUES (3281,213,'SG','Sangre Grande');
INSERT INTO `l38sx_tienda_zones` VALUES (3282,213,'SL','San Juan/Laventille');
INSERT INTO `l38sx_tienda_zones` VALUES (3283,213,'SI','Siparia');
INSERT INTO `l38sx_tienda_zones` VALUES (3284,213,'TP','Tunapuna/Piarco');
INSERT INTO `l38sx_tienda_zones` VALUES (3285,213,'PS','Port of Spain');
INSERT INTO `l38sx_tienda_zones` VALUES (3286,213,'SF','San Fernando');
INSERT INTO `l38sx_tienda_zones` VALUES (3287,213,'AR','Arima');
INSERT INTO `l38sx_tienda_zones` VALUES (3288,213,'PF','Point Fortin');
INSERT INTO `l38sx_tienda_zones` VALUES (3289,213,'CH','Chaguanas');
INSERT INTO `l38sx_tienda_zones` VALUES (3290,213,'TO','Tobago');
INSERT INTO `l38sx_tienda_zones` VALUES (3291,214,'AR','Ariana');
INSERT INTO `l38sx_tienda_zones` VALUES (3292,214,'BJ','Beja');
INSERT INTO `l38sx_tienda_zones` VALUES (3293,214,'BA','Ben Arous');
INSERT INTO `l38sx_tienda_zones` VALUES (3294,214,'BI','Bizerte');
INSERT INTO `l38sx_tienda_zones` VALUES (3295,214,'GB','Gabes');
INSERT INTO `l38sx_tienda_zones` VALUES (3296,214,'GF','Gafsa');
INSERT INTO `l38sx_tienda_zones` VALUES (3297,214,'JE','Jendouba');
INSERT INTO `l38sx_tienda_zones` VALUES (3298,214,'KR','Kairouan');
INSERT INTO `l38sx_tienda_zones` VALUES (3299,214,'KS','Kasserine');
INSERT INTO `l38sx_tienda_zones` VALUES (3300,214,'KB','Kebili');
INSERT INTO `l38sx_tienda_zones` VALUES (3301,214,'KF','Kef');
INSERT INTO `l38sx_tienda_zones` VALUES (3302,214,'MH','Mahdia');
INSERT INTO `l38sx_tienda_zones` VALUES (3303,214,'MN','Manouba');
INSERT INTO `l38sx_tienda_zones` VALUES (3304,214,'ME','Medenine');
INSERT INTO `l38sx_tienda_zones` VALUES (3305,214,'MO','Monastir');
INSERT INTO `l38sx_tienda_zones` VALUES (3306,214,'NA','Nabeul');
INSERT INTO `l38sx_tienda_zones` VALUES (3307,214,'SF','Sfax');
INSERT INTO `l38sx_tienda_zones` VALUES (3308,214,'SD','Sidi');
INSERT INTO `l38sx_tienda_zones` VALUES (3309,214,'SL','Siliana');
INSERT INTO `l38sx_tienda_zones` VALUES (3310,214,'SO','Sousse');
INSERT INTO `l38sx_tienda_zones` VALUES (3311,214,'TA','Tataouine');
INSERT INTO `l38sx_tienda_zones` VALUES (3312,214,'TO','Tozeur');
INSERT INTO `l38sx_tienda_zones` VALUES (3313,214,'TU','Tunis');
INSERT INTO `l38sx_tienda_zones` VALUES (3314,214,'ZA','Zaghouan');
INSERT INTO `l38sx_tienda_zones` VALUES (3315,215,'ADA','Adana');
INSERT INTO `l38sx_tienda_zones` VALUES (3316,215,'ADI','Adiyaman');
INSERT INTO `l38sx_tienda_zones` VALUES (3317,215,'AFY','Afyonkarahisar');
INSERT INTO `l38sx_tienda_zones` VALUES (3318,215,'AGR','Agri');
INSERT INTO `l38sx_tienda_zones` VALUES (3319,215,'AKS','Aksaray');
INSERT INTO `l38sx_tienda_zones` VALUES (3320,215,'AMA','Amasya');
INSERT INTO `l38sx_tienda_zones` VALUES (3321,215,'ANK','Ankara');
INSERT INTO `l38sx_tienda_zones` VALUES (3322,215,'ANT','Antalya');
INSERT INTO `l38sx_tienda_zones` VALUES (3323,215,'ARD','Ardahan');
INSERT INTO `l38sx_tienda_zones` VALUES (3324,215,'ART','Artvin');
INSERT INTO `l38sx_tienda_zones` VALUES (3325,215,'AYI','Aydin');
INSERT INTO `l38sx_tienda_zones` VALUES (3326,215,'BAL','Balikesir');
INSERT INTO `l38sx_tienda_zones` VALUES (3327,215,'BAR','Bartin');
INSERT INTO `l38sx_tienda_zones` VALUES (3328,215,'BAT','Batman');
INSERT INTO `l38sx_tienda_zones` VALUES (3329,215,'BAY','Bayburt');
INSERT INTO `l38sx_tienda_zones` VALUES (3330,215,'BIL','Bilecik');
INSERT INTO `l38sx_tienda_zones` VALUES (3331,215,'BIN','Bingol');
INSERT INTO `l38sx_tienda_zones` VALUES (3332,215,'BIT','Bitlis');
INSERT INTO `l38sx_tienda_zones` VALUES (3333,215,'BOL','Bolu');
INSERT INTO `l38sx_tienda_zones` VALUES (3334,215,'BRD','Burdur');
INSERT INTO `l38sx_tienda_zones` VALUES (3335,215,'BRS','Bursa');
INSERT INTO `l38sx_tienda_zones` VALUES (3336,215,'CKL','Canakkale');
INSERT INTO `l38sx_tienda_zones` VALUES (3337,215,'CKR','Cankiri');
INSERT INTO `l38sx_tienda_zones` VALUES (3338,215,'COR','Corum');
INSERT INTO `l38sx_tienda_zones` VALUES (3339,215,'DEN','Denizli');
INSERT INTO `l38sx_tienda_zones` VALUES (3340,215,'DIY','Diyarbakir');
INSERT INTO `l38sx_tienda_zones` VALUES (3341,215,'DUZ','Duzce');
INSERT INTO `l38sx_tienda_zones` VALUES (3342,215,'EDI','Edirne');
INSERT INTO `l38sx_tienda_zones` VALUES (3343,215,'ELA','Elazig');
INSERT INTO `l38sx_tienda_zones` VALUES (3344,215,'EZC','Erzincan');
INSERT INTO `l38sx_tienda_zones` VALUES (3345,215,'EZR','Erzurum');
INSERT INTO `l38sx_tienda_zones` VALUES (3346,215,'ESK','Eskisehir');
INSERT INTO `l38sx_tienda_zones` VALUES (3347,215,'GAZ','Gaziantep');
INSERT INTO `l38sx_tienda_zones` VALUES (3348,215,'GIR','Giresun');
INSERT INTO `l38sx_tienda_zones` VALUES (3349,215,'GMS','Gumushane');
INSERT INTO `l38sx_tienda_zones` VALUES (3350,215,'HKR','Hakkari');
INSERT INTO `l38sx_tienda_zones` VALUES (3351,215,'HTY','Hatay');
INSERT INTO `l38sx_tienda_zones` VALUES (3352,215,'IGD','Igdir');
INSERT INTO `l38sx_tienda_zones` VALUES (3353,215,'ISP','Isparta');
INSERT INTO `l38sx_tienda_zones` VALUES (3354,215,'IST','Istanbul');
INSERT INTO `l38sx_tienda_zones` VALUES (3355,215,'IZM','Izmir');
INSERT INTO `l38sx_tienda_zones` VALUES (3356,215,'KAH','Kahramanmaras');
INSERT INTO `l38sx_tienda_zones` VALUES (3357,215,'KRB','Karabuk');
INSERT INTO `l38sx_tienda_zones` VALUES (3358,215,'KRM','Karaman');
INSERT INTO `l38sx_tienda_zones` VALUES (3359,215,'KRS','Kars');
INSERT INTO `l38sx_tienda_zones` VALUES (3360,215,'KAS','Kastamonu');
INSERT INTO `l38sx_tienda_zones` VALUES (3361,215,'KAY','Kayseri');
INSERT INTO `l38sx_tienda_zones` VALUES (3362,215,'KLS','Kilis');
INSERT INTO `l38sx_tienda_zones` VALUES (3363,215,'KRK','Kirikkale');
INSERT INTO `l38sx_tienda_zones` VALUES (3364,215,'KLR','Kirklareli');
INSERT INTO `l38sx_tienda_zones` VALUES (3365,215,'KRH','Kirsehir');
INSERT INTO `l38sx_tienda_zones` VALUES (3366,215,'KOC','Kocaeli');
INSERT INTO `l38sx_tienda_zones` VALUES (3367,215,'KON','Konya');
INSERT INTO `l38sx_tienda_zones` VALUES (3368,215,'KUT','Kutahya');
INSERT INTO `l38sx_tienda_zones` VALUES (3369,215,'MAL','Malatya');
INSERT INTO `l38sx_tienda_zones` VALUES (3370,215,'MAN','Manisa');
INSERT INTO `l38sx_tienda_zones` VALUES (3371,215,'MAR','Mardin');
INSERT INTO `l38sx_tienda_zones` VALUES (3372,215,'MER','Mersin');
INSERT INTO `l38sx_tienda_zones` VALUES (3373,215,'MUG','Mugla');
INSERT INTO `l38sx_tienda_zones` VALUES (3374,215,'MUS','Mus');
INSERT INTO `l38sx_tienda_zones` VALUES (3375,215,'NEV','Nevsehir');
INSERT INTO `l38sx_tienda_zones` VALUES (3376,215,'NIG','Nigde');
INSERT INTO `l38sx_tienda_zones` VALUES (3377,215,'ORD','Ordu');
INSERT INTO `l38sx_tienda_zones` VALUES (3378,215,'OSM','Osmaniye');
INSERT INTO `l38sx_tienda_zones` VALUES (3379,215,'RIZ','Rize');
INSERT INTO `l38sx_tienda_zones` VALUES (3380,215,'SAK','Sakarya');
INSERT INTO `l38sx_tienda_zones` VALUES (3381,215,'SAM','Samsun');
INSERT INTO `l38sx_tienda_zones` VALUES (3382,215,'SAN','Sanliurfa');
INSERT INTO `l38sx_tienda_zones` VALUES (3383,215,'SII','Siirt');
INSERT INTO `l38sx_tienda_zones` VALUES (3384,215,'SIN','Sinop');
INSERT INTO `l38sx_tienda_zones` VALUES (3385,215,'SIR','Sirnak');
INSERT INTO `l38sx_tienda_zones` VALUES (3386,215,'SIV','Sivas');
INSERT INTO `l38sx_tienda_zones` VALUES (3387,215,'TEL','Tekirdag');
INSERT INTO `l38sx_tienda_zones` VALUES (3388,215,'TOK','Tokat');
INSERT INTO `l38sx_tienda_zones` VALUES (3389,215,'TRA','Trabzon');
INSERT INTO `l38sx_tienda_zones` VALUES (3390,215,'TUN','Tunceli');
INSERT INTO `l38sx_tienda_zones` VALUES (3391,215,'USK','Usak');
INSERT INTO `l38sx_tienda_zones` VALUES (3392,215,'VAN','Van');
INSERT INTO `l38sx_tienda_zones` VALUES (3393,215,'YAL','Yalova');
INSERT INTO `l38sx_tienda_zones` VALUES (3394,215,'YOZ','Yozgat');
INSERT INTO `l38sx_tienda_zones` VALUES (3395,215,'ZON','Zonguldak');
INSERT INTO `l38sx_tienda_zones` VALUES (3396,216,'A','Ahal Welayaty');
INSERT INTO `l38sx_tienda_zones` VALUES (3397,216,'B','Balkan Welayaty');
INSERT INTO `l38sx_tienda_zones` VALUES (3398,216,'D','Dashhowuz Welayaty');
INSERT INTO `l38sx_tienda_zones` VALUES (3399,216,'L','Lebap Welayaty');
INSERT INTO `l38sx_tienda_zones` VALUES (3400,216,'M','Mary Welayaty');
INSERT INTO `l38sx_tienda_zones` VALUES (3401,217,'AC','Ambergris Cays');
INSERT INTO `l38sx_tienda_zones` VALUES (3402,217,'DC','Dellis Cay');
INSERT INTO `l38sx_tienda_zones` VALUES (3403,217,'FC','French Cay');
INSERT INTO `l38sx_tienda_zones` VALUES (3404,217,'LW','Little Water Cay');
INSERT INTO `l38sx_tienda_zones` VALUES (3405,217,'RC','Parrot Cay');
INSERT INTO `l38sx_tienda_zones` VALUES (3406,217,'PN','Pine Cay');
INSERT INTO `l38sx_tienda_zones` VALUES (3407,217,'SL','Salt Cay');
INSERT INTO `l38sx_tienda_zones` VALUES (3408,217,'GT','Grand Turk');
INSERT INTO `l38sx_tienda_zones` VALUES (3409,217,'SC','South Caicos');
INSERT INTO `l38sx_tienda_zones` VALUES (3410,217,'EC','East Caicos');
INSERT INTO `l38sx_tienda_zones` VALUES (3411,217,'MC','Middle Caicos');
INSERT INTO `l38sx_tienda_zones` VALUES (3412,217,'NC','North Caicos');
INSERT INTO `l38sx_tienda_zones` VALUES (3413,217,'PR','Providenciales');
INSERT INTO `l38sx_tienda_zones` VALUES (3414,217,'WC','West Caicos');
INSERT INTO `l38sx_tienda_zones` VALUES (3415,218,'NMG','Nanumanga');
INSERT INTO `l38sx_tienda_zones` VALUES (3416,218,'NLK','Niulakita');
INSERT INTO `l38sx_tienda_zones` VALUES (3417,218,'NTO','Niutao');
INSERT INTO `l38sx_tienda_zones` VALUES (3418,218,'FUN','Funafuti');
INSERT INTO `l38sx_tienda_zones` VALUES (3419,218,'NME','Nanumea');
INSERT INTO `l38sx_tienda_zones` VALUES (3420,218,'NUI','Nui');
INSERT INTO `l38sx_tienda_zones` VALUES (3421,218,'NFT','Nukufetau');
INSERT INTO `l38sx_tienda_zones` VALUES (3422,218,'NLL','Nukulaelae');
INSERT INTO `l38sx_tienda_zones` VALUES (3423,218,'VAI','Vaitupu');
INSERT INTO `l38sx_tienda_zones` VALUES (3424,219,'KAL','Kalangala');
INSERT INTO `l38sx_tienda_zones` VALUES (3425,219,'KMP','Kampala');
INSERT INTO `l38sx_tienda_zones` VALUES (3426,219,'KAY','Kayunga');
INSERT INTO `l38sx_tienda_zones` VALUES (3427,219,'KIB','Kiboga');
INSERT INTO `l38sx_tienda_zones` VALUES (3428,219,'LUW','Luwero');
INSERT INTO `l38sx_tienda_zones` VALUES (3429,219,'MAS','Masaka');
INSERT INTO `l38sx_tienda_zones` VALUES (3430,219,'MPI','Mpigi');
INSERT INTO `l38sx_tienda_zones` VALUES (3431,219,'MUB','Mubende');
INSERT INTO `l38sx_tienda_zones` VALUES (3432,219,'MUK','Mukono');
INSERT INTO `l38sx_tienda_zones` VALUES (3433,219,'NKS','Nakasongola');
INSERT INTO `l38sx_tienda_zones` VALUES (3434,219,'RAK','Rakai');
INSERT INTO `l38sx_tienda_zones` VALUES (3435,219,'SEM','Sembabule');
INSERT INTO `l38sx_tienda_zones` VALUES (3436,219,'WAK','Wakiso');
INSERT INTO `l38sx_tienda_zones` VALUES (3437,219,'BUG','Bugiri');
INSERT INTO `l38sx_tienda_zones` VALUES (3438,219,'BUS','Busia');
INSERT INTO `l38sx_tienda_zones` VALUES (3439,219,'IGA','Iganga');
INSERT INTO `l38sx_tienda_zones` VALUES (3440,219,'JIN','Jinja');
INSERT INTO `l38sx_tienda_zones` VALUES (3441,219,'KAB','Kaberamaido');
INSERT INTO `l38sx_tienda_zones` VALUES (3442,219,'KML','Kamuli');
INSERT INTO `l38sx_tienda_zones` VALUES (3443,219,'KPC','Kapchorwa');
INSERT INTO `l38sx_tienda_zones` VALUES (3444,219,'KTK','Katakwi');
INSERT INTO `l38sx_tienda_zones` VALUES (3445,219,'KUM','Kumi');
INSERT INTO `l38sx_tienda_zones` VALUES (3446,219,'MAY','Mayuge');
INSERT INTO `l38sx_tienda_zones` VALUES (3447,219,'MBA','Mbale');
INSERT INTO `l38sx_tienda_zones` VALUES (3448,219,'PAL','Pallisa');
INSERT INTO `l38sx_tienda_zones` VALUES (3449,219,'SIR','Sironko');
INSERT INTO `l38sx_tienda_zones` VALUES (3450,219,'SOR','Soroti');
INSERT INTO `l38sx_tienda_zones` VALUES (3451,219,'TOR','Tororo');
INSERT INTO `l38sx_tienda_zones` VALUES (3452,219,'ADJ','Adjumani');
INSERT INTO `l38sx_tienda_zones` VALUES (3453,219,'APC','Apac');
INSERT INTO `l38sx_tienda_zones` VALUES (3454,219,'ARU','Arua');
INSERT INTO `l38sx_tienda_zones` VALUES (3455,219,'GUL','Gulu');
INSERT INTO `l38sx_tienda_zones` VALUES (3456,219,'KIT','Kitgum');
INSERT INTO `l38sx_tienda_zones` VALUES (3457,219,'KOT','Kotido');
INSERT INTO `l38sx_tienda_zones` VALUES (3458,219,'LIR','Lira');
INSERT INTO `l38sx_tienda_zones` VALUES (3459,219,'MRT','Moroto');
INSERT INTO `l38sx_tienda_zones` VALUES (3460,219,'MOY','Moyo');
INSERT INTO `l38sx_tienda_zones` VALUES (3461,219,'NAK','Nakapiripirit');
INSERT INTO `l38sx_tienda_zones` VALUES (3462,219,'NEB','Nebbi');
INSERT INTO `l38sx_tienda_zones` VALUES (3463,219,'PAD','Pader');
INSERT INTO `l38sx_tienda_zones` VALUES (3464,219,'YUM','Yumbe');
INSERT INTO `l38sx_tienda_zones` VALUES (3465,219,'BUN','Bundibugyo');
INSERT INTO `l38sx_tienda_zones` VALUES (3466,219,'BSH','Bushenyi');
INSERT INTO `l38sx_tienda_zones` VALUES (3467,219,'HOI','Hoima');
INSERT INTO `l38sx_tienda_zones` VALUES (3468,219,'KBL','Kabale');
INSERT INTO `l38sx_tienda_zones` VALUES (3469,219,'KAR','Kabarole');
INSERT INTO `l38sx_tienda_zones` VALUES (3470,219,'KAM','Kamwenge');
INSERT INTO `l38sx_tienda_zones` VALUES (3471,219,'KAN','Kanungu');
INSERT INTO `l38sx_tienda_zones` VALUES (3472,219,'KAS','Kasese');
INSERT INTO `l38sx_tienda_zones` VALUES (3473,219,'KBA','Kibaale');
INSERT INTO `l38sx_tienda_zones` VALUES (3474,219,'KIS','Kisoro');
INSERT INTO `l38sx_tienda_zones` VALUES (3475,219,'KYE','Kyenjojo');
INSERT INTO `l38sx_tienda_zones` VALUES (3476,219,'MSN','Masindi');
INSERT INTO `l38sx_tienda_zones` VALUES (3477,219,'MBR','Mbarara');
INSERT INTO `l38sx_tienda_zones` VALUES (3478,219,'NTU','Ntungamo');
INSERT INTO `l38sx_tienda_zones` VALUES (3479,219,'RUK','Rukungiri');
INSERT INTO `l38sx_tienda_zones` VALUES (3480,220,'CK','Cherkasy');
INSERT INTO `l38sx_tienda_zones` VALUES (3481,220,'CH','Chernihiv');
INSERT INTO `l38sx_tienda_zones` VALUES (3482,220,'CV','Chernivtsi');
INSERT INTO `l38sx_tienda_zones` VALUES (3483,220,'CR','Crimea');
INSERT INTO `l38sx_tienda_zones` VALUES (3484,220,'DN','Dnipropetrovs\'k');
INSERT INTO `l38sx_tienda_zones` VALUES (3485,220,'DO','Donets\'k');
INSERT INTO `l38sx_tienda_zones` VALUES (3486,220,'IV','Ivano-Frankivs\'k');
INSERT INTO `l38sx_tienda_zones` VALUES (3487,220,'KL','Kharkiv Kherson');
INSERT INTO `l38sx_tienda_zones` VALUES (3488,220,'KM','Khmel\'nyts\'kyy');
INSERT INTO `l38sx_tienda_zones` VALUES (3489,220,'KR','Kirovohrad');
INSERT INTO `l38sx_tienda_zones` VALUES (3490,220,'KV','Kiev');
INSERT INTO `l38sx_tienda_zones` VALUES (3491,220,'KY','Kyyiv');
INSERT INTO `l38sx_tienda_zones` VALUES (3492,220,'LU','Luhans\'k');
INSERT INTO `l38sx_tienda_zones` VALUES (3493,220,'LV','L\'viv');
INSERT INTO `l38sx_tienda_zones` VALUES (3494,220,'MY','Mykolayiv');
INSERT INTO `l38sx_tienda_zones` VALUES (3495,220,'OD','Odesa');
INSERT INTO `l38sx_tienda_zones` VALUES (3496,220,'PO','Poltava');
INSERT INTO `l38sx_tienda_zones` VALUES (3497,220,'RI','Rivne');
INSERT INTO `l38sx_tienda_zones` VALUES (3498,220,'SE','Sevastopol');
INSERT INTO `l38sx_tienda_zones` VALUES (3499,220,'SU','Sumy');
INSERT INTO `l38sx_tienda_zones` VALUES (3500,220,'TE','Ternopil\'');
INSERT INTO `l38sx_tienda_zones` VALUES (3501,220,'VI','Vinnytsya');
INSERT INTO `l38sx_tienda_zones` VALUES (3502,220,'VO','Volyn\'');
INSERT INTO `l38sx_tienda_zones` VALUES (3503,220,'ZK','Zakarpattya');
INSERT INTO `l38sx_tienda_zones` VALUES (3504,220,'ZA','Zaporizhzhya');
INSERT INTO `l38sx_tienda_zones` VALUES (3505,220,'ZH','Zhytomyr');
INSERT INTO `l38sx_tienda_zones` VALUES (3506,221,'AZ','Abu Zaby');
INSERT INTO `l38sx_tienda_zones` VALUES (3507,221,'AJ','\'Ajman');
INSERT INTO `l38sx_tienda_zones` VALUES (3508,221,'FU','Al Fujayrah');
INSERT INTO `l38sx_tienda_zones` VALUES (3509,221,'SH','Ash Shariqah');
INSERT INTO `l38sx_tienda_zones` VALUES (3510,221,'DU','Dubayy');
INSERT INTO `l38sx_tienda_zones` VALUES (3511,221,'RK','R\'as al Khaymah');
INSERT INTO `l38sx_tienda_zones` VALUES (3512,221,'UQ','Umm al Qaywayn');
INSERT INTO `l38sx_tienda_zones` VALUES (3513,222,'ABN','Aberdeen');
INSERT INTO `l38sx_tienda_zones` VALUES (3514,222,'ABNS','Aberdeenshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3515,222,'ANG','Anglesey');
INSERT INTO `l38sx_tienda_zones` VALUES (3516,222,'AGS','Angus');
INSERT INTO `l38sx_tienda_zones` VALUES (3517,222,'ARY','Argyll and Bute');
INSERT INTO `l38sx_tienda_zones` VALUES (3518,222,'BEDS','Bedfordshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3519,222,'BERKS','Berkshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3520,222,'BLA','Blaenau Gwent');
INSERT INTO `l38sx_tienda_zones` VALUES (3521,222,'BRI','Bridgend');
INSERT INTO `l38sx_tienda_zones` VALUES (3522,222,'BSTL','Bristol');
INSERT INTO `l38sx_tienda_zones` VALUES (3523,222,'BUCKS','Buckinghamshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3524,222,'CAE','Caerphilly');
INSERT INTO `l38sx_tienda_zones` VALUES (3525,222,'CAMBS','Cambridgeshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3526,222,'CDF','Cardiff');
INSERT INTO `l38sx_tienda_zones` VALUES (3527,222,'CARM','Carmarthenshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3528,222,'CDGN','Ceredigion');
INSERT INTO `l38sx_tienda_zones` VALUES (3529,222,'CHES','Cheshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3530,222,'CLACK','Clackmannanshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3531,222,'CON','Conwy');
INSERT INTO `l38sx_tienda_zones` VALUES (3532,222,'CORN','Cornwall');
INSERT INTO `l38sx_tienda_zones` VALUES (3533,222,'DNBG','Denbighshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3534,222,'DERBY','Derbyshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3535,222,'DVN','Devon');
INSERT INTO `l38sx_tienda_zones` VALUES (3536,222,'DOR','Dorset');
INSERT INTO `l38sx_tienda_zones` VALUES (3537,222,'DGL','Dumfries and Galloway');
INSERT INTO `l38sx_tienda_zones` VALUES (3538,222,'DUND','Dundee');
INSERT INTO `l38sx_tienda_zones` VALUES (3539,222,'DHM','Durham');
INSERT INTO `l38sx_tienda_zones` VALUES (3540,222,'ARYE','East Ayrshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3541,222,'DUNBE','East Dunbartonshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3542,222,'LOTE','East Lothian');
INSERT INTO `l38sx_tienda_zones` VALUES (3543,222,'RENE','East Renfrewshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3544,222,'ERYS','East Riding of Yorkshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3545,222,'SXE','East Sussex');
INSERT INTO `l38sx_tienda_zones` VALUES (3546,222,'EDIN','Edinburgh');
INSERT INTO `l38sx_tienda_zones` VALUES (3547,222,'ESX','Essex');
INSERT INTO `l38sx_tienda_zones` VALUES (3548,222,'FALK','Falkirk');
INSERT INTO `l38sx_tienda_zones` VALUES (3549,222,'FFE','Fife');
INSERT INTO `l38sx_tienda_zones` VALUES (3550,222,'FLINT','Flintshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3551,222,'GLAS','Glasgow');
INSERT INTO `l38sx_tienda_zones` VALUES (3552,222,'GLOS','Gloucestershire');
INSERT INTO `l38sx_tienda_zones` VALUES (3553,222,'LDN','Greater London');
INSERT INTO `l38sx_tienda_zones` VALUES (3554,222,'MCH','Greater Manchester');
INSERT INTO `l38sx_tienda_zones` VALUES (3555,222,'GDD','Gwynedd');
INSERT INTO `l38sx_tienda_zones` VALUES (3556,222,'HANTS','Hampshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3557,222,'HWR','Herefordshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3558,222,'HERTS','Hertfordshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3559,222,'HLD','Highlands');
INSERT INTO `l38sx_tienda_zones` VALUES (3560,222,'IVER','Inverclyde');
INSERT INTO `l38sx_tienda_zones` VALUES (3561,222,'IOW','Isle of Wight');
INSERT INTO `l38sx_tienda_zones` VALUES (3562,222,'KNT','Kent');
INSERT INTO `l38sx_tienda_zones` VALUES (3563,222,'LANCS','Lancashire');
INSERT INTO `l38sx_tienda_zones` VALUES (3564,222,'LEICS','Leicestershire');
INSERT INTO `l38sx_tienda_zones` VALUES (3565,222,'LINCS','Lincolnshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3566,222,'MSY','Merseyside');
INSERT INTO `l38sx_tienda_zones` VALUES (3567,222,'MERT','Merthyr Tydfil');
INSERT INTO `l38sx_tienda_zones` VALUES (3568,222,'MLOT','Midlothian');
INSERT INTO `l38sx_tienda_zones` VALUES (3569,222,'MMOUTH','Monmouthshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3570,222,'MORAY','Moray');
INSERT INTO `l38sx_tienda_zones` VALUES (3571,222,'NPRTAL','Neath Port Talbot');
INSERT INTO `l38sx_tienda_zones` VALUES (3572,222,'NEWPT','Newport');
INSERT INTO `l38sx_tienda_zones` VALUES (3573,222,'NOR','Norfolk');
INSERT INTO `l38sx_tienda_zones` VALUES (3574,222,'ARYN','North Ayrshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3575,222,'LANN','North Lanarkshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3576,222,'YSN','North Yorkshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3577,222,'NHM','Northamptonshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3578,222,'NLD','Northumberland');
INSERT INTO `l38sx_tienda_zones` VALUES (3579,222,'NOT','Nottinghamshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3580,222,'ORK','Orkney Islands');
INSERT INTO `l38sx_tienda_zones` VALUES (3581,222,'OFE','Oxfordshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3582,222,'PEM','Pembrokeshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3583,222,'PERTH','Perth and Kinross');
INSERT INTO `l38sx_tienda_zones` VALUES (3584,222,'PWS','Powys');
INSERT INTO `l38sx_tienda_zones` VALUES (3585,222,'REN','Renfrewshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3586,222,'RHON','Rhondda Cynon Taff');
INSERT INTO `l38sx_tienda_zones` VALUES (3587,222,'RUT','Rutland');
INSERT INTO `l38sx_tienda_zones` VALUES (3588,222,'BOR','Scottish Borders');
INSERT INTO `l38sx_tienda_zones` VALUES (3589,222,'SHET','Shetland Islands');
INSERT INTO `l38sx_tienda_zones` VALUES (3590,222,'SPE','Shropshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3591,222,'SOM','Somerset');
INSERT INTO `l38sx_tienda_zones` VALUES (3592,222,'ARYS','South Ayrshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3593,222,'LANS','South Lanarkshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3594,222,'YSS','South Yorkshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3595,222,'SFD','Staffordshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3596,222,'STIR','Stirling');
INSERT INTO `l38sx_tienda_zones` VALUES (3597,222,'SFK','Suffolk');
INSERT INTO `l38sx_tienda_zones` VALUES (3598,222,'SRY','Surrey');
INSERT INTO `l38sx_tienda_zones` VALUES (3599,222,'SWAN','Swansea');
INSERT INTO `l38sx_tienda_zones` VALUES (3600,222,'TORF','Torfaen');
INSERT INTO `l38sx_tienda_zones` VALUES (3601,222,'TWR','Tyne and Wear');
INSERT INTO `l38sx_tienda_zones` VALUES (3602,222,'VGLAM','Vale of Glamorgan');
INSERT INTO `l38sx_tienda_zones` VALUES (3603,222,'WARKS','Warwickshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3604,222,'WDUN','West Dunbartonshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3605,222,'WLOT','West Lothian');
INSERT INTO `l38sx_tienda_zones` VALUES (3606,222,'WMD','West Midlands');
INSERT INTO `l38sx_tienda_zones` VALUES (3607,222,'SXW','West Sussex');
INSERT INTO `l38sx_tienda_zones` VALUES (3608,222,'YSW','West Yorkshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3609,222,'WIL','Western Isles');
INSERT INTO `l38sx_tienda_zones` VALUES (3610,222,'WLT','Wiltshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3611,222,'WORCS','Worcestershire');
INSERT INTO `l38sx_tienda_zones` VALUES (3612,222,'WRX','Wrexham');
INSERT INTO `l38sx_tienda_zones` VALUES (3613,223,'AL','Alabama');
INSERT INTO `l38sx_tienda_zones` VALUES (3614,223,'AK','Alaska');
INSERT INTO `l38sx_tienda_zones` VALUES (3615,223,'AS','American Samoa');
INSERT INTO `l38sx_tienda_zones` VALUES (3616,223,'AZ','Arizona');
INSERT INTO `l38sx_tienda_zones` VALUES (3617,223,'AR','Arkansas');
INSERT INTO `l38sx_tienda_zones` VALUES (3618,223,'AF','Armed Forces Africa');
INSERT INTO `l38sx_tienda_zones` VALUES (3619,223,'AA','Armed Forces Americas');
INSERT INTO `l38sx_tienda_zones` VALUES (3620,223,'AC','Armed Forces Canada');
INSERT INTO `l38sx_tienda_zones` VALUES (3621,223,'AE','Armed Forces Europe');
INSERT INTO `l38sx_tienda_zones` VALUES (3622,223,'AM','Armed Forces Middle East');
INSERT INTO `l38sx_tienda_zones` VALUES (3623,223,'AP','Armed Forces Pacific');
INSERT INTO `l38sx_tienda_zones` VALUES (3624,223,'CA','California');
INSERT INTO `l38sx_tienda_zones` VALUES (3625,223,'CO','Colorado');
INSERT INTO `l38sx_tienda_zones` VALUES (3626,223,'CT','Connecticut');
INSERT INTO `l38sx_tienda_zones` VALUES (3627,223,'DE','Delaware');
INSERT INTO `l38sx_tienda_zones` VALUES (3628,223,'DC','District of Columbia');
INSERT INTO `l38sx_tienda_zones` VALUES (3629,223,'FM','Federated States Of Micronesia');
INSERT INTO `l38sx_tienda_zones` VALUES (3630,223,'FL','Florida');
INSERT INTO `l38sx_tienda_zones` VALUES (3631,223,'GA','Georgia');
INSERT INTO `l38sx_tienda_zones` VALUES (3632,223,'GU','Guam');
INSERT INTO `l38sx_tienda_zones` VALUES (3633,223,'HI','Hawaii');
INSERT INTO `l38sx_tienda_zones` VALUES (3634,223,'ID','Idaho');
INSERT INTO `l38sx_tienda_zones` VALUES (3635,223,'IL','Illinois');
INSERT INTO `l38sx_tienda_zones` VALUES (3636,223,'IN','Indiana');
INSERT INTO `l38sx_tienda_zones` VALUES (3637,223,'IA','Iowa');
INSERT INTO `l38sx_tienda_zones` VALUES (3638,223,'KS','Kansas');
INSERT INTO `l38sx_tienda_zones` VALUES (3639,223,'KY','Kentucky');
INSERT INTO `l38sx_tienda_zones` VALUES (3640,223,'LA','Louisiana');
INSERT INTO `l38sx_tienda_zones` VALUES (3641,223,'ME','Maine');
INSERT INTO `l38sx_tienda_zones` VALUES (3642,223,'MH','Marshall Islands');
INSERT INTO `l38sx_tienda_zones` VALUES (3643,223,'MD','Maryland');
INSERT INTO `l38sx_tienda_zones` VALUES (3644,223,'MA','Massachusetts');
INSERT INTO `l38sx_tienda_zones` VALUES (3645,223,'MI','Michigan');
INSERT INTO `l38sx_tienda_zones` VALUES (3646,223,'MN','Minnesota');
INSERT INTO `l38sx_tienda_zones` VALUES (3647,223,'MS','Mississippi');
INSERT INTO `l38sx_tienda_zones` VALUES (3648,223,'MO','Missouri');
INSERT INTO `l38sx_tienda_zones` VALUES (3649,223,'MT','Montana');
INSERT INTO `l38sx_tienda_zones` VALUES (3650,223,'NE','Nebraska');
INSERT INTO `l38sx_tienda_zones` VALUES (3651,223,'NV','Nevada');
INSERT INTO `l38sx_tienda_zones` VALUES (3652,223,'NH','New Hampshire');
INSERT INTO `l38sx_tienda_zones` VALUES (3653,223,'NJ','New Jersey');
INSERT INTO `l38sx_tienda_zones` VALUES (3654,223,'NM','New Mexico');
INSERT INTO `l38sx_tienda_zones` VALUES (3655,223,'NY','New York');
INSERT INTO `l38sx_tienda_zones` VALUES (3656,223,'NC','North Carolina');
INSERT INTO `l38sx_tienda_zones` VALUES (3657,223,'ND','North Dakota');
INSERT INTO `l38sx_tienda_zones` VALUES (3658,223,'MP','Northern Mariana Islands');
INSERT INTO `l38sx_tienda_zones` VALUES (3659,223,'OH','Ohio');
INSERT INTO `l38sx_tienda_zones` VALUES (3660,223,'OK','Oklahoma');
INSERT INTO `l38sx_tienda_zones` VALUES (3661,223,'OR','Oregon');
INSERT INTO `l38sx_tienda_zones` VALUES (3662,223,'PW','Palau');
INSERT INTO `l38sx_tienda_zones` VALUES (3663,223,'PA','Pennsylvania');
INSERT INTO `l38sx_tienda_zones` VALUES (3664,223,'PR','Puerto Rico');
INSERT INTO `l38sx_tienda_zones` VALUES (3665,223,'RI','Rhode Island');
INSERT INTO `l38sx_tienda_zones` VALUES (3666,223,'SC','South Carolina');
INSERT INTO `l38sx_tienda_zones` VALUES (3667,223,'SD','South Dakota');
INSERT INTO `l38sx_tienda_zones` VALUES (3668,223,'TN','Tennessee');
INSERT INTO `l38sx_tienda_zones` VALUES (3669,223,'TX','Texas');
INSERT INTO `l38sx_tienda_zones` VALUES (3670,223,'UT','Utah');
INSERT INTO `l38sx_tienda_zones` VALUES (3671,223,'VT','Vermont');
INSERT INTO `l38sx_tienda_zones` VALUES (3672,223,'VI','Virgin Islands');
INSERT INTO `l38sx_tienda_zones` VALUES (3673,223,'VA','Virginia');
INSERT INTO `l38sx_tienda_zones` VALUES (3674,223,'WA','Washington');
INSERT INTO `l38sx_tienda_zones` VALUES (3675,223,'WV','West Virginia');
INSERT INTO `l38sx_tienda_zones` VALUES (3676,223,'WI','Wisconsin');
INSERT INTO `l38sx_tienda_zones` VALUES (3677,223,'WY','Wyoming');
INSERT INTO `l38sx_tienda_zones` VALUES (3678,224,'BI','Baker Island');
INSERT INTO `l38sx_tienda_zones` VALUES (3679,224,'HI','Howland Island');
INSERT INTO `l38sx_tienda_zones` VALUES (3680,224,'JI','Jarvis Island');
INSERT INTO `l38sx_tienda_zones` VALUES (3681,224,'JA','Johnston Atoll');
INSERT INTO `l38sx_tienda_zones` VALUES (3682,224,'KR','Kingman Reef');
INSERT INTO `l38sx_tienda_zones` VALUES (3683,224,'MA','Midway Atoll');
INSERT INTO `l38sx_tienda_zones` VALUES (3684,224,'NI','Navassa Island');
INSERT INTO `l38sx_tienda_zones` VALUES (3685,224,'PA','Palmyra Atoll');
INSERT INTO `l38sx_tienda_zones` VALUES (3686,224,'WI','Wake Island');
INSERT INTO `l38sx_tienda_zones` VALUES (3687,225,'AR','Artigas');
INSERT INTO `l38sx_tienda_zones` VALUES (3688,225,'CA','Canelones');
INSERT INTO `l38sx_tienda_zones` VALUES (3689,225,'CL','Cerro Largo');
INSERT INTO `l38sx_tienda_zones` VALUES (3690,225,'CO','Colonia');
INSERT INTO `l38sx_tienda_zones` VALUES (3691,225,'DU','Durazno');
INSERT INTO `l38sx_tienda_zones` VALUES (3692,225,'FS','Flores');
INSERT INTO `l38sx_tienda_zones` VALUES (3693,225,'FA','Florida');
INSERT INTO `l38sx_tienda_zones` VALUES (3694,225,'LA','Lavalleja');
INSERT INTO `l38sx_tienda_zones` VALUES (3695,225,'MA','Maldonado');
INSERT INTO `l38sx_tienda_zones` VALUES (3696,225,'MO','Montevideo');
INSERT INTO `l38sx_tienda_zones` VALUES (3697,225,'PA','Paysandu');
INSERT INTO `l38sx_tienda_zones` VALUES (3698,225,'RN','Rio Negro');
INSERT INTO `l38sx_tienda_zones` VALUES (3699,225,'RV','Rivera');
INSERT INTO `l38sx_tienda_zones` VALUES (3700,225,'RO','Rocha');
INSERT INTO `l38sx_tienda_zones` VALUES (3701,225,'SL','Salto');
INSERT INTO `l38sx_tienda_zones` VALUES (3702,225,'SJ','San Jose');
INSERT INTO `l38sx_tienda_zones` VALUES (3703,225,'SO','Soriano');
INSERT INTO `l38sx_tienda_zones` VALUES (3704,225,'TA','Tacuarembo');
INSERT INTO `l38sx_tienda_zones` VALUES (3705,225,'TT','Treinta y Tres');
INSERT INTO `l38sx_tienda_zones` VALUES (3706,226,'AN','Andijon');
INSERT INTO `l38sx_tienda_zones` VALUES (3707,226,'BU','Buxoro');
INSERT INTO `l38sx_tienda_zones` VALUES (3708,226,'FA','Farg\'ona');
INSERT INTO `l38sx_tienda_zones` VALUES (3709,226,'JI','Jizzax');
INSERT INTO `l38sx_tienda_zones` VALUES (3710,226,'NG','Namangan');
INSERT INTO `l38sx_tienda_zones` VALUES (3711,226,'NW','Navoiy');
INSERT INTO `l38sx_tienda_zones` VALUES (3712,226,'QA','Qashqadaryo');
INSERT INTO `l38sx_tienda_zones` VALUES (3713,226,'QR','Qoraqalpog\'iston Republikasi');
INSERT INTO `l38sx_tienda_zones` VALUES (3714,226,'SA','Samarqand');
INSERT INTO `l38sx_tienda_zones` VALUES (3715,226,'SI','Sirdaryo');
INSERT INTO `l38sx_tienda_zones` VALUES (3716,226,'SU','Surxondaryo');
INSERT INTO `l38sx_tienda_zones` VALUES (3717,226,'TK','Toshkent City');
INSERT INTO `l38sx_tienda_zones` VALUES (3718,226,'TO','Toshkent Region');
INSERT INTO `l38sx_tienda_zones` VALUES (3719,226,'XO','Xorazm');
INSERT INTO `l38sx_tienda_zones` VALUES (3720,227,'MA','Malampa');
INSERT INTO `l38sx_tienda_zones` VALUES (3721,227,'PE','Penama');
INSERT INTO `l38sx_tienda_zones` VALUES (3722,227,'SA','Sanma');
INSERT INTO `l38sx_tienda_zones` VALUES (3723,227,'SH','Shefa');
INSERT INTO `l38sx_tienda_zones` VALUES (3724,227,'TA','Tafea');
INSERT INTO `l38sx_tienda_zones` VALUES (3725,227,'TO','Torba');
INSERT INTO `l38sx_tienda_zones` VALUES (3726,229,'AM','Amazonas');
INSERT INTO `l38sx_tienda_zones` VALUES (3727,229,'AN','Anzoategui');
INSERT INTO `l38sx_tienda_zones` VALUES (3728,229,'AP','Apure');
INSERT INTO `l38sx_tienda_zones` VALUES (3729,229,'AR','Aragua');
INSERT INTO `l38sx_tienda_zones` VALUES (3730,229,'BA','Barinas');
INSERT INTO `l38sx_tienda_zones` VALUES (3731,229,'BO','Bolivar');
INSERT INTO `l38sx_tienda_zones` VALUES (3732,229,'CA','Carabobo');
INSERT INTO `l38sx_tienda_zones` VALUES (3733,229,'CO','Cojedes');
INSERT INTO `l38sx_tienda_zones` VALUES (3734,229,'DA','Delta Amacuro');
INSERT INTO `l38sx_tienda_zones` VALUES (3735,229,'DF','Dependencias Federales');
INSERT INTO `l38sx_tienda_zones` VALUES (3736,229,'DI','Distrito Federal');
INSERT INTO `l38sx_tienda_zones` VALUES (3737,229,'FA','Falcon');
INSERT INTO `l38sx_tienda_zones` VALUES (3738,229,'GU','Guarico');
INSERT INTO `l38sx_tienda_zones` VALUES (3739,229,'LA','Lara');
INSERT INTO `l38sx_tienda_zones` VALUES (3740,229,'ME','Merida');
INSERT INTO `l38sx_tienda_zones` VALUES (3741,229,'MI','Miranda');
INSERT INTO `l38sx_tienda_zones` VALUES (3742,229,'MO','Monagas');
INSERT INTO `l38sx_tienda_zones` VALUES (3743,229,'NE','Nueva Esparta');
INSERT INTO `l38sx_tienda_zones` VALUES (3744,229,'PO','Portuguesa');
INSERT INTO `l38sx_tienda_zones` VALUES (3745,229,'SU','Sucre');
INSERT INTO `l38sx_tienda_zones` VALUES (3746,229,'TA','Tachira');
INSERT INTO `l38sx_tienda_zones` VALUES (3747,229,'TR','Trujillo');
INSERT INTO `l38sx_tienda_zones` VALUES (3748,229,'VA','Vargas');
INSERT INTO `l38sx_tienda_zones` VALUES (3749,229,'YA','Yaracuy');
INSERT INTO `l38sx_tienda_zones` VALUES (3750,229,'ZU','Zulia');
INSERT INTO `l38sx_tienda_zones` VALUES (3751,230,'AG','An Giang');
INSERT INTO `l38sx_tienda_zones` VALUES (3752,230,'BG','Bac Giang');
INSERT INTO `l38sx_tienda_zones` VALUES (3753,230,'BK','Bac Kan');
INSERT INTO `l38sx_tienda_zones` VALUES (3754,230,'BL','Bac Lieu');
INSERT INTO `l38sx_tienda_zones` VALUES (3755,230,'BC','Bac Ninh');
INSERT INTO `l38sx_tienda_zones` VALUES (3756,230,'BR','Ba Ria-Vung Tau');
INSERT INTO `l38sx_tienda_zones` VALUES (3757,230,'BN','Ben Tre');
INSERT INTO `l38sx_tienda_zones` VALUES (3758,230,'BH','Binh Dinh');
INSERT INTO `l38sx_tienda_zones` VALUES (3759,230,'BU','Binh Duong');
INSERT INTO `l38sx_tienda_zones` VALUES (3760,230,'BP','Binh Phuoc');
INSERT INTO `l38sx_tienda_zones` VALUES (3761,230,'BT','Binh Thuan');
INSERT INTO `l38sx_tienda_zones` VALUES (3762,230,'CM','Ca Mau');
INSERT INTO `l38sx_tienda_zones` VALUES (3763,230,'CT','Can Tho');
INSERT INTO `l38sx_tienda_zones` VALUES (3764,230,'CB','Cao Bang');
INSERT INTO `l38sx_tienda_zones` VALUES (3765,230,'DL','Dak Lak');
INSERT INTO `l38sx_tienda_zones` VALUES (3766,230,'DG','Dak Nong');
INSERT INTO `l38sx_tienda_zones` VALUES (3767,230,'DN','Da Nang');
INSERT INTO `l38sx_tienda_zones` VALUES (3768,230,'DB','Dien Bien');
INSERT INTO `l38sx_tienda_zones` VALUES (3769,230,'DI','Dong Nai');
INSERT INTO `l38sx_tienda_zones` VALUES (3770,230,'DT','Dong Thap');
INSERT INTO `l38sx_tienda_zones` VALUES (3771,230,'GL','Gia Lai');
INSERT INTO `l38sx_tienda_zones` VALUES (3772,230,'HG','Ha Giang');
INSERT INTO `l38sx_tienda_zones` VALUES (3773,230,'HD','Hai Duong');
INSERT INTO `l38sx_tienda_zones` VALUES (3774,230,'HP','Hai Phong');
INSERT INTO `l38sx_tienda_zones` VALUES (3775,230,'HM','Ha Nam');
INSERT INTO `l38sx_tienda_zones` VALUES (3776,230,'HI','Ha Noi');
INSERT INTO `l38sx_tienda_zones` VALUES (3777,230,'HT','Ha Tay');
INSERT INTO `l38sx_tienda_zones` VALUES (3778,230,'HH','Ha Tinh');
INSERT INTO `l38sx_tienda_zones` VALUES (3779,230,'HB','Hoa Binh');
INSERT INTO `l38sx_tienda_zones` VALUES (3780,230,'HC','Ho Chi Minh City');
INSERT INTO `l38sx_tienda_zones` VALUES (3781,230,'HU','Hau Giang');
INSERT INTO `l38sx_tienda_zones` VALUES (3782,230,'HY','Hung Yen');
INSERT INTO `l38sx_tienda_zones` VALUES (3783,232,'C','Saint Croix');
INSERT INTO `l38sx_tienda_zones` VALUES (3784,232,'J','Saint John');
INSERT INTO `l38sx_tienda_zones` VALUES (3785,232,'T','Saint Thomas');
INSERT INTO `l38sx_tienda_zones` VALUES (3786,233,'A','Alo');
INSERT INTO `l38sx_tienda_zones` VALUES (3787,233,'S','Sigave');
INSERT INTO `l38sx_tienda_zones` VALUES (3788,233,'W','Wallis');
INSERT INTO `l38sx_tienda_zones` VALUES (3789,235,'AB','Abyan');
INSERT INTO `l38sx_tienda_zones` VALUES (3790,235,'AD','Adan');
INSERT INTO `l38sx_tienda_zones` VALUES (3791,235,'AM','Amran');
INSERT INTO `l38sx_tienda_zones` VALUES (3792,235,'BA','Al Bayda');
INSERT INTO `l38sx_tienda_zones` VALUES (3793,235,'DA','Ad Dali');
INSERT INTO `l38sx_tienda_zones` VALUES (3794,235,'DH','Dhamar');
INSERT INTO `l38sx_tienda_zones` VALUES (3795,235,'HD','Hadramawt');
INSERT INTO `l38sx_tienda_zones` VALUES (3796,235,'HJ','Hajjah');
INSERT INTO `l38sx_tienda_zones` VALUES (3797,235,'HU','Al Hudaydah');
INSERT INTO `l38sx_tienda_zones` VALUES (3798,235,'IB','Ibb');
INSERT INTO `l38sx_tienda_zones` VALUES (3799,235,'JA','Al Jawf');
INSERT INTO `l38sx_tienda_zones` VALUES (3800,235,'LA','Lahij');
INSERT INTO `l38sx_tienda_zones` VALUES (3801,235,'MA','Ma\'rib');
INSERT INTO `l38sx_tienda_zones` VALUES (3802,235,'MR','Al Mahrah');
INSERT INTO `l38sx_tienda_zones` VALUES (3803,235,'MW','Al Mahwit');
INSERT INTO `l38sx_tienda_zones` VALUES (3804,235,'SD','Sa\'dah');
INSERT INTO `l38sx_tienda_zones` VALUES (3805,235,'SN','San\'a');
INSERT INTO `l38sx_tienda_zones` VALUES (3806,235,'SH','Shabwah');
INSERT INTO `l38sx_tienda_zones` VALUES (3807,235,'TA','Ta\'izz');
INSERT INTO `l38sx_tienda_zones` VALUES (3812,237,'BC','Bas-Congo');
INSERT INTO `l38sx_tienda_zones` VALUES (3813,237,'BN','Bandundu');
INSERT INTO `l38sx_tienda_zones` VALUES (3814,237,'EQ','Equateur');
INSERT INTO `l38sx_tienda_zones` VALUES (3815,237,'KA','Katanga');
INSERT INTO `l38sx_tienda_zones` VALUES (3816,237,'KE','Kasai-Oriental');
INSERT INTO `l38sx_tienda_zones` VALUES (3817,237,'KN','Kinshasa');
INSERT INTO `l38sx_tienda_zones` VALUES (3818,237,'KW','Kasai-Occidental');
INSERT INTO `l38sx_tienda_zones` VALUES (3819,237,'MA','Maniema');
INSERT INTO `l38sx_tienda_zones` VALUES (3820,237,'NK','Nord-Kivu');
INSERT INTO `l38sx_tienda_zones` VALUES (3821,237,'OR','Orientale');
INSERT INTO `l38sx_tienda_zones` VALUES (3822,237,'SK','Sud-Kivu');
INSERT INTO `l38sx_tienda_zones` VALUES (3823,238,'CE','Central');
INSERT INTO `l38sx_tienda_zones` VALUES (3824,238,'CB','Copperbelt');
INSERT INTO `l38sx_tienda_zones` VALUES (3825,238,'EA','Eastern');
INSERT INTO `l38sx_tienda_zones` VALUES (3826,238,'LP','Luapula');
INSERT INTO `l38sx_tienda_zones` VALUES (3827,238,'LK','Lusaka');
INSERT INTO `l38sx_tienda_zones` VALUES (3828,238,'NO','Northern');
INSERT INTO `l38sx_tienda_zones` VALUES (3829,238,'NW','North-Western');
INSERT INTO `l38sx_tienda_zones` VALUES (3830,238,'SO','Southern');
INSERT INTO `l38sx_tienda_zones` VALUES (3831,238,'WE','Western');
INSERT INTO `l38sx_tienda_zones` VALUES (3832,239,'BU','Bulawayo');
INSERT INTO `l38sx_tienda_zones` VALUES (3833,239,'HA','Harare');
INSERT INTO `l38sx_tienda_zones` VALUES (3834,239,'ML','Manicaland');
INSERT INTO `l38sx_tienda_zones` VALUES (3835,239,'MC','Mashonaland Central');
INSERT INTO `l38sx_tienda_zones` VALUES (3836,239,'ME','Mashonaland East');
INSERT INTO `l38sx_tienda_zones` VALUES (3837,239,'MW','Mashonaland West');
INSERT INTO `l38sx_tienda_zones` VALUES (3838,239,'MV','Masvingo');
INSERT INTO `l38sx_tienda_zones` VALUES (3839,239,'MN','Matabeleland North');
INSERT INTO `l38sx_tienda_zones` VALUES (3840,239,'MS','Matabeleland South');
INSERT INTO `l38sx_tienda_zones` VALUES (3841,239,'MD','Midlands');
INSERT INTO `l38sx_tienda_zones` VALUES (3842,105,'AG','Agrigento');
INSERT INTO `l38sx_tienda_zones` VALUES (3843,105,'AL','Alessandria');
INSERT INTO `l38sx_tienda_zones` VALUES (3844,105,'AN','Ancona');
INSERT INTO `l38sx_tienda_zones` VALUES (3845,105,'AO','Aosta');
INSERT INTO `l38sx_tienda_zones` VALUES (3846,105,'AR','Arezzo');
INSERT INTO `l38sx_tienda_zones` VALUES (3847,105,'AP','Ascoli Piceno');
INSERT INTO `l38sx_tienda_zones` VALUES (3848,105,'AT','Asti');
INSERT INTO `l38sx_tienda_zones` VALUES (3849,105,'AV','Avellino');
INSERT INTO `l38sx_tienda_zones` VALUES (3850,105,'BA','Bari');
INSERT INTO `l38sx_tienda_zones` VALUES (3851,105,'BT','Barletta-Andria-Trani');
INSERT INTO `l38sx_tienda_zones` VALUES (3852,105,'BL','Belluno');
INSERT INTO `l38sx_tienda_zones` VALUES (3853,105,'BN','Benevento');
INSERT INTO `l38sx_tienda_zones` VALUES (3854,105,'BG','Bergamo');
INSERT INTO `l38sx_tienda_zones` VALUES (3855,105,'BI','Biella');
INSERT INTO `l38sx_tienda_zones` VALUES (3856,105,'BO','Bologna');
INSERT INTO `l38sx_tienda_zones` VALUES (3857,105,'BZ','Bolzano');
INSERT INTO `l38sx_tienda_zones` VALUES (3858,105,'BS','Brescia');
INSERT INTO `l38sx_tienda_zones` VALUES (3859,105,'BR','Brindisi');
INSERT INTO `l38sx_tienda_zones` VALUES (3860,105,'CA','Cagliari');
INSERT INTO `l38sx_tienda_zones` VALUES (3861,105,'CL','Caltanissetta');
INSERT INTO `l38sx_tienda_zones` VALUES (3862,105,'CB','Campobasso');
INSERT INTO `l38sx_tienda_zones` VALUES (3863,105,'CI','Carbonia-Iglesias');
INSERT INTO `l38sx_tienda_zones` VALUES (3864,105,'CE','Caserta');
INSERT INTO `l38sx_tienda_zones` VALUES (3865,105,'CT','Catania');
INSERT INTO `l38sx_tienda_zones` VALUES (3866,105,'CZ','Catanzaro');
INSERT INTO `l38sx_tienda_zones` VALUES (3867,105,'CH','Chieti');
INSERT INTO `l38sx_tienda_zones` VALUES (3868,105,'CO','Como');
INSERT INTO `l38sx_tienda_zones` VALUES (3869,105,'CS','Cosenza');
INSERT INTO `l38sx_tienda_zones` VALUES (3870,105,'CR','Cremona');
INSERT INTO `l38sx_tienda_zones` VALUES (3871,105,'KR','Crotone');
INSERT INTO `l38sx_tienda_zones` VALUES (3872,105,'CN','Cuneo');
INSERT INTO `l38sx_tienda_zones` VALUES (3873,105,'EN','Enna');
INSERT INTO `l38sx_tienda_zones` VALUES (3874,105,'FM','Fermo');
INSERT INTO `l38sx_tienda_zones` VALUES (3875,105,'FE','Ferrara');
INSERT INTO `l38sx_tienda_zones` VALUES (3876,105,'FI','Firenze');
INSERT INTO `l38sx_tienda_zones` VALUES (3877,105,'FG','Foggia');
INSERT INTO `l38sx_tienda_zones` VALUES (3878,105,'FC','Forl');
INSERT INTO `l38sx_tienda_zones` VALUES (3879,105,'FR','Frosinone');
INSERT INTO `l38sx_tienda_zones` VALUES (3880,105,'GE','Genova');
INSERT INTO `l38sx_tienda_zones` VALUES (3881,105,'GO','Gorizia');
INSERT INTO `l38sx_tienda_zones` VALUES (3882,105,'GR','Grosseto');
INSERT INTO `l38sx_tienda_zones` VALUES (3883,105,'IM','Imperia');
INSERT INTO `l38sx_tienda_zones` VALUES (3884,105,'IS','Isernia');
INSERT INTO `l38sx_tienda_zones` VALUES (3885,105,'SP','La Spezia');
INSERT INTO `l38sx_tienda_zones` VALUES (3886,105,'AQ','L\'Aquila');
INSERT INTO `l38sx_tienda_zones` VALUES (3887,105,'LT','Latina');
INSERT INTO `l38sx_tienda_zones` VALUES (3888,105,'LE','Lecce');
INSERT INTO `l38sx_tienda_zones` VALUES (3889,105,'LC','Lecco');
INSERT INTO `l38sx_tienda_zones` VALUES (3890,105,'LI','Livorno');
INSERT INTO `l38sx_tienda_zones` VALUES (3891,105,'LO','Lodi');
INSERT INTO `l38sx_tienda_zones` VALUES (3892,105,'LU','Lucca');
INSERT INTO `l38sx_tienda_zones` VALUES (3893,105,'MC','Macerata');
INSERT INTO `l38sx_tienda_zones` VALUES (3894,105,'MN','Mantova');
INSERT INTO `l38sx_tienda_zones` VALUES (3895,105,'MS','Massa-Carrara');
INSERT INTO `l38sx_tienda_zones` VALUES (3896,105,'MT','Matera');
INSERT INTO `l38sx_tienda_zones` VALUES (3897,105,'ME','Messina');
INSERT INTO `l38sx_tienda_zones` VALUES (3898,105,'MI','Milano');
INSERT INTO `l38sx_tienda_zones` VALUES (3899,105,'MO','Modena');
INSERT INTO `l38sx_tienda_zones` VALUES (3900,105,'MB','Monza e della Brianza');
INSERT INTO `l38sx_tienda_zones` VALUES (3901,105,'NA','Napoli');
INSERT INTO `l38sx_tienda_zones` VALUES (3902,105,'NO','Novara');
INSERT INTO `l38sx_tienda_zones` VALUES (3903,105,'NU','Nuoro');
INSERT INTO `l38sx_tienda_zones` VALUES (3904,105,'OT','Olbia-Tempio');
INSERT INTO `l38sx_tienda_zones` VALUES (3905,105,'OR','Oristano');
INSERT INTO `l38sx_tienda_zones` VALUES (3906,105,'PD','Padova');
INSERT INTO `l38sx_tienda_zones` VALUES (3907,105,'PA','Palermo');
INSERT INTO `l38sx_tienda_zones` VALUES (3908,105,'PR','Parma');
INSERT INTO `l38sx_tienda_zones` VALUES (3909,105,'PV','Pavia');
INSERT INTO `l38sx_tienda_zones` VALUES (3910,105,'PG','Perugia');
INSERT INTO `l38sx_tienda_zones` VALUES (3911,105,'PU','Pesaro e Urbino');
INSERT INTO `l38sx_tienda_zones` VALUES (3912,105,'PE','Pescara');
INSERT INTO `l38sx_tienda_zones` VALUES (3913,105,'PC','Piacenza');
INSERT INTO `l38sx_tienda_zones` VALUES (3914,105,'PI','Pisa');
INSERT INTO `l38sx_tienda_zones` VALUES (3915,105,'PT','Pistoia');
INSERT INTO `l38sx_tienda_zones` VALUES (3916,105,'PN','Pordenone');
INSERT INTO `l38sx_tienda_zones` VALUES (3917,105,'PZ','Potenza');
INSERT INTO `l38sx_tienda_zones` VALUES (3918,105,'PO','Prato');
INSERT INTO `l38sx_tienda_zones` VALUES (3919,105,'RG','Ragusa');
INSERT INTO `l38sx_tienda_zones` VALUES (3920,105,'RA','Ravenna');
INSERT INTO `l38sx_tienda_zones` VALUES (3921,105,'RC','Reggio Calabria');
INSERT INTO `l38sx_tienda_zones` VALUES (3922,105,'RE','Reggio Emilia');
INSERT INTO `l38sx_tienda_zones` VALUES (3923,105,'RI','Rieti');
INSERT INTO `l38sx_tienda_zones` VALUES (3924,105,'RN','Rimini');
INSERT INTO `l38sx_tienda_zones` VALUES (3925,105,'RM','Roma');
INSERT INTO `l38sx_tienda_zones` VALUES (3926,105,'RO','Rovigo');
INSERT INTO `l38sx_tienda_zones` VALUES (3927,105,'SA','Salerno');
INSERT INTO `l38sx_tienda_zones` VALUES (3928,105,'VS','Medio Campidano');
INSERT INTO `l38sx_tienda_zones` VALUES (3929,105,'SS','Sassari');
INSERT INTO `l38sx_tienda_zones` VALUES (3930,105,'SV','Savona');
INSERT INTO `l38sx_tienda_zones` VALUES (3931,105,'SI','Siena');
INSERT INTO `l38sx_tienda_zones` VALUES (3932,105,'SR','Siracusa');
INSERT INTO `l38sx_tienda_zones` VALUES (3933,105,'SO','Sondrio');
INSERT INTO `l38sx_tienda_zones` VALUES (3934,105,'TA','Taranto');
INSERT INTO `l38sx_tienda_zones` VALUES (3935,105,'TE','Teramo');
INSERT INTO `l38sx_tienda_zones` VALUES (3936,105,'TR','Terni');
INSERT INTO `l38sx_tienda_zones` VALUES (3937,105,'TO','Torino');
INSERT INTO `l38sx_tienda_zones` VALUES (3938,105,'OG','Ogliastra');
INSERT INTO `l38sx_tienda_zones` VALUES (3939,105,'TP','Trapani');
INSERT INTO `l38sx_tienda_zones` VALUES (3940,105,'TN','Trento');
INSERT INTO `l38sx_tienda_zones` VALUES (3941,105,'TV','Treviso');
INSERT INTO `l38sx_tienda_zones` VALUES (3942,105,'TS','Trieste');
INSERT INTO `l38sx_tienda_zones` VALUES (3943,105,'UD','Udine');
INSERT INTO `l38sx_tienda_zones` VALUES (3944,105,'VA','Varese');
INSERT INTO `l38sx_tienda_zones` VALUES (3945,105,'VE','Venezia');
INSERT INTO `l38sx_tienda_zones` VALUES (3946,105,'VB','Verbano-Cusio-Ossola');
INSERT INTO `l38sx_tienda_zones` VALUES (3947,105,'VC','Vercelli');
INSERT INTO `l38sx_tienda_zones` VALUES (3948,105,'VR','Verona');
INSERT INTO `l38sx_tienda_zones` VALUES (3949,105,'VV','Vibo Valentia');
INSERT INTO `l38sx_tienda_zones` VALUES (3950,105,'VI','Vicenza');
INSERT INTO `l38sx_tienda_zones` VALUES (3951,105,'VT','Viterbo');
INSERT INTO `l38sx_tienda_zones` VALUES (3952,240,'VO','Vojvodina');
INSERT INTO `l38sx_tienda_zones` VALUES (3953,240,'BG','Beograd');
INSERT INTO `l38sx_tienda_zones` VALUES (3954,240,'ZA','Šumadija i Zapadna Srbija');
INSERT INTO `l38sx_tienda_zones` VALUES (3955,240,'JI','Južna i Istočna Srbija');
INSERT INTO `l38sx_tienda_zones` VALUES (3956,240,'KM','Kosovo i Metohija');
INSERT INTO `l38sx_tienda_zones` VALUES (3957,241,'AN','Andrijevica');
INSERT INTO `l38sx_tienda_zones` VALUES (3958,241,'BA','Berane');
INSERT INTO `l38sx_tienda_zones` VALUES (3959,241,'BD','Budva');
INSERT INTO `l38sx_tienda_zones` VALUES (3960,241,'BP','Bijelo Polje');
INSERT INTO `l38sx_tienda_zones` VALUES (3961,241,'BR','Bar');
INSERT INTO `l38sx_tienda_zones` VALUES (3962,241,'CT','Cetinje');
INSERT INTO `l38sx_tienda_zones` VALUES (3963,241,'DG','Danilovgrad');
INSERT INTO `l38sx_tienda_zones` VALUES (3964,241,'HN','Herceg Novi');
INSERT INTO `l38sx_tienda_zones` VALUES (3965,241,'KL','Kolašin');
INSERT INTO `l38sx_tienda_zones` VALUES (3966,241,'KO','Kotor');
INSERT INTO `l38sx_tienda_zones` VALUES (3967,241,'MK','Mojkovac');
INSERT INTO `l38sx_tienda_zones` VALUES (3968,241,'NK','Nikšić');
INSERT INTO `l38sx_tienda_zones` VALUES (3969,241,'PG','Podgorica');
INSERT INTO `l38sx_tienda_zones` VALUES (3970,241,'PL','Plav');
INSERT INTO `l38sx_tienda_zones` VALUES (3971,241,'PŽ','Plužine');
INSERT INTO `l38sx_tienda_zones` VALUES (3972,241,'PV','Pljevlja');
INSERT INTO `l38sx_tienda_zones` VALUES (3973,241,'RO','Rožaje');
INSERT INTO `l38sx_tienda_zones` VALUES (3974,241,'ŠN','Šavnik');
INSERT INTO `l38sx_tienda_zones` VALUES (3975,241,'TV','Tivat');
INSERT INTO `l38sx_tienda_zones` VALUES (3976,241,'UL','Ulcinj');
INSERT INTO `l38sx_tienda_zones` VALUES (3977,241,'ŽB','Žabljak');
INSERT INTO `l38sx_tienda_zones` VALUES (3978,138,'AG','Aguascalientes');
INSERT INTO `l38sx_tienda_zones` VALUES (3979,83,'83','Gibraltar');
INSERT INTO `l38sx_tienda_zones` VALUES (3980,188,'188','Singapore');
INSERT INTO `l38sx_tienda_zones` VALUES (3981,190,'190','Slovenia');
INSERT INTO `l38sx_tienda_zones` VALUES (9999,9999,'!!','Dummy Zone');
/*!40000 ALTER TABLE `l38sx_tienda_zones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_update_categories`
--

DROP TABLE IF EXISTS `l38sx_update_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_update_categories` (
  `categoryid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT '',
  `description` text NOT NULL,
  `parent` int(11) DEFAULT '0',
  `updatesite` int(11) DEFAULT '0',
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Update Categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_update_categories`
--

LOCK TABLES `l38sx_update_categories` WRITE;
/*!40000 ALTER TABLE `l38sx_update_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_update_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_update_sites`
--

DROP TABLE IF EXISTS `l38sx_update_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Update Sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_update_sites`
--

LOCK TABLES `l38sx_update_sites` WRITE;
/*!40000 ALTER TABLE `l38sx_update_sites` DISABLE KEYS */;
INSERT INTO `l38sx_update_sites` VALUES (1,'Joomla Core','collection','http://update.joomla.org/core/list.xml',1,1351269075);
INSERT INTO `l38sx_update_sites` VALUES (2,'Joomla Extension Directory','collection','http://update.joomla.org/jed/list.xml',1,1351269075);
INSERT INTO `l38sx_update_sites` VALUES (3,'Accredited Joomla! Translations','collection','http://update.joomla.org/language/translationlist.xml',1,1351269075);
INSERT INTO `l38sx_update_sites` VALUES (4,'Dioscouri System Plugin Updates','extension','http://updates.dioscouri.com/plg_system_dioscouri/updates.xml',1,1351269075);
INSERT INTO `l38sx_update_sites` VALUES (5,'Dioscouri Library Updates','extension','http://updates.dioscouri.com/library/updates.xml',1,1351269075);
INSERT INTO `l38sx_update_sites` VALUES (6,'Extension Update Site','collection','http://updates.rockettheme.com/joomla16/updates.xml',1,1351269075);
/*!40000 ALTER TABLE `l38sx_update_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_update_sites_extensions`
--

DROP TABLE IF EXISTS `l38sx_update_sites_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_update_sites_extensions`
--

LOCK TABLES `l38sx_update_sites_extensions` WRITE;
/*!40000 ALTER TABLE `l38sx_update_sites_extensions` DISABLE KEYS */;
INSERT INTO `l38sx_update_sites_extensions` VALUES (1,700);
INSERT INTO `l38sx_update_sites_extensions` VALUES (2,700);
INSERT INTO `l38sx_update_sites_extensions` VALUES (3,600);
INSERT INTO `l38sx_update_sites_extensions` VALUES (4,10000);
INSERT INTO `l38sx_update_sites_extensions` VALUES (5,10001);
INSERT INTO `l38sx_update_sites_extensions` VALUES (6,10060);
/*!40000 ALTER TABLE `l38sx_update_sites_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_updates`
--

DROP TABLE IF EXISTS `l38sx_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `categoryid` int(11) DEFAULT '0',
  `name` varchar(100) DEFAULT '',
  `description` text NOT NULL,
  `element` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `folder` varchar(20) DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(10) DEFAULT '',
  `data` text NOT NULL,
  `detailsurl` text NOT NULL,
  `infourl` text NOT NULL,
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='Available Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_updates`
--

LOCK TABLES `l38sx_updates` WRITE;
/*!40000 ALTER TABLE `l38sx_updates` DISABLE KEYS */;
INSERT INTO `l38sx_updates` VALUES (1,3,0,0,'Danish','','pkg_da-DK','package','',0,'2.5.7.3','','http://update.joomla.org/language/details/da-DK_details.xml','');
INSERT INTO `l38sx_updates` VALUES (2,3,0,0,'Khmer','','pkg_km-KH','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/km-KH_details.xml','');
INSERT INTO `l38sx_updates` VALUES (3,3,0,0,'Swedish','','pkg_sv-SE','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/sv-SE_details.xml','');
INSERT INTO `l38sx_updates` VALUES (4,3,0,0,'Hungarian','','pkg_hu-HU','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/hu-HU_details.xml','');
INSERT INTO `l38sx_updates` VALUES (5,3,0,0,'Bulgarian','','pkg_bg-BG','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/bg-BG_details.xml','');
INSERT INTO `l38sx_updates` VALUES (6,3,0,0,'French','','pkg_fr-FR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/fr-FR_details.xml','');
INSERT INTO `l38sx_updates` VALUES (7,3,0,0,'Italian','','pkg_it-IT','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/it-IT_details.xml','');
INSERT INTO `l38sx_updates` VALUES (8,3,0,0,'Spanish','','pkg_es-ES','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/es-ES_details.xml','');
INSERT INTO `l38sx_updates` VALUES (9,3,0,0,'Dutch','','pkg_nl-NL','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/nl-NL_details.xml','');
INSERT INTO `l38sx_updates` VALUES (10,3,0,0,'Turkish','','pkg_tr-TR','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/tr-TR_details.xml','');
INSERT INTO `l38sx_updates` VALUES (11,3,0,0,'Ukrainian','','pkg_uk-UA','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/uk-UA_details.xml','');
INSERT INTO `l38sx_updates` VALUES (12,3,0,0,'Slovak','','pkg_sk-SK','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/sk-SK_details.xml','');
INSERT INTO `l38sx_updates` VALUES (13,3,0,0,'Belarusian','','pkg_be-BY','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/be-BY_details.xml','');
INSERT INTO `l38sx_updates` VALUES (14,3,0,0,'Latvian','','pkg_lv-LV','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/lv-LV_details.xml','');
INSERT INTO `l38sx_updates` VALUES (15,3,0,0,'Estonian','','pkg_et-EE','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/et-EE_details.xml','');
INSERT INTO `l38sx_updates` VALUES (16,3,0,0,'Romanian','','pkg_ro-RO','package','',0,'2.5.5.1','','http://update.joomla.org/language/details/ro-RO_details.xml','');
INSERT INTO `l38sx_updates` VALUES (17,3,0,0,'Flemish','','pkg_nl-BE','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/nl-BE_details.xml','');
INSERT INTO `l38sx_updates` VALUES (18,3,0,0,'Macedonian','','pkg_mk-MK','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/mk-MK_details.xml','');
INSERT INTO `l38sx_updates` VALUES (19,3,0,0,'Japanese','','pkg_ja-JP','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/ja-JP_details.xml','');
INSERT INTO `l38sx_updates` VALUES (20,3,0,0,'Serbian Latin','','pkg_sr-YU','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/sr-YU_details.xml','');
INSERT INTO `l38sx_updates` VALUES (21,3,0,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/ar-AA_details.xml','');
INSERT INTO `l38sx_updates` VALUES (22,3,0,0,'German','','pkg_de-DE','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/de-DE_details.xml','');
INSERT INTO `l38sx_updates` VALUES (23,3,0,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/nb-NO_details.xml','');
INSERT INTO `l38sx_updates` VALUES (24,3,0,0,'English AU','','pkg_en-AU','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/en-AU_details.xml','');
INSERT INTO `l38sx_updates` VALUES (25,3,0,0,'English US','','pkg_en-US','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/en-US_details.xml','');
INSERT INTO `l38sx_updates` VALUES (26,3,0,0,'Serbian Cyrillic','','pkg_sr-RS','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/sr-RS_details.xml','');
INSERT INTO `l38sx_updates` VALUES (27,3,0,0,'Lithuanian','','pkg_lt-LT','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/lt-LT_details.xml','');
INSERT INTO `l38sx_updates` VALUES (28,3,0,0,'Albanian','','pkg_sq-AL','package','',0,'2.5.1.5','','http://update.joomla.org/language/details/sq-AL_details.xml','');
INSERT INTO `l38sx_updates` VALUES (29,3,0,0,'Persian','','pkg_fa-IR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/fa-IR_details.xml','');
INSERT INTO `l38sx_updates` VALUES (30,3,0,0,'Galician','','pkg_gl-ES','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/gl-ES_details.xml','');
INSERT INTO `l38sx_updates` VALUES (31,3,0,0,'Polish','','pkg_pl-PL','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/pl-PL_details.xml','');
INSERT INTO `l38sx_updates` VALUES (32,3,0,0,'Syriac','','pkg_sy-IQ','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/sy-IQ_details.xml','');
INSERT INTO `l38sx_updates` VALUES (33,3,0,0,'Russian','','pkg_ru-RU','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/ru-RU_details.xml','');
INSERT INTO `l38sx_updates` VALUES (34,3,0,0,'Hebrew','','pkg_he-IL','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/he-IL_details.xml','');
INSERT INTO `l38sx_updates` VALUES (35,3,0,0,'Laotian','','pkg_lo-LA','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/lo-LA_details.xml','');
INSERT INTO `l38sx_updates` VALUES (36,3,0,0,'Afrikaans','','pkg_af-ZA','package','',0,'2.5.6.2','','http://update.joomla.org/language/details/af-ZA_details.xml','');
INSERT INTO `l38sx_updates` VALUES (37,3,0,0,'Chinese Simplified','','pkg_zh-CN','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/zh-CN_details.xml','');
INSERT INTO `l38sx_updates` VALUES (38,3,0,0,'Greek','','pkg_el-GR','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/el-GR_details.xml','');
INSERT INTO `l38sx_updates` VALUES (39,3,0,0,'Esperanto','','pkg_eo-XX','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/eo-XX_details.xml','');
INSERT INTO `l38sx_updates` VALUES (40,3,0,0,'Finnish','','pkg_fi-FI','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/fi-FI_details.xml','');
INSERT INTO `l38sx_updates` VALUES (41,3,0,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/pt-BR_details.xml','');
INSERT INTO `l38sx_updates` VALUES (42,3,0,0,'Chinese Traditional','','pkg_zh-TW','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/zh-TW_details.xml','');
INSERT INTO `l38sx_updates` VALUES (43,3,0,0,'Vietnamese','','pkg_vi-VN','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/vi-VN_details.xml','');
INSERT INTO `l38sx_updates` VALUES (44,3,0,0,'Kurdish Sorani','','pkg_ckb-IQ','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/ckb-IQ_details.xml','');
INSERT INTO `l38sx_updates` VALUES (45,3,0,0,'Bosnian','','pkg_bs-BA','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/bs-BA_details.xml','');
INSERT INTO `l38sx_updates` VALUES (46,3,0,0,'Croatian','','pkg_hr-HR','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/hr-HR_details.xml','');
INSERT INTO `l38sx_updates` VALUES (47,3,0,0,'Azeri','','pkg_az-AZ','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/az-AZ_details.xml','');
INSERT INTO `l38sx_updates` VALUES (48,3,0,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/nn-NO_details.xml','');
INSERT INTO `l38sx_updates` VALUES (49,3,0,0,'Tamil India','','pkg_ta-IN','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/ta-IN_details.xml','');
INSERT INTO `l38sx_updates` VALUES (50,3,0,0,'Scottish Gaelic','','pkg_gd-GB','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/gd-GB_details.xml','');
INSERT INTO `l38sx_updates` VALUES (51,3,0,0,'Thai','','pkg_th-TH','package','',0,'2.5.7.1','','http://update.joomla.org/language/details/th-TH_details.xml','');
INSERT INTO `l38sx_updates` VALUES (52,3,0,0,'Basque','','pkg_eu-ES','package','',0,'1.7.0.1','','http://update.joomla.org/language/details/eu-ES_details.xml','');
INSERT INTO `l38sx_updates` VALUES (53,3,0,0,'Uyghur','','pkg_ug-CN','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/ug-CN_details.xml','');
INSERT INTO `l38sx_updates` VALUES (54,3,0,0,'Korean','','pkg_ko-KR','package','',0,'2.5.7.2','','http://update.joomla.org/language/details/ko-KR_details.xml','');
INSERT INTO `l38sx_updates` VALUES (55,3,0,0,'Hindi','','pkg_hi-IN','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/hi-IN_details.xml','');
INSERT INTO `l38sx_updates` VALUES (56,3,0,0,'Welsh','','pkg_cy-GB','package','',0,'2.5.6.1','','http://update.joomla.org/language/details/cy-GB_details.xml','');
INSERT INTO `l38sx_updates` VALUES (57,6,0,0,'MissionControl','','rt_missioncontrol_j16','template','',1,'2.6','','http://updates.rockettheme.com/joomla16/templates/missioncontrol_j16.xml','');
/*!40000 ALTER TABLE `l38sx_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_user_notes`
--

DROP TABLE IF EXISTS `l38sx_user_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_user_notes`
--

LOCK TABLES `l38sx_user_notes` WRITE;
/*!40000 ALTER TABLE `l38sx_user_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_user_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_user_profiles`
--

DROP TABLE IF EXISTS `l38sx_user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_user_profiles`
--

LOCK TABLES `l38sx_user_profiles` WRITE;
/*!40000 ALTER TABLE `l38sx_user_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_user_usergroup_map`
--

DROP TABLE IF EXISTS `l38sx_user_usergroup_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_user_usergroup_map`
--

LOCK TABLES `l38sx_user_usergroup_map` WRITE;
/*!40000 ALTER TABLE `l38sx_user_usergroup_map` DISABLE KEYS */;
INSERT INTO `l38sx_user_usergroup_map` VALUES (216,8);
INSERT INTO `l38sx_user_usergroup_map` VALUES (219,8);
INSERT INTO `l38sx_user_usergroup_map` VALUES (220,8);
/*!40000 ALTER TABLE `l38sx_user_usergroup_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_usergroups`
--

DROP TABLE IF EXISTS `l38sx_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_usergroups`
--

LOCK TABLES `l38sx_usergroups` WRITE;
/*!40000 ALTER TABLE `l38sx_usergroups` DISABLE KEYS */;
INSERT INTO `l38sx_usergroups` VALUES (1,0,1,20,'Public');
INSERT INTO `l38sx_usergroups` VALUES (2,1,6,17,'Registered');
INSERT INTO `l38sx_usergroups` VALUES (3,2,7,14,'Author');
INSERT INTO `l38sx_usergroups` VALUES (4,3,8,11,'Editor');
INSERT INTO `l38sx_usergroups` VALUES (5,4,9,10,'Publisher');
INSERT INTO `l38sx_usergroups` VALUES (6,1,2,5,'Manager');
INSERT INTO `l38sx_usergroups` VALUES (7,6,3,4,'Administrator');
INSERT INTO `l38sx_usergroups` VALUES (8,1,18,19,'Super Users');
/*!40000 ALTER TABLE `l38sx_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_users`
--

DROP TABLE IF EXISTS `l38sx_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_users`
--

LOCK TABLES `l38sx_users` WRITE;
/*!40000 ALTER TABLE `l38sx_users` DISABLE KEYS */;
INSERT INTO `l38sx_users` VALUES (216,'Super User','chris','chris@ammonitenetworks.com','a93018706181164e6f3da204883dc4aa:sw3UsgUeT1wXvd5HeLi4aCng99azuz6S','deprecated',0,1,'2012-10-22 21:12:15','2012-10-26 16:31:13','0','','0000-00-00 00:00:00',0);
INSERT INTO `l38sx_users` VALUES (219,'John McHugh','john','john@brainstormstudio.com','7f67489312db121090cf65916cbcb914:8ZstyFb0STILu0Oq3BlDVut4ryXN7pHZ','',0,0,'2012-10-22 22:01:59','0000-00-00 00:00:00','','{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}','0000-00-00 00:00:00',0);
INSERT INTO `l38sx_users` VALUES (220,'Bruce','bknack','BKnack@siliconsurfers.com','34ac6e6babd5d733032310bad279a2c6:9VMQhdtQbN7iTkfXRaPdATmw3zvnbq8l','',0,0,'2012-10-26 16:37:03','0000-00-00 00:00:00','','{\"admin_style\":\"\",\"admin_language\":\"\",\"language\":\"\",\"editor\":\"\",\"helpsite\":\"\",\"timezone\":\"\"}','0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `l38sx_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_viewlevels`
--

DROP TABLE IF EXISTS `l38sx_viewlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_viewlevels`
--

LOCK TABLES `l38sx_viewlevels` WRITE;
/*!40000 ALTER TABLE `l38sx_viewlevels` DISABLE KEYS */;
INSERT INTO `l38sx_viewlevels` VALUES (1,'Public',0,'[1]');
INSERT INTO `l38sx_viewlevels` VALUES (2,'Registered',1,'[6,2,8]');
INSERT INTO `l38sx_viewlevels` VALUES (3,'Special',2,'[6,3,8]');
/*!40000 ALTER TABLE `l38sx_viewlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l38sx_weblinks`
--

DROP TABLE IF EXISTS `l38sx_weblinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l38sx_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `access` int(11) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `metadata` text NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if link is featured.',
  `xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l38sx_weblinks`
--

LOCK TABLES `l38sx_weblinks` WRITE;
/*!40000 ALTER TABLE `l38sx_weblinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `l38sx_weblinks` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-10-26 16:43:24
