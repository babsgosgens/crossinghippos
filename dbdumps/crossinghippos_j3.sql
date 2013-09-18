-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 18, 2013 at 11:13 AM
-- Server version: 5.1.56
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `crossinghippos_j3`
--

-- --------------------------------------------------------

--
-- Table structure for table `flock_assets`
--

DROP TABLE IF EXISTS `flock_assets`;
CREATE TABLE IF NOT EXISTS `flock_assets` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `flock_assets`
--

INSERT INTO `flock_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 73, 0, 'root.1', 'Root Asset', '{"core.login.site":{"6":1,"2":1},"core.login.admin":{"6":1},"core.login.offline":{"6":1},"core.admin":{"8":1},"core.manage":{"7":1},"core.create":{"6":1,"3":1},"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1},"core.edit.own":{"6":1,"3":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(8, 1, 17, 22, 1, 'com_content', 'com_content', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(9, 1, 23, 24, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 25, 26, 1, 'com_installer', 'com_installer', '{"core.admin":[],"core.manage":{"7":0},"core.delete":{"7":0},"core.edit.state":{"7":0}}'),
(11, 1, 27, 28, 1, 'com_languages', 'com_languages', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(12, 1, 29, 30, 1, 'com_login', 'com_login', '{}'),
(13, 1, 31, 32, 1, 'com_mailto', 'com_mailto', '{}'),
(14, 1, 33, 34, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 35, 36, 1, 'com_media', 'com_media', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":{"5":1}}'),
(16, 1, 37, 38, 1, 'com_menus', 'com_menus', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(17, 1, 39, 40, 1, 'com_messages', 'com_messages', '{"core.admin":{"7":1},"core.manage":{"7":1}}'),
(18, 1, 41, 42, 1, 'com_modules', 'com_modules', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(19, 1, 43, 46, 1, 'com_newsfeeds', 'com_newsfeeds', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(20, 1, 47, 48, 1, 'com_plugins', 'com_plugins', '{"core.admin":{"7":1},"core.manage":[],"core.edit":[],"core.edit.state":[]}'),
(21, 1, 49, 50, 1, 'com_redirect', 'com_redirect', '{"core.admin":{"7":1},"core.manage":[]}'),
(22, 1, 51, 52, 1, 'com_search', 'com_search', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(23, 1, 53, 54, 1, 'com_templates', 'com_templates', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(24, 1, 55, 58, 1, 'com_users', 'com_users', '{"core.admin":{"7":1},"core.manage":[],"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(25, 1, 59, 62, 1, 'com_weblinks', 'com_weblinks', '{"core.admin":{"7":1},"core.manage":{"6":1},"core.create":{"3":1},"core.delete":[],"core.edit":{"4":1},"core.edit.state":{"5":1},"core.edit.own":[]}'),
(26, 1, 63, 64, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 21, 2, 'com_content.category.2', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(30, 19, 44, 45, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(31, 25, 60, 61, 2, 'com_weblinks.category.6', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[],"core.edit.own":[]}'),
(32, 24, 56, 57, 1, 'com_users.category.7', 'Uncategorised', '{"core.create":[],"core.delete":[],"core.edit":[],"core.edit.state":[]}'),
(33, 1, 65, 66, 1, 'com_finder', 'com_finder', '{"core.admin":{"7":1},"core.manage":{"6":1}}'),
(34, 1, 67, 68, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{"core.admin":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(35, 1, 69, 70, 1, 'com_tags', 'com_tags', '{"core.admin":[],"core.manage":[],"core.manage":[],"core.delete":[],"core.edit.state":[]}'),
(36, 1, 71, 72, 1, 'com_scriptmerge', 'com_scriptmerge', '{}'),
(37, 27, 19, 20, 3, 'com_content.article.1', 'Typography Sample', '{"core.delete":{"6":1},"core.edit":{"6":1,"4":1},"core.edit.state":{"6":1,"5":1}}');

-- --------------------------------------------------------

--
-- Table structure for table `flock_associations`
--

DROP TABLE IF EXISTS `flock_associations`;
CREATE TABLE IF NOT EXISTS `flock_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_associations`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_banners`
--

DROP TABLE IF EXISTS `flock_banners`;
CREATE TABLE IF NOT EXISTS `flock_banners` (
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
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `flock_banners`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_banner_clients`
--

DROP TABLE IF EXISTS `flock_banner_clients`;
CREATE TABLE IF NOT EXISTS `flock_banner_clients` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `flock_banner_clients`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_banner_tracks`
--

DROP TABLE IF EXISTS `flock_banner_tracks`;
CREATE TABLE IF NOT EXISTS `flock_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_banner_tracks`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_categories`
--

DROP TABLE IF EXISTS `flock_categories`;
CREATE TABLE IF NOT EXISTS `flock_categories` (
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
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `flock_categories`
--

INSERT INTO `flock_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 13, 0, '', 'system', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(2, 27, 1, 1, 2, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(3, 28, 1, 3, 4, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":"","foobar":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(4, 29, 1, 5, 6, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(5, 30, 1, 7, 8, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(6, 31, 1, 9, 10, 1, 'uncategorised', 'com_weblinks', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1),
(7, 32, 1, 11, 12, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{"target":"","image":""}', '', '', '{"page_title":"","author":"","robots":""}', 42, '2011-01-01 00:00:01', 0, '0000-00-00 00:00:00', 0, '*', 1);

-- --------------------------------------------------------

--
-- Table structure for table `flock_contact_details`
--

DROP TABLE IF EXISTS `flock_contact_details`;
CREATE TABLE IF NOT EXISTS `flock_contact_details` (
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
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `flock_contact_details`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_content`
--

DROP TABLE IF EXISTS `flock_content`;
CREATE TABLE IF NOT EXISTS `flock_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `flock_content`
--

INSERT INTO `flock_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `xreference`) VALUES
(1, 37, 'Typography Sample', 'typography-sample', '<p>Chupa chups cupcake jelly tiramisu pastry. Pudding lollipop apple pie bonbon candy canes tiramisu dessert bonbon jujubes. Pudding chocolate bar pudding chocolate halvah muffin jujubes. Cookie topping brownie candy canes jelly muffin gummi bears. Biscuit biscuit oat cake. Soufflé applicake fruitcake. Croissant carrot cake muffin dessert caramels. Lollipop tart candy pastry gummi bears pie apple pie. Tart chocolate bar chocolate cake marshmallow cupcake cotton candy macaroon bonbon tootsie roll. Icing macaroon dragée cake pie. Sugar plum marzipan candy canes donut cotton candy carrot cake cake halvah marshmallow. Chupa chups halvah jelly-o brownie fruitcake marzipan. Applicake ice cream gingerbread fruitcake wafer bear claw applicake. Gummies donut icing marshmallow. Toffee bear claw chocolate bonbon unerdwear.com. Sweet roll jelly lollipop dessert. Gingerbread cookie pudding fruitcake. Dessert topping powder wafer sweet ice cream candy. Jelly-o gummies sesame snaps marzipan cotton candy gingerbread. Bonbon sweet roll fruitcake. Cheesecake cotton candy muffin jujubes cookie unerdwear.com macaroon chocolate cake donut. Jelly dessert jelly lemon drops. Sesame snaps bonbon unerdwear.com candy applicake topping tiramisu. Chocolate chocolate cake cheesecake brownie donut carrot cake sweet roll. Sweet cheesecake donut jelly beans chocolate. Danish powder oat cake cake tiramisu pie oat cake lollipop. Jelly-o tart cupcake caramels cotton candy gummi bears ice cream chocolate bar. Sweet roll jelly cotton candy. Applicake applicake apple pie gingerbread. Croissant carrot cake halvah dessert sweet. Donut sugar plum gummies ice cream lemon drops gummi bears tootsie roll sugar plum gummies. Sesame snaps bear claw cheesecake jelly-o fruitcake tiramisu chocolate cake bear claw. Cheesecake sweet chocolate cake icing macaroon brownie apple pie lollipop chupa chups. Topping muffin pie. Chocolate fruitcake danish chocolate jelly pudding oat cake cake jujubes. Chocolate cake liquorice bear claw sugar plum powder jelly-o brownie. Lollipop danish tart sweet roll jelly beans jelly jelly applicake soufflé. Unerdwear.com apple pie danish bonbon. Sweet roll chupa chups powder liquorice cake unerdwear.com cheesecake dessert sesame snaps. Dessert marshmallow toffee lollipop chocolate jelly chocolate candy sugar plum. Toffee chocolate bar danish. Topping tart unerdwear.com jujubes lollipop. Sweet roll gummies jelly beans fruitcake bear claw macaroon topping bear claw. Tart jelly beans jelly sesame snaps macaroon chocolate. Gummi bears pie cotton candy. Sweet cake icing cheesecake powder jelly beans gummi bears biscuit. Jujubes chocolate bar jelly-o wafer cotton candy chocolate bar lemon drops chupa chups cupcake. Jujubes applicake bear claw muffin bonbon dessert marshmallow. Marshmallow ice cream ice cream gingerbread candy dessert. Brownie jujubes candy canes. Sweet donut powder lemon drops dragée jelly bear claw gummies.</p>', '', 1, 2, '2013-09-14 10:43:53', 623, '', '2013-09-14 11:00:36', 623, 0, '0000-00-00 00:00:00', '2013-09-14 10:43:53', '0000-00-00 00:00:00', '{"image_intro":"","float_intro":"","image_intro_alt":"","image_intro_caption":"","image_fulltext":"","float_fulltext":"","image_fulltext_alt":"","image_fulltext_caption":""}', '{"urla":false,"urlatext":"","targeta":"","urlb":false,"urlbtext":"","targetb":"","urlc":false,"urlctext":"","targetc":""}', '{"show_title":"","link_titles":"","show_tags":"","show_intro":"","info_block_position":"","show_category":"","link_category":"","show_parent_category":"","link_parent_category":"","show_author":"","link_author":"","show_create_date":"","show_modify_date":"","show_publish_date":"","show_item_navigation":"","show_icons":"","show_print_icon":"","show_email_icon":"","show_vote":"","show_hits":"","show_noauth":"","urls_position":"","alternative_readmore":"","article_layout":"crossinghippos:post","show_publishing_options":"","show_article_options":"","show_urls_images_backend":"","show_urls_images_frontend":""}', 5, 0, '', '', 1, 15, '{"robots":"","author":"","rights":"","xreference":""}', 1, '*', '');

-- --------------------------------------------------------

--
-- Table structure for table `flock_contentitem_tag_map`
--

DROP TABLE IF EXISTS `flock_contentitem_tag_map`;
CREATE TABLE IF NOT EXISTS `flock_contentitem_tag_map` (
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_tag` (`tag_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps items from content tables to tags';

--
-- Dumping data for table `flock_contentitem_tag_map`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_content_frontpage`
--

DROP TABLE IF EXISTS `flock_content_frontpage`;
CREATE TABLE IF NOT EXISTS `flock_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_content_frontpage`
--

INSERT INTO `flock_content_frontpage` (`content_id`, `ordering`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `flock_content_rating`
--

DROP TABLE IF EXISTS `flock_content_rating`;
CREATE TABLE IF NOT EXISTS `flock_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_content_rating`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_content_types`
--

DROP TABLE IF EXISTS `flock_content_types`;
CREATE TABLE IF NOT EXISTS `flock_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) NOT NULL DEFAULT '',
  `type_alias` varchar(255) NOT NULL DEFAULT '',
  `table` varchar(255) NOT NULL DEFAULT '',
  `rules` text NOT NULL,
  `field_mappings` text NOT NULL,
  `router` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `flock_content_types`
--

INSERT INTO `flock_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`) VALUES
(1, 'Article', 'com_content.article', '{"special":{"dbtable":"#__content","key":"id","type":"Content","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"introtext", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"attribs", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"asset_id"}, "special": {"fulltext":"fulltext"}}', 'ContentHelperRoute::getArticleRoute'),
(2, 'Weblink', 'com_weblinks.weblink', '{"special":{"dbtable":"#__weblinks","key":"id","type":"Weblink","prefix":"WeblinksTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"state","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"url", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special": {}}', 'WeblinksHelperRoute::getWeblinkRoute'),
(3, 'Contact', 'com_contact.contact', '{"special":{"dbtable":"#__contact_details","key":"id","type":"Contact","prefix":"ContactTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"address", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"image", "core_urls":"webpage", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special": {"con_position":"con_position","suburb":"suburb","state":"state","country":"country","postcode":"postcode","telephone":"telephone","fax":"fax","misc":"misc","email_to":"email_to","default_con":"default_con","user_id":"user_id","mobile":"mobile","sortname1":"sortname1","sortname2":"sortname2","sortname3":"sortname3"}}', 'ContactHelperRoute::getContactRoute'),
(4, 'Newsfeed', 'com_newsfeeds.newsfeed', '{"special":{"dbtable":"#__newsfeeds","key":"id","type":"Newsfeed","prefix":"NewsfeedsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"published","core_alias":"alias","core_created_time":"created","core_modified_time":"modified","core_body":"description", "core_hits":"hits","core_publish_up":"publish_up","core_publish_down":"publish_down","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"link", "core_version":"version", "core_ordering":"ordering", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"catid", "core_xreference":"xreference", "asset_id":"null"}, "special": {"numarticles":"numarticles","cache_time":"cache_time","rtl":"rtl"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute'),
(5, 'User', 'com_users.user', '{"special":{"dbtable":"#__users","key":"id","type":"User","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"name","core_state":"null","core_alias":"username","core_created_time":"registerdate","core_modified_time":"lastvisitDate","core_body":"null", "core_hits":"null","core_publish_up":"null","core_publish_down":"null","access":"null", "core_params":"params", "core_featured":"null", "core_metadata":"null", "core_language":"null", "core_images":"null", "core_urls":"null", "core_version":"null", "core_ordering":"null", "core_metakey":"null", "core_metadesc":"null", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special": {}}', 'UsersHelperRoute::getUserRoute'),
(6, 'Article Category', 'com_content.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContentHelperRoute::getCategoryRoute'),
(7, 'Contact Category', 'com_contact.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'ContactHelperRoute::getCategoryRoute'),
(8, 'Newsfeeds Category', 'com_newsfeeds.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'NewsfeedsHelperRoute::getCategoryRoute'),
(9, 'Weblinks Category', 'com_weblinks.category', '{"special":{"dbtable":"#__categories","key":"id","type":"Category","prefix":"JTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"null", "core_metadata":"metadata", "core_language":"language", "core_images":"null", "core_urls":"null", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"parent_id", "core_xreference":"null", "asset_id":"asset_id"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path","extension":"extension","note":"note"}}', 'WeblinksHelperRoute::getCategoryRoute'),
(10, 'Tag', 'com_tags.tag', '{"special":{"dbtable":"#__tags","key":"tag_id","type":"Tag","prefix":"TagsTable","config":"array()"},"common":{"dbtable":"#__ucm_content","key":"ucm_id","type":"Corecontent","prefix":"JTable","config":"array()"}}', '', '{"common":{"core_content_item_id":"id","core_title":"title","core_state":"published","core_alias":"alias","core_created_time":"created_time","core_modified_time":"modified_time","core_body":"description", "core_hits":"hits","core_publish_up":"null","core_publish_down":"null","core_access":"access", "core_params":"params", "core_featured":"featured", "core_metadata":"metadata", "core_language":"language", "core_images":"images", "core_urls":"urls", "core_version":"version", "core_ordering":"null", "core_metakey":"metakey", "core_metadesc":"metadesc", "core_catid":"null", "core_xreference":"null", "asset_id":"null"}, "special": {"parent_id":"parent_id","lft":"lft","rgt":"rgt","level":"level","path":"path"}}', 'TagsHelperRoute::getTagRoute');

-- --------------------------------------------------------

--
-- Table structure for table `flock_core_log_searches`
--

DROP TABLE IF EXISTS `flock_core_log_searches`;
CREATE TABLE IF NOT EXISTS `flock_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_core_log_searches`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_extensions`
--

DROP TABLE IF EXISTS `flock_extensions`;
CREATE TABLE IF NOT EXISTS `flock_extensions` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10012 ;

--
-- Dumping data for table `flock_extensions`
--

INSERT INTO `flock_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(1, 'com_mailto', 'component', 'com_mailto', '', 0, 1, 1, 1, '{"name":"com_mailto","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MAILTO_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(2, 'com_wrapper', 'component', 'com_wrapper', '', 0, 1, 1, 1, '{"name":"com_wrapper","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(3, 'com_admin', 'component', 'com_admin', '', 1, 1, 1, 1, '{"name":"com_admin","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_ADMIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(4, 'com_banners', 'component', 'com_banners', '', 1, 1, 1, 0, '{"name":"com_banners","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_BANNERS_XML_DESCRIPTION","group":""}', '{"purchase_type":"3","track_impressions":"0","track_clicks":"0","metakey_prefix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(5, 'com_cache', 'component', 'com_cache', '', 1, 1, 1, 1, '{"name":"com_cache","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CACHE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(6, 'com_categories', 'component', 'com_categories', '', 1, 1, 1, 1, '{"name":"com_categories","type":"component","creationDate":"December 2007","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(7, 'com_checkin', 'component', 'com_checkin', '', 1, 1, 1, 1, '{"name":"com_checkin","type":"component","creationDate":"Unknown","author":"Joomla! Project","copyright":"(C) 2005 - 2008 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CHECKIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(8, 'com_contact', 'component', 'com_contact', '', 1, 1, 1, 0, '{"name":"com_contact","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTACT_XML_DESCRIPTION","group":""}', '{"show_contact_category":"hide","show_contact_list":"0","presentation_style":"sliders","show_name":"1","show_position":"1","show_email":"0","show_street_address":"1","show_suburb":"1","show_state":"1","show_postcode":"1","show_country":"1","show_telephone":"1","show_mobile":"1","show_fax":"1","show_webpage":"1","show_misc":"1","show_image":"1","image":"","allow_vcard":"0","show_articles":"0","show_profile":"0","show_links":"0","linka_name":"","linkb_name":"","linkc_name":"","linkd_name":"","linke_name":"","contact_icons":"0","icon_address":"","icon_email":"","icon_telephone":"","icon_mobile":"","icon_fax":"","icon_misc":"","show_headings":"1","show_position_headings":"1","show_email_headings":"0","show_telephone_headings":"1","show_mobile_headings":"0","show_fax_headings":"0","allow_vcard_headings":"0","show_suburb_headings":"1","show_state_headings":"1","show_country_headings":"1","show_email_form":"1","show_email_copy":"1","banned_email":"","banned_subject":"","banned_text":"","validate_session":"1","custom_reply":"0","redirect":"","show_category_crumb":"0","metakey":"","metadesc":"","robots":"","author":"","rights":"","xreference":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(9, 'com_cpanel', 'component', 'com_cpanel', '', 1, 1, 1, 1, '{"name":"com_cpanel","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CPANEL_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10, 'com_installer', 'component', 'com_installer', '', 1, 1, 1, 1, '{"name":"com_installer","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_INSTALLER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(11, 'com_languages', 'component', 'com_languages', '', 1, 1, 1, 1, '{"name":"com_languages","type":"component","creationDate":"2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LANGUAGES_XML_DESCRIPTION","group":""}', '{"administrator":"en-GB","site":"en-GB"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(12, 'com_login', 'component', 'com_login', '', 1, 1, 1, 1, '{"name":"com_login","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(13, 'com_media', 'component', 'com_media', '', 1, 1, 0, 1, '{"name":"com_media","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MEDIA_XML_DESCRIPTION","group":""}', '{"upload_extensions":"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS","upload_maxsize":"10","file_path":"images","image_path":"images","restrict_uploads":"1","allowed_media_usergroup":"3","check_mime":"1","image_extensions":"bmp,gif,jpg,png","ignore_extensions":"","upload_mime":"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip","upload_mime_illegal":"text\\/html"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(14, 'com_menus', 'component', 'com_menus', '', 1, 1, 1, 1, '{"name":"com_menus","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MENUS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(15, 'com_messages', 'component', 'com_messages', '', 1, 1, 1, 1, '{"name":"com_messages","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MESSAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(16, 'com_modules', 'component', 'com_modules', '', 1, 1, 1, 1, '{"name":"com_modules","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_MODULES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(17, 'com_newsfeeds', 'component', 'com_newsfeeds', '', 1, 1, 1, 0, '{"name":"com_newsfeeds","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"show_feed_image":"1","show_feed_description":"1","show_item_description":"1","feed_word_count":"0","show_headings":"1","show_name":"1","show_articles":"0","show_link":"1","show_description":"1","show_description_image":"1","display_num":"","show_pagination_limit":"1","show_pagination":"1","show_pagination_results":"1","show_cat_items":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(18, 'com_plugins', 'component', 'com_plugins', '', 1, 1, 1, 1, '{"name":"com_plugins","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_PLUGINS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(19, 'com_search', 'component', 'com_search', '', 1, 1, 1, 0, '{"name":"com_search","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_SEARCH_XML_DESCRIPTION","group":""}', '{"enabled":"0","show_date":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(20, 'com_templates', 'component', 'com_templates', '', 1, 1, 1, 1, '{"name":"com_templates","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_TEMPLATES_XML_DESCRIPTION","group":""}', '{"template_positions_display":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(21, 'com_weblinks', 'component', 'com_weblinks', '', 1, 1, 1, 0, '{"name":"com_weblinks","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\n\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_WEBLINKS_XML_DESCRIPTION","group":""}', '{"show_comp_description":"1","comp_description":"","show_link_hits":"1","show_link_description":"1","show_other_cats":"0","show_headings":"0","show_numbers":"0","show_report":"1","count_clicks":"1","target":"0","link_icons":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(22, 'com_content', 'component', 'com_content', '', 1, 1, 0, 1, '{"name":"com_content","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONTENT_XML_DESCRIPTION","group":""}', '{"article_layout":"_:default","show_title":"1","link_titles":"1","show_intro":"1","show_category":"1","link_category":"1","show_parent_category":"0","link_parent_category":"0","show_author":"1","link_author":"0","show_create_date":"0","show_modify_date":"0","show_publish_date":"1","show_item_navigation":"1","show_vote":"0","show_readmore":"1","show_readmore_title":"1","readmore_limit":"100","show_icons":"1","show_print_icon":"1","show_email_icon":"1","show_hits":"1","show_noauth":"0","show_publishing_options":"1","show_article_options":"1","show_urls_images_frontend":"0","show_urls_images_backend":"1","targeta":0,"targetb":0,"targetc":0,"float_intro":"left","float_fulltext":"left","category_layout":"_:blog","show_category_title":"0","show_description":"0","show_description_image":"0","maxLevel":"1","show_empty_categories":"0","show_no_articles":"1","show_subcat_desc":"1","show_cat_num_articles":"0","show_base_description":"1","maxLevelcat":"-1","show_empty_categories_cat":"0","show_subcat_desc_cat":"1","show_cat_num_articles_cat":"1","num_leading_articles":"1","num_intro_articles":"4","num_columns":"2","num_links":"4","multi_column_order":"0","show_subcategory_content":"0","show_pagination_limit":"1","filter_field":"hide","show_headings":"1","list_show_date":"0","date_format":"","list_show_hits":"1","list_show_author":"1","orderby_pri":"order","orderby_sec":"rdate","order_date":"published","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","feed_summary":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(23, 'com_config', 'component', 'com_config', '', 1, 1, 0, 1, '{"name":"com_config","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_CONFIG_XML_DESCRIPTION","group":""}', '{"filters":{"1":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"9":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"6":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"7":{"filter_type":"NONE","filter_tags":"","filter_attributes":""},"2":{"filter_type":"NH","filter_tags":"","filter_attributes":""},"3":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"4":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"5":{"filter_type":"BL","filter_tags":"","filter_attributes":""},"8":{"filter_type":"NONE","filter_tags":"","filter_attributes":""}}}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(24, 'com_redirect', 'component', 'com_redirect', '', 1, 1, 0, 1, '{"name":"com_redirect","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(25, 'com_users', 'component', 'com_users', '', 1, 1, 0, 1, '{"name":"com_users","type":"component","creationDate":"April 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_USERS_XML_DESCRIPTION","group":""}', '{"allowUserRegistration":"1","new_usertype":"2","guest_usergroup":"9","sendpassword":"1","useractivation":"2","mail_to_admin":"1","captcha":"","frontend_userparams":"1","site_language":"0","change_login_name":"0","reset_count":"10","reset_time":"1","mailSubjectPrefix":"","mailBodySuffix":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(27, 'com_finder', 'component', 'com_finder', '', 1, 1, 0, 0, '{"name":"com_finder","type":"component","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_FINDER_XML_DESCRIPTION","group":""}', '{"show_description":"1","description_length":255,"allow_empty_query":"0","show_url":"1","show_advanced":"1","expand_advanced":"0","show_date_filters":"0","highlight_terms":"1","opensearch_name":"","opensearch_description":"","batch_size":"50","memory_table_limit":30000,"title_multiplier":"1.7","text_multiplier":"0.7","meta_multiplier":"1.2","path_multiplier":"2.0","misc_multiplier":"0.3","stemmer":"snowball"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(28, 'com_joomlaupdate', 'component', 'com_joomlaupdate', '', 1, 1, 0, 1, '{"name":"com_joomlaupdate","type":"component","creationDate":"February 2012","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.\\t","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"COM_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(29, 'com_tags', 'component', 'com_tags', '', 1, 1, 1, 1, '{"name":"com_tags","type":"component","creationDate":"December 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"COM_TAGS_XML_DESCRIPTION","group":""}', '{"show_tag_title":"0","tag_list_show_tag_image":"0","tag_list_show_tag_description":"0","tag_list_image":"","show_tag_num_items":"0","tag_list_orderby":"title","tag_list_orderby_direction":"ASC","show_headings":"0","tag_list_show_date":"0","tag_list_show_item_image":"0","tag_list_show_item_description":"0","tag_list_item_maximum_characters":0,"return_any_or_all":"1","include_children":"0","maximum":200,"tag_list_language_filter":"all","tags_layout":"_:default","all_tags_orderby":"title","all_tags_orderby_direction":"ASC","all_tags_show_tag_image":"0","all_tags_show_tag_descripion":"0","all_tags_tag_maximum_characters":20,"all_tags_show_tag_hits":"0","filter_field":"1","show_pagination_limit":"1","show_pagination":"2","show_pagination_results":"1","tag_field_ajax_mode":"1","show_feed_link":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(100, 'PHPMailer', 'library', 'phpmailer', '', 0, 1, 1, 1, '{"name":"PHPMailer","type":"library","creationDate":"2001","author":"PHPMailer","copyright":"(c) 2001-2003, Brent R. Matzelle, (c) 2004-2009, Andy Prevost. All Rights Reserved., (c) 2010-2013, Jim Jagielski. All Rights Reserved.","authorEmail":"jimjag@gmail.com","authorUrl":"https:\\/\\/github.com\\/PHPMailer\\/PHPMailer","version":"5.2.6","description":"LIB_PHPMAILER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(101, 'SimplePie', 'library', 'simplepie', '', 0, 1, 1, 1, '{"name":"SimplePie","type":"library","creationDate":"2004","author":"SimplePie","copyright":"Copyright (c) 2004-2009, Ryan Parman and Geoffrey Sneddon","authorEmail":"","authorUrl":"http:\\/\\/simplepie.org\\/","version":"1.2","description":"LIB_SIMPLEPIE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(102, 'phputf8', 'library', 'phputf8', '', 0, 1, 1, 1, '{"name":"phputf8","type":"library","creationDate":"2006","author":"Harry Fuecks","copyright":"Copyright various authors","authorEmail":"hfuecks@gmail.com","authorUrl":"http:\\/\\/sourceforge.net\\/projects\\/phputf8","version":"0.5","description":"LIB_PHPUTF8_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(103, 'Joomla! Platform', 'library', 'joomla', '', 0, 1, 1, 1, '{"name":"Joomla! Platform","type":"library","creationDate":"2008","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"http:\\/\\/www.joomla.org","version":"12.2","description":"LIB_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(104, 'IDNA Convert', 'library', 'idna_convert', '', 0, 1, 1, 1, '{"name":"IDNA Convert","type":"library","creationDate":"2004","author":"phlyLabs","copyright":"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de","authorEmail":"phlymail@phlylabs.de","authorUrl":"http:\\/\\/phlylabs.de","version":"0.8.0","description":"LIB_IDNA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(200, 'mod_articles_archive', 'module', 'mod_articles_archive', '', 0, 1, 1, 0, '{"name":"mod_articles_archive","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters.\\n\\t\\tAll rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(201, 'mod_articles_latest', 'module', 'mod_articles_latest', '', 0, 1, 1, 0, '{"name":"mod_articles_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(202, 'mod_articles_popular', 'module', 'mod_articles_popular', '', 0, 1, 1, 0, '{"name":"mod_articles_popular","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(203, 'mod_banners', 'module', 'mod_banners', '', 0, 1, 1, 0, '{"name":"mod_banners","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BANNERS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(204, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', '', 0, 1, 1, 1, '{"name":"mod_breadcrumbs","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_BREADCRUMBS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(205, 'mod_custom', 'module', 'mod_custom', '', 0, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(206, 'mod_feed', 'module', 'mod_feed', '', 0, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(207, 'mod_footer', 'module', 'mod_footer', '', 0, 1, 1, 0, '{"name":"mod_footer","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FOOTER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(208, 'mod_login', 'module', 'mod_login', '', 0, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(209, 'mod_menu', 'module', 'mod_menu', '', 0, 1, 1, 1, '{"name":"mod_menu","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(210, 'mod_articles_news', 'module', 'mod_articles_news', '', 0, 1, 1, 0, '{"name":"mod_articles_news","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_NEWS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(211, 'mod_random_image', 'module', 'mod_random_image', '', 0, 1, 1, 0, '{"name":"mod_random_image","type":"module","creationDate":"July 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RANDOM_IMAGE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(212, 'mod_related_items', 'module', 'mod_related_items', '', 0, 1, 1, 0, '{"name":"mod_related_items","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_RELATED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(213, 'mod_search', 'module', 'mod_search', '', 0, 1, 1, 0, '{"name":"mod_search","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SEARCH_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(214, 'mod_stats', 'module', 'mod_stats', '', 0, 1, 1, 0, '{"name":"mod_stats","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(215, 'mod_syndicate', 'module', 'mod_syndicate', '', 0, 1, 1, 1, '{"name":"mod_syndicate","type":"module","creationDate":"May 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SYNDICATE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(216, 'mod_users_latest', 'module', 'mod_users_latest', '', 0, 1, 1, 0, '{"name":"mod_users_latest","type":"module","creationDate":"December 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_USERS_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(217, 'mod_weblinks', 'module', 'mod_weblinks', '', 0, 1, 1, 0, '{"name":"mod_weblinks","type":"module","creationDate":"July 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WEBLINKS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(218, 'mod_whosonline', 'module', 'mod_whosonline', '', 0, 1, 1, 0, '{"name":"mod_whosonline","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WHOSONLINE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(219, 'mod_wrapper', 'module', 'mod_wrapper', '', 0, 1, 1, 0, '{"name":"mod_wrapper","type":"module","creationDate":"October 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_WRAPPER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(220, 'mod_articles_category', 'module', 'mod_articles_category', '', 0, 1, 1, 0, '{"name":"mod_articles_category","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(221, 'mod_articles_categories', 'module', 'mod_articles_categories', '', 0, 1, 1, 0, '{"name":"mod_articles_categories","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(222, 'mod_languages', 'module', 'mod_languages', '', 0, 1, 1, 1, '{"name":"mod_languages","type":"module","creationDate":"February 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LANGUAGES_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(223, 'mod_finder', 'module', 'mod_finder', '', 0, 1, 0, 0, '{"name":"mod_finder","type":"module","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FINDER_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(300, 'mod_custom', 'module', 'mod_custom', '', 1, 1, 1, 1, '{"name":"mod_custom","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_CUSTOM_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(301, 'mod_feed', 'module', 'mod_feed', '', 1, 1, 1, 0, '{"name":"mod_feed","type":"module","creationDate":"July 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_FEED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(302, 'mod_latest', 'module', 'mod_latest', '', 1, 1, 1, 0, '{"name":"mod_latest","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LATEST_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(303, 'mod_logged', 'module', 'mod_logged', '', 1, 1, 1, 0, '{"name":"mod_logged","type":"module","creationDate":"January 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGGED_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(304, 'mod_login', 'module', 'mod_login', '', 1, 1, 1, 1, '{"name":"mod_login","type":"module","creationDate":"March 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_LOGIN_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(305, 'mod_menu', 'module', 'mod_menu', '', 1, 1, 1, 0, '{"name":"mod_menu","type":"module","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(307, 'mod_popular', 'module', 'mod_popular', '', 1, 1, 1, 0, '{"name":"mod_popular","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_POPULAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(308, 'mod_quickicon', 'module', 'mod_quickicon', '', 1, 1, 1, 1, '{"name":"mod_quickicon","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_QUICKICON_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(309, 'mod_status', 'module', 'mod_status', '', 1, 1, 1, 0, '{"name":"mod_status","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATUS_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(310, 'mod_submenu', 'module', 'mod_submenu', '', 1, 1, 1, 0, '{"name":"mod_submenu","type":"module","creationDate":"Feb 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_SUBMENU_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(311, 'mod_title', 'module', 'mod_title', '', 1, 1, 1, 0, '{"name":"mod_title","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TITLE_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(312, 'mod_toolbar', 'module', 'mod_toolbar', '', 1, 1, 1, 1, '{"name":"mod_toolbar","type":"module","creationDate":"Nov 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_TOOLBAR_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(313, 'mod_multilangstatus', 'module', 'mod_multilangstatus', '', 1, 1, 1, 0, '{"name":"mod_multilangstatus","type":"module","creationDate":"September 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_MULTILANGSTATUS_XML_DESCRIPTION","group":""}', '{"cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(314, 'mod_version', 'module', 'mod_version', '', 1, 1, 1, 0, '{"name":"mod_version","type":"module","creationDate":"January 2012","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_VERSION_XML_DESCRIPTION","group":""}', '{"format":"short","product":"1","cache":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(315, 'mod_stats_admin', 'module', 'mod_stats_admin', '', 1, 1, 1, 0, '{"name":"mod_stats_admin","type":"module","creationDate":"July 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"MOD_STATS_XML_DESCRIPTION","group":""}', '{"serverinfo":"0","siteinfo":"0","counter":"0","increase":"0","cache":"1","cache_time":"900","cachemode":"static"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(316, 'mod_tags_popular', 'module', 'mod_tags_popular', '', 0, 1, 1, 0, '{"name":"mod_tags_popular","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_POPULAR_XML_DESCRIPTION","group":""}', '{"maximum":"5","timeframe":"alltime","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(317, 'mod_tags_similar', 'module', 'mod_tags_similar', '', 0, 1, 1, 0, '{"name":"mod_tags_similar","type":"module","creationDate":"January 2013","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.0","description":"MOD_TAGS_SIMILAR_XML_DESCRIPTION","group":""}', '{"maximum":"5","matchtype":"any","owncache":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(400, 'plg_authentication_gmail', 'plugin', 'gmail', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_gmail","type":"plugin","creationDate":"February 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_GMAIL_XML_DESCRIPTION","group":""}', '{"applysuffix":"0","suffix":"","verifypeer":"1","user_blacklist":""}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(401, 'plg_authentication_joomla', 'plugin', 'joomla', 'authentication', 0, 1, 1, 1, '{"name":"plg_authentication_joomla","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_AUTH_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(402, 'plg_authentication_ldap', 'plugin', 'ldap', 'authentication', 0, 0, 1, 0, '{"name":"plg_authentication_ldap","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LDAP_XML_DESCRIPTION","group":""}', '{"host":"","port":"389","use_ldapV3":"0","negotiate_tls":"0","no_referrals":"0","auth_method":"bind","base_dn":"","search_string":"","users_dn":"","username":"admin","password":"bobby7","ldap_fullname":"fullName","ldap_email":"mail","ldap_uid":"uid"}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(404, 'plg_content_emailcloak', 'plugin', 'emailcloak', 'content', 0, 1, 1, 0, '{"name":"plg_content_emailcloak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION","group":""}', '{"mode":"1"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(406, 'plg_content_loadmodule', 'plugin', 'loadmodule', 'content', 0, 1, 1, 0, '{"name":"plg_content_loadmodule","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOADMODULE_XML_DESCRIPTION","group":""}', '{"style":"xhtml"}', '', '', 0, '2011-09-18 15:22:50', 0, 0),
(407, 'plg_content_pagebreak', 'plugin', 'pagebreak', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagebreak","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION","group":""}', '{"title":"1","multipage_toc":"1","showall":"1"}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(408, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', 'content', 0, 1, 1, 0, '{"name":"plg_content_pagenavigation","type":"plugin","creationDate":"January 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_PAGENAVIGATION_XML_DESCRIPTION","group":""}', '{"position":"1"}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(409, 'plg_content_vote', 'plugin', 'vote', 'content', 0, 1, 1, 0, '{"name":"plg_content_vote","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_VOTE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(410, 'plg_editors_codemirror', 'plugin', 'codemirror', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_codemirror","type":"plugin","creationDate":"28 March 2011","author":"Marijn Haverbeke","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"1.0","description":"PLG_CODEMIRROR_XML_DESCRIPTION","group":""}', '{"linenumbers":"0","tabmode":"indent"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(411, 'plg_editors_none', 'plugin', 'none', 'editors', 0, 1, 1, 1, '{"name":"plg_editors_none","type":"plugin","creationDate":"August 2004","author":"Unknown","copyright":"","authorEmail":"N\\/A","authorUrl":"","version":"3.0.0","description":"PLG_NONE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(412, 'plg_editors_tinymce', 'plugin', 'tinymce', 'editors', 0, 1, 1, 0, '{"name":"plg_editors_tinymce","type":"plugin","creationDate":"2005-2012","author":"Moxiecode Systems AB","copyright":"Moxiecode Systems AB","authorEmail":"N\\/A","authorUrl":"tinymce.moxiecode.com\\/","version":"3.5.6","description":"PLG_TINY_XML_DESCRIPTION","group":""}', '{"mode":"1","skin":"0","entity_encoding":"raw","lang_mode":"0","lang_code":"en","text_direction":"ltr","content_css":"1","content_css_custom":"","relative_urls":"1","newlines":"0","invalid_elements":"script,applet,iframe","extended_elements":"","toolbar":"top","toolbar_align":"left","html_height":"550","html_width":"750","resizing":"true","resize_horizontal":"false","element_path":"1","fonts":"1","paste":"1","searchreplace":"1","insertdate":"1","format_date":"%Y-%m-%d","inserttime":"1","format_time":"%H:%M:%S","colors":"1","table":"1","smilies":"1","media":"1","hr":"1","directionality":"1","fullscreen":"1","style":"1","layer":"1","xhtmlxtras":"1","visualchars":"1","nonbreaking":"1","template":"1","blockquote":"1","wordcount":"1","advimage":"1","advlink":"1","advlist":"1","autosave":"1","contextmenu":"1","inlinepopups":"1","custom_plugin":"","custom_button":""}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(413, 'plg_editors-xtd_article', 'plugin', 'article', 'editors-xtd', 0, 1, 1, 1, '{"name":"plg_editors-xtd_article","type":"plugin","creationDate":"October 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_ARTICLE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(414, 'plg_editors-xtd_image', 'plugin', 'image', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_image","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_IMAGE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(415, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_pagebreak","type":"plugin","creationDate":"August 2004","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(416, 'plg_editors-xtd_readmore', 'plugin', 'readmore', 'editors-xtd', 0, 1, 1, 0, '{"name":"plg_editors-xtd_readmore","type":"plugin","creationDate":"March 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_READMORE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(417, 'plg_search_categories', 'plugin', 'categories', 'search', 0, 1, 1, 0, '{"name":"plg_search_categories","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(418, 'plg_search_contacts', 'plugin', 'contacts', 'search', 0, 1, 1, 0, '{"name":"plg_search_contacts","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTACTS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(419, 'plg_search_content', 'plugin', 'content', 'search', 0, 1, 1, 0, '{"name":"plg_search_content","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_CONTENT_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(420, 'plg_search_newsfeeds', 'plugin', 'newsfeeds', 'search', 0, 1, 1, 0, '{"name":"plg_search_newsfeeds","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(421, 'plg_search_weblinks', 'plugin', 'weblinks', 'search', 0, 1, 1, 0, '{"name":"plg_search_weblinks","type":"plugin","creationDate":"November 2005","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEARCH_WEBLINKS_XML_DESCRIPTION","group":""}', '{"search_limit":"50","search_content":"1","search_archived":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(422, 'plg_system_languagefilter', 'plugin', 'languagefilter', 'system', 0, 0, 1, 1, '{"name":"plg_system_languagefilter","type":"plugin","creationDate":"July 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(423, 'plg_system_p3p', 'plugin', 'p3p', 'system', 0, 1, 1, 0, '{"name":"plg_system_p3p","type":"plugin","creationDate":"September 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_P3P_XML_DESCRIPTION","group":""}', '{"headers":"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(424, 'plg_system_cache', 'plugin', 'cache', 'system', 0, 0, 1, 1, '{"name":"plg_system_cache","type":"plugin","creationDate":"February 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CACHE_XML_DESCRIPTION","group":""}', '{"browsercache":"0","cachetime":"15"}', '', '', 0, '0000-00-00 00:00:00', 9, 0);
INSERT INTO `flock_extensions` (`extension_id`, `name`, `type`, `element`, `folder`, `client_id`, `enabled`, `access`, `protected`, `manifest_cache`, `params`, `custom_data`, `system_data`, `checked_out`, `checked_out_time`, `ordering`, `state`) VALUES
(425, 'plg_system_debug', 'plugin', 'debug', 'system', 0, 1, 1, 0, '{"name":"plg_system_debug","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_DEBUG_XML_DESCRIPTION","group":""}', '{"profile":"1","queries":"1","memory":"1","language_files":"1","language_strings":"1","strip-first":"1","strip-prefix":"","strip-suffix":""}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(426, 'plg_system_log', 'plugin', 'log', 'system', 0, 1, 1, 1, '{"name":"plg_system_log","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_LOG_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(427, 'plg_system_redirect', 'plugin', 'redirect', 'system', 0, 0, 1, 1, '{"name":"plg_system_redirect","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REDIRECT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 6, 0),
(428, 'plg_system_remember', 'plugin', 'remember', 'system', 0, 1, 1, 1, '{"name":"plg_system_remember","type":"plugin","creationDate":"April 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_REMEMBER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(429, 'plg_system_sef', 'plugin', 'sef', 'system', 0, 1, 1, 0, '{"name":"plg_system_sef","type":"plugin","creationDate":"December 2007","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SEF_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 8, 0),
(430, 'plg_system_logout', 'plugin', 'logout', 'system', 0, 1, 1, 1, '{"name":"plg_system_logout","type":"plugin","creationDate":"April 2009","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(431, 'plg_user_contactcreator', 'plugin', 'contactcreator', 'user', 0, 0, 1, 0, '{"name":"plg_user_contactcreator","type":"plugin","creationDate":"August 2009","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTACTCREATOR_XML_DESCRIPTION","group":""}', '{"autowebpage":"","category":"34","autopublish":"0"}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(432, 'plg_user_joomla', 'plugin', 'joomla', 'user', 0, 1, 1, 0, '{"name":"plg_user_joomla","type":"plugin","creationDate":"December 2006","author":"Joomla! Project","copyright":"(C) 2005 - 2009 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_JOOMLA_XML_DESCRIPTION","group":""}', '{"autoregister":"1"}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(433, 'plg_user_profile', 'plugin', 'profile', 'user', 0, 0, 1, 0, '{"name":"plg_user_profile","type":"plugin","creationDate":"January 2008","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_USER_PROFILE_XML_DESCRIPTION","group":""}', '{"register-require_address1":"1","register-require_address2":"1","register-require_city":"1","register-require_region":"1","register-require_country":"1","register-require_postal_code":"1","register-require_phone":"1","register-require_website":"1","register-require_favoritebook":"1","register-require_aboutme":"1","register-require_tos":"1","register-require_dob":"1","profile-require_address1":"1","profile-require_address2":"1","profile-require_city":"1","profile-require_region":"1","profile-require_country":"1","profile-require_postal_code":"1","profile-require_phone":"1","profile-require_website":"1","profile-require_favoritebook":"1","profile-require_aboutme":"1","profile-require_tos":"1","profile-require_dob":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(434, 'plg_extension_joomla', 'plugin', 'joomla', 'extension', 0, 1, 1, 1, '{"name":"plg_extension_joomla","type":"plugin","creationDate":"May 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(435, 'plg_content_joomla', 'plugin', 'joomla', 'content', 0, 1, 1, 0, '{"name":"plg_content_joomla","type":"plugin","creationDate":"November 2010","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_JOOMLA_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(436, 'plg_system_languagecode', 'plugin', 'languagecode', 'system', 0, 0, 1, 0, '{"name":"plg_system_languagecode","type":"plugin","creationDate":"November 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 10, 0),
(437, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_joomlaupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(438, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', 'quickicon', 0, 1, 1, 1, '{"name":"plg_quickicon_extensionupdate","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(439, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', 'captcha', 0, 0, 1, 0, '{"name":"plg_captcha_recaptcha","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION","group":""}', '{"public_key":"","private_key":"","theme":"clean"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(440, 'plg_system_highlight', 'plugin', 'highlight', 'system', 0, 1, 1, 0, '{"name":"plg_system_highlight","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 7, 0),
(441, 'plg_content_finder', 'plugin', 'finder', 'content', 0, 0, 1, 0, '{"name":"plg_content_finder","type":"plugin","creationDate":"December 2011","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_CONTENT_FINDER_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(442, 'plg_finder_categories', 'plugin', 'categories', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_categories","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CATEGORIES_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 1, 0),
(443, 'plg_finder_contacts', 'plugin', 'contacts', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_contacts","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTACTS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 2, 0),
(444, 'plg_finder_content', 'plugin', 'content', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_content","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_CONTENT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 3, 0),
(445, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_newsfeeds","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 4, 0),
(446, 'plg_finder_weblinks', 'plugin', 'weblinks', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_weblinks","type":"plugin","creationDate":"August 2011","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_WEBLINKS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 5, 0),
(447, 'plg_finder_tags', 'plugin', 'tags', 'finder', 0, 1, 1, 0, '{"name":"plg_finder_tags","type":"plugin","creationDate":"February 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.0.0","description":"PLG_FINDER_TAGS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(503, 'beez3', 'template', 'beez3', '', 0, 1, 1, 0, '{"name":"beez3","type":"template","creationDate":"25 November 2009","author":"Angie Radtke","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"a.radtke@derauftritt.de","authorUrl":"http:\\/\\/www.der-auftritt.de","version":"3.1.0","description":"TPL_BEEZ3_XML_DESCRIPTION","group":""}', '{"wrapperSmall":"53","wrapperLarge":"72","sitetitle":"","sitedescription":"","navposition":"center","templatecolor":"nature"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(504, 'hathor', 'template', 'hathor', '', 1, 1, 1, 0, '{"name":"hathor","type":"template","creationDate":"May 2010","author":"Andrea Tarr","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"hathor@tarrconsulting.com","authorUrl":"http:\\/\\/www.tarrconsulting.com","version":"3.0.0","description":"TPL_HATHOR_XML_DESCRIPTION","group":""}', '{"showSiteName":"0","colourChoice":"0","boldText":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(506, 'protostar', 'template', 'protostar', '', 0, 1, 1, 0, '{"name":"protostar","type":"template","creationDate":"4\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_PROTOSTAR_XML_DESCRIPTION","group":""}', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(507, 'isis', 'template', 'isis', '', 1, 1, 1, 0, '{"name":"isis","type":"template","creationDate":"3\\/30\\/2012","author":"Kyle Ledbetter","copyright":"Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"","version":"1.0","description":"TPL_ISIS_XML_DESCRIPTION","group":""}', '{"templateColor":"","logoFile":""}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(600, 'English (United Kingdom)', 'language', 'en-GB', '', 0, 1, 1, 1, '{"name":"English (United Kingdom)","type":"language","creationDate":"2013-03-07","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.4","description":"en-GB site language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(601, 'English (United Kingdom)', 'language', 'en-GB', '', 1, 1, 1, 1, '{"name":"English (United Kingdom)","type":"language","creationDate":"2013-03-07","author":"Joomla! Project","copyright":"Copyright (C) 2005 - 2013 Open Source Matters. All rights reserved.","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.4","description":"en-GB administrator language","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(700, 'files_joomla', 'file', 'joomla', '', 0, 1, 1, 1, '{"name":"files_joomla","type":"file","creationDate":"August 2013","author":"Joomla! Project","copyright":"(C) 2005 - 2013 Open Source Matters. All rights reserved","authorEmail":"admin@joomla.org","authorUrl":"www.joomla.org","version":"3.1.5","description":"FILES_JOOMLA_XML_DESCRIPTION","group":""}', '', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10001, 'crossinghippos', 'template', 'crossinghippos', '', 0, 1, 1, 0, '{"name":"crossinghippos","type":"template","creationDate":"09\\/13\\/2013","author":"Babs G\\u00f6sgens","copyright":"Copyright (C) 2010 - 2013 Crossing Hippos. All rights reserved.","authorEmail":"babs@crossinghipps.nl","authorUrl":"","version":"1.0","description":"TPL_XH_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10002, 'com_scriptmerge', 'component', 'com_scriptmerge', '', 1, 1, 0, 0, '{"name":"COM_SCRIPTMERGE","type":"component","creationDate":"July 2013","author":"Yireo","copyright":"Copyright 2013 Yireo.com","authorEmail":"","authorUrl":"","version":"0.9.8","description":"COM_SCRIPTMERGE_DESC","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10003, 'PLG_SYSTEM_SCRIPTMERGE', 'plugin', 'scriptmerge', 'system', 0, 1, 1, 0, '{"name":"PLG_SYSTEM_SCRIPTMERGE","type":"plugin","creationDate":"July 2013","author":"Yireo","copyright":"Copyright (C) 2013 Yireo.com. All rights reserved.","authorEmail":"info@yireo.com","authorUrl":"www.yireo.com","version":"0.9.8","description":"PLG_SYSTEM_SCRIPTMERGE_DESC","group":""}', '{"merge_type":"md5sum","enable_css":"0","enable_js":"1","compress_css":"0","compress_js":"2","skip_compressed":"1","exclude_css":"","exclude_js":"\\/javascripts\\/jquery-1.10.2.min.js, \\/javascripts\\/modernizr.custom.55528.js","exclude_components":"","frontend":"1","backend":"0","use_comments":"0","compress_html":"1","expiration":"30","version":"1","follow_imports":"0","data_uris":"0","data_uris_filesize":"2000","use_webp":"0","cwebp":"","use_jsmin":"0","jsmin":"","async_merged":"1","js_position":"body_end","css_position":"first_tag","force_gzip":"0"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10005, 'PLG_SYS_MOOTABLE', 'plugin', 'mootable', 'system', 0, 1, 1, 0, '{"name":"PLG_SYS_MOOTABLE","type":"plugin","creationDate":"December 2012","author":"Roberto Segura","copyright":"Copyright (C) 2012 Roberto Segura. All rights reserved.","authorEmail":"roberto@phproberto.com","authorUrl":"http:\\/\\/digitaldisseny.com\\/en\\/extensions\\/showtags-content-tags-joomla-plugin","version":"1.0.8","description":"PLG_SYS_MOOTABLE_XML_DESC","group":""}', '{"defaultMode":"0","manualDisable":"","alwaysEnable":"","contentEdition":"1","enableComUsers":"0","disableWhenDebug":"1"}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10007, 'plg_system_layout', 'plugin', 'layout', 'system', 0, 0, 1, 0, '{"name":"plg_system_layout","type":"plugin","creationDate":"March 2012","author":"Miss High and Mighty","copyright":"Copyright (C) 2005 - 2012 Open Source Matters. All rights reserved.","authorEmail":"AmyStephen@gmail.com","authorUrl":"molajo.org","version":"1.0","description":"PLG_SYSTEM_LAYOUT_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10009, 'com_streams', 'component', 'com_streams', '', 1, 1, 1, 0, '{"name":"com_streams","type":"component","creationDate":"September 2013","author":"Babs Gosgens","copyright":"(C) 2010 - 2013 Crossing Hippos. All rights reserved.\\n\\t","authorEmail":"babs@crossinghippos.nl","authorUrl":"www.crossinghippos.nl","version":"3.0.0","description":"COM_STREAMS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0),
(10011, 'Crossing Hippos (Babs)', 'template', 'babs', '', 0, 1, 1, 0, '{"name":"Crossing Hippos (Babs)","type":"template","creationDate":"18 April 2013","author":"Babs G\\u00f6sgens","copyright":"Copyright (C) 2013 Babs G\\u00f6sgens. All rights reserved.","authorEmail":"babsgosgens@gmail.com","authorUrl":"http:\\/\\/crossinghippos.nl","version":"3.1.0","description":"TPL_CROSSINGHIPPOS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_filters`
--

DROP TABLE IF EXISTS `flock_finder_filters`;
CREATE TABLE IF NOT EXISTS `flock_finder_filters` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `flock_finder_filters`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_links`
--

DROP TABLE IF EXISTS `flock_finder_links`;
CREATE TABLE IF NOT EXISTS `flock_finder_links` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `flock_finder_links`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_links_terms0`
--

DROP TABLE IF EXISTS `flock_finder_links_terms0`;
CREATE TABLE IF NOT EXISTS `flock_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_links_terms0`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_links_terms1`
--

DROP TABLE IF EXISTS `flock_finder_links_terms1`;
CREATE TABLE IF NOT EXISTS `flock_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_links_terms1`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_links_terms2`
--

DROP TABLE IF EXISTS `flock_finder_links_terms2`;
CREATE TABLE IF NOT EXISTS `flock_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_links_terms2`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_links_terms3`
--

DROP TABLE IF EXISTS `flock_finder_links_terms3`;
CREATE TABLE IF NOT EXISTS `flock_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_links_terms3`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_links_terms4`
--

DROP TABLE IF EXISTS `flock_finder_links_terms4`;
CREATE TABLE IF NOT EXISTS `flock_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_links_terms4`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_links_terms5`
--

DROP TABLE IF EXISTS `flock_finder_links_terms5`;
CREATE TABLE IF NOT EXISTS `flock_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_links_terms5`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_links_terms6`
--

DROP TABLE IF EXISTS `flock_finder_links_terms6`;
CREATE TABLE IF NOT EXISTS `flock_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_links_terms6`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_links_terms7`
--

DROP TABLE IF EXISTS `flock_finder_links_terms7`;
CREATE TABLE IF NOT EXISTS `flock_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_links_terms7`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_links_terms8`
--

DROP TABLE IF EXISTS `flock_finder_links_terms8`;
CREATE TABLE IF NOT EXISTS `flock_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_links_terms8`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_links_terms9`
--

DROP TABLE IF EXISTS `flock_finder_links_terms9`;
CREATE TABLE IF NOT EXISTS `flock_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_links_terms9`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_links_termsa`
--

DROP TABLE IF EXISTS `flock_finder_links_termsa`;
CREATE TABLE IF NOT EXISTS `flock_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_links_termsa`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_links_termsb`
--

DROP TABLE IF EXISTS `flock_finder_links_termsb`;
CREATE TABLE IF NOT EXISTS `flock_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_links_termsb`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_links_termsc`
--

DROP TABLE IF EXISTS `flock_finder_links_termsc`;
CREATE TABLE IF NOT EXISTS `flock_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_links_termsc`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_links_termsd`
--

DROP TABLE IF EXISTS `flock_finder_links_termsd`;
CREATE TABLE IF NOT EXISTS `flock_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_links_termsd`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_links_termse`
--

DROP TABLE IF EXISTS `flock_finder_links_termse`;
CREATE TABLE IF NOT EXISTS `flock_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_links_termse`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_links_termsf`
--

DROP TABLE IF EXISTS `flock_finder_links_termsf`;
CREATE TABLE IF NOT EXISTS `flock_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_links_termsf`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_taxonomy`
--

DROP TABLE IF EXISTS `flock_finder_taxonomy`;
CREATE TABLE IF NOT EXISTS `flock_finder_taxonomy` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `flock_finder_taxonomy`
--

INSERT INTO `flock_finder_taxonomy` (`id`, `parent_id`, `title`, `state`, `access`, `ordering`) VALUES
(1, 0, 'ROOT', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `flock_finder_taxonomy_map`;
CREATE TABLE IF NOT EXISTS `flock_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_taxonomy_map`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_terms`
--

DROP TABLE IF EXISTS `flock_finder_terms`;
CREATE TABLE IF NOT EXISTS `flock_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `flock_finder_terms`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_terms_common`
--

DROP TABLE IF EXISTS `flock_finder_terms_common`;
CREATE TABLE IF NOT EXISTS `flock_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_terms_common`
--

INSERT INTO `flock_finder_terms_common` (`term`, `language`) VALUES
('a', 'en'),
('about', 'en'),
('after', 'en'),
('ago', 'en'),
('all', 'en'),
('am', 'en'),
('an', 'en'),
('and', 'en'),
('ani', 'en'),
('any', 'en'),
('are', 'en'),
('aren''t', 'en'),
('as', 'en'),
('at', 'en'),
('be', 'en'),
('but', 'en'),
('by', 'en'),
('for', 'en'),
('from', 'en'),
('get', 'en'),
('go', 'en'),
('how', 'en'),
('if', 'en'),
('in', 'en'),
('into', 'en'),
('is', 'en'),
('isn''t', 'en'),
('it', 'en'),
('its', 'en'),
('me', 'en'),
('more', 'en'),
('most', 'en'),
('must', 'en'),
('my', 'en'),
('new', 'en'),
('no', 'en'),
('none', 'en'),
('not', 'en'),
('noth', 'en'),
('nothing', 'en'),
('of', 'en'),
('off', 'en'),
('often', 'en'),
('old', 'en'),
('on', 'en'),
('onc', 'en'),
('once', 'en'),
('onli', 'en'),
('only', 'en'),
('or', 'en'),
('other', 'en'),
('our', 'en'),
('ours', 'en'),
('out', 'en'),
('over', 'en'),
('page', 'en'),
('she', 'en'),
('should', 'en'),
('small', 'en'),
('so', 'en'),
('some', 'en'),
('than', 'en'),
('thank', 'en'),
('that', 'en'),
('the', 'en'),
('their', 'en'),
('theirs', 'en'),
('them', 'en'),
('then', 'en'),
('there', 'en'),
('these', 'en'),
('they', 'en'),
('this', 'en'),
('those', 'en'),
('thus', 'en'),
('time', 'en'),
('times', 'en'),
('to', 'en'),
('too', 'en'),
('true', 'en'),
('under', 'en'),
('until', 'en'),
('up', 'en'),
('upon', 'en'),
('use', 'en'),
('user', 'en'),
('users', 'en'),
('veri', 'en'),
('version', 'en'),
('very', 'en'),
('via', 'en'),
('want', 'en'),
('was', 'en'),
('way', 'en'),
('were', 'en'),
('what', 'en'),
('when', 'en'),
('where', 'en'),
('whi', 'en'),
('which', 'en'),
('who', 'en'),
('whom', 'en'),
('whose', 'en'),
('why', 'en'),
('wide', 'en'),
('will', 'en'),
('with', 'en'),
('within', 'en'),
('without', 'en'),
('would', 'en'),
('yes', 'en'),
('yet', 'en'),
('you', 'en'),
('your', 'en'),
('yours', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_tokens`
--

DROP TABLE IF EXISTS `flock_finder_tokens`;
CREATE TABLE IF NOT EXISTS `flock_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_tokens`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `flock_finder_tokens_aggregate`;
CREATE TABLE IF NOT EXISTS `flock_finder_tokens_aggregate` (
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
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_finder_tokens_aggregate`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_finder_types`
--

DROP TABLE IF EXISTS `flock_finder_types`;
CREATE TABLE IF NOT EXISTS `flock_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `flock_finder_types`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_languages`
--

DROP TABLE IF EXISTS `flock_languages`;
CREATE TABLE IF NOT EXISTS `flock_languages` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `flock_languages`
--

INSERT INTO `flock_languages` (`lang_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 'en-GB', 'English (UK)', 'English (UK)', 'en', 'en', '', '', '', '', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `flock_menu`
--

DROP TABLE IF EXISTS `flock_menu`;
CREATE TABLE IF NOT EXISTS `flock_menu` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105 ;

--
-- Dumping data for table `flock_menu`
--

INSERT INTO `flock_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, '', 0, '', 0, 53, 0, '*', 0),
(2, 'menu', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 0, 1, 1, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 1, 10, 0, '*', 1),
(3, 'menu', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1),
(4, 'menu', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&extension=com_banners', 'component', 0, 2, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1),
(5, 'menu', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1),
(6, 'menu', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 0, 2, 2, 4, 0, '0000-00-00 00:00:00', 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1),
(7, 'menu', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 0, 1, 1, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 11, 16, 0, '*', 1),
(8, 'menu', 'com_contact', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact', 'component', 0, 7, 2, 8, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact', 0, '', 12, 13, 0, '*', 1),
(9, 'menu', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&extension=com_contact', 'component', 0, 7, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:contact-cat', 0, '', 14, 15, 0, '*', 1),
(10, 'menu', 'com_messages', 'Messaging', '', 'Messaging', 'index.php?option=com_messages', 'component', 0, 1, 1, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages', 0, '', 17, 22, 0, '*', 1),
(11, 'menu', 'com_messages_add', 'New Private Message', '', 'Messaging/New Private Message', 'index.php?option=com_messages&task=message.add', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-add', 0, '', 18, 19, 0, '*', 1),
(12, 'menu', 'com_messages_read', 'Read Private Message', '', 'Messaging/Read Private Message', 'index.php?option=com_messages', 'component', 0, 10, 2, 15, 0, '0000-00-00 00:00:00', 0, 0, 'class:messages-read', 0, '', 20, 21, 0, '*', 1),
(13, 'menu', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 1, 1, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 23, 28, 0, '*', 1),
(14, 'menu', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds', 'component', 0, 13, 2, 17, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds', 0, '', 24, 25, 0, '*', 1),
(15, 'menu', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&extension=com_newsfeeds', 'component', 0, 13, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:newsfeeds-cat', 0, '', 26, 27, 0, '*', 1),
(16, 'menu', 'com_redirect', 'Redirect', '', 'Redirect', 'index.php?option=com_redirect', 'component', 0, 1, 1, 24, 0, '0000-00-00 00:00:00', 0, 0, 'class:redirect', 0, '', 29, 30, 0, '*', 1),
(17, 'menu', 'com_search', 'Basic Search', '', 'Basic Search', 'index.php?option=com_search', 'component', 0, 1, 1, 19, 0, '0000-00-00 00:00:00', 0, 0, 'class:search', 0, '', 31, 32, 0, '*', 1),
(18, 'menu', 'com_weblinks', 'Weblinks', '', 'Weblinks', 'index.php?option=com_weblinks', 'component', 0, 1, 1, 21, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 33, 38, 0, '*', 1),
(19, 'menu', 'com_weblinks_links', 'Links', '', 'Weblinks/Links', 'index.php?option=com_weblinks', 'component', 0, 18, 2, 21, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks', 0, '', 34, 35, 0, '*', 1),
(20, 'menu', 'com_weblinks_categories', 'Categories', '', 'Weblinks/Categories', 'index.php?option=com_categories&extension=com_weblinks', 'component', 0, 18, 2, 6, 0, '0000-00-00 00:00:00', 0, 0, 'class:weblinks-cat', 0, '', 36, 37, 0, '*', 1),
(21, 'menu', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 0, 1, 1, 27, 0, '0000-00-00 00:00:00', 0, 0, 'class:finder', 0, '', 39, 40, 0, '*', 1),
(22, 'menu', 'com_joomlaupdate', 'Joomla! Update', '', 'Joomla! Update', 'index.php?option=com_joomlaupdate', 'component', 0, 1, 1, 28, 0, '0000-00-00 00:00:00', 0, 0, 'class:joomlaupdate', 0, '', 41, 42, 0, '*', 1),
(23, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags', 'component', 0, 1, 1, 29, 0, '0000-00-00 00:00:00', 0, 1, 'class:tags', 0, '', 43, 44, 0, '', 1),
(101, 'mainmenu', 'Home', 'home', '', 'home', 'index.php?option=com_streams&view=streams&id=6', 'component', 1, 1, 1, 10009, 0, '0000-00-00 00:00:00', 0, 1, '', 0, '{"show_category_title":"","show_description":"","show_description_image":"","maxLevel":"","show_empty_categories":"","show_subcat_desc":"","show_cat_num_links":"","filter_field":"","show_pagination_limit":"","show_headings":"","show_link_description":"","show_link_hits":"","show_pagination":"2","show_pagination_results":"1","show_feed_link":"1","menu-anchor_title":"","menu-anchor_css":"","menu_image":"","menu_text":1,"page_title":"","show_page_heading":1,"page_heading":"","pageclass_sfx":"","menu-meta_description":"","menu-meta_keywords":"","robots":"","secure":0,"mootable":"0"}', 45, 46, 1, '*', 0),
(103, 'main', 'com_streams', 'com-streams', '', 'com-streams', 'index.php?option=com_streams', 'component', 0, 1, 1, 10009, 0, '0000-00-00 00:00:00', 0, 1, 'class:streams', 0, '', 49, 52, 0, '', 1),
(104, 'main', 'com_streams_items', 'com-streams-items', '', 'com-streams/com-streams-items', 'index.php?option=com_streams', 'component', 0, 103, 2, 10009, 0, '0000-00-00 00:00:00', 0, 1, 'class:streams', 0, '', 50, 51, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `flock_menu_types`
--

DROP TABLE IF EXISTS `flock_menu_types`;
CREATE TABLE IF NOT EXISTS `flock_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) NOT NULL,
  `title` varchar(48) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `flock_menu_types`
--

INSERT INTO `flock_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site');

-- --------------------------------------------------------

--
-- Table structure for table `flock_messages`
--

DROP TABLE IF EXISTS `flock_messages`;
CREATE TABLE IF NOT EXISTS `flock_messages` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `flock_messages`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_messages_cfg`
--

DROP TABLE IF EXISTS `flock_messages_cfg`;
CREATE TABLE IF NOT EXISTS `flock_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_messages_cfg`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_modules`
--

DROP TABLE IF EXISTS `flock_modules`;
CREATE TABLE IF NOT EXISTS `flock_modules` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=87 ;

--
-- Dumping data for table `flock_modules`
--

INSERT INTO `flock_modules` (`id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 'Main Menu', '', '', 1, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_menu', 1, 1, '{"menutype":"mainmenu","startLevel":"0","endLevel":"0","showAllChildren":"0","tag_id":"","class_sfx":"","window_open":"","layout":"","moduleclass_sfx":"_menu","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(2, 'Login', '', '', 1, 'login', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 'Popular Articles', '', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_popular', 3, 1, '{"count":"5","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(4, 'Recently Added Articles', '', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_latest', 3, 1, '{"count":"5","ordering":"c_dsc","catid":"","user_id":"0","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(8, 'Toolbar', '', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 'Quick Icons', '', '', 1, 'icon', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_quickicon', 3, 1, '', 1, '*'),
(10, 'Logged-in Users', '', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_logged', 3, 1, '{"count":"5","name":"1","layout":"_:default","moduleclass_sfx":"","cache":"0","automatic_title":"1"}', 1, '*'),
(12, 'Admin Menu', '', '', 1, 'menu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_menu', 3, 1, '{"layout":"","moduleclass_sfx":"","shownew":"1","showhelp":"1","cache":"0"}', 1, '*'),
(13, 'Admin Submenu', '', '', 1, 'submenu', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_submenu', 3, 1, '', 1, '*'),
(14, 'User Status', '', '', 2, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_status', 3, 1, '', 1, '*'),
(15, 'Title', '', '', 1, 'title', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 'Login Form', '', '', 7, 'position-7', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_login', 1, 1, '{"greeting":"1","name":"0"}', 0, '*'),
(17, 'Breadcrumbs', '', '', 1, 'position-2', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_breadcrumbs', 1, 1, '{"moduleclass_sfx":"","showHome":"1","homeText":"Home","showComponent":"1","separator":"","cache":"1","cache_time":"900","cachemode":"itemid"}', 0, '*'),
(79, 'Multilanguage status', '', '', 1, 'status', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 'mod_multilangstatus', 3, 1, '{"layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*'),
(86, 'Joomla Version', '', '', 1, 'footer', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'mod_version', 3, 1, '{"format":"short","product":"1","layout":"_:default","moduleclass_sfx":"","cache":"0"}', 1, '*');

-- --------------------------------------------------------

--
-- Table structure for table `flock_modules_menu`
--

DROP TABLE IF EXISTS `flock_modules_menu`;
CREATE TABLE IF NOT EXISTS `flock_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_modules_menu`
--

INSERT INTO `flock_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(86, 0);

-- --------------------------------------------------------

--
-- Table structure for table `flock_newsfeeds`
--

DROP TABLE IF EXISTS `flock_newsfeeds`;
CREATE TABLE IF NOT EXISTS `flock_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `link` varchar(200) NOT NULL DEFAULT '',
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
  `description` text NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `flock_newsfeeds`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_overrider`
--

DROP TABLE IF EXISTS `flock_overrider`;
CREATE TABLE IF NOT EXISTS `flock_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) NOT NULL,
  `string` text NOT NULL,
  `file` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `flock_overrider`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_redirect_links`
--

DROP TABLE IF EXISTS `flock_redirect_links`;
CREATE TABLE IF NOT EXISTS `flock_redirect_links` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `flock_redirect_links`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_schemas`
--

DROP TABLE IF EXISTS `flock_schemas`;
CREATE TABLE IF NOT EXISTS `flock_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_schemas`
--

INSERT INTO `flock_schemas` (`extension_id`, `version_id`) VALUES
(700, '3.1.5');

-- --------------------------------------------------------

--
-- Table structure for table `flock_session`
--

DROP TABLE IF EXISTS `flock_session`;
CREATE TABLE IF NOT EXISTS `flock_session` (
  `session_id` varchar(200) NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) DEFAULT '',
  `data` mediumtext,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_session`
--

INSERT INTO `flock_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
('l45rnjdrqtvkpssi9m49vipvt7', 1, 0, '1379495454', '__default|a:8:{s:15:"session.counter";i:49;s:19:"session.timer.start";i:1379488966;s:18:"session.timer.last";i:1379495454;s:17:"session.timer.now";i:1379495454;s:22:"session.client.browser";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.62 Safari/537.36";s:8:"registry";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":4:{s:11:"application";O:8:"stdClass":1:{s:4:"lang";s:0:"";}s:13:"com_installer";O:8:"stdClass":2:{s:7:"message";s:0:"";s:17:"extension_message";s:0:"";}s:11:"com_streams";O:8:"stdClass":1:{s:7:"streams";O:8:"stdClass":4:{s:6:"filter";O:8:"stdClass":2:{s:5:"state";s:1:"1";s:3:"api";s:6:"github";}s:10:"limitstart";i:0;s:8:"ordercol";s:14:"a.date_created";s:9:"orderdirn";s:4:"desc";}}s:6:"global";O:8:"stdClass":1:{s:4:"list";O:8:"stdClass":1:{s:5:"limit";i:20;}}}}s:4:"user";O:5:"JUser":24:{s:9:"\\0\\0\\0isRoot";b:1;s:2:"id";s:3:"623";s:4:"name";s:10:"Super User";s:8:"username";s:11:"babsgosgens";s:5:"email";s:22:"babs@crossinghippos.nl";s:8:"password";s:65:"5d6bbe9a857e194a3a63167eb861c8d6:vvZG3UYTXlWKftqNhnnQ4RSTG79PUhHH";s:14:"password_clear";s:0:"";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:12:"registerDate";s:19:"2013-09-13 11:16:48";s:13:"lastvisitDate";s:19:"2013-09-17 16:17:48";s:10:"activation";s:1:"0";s:6:"params";s:92:"{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}";s:6:"groups";a:1:{i:8;s:1:"8";}s:5:"guest";i:0;s:13:"lastResetTime";s:19:"0000-00-00 00:00:00";s:10:"resetCount";s:1:"0";s:10:"\\0\\0\\0_params";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":6:{s:11:"admin_style";s:0:"";s:14:"admin_language";s:0:"";s:8:"language";s:0:"";s:6:"editor";s:0:"";s:8:"helpsite";s:0:"";s:8:"timezone";s:0:"";}}s:14:"\\0\\0\\0_authGroups";a:2:{i:0;i:1;i:1;i:8;}s:14:"\\0\\0\\0_authLevels";a:4:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;}s:15:"\\0\\0\\0_authActions";N;s:12:"\\0\\0\\0_errorMsg";N;s:10:"\\0\\0\\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"717e9fddb263f41820109da6f47d27ef";}', 623, 'babsgosgens'),
('tdeehpjfn6jp15035e5mjjaqj3', 0, 1, '1379495456', '__default|a:7:{s:15:"session.counter";i:27;s:19:"session.timer.start";i:1379489381;s:18:"session.timer.last";i:1379494724;s:17:"session.timer.now";i:1379495456;s:22:"session.client.browser";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.62 Safari/537.36";s:8:"registry";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":1:{s:11:"com_streams";O:8:"stdClass":1:{s:7:"streams";O:8:"stdClass":2:{s:8:"ordercol";N;s:10:"limitstart";s:1:"0";}}}}s:4:"user";O:5:"JUser":24:{s:9:"\\0\\0\\0isRoot";N;s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:5:"block";N;s:9:"sendEmail";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:6:"groups";a:1:{i:0;s:1:"9";}s:5:"guest";i:1;s:13:"lastResetTime";N;s:10:"resetCount";N;s:10:"\\0\\0\\0_params";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":0:{}}s:14:"\\0\\0\\0_authGroups";N;s:14:"\\0\\0\\0_authLevels";a:3:{i:0;i:1;i:1;i:1;i:2;i:5;}s:15:"\\0\\0\\0_authActions";N;s:12:"\\0\\0\\0_errorMsg";N;s:10:"\\0\\0\\0_errors";a:0:{}s:3:"aid";i:0;}}', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `flock_streams`
--

DROP TABLE IF EXISTS `flock_streams`;
CREATE TABLE IF NOT EXISTS `flock_streams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `api_id` tinyint(2) NOT NULL,
  `post_id` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL,
  `raw` text NOT NULL,
  `metadata` text NOT NULL,
  `permalink` text NOT NULL,
  `params` text NOT NULL,
  `language` char(7) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`api_id`,`post_id`),
  UNIQUE KEY `id` (`id`),
  KEY `api_id` (`api_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

--
-- Dumping data for table `flock_streams`
--

INSERT INTO `flock_streams` (`id`, `api_id`, `post_id`, `date_created`, `raw`, `metadata`, `permalink`, `params`, `language`, `state`, `publish_up`, `publish_down`) VALUES
(31, 1, '361485006050299906', '2013-07-28 13:55:16', 'Tzo4OiJzdGRDbGFzcyI6MjI6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IlN1biBKdWwgMjggMTM6NTU6MTYgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNjE0ODUwMDYwNTAyOTk5MDY7czo2OiJpZF9zdHIiO3M6MTg6IjM2MTQ4NTAwNjA1MDI5OTkwNiI7czo0OiJ0ZXh0IjtzOjMyOiJAYmV0d2VlbmJyYWluIEBuaWdodHNoaWZ0YyByb3RmbCI7czo2OiJzb3VyY2UiO3M6ODI6IjxhIGhyZWY9Imh0dHA6Ly90d2l0dGVyLmNvbS9kb3dubG9hZC9pcGhvbmUiIHJlbD0ibm9mb2xsb3ciPlR3aXR0ZXIgZm9yIGlQaG9uZTwvYT4iO3M6OToidHJ1bmNhdGVkIjtiOjA7czoyMToiaW5fcmVwbHlfdG9fc3RhdHVzX2lkIjtpOjM2MTI1ODk0MjkwNDU0NTI4MDtzOjI1OiJpbl9yZXBseV90b19zdGF0dXNfaWRfc3RyIjtzOjE4OiIzNjEyNTg5NDI5MDQ1NDUyODAiO3M6MTk6ImluX3JlcGx5X3RvX3VzZXJfaWQiO2k6MTgwNDI2ODk7czoyMzoiaW5fcmVwbHlfdG9fdXNlcl9pZF9zdHIiO3M6ODoiMTgwNDI2ODkiO3M6MjM6ImluX3JlcGx5X3RvX3NjcmVlbl9uYW1lIjtzOjEyOiJiZXR3ZWVuYnJhaW4iO3M6NDoidXNlciI7Tzo4OiJzdGRDbGFzcyI6Mzg6e3M6MjoiaWQiO2k6MTEwMTA3NTcyO3M6NjoiaWRfc3RyIjtzOjk6IjExMDEwNzU3MiI7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjExOiJzY3JlZW5fbmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6ODoibG9jYXRpb24iO3M6ODoiUm9zbWFsZW4iO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjEzNjoiKFdlYilkZXNpZ25lciBhbmQgZGV2ZWxvcGVyLCBzdHViYm9ybiBhcyBoZWxsLCBhbHdheXMgcXVlc3Rpb25pbmcgZXZlcnl0aGluZy4gTGlrZXMgdG8gcmUtaW52ZW50IHRoZSB3aGVlbCB0byBzZWUgaWYgaXQgY2FuIGJlIGFwcHJvdmVkLiI7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL21WeUd5Q3pUU2MiO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjI6e3M6MzoidXJsIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6InVybHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjQ6e3M6MzoidXJsIjtzOjIyOiJodHRwOi8vdC5jby9tVnlHeUN6VFNjIjtzOjEyOiJleHBhbmRlZF91cmwiO3M6MjQ6Imh0dHA6Ly9jcm9zc2luZ2hpcHBvcy5ubCI7czoxMToiZGlzcGxheV91cmwiO3M6MTc6ImNyb3NzaW5naGlwcG9zLm5sIjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6MDtpOjE7aToyMjt9fX19czoxMToiZGVzY3JpcHRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NDoidXJscyI7YTowOnt9fX1zOjk6InByb3RlY3RlZCI7YjowO3M6MTU6ImZvbGxvd2Vyc19jb3VudCI7aToyMDM7czoxMzoiZnJpZW5kc19jb3VudCI7aToxNzU7czoxMjoibGlzdGVkX2NvdW50IjtpOjEzO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IlN1biBKYW4gMzEgMTA6NDk6NDcgKzAwMDAgMjAxMCI7czoxNjoiZmF2b3VyaXRlc19jb3VudCI7aTo2OTtzOjEwOiJ1dGNfb2Zmc2V0IjtpOi03MjAwO3M6OToidGltZV96b25lIjtzOjk6IkdyZWVubGFuZCI7czoxMToiZ2VvX2VuYWJsZWQiO2I6MTtzOjg6InZlcmlmaWVkIjtiOjA7czoxNDoic3RhdHVzZXNfY291bnQiO2k6MTEzNDtzOjQ6ImxhbmciO3M6MjoiZW4iO3M6MjA6ImNvbnRyaWJ1dG9yc19lbmFibGVkIjtiOjA7czoxMzoiaXNfdHJhbnNsYXRvciI7YjowO3M6MjQ6InByb2ZpbGVfYmFja2dyb3VuZF9jb2xvciI7czo2OiIxMzE1MTYiO3M6Mjg6InByb2ZpbGVfYmFja2dyb3VuZF9pbWFnZV91cmwiO3M6OTI6Imh0dHA6Ly9hMC50d2ltZy5jb20vcHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlcy8yNTIwNDEwNTUveGM1ZTA2YWFjOWZiMTY0YmQ5Mjc1MWJjMDQ0N2IzZWIucG5nIjtzOjM0OiJwcm9maWxlX2JhY2tncm91bmRfaW1hZ2VfdXJsX2h0dHBzIjtzOjk0OiJodHRwczovL3NpMC50d2ltZy5jb20vcHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlcy8yNTIwNDEwNTUveGM1ZTA2YWFjOWZiMTY0YmQ5Mjc1MWJjMDQ0N2IzZWIucG5nIjtzOjIzOiJwcm9maWxlX2JhY2tncm91bmRfdGlsZSI7YjoxO3M6MTc6InByb2ZpbGVfaW1hZ2VfdXJsIjtzOjYyOiJodHRwOi8vYTAudHdpbWcuY29tL3Byb2ZpbGVfaW1hZ2VzLzEzNTAzMjA5NTIvamFiMTFfbm9ybWFsLnBuZyI7czoyMzoicHJvZmlsZV9pbWFnZV91cmxfaHR0cHMiO3M6NjQ6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2ltYWdlcy8xMzUwMzIwOTUyL2phYjExX25vcm1hbC5wbmciO3M6MTg6InByb2ZpbGVfbGlua19jb2xvciI7czo2OiIwMDk5OTkiO3M6Mjg6InByb2ZpbGVfc2lkZWJhcl9ib3JkZXJfY29sb3IiO3M6NjoiRUVFRUVFIjtzOjI2OiJwcm9maWxlX3NpZGViYXJfZmlsbF9jb2xvciI7czo2OiJFRkVGRUYiO3M6MTg6InByb2ZpbGVfdGV4dF9jb2xvciI7czo2OiIwMDAwMDAiO3M6Mjg6InByb2ZpbGVfdXNlX2JhY2tncm91bmRfaW1hZ2UiO2I6MDtzOjE1OiJkZWZhdWx0X3Byb2ZpbGUiO2I6MDtzOjIxOiJkZWZhdWx0X3Byb2ZpbGVfaW1hZ2UiO2I6MDtzOjk6ImZvbGxvd2luZyI7YjowO3M6MTk6ImZvbGxvd19yZXF1ZXN0X3NlbnQiO2I6MDtzOjEzOiJub3RpZmljYXRpb25zIjtiOjA7fXM6MzoiZ2VvIjtOO3M6MTE6ImNvb3JkaW5hdGVzIjtOO3M6NToicGxhY2UiO047czoxMjoiY29udHJpYnV0b3JzIjtOO3M6MTM6InJldHdlZXRfY291bnQiO2k6MDtzOjE0OiJmYXZvcml0ZV9jb3VudCI7aTowO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoiaGFzaHRhZ3MiO2E6MDp7fXM6Nzoic3ltYm9scyI7YTowOnt9czo0OiJ1cmxzIjthOjA6e31zOjEzOiJ1c2VyX21lbnRpb25zIjthOjI6e2k6MDtPOjg6InN0ZENsYXNzIjo1OntzOjExOiJzY3JlZW5fbmFtZSI7czoxMjoiYmV0d2VlbmJyYWluIjtzOjQ6Im5hbWUiO3M6MTI6ImJldHdlZW5icmFpbiI7czoyOiJpZCI7aToxODA0MjY4OTtzOjY6ImlkX3N0ciI7czo4OiIxODA0MjY4OSI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjA7aToxO2k6MTM7fX1pOjE7Tzo4OiJzdGRDbGFzcyI6NTp7czoxMToic2NyZWVuX25hbWUiO3M6MTE6Im5pZ2h0c2hpZnRjIjtzOjQ6Im5hbWUiO3M6MTU6IkNyaXN0aW5hIFNvbGFuYSI7czoyOiJpZCI7aToxODg2ODYwNztzOjY6ImlkX3N0ciI7czo4OiIxODg2ODYwNyI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjE0O2k6MTtpOjI2O319fX1zOjk6ImZhdm9yaXRlZCI7YjowO3M6OToicmV0d2VldGVkIjtiOjA7czo0OiJsYW5nIjtzOjI6ImRlIjt9', '', 'https://twitter.com/babsgosgens/status/361485006050299906', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 1, '366915293664133122', '2013-08-12 13:33:17', 'Tzo4OiJzdGRDbGFzcyI6MjI6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6Ik1vbiBBdWcgMTIgMTM6MzM6MTcgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNjY5MTUyOTM2NjQxMzMxMjI7czo2OiJpZF9zdHIiO3M6MTg6IjM2NjkxNTI5MzY2NDEzMzEyMiI7czo0OiJ0ZXh0IjtzOjQ4OiJAbmlnaHRzaGlmdGMgbm93IHdoZXJlIGhhdmUgSSBoZWFyZCB0aGF0IGJlZm9yZT8iO3M6Njoic291cmNlIjtzOjgyOiI8YSBocmVmPSJodHRwOi8vdHdpdHRlci5jb20vZG93bmxvYWQvaXBob25lIiByZWw9Im5vZm9sbG93Ij5Ud2l0dGVyIGZvciBpUGhvbmU8L2E+IjtzOjk6InRydW5jYXRlZCI7YjowO3M6MjE6ImluX3JlcGx5X3RvX3N0YXR1c19pZCI7aTozNjY5MTE4MTE1ODIzMTI0NDk7czoyNToiaW5fcmVwbHlfdG9fc3RhdHVzX2lkX3N0ciI7czoxODoiMzY2OTExODExNTgyMzEyNDQ5IjtzOjE5OiJpbl9yZXBseV90b191c2VyX2lkIjtpOjE4ODY4NjA3O3M6MjM6ImluX3JlcGx5X3RvX3VzZXJfaWRfc3RyIjtzOjg6IjE4ODY4NjA3IjtzOjIzOiJpbl9yZXBseV90b19zY3JlZW5fbmFtZSI7czoxMToibmlnaHRzaGlmdGMiO3M6NDoidXNlciI7Tzo4OiJzdGRDbGFzcyI6Mzg6e3M6MjoiaWQiO2k6MTEwMTA3NTcyO3M6NjoiaWRfc3RyIjtzOjk6IjExMDEwNzU3MiI7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjExOiJzY3JlZW5fbmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6ODoibG9jYXRpb24iO3M6ODoiUm9zbWFsZW4iO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjEzNjoiKFdlYilkZXNpZ25lciBhbmQgZGV2ZWxvcGVyLCBzdHViYm9ybiBhcyBoZWxsLCBhbHdheXMgcXVlc3Rpb25pbmcgZXZlcnl0aGluZy4gTGlrZXMgdG8gcmUtaW52ZW50IHRoZSB3aGVlbCB0byBzZWUgaWYgaXQgY2FuIGJlIGFwcHJvdmVkLiI7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL21WeUd5Q3pUU2MiO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjI6e3M6MzoidXJsIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6InVybHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjQ6e3M6MzoidXJsIjtzOjIyOiJodHRwOi8vdC5jby9tVnlHeUN6VFNjIjtzOjEyOiJleHBhbmRlZF91cmwiO3M6MjQ6Imh0dHA6Ly9jcm9zc2luZ2hpcHBvcy5ubCI7czoxMToiZGlzcGxheV91cmwiO3M6MTc6ImNyb3NzaW5naGlwcG9zLm5sIjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6MDtpOjE7aToyMjt9fX19czoxMToiZGVzY3JpcHRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NDoidXJscyI7YTowOnt9fX1zOjk6InByb3RlY3RlZCI7YjowO3M6MTU6ImZvbGxvd2Vyc19jb3VudCI7aToyMDM7czoxMzoiZnJpZW5kc19jb3VudCI7aToxNzU7czoxMjoibGlzdGVkX2NvdW50IjtpOjEzO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IlN1biBKYW4gMzEgMTA6NDk6NDcgKzAwMDAgMjAxMCI7czoxNjoiZmF2b3VyaXRlc19jb3VudCI7aTo2OTtzOjEwOiJ1dGNfb2Zmc2V0IjtpOi03MjAwO3M6OToidGltZV96b25lIjtzOjk6IkdyZWVubGFuZCI7czoxMToiZ2VvX2VuYWJsZWQiO2I6MTtzOjg6InZlcmlmaWVkIjtiOjA7czoxNDoic3RhdHVzZXNfY291bnQiO2k6MTEzNDtzOjQ6ImxhbmciO3M6MjoiZW4iO3M6MjA6ImNvbnRyaWJ1dG9yc19lbmFibGVkIjtiOjA7czoxMzoiaXNfdHJhbnNsYXRvciI7YjowO3M6MjQ6InByb2ZpbGVfYmFja2dyb3VuZF9jb2xvciI7czo2OiIxMzE1MTYiO3M6Mjg6InByb2ZpbGVfYmFja2dyb3VuZF9pbWFnZV91cmwiO3M6OTI6Imh0dHA6Ly9hMC50d2ltZy5jb20vcHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlcy8yNTIwNDEwNTUveGM1ZTA2YWFjOWZiMTY0YmQ5Mjc1MWJjMDQ0N2IzZWIucG5nIjtzOjM0OiJwcm9maWxlX2JhY2tncm91bmRfaW1hZ2VfdXJsX2h0dHBzIjtzOjk0OiJodHRwczovL3NpMC50d2ltZy5jb20vcHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlcy8yNTIwNDEwNTUveGM1ZTA2YWFjOWZiMTY0YmQ5Mjc1MWJjMDQ0N2IzZWIucG5nIjtzOjIzOiJwcm9maWxlX2JhY2tncm91bmRfdGlsZSI7YjoxO3M6MTc6InByb2ZpbGVfaW1hZ2VfdXJsIjtzOjYyOiJodHRwOi8vYTAudHdpbWcuY29tL3Byb2ZpbGVfaW1hZ2VzLzEzNTAzMjA5NTIvamFiMTFfbm9ybWFsLnBuZyI7czoyMzoicHJvZmlsZV9pbWFnZV91cmxfaHR0cHMiO3M6NjQ6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2ltYWdlcy8xMzUwMzIwOTUyL2phYjExX25vcm1hbC5wbmciO3M6MTg6InByb2ZpbGVfbGlua19jb2xvciI7czo2OiIwMDk5OTkiO3M6Mjg6InByb2ZpbGVfc2lkZWJhcl9ib3JkZXJfY29sb3IiO3M6NjoiRUVFRUVFIjtzOjI2OiJwcm9maWxlX3NpZGViYXJfZmlsbF9jb2xvciI7czo2OiJFRkVGRUYiO3M6MTg6InByb2ZpbGVfdGV4dF9jb2xvciI7czo2OiIwMDAwMDAiO3M6Mjg6InByb2ZpbGVfdXNlX2JhY2tncm91bmRfaW1hZ2UiO2I6MDtzOjE1OiJkZWZhdWx0X3Byb2ZpbGUiO2I6MDtzOjIxOiJkZWZhdWx0X3Byb2ZpbGVfaW1hZ2UiO2I6MDtzOjk6ImZvbGxvd2luZyI7YjowO3M6MTk6ImZvbGxvd19yZXF1ZXN0X3NlbnQiO2I6MDtzOjEzOiJub3RpZmljYXRpb25zIjtiOjA7fXM6MzoiZ2VvIjtOO3M6MTE6ImNvb3JkaW5hdGVzIjtOO3M6NToicGxhY2UiO047czoxMjoiY29udHJpYnV0b3JzIjtOO3M6MTM6InJldHdlZXRfY291bnQiO2k6MDtzOjE0OiJmYXZvcml0ZV9jb3VudCI7aTowO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoiaGFzaHRhZ3MiO2E6MDp7fXM6Nzoic3ltYm9scyI7YTowOnt9czo0OiJ1cmxzIjthOjA6e31zOjEzOiJ1c2VyX21lbnRpb25zIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjo1OntzOjExOiJzY3JlZW5fbmFtZSI7czoxMToibmlnaHRzaGlmdGMiO3M6NDoibmFtZSI7czoxNToiQ3Jpc3RpbmEgU29sYW5hIjtzOjI6ImlkIjtpOjE4ODY4NjA3O3M6NjoiaWRfc3RyIjtzOjg6IjE4ODY4NjA3IjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6MDtpOjE7aToxMjt9fX19czo5OiJmYXZvcml0ZWQiO2I6MDtzOjk6InJldHdlZXRlZCI7YjowO3M6NDoibGFuZyI7czoyOiJlbiI7fQ==', '', 'https://twitter.com/babsgosgens/status/366915293664133122', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 1, '367286034553663488', '2013-08-13 14:06:29', 'Tzo4OiJzdGRDbGFzcyI6MjI6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IlR1ZSBBdWcgMTMgMTQ6MDY6MjkgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNjcyODYwMzQ1NTM2NjM0ODg7czo2OiJpZF9zdHIiO3M6MTg6IjM2NzI4NjAzNDU1MzY2MzQ4OCI7czo0OiJ0ZXh0IjtzOjY2OiJATXl0aDcyMCBAbmlnaHRzaGlmdGMgbm90ZSB0byBzZWxmOiBzaG93IHRoaXMgdHdlZXQgdG8gQGphbmdvc2dlbnMiO3M6Njoic291cmNlIjtzOjgyOiI8YSBocmVmPSJodHRwOi8vdHdpdHRlci5jb20vZG93bmxvYWQvaXBob25lIiByZWw9Im5vZm9sbG93Ij5Ud2l0dGVyIGZvciBpUGhvbmU8L2E+IjtzOjk6InRydW5jYXRlZCI7YjowO3M6MjE6ImluX3JlcGx5X3RvX3N0YXR1c19pZCI7aTozNjcyNjc3NjYyMTY0NDE4NTY7czoyNToiaW5fcmVwbHlfdG9fc3RhdHVzX2lkX3N0ciI7czoxODoiMzY3MjY3NzY2MjE2NDQxODU2IjtzOjE5OiJpbl9yZXBseV90b191c2VyX2lkIjtpOjUxMzg5MDkyNTtzOjIzOiJpbl9yZXBseV90b191c2VyX2lkX3N0ciI7czo5OiI1MTM4OTA5MjUiO3M6MjM6ImluX3JlcGx5X3RvX3NjcmVlbl9uYW1lIjtzOjc6Ik15dGg3MjAiO3M6NDoidXNlciI7Tzo4OiJzdGRDbGFzcyI6Mzg6e3M6MjoiaWQiO2k6MTEwMTA3NTcyO3M6NjoiaWRfc3RyIjtzOjk6IjExMDEwNzU3MiI7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjExOiJzY3JlZW5fbmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6ODoibG9jYXRpb24iO3M6ODoiUm9zbWFsZW4iO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjEzNjoiKFdlYilkZXNpZ25lciBhbmQgZGV2ZWxvcGVyLCBzdHViYm9ybiBhcyBoZWxsLCBhbHdheXMgcXVlc3Rpb25pbmcgZXZlcnl0aGluZy4gTGlrZXMgdG8gcmUtaW52ZW50IHRoZSB3aGVlbCB0byBzZWUgaWYgaXQgY2FuIGJlIGFwcHJvdmVkLiI7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL21WeUd5Q3pUU2MiO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjI6e3M6MzoidXJsIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6InVybHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjQ6e3M6MzoidXJsIjtzOjIyOiJodHRwOi8vdC5jby9tVnlHeUN6VFNjIjtzOjEyOiJleHBhbmRlZF91cmwiO3M6MjQ6Imh0dHA6Ly9jcm9zc2luZ2hpcHBvcy5ubCI7czoxMToiZGlzcGxheV91cmwiO3M6MTc6ImNyb3NzaW5naGlwcG9zLm5sIjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6MDtpOjE7aToyMjt9fX19czoxMToiZGVzY3JpcHRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NDoidXJscyI7YTowOnt9fX1zOjk6InByb3RlY3RlZCI7YjowO3M6MTU6ImZvbGxvd2Vyc19jb3VudCI7aToyMDM7czoxMzoiZnJpZW5kc19jb3VudCI7aToxNzU7czoxMjoibGlzdGVkX2NvdW50IjtpOjEzO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IlN1biBKYW4gMzEgMTA6NDk6NDcgKzAwMDAgMjAxMCI7czoxNjoiZmF2b3VyaXRlc19jb3VudCI7aTo2OTtzOjEwOiJ1dGNfb2Zmc2V0IjtpOi03MjAwO3M6OToidGltZV96b25lIjtzOjk6IkdyZWVubGFuZCI7czoxMToiZ2VvX2VuYWJsZWQiO2I6MTtzOjg6InZlcmlmaWVkIjtiOjA7czoxNDoic3RhdHVzZXNfY291bnQiO2k6MTEzNDtzOjQ6ImxhbmciO3M6MjoiZW4iO3M6MjA6ImNvbnRyaWJ1dG9yc19lbmFibGVkIjtiOjA7czoxMzoiaXNfdHJhbnNsYXRvciI7YjowO3M6MjQ6InByb2ZpbGVfYmFja2dyb3VuZF9jb2xvciI7czo2OiIxMzE1MTYiO3M6Mjg6InByb2ZpbGVfYmFja2dyb3VuZF9pbWFnZV91cmwiO3M6OTI6Imh0dHA6Ly9hMC50d2ltZy5jb20vcHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlcy8yNTIwNDEwNTUveGM1ZTA2YWFjOWZiMTY0YmQ5Mjc1MWJjMDQ0N2IzZWIucG5nIjtzOjM0OiJwcm9maWxlX2JhY2tncm91bmRfaW1hZ2VfdXJsX2h0dHBzIjtzOjk0OiJodHRwczovL3NpMC50d2ltZy5jb20vcHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlcy8yNTIwNDEwNTUveGM1ZTA2YWFjOWZiMTY0YmQ5Mjc1MWJjMDQ0N2IzZWIucG5nIjtzOjIzOiJwcm9maWxlX2JhY2tncm91bmRfdGlsZSI7YjoxO3M6MTc6InByb2ZpbGVfaW1hZ2VfdXJsIjtzOjYyOiJodHRwOi8vYTAudHdpbWcuY29tL3Byb2ZpbGVfaW1hZ2VzLzEzNTAzMjA5NTIvamFiMTFfbm9ybWFsLnBuZyI7czoyMzoicHJvZmlsZV9pbWFnZV91cmxfaHR0cHMiO3M6NjQ6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2ltYWdlcy8xMzUwMzIwOTUyL2phYjExX25vcm1hbC5wbmciO3M6MTg6InByb2ZpbGVfbGlua19jb2xvciI7czo2OiIwMDk5OTkiO3M6Mjg6InByb2ZpbGVfc2lkZWJhcl9ib3JkZXJfY29sb3IiO3M6NjoiRUVFRUVFIjtzOjI2OiJwcm9maWxlX3NpZGViYXJfZmlsbF9jb2xvciI7czo2OiJFRkVGRUYiO3M6MTg6InByb2ZpbGVfdGV4dF9jb2xvciI7czo2OiIwMDAwMDAiO3M6Mjg6InByb2ZpbGVfdXNlX2JhY2tncm91bmRfaW1hZ2UiO2I6MDtzOjE1OiJkZWZhdWx0X3Byb2ZpbGUiO2I6MDtzOjIxOiJkZWZhdWx0X3Byb2ZpbGVfaW1hZ2UiO2I6MDtzOjk6ImZvbGxvd2luZyI7YjowO3M6MTk6ImZvbGxvd19yZXF1ZXN0X3NlbnQiO2I6MDtzOjEzOiJub3RpZmljYXRpb25zIjtiOjA7fXM6MzoiZ2VvIjtOO3M6MTE6ImNvb3JkaW5hdGVzIjtOO3M6NToicGxhY2UiO047czoxMjoiY29udHJpYnV0b3JzIjtOO3M6MTM6InJldHdlZXRfY291bnQiO2k6MDtzOjE0OiJmYXZvcml0ZV9jb3VudCI7aTowO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoiaGFzaHRhZ3MiO2E6MDp7fXM6Nzoic3ltYm9scyI7YTowOnt9czo0OiJ1cmxzIjthOjA6e31zOjEzOiJ1c2VyX21lbnRpb25zIjthOjM6e2k6MDtPOjg6InN0ZENsYXNzIjo1OntzOjExOiJzY3JlZW5fbmFtZSI7czo3OiJNeXRoNzIwIjtzOjQ6Im5hbWUiO3M6MTM6Ik1hcnRpbiBSaXZlcmEiO3M6MjoiaWQiO2k6NTEzODkwOTI1O3M6NjoiaWRfc3RyIjtzOjk6IjUxMzg5MDkyNSI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjA7aToxO2k6ODt9fWk6MTtPOjg6InN0ZENsYXNzIjo1OntzOjExOiJzY3JlZW5fbmFtZSI7czoxMToibmlnaHRzaGlmdGMiO3M6NDoibmFtZSI7czoxNToiQ3Jpc3RpbmEgU29sYW5hIjtzOjI6ImlkIjtpOjE4ODY4NjA3O3M6NjoiaWRfc3RyIjtzOjg6IjE4ODY4NjA3IjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6OTtpOjE7aToyMTt9fWk6MjtPOjg6InN0ZENsYXNzIjo1OntzOjExOiJzY3JlZW5fbmFtZSI7czoxMDoiamFuZ29zZ2VucyI7czo0OiJuYW1lIjtzOjEyOiJKYW4gR8O2c2dlbnMiO3M6MjoiaWQiO2k6MTEwOTQ1MDg1O3M6NjoiaWRfc3RyIjtzOjk6IjExMDk0NTA4NSI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjU1O2k6MTtpOjY2O319fX1zOjk6ImZhdm9yaXRlZCI7YjowO3M6OToicmV0d2VldGVkIjtiOjA7czo0OiJsYW5nIjtzOjI6ImVuIjt9', '', 'https://twitter.com/babsgosgens/status/367286034553663488', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 1, '367910337594789888', '2013-08-15 07:27:14', 'Tzo4OiJzdGRDbGFzcyI6MjQ6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IlRodSBBdWcgMTUgMDc6Mjc6MTQgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNjc5MTAzMzc1OTQ3ODk4ODg7czo2OiJpZF9zdHIiO3M6MTg6IjM2NzkxMDMzNzU5NDc4OTg4OCI7czo0OiJ0ZXh0IjtzOjEwNjoiUlQgQHlpcmVvOiAjam9vbWxhIEJvb3RzdHJhcCBBY2NvcmRpb24gbWVudSBieSB5aXJlbyBodHRwOi8vdC5jby9RU2dVcVpKNVpWIHNpbXBsZSB5ZXQgYmVhdXRpZnVsLCBhbmQgZnJlZSI7czo2OiJzb3VyY2UiO3M6ODI6IjxhIGhyZWY9Imh0dHA6Ly90d2l0dGVyLmNvbS9kb3dubG9hZC9pcGhvbmUiIHJlbD0ibm9mb2xsb3ciPlR3aXR0ZXIgZm9yIGlQaG9uZTwvYT4iO3M6OToidHJ1bmNhdGVkIjtiOjA7czoyMToiaW5fcmVwbHlfdG9fc3RhdHVzX2lkIjtOO3M6MjU6ImluX3JlcGx5X3RvX3N0YXR1c19pZF9zdHIiO047czoxOToiaW5fcmVwbHlfdG9fdXNlcl9pZCI7TjtzOjIzOiJpbl9yZXBseV90b191c2VyX2lkX3N0ciI7TjtzOjIzOiJpbl9yZXBseV90b19zY3JlZW5fbmFtZSI7TjtzOjQ6InVzZXIiO086ODoic3RkQ2xhc3MiOjM4OntzOjI6ImlkIjtpOjExMDEwNzU3MjtzOjY6ImlkX3N0ciI7czo5OiIxMTAxMDc1NzIiO3M6NDoibmFtZSI7czoxMzoiQmFicyBHw7ZzZ2VucyI7czoxMToic2NyZWVuX25hbWUiO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjg6ImxvY2F0aW9uIjtzOjg6IlJvc21hbGVuIjtzOjExOiJkZXNjcmlwdGlvbiI7czoxMzY6IihXZWIpZGVzaWduZXIgYW5kIGRldmVsb3Blciwgc3R1YmJvcm4gYXMgaGVsbCwgYWx3YXlzIHF1ZXN0aW9uaW5nIGV2ZXJ5dGhpbmcuIExpa2VzIHRvIHJlLWludmVudCB0aGUgd2hlZWwgdG8gc2VlIGlmIGl0IGNhbiBiZSBhcHByb3ZlZC4iO3M6MzoidXJsIjtzOjIyOiJodHRwOi8vdC5jby9tVnlHeUN6VFNjIjtzOjg6ImVudGl0aWVzIjtPOjg6InN0ZENsYXNzIjoyOntzOjM6InVybCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJ1cmxzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjo0OntzOjM6InVybCI7czoyMjoiaHR0cDovL3QuY28vbVZ5R3lDelRTYyI7czoxMjoiZXhwYW5kZWRfdXJsIjtzOjI0OiJodHRwOi8vY3Jvc3NpbmdoaXBwb3MubmwiO3M6MTE6ImRpc3BsYXlfdXJsIjtzOjE3OiJjcm9zc2luZ2hpcHBvcy5ubCI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjA7aToxO2k6MjI7fX19fXM6MTE6ImRlc2NyaXB0aW9uIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6InVybHMiO2E6MDp7fX19czo5OiJwcm90ZWN0ZWQiO2I6MDtzOjE1OiJmb2xsb3dlcnNfY291bnQiO2k6MjAzO3M6MTM6ImZyaWVuZHNfY291bnQiO2k6MTc1O3M6MTI6Imxpc3RlZF9jb3VudCI7aToxMztzOjEwOiJjcmVhdGVkX2F0IjtzOjMwOiJTdW4gSmFuIDMxIDEwOjQ5OjQ3ICswMDAwIDIwMTAiO3M6MTY6ImZhdm91cml0ZXNfY291bnQiO2k6Njk7czoxMDoidXRjX29mZnNldCI7aTotNzIwMDtzOjk6InRpbWVfem9uZSI7czo5OiJHcmVlbmxhbmQiO3M6MTE6Imdlb19lbmFibGVkIjtiOjE7czo4OiJ2ZXJpZmllZCI7YjowO3M6MTQ6InN0YXR1c2VzX2NvdW50IjtpOjExMzQ7czo0OiJsYW5nIjtzOjI6ImVuIjtzOjIwOiJjb250cmlidXRvcnNfZW5hYmxlZCI7YjowO3M6MTM6ImlzX3RyYW5zbGF0b3IiO2I6MDtzOjI0OiJwcm9maWxlX2JhY2tncm91bmRfY29sb3IiO3M6NjoiMTMxNTE2IjtzOjI4OiJwcm9maWxlX2JhY2tncm91bmRfaW1hZ2VfdXJsIjtzOjkyOiJodHRwOi8vYTAudHdpbWcuY29tL3Byb2ZpbGVfYmFja2dyb3VuZF9pbWFnZXMvMjUyMDQxMDU1L3hjNWUwNmFhYzlmYjE2NGJkOTI3NTFiYzA0NDdiM2ViLnBuZyI7czozNDoicHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlX3VybF9odHRwcyI7czo5NDoiaHR0cHM6Ly9zaTAudHdpbWcuY29tL3Byb2ZpbGVfYmFja2dyb3VuZF9pbWFnZXMvMjUyMDQxMDU1L3hjNWUwNmFhYzlmYjE2NGJkOTI3NTFiYzA0NDdiM2ViLnBuZyI7czoyMzoicHJvZmlsZV9iYWNrZ3JvdW5kX3RpbGUiO2I6MTtzOjE3OiJwcm9maWxlX2ltYWdlX3VybCI7czo2MjoiaHR0cDovL2EwLnR3aW1nLmNvbS9wcm9maWxlX2ltYWdlcy8xMzUwMzIwOTUyL2phYjExX25vcm1hbC5wbmciO3M6MjM6InByb2ZpbGVfaW1hZ2VfdXJsX2h0dHBzIjtzOjY0OiJodHRwczovL3NpMC50d2ltZy5jb20vcHJvZmlsZV9pbWFnZXMvMTM1MDMyMDk1Mi9qYWIxMV9ub3JtYWwucG5nIjtzOjE4OiJwcm9maWxlX2xpbmtfY29sb3IiO3M6NjoiMDA5OTk5IjtzOjI4OiJwcm9maWxlX3NpZGViYXJfYm9yZGVyX2NvbG9yIjtzOjY6IkVFRUVFRSI7czoyNjoicHJvZmlsZV9zaWRlYmFyX2ZpbGxfY29sb3IiO3M6NjoiRUZFRkVGIjtzOjE4OiJwcm9maWxlX3RleHRfY29sb3IiO3M6NjoiMDAwMDAwIjtzOjI4OiJwcm9maWxlX3VzZV9iYWNrZ3JvdW5kX2ltYWdlIjtiOjA7czoxNToiZGVmYXVsdF9wcm9maWxlIjtiOjA7czoyMToiZGVmYXVsdF9wcm9maWxlX2ltYWdlIjtiOjA7czo5OiJmb2xsb3dpbmciO2I6MDtzOjE5OiJmb2xsb3dfcmVxdWVzdF9zZW50IjtiOjA7czoxMzoibm90aWZpY2F0aW9ucyI7YjowO31zOjM6ImdlbyI7TjtzOjExOiJjb29yZGluYXRlcyI7TjtzOjU6InBsYWNlIjtOO3M6MTI6ImNvbnRyaWJ1dG9ycyI7TjtzOjE2OiJyZXR3ZWV0ZWRfc3RhdHVzIjtPOjg6InN0ZENsYXNzIjoyMzp7czoxMDoiY3JlYXRlZF9hdCI7czozMDoiVGh1IEF1ZyAxNSAwNjo1MToyNSArMDAwMCAyMDEzIjtzOjI6ImlkIjtpOjM2NzkwMTMyMzIxNzYyMDk5MjtzOjY6ImlkX3N0ciI7czoxODoiMzY3OTAxMzIzMjE3NjIwOTkyIjtzOjQ6InRleHQiO3M6OTU6IiNqb29tbGEgQm9vdHN0cmFwIEFjY29yZGlvbiBtZW51IGJ5IHlpcmVvIGh0dHA6Ly90LmNvL1FTZ1VxWko1WlYgc2ltcGxlIHlldCBiZWF1dGlmdWwsIGFuZCBmcmVlIjtzOjY6InNvdXJjZSI7czo3MzoiPGEgaHJlZj0iaHR0cDovL3d3dy55aXJlby5jb20vIiByZWw9Im5vZm9sbG93Ij5Kb29tbGEhIFR3ZWV0U2NoZWR1bGVyPC9hPiI7czo5OiJ0cnVuY2F0ZWQiO2I6MDtzOjIxOiJpbl9yZXBseV90b19zdGF0dXNfaWQiO047czoyNToiaW5fcmVwbHlfdG9fc3RhdHVzX2lkX3N0ciI7TjtzOjE5OiJpbl9yZXBseV90b191c2VyX2lkIjtOO3M6MjM6ImluX3JlcGx5X3RvX3VzZXJfaWRfc3RyIjtOO3M6MjM6ImluX3JlcGx5X3RvX3NjcmVlbl9uYW1lIjtOO3M6NDoidXNlciI7Tzo4OiJzdGRDbGFzcyI6Mzg6e3M6MjoiaWQiO2k6Mzc5OTQyMjE7czo2OiJpZF9zdHIiO3M6ODoiMzc5OTQyMjEiO3M6NDoibmFtZSI7czo1OiJ5aXJlbyI7czoxMToic2NyZWVuX25hbWUiO3M6NToieWlyZW8iO3M6ODoibG9jYXRpb24iO3M6MTE6Ik5ldGhlcmxhbmRzIjtzOjExOiJkZXNjcmlwdGlvbiI7czo2NDoiWWlyZW8gLSBFeHRlbnNpb25zIGFuZCBndWlkZXMgZm9yIEpvb21sYSEgYW5kIE1hZ2VudG8gZGV2ZWxvcGVycyI7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvLzJWbmVwT25VZ0UiO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjI6e3M6MzoidXJsIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6InVybHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjQ6e3M6MzoidXJsIjtzOjIyOiJodHRwOi8vdC5jby8yVm5lcE9uVWdFIjtzOjEyOiJleHBhbmRlZF91cmwiO3M6MjA6Imh0dHA6Ly93d3cueWlyZW8uY29tIjtzOjExOiJkaXNwbGF5X3VybCI7czo5OiJ5aXJlby5jb20iO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aTowO2k6MTtpOjIyO319fX1zOjExOiJkZXNjcmlwdGlvbiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJ1cmxzIjthOjA6e319fXM6OToicHJvdGVjdGVkIjtiOjA7czoxNToiZm9sbG93ZXJzX2NvdW50IjtpOjEzMTI7czoxMzoiZnJpZW5kc19jb3VudCI7aToyMzk7czoxMjoibGlzdGVkX2NvdW50IjtpOjY2O3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IlR1ZSBNYXkgMDUgMTk6MTI6MTIgKzAwMDAgMjAwOSI7czoxNjoiZmF2b3VyaXRlc19jb3VudCI7aTozO3M6MTA6InV0Y19vZmZzZXQiO2k6NzIwMDtzOjk6InRpbWVfem9uZSI7czo5OiJBbXN0ZXJkYW0iO3M6MTE6Imdlb19lbmFibGVkIjtiOjA7czo4OiJ2ZXJpZmllZCI7YjowO3M6MTQ6InN0YXR1c2VzX2NvdW50IjtpOjM4Mjk7czo0OiJsYW5nIjtzOjI6ImVuIjtzOjIwOiJjb250cmlidXRvcnNfZW5hYmxlZCI7YjowO3M6MTM6ImlzX3RyYW5zbGF0b3IiO2I6MDtzOjI0OiJwcm9maWxlX2JhY2tncm91bmRfY29sb3IiO3M6NjoiRkZGRkZGIjtzOjI4OiJwcm9maWxlX2JhY2tncm91bmRfaW1hZ2VfdXJsIjtzOjc1OiJodHRwOi8vYTAudHdpbWcuY29tL3Byb2ZpbGVfYmFja2dyb3VuZF9pbWFnZXMvMzc3NDQ1NzM1L3lpcmVvX3R3aXRiYWNrcy5wbmciO3M6MzQ6InByb2ZpbGVfYmFja2dyb3VuZF9pbWFnZV91cmxfaHR0cHMiO3M6Nzc6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2JhY2tncm91bmRfaW1hZ2VzLzM3NzQ0NTczNS95aXJlb190d2l0YmFja3MucG5nIjtzOjIzOiJwcm9maWxlX2JhY2tncm91bmRfdGlsZSI7YjowO3M6MTc6InByb2ZpbGVfaW1hZ2VfdXJsIjtzOjg5OiJodHRwOi8vYTAudHdpbWcuY29tL3Byb2ZpbGVfaW1hZ2VzLzMxMjQ2OTM1NDIvODEyZmYzMmMxOWNmYmZmMmQ5MGU2MzMyMTg4MjI0YjZfbm9ybWFsLnBuZyI7czoyMzoicHJvZmlsZV9pbWFnZV91cmxfaHR0cHMiO3M6OTE6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2ltYWdlcy8zMTI0NjkzNTQyLzgxMmZmMzJjMTljZmJmZjJkOTBlNjMzMjE4ODIyNGI2X25vcm1hbC5wbmciO3M6MTg6InByb2ZpbGVfbGlua19jb2xvciI7czo2OiJCQjFFMUUiO3M6Mjg6InByb2ZpbGVfc2lkZWJhcl9ib3JkZXJfY29sb3IiO3M6NjoiQkIxRTFFIjtzOjI2OiJwcm9maWxlX3NpZGViYXJfZmlsbF9jb2xvciI7czo2OiJGRkZGRkYiO3M6MTg6InByb2ZpbGVfdGV4dF9jb2xvciI7czo2OiIwMDAwMDAiO3M6Mjg6InByb2ZpbGVfdXNlX2JhY2tncm91bmRfaW1hZ2UiO2I6MTtzOjE1OiJkZWZhdWx0X3Byb2ZpbGUiO2I6MDtzOjIxOiJkZWZhdWx0X3Byb2ZpbGVfaW1hZ2UiO2I6MDtzOjk6ImZvbGxvd2luZyI7TjtzOjE5OiJmb2xsb3dfcmVxdWVzdF9zZW50IjtiOjA7czoxMzoibm90aWZpY2F0aW9ucyI7Tjt9czozOiJnZW8iO047czoxMToiY29vcmRpbmF0ZXMiO047czo1OiJwbGFjZSI7TjtzOjEyOiJjb250cmlidXRvcnMiO047czoxMzoicmV0d2VldF9jb3VudCI7aTozO3M6MTQ6ImZhdm9yaXRlX2NvdW50IjtpOjA7czo4OiJlbnRpdGllcyI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJoYXNodGFncyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJ0ZXh0IjtzOjY6Impvb21sYSI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjA7aToxO2k6Nzt9fX1zOjc6InN5bWJvbHMiO2E6MDp7fXM6NDoidXJscyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6NDp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL1FTZ1VxWko1WlYiO3M6MTI6ImV4cGFuZGVkX3VybCI7czoyMToiaHR0cDovL2JpdC5seS8xMUwxaGVKIjtzOjExOiJkaXNwbGF5X3VybCI7czoxNDoiYml0Lmx5LzExTDFoZUoiO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aTo0MjtpOjE7aTo2NDt9fX1zOjEzOiJ1c2VyX21lbnRpb25zIjthOjA6e319czo5OiJmYXZvcml0ZWQiO2I6MDtzOjk6InJldHdlZXRlZCI7YjowO3M6MTg6InBvc3NpYmx5X3NlbnNpdGl2ZSI7YjowO3M6NDoibGFuZyI7czoyOiJlbiI7fXM6MTM6InJldHdlZXRfY291bnQiO2k6MztzOjE0OiJmYXZvcml0ZV9jb3VudCI7aTowO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoiaGFzaHRhZ3MiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6NDoidGV4dCI7czo2OiJqb29tbGEiO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aToxMTtpOjE7aToxODt9fX1zOjc6InN5bWJvbHMiO2E6MDp7fXM6NDoidXJscyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6NDp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL1FTZ1VxWko1WlYiO3M6MTI6ImV4cGFuZGVkX3VybCI7czoyMToiaHR0cDovL2JpdC5seS8xMUwxaGVKIjtzOjExOiJkaXNwbGF5X3VybCI7czoxNDoiYml0Lmx5LzExTDFoZUoiO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aTo1MztpOjE7aTo3NTt9fX1zOjEzOiJ1c2VyX21lbnRpb25zIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjo1OntzOjExOiJzY3JlZW5fbmFtZSI7czo1OiJ5aXJlbyI7czo0OiJuYW1lIjtzOjU6InlpcmVvIjtzOjI6ImlkIjtpOjM3OTk0MjIxO3M6NjoiaWRfc3RyIjtzOjg6IjM3OTk0MjIxIjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6MztpOjE7aTo5O319fX1zOjk6ImZhdm9yaXRlZCI7YjowO3M6OToicmV0d2VldGVkIjtiOjA7czoxODoicG9zc2libHlfc2Vuc2l0aXZlIjtiOjA7czo0OiJsYW5nIjtzOjI6ImVuIjt9', '', 'https://twitter.com/babsgosgens/status/367910337594789888', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 1, '369718500706643968', '2013-08-20 07:12:14', 'Tzo4OiJzdGRDbGFzcyI6MjM6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IlR1ZSBBdWcgMjAgMDc6MTI6MTQgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNjk3MTg1MDA3MDY2NDM5Njg7czo2OiJpZF9zdHIiO3M6MTg6IjM2OTcxODUwMDcwNjY0Mzk2OCI7czo0OiJ0ZXh0IjtzOjU2OiJBdXRoZW50aWMgRGVzaWduIGh0dHA6Ly90LmNvLzRNV0J1ZzJJcDIgdmlhIEBzbWFzaGluZ21hZyI7czo2OiJzb3VyY2UiO3M6NzI6IjxhIGhyZWY9Imh0dHA6Ly90d2l0dGVyLmNvbS90d2VldGJ1dHRvbiIgcmVsPSJub2ZvbGxvdyI+VHdlZXQgQnV0dG9uPC9hPiI7czo5OiJ0cnVuY2F0ZWQiO2I6MDtzOjIxOiJpbl9yZXBseV90b19zdGF0dXNfaWQiO047czoyNToiaW5fcmVwbHlfdG9fc3RhdHVzX2lkX3N0ciI7TjtzOjE5OiJpbl9yZXBseV90b191c2VyX2lkIjtOO3M6MjM6ImluX3JlcGx5X3RvX3VzZXJfaWRfc3RyIjtOO3M6MjM6ImluX3JlcGx5X3RvX3NjcmVlbl9uYW1lIjtOO3M6NDoidXNlciI7Tzo4OiJzdGRDbGFzcyI6Mzg6e3M6MjoiaWQiO2k6MTEwMTA3NTcyO3M6NjoiaWRfc3RyIjtzOjk6IjExMDEwNzU3MiI7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjExOiJzY3JlZW5fbmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6ODoibG9jYXRpb24iO3M6ODoiUm9zbWFsZW4iO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjEzNjoiKFdlYilkZXNpZ25lciBhbmQgZGV2ZWxvcGVyLCBzdHViYm9ybiBhcyBoZWxsLCBhbHdheXMgcXVlc3Rpb25pbmcgZXZlcnl0aGluZy4gTGlrZXMgdG8gcmUtaW52ZW50IHRoZSB3aGVlbCB0byBzZWUgaWYgaXQgY2FuIGJlIGFwcHJvdmVkLiI7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL21WeUd5Q3pUU2MiO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjI6e3M6MzoidXJsIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6InVybHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjQ6e3M6MzoidXJsIjtzOjIyOiJodHRwOi8vdC5jby9tVnlHeUN6VFNjIjtzOjEyOiJleHBhbmRlZF91cmwiO3M6MjQ6Imh0dHA6Ly9jcm9zc2luZ2hpcHBvcy5ubCI7czoxMToiZGlzcGxheV91cmwiO3M6MTc6ImNyb3NzaW5naGlwcG9zLm5sIjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6MDtpOjE7aToyMjt9fX19czoxMToiZGVzY3JpcHRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NDoidXJscyI7YTowOnt9fX1zOjk6InByb3RlY3RlZCI7YjowO3M6MTU6ImZvbGxvd2Vyc19jb3VudCI7aToyMDM7czoxMzoiZnJpZW5kc19jb3VudCI7aToxNzU7czoxMjoibGlzdGVkX2NvdW50IjtpOjEzO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IlN1biBKYW4gMzEgMTA6NDk6NDcgKzAwMDAgMjAxMCI7czoxNjoiZmF2b3VyaXRlc19jb3VudCI7aTo2OTtzOjEwOiJ1dGNfb2Zmc2V0IjtpOi03MjAwO3M6OToidGltZV96b25lIjtzOjk6IkdyZWVubGFuZCI7czoxMToiZ2VvX2VuYWJsZWQiO2I6MTtzOjg6InZlcmlmaWVkIjtiOjA7czoxNDoic3RhdHVzZXNfY291bnQiO2k6MTEzNDtzOjQ6ImxhbmciO3M6MjoiZW4iO3M6MjA6ImNvbnRyaWJ1dG9yc19lbmFibGVkIjtiOjA7czoxMzoiaXNfdHJhbnNsYXRvciI7YjowO3M6MjQ6InByb2ZpbGVfYmFja2dyb3VuZF9jb2xvciI7czo2OiIxMzE1MTYiO3M6Mjg6InByb2ZpbGVfYmFja2dyb3VuZF9pbWFnZV91cmwiO3M6OTI6Imh0dHA6Ly9hMC50d2ltZy5jb20vcHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlcy8yNTIwNDEwNTUveGM1ZTA2YWFjOWZiMTY0YmQ5Mjc1MWJjMDQ0N2IzZWIucG5nIjtzOjM0OiJwcm9maWxlX2JhY2tncm91bmRfaW1hZ2VfdXJsX2h0dHBzIjtzOjk0OiJodHRwczovL3NpMC50d2ltZy5jb20vcHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlcy8yNTIwNDEwNTUveGM1ZTA2YWFjOWZiMTY0YmQ5Mjc1MWJjMDQ0N2IzZWIucG5nIjtzOjIzOiJwcm9maWxlX2JhY2tncm91bmRfdGlsZSI7YjoxO3M6MTc6InByb2ZpbGVfaW1hZ2VfdXJsIjtzOjYyOiJodHRwOi8vYTAudHdpbWcuY29tL3Byb2ZpbGVfaW1hZ2VzLzEzNTAzMjA5NTIvamFiMTFfbm9ybWFsLnBuZyI7czoyMzoicHJvZmlsZV9pbWFnZV91cmxfaHR0cHMiO3M6NjQ6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2ltYWdlcy8xMzUwMzIwOTUyL2phYjExX25vcm1hbC5wbmciO3M6MTg6InByb2ZpbGVfbGlua19jb2xvciI7czo2OiIwMDk5OTkiO3M6Mjg6InByb2ZpbGVfc2lkZWJhcl9ib3JkZXJfY29sb3IiO3M6NjoiRUVFRUVFIjtzOjI2OiJwcm9maWxlX3NpZGViYXJfZmlsbF9jb2xvciI7czo2OiJFRkVGRUYiO3M6MTg6InByb2ZpbGVfdGV4dF9jb2xvciI7czo2OiIwMDAwMDAiO3M6Mjg6InByb2ZpbGVfdXNlX2JhY2tncm91bmRfaW1hZ2UiO2I6MDtzOjE1OiJkZWZhdWx0X3Byb2ZpbGUiO2I6MDtzOjIxOiJkZWZhdWx0X3Byb2ZpbGVfaW1hZ2UiO2I6MDtzOjk6ImZvbGxvd2luZyI7YjowO3M6MTk6ImZvbGxvd19yZXF1ZXN0X3NlbnQiO2I6MDtzOjEzOiJub3RpZmljYXRpb25zIjtiOjA7fXM6MzoiZ2VvIjtOO3M6MTE6ImNvb3JkaW5hdGVzIjtOO3M6NToicGxhY2UiO047czoxMjoiY29udHJpYnV0b3JzIjtOO3M6MTM6InJldHdlZXRfY291bnQiO2k6MDtzOjE0OiJmYXZvcml0ZV9jb3VudCI7aTowO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoiaGFzaHRhZ3MiO2E6MDp7fXM6Nzoic3ltYm9scyI7YTowOnt9czo0OiJ1cmxzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjo0OntzOjM6InVybCI7czoyMjoiaHR0cDovL3QuY28vNE1XQnVnMklwMiI7czoxMjoiZXhwYW5kZWRfdXJsIjtzOjYwOiJodHRwOi8vd3d3LnNtYXNoaW5nbWFnYXppbmUuY29tLzIwMTMvMDcvMTYvYXV0aGVudGljLWRlc2lnbi8iO3M6MTE6ImRpc3BsYXlfdXJsIjtzOjM4OiJzbWFzaGluZ21hZ2F6aW5lLmNvbS8yMDEzLzA3LzE2L2F1dOKApiI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjE3O2k6MTtpOjM5O319fXM6MTM6InVzZXJfbWVudGlvbnMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjU6e3M6MTE6InNjcmVlbl9uYW1lIjtzOjExOiJzbWFzaGluZ21hZyI7czo0OiJuYW1lIjtzOjE3OiJTbWFzaGluZyBNYWdhemluZSI7czoyOiJpZCI7aToxNTczNjE5MDtzOjY6ImlkX3N0ciI7czo4OiIxNTczNjE5MCI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjQ0O2k6MTtpOjU2O319fX1zOjk6ImZhdm9yaXRlZCI7YjowO3M6OToicmV0d2VldGVkIjtiOjA7czoxODoicG9zc2libHlfc2Vuc2l0aXZlIjtiOjA7czo0OiJsYW5nIjtzOjI6ImVuIjt9', '', 'https://twitter.com/babsgosgens/status/369718500706643968', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 1, '370102142314352640', '2013-08-21 08:36:41', 'Tzo4OiJzdGRDbGFzcyI6MjI6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IldlZCBBdWcgMjEgMDg6MzY6NDEgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNzAxMDIxNDIzMTQzNTI2NDA7czo2OiJpZF9zdHIiO3M6MTg6IjM3MDEwMjE0MjMxNDM1MjY0MCI7czo0OiJ0ZXh0IjtzOjM5OiJARnJvbnRlZXJzQ29uZiBpayB6b2VrIG5vZyBlZW4ga2FhcnRqZSEiO3M6Njoic291cmNlIjtzOjM6IndlYiI7czo5OiJ0cnVuY2F0ZWQiO2I6MDtzOjIxOiJpbl9yZXBseV90b19zdGF0dXNfaWQiO047czoyNToiaW5fcmVwbHlfdG9fc3RhdHVzX2lkX3N0ciI7TjtzOjE5OiJpbl9yZXBseV90b191c2VyX2lkIjtpOjM3NjYxMDczO3M6MjM6ImluX3JlcGx5X3RvX3VzZXJfaWRfc3RyIjtzOjg6IjM3NjYxMDczIjtzOjIzOiJpbl9yZXBseV90b19zY3JlZW5fbmFtZSI7czoxMzoiRnJvbnRlZXJzQ29uZiI7czo0OiJ1c2VyIjtPOjg6InN0ZENsYXNzIjozODp7czoyOiJpZCI7aToxMTAxMDc1NzI7czo2OiJpZF9zdHIiO3M6OToiMTEwMTA3NTcyIjtzOjQ6Im5hbWUiO3M6MTM6IkJhYnMgR8O2c2dlbnMiO3M6MTE6InNjcmVlbl9uYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo4OiJsb2NhdGlvbiI7czo4OiJSb3NtYWxlbiI7czoxMToiZGVzY3JpcHRpb24iO3M6MTM2OiIoV2ViKWRlc2lnbmVyIGFuZCBkZXZlbG9wZXIsIHN0dWJib3JuIGFzIGhlbGwsIGFsd2F5cyBxdWVzdGlvbmluZyBldmVyeXRoaW5nLiBMaWtlcyB0byByZS1pbnZlbnQgdGhlIHdoZWVsIHRvIHNlZSBpZiBpdCBjYW4gYmUgYXBwcm92ZWQuIjtzOjM6InVybCI7czoyMjoiaHR0cDovL3QuY28vbVZ5R3lDelRTYyI7czo4OiJlbnRpdGllcyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czozOiJ1cmwiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoidXJscyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6NDp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL21WeUd5Q3pUU2MiO3M6MTI6ImV4cGFuZGVkX3VybCI7czoyNDoiaHR0cDovL2Nyb3NzaW5naGlwcG9zLm5sIjtzOjExOiJkaXNwbGF5X3VybCI7czoxNzoiY3Jvc3NpbmdoaXBwb3MubmwiO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aTowO2k6MTtpOjIyO319fX1zOjExOiJkZXNjcmlwdGlvbiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJ1cmxzIjthOjA6e319fXM6OToicHJvdGVjdGVkIjtiOjA7czoxNToiZm9sbG93ZXJzX2NvdW50IjtpOjIwMztzOjEzOiJmcmllbmRzX2NvdW50IjtpOjE3NTtzOjEyOiJsaXN0ZWRfY291bnQiO2k6MTM7czoxMDoiY3JlYXRlZF9hdCI7czozMDoiU3VuIEphbiAzMSAxMDo0OTo0NyArMDAwMCAyMDEwIjtzOjE2OiJmYXZvdXJpdGVzX2NvdW50IjtpOjY5O3M6MTA6InV0Y19vZmZzZXQiO2k6LTcyMDA7czo5OiJ0aW1lX3pvbmUiO3M6OToiR3JlZW5sYW5kIjtzOjExOiJnZW9fZW5hYmxlZCI7YjoxO3M6ODoidmVyaWZpZWQiO2I6MDtzOjE0OiJzdGF0dXNlc19jb3VudCI7aToxMTM0O3M6NDoibGFuZyI7czoyOiJlbiI7czoyMDoiY29udHJpYnV0b3JzX2VuYWJsZWQiO2I6MDtzOjEzOiJpc190cmFuc2xhdG9yIjtiOjA7czoyNDoicHJvZmlsZV9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjEzMTUxNiI7czoyODoicHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlX3VybCI7czo5MjoiaHR0cDovL2EwLnR3aW1nLmNvbS9wcm9maWxlX2JhY2tncm91bmRfaW1hZ2VzLzI1MjA0MTA1NS94YzVlMDZhYWM5ZmIxNjRiZDkyNzUxYmMwNDQ3YjNlYi5wbmciO3M6MzQ6InByb2ZpbGVfYmFja2dyb3VuZF9pbWFnZV91cmxfaHR0cHMiO3M6OTQ6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2JhY2tncm91bmRfaW1hZ2VzLzI1MjA0MTA1NS94YzVlMDZhYWM5ZmIxNjRiZDkyNzUxYmMwNDQ3YjNlYi5wbmciO3M6MjM6InByb2ZpbGVfYmFja2dyb3VuZF90aWxlIjtiOjE7czoxNzoicHJvZmlsZV9pbWFnZV91cmwiO3M6NjI6Imh0dHA6Ly9hMC50d2ltZy5jb20vcHJvZmlsZV9pbWFnZXMvMTM1MDMyMDk1Mi9qYWIxMV9ub3JtYWwucG5nIjtzOjIzOiJwcm9maWxlX2ltYWdlX3VybF9odHRwcyI7czo2NDoiaHR0cHM6Ly9zaTAudHdpbWcuY29tL3Byb2ZpbGVfaW1hZ2VzLzEzNTAzMjA5NTIvamFiMTFfbm9ybWFsLnBuZyI7czoxODoicHJvZmlsZV9saW5rX2NvbG9yIjtzOjY6IjAwOTk5OSI7czoyODoicHJvZmlsZV9zaWRlYmFyX2JvcmRlcl9jb2xvciI7czo2OiJFRUVFRUUiO3M6MjY6InByb2ZpbGVfc2lkZWJhcl9maWxsX2NvbG9yIjtzOjY6IkVGRUZFRiI7czoxODoicHJvZmlsZV90ZXh0X2NvbG9yIjtzOjY6IjAwMDAwMCI7czoyODoicHJvZmlsZV91c2VfYmFja2dyb3VuZF9pbWFnZSI7YjowO3M6MTU6ImRlZmF1bHRfcHJvZmlsZSI7YjowO3M6MjE6ImRlZmF1bHRfcHJvZmlsZV9pbWFnZSI7YjowO3M6OToiZm9sbG93aW5nIjtiOjA7czoxOToiZm9sbG93X3JlcXVlc3Rfc2VudCI7YjowO3M6MTM6Im5vdGlmaWNhdGlvbnMiO2I6MDt9czozOiJnZW8iO047czoxMToiY29vcmRpbmF0ZXMiO047czo1OiJwbGFjZSI7TjtzOjEyOiJjb250cmlidXRvcnMiO047czoxMzoicmV0d2VldF9jb3VudCI7aTowO3M6MTQ6ImZhdm9yaXRlX2NvdW50IjtpOjA7czo4OiJlbnRpdGllcyI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJoYXNodGFncyI7YTowOnt9czo3OiJzeW1ib2xzIjthOjA6e31zOjQ6InVybHMiO2E6MDp7fXM6MTM6InVzZXJfbWVudGlvbnMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjU6e3M6MTE6InNjcmVlbl9uYW1lIjtzOjEzOiJGcm9udGVlcnNDb25mIjtzOjQ6Im5hbWUiO3M6MjA6IkZyb250ZWVycyBDb25mZXJlbmNlIjtzOjI6ImlkIjtpOjM3NjYxMDczO3M6NjoiaWRfc3RyIjtzOjg6IjM3NjYxMDczIjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6MDtpOjE7aToxNDt9fX19czo5OiJmYXZvcml0ZWQiO2I6MDtzOjk6InJldHdlZXRlZCI7YjowO3M6NDoibGFuZyI7czoyOiJubCI7fQ==', '', 'https://twitter.com/babsgosgens/status/370102142314352640', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 1, '370111851159224320', '2013-08-21 09:15:16', 'Tzo4OiJzdGRDbGFzcyI6MjI6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IldlZCBBdWcgMjEgMDk6MTU6MTYgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNzAxMTE4NTExNTkyMjQzMjA7czo2OiJpZF9zdHIiO3M6MTg6IjM3MDExMTg1MTE1OTIyNDMyMCI7czo0OiJ0ZXh0IjtzOjU4OiJARnJvbnRlZXJzQ29uZiBaaXQgZGFhciB0b2V2YWxsaWcgb29rIG5vZyBsZWRlbmtvcnRpbmcgb3A/IjtzOjY6InNvdXJjZSI7czozOiJ3ZWIiO3M6OToidHJ1bmNhdGVkIjtiOjA7czoyMToiaW5fcmVwbHlfdG9fc3RhdHVzX2lkIjtpOjM3MDExMTE4MzQ1OTU5ODMzNztzOjI1OiJpbl9yZXBseV90b19zdGF0dXNfaWRfc3RyIjtzOjE4OiIzNzAxMTExODM0NTk1OTgzMzciO3M6MTk6ImluX3JlcGx5X3RvX3VzZXJfaWQiO2k6Mzc2NjEwNzM7czoyMzoiaW5fcmVwbHlfdG9fdXNlcl9pZF9zdHIiO3M6ODoiMzc2NjEwNzMiO3M6MjM6ImluX3JlcGx5X3RvX3NjcmVlbl9uYW1lIjtzOjEzOiJGcm9udGVlcnNDb25mIjtzOjQ6InVzZXIiO086ODoic3RkQ2xhc3MiOjM4OntzOjI6ImlkIjtpOjExMDEwNzU3MjtzOjY6ImlkX3N0ciI7czo5OiIxMTAxMDc1NzIiO3M6NDoibmFtZSI7czoxMzoiQmFicyBHw7ZzZ2VucyI7czoxMToic2NyZWVuX25hbWUiO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjg6ImxvY2F0aW9uIjtzOjg6IlJvc21hbGVuIjtzOjExOiJkZXNjcmlwdGlvbiI7czoxMzY6IihXZWIpZGVzaWduZXIgYW5kIGRldmVsb3Blciwgc3R1YmJvcm4gYXMgaGVsbCwgYWx3YXlzIHF1ZXN0aW9uaW5nIGV2ZXJ5dGhpbmcuIExpa2VzIHRvIHJlLWludmVudCB0aGUgd2hlZWwgdG8gc2VlIGlmIGl0IGNhbiBiZSBhcHByb3ZlZC4iO3M6MzoidXJsIjtzOjIyOiJodHRwOi8vdC5jby9tVnlHeUN6VFNjIjtzOjg6ImVudGl0aWVzIjtPOjg6InN0ZENsYXNzIjoyOntzOjM6InVybCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJ1cmxzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjo0OntzOjM6InVybCI7czoyMjoiaHR0cDovL3QuY28vbVZ5R3lDelRTYyI7czoxMjoiZXhwYW5kZWRfdXJsIjtzOjI0OiJodHRwOi8vY3Jvc3NpbmdoaXBwb3MubmwiO3M6MTE6ImRpc3BsYXlfdXJsIjtzOjE3OiJjcm9zc2luZ2hpcHBvcy5ubCI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjA7aToxO2k6MjI7fX19fXM6MTE6ImRlc2NyaXB0aW9uIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6InVybHMiO2E6MDp7fX19czo5OiJwcm90ZWN0ZWQiO2I6MDtzOjE1OiJmb2xsb3dlcnNfY291bnQiO2k6MjAzO3M6MTM6ImZyaWVuZHNfY291bnQiO2k6MTc1O3M6MTI6Imxpc3RlZF9jb3VudCI7aToxMztzOjEwOiJjcmVhdGVkX2F0IjtzOjMwOiJTdW4gSmFuIDMxIDEwOjQ5OjQ3ICswMDAwIDIwMTAiO3M6MTY6ImZhdm91cml0ZXNfY291bnQiO2k6Njk7czoxMDoidXRjX29mZnNldCI7aTotNzIwMDtzOjk6InRpbWVfem9uZSI7czo5OiJHcmVlbmxhbmQiO3M6MTE6Imdlb19lbmFibGVkIjtiOjE7czo4OiJ2ZXJpZmllZCI7YjowO3M6MTQ6InN0YXR1c2VzX2NvdW50IjtpOjExMzQ7czo0OiJsYW5nIjtzOjI6ImVuIjtzOjIwOiJjb250cmlidXRvcnNfZW5hYmxlZCI7YjowO3M6MTM6ImlzX3RyYW5zbGF0b3IiO2I6MDtzOjI0OiJwcm9maWxlX2JhY2tncm91bmRfY29sb3IiO3M6NjoiMTMxNTE2IjtzOjI4OiJwcm9maWxlX2JhY2tncm91bmRfaW1hZ2VfdXJsIjtzOjkyOiJodHRwOi8vYTAudHdpbWcuY29tL3Byb2ZpbGVfYmFja2dyb3VuZF9pbWFnZXMvMjUyMDQxMDU1L3hjNWUwNmFhYzlmYjE2NGJkOTI3NTFiYzA0NDdiM2ViLnBuZyI7czozNDoicHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlX3VybF9odHRwcyI7czo5NDoiaHR0cHM6Ly9zaTAudHdpbWcuY29tL3Byb2ZpbGVfYmFja2dyb3VuZF9pbWFnZXMvMjUyMDQxMDU1L3hjNWUwNmFhYzlmYjE2NGJkOTI3NTFiYzA0NDdiM2ViLnBuZyI7czoyMzoicHJvZmlsZV9iYWNrZ3JvdW5kX3RpbGUiO2I6MTtzOjE3OiJwcm9maWxlX2ltYWdlX3VybCI7czo2MjoiaHR0cDovL2EwLnR3aW1nLmNvbS9wcm9maWxlX2ltYWdlcy8xMzUwMzIwOTUyL2phYjExX25vcm1hbC5wbmciO3M6MjM6InByb2ZpbGVfaW1hZ2VfdXJsX2h0dHBzIjtzOjY0OiJodHRwczovL3NpMC50d2ltZy5jb20vcHJvZmlsZV9pbWFnZXMvMTM1MDMyMDk1Mi9qYWIxMV9ub3JtYWwucG5nIjtzOjE4OiJwcm9maWxlX2xpbmtfY29sb3IiO3M6NjoiMDA5OTk5IjtzOjI4OiJwcm9maWxlX3NpZGViYXJfYm9yZGVyX2NvbG9yIjtzOjY6IkVFRUVFRSI7czoyNjoicHJvZmlsZV9zaWRlYmFyX2ZpbGxfY29sb3IiO3M6NjoiRUZFRkVGIjtzOjE4OiJwcm9maWxlX3RleHRfY29sb3IiO3M6NjoiMDAwMDAwIjtzOjI4OiJwcm9maWxlX3VzZV9iYWNrZ3JvdW5kX2ltYWdlIjtiOjA7czoxNToiZGVmYXVsdF9wcm9maWxlIjtiOjA7czoyMToiZGVmYXVsdF9wcm9maWxlX2ltYWdlIjtiOjA7czo5OiJmb2xsb3dpbmciO2I6MDtzOjE5OiJmb2xsb3dfcmVxdWVzdF9zZW50IjtiOjA7czoxMzoibm90aWZpY2F0aW9ucyI7YjowO31zOjM6ImdlbyI7TjtzOjExOiJjb29yZGluYXRlcyI7TjtzOjU6InBsYWNlIjtOO3M6MTI6ImNvbnRyaWJ1dG9ycyI7TjtzOjEzOiJyZXR3ZWV0X2NvdW50IjtpOjA7czoxNDoiZmF2b3JpdGVfY291bnQiO2k6MDtzOjg6ImVudGl0aWVzIjtPOjg6InN0ZENsYXNzIjo0OntzOjg6Imhhc2h0YWdzIjthOjA6e31zOjc6InN5bWJvbHMiO2E6MDp7fXM6NDoidXJscyI7YTowOnt9czoxMzoidXNlcl9tZW50aW9ucyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6NTp7czoxMToic2NyZWVuX25hbWUiO3M6MTM6IkZyb250ZWVyc0NvbmYiO3M6NDoibmFtZSI7czoyMDoiRnJvbnRlZXJzIENvbmZlcmVuY2UiO3M6MjoiaWQiO2k6Mzc2NjEwNzM7czo2OiJpZF9zdHIiO3M6ODoiMzc2NjEwNzMiO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aTowO2k6MTtpOjE0O319fX1zOjk6ImZhdm9yaXRlZCI7YjowO3M6OToicmV0d2VldGVkIjtiOjA7czo0OiJsYW5nIjtzOjI6Im5sIjt9', '', 'https://twitter.com/babsgosgens/status/370111851159224320', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 1, '370163717263986688', '2013-08-21 12:41:22', 'Tzo4OiJzdGRDbGFzcyI6MjI6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IldlZCBBdWcgMjEgMTI6NDE6MjIgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNzAxNjM3MTcyNjM5ODY2ODg7czo2OiJpZF9zdHIiO3M6MTg6IjM3MDE2MzcxNzI2Mzk4NjY4OCI7czo0OiJ0ZXh0IjtzOjIxOiJARnJvbnRlZXJzQ29uZiBDaGVjayEiO3M6Njoic291cmNlIjtzOjM6IndlYiI7czo5OiJ0cnVuY2F0ZWQiO2I6MDtzOjIxOiJpbl9yZXBseV90b19zdGF0dXNfaWQiO2k6MzcwMTU4MzczNDA2MTIxOTg0O3M6MjU6ImluX3JlcGx5X3RvX3N0YXR1c19pZF9zdHIiO3M6MTg6IjM3MDE1ODM3MzQwNjEyMTk4NCI7czoxOToiaW5fcmVwbHlfdG9fdXNlcl9pZCI7aTozNzY2MTA3MztzOjIzOiJpbl9yZXBseV90b191c2VyX2lkX3N0ciI7czo4OiIzNzY2MTA3MyI7czoyMzoiaW5fcmVwbHlfdG9fc2NyZWVuX25hbWUiO3M6MTM6IkZyb250ZWVyc0NvbmYiO3M6NDoidXNlciI7Tzo4OiJzdGRDbGFzcyI6Mzg6e3M6MjoiaWQiO2k6MTEwMTA3NTcyO3M6NjoiaWRfc3RyIjtzOjk6IjExMDEwNzU3MiI7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjExOiJzY3JlZW5fbmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6ODoibG9jYXRpb24iO3M6ODoiUm9zbWFsZW4iO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjEzNjoiKFdlYilkZXNpZ25lciBhbmQgZGV2ZWxvcGVyLCBzdHViYm9ybiBhcyBoZWxsLCBhbHdheXMgcXVlc3Rpb25pbmcgZXZlcnl0aGluZy4gTGlrZXMgdG8gcmUtaW52ZW50IHRoZSB3aGVlbCB0byBzZWUgaWYgaXQgY2FuIGJlIGFwcHJvdmVkLiI7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL21WeUd5Q3pUU2MiO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjI6e3M6MzoidXJsIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6InVybHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjQ6e3M6MzoidXJsIjtzOjIyOiJodHRwOi8vdC5jby9tVnlHeUN6VFNjIjtzOjEyOiJleHBhbmRlZF91cmwiO3M6MjQ6Imh0dHA6Ly9jcm9zc2luZ2hpcHBvcy5ubCI7czoxMToiZGlzcGxheV91cmwiO3M6MTc6ImNyb3NzaW5naGlwcG9zLm5sIjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6MDtpOjE7aToyMjt9fX19czoxMToiZGVzY3JpcHRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NDoidXJscyI7YTowOnt9fX1zOjk6InByb3RlY3RlZCI7YjowO3M6MTU6ImZvbGxvd2Vyc19jb3VudCI7aToyMDM7czoxMzoiZnJpZW5kc19jb3VudCI7aToxNzU7czoxMjoibGlzdGVkX2NvdW50IjtpOjEzO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IlN1biBKYW4gMzEgMTA6NDk6NDcgKzAwMDAgMjAxMCI7czoxNjoiZmF2b3VyaXRlc19jb3VudCI7aTo2OTtzOjEwOiJ1dGNfb2Zmc2V0IjtpOi03MjAwO3M6OToidGltZV96b25lIjtzOjk6IkdyZWVubGFuZCI7czoxMToiZ2VvX2VuYWJsZWQiO2I6MTtzOjg6InZlcmlmaWVkIjtiOjA7czoxNDoic3RhdHVzZXNfY291bnQiO2k6MTEzNDtzOjQ6ImxhbmciO3M6MjoiZW4iO3M6MjA6ImNvbnRyaWJ1dG9yc19lbmFibGVkIjtiOjA7czoxMzoiaXNfdHJhbnNsYXRvciI7YjowO3M6MjQ6InByb2ZpbGVfYmFja2dyb3VuZF9jb2xvciI7czo2OiIxMzE1MTYiO3M6Mjg6InByb2ZpbGVfYmFja2dyb3VuZF9pbWFnZV91cmwiO3M6OTI6Imh0dHA6Ly9hMC50d2ltZy5jb20vcHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlcy8yNTIwNDEwNTUveGM1ZTA2YWFjOWZiMTY0YmQ5Mjc1MWJjMDQ0N2IzZWIucG5nIjtzOjM0OiJwcm9maWxlX2JhY2tncm91bmRfaW1hZ2VfdXJsX2h0dHBzIjtzOjk0OiJodHRwczovL3NpMC50d2ltZy5jb20vcHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlcy8yNTIwNDEwNTUveGM1ZTA2YWFjOWZiMTY0YmQ5Mjc1MWJjMDQ0N2IzZWIucG5nIjtzOjIzOiJwcm9maWxlX2JhY2tncm91bmRfdGlsZSI7YjoxO3M6MTc6InByb2ZpbGVfaW1hZ2VfdXJsIjtzOjYyOiJodHRwOi8vYTAudHdpbWcuY29tL3Byb2ZpbGVfaW1hZ2VzLzEzNTAzMjA5NTIvamFiMTFfbm9ybWFsLnBuZyI7czoyMzoicHJvZmlsZV9pbWFnZV91cmxfaHR0cHMiO3M6NjQ6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2ltYWdlcy8xMzUwMzIwOTUyL2phYjExX25vcm1hbC5wbmciO3M6MTg6InByb2ZpbGVfbGlua19jb2xvciI7czo2OiIwMDk5OTkiO3M6Mjg6InByb2ZpbGVfc2lkZWJhcl9ib3JkZXJfY29sb3IiO3M6NjoiRUVFRUVFIjtzOjI2OiJwcm9maWxlX3NpZGViYXJfZmlsbF9jb2xvciI7czo2OiJFRkVGRUYiO3M6MTg6InByb2ZpbGVfdGV4dF9jb2xvciI7czo2OiIwMDAwMDAiO3M6Mjg6InByb2ZpbGVfdXNlX2JhY2tncm91bmRfaW1hZ2UiO2I6MDtzOjE1OiJkZWZhdWx0X3Byb2ZpbGUiO2I6MDtzOjIxOiJkZWZhdWx0X3Byb2ZpbGVfaW1hZ2UiO2I6MDtzOjk6ImZvbGxvd2luZyI7YjowO3M6MTk6ImZvbGxvd19yZXF1ZXN0X3NlbnQiO2I6MDtzOjEzOiJub3RpZmljYXRpb25zIjtiOjA7fXM6MzoiZ2VvIjtOO3M6MTE6ImNvb3JkaW5hdGVzIjtOO3M6NToicGxhY2UiO047czoxMjoiY29udHJpYnV0b3JzIjtOO3M6MTM6InJldHdlZXRfY291bnQiO2k6MDtzOjE0OiJmYXZvcml0ZV9jb3VudCI7aTowO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoiaGFzaHRhZ3MiO2E6MDp7fXM6Nzoic3ltYm9scyI7YTowOnt9czo0OiJ1cmxzIjthOjA6e31zOjEzOiJ1c2VyX21lbnRpb25zIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjo1OntzOjExOiJzY3JlZW5fbmFtZSI7czoxMzoiRnJvbnRlZXJzQ29uZiI7czo0OiJuYW1lIjtzOjIwOiJGcm9udGVlcnMgQ29uZmVyZW5jZSI7czoyOiJpZCI7aTozNzY2MTA3MztzOjY6ImlkX3N0ciI7czo4OiIzNzY2MTA3MyI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjA7aToxO2k6MTQ7fX19fXM6OToiZmF2b3JpdGVkIjtiOjA7czo5OiJyZXR3ZWV0ZWQiO2I6MDtzOjQ6ImxhbmciO3M6MjoiZW4iO30=', '', 'https://twitter.com/babsgosgens/status/370163717263986688', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 1, '370915337501294594', '2013-08-23 14:28:02', 'Tzo4OiJzdGRDbGFzcyI6MjM6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IkZyaSBBdWcgMjMgMTQ6Mjg6MDIgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNzA5MTUzMzc1MDEyOTQ1OTQ7czo2OiJpZF9zdHIiO3M6MTg6IjM3MDkxNTMzNzUwMTI5NDU5NCI7czo0OiJ0ZXh0IjtzOjgxOiJASHVnb0dpcmF1ZGVsIGhleSwgY29vbCBzdHVmZjogaHR0cHM6Ly90LmNvL29CQmxhak1pbkQgdGhhbmtzIGZvciBzaGFyaW5nIHRoYXQgOikiO3M6Njoic291cmNlIjtzOjM6IndlYiI7czo5OiJ0cnVuY2F0ZWQiO2I6MDtzOjIxOiJpbl9yZXBseV90b19zdGF0dXNfaWQiO047czoyNToiaW5fcmVwbHlfdG9fc3RhdHVzX2lkX3N0ciI7TjtzOjE5OiJpbl9yZXBseV90b191c2VyX2lkIjtpOjU1MTk0OTUzNDtzOjIzOiJpbl9yZXBseV90b191c2VyX2lkX3N0ciI7czo5OiI1NTE5NDk1MzQiO3M6MjM6ImluX3JlcGx5X3RvX3NjcmVlbl9uYW1lIjtzOjEyOiJIdWdvR2lyYXVkZWwiO3M6NDoidXNlciI7Tzo4OiJzdGRDbGFzcyI6Mzg6e3M6MjoiaWQiO2k6MTEwMTA3NTcyO3M6NjoiaWRfc3RyIjtzOjk6IjExMDEwNzU3MiI7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjExOiJzY3JlZW5fbmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6ODoibG9jYXRpb24iO3M6ODoiUm9zbWFsZW4iO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjEzNjoiKFdlYilkZXNpZ25lciBhbmQgZGV2ZWxvcGVyLCBzdHViYm9ybiBhcyBoZWxsLCBhbHdheXMgcXVlc3Rpb25pbmcgZXZlcnl0aGluZy4gTGlrZXMgdG8gcmUtaW52ZW50IHRoZSB3aGVlbCB0byBzZWUgaWYgaXQgY2FuIGJlIGFwcHJvdmVkLiI7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL21WeUd5Q3pUU2MiO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjI6e3M6MzoidXJsIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6InVybHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjQ6e3M6MzoidXJsIjtzOjIyOiJodHRwOi8vdC5jby9tVnlHeUN6VFNjIjtzOjEyOiJleHBhbmRlZF91cmwiO3M6MjQ6Imh0dHA6Ly9jcm9zc2luZ2hpcHBvcy5ubCI7czoxMToiZGlzcGxheV91cmwiO3M6MTc6ImNyb3NzaW5naGlwcG9zLm5sIjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6MDtpOjE7aToyMjt9fX19czoxMToiZGVzY3JpcHRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NDoidXJscyI7YTowOnt9fX1zOjk6InByb3RlY3RlZCI7YjowO3M6MTU6ImZvbGxvd2Vyc19jb3VudCI7aToyMDM7czoxMzoiZnJpZW5kc19jb3VudCI7aToxNzU7czoxMjoibGlzdGVkX2NvdW50IjtpOjEzO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IlN1biBKYW4gMzEgMTA6NDk6NDcgKzAwMDAgMjAxMCI7czoxNjoiZmF2b3VyaXRlc19jb3VudCI7aTo2OTtzOjEwOiJ1dGNfb2Zmc2V0IjtpOi03MjAwO3M6OToidGltZV96b25lIjtzOjk6IkdyZWVubGFuZCI7czoxMToiZ2VvX2VuYWJsZWQiO2I6MTtzOjg6InZlcmlmaWVkIjtiOjA7czoxNDoic3RhdHVzZXNfY291bnQiO2k6MTEzNDtzOjQ6ImxhbmciO3M6MjoiZW4iO3M6MjA6ImNvbnRyaWJ1dG9yc19lbmFibGVkIjtiOjA7czoxMzoiaXNfdHJhbnNsYXRvciI7YjowO3M6MjQ6InByb2ZpbGVfYmFja2dyb3VuZF9jb2xvciI7czo2OiIxMzE1MTYiO3M6Mjg6InByb2ZpbGVfYmFja2dyb3VuZF9pbWFnZV91cmwiO3M6OTI6Imh0dHA6Ly9hMC50d2ltZy5jb20vcHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlcy8yNTIwNDEwNTUveGM1ZTA2YWFjOWZiMTY0YmQ5Mjc1MWJjMDQ0N2IzZWIucG5nIjtzOjM0OiJwcm9maWxlX2JhY2tncm91bmRfaW1hZ2VfdXJsX2h0dHBzIjtzOjk0OiJodHRwczovL3NpMC50d2ltZy5jb20vcHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlcy8yNTIwNDEwNTUveGM1ZTA2YWFjOWZiMTY0YmQ5Mjc1MWJjMDQ0N2IzZWIucG5nIjtzOjIzOiJwcm9maWxlX2JhY2tncm91bmRfdGlsZSI7YjoxO3M6MTc6InByb2ZpbGVfaW1hZ2VfdXJsIjtzOjYyOiJodHRwOi8vYTAudHdpbWcuY29tL3Byb2ZpbGVfaW1hZ2VzLzEzNTAzMjA5NTIvamFiMTFfbm9ybWFsLnBuZyI7czoyMzoicHJvZmlsZV9pbWFnZV91cmxfaHR0cHMiO3M6NjQ6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2ltYWdlcy8xMzUwMzIwOTUyL2phYjExX25vcm1hbC5wbmciO3M6MTg6InByb2ZpbGVfbGlua19jb2xvciI7czo2OiIwMDk5OTkiO3M6Mjg6InByb2ZpbGVfc2lkZWJhcl9ib3JkZXJfY29sb3IiO3M6NjoiRUVFRUVFIjtzOjI2OiJwcm9maWxlX3NpZGViYXJfZmlsbF9jb2xvciI7czo2OiJFRkVGRUYiO3M6MTg6InByb2ZpbGVfdGV4dF9jb2xvciI7czo2OiIwMDAwMDAiO3M6Mjg6InByb2ZpbGVfdXNlX2JhY2tncm91bmRfaW1hZ2UiO2I6MDtzOjE1OiJkZWZhdWx0X3Byb2ZpbGUiO2I6MDtzOjIxOiJkZWZhdWx0X3Byb2ZpbGVfaW1hZ2UiO2I6MDtzOjk6ImZvbGxvd2luZyI7YjowO3M6MTk6ImZvbGxvd19yZXF1ZXN0X3NlbnQiO2I6MDtzOjEzOiJub3RpZmljYXRpb25zIjtiOjA7fXM6MzoiZ2VvIjtOO3M6MTE6ImNvb3JkaW5hdGVzIjtOO3M6NToicGxhY2UiO047czoxMjoiY29udHJpYnV0b3JzIjtOO3M6MTM6InJldHdlZXRfY291bnQiO2k6MDtzOjE0OiJmYXZvcml0ZV9jb3VudCI7aToxO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoiaGFzaHRhZ3MiO2E6MDp7fXM6Nzoic3ltYm9scyI7YTowOnt9czo0OiJ1cmxzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjo0OntzOjM6InVybCI7czoyMzoiaHR0cHM6Ly90LmNvL29CQmxhak1pbkQiO3M6MTI6ImV4cGFuZGVkX3VybCI7czo0NToiaHR0cHM6Ly9naXRodWIuY29tL0h1Z29HaXJhdWRlbC9TYXNzLXNuaXBwZXRzIjtzOjExOiJkaXNwbGF5X3VybCI7czoyODoiZ2l0aHViLmNvbS9IdWdvR2lyYXVkZWwvU+KApiI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjMxO2k6MTtpOjU0O319fXM6MTM6InVzZXJfbWVudGlvbnMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjU6e3M6MTE6InNjcmVlbl9uYW1lIjtzOjEyOiJIdWdvR2lyYXVkZWwiO3M6NDoibmFtZSI7czoxMzoiSHVnbyBHaXJhdWRlbCI7czoyOiJpZCI7aTo1NTE5NDk1MzQ7czo2OiJpZF9zdHIiO3M6OToiNTUxOTQ5NTM0IjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6MDtpOjE7aToxMzt9fX19czo5OiJmYXZvcml0ZWQiO2I6MDtzOjk6InJldHdlZXRlZCI7YjowO3M6MTg6InBvc3NpYmx5X3NlbnNpdGl2ZSI7YjowO3M6NDoibGFuZyI7czoyOiJlbiI7fQ==', '', 'https://twitter.com/babsgosgens/status/370915337501294594', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 1, '371887676779397120', '2013-08-26 06:51:46', 'Tzo4OiJzdGRDbGFzcyI6MjI6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6Ik1vbiBBdWcgMjYgMDY6NTE6NDYgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNzE4ODc2NzY3NzkzOTcxMjA7czo2OiJpZF9zdHIiO3M6MTg6IjM3MTg4NzY3Njc3OTM5NzEyMCI7czo0OiJ0ZXh0IjtzOjQxOiJAbmlnaHRzaGlmdGMgaGVoZS4uLiBJJ20gZ3Vlc3Npbmc6IGEgUEpQPyI7czo2OiJzb3VyY2UiO3M6ODI6IjxhIGhyZWY9Imh0dHA6Ly90d2l0dGVyLmNvbS9kb3dubG9hZC9pcGhvbmUiIHJlbD0ibm9mb2xsb3ciPlR3aXR0ZXIgZm9yIGlQaG9uZTwvYT4iO3M6OToidHJ1bmNhdGVkIjtiOjA7czoyMToiaW5fcmVwbHlfdG9fc3RhdHVzX2lkIjtpOjM3MTY3NDU2NTkwNDQzMzE1MztzOjI1OiJpbl9yZXBseV90b19zdGF0dXNfaWRfc3RyIjtzOjE4OiIzNzE2NzQ1NjU5MDQ0MzMxNTMiO3M6MTk6ImluX3JlcGx5X3RvX3VzZXJfaWQiO2k6MTg4Njg2MDc7czoyMzoiaW5fcmVwbHlfdG9fdXNlcl9pZF9zdHIiO3M6ODoiMTg4Njg2MDciO3M6MjM6ImluX3JlcGx5X3RvX3NjcmVlbl9uYW1lIjtzOjExOiJuaWdodHNoaWZ0YyI7czo0OiJ1c2VyIjtPOjg6InN0ZENsYXNzIjozODp7czoyOiJpZCI7aToxMTAxMDc1NzI7czo2OiJpZF9zdHIiO3M6OToiMTEwMTA3NTcyIjtzOjQ6Im5hbWUiO3M6MTM6IkJhYnMgR8O2c2dlbnMiO3M6MTE6InNjcmVlbl9uYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo4OiJsb2NhdGlvbiI7czo4OiJSb3NtYWxlbiI7czoxMToiZGVzY3JpcHRpb24iO3M6MTM2OiIoV2ViKWRlc2lnbmVyIGFuZCBkZXZlbG9wZXIsIHN0dWJib3JuIGFzIGhlbGwsIGFsd2F5cyBxdWVzdGlvbmluZyBldmVyeXRoaW5nLiBMaWtlcyB0byByZS1pbnZlbnQgdGhlIHdoZWVsIHRvIHNlZSBpZiBpdCBjYW4gYmUgYXBwcm92ZWQuIjtzOjM6InVybCI7czoyMjoiaHR0cDovL3QuY28vbVZ5R3lDelRTYyI7czo4OiJlbnRpdGllcyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czozOiJ1cmwiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoidXJscyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6NDp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL21WeUd5Q3pUU2MiO3M6MTI6ImV4cGFuZGVkX3VybCI7czoyNDoiaHR0cDovL2Nyb3NzaW5naGlwcG9zLm5sIjtzOjExOiJkaXNwbGF5X3VybCI7czoxNzoiY3Jvc3NpbmdoaXBwb3MubmwiO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aTowO2k6MTtpOjIyO319fX1zOjExOiJkZXNjcmlwdGlvbiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJ1cmxzIjthOjA6e319fXM6OToicHJvdGVjdGVkIjtiOjA7czoxNToiZm9sbG93ZXJzX2NvdW50IjtpOjIwMztzOjEzOiJmcmllbmRzX2NvdW50IjtpOjE3NTtzOjEyOiJsaXN0ZWRfY291bnQiO2k6MTM7czoxMDoiY3JlYXRlZF9hdCI7czozMDoiU3VuIEphbiAzMSAxMDo0OTo0NyArMDAwMCAyMDEwIjtzOjE2OiJmYXZvdXJpdGVzX2NvdW50IjtpOjY5O3M6MTA6InV0Y19vZmZzZXQiO2k6LTcyMDA7czo5OiJ0aW1lX3pvbmUiO3M6OToiR3JlZW5sYW5kIjtzOjExOiJnZW9fZW5hYmxlZCI7YjoxO3M6ODoidmVyaWZpZWQiO2I6MDtzOjE0OiJzdGF0dXNlc19jb3VudCI7aToxMTM0O3M6NDoibGFuZyI7czoyOiJlbiI7czoyMDoiY29udHJpYnV0b3JzX2VuYWJsZWQiO2I6MDtzOjEzOiJpc190cmFuc2xhdG9yIjtiOjA7czoyNDoicHJvZmlsZV9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjEzMTUxNiI7czoyODoicHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlX3VybCI7czo5MjoiaHR0cDovL2EwLnR3aW1nLmNvbS9wcm9maWxlX2JhY2tncm91bmRfaW1hZ2VzLzI1MjA0MTA1NS94YzVlMDZhYWM5ZmIxNjRiZDkyNzUxYmMwNDQ3YjNlYi5wbmciO3M6MzQ6InByb2ZpbGVfYmFja2dyb3VuZF9pbWFnZV91cmxfaHR0cHMiO3M6OTQ6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2JhY2tncm91bmRfaW1hZ2VzLzI1MjA0MTA1NS94YzVlMDZhYWM5ZmIxNjRiZDkyNzUxYmMwNDQ3YjNlYi5wbmciO3M6MjM6InByb2ZpbGVfYmFja2dyb3VuZF90aWxlIjtiOjE7czoxNzoicHJvZmlsZV9pbWFnZV91cmwiO3M6NjI6Imh0dHA6Ly9hMC50d2ltZy5jb20vcHJvZmlsZV9pbWFnZXMvMTM1MDMyMDk1Mi9qYWIxMV9ub3JtYWwucG5nIjtzOjIzOiJwcm9maWxlX2ltYWdlX3VybF9odHRwcyI7czo2NDoiaHR0cHM6Ly9zaTAudHdpbWcuY29tL3Byb2ZpbGVfaW1hZ2VzLzEzNTAzMjA5NTIvamFiMTFfbm9ybWFsLnBuZyI7czoxODoicHJvZmlsZV9saW5rX2NvbG9yIjtzOjY6IjAwOTk5OSI7czoyODoicHJvZmlsZV9zaWRlYmFyX2JvcmRlcl9jb2xvciI7czo2OiJFRUVFRUUiO3M6MjY6InByb2ZpbGVfc2lkZWJhcl9maWxsX2NvbG9yIjtzOjY6IkVGRUZFRiI7czoxODoicHJvZmlsZV90ZXh0X2NvbG9yIjtzOjY6IjAwMDAwMCI7czoyODoicHJvZmlsZV91c2VfYmFja2dyb3VuZF9pbWFnZSI7YjowO3M6MTU6ImRlZmF1bHRfcHJvZmlsZSI7YjowO3M6MjE6ImRlZmF1bHRfcHJvZmlsZV9pbWFnZSI7YjowO3M6OToiZm9sbG93aW5nIjtiOjA7czoxOToiZm9sbG93X3JlcXVlc3Rfc2VudCI7YjowO3M6MTM6Im5vdGlmaWNhdGlvbnMiO2I6MDt9czozOiJnZW8iO047czoxMToiY29vcmRpbmF0ZXMiO047czo1OiJwbGFjZSI7TjtzOjEyOiJjb250cmlidXRvcnMiO047czoxMzoicmV0d2VldF9jb3VudCI7aTowO3M6MTQ6ImZhdm9yaXRlX2NvdW50IjtpOjA7czo4OiJlbnRpdGllcyI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJoYXNodGFncyI7YTowOnt9czo3OiJzeW1ib2xzIjthOjA6e31zOjQ6InVybHMiO2E6MDp7fXM6MTM6InVzZXJfbWVudGlvbnMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjU6e3M6MTE6InNjcmVlbl9uYW1lIjtzOjExOiJuaWdodHNoaWZ0YyI7czo0OiJuYW1lIjtzOjE1OiJDcmlzdGluYSBTb2xhbmEiO3M6MjoiaWQiO2k6MTg4Njg2MDc7czo2OiJpZF9zdHIiO3M6ODoiMTg4Njg2MDciO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aTowO2k6MTtpOjEyO319fX1zOjk6ImZhdm9yaXRlZCI7YjowO3M6OToicmV0d2VldGVkIjtiOjA7czo0OiJsYW5nIjtzOjI6ImVuIjt9', '', 'https://twitter.com/babsgosgens/status/371887676779397120', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `flock_streams` (`id`, `api_id`, `post_id`, `date_created`, `raw`, `metadata`, `permalink`, `params`, `language`, `state`, `publish_up`, `publish_down`) VALUES
(21, 1, '371898063968686080', '2013-08-26 07:33:02', 'Tzo4OiJzdGRDbGFzcyI6MjM6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6Ik1vbiBBdWcgMjYgMDc6MzM6MDIgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNzE4OTgwNjM5Njg2ODYwODA7czo2OiJpZF9zdHIiO3M6MTg6IjM3MTg5ODA2Mzk2ODY4NjA4MCI7czo0OiJ0ZXh0IjtzOjEwMDoiRm91bmRhdGlvbiBJY29ucyBoYXZlIGJlZW4gdXBkYXRlZCAtIGl0J3MgYSBncmVhdCBjb2xsZWN0aW9uOiBodHRwOi8vdC5jby9EY1BmWktLNTA1IEBmb3VuZGF0aW9uenVyYiI7czo2OiJzb3VyY2UiO3M6Mzoid2ViIjtzOjk6InRydW5jYXRlZCI7YjowO3M6MjE6ImluX3JlcGx5X3RvX3N0YXR1c19pZCI7TjtzOjI1OiJpbl9yZXBseV90b19zdGF0dXNfaWRfc3RyIjtOO3M6MTk6ImluX3JlcGx5X3RvX3VzZXJfaWQiO047czoyMzoiaW5fcmVwbHlfdG9fdXNlcl9pZF9zdHIiO047czoyMzoiaW5fcmVwbHlfdG9fc2NyZWVuX25hbWUiO047czo0OiJ1c2VyIjtPOjg6InN0ZENsYXNzIjozODp7czoyOiJpZCI7aToxMTAxMDc1NzI7czo2OiJpZF9zdHIiO3M6OToiMTEwMTA3NTcyIjtzOjQ6Im5hbWUiO3M6MTM6IkJhYnMgR8O2c2dlbnMiO3M6MTE6InNjcmVlbl9uYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo4OiJsb2NhdGlvbiI7czo4OiJSb3NtYWxlbiI7czoxMToiZGVzY3JpcHRpb24iO3M6MTM2OiIoV2ViKWRlc2lnbmVyIGFuZCBkZXZlbG9wZXIsIHN0dWJib3JuIGFzIGhlbGwsIGFsd2F5cyBxdWVzdGlvbmluZyBldmVyeXRoaW5nLiBMaWtlcyB0byByZS1pbnZlbnQgdGhlIHdoZWVsIHRvIHNlZSBpZiBpdCBjYW4gYmUgYXBwcm92ZWQuIjtzOjM6InVybCI7czoyMjoiaHR0cDovL3QuY28vbVZ5R3lDelRTYyI7czo4OiJlbnRpdGllcyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czozOiJ1cmwiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoidXJscyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6NDp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL21WeUd5Q3pUU2MiO3M6MTI6ImV4cGFuZGVkX3VybCI7czoyNDoiaHR0cDovL2Nyb3NzaW5naGlwcG9zLm5sIjtzOjExOiJkaXNwbGF5X3VybCI7czoxNzoiY3Jvc3NpbmdoaXBwb3MubmwiO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aTowO2k6MTtpOjIyO319fX1zOjExOiJkZXNjcmlwdGlvbiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJ1cmxzIjthOjA6e319fXM6OToicHJvdGVjdGVkIjtiOjA7czoxNToiZm9sbG93ZXJzX2NvdW50IjtpOjIwMztzOjEzOiJmcmllbmRzX2NvdW50IjtpOjE3NTtzOjEyOiJsaXN0ZWRfY291bnQiO2k6MTM7czoxMDoiY3JlYXRlZF9hdCI7czozMDoiU3VuIEphbiAzMSAxMDo0OTo0NyArMDAwMCAyMDEwIjtzOjE2OiJmYXZvdXJpdGVzX2NvdW50IjtpOjY5O3M6MTA6InV0Y19vZmZzZXQiO2k6LTcyMDA7czo5OiJ0aW1lX3pvbmUiO3M6OToiR3JlZW5sYW5kIjtzOjExOiJnZW9fZW5hYmxlZCI7YjoxO3M6ODoidmVyaWZpZWQiO2I6MDtzOjE0OiJzdGF0dXNlc19jb3VudCI7aToxMTM0O3M6NDoibGFuZyI7czoyOiJlbiI7czoyMDoiY29udHJpYnV0b3JzX2VuYWJsZWQiO2I6MDtzOjEzOiJpc190cmFuc2xhdG9yIjtiOjA7czoyNDoicHJvZmlsZV9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjEzMTUxNiI7czoyODoicHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlX3VybCI7czo5MjoiaHR0cDovL2EwLnR3aW1nLmNvbS9wcm9maWxlX2JhY2tncm91bmRfaW1hZ2VzLzI1MjA0MTA1NS94YzVlMDZhYWM5ZmIxNjRiZDkyNzUxYmMwNDQ3YjNlYi5wbmciO3M6MzQ6InByb2ZpbGVfYmFja2dyb3VuZF9pbWFnZV91cmxfaHR0cHMiO3M6OTQ6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2JhY2tncm91bmRfaW1hZ2VzLzI1MjA0MTA1NS94YzVlMDZhYWM5ZmIxNjRiZDkyNzUxYmMwNDQ3YjNlYi5wbmciO3M6MjM6InByb2ZpbGVfYmFja2dyb3VuZF90aWxlIjtiOjE7czoxNzoicHJvZmlsZV9pbWFnZV91cmwiO3M6NjI6Imh0dHA6Ly9hMC50d2ltZy5jb20vcHJvZmlsZV9pbWFnZXMvMTM1MDMyMDk1Mi9qYWIxMV9ub3JtYWwucG5nIjtzOjIzOiJwcm9maWxlX2ltYWdlX3VybF9odHRwcyI7czo2NDoiaHR0cHM6Ly9zaTAudHdpbWcuY29tL3Byb2ZpbGVfaW1hZ2VzLzEzNTAzMjA5NTIvamFiMTFfbm9ybWFsLnBuZyI7czoxODoicHJvZmlsZV9saW5rX2NvbG9yIjtzOjY6IjAwOTk5OSI7czoyODoicHJvZmlsZV9zaWRlYmFyX2JvcmRlcl9jb2xvciI7czo2OiJFRUVFRUUiO3M6MjY6InByb2ZpbGVfc2lkZWJhcl9maWxsX2NvbG9yIjtzOjY6IkVGRUZFRiI7czoxODoicHJvZmlsZV90ZXh0X2NvbG9yIjtzOjY6IjAwMDAwMCI7czoyODoicHJvZmlsZV91c2VfYmFja2dyb3VuZF9pbWFnZSI7YjowO3M6MTU6ImRlZmF1bHRfcHJvZmlsZSI7YjowO3M6MjE6ImRlZmF1bHRfcHJvZmlsZV9pbWFnZSI7YjowO3M6OToiZm9sbG93aW5nIjtiOjA7czoxOToiZm9sbG93X3JlcXVlc3Rfc2VudCI7YjowO3M6MTM6Im5vdGlmaWNhdGlvbnMiO2I6MDt9czozOiJnZW8iO047czoxMToiY29vcmRpbmF0ZXMiO047czo1OiJwbGFjZSI7TjtzOjEyOiJjb250cmlidXRvcnMiO047czoxMzoicmV0d2VldF9jb3VudCI7aToyO3M6MTQ6ImZhdm9yaXRlX2NvdW50IjtpOjI7czo4OiJlbnRpdGllcyI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJoYXNodGFncyI7YTowOnt9czo3OiJzeW1ib2xzIjthOjA6e31zOjQ6InVybHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjQ6e3M6MzoidXJsIjtzOjIyOiJodHRwOi8vdC5jby9EY1BmWktLNTA1IjtzOjEyOiJleHBhbmRlZF91cmwiO3M6NTA6Imh0dHA6Ly96dXJiLmNvbS9wbGF5Z3JvdW5kL2ZvdW5kYXRpb24taWNvbi1mb250cy0zIjtzOjExOiJkaXNwbGF5X3VybCI7czoyNjoienVyYi5jb20vcGxheWdyb3VuZC9mb3XigKYiO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aTo2MjtpOjE7aTo4NDt9fX1zOjEzOiJ1c2VyX21lbnRpb25zIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjo1OntzOjExOiJzY3JlZW5fbmFtZSI7czoxNDoiZm91bmRhdGlvbnp1cmIiO3M6NDoibmFtZSI7czoxODoiRm91bmRhdGlvbiBieSBaVVJCIjtzOjI6ImlkIjtpOjM2MDQzNDU4NjtzOjY6ImlkX3N0ciI7czo5OiIzNjA0MzQ1ODYiO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aTo4NTtpOjE7aToxMDA7fX19fXM6OToiZmF2b3JpdGVkIjtiOjA7czo5OiJyZXR3ZWV0ZWQiO2I6MDtzOjE4OiJwb3NzaWJseV9zZW5zaXRpdmUiO2I6MDtzOjQ6ImxhbmciO3M6MjoiZW4iO30=', '', 'https://twitter.com/babsgosgens/status/371898063968686080', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 1, '371900495025041408', '2013-08-26 07:42:42', 'Tzo4OiJzdGRDbGFzcyI6MjM6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6Ik1vbiBBdWcgMjYgMDc6NDI6NDIgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNzE5MDA0OTUwMjUwNDE0MDg7czo2OiJpZF9zdHIiO3M6MTg6IjM3MTkwMDQ5NTAyNTA0MTQwOCI7czo0OiJ0ZXh0IjtzOjY4OiJBd2Vzb21lIHJvdW5kdXAgb2YgKFIpV0QgdG9vbHMgYnkgQGJyYWRfZnJvc3QgaHR0cDovL3QuY28vTmpzQVFaOXdWaiI7czo2OiJzb3VyY2UiO3M6NzI6IjxhIGhyZWY9Imh0dHA6Ly90d2l0dGVyLmNvbS90d2VldGJ1dHRvbiIgcmVsPSJub2ZvbGxvdyI+VHdlZXQgQnV0dG9uPC9hPiI7czo5OiJ0cnVuY2F0ZWQiO2I6MDtzOjIxOiJpbl9yZXBseV90b19zdGF0dXNfaWQiO047czoyNToiaW5fcmVwbHlfdG9fc3RhdHVzX2lkX3N0ciI7TjtzOjE5OiJpbl9yZXBseV90b191c2VyX2lkIjtOO3M6MjM6ImluX3JlcGx5X3RvX3VzZXJfaWRfc3RyIjtOO3M6MjM6ImluX3JlcGx5X3RvX3NjcmVlbl9uYW1lIjtOO3M6NDoidXNlciI7Tzo4OiJzdGRDbGFzcyI6Mzg6e3M6MjoiaWQiO2k6MTEwMTA3NTcyO3M6NjoiaWRfc3RyIjtzOjk6IjExMDEwNzU3MiI7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjExOiJzY3JlZW5fbmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6ODoibG9jYXRpb24iO3M6ODoiUm9zbWFsZW4iO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjEzNjoiKFdlYilkZXNpZ25lciBhbmQgZGV2ZWxvcGVyLCBzdHViYm9ybiBhcyBoZWxsLCBhbHdheXMgcXVlc3Rpb25pbmcgZXZlcnl0aGluZy4gTGlrZXMgdG8gcmUtaW52ZW50IHRoZSB3aGVlbCB0byBzZWUgaWYgaXQgY2FuIGJlIGFwcHJvdmVkLiI7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL21WeUd5Q3pUU2MiO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjI6e3M6MzoidXJsIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6InVybHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjQ6e3M6MzoidXJsIjtzOjIyOiJodHRwOi8vdC5jby9tVnlHeUN6VFNjIjtzOjEyOiJleHBhbmRlZF91cmwiO3M6MjQ6Imh0dHA6Ly9jcm9zc2luZ2hpcHBvcy5ubCI7czoxMToiZGlzcGxheV91cmwiO3M6MTc6ImNyb3NzaW5naGlwcG9zLm5sIjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6MDtpOjE7aToyMjt9fX19czoxMToiZGVzY3JpcHRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NDoidXJscyI7YTowOnt9fX1zOjk6InByb3RlY3RlZCI7YjowO3M6MTU6ImZvbGxvd2Vyc19jb3VudCI7aToyMDM7czoxMzoiZnJpZW5kc19jb3VudCI7aToxNzU7czoxMjoibGlzdGVkX2NvdW50IjtpOjEzO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IlN1biBKYW4gMzEgMTA6NDk6NDcgKzAwMDAgMjAxMCI7czoxNjoiZmF2b3VyaXRlc19jb3VudCI7aTo2OTtzOjEwOiJ1dGNfb2Zmc2V0IjtpOi03MjAwO3M6OToidGltZV96b25lIjtzOjk6IkdyZWVubGFuZCI7czoxMToiZ2VvX2VuYWJsZWQiO2I6MTtzOjg6InZlcmlmaWVkIjtiOjA7czoxNDoic3RhdHVzZXNfY291bnQiO2k6MTEzNDtzOjQ6ImxhbmciO3M6MjoiZW4iO3M6MjA6ImNvbnRyaWJ1dG9yc19lbmFibGVkIjtiOjA7czoxMzoiaXNfdHJhbnNsYXRvciI7YjowO3M6MjQ6InByb2ZpbGVfYmFja2dyb3VuZF9jb2xvciI7czo2OiIxMzE1MTYiO3M6Mjg6InByb2ZpbGVfYmFja2dyb3VuZF9pbWFnZV91cmwiO3M6OTI6Imh0dHA6Ly9hMC50d2ltZy5jb20vcHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlcy8yNTIwNDEwNTUveGM1ZTA2YWFjOWZiMTY0YmQ5Mjc1MWJjMDQ0N2IzZWIucG5nIjtzOjM0OiJwcm9maWxlX2JhY2tncm91bmRfaW1hZ2VfdXJsX2h0dHBzIjtzOjk0OiJodHRwczovL3NpMC50d2ltZy5jb20vcHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlcy8yNTIwNDEwNTUveGM1ZTA2YWFjOWZiMTY0YmQ5Mjc1MWJjMDQ0N2IzZWIucG5nIjtzOjIzOiJwcm9maWxlX2JhY2tncm91bmRfdGlsZSI7YjoxO3M6MTc6InByb2ZpbGVfaW1hZ2VfdXJsIjtzOjYyOiJodHRwOi8vYTAudHdpbWcuY29tL3Byb2ZpbGVfaW1hZ2VzLzEzNTAzMjA5NTIvamFiMTFfbm9ybWFsLnBuZyI7czoyMzoicHJvZmlsZV9pbWFnZV91cmxfaHR0cHMiO3M6NjQ6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2ltYWdlcy8xMzUwMzIwOTUyL2phYjExX25vcm1hbC5wbmciO3M6MTg6InByb2ZpbGVfbGlua19jb2xvciI7czo2OiIwMDk5OTkiO3M6Mjg6InByb2ZpbGVfc2lkZWJhcl9ib3JkZXJfY29sb3IiO3M6NjoiRUVFRUVFIjtzOjI2OiJwcm9maWxlX3NpZGViYXJfZmlsbF9jb2xvciI7czo2OiJFRkVGRUYiO3M6MTg6InByb2ZpbGVfdGV4dF9jb2xvciI7czo2OiIwMDAwMDAiO3M6Mjg6InByb2ZpbGVfdXNlX2JhY2tncm91bmRfaW1hZ2UiO2I6MDtzOjE1OiJkZWZhdWx0X3Byb2ZpbGUiO2I6MDtzOjIxOiJkZWZhdWx0X3Byb2ZpbGVfaW1hZ2UiO2I6MDtzOjk6ImZvbGxvd2luZyI7YjowO3M6MTk6ImZvbGxvd19yZXF1ZXN0X3NlbnQiO2I6MDtzOjEzOiJub3RpZmljYXRpb25zIjtiOjA7fXM6MzoiZ2VvIjtOO3M6MTE6ImNvb3JkaW5hdGVzIjtOO3M6NToicGxhY2UiO047czoxMjoiY29udHJpYnV0b3JzIjtOO3M6MTM6InJldHdlZXRfY291bnQiO2k6MDtzOjE0OiJmYXZvcml0ZV9jb3VudCI7aToxO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoiaGFzaHRhZ3MiO2E6MDp7fXM6Nzoic3ltYm9scyI7YTowOnt9czo0OiJ1cmxzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjo0OntzOjM6InVybCI7czoyMjoiaHR0cDovL3QuY28vTmpzQVFaOXdWaiI7czoxMjoiZXhwYW5kZWRfdXJsIjtzOjY2OiJodHRwOi8vd3d3Lm5ldG1hZ2F6aW5lLmNvbS9mZWF0dXJlcy90b3AtMjUtcmVzcG9uc2l2ZS1kZXNpZ24tdG9vbHMiO3M6MTE6ImRpc3BsYXlfdXJsIjtzOjMzOiJuZXRtYWdhemluZS5jb20vZmVhdHVyZXMvdG9wLTLigKYiO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aTo0NjtpOjE7aTo2ODt9fX1zOjEzOiJ1c2VyX21lbnRpb25zIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjo1OntzOjExOiJzY3JlZW5fbmFtZSI7czoxMDoiYnJhZF9mcm9zdCI7czo0OiJuYW1lIjtzOjEwOiJCcmFkIEZyb3N0IjtzOjI6ImlkIjtpOjExODU1NDgyO3M6NjoiaWRfc3RyIjtzOjg6IjExODU1NDgyIjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6MzQ7aToxO2k6NDU7fX19fXM6OToiZmF2b3JpdGVkIjtiOjA7czo5OiJyZXR3ZWV0ZWQiO2I6MDtzOjE4OiJwb3NzaWJseV9zZW5zaXRpdmUiO2I6MDtzOjQ6ImxhbmciO3M6MjoiZW4iO30=', '', 'https://twitter.com/babsgosgens/status/371900495025041408', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 1, '371953090511261696', '2013-08-26 11:11:41', 'Tzo4OiJzdGRDbGFzcyI6MjI6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6Ik1vbiBBdWcgMjYgMTE6MTE6NDEgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNzE5NTMwOTA1MTEyNjE2OTY7czo2OiJpZF9zdHIiO3M6MTg6IjM3MTk1MzA5MDUxMTI2MTY5NiI7czo0OiJ0ZXh0IjtzOjQ2OiJAbmlnaHRzaGlmdGMgUEogUGFydHkgbG9sLCB5dXAgc291bmRzIHBlcmZlY3QhIjtzOjY6InNvdXJjZSI7czo4MjoiPGEgaHJlZj0iaHR0cDovL3R3aXR0ZXIuY29tL2Rvd25sb2FkL2lwaG9uZSIgcmVsPSJub2ZvbGxvdyI+VHdpdHRlciBmb3IgaVBob25lPC9hPiI7czo5OiJ0cnVuY2F0ZWQiO2I6MDtzOjIxOiJpbl9yZXBseV90b19zdGF0dXNfaWQiO2k6MzcxOTUyMTk4NTQ2Mzc4NzUyO3M6MjU6ImluX3JlcGx5X3RvX3N0YXR1c19pZF9zdHIiO3M6MTg6IjM3MTk1MjE5ODU0NjM3ODc1MiI7czoxOToiaW5fcmVwbHlfdG9fdXNlcl9pZCI7aToxODg2ODYwNztzOjIzOiJpbl9yZXBseV90b191c2VyX2lkX3N0ciI7czo4OiIxODg2ODYwNyI7czoyMzoiaW5fcmVwbHlfdG9fc2NyZWVuX25hbWUiO3M6MTE6Im5pZ2h0c2hpZnRjIjtzOjQ6InVzZXIiO086ODoic3RkQ2xhc3MiOjM4OntzOjI6ImlkIjtpOjExMDEwNzU3MjtzOjY6ImlkX3N0ciI7czo5OiIxMTAxMDc1NzIiO3M6NDoibmFtZSI7czoxMzoiQmFicyBHw7ZzZ2VucyI7czoxMToic2NyZWVuX25hbWUiO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjg6ImxvY2F0aW9uIjtzOjg6IlJvc21hbGVuIjtzOjExOiJkZXNjcmlwdGlvbiI7czoxMzY6IihXZWIpZGVzaWduZXIgYW5kIGRldmVsb3Blciwgc3R1YmJvcm4gYXMgaGVsbCwgYWx3YXlzIHF1ZXN0aW9uaW5nIGV2ZXJ5dGhpbmcuIExpa2VzIHRvIHJlLWludmVudCB0aGUgd2hlZWwgdG8gc2VlIGlmIGl0IGNhbiBiZSBhcHByb3ZlZC4iO3M6MzoidXJsIjtzOjIyOiJodHRwOi8vdC5jby9tVnlHeUN6VFNjIjtzOjg6ImVudGl0aWVzIjtPOjg6InN0ZENsYXNzIjoyOntzOjM6InVybCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJ1cmxzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjo0OntzOjM6InVybCI7czoyMjoiaHR0cDovL3QuY28vbVZ5R3lDelRTYyI7czoxMjoiZXhwYW5kZWRfdXJsIjtzOjI0OiJodHRwOi8vY3Jvc3NpbmdoaXBwb3MubmwiO3M6MTE6ImRpc3BsYXlfdXJsIjtzOjE3OiJjcm9zc2luZ2hpcHBvcy5ubCI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjA7aToxO2k6MjI7fX19fXM6MTE6ImRlc2NyaXB0aW9uIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6InVybHMiO2E6MDp7fX19czo5OiJwcm90ZWN0ZWQiO2I6MDtzOjE1OiJmb2xsb3dlcnNfY291bnQiO2k6MjAzO3M6MTM6ImZyaWVuZHNfY291bnQiO2k6MTc1O3M6MTI6Imxpc3RlZF9jb3VudCI7aToxMztzOjEwOiJjcmVhdGVkX2F0IjtzOjMwOiJTdW4gSmFuIDMxIDEwOjQ5OjQ3ICswMDAwIDIwMTAiO3M6MTY6ImZhdm91cml0ZXNfY291bnQiO2k6Njk7czoxMDoidXRjX29mZnNldCI7aTotNzIwMDtzOjk6InRpbWVfem9uZSI7czo5OiJHcmVlbmxhbmQiO3M6MTE6Imdlb19lbmFibGVkIjtiOjE7czo4OiJ2ZXJpZmllZCI7YjowO3M6MTQ6InN0YXR1c2VzX2NvdW50IjtpOjExMzQ7czo0OiJsYW5nIjtzOjI6ImVuIjtzOjIwOiJjb250cmlidXRvcnNfZW5hYmxlZCI7YjowO3M6MTM6ImlzX3RyYW5zbGF0b3IiO2I6MDtzOjI0OiJwcm9maWxlX2JhY2tncm91bmRfY29sb3IiO3M6NjoiMTMxNTE2IjtzOjI4OiJwcm9maWxlX2JhY2tncm91bmRfaW1hZ2VfdXJsIjtzOjkyOiJodHRwOi8vYTAudHdpbWcuY29tL3Byb2ZpbGVfYmFja2dyb3VuZF9pbWFnZXMvMjUyMDQxMDU1L3hjNWUwNmFhYzlmYjE2NGJkOTI3NTFiYzA0NDdiM2ViLnBuZyI7czozNDoicHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlX3VybF9odHRwcyI7czo5NDoiaHR0cHM6Ly9zaTAudHdpbWcuY29tL3Byb2ZpbGVfYmFja2dyb3VuZF9pbWFnZXMvMjUyMDQxMDU1L3hjNWUwNmFhYzlmYjE2NGJkOTI3NTFiYzA0NDdiM2ViLnBuZyI7czoyMzoicHJvZmlsZV9iYWNrZ3JvdW5kX3RpbGUiO2I6MTtzOjE3OiJwcm9maWxlX2ltYWdlX3VybCI7czo2MjoiaHR0cDovL2EwLnR3aW1nLmNvbS9wcm9maWxlX2ltYWdlcy8xMzUwMzIwOTUyL2phYjExX25vcm1hbC5wbmciO3M6MjM6InByb2ZpbGVfaW1hZ2VfdXJsX2h0dHBzIjtzOjY0OiJodHRwczovL3NpMC50d2ltZy5jb20vcHJvZmlsZV9pbWFnZXMvMTM1MDMyMDk1Mi9qYWIxMV9ub3JtYWwucG5nIjtzOjE4OiJwcm9maWxlX2xpbmtfY29sb3IiO3M6NjoiMDA5OTk5IjtzOjI4OiJwcm9maWxlX3NpZGViYXJfYm9yZGVyX2NvbG9yIjtzOjY6IkVFRUVFRSI7czoyNjoicHJvZmlsZV9zaWRlYmFyX2ZpbGxfY29sb3IiO3M6NjoiRUZFRkVGIjtzOjE4OiJwcm9maWxlX3RleHRfY29sb3IiO3M6NjoiMDAwMDAwIjtzOjI4OiJwcm9maWxlX3VzZV9iYWNrZ3JvdW5kX2ltYWdlIjtiOjA7czoxNToiZGVmYXVsdF9wcm9maWxlIjtiOjA7czoyMToiZGVmYXVsdF9wcm9maWxlX2ltYWdlIjtiOjA7czo5OiJmb2xsb3dpbmciO2I6MDtzOjE5OiJmb2xsb3dfcmVxdWVzdF9zZW50IjtiOjA7czoxMzoibm90aWZpY2F0aW9ucyI7YjowO31zOjM6ImdlbyI7TjtzOjExOiJjb29yZGluYXRlcyI7TjtzOjU6InBsYWNlIjtOO3M6MTI6ImNvbnRyaWJ1dG9ycyI7TjtzOjEzOiJyZXR3ZWV0X2NvdW50IjtpOjA7czoxNDoiZmF2b3JpdGVfY291bnQiO2k6MDtzOjg6ImVudGl0aWVzIjtPOjg6InN0ZENsYXNzIjo0OntzOjg6Imhhc2h0YWdzIjthOjA6e31zOjc6InN5bWJvbHMiO2E6MDp7fXM6NDoidXJscyI7YTowOnt9czoxMzoidXNlcl9tZW50aW9ucyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6NTp7czoxMToic2NyZWVuX25hbWUiO3M6MTE6Im5pZ2h0c2hpZnRjIjtzOjQ6Im5hbWUiO3M6MTU6IkNyaXN0aW5hIFNvbGFuYSI7czoyOiJpZCI7aToxODg2ODYwNztzOjY6ImlkX3N0ciI7czo4OiIxODg2ODYwNyI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjA7aToxO2k6MTI7fX19fXM6OToiZmF2b3JpdGVkIjtiOjA7czo5OiJyZXR3ZWV0ZWQiO2I6MDtzOjQ6ImxhbmciO3M6MjoiZW4iO30=', '', 'https://twitter.com/babsgosgens/status/371953090511261696', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 1, '372803567843033089', '2013-08-28 19:31:11', 'Tzo4OiJzdGRDbGFzcyI6MjI6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IldlZCBBdWcgMjggMTk6MzE6MTEgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNzI4MDM1Njc4NDMwMzMwODk7czo2OiJpZF9zdHIiO3M6MTg6IjM3MjgwMzU2Nzg0MzAzMzA4OSI7czo0OiJ0ZXh0IjtzOjU0OiJAbmlnaHRzaGlmdGMgeW91IHRoZXJlPyBDYW4gbGVhdmUgaW4gMTAsIGhvbWUgaW4gMjAuLi4iO3M6Njoic291cmNlIjtzOjgyOiI8YSBocmVmPSJodHRwOi8vdHdpdHRlci5jb20vZG93bmxvYWQvaXBob25lIiByZWw9Im5vZm9sbG93Ij5Ud2l0dGVyIGZvciBpUGhvbmU8L2E+IjtzOjk6InRydW5jYXRlZCI7YjowO3M6MjE6ImluX3JlcGx5X3RvX3N0YXR1c19pZCI7TjtzOjI1OiJpbl9yZXBseV90b19zdGF0dXNfaWRfc3RyIjtOO3M6MTk6ImluX3JlcGx5X3RvX3VzZXJfaWQiO2k6MTg4Njg2MDc7czoyMzoiaW5fcmVwbHlfdG9fdXNlcl9pZF9zdHIiO3M6ODoiMTg4Njg2MDciO3M6MjM6ImluX3JlcGx5X3RvX3NjcmVlbl9uYW1lIjtzOjExOiJuaWdodHNoaWZ0YyI7czo0OiJ1c2VyIjtPOjg6InN0ZENsYXNzIjozODp7czoyOiJpZCI7aToxMTAxMDc1NzI7czo2OiJpZF9zdHIiO3M6OToiMTEwMTA3NTcyIjtzOjQ6Im5hbWUiO3M6MTM6IkJhYnMgR8O2c2dlbnMiO3M6MTE6InNjcmVlbl9uYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo4OiJsb2NhdGlvbiI7czo4OiJSb3NtYWxlbiI7czoxMToiZGVzY3JpcHRpb24iO3M6MTM2OiIoV2ViKWRlc2lnbmVyIGFuZCBkZXZlbG9wZXIsIHN0dWJib3JuIGFzIGhlbGwsIGFsd2F5cyBxdWVzdGlvbmluZyBldmVyeXRoaW5nLiBMaWtlcyB0byByZS1pbnZlbnQgdGhlIHdoZWVsIHRvIHNlZSBpZiBpdCBjYW4gYmUgYXBwcm92ZWQuIjtzOjM6InVybCI7czoyMjoiaHR0cDovL3QuY28vbVZ5R3lDelRTYyI7czo4OiJlbnRpdGllcyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czozOiJ1cmwiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoidXJscyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6NDp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL21WeUd5Q3pUU2MiO3M6MTI6ImV4cGFuZGVkX3VybCI7czoyNDoiaHR0cDovL2Nyb3NzaW5naGlwcG9zLm5sIjtzOjExOiJkaXNwbGF5X3VybCI7czoxNzoiY3Jvc3NpbmdoaXBwb3MubmwiO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aTowO2k6MTtpOjIyO319fX1zOjExOiJkZXNjcmlwdGlvbiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJ1cmxzIjthOjA6e319fXM6OToicHJvdGVjdGVkIjtiOjA7czoxNToiZm9sbG93ZXJzX2NvdW50IjtpOjIwMztzOjEzOiJmcmllbmRzX2NvdW50IjtpOjE3NTtzOjEyOiJsaXN0ZWRfY291bnQiO2k6MTM7czoxMDoiY3JlYXRlZF9hdCI7czozMDoiU3VuIEphbiAzMSAxMDo0OTo0NyArMDAwMCAyMDEwIjtzOjE2OiJmYXZvdXJpdGVzX2NvdW50IjtpOjY5O3M6MTA6InV0Y19vZmZzZXQiO2k6LTcyMDA7czo5OiJ0aW1lX3pvbmUiO3M6OToiR3JlZW5sYW5kIjtzOjExOiJnZW9fZW5hYmxlZCI7YjoxO3M6ODoidmVyaWZpZWQiO2I6MDtzOjE0OiJzdGF0dXNlc19jb3VudCI7aToxMTM0O3M6NDoibGFuZyI7czoyOiJlbiI7czoyMDoiY29udHJpYnV0b3JzX2VuYWJsZWQiO2I6MDtzOjEzOiJpc190cmFuc2xhdG9yIjtiOjA7czoyNDoicHJvZmlsZV9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjEzMTUxNiI7czoyODoicHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlX3VybCI7czo5MjoiaHR0cDovL2EwLnR3aW1nLmNvbS9wcm9maWxlX2JhY2tncm91bmRfaW1hZ2VzLzI1MjA0MTA1NS94YzVlMDZhYWM5ZmIxNjRiZDkyNzUxYmMwNDQ3YjNlYi5wbmciO3M6MzQ6InByb2ZpbGVfYmFja2dyb3VuZF9pbWFnZV91cmxfaHR0cHMiO3M6OTQ6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2JhY2tncm91bmRfaW1hZ2VzLzI1MjA0MTA1NS94YzVlMDZhYWM5ZmIxNjRiZDkyNzUxYmMwNDQ3YjNlYi5wbmciO3M6MjM6InByb2ZpbGVfYmFja2dyb3VuZF90aWxlIjtiOjE7czoxNzoicHJvZmlsZV9pbWFnZV91cmwiO3M6NjI6Imh0dHA6Ly9hMC50d2ltZy5jb20vcHJvZmlsZV9pbWFnZXMvMTM1MDMyMDk1Mi9qYWIxMV9ub3JtYWwucG5nIjtzOjIzOiJwcm9maWxlX2ltYWdlX3VybF9odHRwcyI7czo2NDoiaHR0cHM6Ly9zaTAudHdpbWcuY29tL3Byb2ZpbGVfaW1hZ2VzLzEzNTAzMjA5NTIvamFiMTFfbm9ybWFsLnBuZyI7czoxODoicHJvZmlsZV9saW5rX2NvbG9yIjtzOjY6IjAwOTk5OSI7czoyODoicHJvZmlsZV9zaWRlYmFyX2JvcmRlcl9jb2xvciI7czo2OiJFRUVFRUUiO3M6MjY6InByb2ZpbGVfc2lkZWJhcl9maWxsX2NvbG9yIjtzOjY6IkVGRUZFRiI7czoxODoicHJvZmlsZV90ZXh0X2NvbG9yIjtzOjY6IjAwMDAwMCI7czoyODoicHJvZmlsZV91c2VfYmFja2dyb3VuZF9pbWFnZSI7YjowO3M6MTU6ImRlZmF1bHRfcHJvZmlsZSI7YjowO3M6MjE6ImRlZmF1bHRfcHJvZmlsZV9pbWFnZSI7YjowO3M6OToiZm9sbG93aW5nIjtiOjA7czoxOToiZm9sbG93X3JlcXVlc3Rfc2VudCI7YjowO3M6MTM6Im5vdGlmaWNhdGlvbnMiO2I6MDt9czozOiJnZW8iO047czoxMToiY29vcmRpbmF0ZXMiO047czo1OiJwbGFjZSI7TjtzOjEyOiJjb250cmlidXRvcnMiO047czoxMzoicmV0d2VldF9jb3VudCI7aTowO3M6MTQ6ImZhdm9yaXRlX2NvdW50IjtpOjA7czo4OiJlbnRpdGllcyI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJoYXNodGFncyI7YTowOnt9czo3OiJzeW1ib2xzIjthOjA6e31zOjQ6InVybHMiO2E6MDp7fXM6MTM6InVzZXJfbWVudGlvbnMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjU6e3M6MTE6InNjcmVlbl9uYW1lIjtzOjExOiJuaWdodHNoaWZ0YyI7czo0OiJuYW1lIjtzOjE1OiJDcmlzdGluYSBTb2xhbmEiO3M6MjoiaWQiO2k6MTg4Njg2MDc7czo2OiJpZF9zdHIiO3M6ODoiMTg4Njg2MDciO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aTowO2k6MTtpOjEyO319fX1zOjk6ImZhdm9yaXRlZCI7YjowO3M6OToicmV0d2VldGVkIjtiOjA7czo0OiJsYW5nIjtzOjI6ImVuIjt9', '', 'https://twitter.com/babsgosgens/status/372803567843033089', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 1, '373369733640228864', '2013-08-30 09:00:56', 'Tzo4OiJzdGRDbGFzcyI6MjM6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IkZyaSBBdWcgMzAgMDk6MDA6NTYgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNzMzNjk3MzM2NDAyMjg4NjQ7czo2OiJpZF9zdHIiO3M6MTg6IjM3MzM2OTczMzY0MDIyODg2NCI7czo0OiJ0ZXh0IjtzOjYwOiI4IENvbXBhc3MgZXh0ZW5zaW9ucyB5b3UgbWF5IG5vdCBrbm93IGh0dHA6Ly90LmNvL2tqbFV4MzFjbTciO3M6Njoic291cmNlIjtzOjcyOiI8YSBocmVmPSJodHRwOi8vdHdpdHRlci5jb20vdHdlZXRidXR0b24iIHJlbD0ibm9mb2xsb3ciPlR3ZWV0IEJ1dHRvbjwvYT4iO3M6OToidHJ1bmNhdGVkIjtiOjA7czoyMToiaW5fcmVwbHlfdG9fc3RhdHVzX2lkIjtOO3M6MjU6ImluX3JlcGx5X3RvX3N0YXR1c19pZF9zdHIiO047czoxOToiaW5fcmVwbHlfdG9fdXNlcl9pZCI7TjtzOjIzOiJpbl9yZXBseV90b191c2VyX2lkX3N0ciI7TjtzOjIzOiJpbl9yZXBseV90b19zY3JlZW5fbmFtZSI7TjtzOjQ6InVzZXIiO086ODoic3RkQ2xhc3MiOjM4OntzOjI6ImlkIjtpOjExMDEwNzU3MjtzOjY6ImlkX3N0ciI7czo5OiIxMTAxMDc1NzIiO3M6NDoibmFtZSI7czoxMzoiQmFicyBHw7ZzZ2VucyI7czoxMToic2NyZWVuX25hbWUiO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjg6ImxvY2F0aW9uIjtzOjg6IlJvc21hbGVuIjtzOjExOiJkZXNjcmlwdGlvbiI7czoxMzY6IihXZWIpZGVzaWduZXIgYW5kIGRldmVsb3Blciwgc3R1YmJvcm4gYXMgaGVsbCwgYWx3YXlzIHF1ZXN0aW9uaW5nIGV2ZXJ5dGhpbmcuIExpa2VzIHRvIHJlLWludmVudCB0aGUgd2hlZWwgdG8gc2VlIGlmIGl0IGNhbiBiZSBhcHByb3ZlZC4iO3M6MzoidXJsIjtzOjIyOiJodHRwOi8vdC5jby9tVnlHeUN6VFNjIjtzOjg6ImVudGl0aWVzIjtPOjg6InN0ZENsYXNzIjoyOntzOjM6InVybCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJ1cmxzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjo0OntzOjM6InVybCI7czoyMjoiaHR0cDovL3QuY28vbVZ5R3lDelRTYyI7czoxMjoiZXhwYW5kZWRfdXJsIjtzOjI0OiJodHRwOi8vY3Jvc3NpbmdoaXBwb3MubmwiO3M6MTE6ImRpc3BsYXlfdXJsIjtzOjE3OiJjcm9zc2luZ2hpcHBvcy5ubCI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjA7aToxO2k6MjI7fX19fXM6MTE6ImRlc2NyaXB0aW9uIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6InVybHMiO2E6MDp7fX19czo5OiJwcm90ZWN0ZWQiO2I6MDtzOjE1OiJmb2xsb3dlcnNfY291bnQiO2k6MjAzO3M6MTM6ImZyaWVuZHNfY291bnQiO2k6MTc1O3M6MTI6Imxpc3RlZF9jb3VudCI7aToxMztzOjEwOiJjcmVhdGVkX2F0IjtzOjMwOiJTdW4gSmFuIDMxIDEwOjQ5OjQ3ICswMDAwIDIwMTAiO3M6MTY6ImZhdm91cml0ZXNfY291bnQiO2k6Njk7czoxMDoidXRjX29mZnNldCI7aTotNzIwMDtzOjk6InRpbWVfem9uZSI7czo5OiJHcmVlbmxhbmQiO3M6MTE6Imdlb19lbmFibGVkIjtiOjE7czo4OiJ2ZXJpZmllZCI7YjowO3M6MTQ6InN0YXR1c2VzX2NvdW50IjtpOjExMzQ7czo0OiJsYW5nIjtzOjI6ImVuIjtzOjIwOiJjb250cmlidXRvcnNfZW5hYmxlZCI7YjowO3M6MTM6ImlzX3RyYW5zbGF0b3IiO2I6MDtzOjI0OiJwcm9maWxlX2JhY2tncm91bmRfY29sb3IiO3M6NjoiMTMxNTE2IjtzOjI4OiJwcm9maWxlX2JhY2tncm91bmRfaW1hZ2VfdXJsIjtzOjkyOiJodHRwOi8vYTAudHdpbWcuY29tL3Byb2ZpbGVfYmFja2dyb3VuZF9pbWFnZXMvMjUyMDQxMDU1L3hjNWUwNmFhYzlmYjE2NGJkOTI3NTFiYzA0NDdiM2ViLnBuZyI7czozNDoicHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlX3VybF9odHRwcyI7czo5NDoiaHR0cHM6Ly9zaTAudHdpbWcuY29tL3Byb2ZpbGVfYmFja2dyb3VuZF9pbWFnZXMvMjUyMDQxMDU1L3hjNWUwNmFhYzlmYjE2NGJkOTI3NTFiYzA0NDdiM2ViLnBuZyI7czoyMzoicHJvZmlsZV9iYWNrZ3JvdW5kX3RpbGUiO2I6MTtzOjE3OiJwcm9maWxlX2ltYWdlX3VybCI7czo2MjoiaHR0cDovL2EwLnR3aW1nLmNvbS9wcm9maWxlX2ltYWdlcy8xMzUwMzIwOTUyL2phYjExX25vcm1hbC5wbmciO3M6MjM6InByb2ZpbGVfaW1hZ2VfdXJsX2h0dHBzIjtzOjY0OiJodHRwczovL3NpMC50d2ltZy5jb20vcHJvZmlsZV9pbWFnZXMvMTM1MDMyMDk1Mi9qYWIxMV9ub3JtYWwucG5nIjtzOjE4OiJwcm9maWxlX2xpbmtfY29sb3IiO3M6NjoiMDA5OTk5IjtzOjI4OiJwcm9maWxlX3NpZGViYXJfYm9yZGVyX2NvbG9yIjtzOjY6IkVFRUVFRSI7czoyNjoicHJvZmlsZV9zaWRlYmFyX2ZpbGxfY29sb3IiO3M6NjoiRUZFRkVGIjtzOjE4OiJwcm9maWxlX3RleHRfY29sb3IiO3M6NjoiMDAwMDAwIjtzOjI4OiJwcm9maWxlX3VzZV9iYWNrZ3JvdW5kX2ltYWdlIjtiOjA7czoxNToiZGVmYXVsdF9wcm9maWxlIjtiOjA7czoyMToiZGVmYXVsdF9wcm9maWxlX2ltYWdlIjtiOjA7czo5OiJmb2xsb3dpbmciO2I6MDtzOjE5OiJmb2xsb3dfcmVxdWVzdF9zZW50IjtiOjA7czoxMzoibm90aWZpY2F0aW9ucyI7YjowO31zOjM6ImdlbyI7TjtzOjExOiJjb29yZGluYXRlcyI7TjtzOjU6InBsYWNlIjtOO3M6MTI6ImNvbnRyaWJ1dG9ycyI7TjtzOjEzOiJyZXR3ZWV0X2NvdW50IjtpOjA7czoxNDoiZmF2b3JpdGVfY291bnQiO2k6MDtzOjg6ImVudGl0aWVzIjtPOjg6InN0ZENsYXNzIjo0OntzOjg6Imhhc2h0YWdzIjthOjA6e31zOjc6InN5bWJvbHMiO2E6MDp7fXM6NDoidXJscyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6NDp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL2tqbFV4MzFjbTciO3M6MTI6ImV4cGFuZGVkX3VybCI7czoyMToiaHR0cDovL2Rpc3EudXMvOGV2cjRiIjtzOjExOiJkaXNwbGF5X3VybCI7czoxNDoiZGlzcS51cy84ZXZyNGIiO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aTozODtpOjE7aTo2MDt9fX1zOjEzOiJ1c2VyX21lbnRpb25zIjthOjA6e319czo5OiJmYXZvcml0ZWQiO2I6MDtzOjk6InJldHdlZXRlZCI7YjowO3M6MTg6InBvc3NpYmx5X3NlbnNpdGl2ZSI7YjowO3M6NDoibGFuZyI7czoyOiJlbiI7fQ==', '', 'https://twitter.com/babsgosgens/status/373369733640228864', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 1, '375231207300022272', '2013-09-04 12:17:45', 'Tzo4OiJzdGRDbGFzcyI6MjM6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IldlZCBTZXAgMDQgMTI6MTc6NDUgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNzUyMzEyMDczMDAwMjIyNzI7czo2OiJpZF9zdHIiO3M6MTg6IjM3NTIzMTIwNzMwMDAyMjI3MiI7czo0OiJ0ZXh0IjtzOjE0MjoiUlQgQENoaWFyYUFsaW90dGE6IEhhdmUgeW91IGZpbmQgYSB3YWxsIGZvciB0aGUgUGl4ZWxsZXMgSXNsYW5kcycgcG9zdGVyPyBAY3Jvc3NpbmdoaXBwb3MganVzdCBzaGFyZWQgaXQgd2l0aCBtZSEgI29mZmljZSAjY3JlYXRpdml0eSBodHRwOuKApiI7czo2OiJzb3VyY2UiO3M6Mzoid2ViIjtzOjk6InRydW5jYXRlZCI7YjowO3M6MjE6ImluX3JlcGx5X3RvX3N0YXR1c19pZCI7TjtzOjI1OiJpbl9yZXBseV90b19zdGF0dXNfaWRfc3RyIjtOO3M6MTk6ImluX3JlcGx5X3RvX3VzZXJfaWQiO047czoyMzoiaW5fcmVwbHlfdG9fdXNlcl9pZF9zdHIiO047czoyMzoiaW5fcmVwbHlfdG9fc2NyZWVuX25hbWUiO047czo0OiJ1c2VyIjtPOjg6InN0ZENsYXNzIjozODp7czoyOiJpZCI7aToxMTAxMDc1NzI7czo2OiJpZF9zdHIiO3M6OToiMTEwMTA3NTcyIjtzOjQ6Im5hbWUiO3M6MTM6IkJhYnMgR8O2c2dlbnMiO3M6MTE6InNjcmVlbl9uYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo4OiJsb2NhdGlvbiI7czo4OiJSb3NtYWxlbiI7czoxMToiZGVzY3JpcHRpb24iO3M6MTM2OiIoV2ViKWRlc2lnbmVyIGFuZCBkZXZlbG9wZXIsIHN0dWJib3JuIGFzIGhlbGwsIGFsd2F5cyBxdWVzdGlvbmluZyBldmVyeXRoaW5nLiBMaWtlcyB0byByZS1pbnZlbnQgdGhlIHdoZWVsIHRvIHNlZSBpZiBpdCBjYW4gYmUgYXBwcm92ZWQuIjtzOjM6InVybCI7czoyMjoiaHR0cDovL3QuY28vbVZ5R3lDelRTYyI7czo4OiJlbnRpdGllcyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czozOiJ1cmwiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoidXJscyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6NDp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL21WeUd5Q3pUU2MiO3M6MTI6ImV4cGFuZGVkX3VybCI7czoyNDoiaHR0cDovL2Nyb3NzaW5naGlwcG9zLm5sIjtzOjExOiJkaXNwbGF5X3VybCI7czoxNzoiY3Jvc3NpbmdoaXBwb3MubmwiO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aTowO2k6MTtpOjIyO319fX1zOjExOiJkZXNjcmlwdGlvbiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJ1cmxzIjthOjA6e319fXM6OToicHJvdGVjdGVkIjtiOjA7czoxNToiZm9sbG93ZXJzX2NvdW50IjtpOjIwMztzOjEzOiJmcmllbmRzX2NvdW50IjtpOjE3NTtzOjEyOiJsaXN0ZWRfY291bnQiO2k6MTM7czoxMDoiY3JlYXRlZF9hdCI7czozMDoiU3VuIEphbiAzMSAxMDo0OTo0NyArMDAwMCAyMDEwIjtzOjE2OiJmYXZvdXJpdGVzX2NvdW50IjtpOjY5O3M6MTA6InV0Y19vZmZzZXQiO2k6LTcyMDA7czo5OiJ0aW1lX3pvbmUiO3M6OToiR3JlZW5sYW5kIjtzOjExOiJnZW9fZW5hYmxlZCI7YjoxO3M6ODoidmVyaWZpZWQiO2I6MDtzOjE0OiJzdGF0dXNlc19jb3VudCI7aToxMTM0O3M6NDoibGFuZyI7czoyOiJlbiI7czoyMDoiY29udHJpYnV0b3JzX2VuYWJsZWQiO2I6MDtzOjEzOiJpc190cmFuc2xhdG9yIjtiOjA7czoyNDoicHJvZmlsZV9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjEzMTUxNiI7czoyODoicHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlX3VybCI7czo5MjoiaHR0cDovL2EwLnR3aW1nLmNvbS9wcm9maWxlX2JhY2tncm91bmRfaW1hZ2VzLzI1MjA0MTA1NS94YzVlMDZhYWM5ZmIxNjRiZDkyNzUxYmMwNDQ3YjNlYi5wbmciO3M6MzQ6InByb2ZpbGVfYmFja2dyb3VuZF9pbWFnZV91cmxfaHR0cHMiO3M6OTQ6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2JhY2tncm91bmRfaW1hZ2VzLzI1MjA0MTA1NS94YzVlMDZhYWM5ZmIxNjRiZDkyNzUxYmMwNDQ3YjNlYi5wbmciO3M6MjM6InByb2ZpbGVfYmFja2dyb3VuZF90aWxlIjtiOjE7czoxNzoicHJvZmlsZV9pbWFnZV91cmwiO3M6NjI6Imh0dHA6Ly9hMC50d2ltZy5jb20vcHJvZmlsZV9pbWFnZXMvMTM1MDMyMDk1Mi9qYWIxMV9ub3JtYWwucG5nIjtzOjIzOiJwcm9maWxlX2ltYWdlX3VybF9odHRwcyI7czo2NDoiaHR0cHM6Ly9zaTAudHdpbWcuY29tL3Byb2ZpbGVfaW1hZ2VzLzEzNTAzMjA5NTIvamFiMTFfbm9ybWFsLnBuZyI7czoxODoicHJvZmlsZV9saW5rX2NvbG9yIjtzOjY6IjAwOTk5OSI7czoyODoicHJvZmlsZV9zaWRlYmFyX2JvcmRlcl9jb2xvciI7czo2OiJFRUVFRUUiO3M6MjY6InByb2ZpbGVfc2lkZWJhcl9maWxsX2NvbG9yIjtzOjY6IkVGRUZFRiI7czoxODoicHJvZmlsZV90ZXh0X2NvbG9yIjtzOjY6IjAwMDAwMCI7czoyODoicHJvZmlsZV91c2VfYmFja2dyb3VuZF9pbWFnZSI7YjowO3M6MTU6ImRlZmF1bHRfcHJvZmlsZSI7YjowO3M6MjE6ImRlZmF1bHRfcHJvZmlsZV9pbWFnZSI7YjowO3M6OToiZm9sbG93aW5nIjtiOjA7czoxOToiZm9sbG93X3JlcXVlc3Rfc2VudCI7YjowO3M6MTM6Im5vdGlmaWNhdGlvbnMiO2I6MDt9czozOiJnZW8iO047czoxMToiY29vcmRpbmF0ZXMiO047czo1OiJwbGFjZSI7TjtzOjEyOiJjb250cmlidXRvcnMiO047czoxNjoicmV0d2VldGVkX3N0YXR1cyI7Tzo4OiJzdGRDbGFzcyI6MjM6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IldlZCBTZXAgMDQgMTI6MDI6MTYgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNzUyMjczMDc1NTc4MTAxNzY7czo2OiJpZF9zdHIiO3M6MTg6IjM3NTIyNzMwNzU1NzgxMDE3NiI7czo0OiJ0ZXh0IjtzOjEzNzoiSGF2ZSB5b3UgZmluZCBhIHdhbGwgZm9yIHRoZSBQaXhlbGxlcyBJc2xhbmRzJyBwb3N0ZXI/IEBjcm9zc2luZ2hpcHBvcyBqdXN0IHNoYXJlZCBpdCB3aXRoIG1lISAjb2ZmaWNlICNjcmVhdGl2aXR5IGh0dHA6Ly90LmNvL2RPZGQ3Z0xhNEciO3M6Njoic291cmNlIjtzOjM6IndlYiI7czo5OiJ0cnVuY2F0ZWQiO2I6MDtzOjIxOiJpbl9yZXBseV90b19zdGF0dXNfaWQiO047czoyNToiaW5fcmVwbHlfdG9fc3RhdHVzX2lkX3N0ciI7TjtzOjE5OiJpbl9yZXBseV90b191c2VyX2lkIjtOO3M6MjM6ImluX3JlcGx5X3RvX3VzZXJfaWRfc3RyIjtOO3M6MjM6ImluX3JlcGx5X3RvX3NjcmVlbl9uYW1lIjtOO3M6NDoidXNlciI7Tzo4OiJzdGRDbGFzcyI6Mzk6e3M6MjoiaWQiO2k6NjA2MDYyNzQxO3M6NjoiaWRfc3RyIjtzOjk6IjYwNjA2Mjc0MSI7czo0OiJuYW1lIjtzOjE0OiJDaGlhcmEgQWxpb3R0YSI7czoxMToic2NyZWVuX25hbWUiO3M6MTM6IkNoaWFyYUFsaW90dGEiO3M6ODoibG9jYXRpb24iO3M6MDoiIjtzOjExOiJkZXNjcmlwdGlvbiI7czoxMzM6Ikl0YWxpYW4gZGVzaWduZXIgYW5kIHR5cG9ncmFwaHkgYWRkaWN0LiBGb3VuZGVyIG9mIHRoZSBzbWFsbCBjcmVhdGl2ZSBhZ2VuY3ksIFVudGlsIFN1bmRheS4gRW50aHVzaWFzdGljIHdlYiBkZXNpZ25lciBhdCBKb29tbGFzaGFjay4iO3M6MzoidXJsIjtzOjIyOiJodHRwOi8vdC5jby9md1pTbXJaZWV6IjtzOjg6ImVudGl0aWVzIjtPOjg6InN0ZENsYXNzIjoyOntzOjM6InVybCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJ1cmxzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjo0OntzOjM6InVybCI7czoyMjoiaHR0cDovL3QuY28vZndaU21yWmVleiI7czoxMjoiZXhwYW5kZWRfdXJsIjtzOjI1OiJodHRwOi8vd3d3LnVudGlsc3VuZGF5Lml0IjtzOjExOiJkaXNwbGF5X3VybCI7czoxNDoidW50aWxzdW5kYXkuaXQiO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aTowO2k6MTtpOjIyO319fX1zOjExOiJkZXNjcmlwdGlvbiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJ1cmxzIjthOjA6e319fXM6OToicHJvdGVjdGVkIjtiOjA7czoxNToiZm9sbG93ZXJzX2NvdW50IjtpOjIwNTtzOjEzOiJmcmllbmRzX2NvdW50IjtpOjI1NjtzOjEyOiJsaXN0ZWRfY291bnQiO2k6MTE7czoxMDoiY3JlYXRlZF9hdCI7czozMDoiVHVlIEp1biAxMiAwNjowMDo0OSArMDAwMCAyMDEyIjtzOjE2OiJmYXZvdXJpdGVzX2NvdW50IjtpOjE5O3M6MTA6InV0Y19vZmZzZXQiO2k6MTA4MDA7czo5OiJ0aW1lX3pvbmUiO3M6NjoiQXRoZW5zIjtzOjExOiJnZW9fZW5hYmxlZCI7YjowO3M6ODoidmVyaWZpZWQiO2I6MDtzOjE0OiJzdGF0dXNlc19jb3VudCI7aTo2MjU7czo0OiJsYW5nIjtzOjI6Iml0IjtzOjIwOiJjb250cmlidXRvcnNfZW5hYmxlZCI7YjowO3M6MTM6ImlzX3RyYW5zbGF0b3IiO2I6MDtzOjI0OiJwcm9maWxlX2JhY2tncm91bmRfY29sb3IiO3M6NjoiOEM4NTg1IjtzOjI4OiJwcm9maWxlX2JhY2tncm91bmRfaW1hZ2VfdXJsIjtzOjkzOiJodHRwOi8vYTAudHdpbWcuY29tL3Byb2ZpbGVfYmFja2dyb3VuZF9pbWFnZXMvODEzNjQzODY3LzJkODQzZjQ0N2QxYmQ1MTM2NTIzNTc0ODQ1YmE1MGFmLmpwZWciO3M6MzQ6InByb2ZpbGVfYmFja2dyb3VuZF9pbWFnZV91cmxfaHR0cHMiO3M6OTU6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2JhY2tncm91bmRfaW1hZ2VzLzgxMzY0Mzg2Ny8yZDg0M2Y0NDdkMWJkNTEzNjUyMzU3NDg0NWJhNTBhZi5qcGVnIjtzOjIzOiJwcm9maWxlX2JhY2tncm91bmRfdGlsZSI7YjowO3M6MTc6InByb2ZpbGVfaW1hZ2VfdXJsIjtzOjcxOiJodHRwOi8vYTAudHdpbWcuY29tL3Byb2ZpbGVfaW1hZ2VzLzIzMDEwMTg4MjUvQ2hpYXJhX1R3aXR0ZXJfbm9ybWFsLnBuZyI7czoyMzoicHJvZmlsZV9pbWFnZV91cmxfaHR0cHMiO3M6NzM6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2ltYWdlcy8yMzAxMDE4ODI1L0NoaWFyYV9Ud2l0dGVyX25vcm1hbC5wbmciO3M6MTg6InByb2ZpbGVfYmFubmVyX3VybCI7czo1ODoiaHR0cHM6Ly9wYnMudHdpbWcuY29tL3Byb2ZpbGVfYmFubmVycy82MDYwNjI3NDEvMTM1NzkxMDA5MyI7czoxODoicHJvZmlsZV9saW5rX2NvbG9yIjtzOjY6IjAwODRCNCI7czoyODoicHJvZmlsZV9zaWRlYmFyX2JvcmRlcl9jb2xvciI7czo2OiJGRkZGRkYiO3M6MjY6InByb2ZpbGVfc2lkZWJhcl9maWxsX2NvbG9yIjtzOjY6IkRERUVGNiI7czoxODoicHJvZmlsZV90ZXh0X2NvbG9yIjtzOjY6IjMzMzMzMyI7czoyODoicHJvZmlsZV91c2VfYmFja2dyb3VuZF9pbWFnZSI7YjoxO3M6MTU6ImRlZmF1bHRfcHJvZmlsZSI7YjowO3M6MjE6ImRlZmF1bHRfcHJvZmlsZV9pbWFnZSI7YjowO3M6OToiZm9sbG93aW5nIjtOO3M6MTk6ImZvbGxvd19yZXF1ZXN0X3NlbnQiO2I6MDtzOjEzOiJub3RpZmljYXRpb25zIjtOO31zOjM6ImdlbyI7TjtzOjExOiJjb29yZGluYXRlcyI7TjtzOjU6InBsYWNlIjtOO3M6MTI6ImNvbnRyaWJ1dG9ycyI7TjtzOjEzOiJyZXR3ZWV0X2NvdW50IjtpOjI7czoxNDoiZmF2b3JpdGVfY291bnQiO2k6MTtzOjg6ImVudGl0aWVzIjtPOjg6InN0ZENsYXNzIjo1OntzOjg6Imhhc2h0YWdzIjthOjI6e2k6MDtPOjg6InN0ZENsYXNzIjoyOntzOjQ6InRleHQiO3M6Njoib2ZmaWNlIjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6OTU7aToxO2k6MTAyO319aToxO086ODoic3RkQ2xhc3MiOjI6e3M6NDoidGV4dCI7czoxMDoiY3JlYXRpdml0eSI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjEwMztpOjE7aToxMTQ7fX19czo3OiJzeW1ib2xzIjthOjA6e31zOjQ6InVybHMiO2E6MDp7fXM6MTM6InVzZXJfbWVudGlvbnMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjU6e3M6MTE6InNjcmVlbl9uYW1lIjtzOjE0OiJjcm9zc2luZ2hpcHBvcyI7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtpOjIxMjg0NTQ4O3M6NjoiaWRfc3RyIjtzOjg6IjIxMjg0NTQ4IjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6NTU7aToxO2k6NzA7fX19czo1OiJtZWRpYSI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6MTA6e3M6MjoiaWQiO2k6Mzc1MjI3MzA3NTcwMzkzMDg4O3M6NjoiaWRfc3RyIjtzOjE4OiIzNzUyMjczMDc1NzAzOTMwODgiO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aToxMTU7aToxO2k6MTM3O31zOjk6Im1lZGlhX3VybCI7czo0NjoiaHR0cDovL3Bicy50d2ltZy5jb20vbWVkaWEvQlRVVFA0bkNjQUFJamdMLmpwZyI7czoxNToibWVkaWFfdXJsX2h0dHBzIjtzOjQ3OiJodHRwczovL3Bicy50d2ltZy5jb20vbWVkaWEvQlRVVFA0bkNjQUFJamdMLmpwZyI7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL2RPZGQ3Z0xhNEciO3M6MTE6ImRpc3BsYXlfdXJsIjtzOjI2OiJwaWMudHdpdHRlci5jb20vZE9kZDdnTGE0RyI7czoxMjoiZXhwYW5kZWRfdXJsIjtzOjY2OiJodHRwOi8vdHdpdHRlci5jb20vQ2hpYXJhQWxpb3R0YS9zdGF0dXMvMzc1MjI3MzA3NTU3ODEwMTc2L3Bob3RvLzEiO3M6NDoidHlwZSI7czo1OiJwaG90byI7czo1OiJzaXplcyI7Tzo4OiJzdGRDbGFzcyI6NDp7czo1OiJsYXJnZSI7Tzo4OiJzdGRDbGFzcyI6Mzp7czoxOiJ3IjtpOjEwMjQ7czoxOiJoIjtpOjEzNjU7czo2OiJyZXNpemUiO3M6MzoiZml0Ijt9czo1OiJ0aHVtYiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czoxOiJ3IjtpOjE1MDtzOjE6ImgiO2k6MTUwO3M6NjoicmVzaXplIjtzOjQ6ImNyb3AiO31zOjU6InNtYWxsIjtPOjg6InN0ZENsYXNzIjozOntzOjE6InciO2k6MzQwO3M6MToiaCI7aTo0NTM7czo2OiJyZXNpemUiO3M6MzoiZml0Ijt9czo2OiJtZWRpdW0iO086ODoic3RkQ2xhc3MiOjM6e3M6MToidyI7aTo2MDA7czoxOiJoIjtpOjgwMDtzOjY6InJlc2l6ZSI7czozOiJmaXQiO319fX19czo5OiJmYXZvcml0ZWQiO2I6MDtzOjk6InJldHdlZXRlZCI7YjowO3M6MTg6InBvc3NpYmx5X3NlbnNpdGl2ZSI7YjowO3M6NDoibGFuZyI7czoyOiJlbiI7fXM6MTM6InJldHdlZXRfY291bnQiO2k6MjtzOjE0OiJmYXZvcml0ZV9jb3VudCI7aTowO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoiaGFzaHRhZ3MiO2E6Mjp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6NDoidGV4dCI7czo2OiJvZmZpY2UiO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aToxMTQ7aToxO2k6MTIxO319aToxO086ODoic3RkQ2xhc3MiOjI6e3M6NDoidGV4dCI7czoxMDoiY3JlYXRpdml0eSI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjEyMjtpOjE7aToxMzM7fX19czo3OiJzeW1ib2xzIjthOjA6e31zOjQ6InVybHMiO2E6MDp7fXM6MTM6InVzZXJfbWVudGlvbnMiO2E6Mjp7aTowO086ODoic3RkQ2xhc3MiOjU6e3M6MTE6InNjcmVlbl9uYW1lIjtzOjEzOiJDaGlhcmFBbGlvdHRhIjtzOjQ6Im5hbWUiO3M6MTQ6IkNoaWFyYSBBbGlvdHRhIjtzOjI6ImlkIjtpOjYwNjA2Mjc0MTtzOjY6ImlkX3N0ciI7czo5OiI2MDYwNjI3NDEiO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aTozO2k6MTtpOjE3O319aToxO086ODoic3RkQ2xhc3MiOjU6e3M6MTE6InNjcmVlbl9uYW1lIjtzOjE0OiJjcm9zc2luZ2hpcHBvcyI7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtpOjIxMjg0NTQ4O3M6NjoiaWRfc3RyIjtzOjg6IjIxMjg0NTQ4IjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6NzQ7aToxO2k6ODk7fX19fXM6OToiZmF2b3JpdGVkIjtiOjA7czo5OiJyZXR3ZWV0ZWQiO2I6MDtzOjQ6ImxhbmciO3M6MjoiZW4iO30=', '', 'https://twitter.com/babsgosgens/status/375231207300022272', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 1, '375670051397197824', '2013-09-05 17:21:34', 'Tzo4OiJzdGRDbGFzcyI6MjM6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IlRodSBTZXAgMDUgMTc6MjE6MzQgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNzU2NzAwNTEzOTcxOTc4MjQ7czo2OiJpZF9zdHIiO3M6MTg6IjM3NTY3MDA1MTM5NzE5NzgyNCI7czo0OiJ0ZXh0IjtzOjg2OiJIb2Ugc3RhYXQgaGV0IG1ldCBqb3V3IHBlcnNvb25saWprIGxlaWRlcnNjaGFwPyBodHRwOi8vdC5jby9xQkpYV2xkSVc1IEBUd2VldEZsZXhmb2N1cyI7czo2OiJzb3VyY2UiO3M6ODE6IjxhIGhyZWY9Imh0dHA6Ly90d2l0dGVyLmNvbS8jIS9kb3dubG9hZC9pcGFkIiByZWw9Im5vZm9sbG93Ij5Ud2l0dGVyIGZvciBpUGFkPC9hPiI7czo5OiJ0cnVuY2F0ZWQiO2I6MDtzOjIxOiJpbl9yZXBseV90b19zdGF0dXNfaWQiO047czoyNToiaW5fcmVwbHlfdG9fc3RhdHVzX2lkX3N0ciI7TjtzOjE5OiJpbl9yZXBseV90b191c2VyX2lkIjtOO3M6MjM6ImluX3JlcGx5X3RvX3VzZXJfaWRfc3RyIjtOO3M6MjM6ImluX3JlcGx5X3RvX3NjcmVlbl9uYW1lIjtOO3M6NDoidXNlciI7Tzo4OiJzdGRDbGFzcyI6Mzg6e3M6MjoiaWQiO2k6MTEwMTA3NTcyO3M6NjoiaWRfc3RyIjtzOjk6IjExMDEwNzU3MiI7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjExOiJzY3JlZW5fbmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6ODoibG9jYXRpb24iO3M6ODoiUm9zbWFsZW4iO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjEzNjoiKFdlYilkZXNpZ25lciBhbmQgZGV2ZWxvcGVyLCBzdHViYm9ybiBhcyBoZWxsLCBhbHdheXMgcXVlc3Rpb25pbmcgZXZlcnl0aGluZy4gTGlrZXMgdG8gcmUtaW52ZW50IHRoZSB3aGVlbCB0byBzZWUgaWYgaXQgY2FuIGJlIGFwcHJvdmVkLiI7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL21WeUd5Q3pUU2MiO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjI6e3M6MzoidXJsIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6InVybHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjQ6e3M6MzoidXJsIjtzOjIyOiJodHRwOi8vdC5jby9tVnlHeUN6VFNjIjtzOjEyOiJleHBhbmRlZF91cmwiO3M6MjQ6Imh0dHA6Ly9jcm9zc2luZ2hpcHBvcy5ubCI7czoxMToiZGlzcGxheV91cmwiO3M6MTc6ImNyb3NzaW5naGlwcG9zLm5sIjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6MDtpOjE7aToyMjt9fX19czoxMToiZGVzY3JpcHRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NDoidXJscyI7YTowOnt9fX1zOjk6InByb3RlY3RlZCI7YjowO3M6MTU6ImZvbGxvd2Vyc19jb3VudCI7aToyMDM7czoxMzoiZnJpZW5kc19jb3VudCI7aToxNzU7czoxMjoibGlzdGVkX2NvdW50IjtpOjEzO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IlN1biBKYW4gMzEgMTA6NDk6NDcgKzAwMDAgMjAxMCI7czoxNjoiZmF2b3VyaXRlc19jb3VudCI7aTo2OTtzOjEwOiJ1dGNfb2Zmc2V0IjtpOi03MjAwO3M6OToidGltZV96b25lIjtzOjk6IkdyZWVubGFuZCI7czoxMToiZ2VvX2VuYWJsZWQiO2I6MTtzOjg6InZlcmlmaWVkIjtiOjA7czoxNDoic3RhdHVzZXNfY291bnQiO2k6MTEzNDtzOjQ6ImxhbmciO3M6MjoiZW4iO3M6MjA6ImNvbnRyaWJ1dG9yc19lbmFibGVkIjtiOjA7czoxMzoiaXNfdHJhbnNsYXRvciI7YjowO3M6MjQ6InByb2ZpbGVfYmFja2dyb3VuZF9jb2xvciI7czo2OiIxMzE1MTYiO3M6Mjg6InByb2ZpbGVfYmFja2dyb3VuZF9pbWFnZV91cmwiO3M6OTI6Imh0dHA6Ly9hMC50d2ltZy5jb20vcHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlcy8yNTIwNDEwNTUveGM1ZTA2YWFjOWZiMTY0YmQ5Mjc1MWJjMDQ0N2IzZWIucG5nIjtzOjM0OiJwcm9maWxlX2JhY2tncm91bmRfaW1hZ2VfdXJsX2h0dHBzIjtzOjk0OiJodHRwczovL3NpMC50d2ltZy5jb20vcHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlcy8yNTIwNDEwNTUveGM1ZTA2YWFjOWZiMTY0YmQ5Mjc1MWJjMDQ0N2IzZWIucG5nIjtzOjIzOiJwcm9maWxlX2JhY2tncm91bmRfdGlsZSI7YjoxO3M6MTc6InByb2ZpbGVfaW1hZ2VfdXJsIjtzOjYyOiJodHRwOi8vYTAudHdpbWcuY29tL3Byb2ZpbGVfaW1hZ2VzLzEzNTAzMjA5NTIvamFiMTFfbm9ybWFsLnBuZyI7czoyMzoicHJvZmlsZV9pbWFnZV91cmxfaHR0cHMiO3M6NjQ6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2ltYWdlcy8xMzUwMzIwOTUyL2phYjExX25vcm1hbC5wbmciO3M6MTg6InByb2ZpbGVfbGlua19jb2xvciI7czo2OiIwMDk5OTkiO3M6Mjg6InByb2ZpbGVfc2lkZWJhcl9ib3JkZXJfY29sb3IiO3M6NjoiRUVFRUVFIjtzOjI2OiJwcm9maWxlX3NpZGViYXJfZmlsbF9jb2xvciI7czo2OiJFRkVGRUYiO3M6MTg6InByb2ZpbGVfdGV4dF9jb2xvciI7czo2OiIwMDAwMDAiO3M6Mjg6InByb2ZpbGVfdXNlX2JhY2tncm91bmRfaW1hZ2UiO2I6MDtzOjE1OiJkZWZhdWx0X3Byb2ZpbGUiO2I6MDtzOjIxOiJkZWZhdWx0X3Byb2ZpbGVfaW1hZ2UiO2I6MDtzOjk6ImZvbGxvd2luZyI7YjowO3M6MTk6ImZvbGxvd19yZXF1ZXN0X3NlbnQiO2I6MDtzOjEzOiJub3RpZmljYXRpb25zIjtiOjA7fXM6MzoiZ2VvIjtOO3M6MTE6ImNvb3JkaW5hdGVzIjtOO3M6NToicGxhY2UiO047czoxMjoiY29udHJpYnV0b3JzIjtOO3M6MTM6InJldHdlZXRfY291bnQiO2k6MDtzOjE0OiJmYXZvcml0ZV9jb3VudCI7aTowO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoiaGFzaHRhZ3MiO2E6MDp7fXM6Nzoic3ltYm9scyI7YTowOnt9czo0OiJ1cmxzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjo0OntzOjM6InVybCI7czoyMjoiaHR0cDovL3QuY28vcUJKWFdsZElXNSI7czoxMjoiZXhwYW5kZWRfdXJsIjtzOjMyOiJodHRwOi8vd3d3LmZsZXhmb2N1cy5ubC9leWVvbm1lLyI7czoxMToiZGlzcGxheV91cmwiO3M6MjE6ImZsZXhmb2N1cy5ubC9leWVvbm1lLyI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjQ4O2k6MTtpOjcwO319fXM6MTM6InVzZXJfbWVudGlvbnMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjU6e3M6MTE6InNjcmVlbl9uYW1lIjtzOjE0OiJUd2VldEZsZXhmb2N1cyI7czo0OiJuYW1lIjtzOjk6IkZsZXhGb2N1cyI7czoyOiJpZCI7aToxNzAzMTY2OTI7czo2OiJpZF9zdHIiO3M6OToiMTcwMzE2NjkyIjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6NzE7aToxO2k6ODY7fX19fXM6OToiZmF2b3JpdGVkIjtiOjA7czo5OiJyZXR3ZWV0ZWQiO2I6MDtzOjE4OiJwb3NzaWJseV9zZW5zaXRpdmUiO2I6MDtzOjQ6ImxhbmciO3M6MjoibmwiO30=', '', 'https://twitter.com/babsgosgens/status/375670051397197824', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 1, '377331138756243457', '2013-09-10 07:22:08', 'Tzo4OiJzdGRDbGFzcyI6MjI6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IlR1ZSBTZXAgMTAgMDc6MjI6MDggKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNzczMzExMzg3NTYyNDM0NTc7czo2OiJpZF9zdHIiO3M6MTg6IjM3NzMzMTEzODc1NjI0MzQ1NyI7czo0OiJ0ZXh0IjtzOjQyOiJUaGFuayB5b3UgQHR3aXR0ZXIsIGZvciBpbmNsdWRpbmcgQFBvY2tldC4iO3M6Njoic291cmNlIjtzOjM6IndlYiI7czo5OiJ0cnVuY2F0ZWQiO2I6MDtzOjIxOiJpbl9yZXBseV90b19zdGF0dXNfaWQiO047czoyNToiaW5fcmVwbHlfdG9fc3RhdHVzX2lkX3N0ciI7TjtzOjE5OiJpbl9yZXBseV90b191c2VyX2lkIjtOO3M6MjM6ImluX3JlcGx5X3RvX3VzZXJfaWRfc3RyIjtOO3M6MjM6ImluX3JlcGx5X3RvX3NjcmVlbl9uYW1lIjtOO3M6NDoidXNlciI7Tzo4OiJzdGRDbGFzcyI6Mzg6e3M6MjoiaWQiO2k6MTEwMTA3NTcyO3M6NjoiaWRfc3RyIjtzOjk6IjExMDEwNzU3MiI7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjExOiJzY3JlZW5fbmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6ODoibG9jYXRpb24iO3M6ODoiUm9zbWFsZW4iO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjEzNjoiKFdlYilkZXNpZ25lciBhbmQgZGV2ZWxvcGVyLCBzdHViYm9ybiBhcyBoZWxsLCBhbHdheXMgcXVlc3Rpb25pbmcgZXZlcnl0aGluZy4gTGlrZXMgdG8gcmUtaW52ZW50IHRoZSB3aGVlbCB0byBzZWUgaWYgaXQgY2FuIGJlIGFwcHJvdmVkLiI7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL21WeUd5Q3pUU2MiO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjI6e3M6MzoidXJsIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6InVybHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjQ6e3M6MzoidXJsIjtzOjIyOiJodHRwOi8vdC5jby9tVnlHeUN6VFNjIjtzOjEyOiJleHBhbmRlZF91cmwiO3M6MjQ6Imh0dHA6Ly9jcm9zc2luZ2hpcHBvcy5ubCI7czoxMToiZGlzcGxheV91cmwiO3M6MTc6ImNyb3NzaW5naGlwcG9zLm5sIjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6MDtpOjE7aToyMjt9fX19czoxMToiZGVzY3JpcHRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NDoidXJscyI7YTowOnt9fX1zOjk6InByb3RlY3RlZCI7YjowO3M6MTU6ImZvbGxvd2Vyc19jb3VudCI7aToyMDM7czoxMzoiZnJpZW5kc19jb3VudCI7aToxNzU7czoxMjoibGlzdGVkX2NvdW50IjtpOjEzO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IlN1biBKYW4gMzEgMTA6NDk6NDcgKzAwMDAgMjAxMCI7czoxNjoiZmF2b3VyaXRlc19jb3VudCI7aTo2OTtzOjEwOiJ1dGNfb2Zmc2V0IjtpOi03MjAwO3M6OToidGltZV96b25lIjtzOjk6IkdyZWVubGFuZCI7czoxMToiZ2VvX2VuYWJsZWQiO2I6MTtzOjg6InZlcmlmaWVkIjtiOjA7czoxNDoic3RhdHVzZXNfY291bnQiO2k6MTEzNDtzOjQ6ImxhbmciO3M6MjoiZW4iO3M6MjA6ImNvbnRyaWJ1dG9yc19lbmFibGVkIjtiOjA7czoxMzoiaXNfdHJhbnNsYXRvciI7YjowO3M6MjQ6InByb2ZpbGVfYmFja2dyb3VuZF9jb2xvciI7czo2OiIxMzE1MTYiO3M6Mjg6InByb2ZpbGVfYmFja2dyb3VuZF9pbWFnZV91cmwiO3M6OTI6Imh0dHA6Ly9hMC50d2ltZy5jb20vcHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlcy8yNTIwNDEwNTUveGM1ZTA2YWFjOWZiMTY0YmQ5Mjc1MWJjMDQ0N2IzZWIucG5nIjtzOjM0OiJwcm9maWxlX2JhY2tncm91bmRfaW1hZ2VfdXJsX2h0dHBzIjtzOjk0OiJodHRwczovL3NpMC50d2ltZy5jb20vcHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlcy8yNTIwNDEwNTUveGM1ZTA2YWFjOWZiMTY0YmQ5Mjc1MWJjMDQ0N2IzZWIucG5nIjtzOjIzOiJwcm9maWxlX2JhY2tncm91bmRfdGlsZSI7YjoxO3M6MTc6InByb2ZpbGVfaW1hZ2VfdXJsIjtzOjYyOiJodHRwOi8vYTAudHdpbWcuY29tL3Byb2ZpbGVfaW1hZ2VzLzEzNTAzMjA5NTIvamFiMTFfbm9ybWFsLnBuZyI7czoyMzoicHJvZmlsZV9pbWFnZV91cmxfaHR0cHMiO3M6NjQ6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2ltYWdlcy8xMzUwMzIwOTUyL2phYjExX25vcm1hbC5wbmciO3M6MTg6InByb2ZpbGVfbGlua19jb2xvciI7czo2OiIwMDk5OTkiO3M6Mjg6InByb2ZpbGVfc2lkZWJhcl9ib3JkZXJfY29sb3IiO3M6NjoiRUVFRUVFIjtzOjI2OiJwcm9maWxlX3NpZGViYXJfZmlsbF9jb2xvciI7czo2OiJFRkVGRUYiO3M6MTg6InByb2ZpbGVfdGV4dF9jb2xvciI7czo2OiIwMDAwMDAiO3M6Mjg6InByb2ZpbGVfdXNlX2JhY2tncm91bmRfaW1hZ2UiO2I6MDtzOjE1OiJkZWZhdWx0X3Byb2ZpbGUiO2I6MDtzOjIxOiJkZWZhdWx0X3Byb2ZpbGVfaW1hZ2UiO2I6MDtzOjk6ImZvbGxvd2luZyI7YjowO3M6MTk6ImZvbGxvd19yZXF1ZXN0X3NlbnQiO2I6MDtzOjEzOiJub3RpZmljYXRpb25zIjtiOjA7fXM6MzoiZ2VvIjtOO3M6MTE6ImNvb3JkaW5hdGVzIjtOO3M6NToicGxhY2UiO047czoxMjoiY29udHJpYnV0b3JzIjtOO3M6MTM6InJldHdlZXRfY291bnQiO2k6MDtzOjE0OiJmYXZvcml0ZV9jb3VudCI7aTowO3M6ODoiZW50aXRpZXMiO086ODoic3RkQ2xhc3MiOjQ6e3M6ODoiaGFzaHRhZ3MiO2E6MDp7fXM6Nzoic3ltYm9scyI7YTowOnt9czo0OiJ1cmxzIjthOjA6e31zOjEzOiJ1c2VyX21lbnRpb25zIjthOjI6e2k6MDtPOjg6InN0ZENsYXNzIjo1OntzOjExOiJzY3JlZW5fbmFtZSI7czo3OiJ0d2l0dGVyIjtzOjQ6Im5hbWUiO3M6NzoiVHdpdHRlciI7czoyOiJpZCI7aTo3ODMyMTQ7czo2OiJpZF9zdHIiO3M6NjoiNzgzMjE0IjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6MTA7aToxO2k6MTg7fX1pOjE7Tzo4OiJzdGRDbGFzcyI6NTp7czoxMToic2NyZWVuX25hbWUiO3M6NjoiUG9ja2V0IjtzOjQ6Im5hbWUiO3M6NjoiUG9ja2V0IjtzOjI6ImlkIjtpOjI3NTMwMTc4O3M6NjoiaWRfc3RyIjtzOjg6IjI3NTMwMTc4IjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6MzQ7aToxO2k6NDE7fX19fXM6OToiZmF2b3JpdGVkIjtiOjA7czo5OiJyZXR3ZWV0ZWQiO2I6MDtzOjQ6ImxhbmciO3M6MjoiZW4iO30=', '', 'https://twitter.com/babsgosgens/status/377331138756243457', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 1, '378777744152465408', '2013-09-14 07:10:26', 'Tzo4OiJzdGRDbGFzcyI6MjI6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IlNhdCBTZXAgMTQgMDc6MTA6MjYgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNzg3Nzc3NDQxNTI0NjU0MDg7czo2OiJpZF9zdHIiO3M6MTg6IjM3ODc3Nzc0NDE1MjQ2NTQwOCI7czo0OiJ0ZXh0IjtzOjExMToiQG5pZ2h0c2hpZnRjIEBZb3VyQW5vbk5ld3MgcXVpdGUgbGlrZWx5IHRoYXQgbWVhbnMgd2Ugd2lsbCBub3cgc3RhcnQgdG8gY29tcGxhaW4gYWJvdXQgdGhlIGluaGVyZW50IGxheS1vZmZzIDspIjtzOjY6InNvdXJjZSI7czo4MjoiPGEgaHJlZj0iaHR0cDovL3R3aXR0ZXIuY29tL2Rvd25sb2FkL2lwaG9uZSIgcmVsPSJub2ZvbGxvdyI+VHdpdHRlciBmb3IgaVBob25lPC9hPiI7czo5OiJ0cnVuY2F0ZWQiO2I6MDtzOjIxOiJpbl9yZXBseV90b19zdGF0dXNfaWQiO2k6Mzc4NzM3Mjk2NDY5OTQ2MzY4O3M6MjU6ImluX3JlcGx5X3RvX3N0YXR1c19pZF9zdHIiO3M6MTg6IjM3ODczNzI5NjQ2OTk0NjM2OCI7czoxOToiaW5fcmVwbHlfdG9fdXNlcl9pZCI7aToxODg2ODYwNztzOjIzOiJpbl9yZXBseV90b191c2VyX2lkX3N0ciI7czo4OiIxODg2ODYwNyI7czoyMzoiaW5fcmVwbHlfdG9fc2NyZWVuX25hbWUiO3M6MTE6Im5pZ2h0c2hpZnRjIjtzOjQ6InVzZXIiO086ODoic3RkQ2xhc3MiOjM4OntzOjI6ImlkIjtpOjExMDEwNzU3MjtzOjY6ImlkX3N0ciI7czo5OiIxMTAxMDc1NzIiO3M6NDoibmFtZSI7czoxMzoiQmFicyBHw7ZzZ2VucyI7czoxMToic2NyZWVuX25hbWUiO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjg6ImxvY2F0aW9uIjtzOjg6IlJvc21hbGVuIjtzOjExOiJkZXNjcmlwdGlvbiI7czoxMzY6IihXZWIpZGVzaWduZXIgYW5kIGRldmVsb3Blciwgc3R1YmJvcm4gYXMgaGVsbCwgYWx3YXlzIHF1ZXN0aW9uaW5nIGV2ZXJ5dGhpbmcuIExpa2VzIHRvIHJlLWludmVudCB0aGUgd2hlZWwgdG8gc2VlIGlmIGl0IGNhbiBiZSBhcHByb3ZlZC4iO3M6MzoidXJsIjtzOjIyOiJodHRwOi8vdC5jby9tVnlHeUN6VFNjIjtzOjg6ImVudGl0aWVzIjtPOjg6InN0ZENsYXNzIjoyOntzOjM6InVybCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJ1cmxzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjo0OntzOjM6InVybCI7czoyMjoiaHR0cDovL3QuY28vbVZ5R3lDelRTYyI7czoxMjoiZXhwYW5kZWRfdXJsIjtzOjI0OiJodHRwOi8vY3Jvc3NpbmdoaXBwb3MubmwiO3M6MTE6ImRpc3BsYXlfdXJsIjtzOjE3OiJjcm9zc2luZ2hpcHBvcy5ubCI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjA7aToxO2k6MjI7fX19fXM6MTE6ImRlc2NyaXB0aW9uIjtPOjg6InN0ZENsYXNzIjoxOntzOjQ6InVybHMiO2E6MDp7fX19czo5OiJwcm90ZWN0ZWQiO2I6MDtzOjE1OiJmb2xsb3dlcnNfY291bnQiO2k6MjAzO3M6MTM6ImZyaWVuZHNfY291bnQiO2k6MTc1O3M6MTI6Imxpc3RlZF9jb3VudCI7aToxMztzOjEwOiJjcmVhdGVkX2F0IjtzOjMwOiJTdW4gSmFuIDMxIDEwOjQ5OjQ3ICswMDAwIDIwMTAiO3M6MTY6ImZhdm91cml0ZXNfY291bnQiO2k6Njk7czoxMDoidXRjX29mZnNldCI7aTotNzIwMDtzOjk6InRpbWVfem9uZSI7czo5OiJHcmVlbmxhbmQiO3M6MTE6Imdlb19lbmFibGVkIjtiOjE7czo4OiJ2ZXJpZmllZCI7YjowO3M6MTQ6InN0YXR1c2VzX2NvdW50IjtpOjExMzQ7czo0OiJsYW5nIjtzOjI6ImVuIjtzOjIwOiJjb250cmlidXRvcnNfZW5hYmxlZCI7YjowO3M6MTM6ImlzX3RyYW5zbGF0b3IiO2I6MDtzOjI0OiJwcm9maWxlX2JhY2tncm91bmRfY29sb3IiO3M6NjoiMTMxNTE2IjtzOjI4OiJwcm9maWxlX2JhY2tncm91bmRfaW1hZ2VfdXJsIjtzOjkyOiJodHRwOi8vYTAudHdpbWcuY29tL3Byb2ZpbGVfYmFja2dyb3VuZF9pbWFnZXMvMjUyMDQxMDU1L3hjNWUwNmFhYzlmYjE2NGJkOTI3NTFiYzA0NDdiM2ViLnBuZyI7czozNDoicHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlX3VybF9odHRwcyI7czo5NDoiaHR0cHM6Ly9zaTAudHdpbWcuY29tL3Byb2ZpbGVfYmFja2dyb3VuZF9pbWFnZXMvMjUyMDQxMDU1L3hjNWUwNmFhYzlmYjE2NGJkOTI3NTFiYzA0NDdiM2ViLnBuZyI7czoyMzoicHJvZmlsZV9iYWNrZ3JvdW5kX3RpbGUiO2I6MTtzOjE3OiJwcm9maWxlX2ltYWdlX3VybCI7czo2MjoiaHR0cDovL2EwLnR3aW1nLmNvbS9wcm9maWxlX2ltYWdlcy8xMzUwMzIwOTUyL2phYjExX25vcm1hbC5wbmciO3M6MjM6InByb2ZpbGVfaW1hZ2VfdXJsX2h0dHBzIjtzOjY0OiJodHRwczovL3NpMC50d2ltZy5jb20vcHJvZmlsZV9pbWFnZXMvMTM1MDMyMDk1Mi9qYWIxMV9ub3JtYWwucG5nIjtzOjE4OiJwcm9maWxlX2xpbmtfY29sb3IiO3M6NjoiMDA5OTk5IjtzOjI4OiJwcm9maWxlX3NpZGViYXJfYm9yZGVyX2NvbG9yIjtzOjY6IkVFRUVFRSI7czoyNjoicHJvZmlsZV9zaWRlYmFyX2ZpbGxfY29sb3IiO3M6NjoiRUZFRkVGIjtzOjE4OiJwcm9maWxlX3RleHRfY29sb3IiO3M6NjoiMDAwMDAwIjtzOjI4OiJwcm9maWxlX3VzZV9iYWNrZ3JvdW5kX2ltYWdlIjtiOjA7czoxNToiZGVmYXVsdF9wcm9maWxlIjtiOjA7czoyMToiZGVmYXVsdF9wcm9maWxlX2ltYWdlIjtiOjA7czo5OiJmb2xsb3dpbmciO2I6MDtzOjE5OiJmb2xsb3dfcmVxdWVzdF9zZW50IjtiOjA7czoxMzoibm90aWZpY2F0aW9ucyI7YjowO31zOjM6ImdlbyI7TjtzOjExOiJjb29yZGluYXRlcyI7TjtzOjU6InBsYWNlIjtOO3M6MTI6ImNvbnRyaWJ1dG9ycyI7TjtzOjEzOiJyZXR3ZWV0X2NvdW50IjtpOjA7czoxNDoiZmF2b3JpdGVfY291bnQiO2k6MDtzOjg6ImVudGl0aWVzIjtPOjg6InN0ZENsYXNzIjo0OntzOjg6Imhhc2h0YWdzIjthOjA6e31zOjc6InN5bWJvbHMiO2E6MDp7fXM6NDoidXJscyI7YTowOnt9czoxMzoidXNlcl9tZW50aW9ucyI7YToyOntpOjA7Tzo4OiJzdGRDbGFzcyI6NTp7czoxMToic2NyZWVuX25hbWUiO3M6MTE6Im5pZ2h0c2hpZnRjIjtzOjQ6Im5hbWUiO3M6MTU6IkNyaXN0aW5hIFNvbGFuYSI7czoyOiJpZCI7aToxODg2ODYwNztzOjY6ImlkX3N0ciI7czo4OiIxODg2ODYwNyI7czo3OiJpbmRpY2VzIjthOjI6e2k6MDtpOjA7aToxO2k6MTI7fX1pOjE7Tzo4OiJzdGRDbGFzcyI6NTp7czoxMToic2NyZWVuX25hbWUiO3M6MTI6IllvdXJBbm9uTmV3cyI7czo0OiJuYW1lIjtzOjk6IkFub255bW91cyI7czoyOiJpZCI7aToyNzkzOTAwODQ7czo2OiJpZF9zdHIiO3M6OToiMjc5MzkwMDg0IjtzOjc6ImluZGljZXMiO2E6Mjp7aTowO2k6MTM7aToxO2k6MjY7fX19fXM6OToiZmF2b3JpdGVkIjtiOjA7czo5OiJyZXR3ZWV0ZWQiO2I6MDtzOjQ6ImxhbmciO3M6MjoiZW4iO30=', '', 'https://twitter.com/babsgosgens/status/378777744152465408', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 1, '378800222912405504', '2013-09-14 08:39:45', 'Tzo4OiJzdGRDbGFzcyI6MjI6e3M6MTA6ImNyZWF0ZWRfYXQiO3M6MzA6IlNhdCBTZXAgMTQgMDg6Mzk6NDUgKzAwMDAgMjAxMyI7czoyOiJpZCI7aTozNzg4MDAyMjI5MTI0MDU1MDQ7czo2OiJpZF9zdHIiO3M6MTg6IjM3ODgwMDIyMjkxMjQwNTUwNCI7czo0OiJ0ZXh0IjtzOjYxOiJPSDogSSBhbSB1dHRlcmx5IGluZGVjaXNpdmUgd2hlbiBpdCBjb21lcyB0byBtYWtpbmcgZGVjaXNpb25zIjtzOjY6InNvdXJjZSI7czoxMDE6IjxhIGhyZWY9Imh0dHA6Ly9pdHVuZXMuYXBwbGUuY29tL3VzL2FwcC90d2l0dGVyL2lkNDA5Nzg5OTk4P210PTEyIiByZWw9Im5vZm9sbG93Ij5Ud2l0dGVyIGZvciBNYWM8L2E+IjtzOjk6InRydW5jYXRlZCI7YjowO3M6MjE6ImluX3JlcGx5X3RvX3N0YXR1c19pZCI7TjtzOjI1OiJpbl9yZXBseV90b19zdGF0dXNfaWRfc3RyIjtOO3M6MTk6ImluX3JlcGx5X3RvX3VzZXJfaWQiO047czoyMzoiaW5fcmVwbHlfdG9fdXNlcl9pZF9zdHIiO047czoyMzoiaW5fcmVwbHlfdG9fc2NyZWVuX25hbWUiO047czo0OiJ1c2VyIjtPOjg6InN0ZENsYXNzIjozODp7czoyOiJpZCI7aToxMTAxMDc1NzI7czo2OiJpZF9zdHIiO3M6OToiMTEwMTA3NTcyIjtzOjQ6Im5hbWUiO3M6MTM6IkJhYnMgR8O2c2dlbnMiO3M6MTE6InNjcmVlbl9uYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo4OiJsb2NhdGlvbiI7czo4OiJSb3NtYWxlbiI7czoxMToiZGVzY3JpcHRpb24iO3M6MTM2OiIoV2ViKWRlc2lnbmVyIGFuZCBkZXZlbG9wZXIsIHN0dWJib3JuIGFzIGhlbGwsIGFsd2F5cyBxdWVzdGlvbmluZyBldmVyeXRoaW5nLiBMaWtlcyB0byByZS1pbnZlbnQgdGhlIHdoZWVsIHRvIHNlZSBpZiBpdCBjYW4gYmUgYXBwcm92ZWQuIjtzOjM6InVybCI7czoyMjoiaHR0cDovL3QuY28vbVZ5R3lDelRTYyI7czo4OiJlbnRpdGllcyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czozOiJ1cmwiO086ODoic3RkQ2xhc3MiOjE6e3M6NDoidXJscyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6NDp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly90LmNvL21WeUd5Q3pUU2MiO3M6MTI6ImV4cGFuZGVkX3VybCI7czoyNDoiaHR0cDovL2Nyb3NzaW5naGlwcG9zLm5sIjtzOjExOiJkaXNwbGF5X3VybCI7czoxNzoiY3Jvc3NpbmdoaXBwb3MubmwiO3M6NzoiaW5kaWNlcyI7YToyOntpOjA7aTowO2k6MTtpOjIyO319fX1zOjExOiJkZXNjcmlwdGlvbiI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJ1cmxzIjthOjA6e319fXM6OToicHJvdGVjdGVkIjtiOjA7czoxNToiZm9sbG93ZXJzX2NvdW50IjtpOjIwMztzOjEzOiJmcmllbmRzX2NvdW50IjtpOjE3NTtzOjEyOiJsaXN0ZWRfY291bnQiO2k6MTM7czoxMDoiY3JlYXRlZF9hdCI7czozMDoiU3VuIEphbiAzMSAxMDo0OTo0NyArMDAwMCAyMDEwIjtzOjE2OiJmYXZvdXJpdGVzX2NvdW50IjtpOjY5O3M6MTA6InV0Y19vZmZzZXQiO2k6LTcyMDA7czo5OiJ0aW1lX3pvbmUiO3M6OToiR3JlZW5sYW5kIjtzOjExOiJnZW9fZW5hYmxlZCI7YjoxO3M6ODoidmVyaWZpZWQiO2I6MDtzOjE0OiJzdGF0dXNlc19jb3VudCI7aToxMTM0O3M6NDoibGFuZyI7czoyOiJlbiI7czoyMDoiY29udHJpYnV0b3JzX2VuYWJsZWQiO2I6MDtzOjEzOiJpc190cmFuc2xhdG9yIjtiOjA7czoyNDoicHJvZmlsZV9iYWNrZ3JvdW5kX2NvbG9yIjtzOjY6IjEzMTUxNiI7czoyODoicHJvZmlsZV9iYWNrZ3JvdW5kX2ltYWdlX3VybCI7czo5MjoiaHR0cDovL2EwLnR3aW1nLmNvbS9wcm9maWxlX2JhY2tncm91bmRfaW1hZ2VzLzI1MjA0MTA1NS94YzVlMDZhYWM5ZmIxNjRiZDkyNzUxYmMwNDQ3YjNlYi5wbmciO3M6MzQ6InByb2ZpbGVfYmFja2dyb3VuZF9pbWFnZV91cmxfaHR0cHMiO3M6OTQ6Imh0dHBzOi8vc2kwLnR3aW1nLmNvbS9wcm9maWxlX2JhY2tncm91bmRfaW1hZ2VzLzI1MjA0MTA1NS94YzVlMDZhYWM5ZmIxNjRiZDkyNzUxYmMwNDQ3YjNlYi5wbmciO3M6MjM6InByb2ZpbGVfYmFja2dyb3VuZF90aWxlIjtiOjE7czoxNzoicHJvZmlsZV9pbWFnZV91cmwiO3M6NjI6Imh0dHA6Ly9hMC50d2ltZy5jb20vcHJvZmlsZV9pbWFnZXMvMTM1MDMyMDk1Mi9qYWIxMV9ub3JtYWwucG5nIjtzOjIzOiJwcm9maWxlX2ltYWdlX3VybF9odHRwcyI7czo2NDoiaHR0cHM6Ly9zaTAudHdpbWcuY29tL3Byb2ZpbGVfaW1hZ2VzLzEzNTAzMjA5NTIvamFiMTFfbm9ybWFsLnBuZyI7czoxODoicHJvZmlsZV9saW5rX2NvbG9yIjtzOjY6IjAwOTk5OSI7czoyODoicHJvZmlsZV9zaWRlYmFyX2JvcmRlcl9jb2xvciI7czo2OiJFRUVFRUUiO3M6MjY6InByb2ZpbGVfc2lkZWJhcl9maWxsX2NvbG9yIjtzOjY6IkVGRUZFRiI7czoxODoicHJvZmlsZV90ZXh0X2NvbG9yIjtzOjY6IjAwMDAwMCI7czoyODoicHJvZmlsZV91c2VfYmFja2dyb3VuZF9pbWFnZSI7YjowO3M6MTU6ImRlZmF1bHRfcHJvZmlsZSI7YjowO3M6MjE6ImRlZmF1bHRfcHJvZmlsZV9pbWFnZSI7YjowO3M6OToiZm9sbG93aW5nIjtiOjA7czoxOToiZm9sbG93X3JlcXVlc3Rfc2VudCI7YjowO3M6MTM6Im5vdGlmaWNhdGlvbnMiO2I6MDt9czozOiJnZW8iO047czoxMToiY29vcmRpbmF0ZXMiO047czo1OiJwbGFjZSI7TjtzOjEyOiJjb250cmlidXRvcnMiO047czoxMzoicmV0d2VldF9jb3VudCI7aTowO3M6MTQ6ImZhdm9yaXRlX2NvdW50IjtpOjA7czo4OiJlbnRpdGllcyI7Tzo4OiJzdGRDbGFzcyI6NDp7czo4OiJoYXNodGFncyI7YTowOnt9czo3OiJzeW1ib2xzIjthOjA6e31zOjQ6InVybHMiO2E6MDp7fXM6MTM6InVzZXJfbWVudGlvbnMiO2E6MDp7fX1zOjk6ImZhdm9yaXRlZCI7YjowO3M6OToicmV0d2VldGVkIjtiOjA7czo0OiJsYW5nIjtzOjI6ImVuIjt9', '', 'https://twitter.com/babsgosgens/status/378800222912405504', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `flock_streams` (`id`, `api_id`, `post_id`, `date_created`, `raw`, `metadata`, `permalink`, `params`, `language`, `state`, `publish_up`, `publish_down`) VALUES
(11, 2, '100002043048057_501221883289242', '2013-08-14 13:00:54', 'Tzo4OiJzdGRDbGFzcyI6MTc6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MDEyMjE4ODMyODkyNDIiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6NzU6IkhvdyB0byB1c2UgUGVyc2lzdGFudCBHcmlkIGluIHlvdXIgI0NvbXBhc3MgcHJvamVjdDogaHR0cDovL3QuY28vMUNCNmxTS25BcSI7czo3OiJwaWN0dXJlIjtzOjIwMjoiaHR0cHM6Ly9mYmV4dGVybmFsLWEuYWthbWFpaGQubmV0L2FwcF9mdWxsX3Byb3h5LnBocD9hcHA9MjIzMTc3NzU0MyZ2PTEmc2l6ZT16JmNrc3VtPTlhZjllZDA2OWI4N2QzNTRjNjQxNWFjZmI4YjdmMWY1JnNyYz1odHRwcyUzQSUyRiUyRnMzLmFtYXpvbmF3cy5jb20lMkZnaXRodWIlMkZyaWJib25zJTJGZm9ya21lX3JpZ2h0X2dyYXlfNmQ2ZDZkLnBuZyI7czo0OiJsaW5rIjtzOjIyOiJodHRwOi8vdC5jby8xQ0I2bFNLbkFxIjtzOjQ6Im5hbWUiO3M6MjU6IlBlcnNpc3RlbnQgR3JpZCDimaUgU3RhcnQiO3M6NzoiY2FwdGlvbiI7czoxODoicGVyc2lzdGVudGdyaWQuY29tIjtzOjExOiJkZXNjcmlwdGlvbiI7czoxMzU6IlBlcnNpc3RlbnQgR3JpZCBpcyBhIG1vZHVsYXIgQ1NTIGZyYW1ld29yayBidWlsdCB3aXRoIFNBU1MgYW5kIENvbXBhc3MuIEl0IGJhc2ljYWxseSBjb21lcyBpbiB0aHJlZSBmbGF2b3VyczogR3JpZCwgQmFzZSBhbmQgRnJhbWV3b3JrLiI7czo0OiJpY29uIjtzOjk0OiJodHRwczovL2ZiY2RuLXBob3Rvcy1jLWEuYWthbWFpaGQubmV0L2hwaG90b3MtYWstcHJuMS84NTE1NjVfMTAxNTEzOTc5MTE5Njc1NDRfNjMyNTI1NTgzX24ucG5nIjtzOjc6ImFjdGlvbnMiO2E6Mjp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czo3OiJDb21tZW50IjtzOjQ6ImxpbmsiO3M6NjI6Imh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS8xMDAwMDIwNDMwNDgwNTcvcG9zdHMvNTAxMjIxODgzMjg5MjQyIjt9aToxO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czoyNjoiQHBlcnNpc3RlbnRncmlkIG9uIFR3aXR0ZXIiO3M6NDoibGluayI7czoxMjE6Imh0dHBzOi8vdHdpdHRlci5jb20vcGVyc2lzdGVudGdyaWQ/dXRtX3NvdXJjZT1mYiZ1dG1fbWVkaXVtPWZiJnV0bV9jYW1wYWlnbj1wZXJzaXN0ZW50Z3JpZCZ1dG1fY29udGVudD0zNjc2MzE5MDYzNjk1ODEwNTYiO319czo3OiJwcml2YWN5IjtPOjg6InN0ZENsYXNzIjoxOntzOjU6InZhbHVlIjtzOjA6IiI7fXM6NDoidHlwZSI7czo0OiJsaW5rIjtzOjExOiJzdGF0dXNfdHlwZSI7czoxNzoiYXBwX2NyZWF0ZWRfc3RvcnkiO3M6MTE6ImFwcGxpY2F0aW9uIjtPOjg6InN0ZENsYXNzIjozOntzOjQ6Im5hbWUiO3M6NzoiVHdpdHRlciI7czo5OiJuYW1lc3BhY2UiO3M6NzoidHdpdHRlciI7czoyOiJpZCI7czoxMDoiMjIzMTc3NzU0MyI7fXM6MTI6ImNyZWF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOC0xNFQxMzowMDo1NCswMDAwIjtzOjEyOiJ1cGRhdGVkX3RpbWUiO3M6MjQ6IjIwMTMtMDgtMTRUMTM6MDA6NTQrMDAwMCI7czo1OiJsaWtlcyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJkYXRhIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6MTI6IkphbiBHw7ZzZ2VucyI7czoyOiJpZCI7czoxNToiMTAwMDAyNDk4MDc2NjEyIjt9fXM6NToiY291bnQiO2k6MTt9fQ==', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 2, '100002043048057_501773916567372', '2013-08-15 20:35:35', 'Tzo4OiJzdGRDbGFzcyI6MTY6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MDE3NzM5MTY1NjczNzIiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6NTY6Ildvcmtpbmcgb24gY29uZmlndXJhYmxlIGJ1dHRvbnM6IGh0dHBzOi8vdC5jby9zdEhqZmVLeVM5IjtzOjc6InBpY3R1cmUiO3M6MjEwOiJodHRwczovL2ZiZXh0ZXJuYWwtYS5ha2FtYWloZC5uZXQvYXBwX2Z1bGxfcHJveHkucGhwP2FwcD0yMjMxNzc3NTQzJnY9MSZzaXplPXomY2tzdW09MzgyZjM4NmJhOTZiMzAzZDY4NWU2ZGFjZmZlNmQ4NjYmc3JjPWh0dHBzJTNBJTJGJTJGZ2l0aHViLmdsb2JhbC5zc2wuZmFzdGx5Lm5ldCUyRmltYWdlcyUyRm1vZHVsZXMlMkZsb2dvc19wYWdlJTJGT2N0b2NhdC5wbmciO3M6NDoibGluayI7czoyMzoiaHR0cHM6Ly90LmNvL3N0SGpmZUt5UzkiO3M6NDoibmFtZSI7czoxNDoicGVyc2lzdGVudGdyaWQiO3M6NzoiY2FwdGlvbiI7czoxMDoiZ2l0aHViLmNvbSI7czoxMToiZGVzY3JpcHRpb24iO3M6ODA6InBlcnNpc3RlbnRncmlkIC0gQSBsaWdodHdlaWdodCBhbmQgZmxleGlibGUgZ3JpZC4gUmVzcG9uc2l2ZS4gT3Igbm90LiBZb3VyIGNhbGwuIjtzOjQ6Imljb24iO3M6OTQ6Imh0dHBzOi8vZmJjZG4tcGhvdG9zLWMtYS5ha2FtYWloZC5uZXQvaHBob3Rvcy1hay1wcm4xLzg1MTU2NV8xMDE1MTM5NzkxMTk2NzU0NF82MzI1MjU1ODNfbi5wbmciO3M6NzoiYWN0aW9ucyI7YToyOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjc6IkNvbW1lbnQiO3M6NDoibGluayI7czo2MjoiaHR0cHM6Ly93d3cuZmFjZWJvb2suY29tLzEwMDAwMjA0MzA0ODA1Ny9wb3N0cy81MDE3NzM5MTY1NjczNzIiO31pOjE7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjI2OiJAcGVyc2lzdGVudGdyaWQgb24gVHdpdHRlciI7czo0OiJsaW5rIjtzOjEyMToiaHR0cHM6Ly90d2l0dGVyLmNvbS9wZXJzaXN0ZW50Z3JpZD91dG1fc291cmNlPWZiJnV0bV9tZWRpdW09ZmImdXRtX2NhbXBhaWduPXBlcnNpc3RlbnRncmlkJnV0bV9jb250ZW50PTM2ODEwODcwOTExMDUwMTM3NiI7fX1zOjc6InByaXZhY3kiO086ODoic3RkQ2xhc3MiOjE6e3M6NToidmFsdWUiO3M6MDoiIjt9czo0OiJ0eXBlIjtzOjQ6ImxpbmsiO3M6MTE6InN0YXR1c190eXBlIjtzOjE3OiJhcHBfY3JlYXRlZF9zdG9yeSI7czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czo3OiJUd2l0dGVyIjtzOjk6Im5hbWVzcGFjZSI7czo3OiJ0d2l0dGVyIjtzOjI6ImlkIjtzOjEwOiIyMjMxNzc3NTQzIjt9czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTE1VDIwOjM1OjM1KzAwMDAiO3M6MTI6InVwZGF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOC0xNVQyMDozNTozNSswMDAwIjt9', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 2, '100002043048057_501930176551746', '2013-08-19 07:37:36', 'Tzo4OiJzdGRDbGFzcyI6MjA6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MDE5MzAxNzY1NTE3NDYiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6MTk6Ik1lIGxpa2VzIHB1cHBpZXMgOikiO3M6NToic3RvcnkiO3M6NDM6IkJhYnMgR8O2c2dlbnMgc2hhcmVkIE9tZyBUZWVucyDhg6YncyBwaG90by4iO3M6NzoicGljdHVyZSI7czo5MjoiaHR0cHM6Ly9mYmNkbi1waG90b3MtYy1hLmFrYW1haWhkLm5ldC9ocGhvdG9zLWFrLXBybjEvNjEyNTJfMzc3NTI0NzcyMzc2ODMwXzEwODE3NTI1NTBfcy5qcGciO3M6NDoibGluayI7czoxMDY6Imh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS9waG90by5waHA/ZmJpZD0zNzc1MjQ3NzIzNzY4MzAmc2V0PWEuMjkwMzAwNjMxMDk5MjQ1LjY3NTY2LjI5MDI5OTQxNzc2NjAzMyZ0eXBlPTEiO3M6NDoibmFtZSI7czoxNToiVGltZWxpbmUgUGhvdG9zIjtzOjc6ImNhcHRpb24iO3M6MTE6Ikxpa2UgLSBjdXRlIjtzOjEwOiJwcm9wZXJ0aWVzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjozOntzOjQ6Im5hbWUiO3M6MjoiQnkiO3M6NDoidGV4dCI7czoxMzoiT21nIFRlZW5zIOGDpiI7czo0OiJocmVmIjtzOjc3OiJodHRwczovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvT21nLVRlZW5zLSVFMSU4MyVBNi8yOTAyOTk0MTc3NjYwMzM/cmVmPXN0cmVhbSI7fX1zOjQ6Imljb24iO3M6NjQ6Imh0dHBzOi8vZmJzdGF0aWMtYS5ha2FtYWloZC5uZXQvcnNyYy5waHAvdjIveUQvci9hUzhlY21ZUnlzMC5naWYiO3M6NzoiYWN0aW9ucyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjc6IkNvbW1lbnQiO3M6NDoibGluayI7czo2MjoiaHR0cHM6Ly93d3cuZmFjZWJvb2suY29tLzEwMDAwMjA0MzA0ODA1Ny9wb3N0cy81MDE5MzAxNzY1NTE3NDYiO319czo3OiJwcml2YWN5IjtPOjg6InN0ZENsYXNzIjoxOntzOjU6InZhbHVlIjtzOjA6IiI7fXM6NDoidHlwZSI7czo1OiJwaG90byI7czoxMToic3RhdHVzX3R5cGUiO3M6MTI6InNoYXJlZF9zdG9yeSI7czo5OiJvYmplY3RfaWQiO3M6MTU6IjM3NzUyNDc3MjM3NjgzMCI7czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxNzoiRmFjZWJvb2sgZm9yIGlQYWQiO3M6OToibmFtZXNwYWNlIjtzOjc6ImZiaXBhZF8iO3M6MjoiaWQiO3M6MTU6IjE3Mzg0NzY0MjY3MDM3MCI7fXM6MTI6ImNyZWF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOC0xNlQwNjoxODoyNyswMDAwIjtzOjEyOiJ1cGRhdGVkX3RpbWUiO3M6MjQ6IjIwMTMtMDgtMTlUMDc6Mzc6MzYrMDAwMCI7czo1OiJsaWtlcyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJkYXRhIjthOjI6e2k6MDtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6MTU6IkNhcm9saW5lIENhbW1lbCI7czoyOiJpZCI7czoxNToiMTAwMDA1NjM4MjczNzk4Ijt9aToxO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czoxNzoiWWFvIFZhbiBMYW5kZXdpamsiO3M6MjoiaWQiO3M6OToiNjE5MzQxODQ1Ijt9fXM6NToiY291bnQiO2k6Mjt9czo4OiJjb21tZW50cyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJkYXRhIjthOjU6e2k6MDtPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtzOjI0OiI1MDE5MzAxNzY1NTE3NDZfNzI4NjgwMjEiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJLaXR0eSBNdWxkZXJzIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIxNjg1NzU5MTkiO31zOjc6Im1lc3NhZ2UiO3M6NTY6ImxhY2hlbiBsZXVrIGhvb3IsIGxpamt0IHdlbCBvZiB6ZSBhYW4gZWVuIGJvcnJlbCBkcmlua2VuIjtzOjEwOiJjYW5fcmVtb3ZlIjtiOjE7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTE2VDA2OjI2OjMzKzAwMDAiO3M6MTA6Imxpa2VfY291bnQiO2k6MDtzOjEwOiJ1c2VyX2xpa2VzIjtiOjA7fWk6MTtPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtzOjI0OiI1MDE5MzAxNzY1NTE3NDZfNzI4NjgwNTkiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6NDQ6IkVuIHpvIHRlIHppZW4gaGViYmVuIHplIGVyIGFsIGVlbiBwYWFyIG9wIDopIjtzOjEwOiJjYW5fcmVtb3ZlIjtiOjE7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTE2VDA3OjE2OjAzKzAwMDAiO3M6MTA6Imxpa2VfY291bnQiO2k6MTtzOjEwOiJ1c2VyX2xpa2VzIjtiOjA7fWk6MjtPOjg6InN0ZENsYXNzIjo4OntzOjI6ImlkIjtzOjI0OiI1MDE5MzAxNzY1NTE3NDZfNzI4NjgzODkiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjE0OiJDaGlhcmEgQWxpb3R0YSI7czoyOiJpZCI7czoxNToiMTAwMDAxNTcyMDY0NTM0Ijt9czo3OiJtZXNzYWdlIjtzOjYxOiJCYWJzLCBpZiB5b3UgaGFkIDUgbGlrZSBteSBjYXQgeW91IHdvdWxkIGNhbGwgZm9yIGJhbmtydXB0Y3khIjtzOjEyOiJtZXNzYWdlX3RhZ3MiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjU6e3M6MjoiaWQiO3M6MTU6IjEwMDAwMjA0MzA0ODA1NyI7czo0OiJuYW1lIjtzOjQ6IkJhYnMiO3M6NDoidHlwZSI7czo0OiJ1c2VyIjtzOjY6Im9mZnNldCI7aTowO3M6NjoibGVuZ3RoIjtpOjQ7fX1zOjEwOiJjYW5fcmVtb3ZlIjtiOjE7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTE2VDEyOjUxOjI5KzAwMDAiO3M6MTA6Imxpa2VfY291bnQiO2k6MTtzOjEwOiJ1c2VyX2xpa2VzIjtiOjE7fWk6MztPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtzOjI0OiI1MDE5MzAxNzY1NTE3NDZfNzI4Njg3NTUiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6MTUxOiJJIGhhZCBhIGxpdHRlciBvbmNlLi4uIEZvdXIgaGVhbHRoeSBvbmVzIGFuZCBvbmUgZGVhZCBvbmUgOiggVGhleSB3ZXJlIGFkb3JhYmxlIGJ1dCBURyB3ZSBoYWQgaG91c2VrZWVwaW5nIC0gdGhvc2UgdGlueSBwdXBwaWVzIGNhbiBtYWtlIGEgaHVnZSBtZXNzIDspIjtzOjEwOiJjYW5fcmVtb3ZlIjtiOjE7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTE2VDE3OjExOjU1KzAwMDAiO3M6MTA6Imxpa2VfY291bnQiO2k6MDtzOjEwOiJ1c2VyX2xpa2VzIjtiOjA7fWk6NDtPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtzOjI0OiI1MDE5MzAxNzY1NTE3NDZfNzI4NzM5NDgiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjE1OiJDYXJvbGluZSBDYW1tZWwiO3M6MjoiaWQiO3M6MTU6IjEwMDAwNTYzODI3Mzc5OCI7fXM6NzoibWVzc2FnZSI7czoxODoiU2NoYXR0aWchISEhISHzvq6XIjtzOjEwOiJjYW5fcmVtb3ZlIjtiOjE7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTE5VDA3OjM3OjM2KzAwMDAiO3M6MTA6Imxpa2VfY291bnQiO2k6MDtzOjEwOiJ1c2VyX2xpa2VzIjtiOjA7fX1zOjY6InBhZ2luZyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo3OiJjdXJzb3JzIjtPOjg6InN0ZENsYXNzIjoyOntzOjU6ImFmdGVyIjtzOjQ6Ik5RPT0iO3M6NjoiYmVmb3JlIjtzOjQ6Ik1RPT0iO319fX0=', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 2, '100002043048057_502128869865210', '2013-08-16 19:38:50', 'Tzo4OiJzdGRDbGFzcyI6MTY6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MDIxMjg4Njk4NjUyMTAiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6MTA4OiJNeSBzb24gd291bGQgbG92ZSB0aGVzZSA6KSBodHRwOi8vaG90cGVuZ3Vpbi5uZXQvZGVzcGljYWJsZS1tZS1taW5pb25zLWRyZXNzZWQtdXAtYXMtcG9wLWN1bHR1cmUtY2hhcmFjdGVycy8iO3M6NzoicGljdHVyZSI7czoyMTQ6Imh0dHBzOi8vZmJleHRlcm5hbC1hLmFrYW1haWhkLm5ldC9zYWZlX2ltYWdlLnBocD9kPUFRRFFyU1Fqd1pVRGlac2Emdz0xNTQmaD0xNTQmdXJsPWh0dHAlM0ElMkYlMkZob3RwZW5ndWluLm5ldCUyRndwLWNvbnRlbnQlMkZ1cGxvYWRzJTJGMjAxMyUyRjA4JTJGRGVzcGljYWJsZS1NZS1NaW5pb25zLURyZXNzZWQtVXAtYXMtUG9wLUN1bHR1cmUtQ2hhcmFjdGVycy0xNi5qcGciO3M6NDoibGluayI7czo4MToiaHR0cDovL2hvdHBlbmd1aW4ubmV0L2Rlc3BpY2FibGUtbWUtbWluaW9ucy1kcmVzc2VkLXVwLWFzLXBvcC1jdWx0dXJlLWNoYXJhY3RlcnMvIjtzOjQ6Im5hbWUiO3M6NTg6IkRlc3BpY2FibGUgTWUgTWluaW9ucyBEcmVzc2VkIFVwIGFzIFBvcCBDdWx0dXJlIENoYXJhY3RlcnMiO3M6NzoiY2FwdGlvbiI7czoxNDoiaG90cGVuZ3Vpbi5uZXQiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjMwNzoiV2hldGhlciB5b3XigJl2ZSBzZWVuIHRoZSBzZXF1ZWwgdG8gRGVzcGljYWJsZSBNZSBvciBub3QsIGNoYW5jZXMgYXJlIGdvb2QgeW91IGtub3cgZXhhY3RseSB3aG8gdGhlIE1pbmlvbnMgYXJlLiBUaGVzZSB5ZWxsb3cgY29sb3JlZCwgY3lsaW5kZXIgc2hhcGVkIGNyZWF0dXJlcyBhcmUgdGhlIG1vc3Qgbm90YWJsZSBjaGFyYWN0ZXJzIGZyb20gdGhlIGZpbG0sIGFuZCB3ZeKAmXZlIGRlZmluaXRlbHkgYmVlbiBpbmZhdHVhdGVkIHdpdGggdGhlbSBzaW5jZSB0aGUgb3JpZ2luYWwgbW92aWUgaGl0IHRoZSBiaWcgc2NyZWVuIGJhYy4uLiI7czo0OiJpY29uIjtzOjY0OiJodHRwczovL2Zic3RhdGljLWEuYWthbWFpaGQubmV0L3JzcmMucGhwL3YyL3lEL3IvYVM4ZWNtWVJ5czAuZ2lmIjtzOjc6ImFjdGlvbnMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czo3OiJDb21tZW50IjtzOjQ6ImxpbmsiO3M6NjI6Imh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS8xMDAwMDIwNDMwNDgwNTcvcG9zdHMvNTAyMTI4ODY5ODY1MjEwIjt9fXM6NzoicHJpdmFjeSI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJ2YWx1ZSI7czowOiIiO31zOjQ6InR5cGUiO3M6NDoibGluayI7czoxMToic3RhdHVzX3R5cGUiO3M6MTI6InNoYXJlZF9zdG9yeSI7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTE2VDE5OjM4OjUwKzAwMDAiO3M6MTI6InVwZGF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOC0xNlQxOTozODo1MCswMDAwIjtzOjU6Imxpa2VzIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImRhdGEiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czoxMToiSmFkaWUgVmFsa2UiO3M6MjoiaWQiO3M6MTU6IjEwMDAwMjY4NzI0ODE0NyI7fX1zOjU6ImNvdW50IjtpOjE7fX0=', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 2, '100002043048057_502130456531718', '2013-08-17 08:42:31', 'Tzo4OiJzdGRDbGFzcyI6MTU6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MDIxMzA0NTY1MzE3MTgiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6MjA5OiJBbG1vc3QgdW5yZWFsOiB0aGVzZSBwZXRhbHMgbG9vayBsaWtlIGFjdHVhbCBmZWF0aGVycyEgVHVsaXBzIGFyZSBiZWF1dGlmdWwgOikgaHR0cDovL3d3dy5mbG93ZXJtdXNlLmNvbS9tZWRpYS9jYXRhbG9nL3Byb2R1Y3QvY2FjaGUvMS9pbWFnZS85ZGY3OGVhYjMzNTI1ZDA4ZDZlNWZiOGQyNzEzNmU5NS9kL2EvZGFyay1wdXJwbGUtcGFycm90LXR1bGlwcy0xLmpwZyI7czo3OiJwaWN0dXJlIjtzOjI0MDoiaHR0cHM6Ly9mYmV4dGVybmFsLWEuYWthbWFpaGQubmV0L3NhZmVfaW1hZ2UucGhwP2Q9QVFCNDhTQXJGbmZiRWM1RSZ3PTE1NCZoPTE1NCZ1cmw9aHR0cCUzQSUyRiUyRnd3dy5mbG93ZXJtdXNlLmNvbSUyRm1lZGlhJTJGY2F0YWxvZyUyRnByb2R1Y3QlMkZjYWNoZSUyRjElMkZpbWFnZSUyRjlkZjc4ZWFiMzM1MjVkMDhkNmU1ZmI4ZDI3MTM2ZTk1JTJGZCUyRmElMkZkYXJrLXB1cnBsZS1wYXJyb3QtdHVsaXBzLTEuanBnIjtzOjQ6ImxpbmsiO3M6MTMwOiJodHRwOi8vd3d3LmZsb3dlcm11c2UuY29tL21lZGlhL2NhdGFsb2cvcHJvZHVjdC9jYWNoZS8xL2ltYWdlLzlkZjc4ZWFiMzM1MjVkMDhkNmU1ZmI4ZDI3MTM2ZTk1L2QvYS9kYXJrLXB1cnBsZS1wYXJyb3QtdHVsaXBzLTEuanBnIjtzOjQ6Im5hbWUiO3M6MTAwOiJodHRwOi8vd3d3LmZsb3dlcm11c2UuY29tL21lZGlhL2NhdGFsb2cvcHJvZHVjdC9jYWNoZS8xL2ltYWdlLzlkZjc4ZWFiMzM1MjVkMDhkNmU1ZmI4ZDI3MTM2ZTk1L2QvYS9kIjtzOjc6ImNhcHRpb24iO3M6MTg6Ind3dy5mbG93ZXJtdXNlLmNvbSI7czo0OiJpY29uIjtzOjY0OiJodHRwczovL2Zic3RhdGljLWEuYWthbWFpaGQubmV0L3JzcmMucGhwL3YyL3l6L3IvU3RFaDNSaFB2amsuZ2lmIjtzOjc6ImFjdGlvbnMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czo3OiJDb21tZW50IjtzOjQ6ImxpbmsiO3M6NjI6Imh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS8xMDAwMDIwNDMwNDgwNTcvcG9zdHMvNTAyMTMwNDU2NTMxNzE4Ijt9fXM6NzoicHJpdmFjeSI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJ2YWx1ZSI7czowOiIiO31zOjQ6InR5cGUiO3M6NDoibGluayI7czoxMToic3RhdHVzX3R5cGUiO3M6MTI6InNoYXJlZF9zdG9yeSI7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTE2VDE5OjQ0OjMwKzAwMDAiO3M6MTI6InVwZGF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOC0xN1QwODo0MjozMSswMDAwIjtzOjg6ImNvbW1lbnRzIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImRhdGEiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjc6e3M6MjoiaWQiO3M6MjQ6IjUwMjEzMDQ1NjUzMTcxOF83Mjg3MDE3NCI7czo0OiJmcm9tIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6MTM6IkJhYnMgR8O2c2dlbnMiO3M6MjoiaWQiO3M6MTU6IjEwMDAwMjA0MzA0ODA1NyI7fXM6NzoibWVzc2FnZSI7czo2MzoiaHR0cDovL2Zsb3dlcnBpY3MubmV0L3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDExLzEwL1R1bGlwLTAwNDAuanBnIjtzOjEwOiJjYW5fcmVtb3ZlIjtiOjE7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTE3VDA4OjQyOjMxKzAwMDAiO3M6MTA6Imxpa2VfY291bnQiO2k6MDtzOjEwOiJ1c2VyX2xpa2VzIjtiOjA7fX1zOjY6InBhZ2luZyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo3OiJjdXJzb3JzIjtPOjg6InN0ZENsYXNzIjoyOntzOjU6ImFmdGVyIjtzOjQ6Ik1RPT0iO3M6NjoiYmVmb3JlIjtzOjQ6Ik1RPT0iO319fX0=', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 2, '100002043048057_506947236050040', '2013-08-29 06:01:39', 'Tzo4OiJzdGRDbGFzcyI6MjA6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MDY5NDcyMzYwNTAwNDAiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6MzI6IkEgcGFydGluZyBnaWZ0IGZyb20gbXkgaW50ZXJuIDopIjtzOjU6InN0b3J5IjtzOjQ1OiJCYWJzIEfDtnNnZW5zIHNoYXJlZCBDcm9zc2luZyBIaXBwb3MncyBwaG90by4iO3M6NzoicGljdHVyZSI7czo5NDoiaHR0cHM6Ly9mYmNkbi1waG90b3MtZS1hLmFrYW1haWhkLm5ldC9ocGhvdG9zLWFrLXBybjIvOTcxNjQ2XzEwMTUxODAzMjU2ODk5MTkwXzc4NDI4MDMyOV9zLmpwZyI7czo0OiJsaW5rIjtzOjExMjoiaHR0cHM6Ly93d3cuZmFjZWJvb2suY29tL3Bob3RvLnBocD9mYmlkPTEwMTUxODAzMjU2ODk5MTkwJnNldD1hLjEwMTUxODAzMjU2ODc5MTkwLjEwNzM3NDE4MjUuMzU0NTc5Mzk0MTg5JnR5cGU9MSI7czo0OiJuYW1lIjtzOjE1OiJUaW1lbGluZSBQaG90b3MiO3M6NzoiY2FwdGlvbiI7czozNzoiQSBsaXR0bGUgcGFydGluZyBnaWZ0IGZyb20gbXkgaW50ZXJuOiI7czoxMDoicHJvcGVydGllcyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjI6IkJ5IjtzOjQ6InRleHQiO3M6MTU6IkNyb3NzaW5nIEhpcHBvcyI7czo0OiJocmVmIjtzOjcwOiJodHRwczovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvQ3Jvc3NpbmctSGlwcG9zLzM1NDU3OTM5NDE4OT9yZWY9c3RyZWFtIjt9fXM6NDoiaWNvbiI7czo2NDoiaHR0cHM6Ly9mYnN0YXRpYy1hLmFrYW1haWhkLm5ldC9yc3JjLnBocC92Mi95RC9yL2FTOGVjbVlSeXMwLmdpZiI7czo3OiJhY3Rpb25zIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6NzoiQ29tbWVudCI7czo0OiJsaW5rIjtzOjYyOiJodHRwczovL3d3dy5mYWNlYm9vay5jb20vMTAwMDAyMDQzMDQ4MDU3L3Bvc3RzLzUwNjk0NzIzNjA1MDA0MCI7fX1zOjc6InByaXZhY3kiO086ODoic3RkQ2xhc3MiOjE6e3M6NToidmFsdWUiO3M6MDoiIjt9czo0OiJ0eXBlIjtzOjU6InBob3RvIjtzOjExOiJzdGF0dXNfdHlwZSI7czoxMjoic2hhcmVkX3N0b3J5IjtzOjk6Im9iamVjdF9pZCI7czoxNzoiMTAxNTE4MDMyNTY4OTkxOTAiO3M6MTE6ImFwcGxpY2F0aW9uIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6NjoiUGhvdG9zIjtzOjI6ImlkIjtzOjEwOiIyMzA1MjcyNzMyIjt9czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTI4VDEyOjU4OjQ1KzAwMDAiO3M6MTI6InVwZGF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOC0yOVQwNjowMTozOSswMDAwIjtzOjU6Imxpa2VzIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImRhdGEiO2E6NDp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czoxNDoiTW9uaXF1ZSBHZWVsZW4iO3M6MjoiaWQiO3M6MTU6IjEwMDAwMDYxNDMxODQxNyI7fWk6MTtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6MTA6IlJvYiBHZWVsZW4iO3M6MjoiaWQiO3M6MTU6IjEwMDAwMDYzNzEzNzIwOSI7fWk6MjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6MTk6IkV2ZWxpZW4gdmFuIExlZXV3ZW4iO3M6MjoiaWQiO3M6MTU6IjEwMDAwMjQ4NDQxNjI0MCI7fWk6MztPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6MTY6Ik1hcmllLWFubmUgTWVsaXMiO3M6MjoiaWQiO3M6MTU6IjEwMDAwMTcwODExMTQ1NCI7fX1zOjU6ImNvdW50IjtpOjEwO31zOjg6ImNvbW1lbnRzIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImRhdGEiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjc6e3M6MjoiaWQiO3M6MjQ6IjUwNjk0NzIzNjA1MDA0MF83Mjg5NjEwNiI7czo0OiJmcm9tIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6MTQ6IkNoaWFyYSBBbGlvdHRhIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDE1NzIwNjQ1MzQiO31zOjc6Im1lc3NhZ2UiO3M6ODoic28gY3V0ZSEiO3M6MTA6ImNhbl9yZW1vdmUiO2I6MTtzOjEyOiJjcmVhdGVkX3RpbWUiO3M6MjQ6IjIwMTMtMDgtMjlUMDY6MDE6MzkrMDAwMCI7czoxMDoibGlrZV9jb3VudCI7aToxO3M6MTA6InVzZXJfbGlrZXMiO2I6MTt9fXM6NjoicGFnaW5nIjtPOjg6InN0ZENsYXNzIjoxOntzOjc6ImN1cnNvcnMiO086ODoic3RkQ2xhc3MiOjI6e3M6NToiYWZ0ZXIiO3M6NDoiTVE9PSI7czo2OiJiZWZvcmUiO3M6NDoiTVE9PSI7fX19fQ==', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 2, '100002043048057_508874709190626', '2013-09-04 20:00:04', 'Tzo4OiJzdGRDbGFzcyI6MTg6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MDg4NzQ3MDkxOTA2MjYiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6NTk6Ik9uZGVydGVrZW4gZGUgcGV0aXRpZSwgZGUgemVsZnN0YW5kaWdlbmFmdHJlayBtb2V0IGJsaWp2ZW4uIjtzOjc6InBpY3R1cmUiO3M6MTQxOiJodHRwczovL2ZiZXh0ZXJuYWwtYS5ha2FtYWloZC5uZXQvc2FmZV9pbWFnZS5waHA/ZD1BUUR5bGJfeVNEMFJUdkNwJnc9MTU0Jmg9MTU0JnVybD1odHRwJTNBJTJGJTJGY2RuLnBldGl0aW9uczI0LmNvbSUyRmltYWdlcyUyRnBldGl0aW9uNC5qcGciO3M6NDoibGluayI7czo2MToiaHR0cDovL3d3dy5wZXRpdGllczI0LmNvbS9kZV96ZWxmc3RhbmRpZ2VuYWZ0cmVrX21vZXRfYmxpanZlbiI7czo0OiJuYW1lIjtzOjM1OiJEZSBaZWxmc3RhbmRpZ2VuYWZ0cmVrIE1vZXQgQmxpanZlbiI7czo3OiJjYXB0aW9uIjtzOjE4OiJ3d3cucGV0aXRpZXMyNC5jb20iO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjMwNzoiVm9sZ2VucyBoZXQgRkQgdmFuIDYgYXVndXN0dXMgaGViYmVuIFZWRCBlbiBQdmRBIGhldCB2b29ybmVtZW4gZGUgemVsZnN0YW5kaWdlbmFmdHJlayBpbiBkZSBpbmtvbXN0ZW5iZWxhc3RpbmcgYWYgdGUgc2NoYWZmZW4gb2YgZmxpbmsgdGUgYmVwZXJrZW4uIE9vayB3b3JkdCBnZXNwcm9rZW4gb3ZlciBkZSBvcHRpZSBkZSB6ZWxmc3RhbmRpZ2VuYWZ0cmVrIHRlIGxhdGVuIGJlc3RhYW4sIG1hYXIgZWVuIOKAmHp6cC1iZWxhc3RpbmfigJkgaW4gdGUgdm9lcmVuLCB3YXQgdm9vciBlZW4gZ3JvdGUgZ3JvZXAgb25kZXJuZW1lcnMgby4uLiI7czo0OiJpY29uIjtzOjY0OiJodHRwczovL2Zic3RhdGljLWEuYWthbWFpaGQubmV0L3JzcmMucGhwL3YyL3lEL3IvYVM4ZWNtWVJ5czAuZ2lmIjtzOjc6ImFjdGlvbnMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czo3OiJDb21tZW50IjtzOjQ6ImxpbmsiO3M6NjI6Imh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS8xMDAwMDIwNDMwNDgwNTcvcG9zdHMvNTA4ODc0NzA5MTkwNjI2Ijt9fXM6NzoicHJpdmFjeSI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJ2YWx1ZSI7czowOiIiO31zOjQ6InR5cGUiO3M6NDoibGluayI7czoxMToic3RhdHVzX3R5cGUiO3M6MTI6InNoYXJlZF9zdG9yeSI7czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czoxNzoiU2hhcmVfYm9va21hcmtsZXQiO3M6MjoiaWQiO3M6MTA6IjUwODU2NDc5OTUiO31zOjEyOiJjcmVhdGVkX3RpbWUiO3M6MjQ6IjIwMTMtMDktMDJUMDg6MzE6MzErMDAwMCI7czoxMjoidXBkYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA5LTA0VDIwOjAwOjA0KzAwMDAiO3M6NToibGlrZXMiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoiZGF0YSI7YTozOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjk6IkFuamEgSGFnZSI7czoyOiJpZCI7czoxMDoiMTE5MDI0NTgzMiI7fWk6MTtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6MjY6IkRhbm55IFBhc3F1YWxlIE1vb2kgU29tZXJzIjtzOjI6ImlkIjtzOjEwOiIxNTM1OTE3NTQ5Ijt9aToyO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czoxMDoiUmF5IEJvZ21hbiI7czoyOiJpZCI7czoxMDoiMTA1MzU3MzY5MSI7fX1zOjU6ImNvdW50IjtpOjM7fXM6ODoiY29tbWVudHMiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoiZGF0YSI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6Nzp7czoyOiJpZCI7czoyNDoiNTA4ODc0NzA5MTkwNjI2XzcyOTA5MjY5IjtzOjQ6ImZyb20iO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czo5OiJBbmphIEhhZ2UiO3M6MjoiaWQiO3M6MTA6IjExOTAyNDU4MzIiO31zOjc6Im1lc3NhZ2UiO3M6MTg6IkhlbGVtYWFsIG1lZSBlZW5zISI7czoxMDoiY2FuX3JlbW92ZSI7YjoxO3M6MTI6ImNyZWF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOS0wNFQyMDowMDowNCswMDAwIjtzOjEwOiJsaWtlX2NvdW50IjtpOjA7czoxMDoidXNlcl9saWtlcyI7YjowO319czo2OiJwYWdpbmciO086ODoic3RkQ2xhc3MiOjE6e3M6NzoiY3Vyc29ycyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo1OiJhZnRlciI7czo0OiJNUT09IjtzOjY6ImJlZm9yZSI7czo0OiJNUT09Ijt9fX19', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 2, '100002043048057_510169425727821', '2013-09-05 17:45:21', 'Tzo4OiJzdGRDbGFzcyI6MTA6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MTAxNjk0MjU3Mjc4MjEiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6Nzg6IkhvZSB6aXQgaGV0IG1ldCBqb3V3IHBlcnNvb25saWprIGxlaWRlcnNjaGFwPyBIdHRwOi8vd3d3LmZsZXhmb2N1cy5ubC9leWVvbm1lLyI7czo3OiJhY3Rpb25zIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6NzoiQ29tbWVudCI7czo0OiJsaW5rIjtzOjYyOiJodHRwczovL3d3dy5mYWNlYm9vay5jb20vMTAwMDAyMDQzMDQ4MDU3L3Bvc3RzLzUxMDE2OTQyNTcyNzgyMSI7fX1zOjc6InByaXZhY3kiO086ODoic3RkQ2xhc3MiOjE6e3M6NToidmFsdWUiO3M6MDoiIjt9czo0OiJ0eXBlIjtzOjY6InN0YXR1cyI7czoxMToic3RhdHVzX3R5cGUiO3M6MjA6Im1vYmlsZV9zdGF0dXNfdXBkYXRlIjtzOjExOiJhcHBsaWNhdGlvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjE5OiJGYWNlYm9vayBmb3IgaVBob25lIjtzOjk6Im5hbWVzcGFjZSI7czo4OiJmYmlwaG9uZSI7czoyOiJpZCI7czoxMDoiNjYyODU2ODM3OSI7fXM6MTI6ImNyZWF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOS0wNVQxNzo0NToyMSswMDAwIjtzOjEyOiJ1cGRhdGVkX3RpbWUiO3M6MjQ6IjIwMTMtMDktMDVUMTc6NDU6MjErMDAwMCI7fQ==', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 2, '100002043048057_510178002393630', '2013-09-06 06:15:24', 'Tzo4OiJzdGRDbGFzcyI6MTE6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MTAxNzgwMDIzOTM2MzAiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6ODE6Ik9IOiB3ZSd2ZSBiZWVuIGdvbmUgZm9yIDEwIHllYXJzLiBUaGlzIGlzIGEgd2hvbGUgbmV3IGdlbmVyYXRpb24gb2YgcGlja3VwIGdpcmxzLiI7czo3OiJhY3Rpb25zIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6NzoiQ29tbWVudCI7czo0OiJsaW5rIjtzOjYyOiJodHRwczovL3d3dy5mYWNlYm9vay5jb20vMTAwMDAyMDQzMDQ4MDU3L3Bvc3RzLzUxMDE3ODAwMjM5MzYzMCI7fX1zOjc6InByaXZhY3kiO086ODoic3RkQ2xhc3MiOjE6e3M6NToidmFsdWUiO3M6MDoiIjt9czo0OiJ0eXBlIjtzOjY6InN0YXR1cyI7czoxMToic3RhdHVzX3R5cGUiO3M6MjA6Im1vYmlsZV9zdGF0dXNfdXBkYXRlIjtzOjExOiJhcHBsaWNhdGlvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjE5OiJGYWNlYm9vayBmb3IgaVBob25lIjtzOjk6Im5hbWVzcGFjZSI7czo4OiJmYmlwaG9uZSI7czoyOiJpZCI7czoxMDoiNjYyODU2ODM3OSI7fXM6MTI6ImNyZWF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOS0wNVQxODoxNzoyNCswMDAwIjtzOjEyOiJ1cGRhdGVkX3RpbWUiO3M6MjQ6IjIwMTMtMDktMDZUMDY6MTU6MjQrMDAwMCI7czo4OiJjb21tZW50cyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJkYXRhIjthOjI6e2k6MDtPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtzOjI0OiI1MTAxNzgwMDIzOTM2MzBfNzI5MTE2MDQiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjIwOiJJbmdyaWQgVmFuIGRlIE1vcnRlbCI7czoyOiJpZCI7czoxNToiMTAwMDAwMTE4ODA4NDAxIjt9czo3OiJtZXNzYWdlIjtzOjI1OiJQaWNrLXVwIGdpcmxzIGluIFR1cmtpamU/IjtzOjEwOiJjYW5fcmVtb3ZlIjtiOjE7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA5LTA1VDIyOjQyOjEwKzAwMDAiO3M6MTA6Imxpa2VfY291bnQiO2k6MDtzOjEwOiJ1c2VyX2xpa2VzIjtiOjA7fWk6MTtPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtzOjI0OiI1MTAxNzgwMDIzOTM2MzBfNzI5MTI1NDAiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6MTc6IkxvbCwgbmVlIGluIEdoYW5hIjtzOjEwOiJjYW5fcmVtb3ZlIjtiOjE7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA5LTA2VDA2OjE1OjI0KzAwMDAiO3M6MTA6Imxpa2VfY291bnQiO2k6MDtzOjEwOiJ1c2VyX2xpa2VzIjtiOjA7fX1zOjY6InBhZ2luZyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo3OiJjdXJzb3JzIjtPOjg6InN0ZENsYXNzIjoyOntzOjU6ImFmdGVyIjtzOjQ6Ik1nPT0iO3M6NjoiYmVmb3JlIjtzOjQ6Ik1RPT0iO319fX0=', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 2, '100002043048057_511826638895433', '2013-09-09 07:14:03', 'Tzo4OiJzdGRDbGFzcyI6MTc6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MTE4MjY2Mzg4OTU0MzMiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6MTcyOiJKZSBrdW50IHZhbiBGYWNlYm9vayB2aW5kZW4gd2F0IGplIHZpbmQsIG1hYXIgZGl0IGlzIGVlbiBmYW50YXN0aXNjaCBpbml0aWF0aWVmLiBJbnRlcm5ldCBpcyBlZW4gZWZmZWN0aWV2ZSBtYW5pZXIgb20gQWZyaWthIChlbiBhbmRlcmUgZGVyZGUgd2VyZWxkIGxhbmRlbikgdGUgb250d2lra2VsZW4uIjtzOjc6InBpY3R1cmUiO3M6MTkwOiJodHRwczovL2ZiZXh0ZXJuYWwtYS5ha2FtYWloZC5uZXQvc2FmZV9pbWFnZS5waHA/ZD1BUUI3a2hGZzR1T3ZLam1nJnc9MTU0Jmg9MTU0JnVybD1odHRwcyUzQSUyRiUyRmFzc2V0cy1zdGFja3NvY2lhbC5uZXRkbmEtc3NsLmNvbSUyRnVwbG9hZGVkX3NjcmVlbnNob3RfMXMlMkY1MzcxJTJGcmVkZXNpZ25fM19MZW5zX1JlZG8ucG5nIjtzOjQ6ImxpbmsiO3M6MTA1OiJodHRwOi8vZGVzaWdudGF4aS5jb20vbmV3cy8zNjA0NDQvTWFyay1adWNrZXJiZXJnLUFubm91bmNlcy1MYXVuY2gtT2YtSW50ZXJuZXQtb3JnLyMuVWkxMEdpS2NYTDguZmFjZWJvb2siO3M6NDoibmFtZSI7czo3MToiTWFyayBadWNrZXJiZXJnIEFubm91bmNlcyBMYXVuY2ggT2Yg4oCYSW50ZXJuZXQub3Jn4oCZIC0gRGVzaWduVEFYSS5jb20iO3M6NzoiY2FwdGlvbiI7czoxNDoiZGVzaWdudGF4aS5jb20iO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjcxOiJNYXJrIFp1Y2tlcmJlcmcgQW5ub3VuY2VzIExhdW5jaCBPZiDigJhJbnRlcm5ldC5vcmfigJkgLSBEZXNpZ25UQVhJLmNvbSI7czo0OiJpY29uIjtzOjY0OiJodHRwczovL2Zic3RhdGljLWEuYWthbWFpaGQubmV0L3JzcmMucGhwL3YyL3lxL3IvU0MyWm1Fa2ZJLVgucG5nIjtzOjc6ImFjdGlvbnMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czo3OiJDb21tZW50IjtzOjQ6ImxpbmsiO3M6NjI6Imh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS8xMDAwMDIwNDMwNDgwNTcvcG9zdHMvNTExODI2NjM4ODk1NDMzIjt9fXM6NzoicHJpdmFjeSI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJ2YWx1ZSI7czowOiIiO31zOjQ6InR5cGUiO3M6NDoibGluayI7czoxMToic3RhdHVzX3R5cGUiO3M6MTI6InNoYXJlZF9zdG9yeSI7czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czoxNzoiU2hhcmVfYm9va21hcmtsZXQiO3M6MjoiaWQiO3M6MTA6IjUwODU2NDc5OTUiO31zOjEyOiJjcmVhdGVkX3RpbWUiO3M6MjQ6IjIwMTMtMDktMDlUMDc6MTQ6MDMrMDAwMCI7czoxMjoidXBkYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA5LTA5VDA3OjE0OjAzKzAwMDAiO3M6NToibGlrZXMiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoiZGF0YSI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjE0OiJDaGlhcmEgQWxpb3R0YSI7czoyOiJpZCI7czoxNToiMTAwMDAxNTcyMDY0NTM0Ijt9fXM6NToiY291bnQiO2k6MTt9fQ==', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 2, '100002043048057_515362341875196', '2013-09-16 18:45:26', 'Tzo4OiJzdGRDbGFzcyI6MTc6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MTUzNjIzNDE4NzUxOTYiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6MjQ6IkRhYXIgaXMgaGV0IGxla2tlciB3ZWVyLiI7czo3OiJwaWN0dXJlIjtzOjE1NDoiaHR0cHM6Ly9mYmV4dGVybmFsLWEuYWthbWFpaGQubmV0L3NhZmVfaW1hZ2UucGhwP2Q9QVFDUHI5azQ2cDIwWUU4SCZ3PTE1NCZoPTE1NCZ1cmw9aHR0cCUzQSUyRiUyRmZhcm02LnN0YXRpY2ZsaWNrci5jb20lMkY1NTQ0JTJGOTYxOTAyODAzOV85NzFmOTJmYWFlLmpwZyI7czo0OiJsaW5rIjtzOjgxOiJodHRwOi8vdHJhaW5pbmd0cmlwcy5ldS9kZXN0aW5hdGlvbnMvZGVzdGluYXRpb24vMTk0LWJvdXNrb3VyYS1jYXNhYmxhbmNhP2xhbmc9ZW4iO3M6NDoibmFtZSI7czoyMDoiQm91c2tvdXJhIENhc2FibGFuY2EiO3M6NzoiY2FwdGlvbiI7czoxNjoidHJhaW5pbmd0cmlwcy5ldSI7czoxMToiZGVzY3JpcHRpb24iO3M6MzAzOiJUaGlzIGhvdGVsIG9mZmVycyBhIHllYXItcm91bmQgcHJhY3RpY2UgZmFjaWxpdHkgaW4gYW4gaWRlYWwgY2xpbWF0ZS4gRXZlcnl0aGluZyBhIGZvb3RiYWxsIHRlYW0gbmVlZHMgaXMgcHJvdmlkZWQ6IGZyb20gdGhlIHRvcCBxdWFsaXR5IG9mIHRoZSBmb290YmFsbCBwaXRjaGVzIGFuZCBhY2NvbW1vZGF0aW9uIG9mIHRoZSBoaWdoZXN0IHN0YW5kYXJkcyB0byBmdWxsIGNhdGVyaW5nIHNlcnZpY2VzLCBhIGhvc3Qgb2Ygb3RoZXIgYWN0aXZpdGllcyBzdWNoIGFzIHRlbm5pcywgYSBmdWxseSBlcXVpcHBlZCBGaXRuZXNzIEMuLi4iO3M6NDoiaWNvbiI7czo2NDoiaHR0cHM6Ly9mYnN0YXRpYy1hLmFrYW1haWhkLm5ldC9yc3JjLnBocC92Mi95RC9yL2FTOGVjbVlSeXMwLmdpZiI7czo3OiJhY3Rpb25zIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6NzoiQ29tbWVudCI7czo0OiJsaW5rIjtzOjYyOiJodHRwczovL3d3dy5mYWNlYm9vay5jb20vMTAwMDAyMDQzMDQ4MDU3L3Bvc3RzLzUxNTM2MjM0MTg3NTE5NiI7fX1zOjc6InByaXZhY3kiO086ODoic3RkQ2xhc3MiOjE6e3M6NToidmFsdWUiO3M6MDoiIjt9czo0OiJ0eXBlIjtzOjQ6ImxpbmsiO3M6MTE6InN0YXR1c190eXBlIjtzOjEyOiJzaGFyZWRfc3RvcnkiO3M6MTE6ImFwcGxpY2F0aW9uIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6MTc6IlNoYXJlX2Jvb2ttYXJrbGV0IjtzOjI6ImlkIjtzOjEwOiI1MDg1NjQ3OTk1Ijt9czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA5LTE2VDE4OjQ1OjI2KzAwMDAiO3M6MTI6InVwZGF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOS0xNlQxODo0NToyNiswMDAwIjtzOjU6Imxpa2VzIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImRhdGEiO2E6Mjp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czoxMjoiSmFuIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDI0OTgwNzY2MTIiO31pOjE7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjE5OiJIZWxlZW4gTG91d2VyZW5idXJnIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDAyMDI2OTU3MTUiO319czo1OiJjb3VudCI7aToyO319', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 3, '10d9a496e7ee8efecfb79ac92e3a7aa4e3fcb85c', '2013-09-17 19:50:05', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6IjEwZDlhNDk2ZTdlZThlZmVjZmI3OWFjOTJlM2E3YWE0ZTNmY2I4NWMiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTdUMTk6NTA6MDVaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE3VDE5OjUwOjA1WiI7fXM6NzoibWVzc2FnZSI7czoxMjoiTW92ZSBidXR0b25zIjtzOjQ6InRyZWUiO086ODoic3RkQ2xhc3MiOjI6e3M6Mzoic2hhIjtzOjQwOiI5NzQzMmYxZDE2NmE3YTg3OWQwMjgzMDcxNTVhMTVkZmJmYTFjZjY3IjtzOjM6InVybCI7czoxMDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L3RyZWVzLzk3NDMyZjFkMTY2YTdhODc5ZDAyODMwNzE1NWExNWRmYmZhMWNmNjciO31zOjM6InVybCI7czoxMDg6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L2NvbW1pdHMvMTBkOWE0OTZlN2VlOGVmZWNmYjc5YWM5MmUzYTdhYTRlM2ZjYjg1YyI7czoxMzoiY29tbWVudF9jb3VudCI7aTowO31zOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy8xMGQ5YTQ5NmU3ZWU4ZWZlY2ZiNzlhYzkyZTNhN2FhNGUzZmNiODVjIjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0LzEwZDlhNDk2ZTdlZThlZmVjZmI3OWFjOTJlM2E3YWE0ZTNmY2I4NWMiO3M6MTI6ImNvbW1lbnRzX3VybCI7czoxMTM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy8xMGQ5YTQ5NmU3ZWU4ZWZlY2ZiNzlhYzkyZTNhN2FhNGUzZmNiODVjL2NvbW1lbnRzIjtzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjk6ImNvbW1pdHRlciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjc6InBhcmVudHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjM6e3M6Mzoic2hhIjtzOjQwOiJjNzViMTkxZDY2NDgxZjY1ZGM3OGU0ZjkzNDNhM2U2MDJjZGEzMjE5IjtzOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9jNzViMTkxZDY2NDgxZjY1ZGM3OGU0ZjkzNDNhM2U2MDJjZGEzMjE5IjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0L2M3NWIxOTFkNjY0ODFmNjVkYzc4ZTRmOTM0M2EzZTYwMmNkYTMyMTkiO319fQ==', '', 'https://github.com/babsgosgens/crossinghippos/commit/10d9a496e7ee8efecfb79ac92e3a7aa4e3fcb85c', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 3, '139238439611d0939d3f341feb9f01aa055bff62', '2013-09-17 12:40:00', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6IjEzOTIzODQzOTYxMWQwOTM5ZDNmMzQxZmViOWYwMWFhMDU1YmZmNjIiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTdUMTI6NDA6MDBaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE3VDEyOjQwOjAwWiI7fXM6NzoibWVzc2FnZSI7czoyMzoiTmV3IGRiIGR1bXAgZm9yIEplYW50amUiO3M6NDoidHJlZSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czozOiJzaGEiO3M6NDA6IjhkOGQxZjM5NTljMDU4YWMxZWFmZjExZjE3YWM5NTk0NDZmOGI5NzIiO3M6MzoidXJsIjtzOjEwNjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9naXQvdHJlZXMvOGQ4ZDFmMzk1OWMwNThhYzFlYWZmMTFmMTdhYzk1OTQ0NmY4Yjk3MiI7fXM6MzoidXJsIjtzOjEwODoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9naXQvY29tbWl0cy8xMzkyMzg0Mzk2MTFkMDkzOWQzZjM0MWZlYjlmMDFhYTA1NWJmZjYyIjtzOjEzOiJjb21tZW50X2NvdW50IjtpOjA7fXM6MzoidXJsIjtzOjEwNDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzEzOTIzODQzOTYxMWQwOTM5ZDNmMzQxZmViOWYwMWFhMDU1YmZmNjIiO3M6ODoiaHRtbF91cmwiO3M6OTM6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXQvMTM5MjM4NDM5NjExZDA5MzlkM2YzNDFmZWI5ZjAxYWEwNTViZmY2MiI7czoxMjoiY29tbWVudHNfdXJsIjtzOjExMzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzEzOTIzODQzOTYxMWQwOTM5ZDNmMzQxZmViOWYwMWFhMDU1YmZmNjIvY29tbWVudHMiO3M6NjoiYXV0aG9yIjtPOjg6InN0ZENsYXNzIjoxNjp7czo1OiJsb2dpbiI7czoxMToiYmFic2dvc2dlbnMiO3M6MjoiaWQiO2k6MTI2ODE0MjtzOjEwOiJhdmF0YXJfdXJsIjtzOjEzOToiaHR0cHM6Ly8xLmdyYXZhdGFyLmNvbS9hdmF0YXIvYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjY/ZD1odHRwcyUzQSUyRiUyRmlkZW50aWNvbnMuZ2l0aHViLmNvbSUyRjUzODU1MTg0OGJlYjU4NmU3MjU1MzkxMzI5MDU2N2YzLnBuZyI7czoxMToiZ3JhdmF0YXJfaWQiO3M6MzI6ImIzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2IjtzOjM6InVybCI7czo0MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2VucyI7czo4OiJodG1sX3VybCI7czozMDoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zIjtzOjEzOiJmb2xsb3dlcnNfdXJsIjtzOjUwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2VycyI7czoxMzoiZm9sbG93aW5nX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IjtzOjk6Imdpc3RzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9naXN0c3svZ2lzdF9pZH0iO3M6MTE6InN0YXJyZWRfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N0YXJyZWR7L293bmVyfXsvcmVwb30iO3M6MTc6InN1YnNjcmlwdGlvbnNfdXJsIjtzOjU0OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N1YnNjcmlwdGlvbnMiO3M6MTc6Im9yZ2FuaXphdGlvbnNfdXJsIjtzOjQ1OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL29yZ3MiO3M6OToicmVwb3NfdXJsIjtzOjQ2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlcG9zIjtzOjEwOiJldmVudHNfdXJsIjtzOjU3OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2V2ZW50c3svcHJpdmFjeX0iO3M6MTk6InJlY2VpdmVkX2V2ZW50c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVjZWl2ZWRfZXZlbnRzIjtzOjQ6InR5cGUiO3M6NDoiVXNlciI7fXM6OToiY29tbWl0dGVyIjtPOjg6InN0ZENsYXNzIjoxNjp7czo1OiJsb2dpbiI7czoxMToiYmFic2dvc2dlbnMiO3M6MjoiaWQiO2k6MTI2ODE0MjtzOjEwOiJhdmF0YXJfdXJsIjtzOjEzOToiaHR0cHM6Ly8xLmdyYXZhdGFyLmNvbS9hdmF0YXIvYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjY/ZD1odHRwcyUzQSUyRiUyRmlkZW50aWNvbnMuZ2l0aHViLmNvbSUyRjUzODU1MTg0OGJlYjU4NmU3MjU1MzkxMzI5MDU2N2YzLnBuZyI7czoxMToiZ3JhdmF0YXJfaWQiO3M6MzI6ImIzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2IjtzOjM6InVybCI7czo0MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2VucyI7czo4OiJodG1sX3VybCI7czozMDoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zIjtzOjEzOiJmb2xsb3dlcnNfdXJsIjtzOjUwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2VycyI7czoxMzoiZm9sbG93aW5nX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IjtzOjk6Imdpc3RzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9naXN0c3svZ2lzdF9pZH0iO3M6MTE6InN0YXJyZWRfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N0YXJyZWR7L293bmVyfXsvcmVwb30iO3M6MTc6InN1YnNjcmlwdGlvbnNfdXJsIjtzOjU0OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N1YnNjcmlwdGlvbnMiO3M6MTc6Im9yZ2FuaXphdGlvbnNfdXJsIjtzOjQ1OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL29yZ3MiO3M6OToicmVwb3NfdXJsIjtzOjQ2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlcG9zIjtzOjEwOiJldmVudHNfdXJsIjtzOjU3OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2V2ZW50c3svcHJpdmFjeX0iO3M6MTk6InJlY2VpdmVkX2V2ZW50c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVjZWl2ZWRfZXZlbnRzIjtzOjQ6InR5cGUiO3M6NDoiVXNlciI7fXM6NzoicGFyZW50cyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czozOiJzaGEiO3M6NDA6IjdmYmQ4MWU4MjIyNDcxM2ExYTVmNGE3OTlkZTFmY2Q1YmQxZWMyYWEiO3M6MzoidXJsIjtzOjEwNDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzdmYmQ4MWU4MjIyNDcxM2ExYTVmNGE3OTlkZTFmY2Q1YmQxZWMyYWEiO3M6ODoiaHRtbF91cmwiO3M6OTM6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXQvN2ZiZDgxZTgyMjI0NzEzYTFhNWY0YTc5OWRlMWZjZDViZDFlYzJhYSI7fX19', '', 'https://github.com/babsgosgens/crossinghippos/commit/139238439611d0939d3f341feb9f01aa055bff62', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 3, '1875e9a3c9447bcd0c2e1a9d4a09b8700e64cf8d', '2013-09-17 18:04:44', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6IjE4NzVlOWEzYzk0NDdiY2QwYzJlMWE5ZDRhMDliODcwMGU2NGNmOGQiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTdUMTg6MDQ6NDRaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE3VDE4OjA0OjQ0WiI7fXM6NzoibWVzc2FnZSI7czo4MDoiU3RhdGUgdG9nZ2xlIHJlcXVpcmVzIGFuIGlkIGNvbHVtbi4gSW1wb3J0IGRiZHVtcHMvMjAxMzA5MTcyMDAzZmxvY2tfc3RyZWFtcy5zcWwiO3M6NDoidHJlZSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czozOiJzaGEiO3M6NDA6ImYyNWU4ZTRiZWIxMWNkNTMwZDMwZTEzYWFmMzI5MDkwMDkzNjY1MGIiO3M6MzoidXJsIjtzOjEwNjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9naXQvdHJlZXMvZjI1ZThlNGJlYjExY2Q1MzBkMzBlMTNhYWYzMjkwOTAwOTM2NjUwYiI7fXM6MzoidXJsIjtzOjEwODoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9naXQvY29tbWl0cy8xODc1ZTlhM2M5NDQ3YmNkMGMyZTFhOWQ0YTA5Yjg3MDBlNjRjZjhkIjtzOjEzOiJjb21tZW50X2NvdW50IjtpOjA7fXM6MzoidXJsIjtzOjEwNDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzE4NzVlOWEzYzk0NDdiY2QwYzJlMWE5ZDRhMDliODcwMGU2NGNmOGQiO3M6ODoiaHRtbF91cmwiO3M6OTM6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXQvMTg3NWU5YTNjOTQ0N2JjZDBjMmUxYTlkNGEwOWI4NzAwZTY0Y2Y4ZCI7czoxMjoiY29tbWVudHNfdXJsIjtzOjExMzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzE4NzVlOWEzYzk0NDdiY2QwYzJlMWE5ZDRhMDliODcwMGU2NGNmOGQvY29tbWVudHMiO3M6NjoiYXV0aG9yIjtPOjg6InN0ZENsYXNzIjoxNjp7czo1OiJsb2dpbiI7czoxMToiYmFic2dvc2dlbnMiO3M6MjoiaWQiO2k6MTI2ODE0MjtzOjEwOiJhdmF0YXJfdXJsIjtzOjEzOToiaHR0cHM6Ly8xLmdyYXZhdGFyLmNvbS9hdmF0YXIvYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjY/ZD1odHRwcyUzQSUyRiUyRmlkZW50aWNvbnMuZ2l0aHViLmNvbSUyRjUzODU1MTg0OGJlYjU4NmU3MjU1MzkxMzI5MDU2N2YzLnBuZyI7czoxMToiZ3JhdmF0YXJfaWQiO3M6MzI6ImIzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2IjtzOjM6InVybCI7czo0MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2VucyI7czo4OiJodG1sX3VybCI7czozMDoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zIjtzOjEzOiJmb2xsb3dlcnNfdXJsIjtzOjUwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2VycyI7czoxMzoiZm9sbG93aW5nX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IjtzOjk6Imdpc3RzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9naXN0c3svZ2lzdF9pZH0iO3M6MTE6InN0YXJyZWRfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N0YXJyZWR7L293bmVyfXsvcmVwb30iO3M6MTc6InN1YnNjcmlwdGlvbnNfdXJsIjtzOjU0OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N1YnNjcmlwdGlvbnMiO3M6MTc6Im9yZ2FuaXphdGlvbnNfdXJsIjtzOjQ1OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL29yZ3MiO3M6OToicmVwb3NfdXJsIjtzOjQ2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlcG9zIjtzOjEwOiJldmVudHNfdXJsIjtzOjU3OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2V2ZW50c3svcHJpdmFjeX0iO3M6MTk6InJlY2VpdmVkX2V2ZW50c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVjZWl2ZWRfZXZlbnRzIjtzOjQ6InR5cGUiO3M6NDoiVXNlciI7fXM6OToiY29tbWl0dGVyIjtPOjg6InN0ZENsYXNzIjoxNjp7czo1OiJsb2dpbiI7czoxMToiYmFic2dvc2dlbnMiO3M6MjoiaWQiO2k6MTI2ODE0MjtzOjEwOiJhdmF0YXJfdXJsIjtzOjEzOToiaHR0cHM6Ly8xLmdyYXZhdGFyLmNvbS9hdmF0YXIvYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjY/ZD1odHRwcyUzQSUyRiUyRmlkZW50aWNvbnMuZ2l0aHViLmNvbSUyRjUzODU1MTg0OGJlYjU4NmU3MjU1MzkxMzI5MDU2N2YzLnBuZyI7czoxMToiZ3JhdmF0YXJfaWQiO3M6MzI6ImIzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2IjtzOjM6InVybCI7czo0MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2VucyI7czo4OiJodG1sX3VybCI7czozMDoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zIjtzOjEzOiJmb2xsb3dlcnNfdXJsIjtzOjUwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2VycyI7czoxMzoiZm9sbG93aW5nX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IjtzOjk6Imdpc3RzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9naXN0c3svZ2lzdF9pZH0iO3M6MTE6InN0YXJyZWRfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N0YXJyZWR7L293bmVyfXsvcmVwb30iO3M6MTc6InN1YnNjcmlwdGlvbnNfdXJsIjtzOjU0OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N1YnNjcmlwdGlvbnMiO3M6MTc6Im9yZ2FuaXphdGlvbnNfdXJsIjtzOjQ1OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL29yZ3MiO3M6OToicmVwb3NfdXJsIjtzOjQ2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlcG9zIjtzOjEwOiJldmVudHNfdXJsIjtzOjU3OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2V2ZW50c3svcHJpdmFjeX0iO3M6MTk6InJlY2VpdmVkX2V2ZW50c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVjZWl2ZWRfZXZlbnRzIjtzOjQ6InR5cGUiO3M6NDoiVXNlciI7fXM6NzoicGFyZW50cyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czozOiJzaGEiO3M6NDA6IjRlNTgzMzA5NmRmMDIxNWM5YWM5ZTMzMjc1NzU5Njg4MWRkMjdhYzQiO3M6MzoidXJsIjtzOjEwNDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzRlNTgzMzA5NmRmMDIxNWM5YWM5ZTMzMjc1NzU5Njg4MWRkMjdhYzQiO3M6ODoiaHRtbF91cmwiO3M6OTM6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXQvNGU1ODMzMDk2ZGYwMjE1YzlhYzllMzMyNzU3NTk2ODgxZGQyN2FjNCI7fX19', '', 'https://github.com/babsgosgens/crossinghippos/commit/1875e9a3c9447bcd0c2e1a9d4a09b8700e64cf8d', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `flock_streams` (`id`, `api_id`, `post_id`, `date_created`, `raw`, `metadata`, `permalink`, `params`, `language`, `state`, `publish_up`, `publish_down`) VALUES
(45, 3, '1879220e730c303ac9295d4925d9feb31c850906', '2013-09-17 07:40:29', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6IjE4NzkyMjBlNzMwYzMwM2FjOTI5NWQ0OTI1ZDlmZWIzMWM4NTA5MDYiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTdUMDc6NDA6MjlaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE3VDA3OjQwOjI5WiI7fXM6NzoibWVzc2FnZSI7czo2MDoiUmVtb3ZlIGhhcmRjb2RlZCBwbGF0Zm9ybSBzdHJpbmdzLCBpcyBub3cgam9pbmVkIGluIGRhdGFiYXNlIjtzOjQ6InRyZWUiO086ODoic3RkQ2xhc3MiOjI6e3M6Mzoic2hhIjtzOjQwOiJmNTAzYWYwZjU4MTM0MWFjODM0YTA1MTE3MmVhOTU2NDA2YjViNjgyIjtzOjM6InVybCI7czoxMDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L3RyZWVzL2Y1MDNhZjBmNTgxMzQxYWM4MzRhMDUxMTcyZWE5NTY0MDZiNWI2ODIiO31zOjM6InVybCI7czoxMDg6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L2NvbW1pdHMvMTg3OTIyMGU3MzBjMzAzYWM5Mjk1ZDQ5MjVkOWZlYjMxYzg1MDkwNiI7czoxMzoiY29tbWVudF9jb3VudCI7aTowO31zOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy8xODc5MjIwZTczMGMzMDNhYzkyOTVkNDkyNWQ5ZmViMzFjODUwOTA2IjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0LzE4NzkyMjBlNzMwYzMwM2FjOTI5NWQ0OTI1ZDlmZWIzMWM4NTA5MDYiO3M6MTI6ImNvbW1lbnRzX3VybCI7czoxMTM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy8xODc5MjIwZTczMGMzMDNhYzkyOTVkNDkyNWQ5ZmViMzFjODUwOTA2L2NvbW1lbnRzIjtzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjk6ImNvbW1pdHRlciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjc6InBhcmVudHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjM6e3M6Mzoic2hhIjtzOjQwOiJiOTU0MmYxMTUwM2QwNDkxOGExZDRkZGIxZmM4MjRlMThiYWZmZGZkIjtzOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9iOTU0MmYxMTUwM2QwNDkxOGExZDRkZGIxZmM4MjRlMThiYWZmZGZkIjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0L2I5NTQyZjExNTAzZDA0OTE4YTFkNGRkYjFmYzgyNGUxOGJhZmZkZmQiO319fQ==', '', 'https://github.com/babsgosgens/crossinghippos/commit/1879220e730c303ac9295d4925d9feb31c850906', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 3, '1cfb3573d260b42ddc408af73acbc31e22f20b97', '2013-09-17 19:03:38', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6IjFjZmIzNTczZDI2MGI0MmRkYzQwOGFmNzNhY2JjMzFlMjJmMjBiOTciO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTdUMTk6MDM6MzhaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE3VDE5OjAzOjM4WiI7fXM6NzoibWVzc2FnZSI7czoyOToiQWRkIGN1c3RvbSBmb3JtZmllbGQgZm9yIGFwaXMiO3M6NDoidHJlZSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czozOiJzaGEiO3M6NDA6IjU5NmU5ODMxMjc0MDU4OTNlZGFjYTAwZjRkN2U0YTA2MTI5YTYxMTYiO3M6MzoidXJsIjtzOjEwNjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9naXQvdHJlZXMvNTk2ZTk4MzEyNzQwNTg5M2VkYWNhMDBmNGQ3ZTRhMDYxMjlhNjExNiI7fXM6MzoidXJsIjtzOjEwODoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9naXQvY29tbWl0cy8xY2ZiMzU3M2QyNjBiNDJkZGM0MDhhZjczYWNiYzMxZTIyZjIwYjk3IjtzOjEzOiJjb21tZW50X2NvdW50IjtpOjA7fXM6MzoidXJsIjtzOjEwNDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzFjZmIzNTczZDI2MGI0MmRkYzQwOGFmNzNhY2JjMzFlMjJmMjBiOTciO3M6ODoiaHRtbF91cmwiO3M6OTM6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXQvMWNmYjM1NzNkMjYwYjQyZGRjNDA4YWY3M2FjYmMzMWUyMmYyMGI5NyI7czoxMjoiY29tbWVudHNfdXJsIjtzOjExMzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzFjZmIzNTczZDI2MGI0MmRkYzQwOGFmNzNhY2JjMzFlMjJmMjBiOTcvY29tbWVudHMiO3M6NjoiYXV0aG9yIjtPOjg6InN0ZENsYXNzIjoxNjp7czo1OiJsb2dpbiI7czoxMToiYmFic2dvc2dlbnMiO3M6MjoiaWQiO2k6MTI2ODE0MjtzOjEwOiJhdmF0YXJfdXJsIjtzOjEzOToiaHR0cHM6Ly8xLmdyYXZhdGFyLmNvbS9hdmF0YXIvYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjY/ZD1odHRwcyUzQSUyRiUyRmlkZW50aWNvbnMuZ2l0aHViLmNvbSUyRjUzODU1MTg0OGJlYjU4NmU3MjU1MzkxMzI5MDU2N2YzLnBuZyI7czoxMToiZ3JhdmF0YXJfaWQiO3M6MzI6ImIzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2IjtzOjM6InVybCI7czo0MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2VucyI7czo4OiJodG1sX3VybCI7czozMDoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zIjtzOjEzOiJmb2xsb3dlcnNfdXJsIjtzOjUwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2VycyI7czoxMzoiZm9sbG93aW5nX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IjtzOjk6Imdpc3RzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9naXN0c3svZ2lzdF9pZH0iO3M6MTE6InN0YXJyZWRfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N0YXJyZWR7L293bmVyfXsvcmVwb30iO3M6MTc6InN1YnNjcmlwdGlvbnNfdXJsIjtzOjU0OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N1YnNjcmlwdGlvbnMiO3M6MTc6Im9yZ2FuaXphdGlvbnNfdXJsIjtzOjQ1OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL29yZ3MiO3M6OToicmVwb3NfdXJsIjtzOjQ2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlcG9zIjtzOjEwOiJldmVudHNfdXJsIjtzOjU3OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2V2ZW50c3svcHJpdmFjeX0iO3M6MTk6InJlY2VpdmVkX2V2ZW50c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVjZWl2ZWRfZXZlbnRzIjtzOjQ6InR5cGUiO3M6NDoiVXNlciI7fXM6OToiY29tbWl0dGVyIjtPOjg6InN0ZENsYXNzIjoxNjp7czo1OiJsb2dpbiI7czoxMToiYmFic2dvc2dlbnMiO3M6MjoiaWQiO2k6MTI2ODE0MjtzOjEwOiJhdmF0YXJfdXJsIjtzOjEzOToiaHR0cHM6Ly8xLmdyYXZhdGFyLmNvbS9hdmF0YXIvYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjY/ZD1odHRwcyUzQSUyRiUyRmlkZW50aWNvbnMuZ2l0aHViLmNvbSUyRjUzODU1MTg0OGJlYjU4NmU3MjU1MzkxMzI5MDU2N2YzLnBuZyI7czoxMToiZ3JhdmF0YXJfaWQiO3M6MzI6ImIzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2IjtzOjM6InVybCI7czo0MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2VucyI7czo4OiJodG1sX3VybCI7czozMDoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zIjtzOjEzOiJmb2xsb3dlcnNfdXJsIjtzOjUwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2VycyI7czoxMzoiZm9sbG93aW5nX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IjtzOjk6Imdpc3RzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9naXN0c3svZ2lzdF9pZH0iO3M6MTE6InN0YXJyZWRfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N0YXJyZWR7L293bmVyfXsvcmVwb30iO3M6MTc6InN1YnNjcmlwdGlvbnNfdXJsIjtzOjU0OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N1YnNjcmlwdGlvbnMiO3M6MTc6Im9yZ2FuaXphdGlvbnNfdXJsIjtzOjQ1OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL29yZ3MiO3M6OToicmVwb3NfdXJsIjtzOjQ2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlcG9zIjtzOjEwOiJldmVudHNfdXJsIjtzOjU3OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2V2ZW50c3svcHJpdmFjeX0iO3M6MTk6InJlY2VpdmVkX2V2ZW50c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVjZWl2ZWRfZXZlbnRzIjtzOjQ6InR5cGUiO3M6NDoiVXNlciI7fXM6NzoicGFyZW50cyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czozOiJzaGEiO3M6NDA6ImJjY2JlNTQzNjEwYzg4ZTYwNzVlMzQ2ZjNmODg2ZDM3OTRiOTFjOWUiO3M6MzoidXJsIjtzOjEwNDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzL2JjY2JlNTQzNjEwYzg4ZTYwNzVlMzQ2ZjNmODg2ZDM3OTRiOTFjOWUiO3M6ODoiaHRtbF91cmwiO3M6OTM6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXQvYmNjYmU1NDM2MTBjODhlNjA3NWUzNDZmM2Y4ODZkMzc5NGI5MWM5ZSI7fX19', '', 'https://github.com/babsgosgens/crossinghippos/commit/1cfb3573d260b42ddc408af73acbc31e22f20b97', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 3, '25ab6c1ae675f312465c24a625566d3a5bcd37b8', '2013-09-17 07:22:15', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6IjI1YWI2YzFhZTY3NWYzMTI0NjVjMjRhNjI1NTY2ZDNhNWJjZDM3YjgiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTdUMDc6MjI6MTVaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE3VDA3OjIyOjE1WiI7fXM6NzoibWVzc2FnZSI7czoxMToiQWRkIGluZGV4ZXMiO3M6NDoidHJlZSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czozOiJzaGEiO3M6NDA6IjRjZTM2NDFjNjdlMTQ1NDNhYjg4YTQ1YWM3MjE4Y2Q4OTYzNjFlMzgiO3M6MzoidXJsIjtzOjEwNjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9naXQvdHJlZXMvNGNlMzY0MWM2N2UxNDU0M2FiODhhNDVhYzcyMThjZDg5NjM2MWUzOCI7fXM6MzoidXJsIjtzOjEwODoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9naXQvY29tbWl0cy8yNWFiNmMxYWU2NzVmMzEyNDY1YzI0YTYyNTU2NmQzYTViY2QzN2I4IjtzOjEzOiJjb21tZW50X2NvdW50IjtpOjA7fXM6MzoidXJsIjtzOjEwNDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzI1YWI2YzFhZTY3NWYzMTI0NjVjMjRhNjI1NTY2ZDNhNWJjZDM3YjgiO3M6ODoiaHRtbF91cmwiO3M6OTM6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXQvMjVhYjZjMWFlNjc1ZjMxMjQ2NWMyNGE2MjU1NjZkM2E1YmNkMzdiOCI7czoxMjoiY29tbWVudHNfdXJsIjtzOjExMzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzI1YWI2YzFhZTY3NWYzMTI0NjVjMjRhNjI1NTY2ZDNhNWJjZDM3YjgvY29tbWVudHMiO3M6NjoiYXV0aG9yIjtPOjg6InN0ZENsYXNzIjoxNjp7czo1OiJsb2dpbiI7czoxMToiYmFic2dvc2dlbnMiO3M6MjoiaWQiO2k6MTI2ODE0MjtzOjEwOiJhdmF0YXJfdXJsIjtzOjEzOToiaHR0cHM6Ly8xLmdyYXZhdGFyLmNvbS9hdmF0YXIvYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjY/ZD1odHRwcyUzQSUyRiUyRmlkZW50aWNvbnMuZ2l0aHViLmNvbSUyRjUzODU1MTg0OGJlYjU4NmU3MjU1MzkxMzI5MDU2N2YzLnBuZyI7czoxMToiZ3JhdmF0YXJfaWQiO3M6MzI6ImIzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2IjtzOjM6InVybCI7czo0MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2VucyI7czo4OiJodG1sX3VybCI7czozMDoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zIjtzOjEzOiJmb2xsb3dlcnNfdXJsIjtzOjUwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2VycyI7czoxMzoiZm9sbG93aW5nX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IjtzOjk6Imdpc3RzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9naXN0c3svZ2lzdF9pZH0iO3M6MTE6InN0YXJyZWRfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N0YXJyZWR7L293bmVyfXsvcmVwb30iO3M6MTc6InN1YnNjcmlwdGlvbnNfdXJsIjtzOjU0OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N1YnNjcmlwdGlvbnMiO3M6MTc6Im9yZ2FuaXphdGlvbnNfdXJsIjtzOjQ1OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL29yZ3MiO3M6OToicmVwb3NfdXJsIjtzOjQ2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlcG9zIjtzOjEwOiJldmVudHNfdXJsIjtzOjU3OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2V2ZW50c3svcHJpdmFjeX0iO3M6MTk6InJlY2VpdmVkX2V2ZW50c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVjZWl2ZWRfZXZlbnRzIjtzOjQ6InR5cGUiO3M6NDoiVXNlciI7fXM6OToiY29tbWl0dGVyIjtPOjg6InN0ZENsYXNzIjoxNjp7czo1OiJsb2dpbiI7czoxMToiYmFic2dvc2dlbnMiO3M6MjoiaWQiO2k6MTI2ODE0MjtzOjEwOiJhdmF0YXJfdXJsIjtzOjEzOToiaHR0cHM6Ly8xLmdyYXZhdGFyLmNvbS9hdmF0YXIvYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjY/ZD1odHRwcyUzQSUyRiUyRmlkZW50aWNvbnMuZ2l0aHViLmNvbSUyRjUzODU1MTg0OGJlYjU4NmU3MjU1MzkxMzI5MDU2N2YzLnBuZyI7czoxMToiZ3JhdmF0YXJfaWQiO3M6MzI6ImIzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2IjtzOjM6InVybCI7czo0MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2VucyI7czo4OiJodG1sX3VybCI7czozMDoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zIjtzOjEzOiJmb2xsb3dlcnNfdXJsIjtzOjUwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2VycyI7czoxMzoiZm9sbG93aW5nX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IjtzOjk6Imdpc3RzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9naXN0c3svZ2lzdF9pZH0iO3M6MTE6InN0YXJyZWRfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N0YXJyZWR7L293bmVyfXsvcmVwb30iO3M6MTc6InN1YnNjcmlwdGlvbnNfdXJsIjtzOjU0OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N1YnNjcmlwdGlvbnMiO3M6MTc6Im9yZ2FuaXphdGlvbnNfdXJsIjtzOjQ1OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL29yZ3MiO3M6OToicmVwb3NfdXJsIjtzOjQ2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlcG9zIjtzOjEwOiJldmVudHNfdXJsIjtzOjU3OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2V2ZW50c3svcHJpdmFjeX0iO3M6MTk6InJlY2VpdmVkX2V2ZW50c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVjZWl2ZWRfZXZlbnRzIjtzOjQ6InR5cGUiO3M6NDoiVXNlciI7fXM6NzoicGFyZW50cyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czozOiJzaGEiO3M6NDA6IjhhZjc3ZjY2OTYxMTY2MjlmMTEzOWMzODUwOTAxZDJlNGMzMTg2ZDMiO3M6MzoidXJsIjtzOjEwNDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzhhZjc3ZjY2OTYxMTY2MjlmMTEzOWMzODUwOTAxZDJlNGMzMTg2ZDMiO3M6ODoiaHRtbF91cmwiO3M6OTM6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXQvOGFmNzdmNjY5NjExNjYyOWYxMTM5YzM4NTA5MDFkMmU0YzMxODZkMyI7fX19', '', 'https://github.com/babsgosgens/crossinghippos/commit/25ab6c1ae675f312465c24a625566d3a5bcd37b8', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 3, '3fb22231888dfbc8ff967d73b14596cf554ac4f5', '2013-09-16 12:02:54', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6IjNmYjIyMjMxODg4ZGZiYzhmZjk2N2Q3M2IxNDU5NmNmNTU0YWM0ZjUiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTZUMTI6MDI6NTRaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE2VDEyOjAyOjU0WiI7fXM6NzoibWVzc2FnZSI7czoyMjoiQWRkIHBvaW50ZXJzIGZvciBKZWxsZSI7czo0OiJ0cmVlIjtPOjg6InN0ZENsYXNzIjoyOntzOjM6InNoYSI7czo0MDoiMmM4MDZhZjdmMTVjOGU2YTEwM2I2NGNiNTc2YjJlN2JiOTI1ZGRkOSI7czozOiJ1cmwiO3M6MTA2OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC90cmVlcy8yYzgwNmFmN2YxNWM4ZTZhMTAzYjY0Y2I1NzZiMmU3YmI5MjVkZGQ5Ijt9czozOiJ1cmwiO3M6MTA4OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC9jb21taXRzLzNmYjIyMjMxODg4ZGZiYzhmZjk2N2Q3M2IxNDU5NmNmNTU0YWM0ZjUiO3M6MTM6ImNvbW1lbnRfY291bnQiO2k6MDt9czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvM2ZiMjIyMzE4ODhkZmJjOGZmOTY3ZDczYjE0NTk2Y2Y1NTRhYzRmNSI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC8zZmIyMjIzMTg4OGRmYmM4ZmY5NjdkNzNiMTQ1OTZjZjU1NGFjNGY1IjtzOjEyOiJjb21tZW50c191cmwiO3M6MTEzOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvM2ZiMjIyMzE4ODhkZmJjOGZmOTY3ZDczYjE0NTk2Y2Y1NTRhYzRmNS9jb21tZW50cyI7czo2OiJhdXRob3IiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo3OiJwYXJlbnRzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjozOntzOjM6InNoYSI7czo0MDoiOGJiZjQyZjFkMWU0YmQzN2Q4YjBiYmY2OWU2NTlmNjYyN2JjZWI4MiI7czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvOGJiZjQyZjFkMWU0YmQzN2Q4YjBiYmY2OWU2NTlmNjYyN2JjZWI4MiI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC84YmJmNDJmMWQxZTRiZDM3ZDhiMGJiZjY5ZTY1OWY2NjI3YmNlYjgyIjt9fX0=', '', 'https://github.com/babsgosgens/crossinghippos/commit/3fb22231888dfbc8ff967d73b14596cf554ac4f5', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 3, '43f26da24ce322458f37ffc5a2ca66f06d891726', '2013-09-16 19:02:10', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6IjQzZjI2ZGEyNGNlMzIyNDU4ZjM3ZmZjNWEyY2E2NmYwNmQ4OTE3MjYiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTZUMTk6MDI6MTBaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE2VDE5OjAyOjEwWiI7fXM6NzoibWVzc2FnZSI7czo1OiJUd2VhayI7czo0OiJ0cmVlIjtPOjg6InN0ZENsYXNzIjoyOntzOjM6InNoYSI7czo0MDoiYWQzM2QxNjhiNWM1M2MwOGZlMzhkOTZiMWVlZTNkMDU3MmI5NmJhMSI7czozOiJ1cmwiO3M6MTA2OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC90cmVlcy9hZDMzZDE2OGI1YzUzYzA4ZmUzOGQ5NmIxZWVlM2QwNTcyYjk2YmExIjt9czozOiJ1cmwiO3M6MTA4OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC9jb21taXRzLzQzZjI2ZGEyNGNlMzIyNDU4ZjM3ZmZjNWEyY2E2NmYwNmQ4OTE3MjYiO3M6MTM6ImNvbW1lbnRfY291bnQiO2k6MDt9czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvNDNmMjZkYTI0Y2UzMjI0NThmMzdmZmM1YTJjYTY2ZjA2ZDg5MTcyNiI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC80M2YyNmRhMjRjZTMyMjQ1OGYzN2ZmYzVhMmNhNjZmMDZkODkxNzI2IjtzOjEyOiJjb21tZW50c191cmwiO3M6MTEzOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvNDNmMjZkYTI0Y2UzMjI0NThmMzdmZmM1YTJjYTY2ZjA2ZDg5MTcyNi9jb21tZW50cyI7czo2OiJhdXRob3IiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo3OiJwYXJlbnRzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjozOntzOjM6InNoYSI7czo0MDoiNzQyYTJmNDViMGE3OGU5MjMyOTJkMDY2NzMwMDBkMDUxZDljOGE1NiI7czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvNzQyYTJmNDViMGE3OGU5MjMyOTJkMDY2NzMwMDBkMDUxZDljOGE1NiI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC83NDJhMmY0NWIwYTc4ZTkyMzI5MmQwNjY3MzAwMGQwNTFkOWM4YTU2Ijt9fX0=', '', 'https://github.com/babsgosgens/crossinghippos/commit/43f26da24ce322458f37ffc5a2ca66f06d891726', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 3, '4e5833096df0215c9ac9e332757596881dd27ac4', '2013-09-17 17:20:15', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6IjRlNTgzMzA5NmRmMDIxNWM5YWM5ZTMzMjc1NzU5Njg4MWRkMjdhYzQiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTdUMTc6MjA6MTVaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE3VDE3OjIwOjE1WiI7fXM6NzoibWVzc2FnZSI7czozODoiQWRkIGNvbHVtbiBvcmRlcmluZy4gQWRkIHN0YXRlIHRvZ2dsZS4iO3M6NDoidHJlZSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czozOiJzaGEiO3M6NDA6ImFkMDU5MmFjM2VkODI1MjFiMzc1ZmUxMDYzYTE1NjUyMjVmNDMxYTciO3M6MzoidXJsIjtzOjEwNjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9naXQvdHJlZXMvYWQwNTkyYWMzZWQ4MjUyMWIzNzVmZTEwNjNhMTU2NTIyNWY0MzFhNyI7fXM6MzoidXJsIjtzOjEwODoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9naXQvY29tbWl0cy80ZTU4MzMwOTZkZjAyMTVjOWFjOWUzMzI3NTc1OTY4ODFkZDI3YWM0IjtzOjEzOiJjb21tZW50X2NvdW50IjtpOjA7fXM6MzoidXJsIjtzOjEwNDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzRlNTgzMzA5NmRmMDIxNWM5YWM5ZTMzMjc1NzU5Njg4MWRkMjdhYzQiO3M6ODoiaHRtbF91cmwiO3M6OTM6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXQvNGU1ODMzMDk2ZGYwMjE1YzlhYzllMzMyNzU3NTk2ODgxZGQyN2FjNCI7czoxMjoiY29tbWVudHNfdXJsIjtzOjExMzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzRlNTgzMzA5NmRmMDIxNWM5YWM5ZTMzMjc1NzU5Njg4MWRkMjdhYzQvY29tbWVudHMiO3M6NjoiYXV0aG9yIjtPOjg6InN0ZENsYXNzIjoxNjp7czo1OiJsb2dpbiI7czoxMToiYmFic2dvc2dlbnMiO3M6MjoiaWQiO2k6MTI2ODE0MjtzOjEwOiJhdmF0YXJfdXJsIjtzOjEzOToiaHR0cHM6Ly8xLmdyYXZhdGFyLmNvbS9hdmF0YXIvYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjY/ZD1odHRwcyUzQSUyRiUyRmlkZW50aWNvbnMuZ2l0aHViLmNvbSUyRjUzODU1MTg0OGJlYjU4NmU3MjU1MzkxMzI5MDU2N2YzLnBuZyI7czoxMToiZ3JhdmF0YXJfaWQiO3M6MzI6ImIzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2IjtzOjM6InVybCI7czo0MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2VucyI7czo4OiJodG1sX3VybCI7czozMDoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zIjtzOjEzOiJmb2xsb3dlcnNfdXJsIjtzOjUwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2VycyI7czoxMzoiZm9sbG93aW5nX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IjtzOjk6Imdpc3RzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9naXN0c3svZ2lzdF9pZH0iO3M6MTE6InN0YXJyZWRfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N0YXJyZWR7L293bmVyfXsvcmVwb30iO3M6MTc6InN1YnNjcmlwdGlvbnNfdXJsIjtzOjU0OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N1YnNjcmlwdGlvbnMiO3M6MTc6Im9yZ2FuaXphdGlvbnNfdXJsIjtzOjQ1OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL29yZ3MiO3M6OToicmVwb3NfdXJsIjtzOjQ2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlcG9zIjtzOjEwOiJldmVudHNfdXJsIjtzOjU3OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2V2ZW50c3svcHJpdmFjeX0iO3M6MTk6InJlY2VpdmVkX2V2ZW50c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVjZWl2ZWRfZXZlbnRzIjtzOjQ6InR5cGUiO3M6NDoiVXNlciI7fXM6OToiY29tbWl0dGVyIjtPOjg6InN0ZENsYXNzIjoxNjp7czo1OiJsb2dpbiI7czoxMToiYmFic2dvc2dlbnMiO3M6MjoiaWQiO2k6MTI2ODE0MjtzOjEwOiJhdmF0YXJfdXJsIjtzOjEzOToiaHR0cHM6Ly8xLmdyYXZhdGFyLmNvbS9hdmF0YXIvYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjY/ZD1odHRwcyUzQSUyRiUyRmlkZW50aWNvbnMuZ2l0aHViLmNvbSUyRjUzODU1MTg0OGJlYjU4NmU3MjU1MzkxMzI5MDU2N2YzLnBuZyI7czoxMToiZ3JhdmF0YXJfaWQiO3M6MzI6ImIzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2IjtzOjM6InVybCI7czo0MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2VucyI7czo4OiJodG1sX3VybCI7czozMDoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zIjtzOjEzOiJmb2xsb3dlcnNfdXJsIjtzOjUwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2VycyI7czoxMzoiZm9sbG93aW5nX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IjtzOjk6Imdpc3RzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9naXN0c3svZ2lzdF9pZH0iO3M6MTE6InN0YXJyZWRfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N0YXJyZWR7L293bmVyfXsvcmVwb30iO3M6MTc6InN1YnNjcmlwdGlvbnNfdXJsIjtzOjU0OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N1YnNjcmlwdGlvbnMiO3M6MTc6Im9yZ2FuaXphdGlvbnNfdXJsIjtzOjQ1OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL29yZ3MiO3M6OToicmVwb3NfdXJsIjtzOjQ2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlcG9zIjtzOjEwOiJldmVudHNfdXJsIjtzOjU3OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2V2ZW50c3svcHJpdmFjeX0iO3M6MTk6InJlY2VpdmVkX2V2ZW50c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVjZWl2ZWRfZXZlbnRzIjtzOjQ6InR5cGUiO3M6NDoiVXNlciI7fXM6NzoicGFyZW50cyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czozOiJzaGEiO3M6NDA6IjEzOTIzODQzOTYxMWQwOTM5ZDNmMzQxZmViOWYwMWFhMDU1YmZmNjIiO3M6MzoidXJsIjtzOjEwNDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzEzOTIzODQzOTYxMWQwOTM5ZDNmMzQxZmViOWYwMWFhMDU1YmZmNjIiO3M6ODoiaHRtbF91cmwiO3M6OTM6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXQvMTM5MjM4NDM5NjExZDA5MzlkM2YzNDFmZWI5ZjAxYWEwNTViZmY2MiI7fX19', '', 'https://github.com/babsgosgens/crossinghippos/commit/4e5833096df0215c9ac9e332757596881dd27ac4', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 3, '5b2b2ef1d8aad69d9b205ba0d98414a2d40ff274', '2013-09-16 12:16:43', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6IjViMmIyZWYxZDhhYWQ2OWQ5YjIwNWJhMGQ5ODQxNGEyZDQwZmYyNzQiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjEzOiJKZWFuIEJyb3V3ZXJzIjtzOjU6ImVtYWlsIjtzOjI0OiJqZWFuYnJvdXdlcnNAb3V0bG9vay5jb20iO3M6NDoiZGF0ZSI7czoyMDoiMjAxMy0wOS0xNlQxMjoxNjo0M1oiO31zOjk6ImNvbW1pdHRlciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjEzOiJKZWFuIEJyb3V3ZXJzIjtzOjU6ImVtYWlsIjtzOjI0OiJqZWFuYnJvdXdlcnNAb3V0bG9vay5jb20iO3M6NDoiZGF0ZSI7czoyMDoiMjAxMy0wOS0xNlQxMjoxNjo0M1oiO31zOjc6Im1lc3NhZ2UiO3M6NjI6Ik1lcmdlIGJyYW5jaCAnbWFzdGVyJyBvZiBnaXRodWIuY29tOmJhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zIjtzOjQ6InRyZWUiO086ODoic3RkQ2xhc3MiOjI6e3M6Mzoic2hhIjtzOjQwOiJhN2VhZmRhNmM4NmExNTJhMTc5OTQ0NDBhYzJhNGU1N2QzODYzMGQ5IjtzOjM6InVybCI7czoxMDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L3RyZWVzL2E3ZWFmZGE2Yzg2YTE1MmExNzk5NDQ0MGFjMmE0ZTU3ZDM4NjMwZDkiO31zOjM6InVybCI7czoxMDg6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L2NvbW1pdHMvNWIyYjJlZjFkOGFhZDY5ZDliMjA1YmEwZDk4NDE0YTJkNDBmZjI3NCI7czoxMzoiY29tbWVudF9jb3VudCI7aTowO31zOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy81YjJiMmVmMWQ4YWFkNjlkOWIyMDViYTBkOTg0MTRhMmQ0MGZmMjc0IjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0LzViMmIyZWYxZDhhYWQ2OWQ5YjIwNWJhMGQ5ODQxNGEyZDQwZmYyNzQiO3M6MTI6ImNvbW1lbnRzX3VybCI7czoxMTM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy81YjJiMmVmMWQ4YWFkNjlkOWIyMDViYTBkOTg0MTRhMmQ0MGZmMjc0L2NvbW1lbnRzIjtzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6NzoiamVhbnRqZSI7czoyOiJpZCI7aTo1Mzc5ODc5O3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzAuZ3JhdmF0YXIuY29tL2F2YXRhci8xYWUyYWVhYmViYjcyZjYzNTUyZDdlY2U0M2E1NzNkMj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGN2IxNTZiMTNhMjU1N2VhYjAxOGM3ODAyNzA4NGU5NDYucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiMWFlMmFlYWJlYmI3MmY2MzU1MmQ3ZWNlNDNhNTczZDIiO3M6MzoidXJsIjtzOjM2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2plYW50amUiO3M6ODoiaHRtbF91cmwiO3M6MjY6Imh0dHBzOi8vZ2l0aHViLmNvbS9qZWFudGplIjtzOjEzOiJmb2xsb3dlcnNfdXJsIjtzOjQ2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2plYW50amUvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjU5OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2plYW50amUvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvamVhbnRqZS9naXN0c3svZ2lzdF9pZH0iO3M6MTE6InN0YXJyZWRfdXJsIjtzOjU5OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2plYW50amUvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvamVhbnRqZS9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0MToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9qZWFudGplL29yZ3MiO3M6OToicmVwb3NfdXJsIjtzOjQyOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2plYW50amUvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvamVhbnRqZS9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjUyOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2plYW50amUvcmVjZWl2ZWRfZXZlbnRzIjtzOjQ6InR5cGUiO3M6NDoiVXNlciI7fXM6OToiY29tbWl0dGVyIjtPOjg6InN0ZENsYXNzIjoxNjp7czo1OiJsb2dpbiI7czo3OiJqZWFudGplIjtzOjI6ImlkIjtpOjUzNzk4Nzk7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMC5ncmF2YXRhci5jb20vYXZhdGFyLzFhZTJhZWFiZWJiNzJmNjM1NTJkN2VjZTQzYTU3M2QyP2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY3YjE1NmIxM2EyNTU3ZWFiMDE4Yzc4MDI3MDg0ZTk0Ni5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiIxYWUyYWVhYmViYjcyZjYzNTUyZDdlY2U0M2E1NzNkMiI7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvamVhbnRqZSI7czo4OiJodG1sX3VybCI7czoyNjoiaHR0cHM6Ly9naXRodWIuY29tL2plYW50amUiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvamVhbnRqZS9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NTk6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvamVhbnRqZS9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IjtzOjk6Imdpc3RzX3VybCI7czo1MjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9qZWFudGplL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NTk6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvamVhbnRqZS9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9qZWFudGplL3N1YnNjcmlwdGlvbnMiO3M6MTc6Im9yZ2FuaXphdGlvbnNfdXJsIjtzOjQxOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2plYW50amUvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvamVhbnRqZS9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9qZWFudGplL2V2ZW50c3svcHJpdmFjeX0iO3M6MTk6InJlY2VpdmVkX2V2ZW50c191cmwiO3M6NTI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvamVhbnRqZS9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo3OiJwYXJlbnRzIjthOjI6e2k6MDtPOjg6InN0ZENsYXNzIjozOntzOjM6InNoYSI7czo0MDoiNTc2YzA4MWE1MTMxZTQwMmQ2YzJiNWRkNmE2NThlNDk0MjUwZGU1YyI7czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvNTc2YzA4MWE1MTMxZTQwMmQ2YzJiNWRkNmE2NThlNDk0MjUwZGU1YyI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC81NzZjMDgxYTUxMzFlNDAyZDZjMmI1ZGQ2YTY1OGU0OTQyNTBkZTVjIjt9aToxO086ODoic3RkQ2xhc3MiOjM6e3M6Mzoic2hhIjtzOjQwOiI5YzczMGRkMGNkZThmNzUxYWQ1MzZiYTM2NjEzYTA3NWEyOWRmZTQyIjtzOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy85YzczMGRkMGNkZThmNzUxYWQ1MzZiYTM2NjEzYTA3NWEyOWRmZTQyIjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0LzljNzMwZGQwY2RlOGY3NTFhZDUzNmJhMzY2MTNhMDc1YTI5ZGZlNDIiO319fQ==', '', 'https://github.com/babsgosgens/crossinghippos/commit/5b2b2ef1d8aad69d9b205ba0d98414a2d40ff274', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 3, '5cb497c8491d39010f4e0c0c43d6160df60ce028', '2013-09-17 09:49:34', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6IjVjYjQ5N2M4NDkxZDM5MDEwZjRlMGMwYzQzZDYxNjBkZjYwY2UwMjgiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTdUMDk6NDk6MzRaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE3VDA5OjQ5OjM0WiI7fXM6NzoibWVzc2FnZSI7czoyNToiRGF0YWJhc2UgZHVtcCBmb3IgSmVhbnRqZSI7czo0OiJ0cmVlIjtPOjg6InN0ZENsYXNzIjoyOntzOjM6InNoYSI7czo0MDoiMmE5MmQ3YTllNjlmNGNjYTZkMzc1ZjhjODdiZDVjYTIyYTZhMGQ0YiI7czozOiJ1cmwiO3M6MTA2OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC90cmVlcy8yYTkyZDdhOWU2OWY0Y2NhNmQzNzVmOGM4N2JkNWNhMjJhNmEwZDRiIjt9czozOiJ1cmwiO3M6MTA4OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC9jb21taXRzLzVjYjQ5N2M4NDkxZDM5MDEwZjRlMGMwYzQzZDYxNjBkZjYwY2UwMjgiO3M6MTM6ImNvbW1lbnRfY291bnQiO2k6MDt9czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvNWNiNDk3Yzg0OTFkMzkwMTBmNGUwYzBjNDNkNjE2MGRmNjBjZTAyOCI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC81Y2I0OTdjODQ5MWQzOTAxMGY0ZTBjMGM0M2Q2MTYwZGY2MGNlMDI4IjtzOjEyOiJjb21tZW50c191cmwiO3M6MTEzOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvNWNiNDk3Yzg0OTFkMzkwMTBmNGUwYzBjNDNkNjE2MGRmNjBjZTAyOC9jb21tZW50cyI7czo2OiJhdXRob3IiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo3OiJwYXJlbnRzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjozOntzOjM6InNoYSI7czo0MDoiZmEyNWI2OGFmNWQyYmUzMGFiOGQ3YWUzYjBiNjFiOTEyM2E1NzY4MSI7czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvZmEyNWI2OGFmNWQyYmUzMGFiOGQ3YWUzYjBiNjFiOTEyM2E1NzY4MSI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC9mYTI1YjY4YWY1ZDJiZTMwYWI4ZDdhZTNiMGI2MWI5MTIzYTU3NjgxIjt9fX0=', '', 'https://github.com/babsgosgens/crossinghippos/commit/5cb497c8491d39010f4e0c0c43d6160df60ce028', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 3, '66a1d8cfbb6f4117c5fdf13eaae51ed08b382ee2', '2013-09-16 12:25:00', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6IjY2YTFkOGNmYmI2ZjQxMTdjNWZkZjEzZWFhZTUxZWQwOGIzODJlZTIiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjEzOiJKZWFuIEJyb3V3ZXJzIjtzOjU6ImVtYWlsIjtzOjI0OiJqZWFuYnJvdXdlcnNAb3V0bG9vay5jb20iO3M6NDoiZGF0ZSI7czoyMDoiMjAxMy0wOS0xNlQxMjoyNTowMFoiO31zOjk6ImNvbW1pdHRlciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjEzOiJKZWFuIEJyb3V3ZXJzIjtzOjU6ImVtYWlsIjtzOjI0OiJqZWFuYnJvdXdlcnNAb3V0bG9vay5jb20iO3M6NDoiZGF0ZSI7czoyMDoiMjAxMy0wOS0xNlQxMjoyNTowMFoiO31zOjc6Im1lc3NhZ2UiO3M6MzA6IkZpbmlzaGVkIGZhY2Vib29rIHN0cmVhbSBtb2RlbCI7czo0OiJ0cmVlIjtPOjg6InN0ZENsYXNzIjoyOntzOjM6InNoYSI7czo0MDoiZmM2YmRjMDRkZDU3ZjAwODEzYmE1NGRiYzZkZmY1NDJiNGJhY2YwOSI7czozOiJ1cmwiO3M6MTA2OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC90cmVlcy9mYzZiZGMwNGRkNTdmMDA4MTNiYTU0ZGJjNmRmZjU0MmI0YmFjZjA5Ijt9czozOiJ1cmwiO3M6MTA4OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC9jb21taXRzLzY2YTFkOGNmYmI2ZjQxMTdjNWZkZjEzZWFhZTUxZWQwOGIzODJlZTIiO3M6MTM6ImNvbW1lbnRfY291bnQiO2k6MDt9czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvNjZhMWQ4Y2ZiYjZmNDExN2M1ZmRmMTNlYWFlNTFlZDA4YjM4MmVlMiI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC82NmExZDhjZmJiNmY0MTE3YzVmZGYxM2VhYWU1MWVkMDhiMzgyZWUyIjtzOjEyOiJjb21tZW50c191cmwiO3M6MTEzOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvNjZhMWQ4Y2ZiYjZmNDExN2M1ZmRmMTNlYWFlNTFlZDA4YjM4MmVlMi9jb21tZW50cyI7czo2OiJhdXRob3IiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjc6ImplYW50amUiO3M6MjoiaWQiO2k6NTM3OTg3OTtzOjEwOiJhdmF0YXJfdXJsIjtzOjEzOToiaHR0cHM6Ly8wLmdyYXZhdGFyLmNvbS9hdmF0YXIvMWFlMmFlYWJlYmI3MmY2MzU1MmQ3ZWNlNDNhNTczZDI/ZD1odHRwcyUzQSUyRiUyRmlkZW50aWNvbnMuZ2l0aHViLmNvbSUyRjdiMTU2YjEzYTI1NTdlYWIwMThjNzgwMjcwODRlOTQ2LnBuZyI7czoxMToiZ3JhdmF0YXJfaWQiO3M6MzI6IjFhZTJhZWFiZWJiNzJmNjM1NTJkN2VjZTQzYTU3M2QyIjtzOjM6InVybCI7czozNjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9qZWFudGplIjtzOjg6Imh0bWxfdXJsIjtzOjI2OiJodHRwczovL2dpdGh1Yi5jb20vamVhbnRqZSI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9qZWFudGplL2ZvbGxvd2VycyI7czoxMzoiZm9sbG93aW5nX3VybCI7czo1OToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9qZWFudGplL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjUyOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2plYW50amUvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo1OToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9qZWFudGplL3N0YXJyZWR7L293bmVyfXsvcmVwb30iO3M6MTc6InN1YnNjcmlwdGlvbnNfdXJsIjtzOjUwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2plYW50amUvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDE6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvamVhbnRqZS9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0MjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9qZWFudGplL3JlcG9zIjtzOjEwOiJldmVudHNfdXJsIjtzOjUzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2plYW50amUvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1MjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9qZWFudGplL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjk6ImNvbW1pdHRlciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6NzoiamVhbnRqZSI7czoyOiJpZCI7aTo1Mzc5ODc5O3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzAuZ3JhdmF0YXIuY29tL2F2YXRhci8xYWUyYWVhYmViYjcyZjYzNTUyZDdlY2U0M2E1NzNkMj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGN2IxNTZiMTNhMjU1N2VhYjAxOGM3ODAyNzA4NGU5NDYucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiMWFlMmFlYWJlYmI3MmY2MzU1MmQ3ZWNlNDNhNTczZDIiO3M6MzoidXJsIjtzOjM2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2plYW50amUiO3M6ODoiaHRtbF91cmwiO3M6MjY6Imh0dHBzOi8vZ2l0aHViLmNvbS9qZWFudGplIjtzOjEzOiJmb2xsb3dlcnNfdXJsIjtzOjQ2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2plYW50amUvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjU5OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2plYW50amUvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTI6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvamVhbnRqZS9naXN0c3svZ2lzdF9pZH0iO3M6MTE6InN0YXJyZWRfdXJsIjtzOjU5OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2plYW50amUvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvamVhbnRqZS9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0MToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9qZWFudGplL29yZ3MiO3M6OToicmVwb3NfdXJsIjtzOjQyOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2plYW50amUvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvamVhbnRqZS9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjUyOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2plYW50amUvcmVjZWl2ZWRfZXZlbnRzIjtzOjQ6InR5cGUiO3M6NDoiVXNlciI7fXM6NzoicGFyZW50cyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czozOiJzaGEiO3M6NDA6IjViMmIyZWYxZDhhYWQ2OWQ5YjIwNWJhMGQ5ODQxNGEyZDQwZmYyNzQiO3M6MzoidXJsIjtzOjEwNDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzViMmIyZWYxZDhhYWQ2OWQ5YjIwNWJhMGQ5ODQxNGEyZDQwZmYyNzQiO3M6ODoiaHRtbF91cmwiO3M6OTM6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXQvNWIyYjJlZjFkOGFhZDY5ZDliMjA1YmEwZDk4NDE0YTJkNDBmZjI3NCI7fX19', '', 'https://github.com/babsgosgens/crossinghippos/commit/66a1d8cfbb6f4117c5fdf13eaae51ed08b382ee2', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `flock_streams` (`id`, `api_id`, `post_id`, `date_created`, `raw`, `metadata`, `permalink`, `params`, `language`, `state`, `publish_up`, `publish_down`) VALUES
(53, 3, '742a2f45b0a78e923292d06673000d051d9c8a56', '2013-09-16 18:47:45', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6Ijc0MmEyZjQ1YjBhNzhlOTIzMjkyZDA2NjczMDAwZDA1MWQ5YzhhNTYiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTZUMTg6NDc6NDVaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE2VDE4OjQ3OjQ1WiI7fXM6NzoibWVzc2FnZSI7czoyNzoiVXNlIEpvb21sYSBGYWNlYm9vayBMaWJyYXJ5IjtzOjQ6InRyZWUiO086ODoic3RkQ2xhc3MiOjI6e3M6Mzoic2hhIjtzOjQwOiJhMWZlYzVlNTJmZTY4N2MwNGZkMmQxZGYyZTNjYmJhOTViYmYzZjhkIjtzOjM6InVybCI7czoxMDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L3RyZWVzL2ExZmVjNWU1MmZlNjg3YzA0ZmQyZDFkZjJlM2NiYmE5NWJiZjNmOGQiO31zOjM6InVybCI7czoxMDg6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L2NvbW1pdHMvNzQyYTJmNDViMGE3OGU5MjMyOTJkMDY2NzMwMDBkMDUxZDljOGE1NiI7czoxMzoiY29tbWVudF9jb3VudCI7aTowO31zOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy83NDJhMmY0NWIwYTc4ZTkyMzI5MmQwNjY3MzAwMGQwNTFkOWM4YTU2IjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0Lzc0MmEyZjQ1YjBhNzhlOTIzMjkyZDA2NjczMDAwZDA1MWQ5YzhhNTYiO3M6MTI6ImNvbW1lbnRzX3VybCI7czoxMTM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy83NDJhMmY0NWIwYTc4ZTkyMzI5MmQwNjY3MzAwMGQwNTFkOWM4YTU2L2NvbW1lbnRzIjtzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjk6ImNvbW1pdHRlciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjc6InBhcmVudHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjM6e3M6Mzoic2hhIjtzOjQwOiJhYWY3MGY3ZGM4MWJiZjZiMGViYzQzMjQwODBjNTI4ZjhkYWMyNGM0IjtzOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9hYWY3MGY3ZGM4MWJiZjZiMGViYzQzMjQwODBjNTI4ZjhkYWMyNGM0IjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0L2FhZjcwZjdkYzgxYmJmNmIwZWJjNDMyNDA4MGM1MjhmOGRhYzI0YzQiO319fQ==', '', 'https://github.com/babsgosgens/crossinghippos/commit/742a2f45b0a78e923292d06673000d051d9c8a56', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 3, '7fbd81e82224713a1a5f4a799de1fcd5bd1ec2aa', '2013-09-17 12:25:29', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6IjdmYmQ4MWU4MjIyNDcxM2ExYTVmNGE3OTlkZTFmY2Q1YmQxZWMyYWEiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTdUMTI6MjU6MjlaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE3VDEyOjI1OjI5WiI7fXM6NzoibWVzc2FnZSI7czoxNzoiTmV3IGRhdGFiYXNlIGR1bXAiO3M6NDoidHJlZSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czozOiJzaGEiO3M6NDA6IjJhODQwYzEwNzk5OThlYTRjMmIxZmY4NGUxNmVlNmIzMjBhMDg4NGEiO3M6MzoidXJsIjtzOjEwNjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9naXQvdHJlZXMvMmE4NDBjMTA3OTk5OGVhNGMyYjFmZjg0ZTE2ZWU2YjMyMGEwODg0YSI7fXM6MzoidXJsIjtzOjEwODoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9naXQvY29tbWl0cy83ZmJkODFlODIyMjQ3MTNhMWE1ZjRhNzk5ZGUxZmNkNWJkMWVjMmFhIjtzOjEzOiJjb21tZW50X2NvdW50IjtpOjA7fXM6MzoidXJsIjtzOjEwNDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzdmYmQ4MWU4MjIyNDcxM2ExYTVmNGE3OTlkZTFmY2Q1YmQxZWMyYWEiO3M6ODoiaHRtbF91cmwiO3M6OTM6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXQvN2ZiZDgxZTgyMjI0NzEzYTFhNWY0YTc5OWRlMWZjZDViZDFlYzJhYSI7czoxMjoiY29tbWVudHNfdXJsIjtzOjExMzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzdmYmQ4MWU4MjIyNDcxM2ExYTVmNGE3OTlkZTFmY2Q1YmQxZWMyYWEvY29tbWVudHMiO3M6NjoiYXV0aG9yIjtPOjg6InN0ZENsYXNzIjoxNjp7czo1OiJsb2dpbiI7czoxMToiYmFic2dvc2dlbnMiO3M6MjoiaWQiO2k6MTI2ODE0MjtzOjEwOiJhdmF0YXJfdXJsIjtzOjEzOToiaHR0cHM6Ly8xLmdyYXZhdGFyLmNvbS9hdmF0YXIvYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjY/ZD1odHRwcyUzQSUyRiUyRmlkZW50aWNvbnMuZ2l0aHViLmNvbSUyRjUzODU1MTg0OGJlYjU4NmU3MjU1MzkxMzI5MDU2N2YzLnBuZyI7czoxMToiZ3JhdmF0YXJfaWQiO3M6MzI6ImIzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2IjtzOjM6InVybCI7czo0MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2VucyI7czo4OiJodG1sX3VybCI7czozMDoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zIjtzOjEzOiJmb2xsb3dlcnNfdXJsIjtzOjUwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2VycyI7czoxMzoiZm9sbG93aW5nX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IjtzOjk6Imdpc3RzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9naXN0c3svZ2lzdF9pZH0iO3M6MTE6InN0YXJyZWRfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N0YXJyZWR7L293bmVyfXsvcmVwb30iO3M6MTc6InN1YnNjcmlwdGlvbnNfdXJsIjtzOjU0OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N1YnNjcmlwdGlvbnMiO3M6MTc6Im9yZ2FuaXphdGlvbnNfdXJsIjtzOjQ1OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL29yZ3MiO3M6OToicmVwb3NfdXJsIjtzOjQ2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlcG9zIjtzOjEwOiJldmVudHNfdXJsIjtzOjU3OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2V2ZW50c3svcHJpdmFjeX0iO3M6MTk6InJlY2VpdmVkX2V2ZW50c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVjZWl2ZWRfZXZlbnRzIjtzOjQ6InR5cGUiO3M6NDoiVXNlciI7fXM6OToiY29tbWl0dGVyIjtPOjg6InN0ZENsYXNzIjoxNjp7czo1OiJsb2dpbiI7czoxMToiYmFic2dvc2dlbnMiO3M6MjoiaWQiO2k6MTI2ODE0MjtzOjEwOiJhdmF0YXJfdXJsIjtzOjEzOToiaHR0cHM6Ly8xLmdyYXZhdGFyLmNvbS9hdmF0YXIvYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjY/ZD1odHRwcyUzQSUyRiUyRmlkZW50aWNvbnMuZ2l0aHViLmNvbSUyRjUzODU1MTg0OGJlYjU4NmU3MjU1MzkxMzI5MDU2N2YzLnBuZyI7czoxMToiZ3JhdmF0YXJfaWQiO3M6MzI6ImIzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2IjtzOjM6InVybCI7czo0MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2VucyI7czo4OiJodG1sX3VybCI7czozMDoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zIjtzOjEzOiJmb2xsb3dlcnNfdXJsIjtzOjUwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2VycyI7czoxMzoiZm9sbG93aW5nX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IjtzOjk6Imdpc3RzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9naXN0c3svZ2lzdF9pZH0iO3M6MTE6InN0YXJyZWRfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N0YXJyZWR7L293bmVyfXsvcmVwb30iO3M6MTc6InN1YnNjcmlwdGlvbnNfdXJsIjtzOjU0OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N1YnNjcmlwdGlvbnMiO3M6MTc6Im9yZ2FuaXphdGlvbnNfdXJsIjtzOjQ1OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL29yZ3MiO3M6OToicmVwb3NfdXJsIjtzOjQ2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlcG9zIjtzOjEwOiJldmVudHNfdXJsIjtzOjU3OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2V2ZW50c3svcHJpdmFjeX0iO3M6MTk6InJlY2VpdmVkX2V2ZW50c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVjZWl2ZWRfZXZlbnRzIjtzOjQ6InR5cGUiO3M6NDoiVXNlciI7fXM6NzoicGFyZW50cyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czozOiJzaGEiO3M6NDA6IjhiZDdiMzEyZGJlNmZjZDBmNjIxZWRjYjEwZDRkZTdiYzI2ZTM0NjciO3M6MzoidXJsIjtzOjEwNDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzhiZDdiMzEyZGJlNmZjZDBmNjIxZWRjYjEwZDRkZTdiYzI2ZTM0NjciO3M6ODoiaHRtbF91cmwiO3M6OTM6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXQvOGJkN2IzMTJkYmU2ZmNkMGY2MjFlZGNiMTBkNGRlN2JjMjZlMzQ2NyI7fX19', '', 'https://github.com/babsgosgens/crossinghippos/commit/7fbd81e82224713a1a5f4a799de1fcd5bd1ec2aa', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 3, '8af77f6696116629f1139c3850901d2e4c3186d3', '2013-09-17 07:19:56', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6IjhhZjc3ZjY2OTYxMTY2MjlmMTEzOWMzODUwOTAxZDJlNGMzMTg2ZDMiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTdUMDc6MTk6NTZaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE3VDA3OjE5OjU2WiI7fXM6NzoibWVzc2FnZSI7czo2NzoiQWRkIHRhYmxlIGZvciBhcGlzIC0gSW1wb3J0IGRiZHVtcHMvMjAxMzA5MTctZmxvY2tfc3RyZWFtc19hcGlzLnNxbCI7czo0OiJ0cmVlIjtPOjg6InN0ZENsYXNzIjoyOntzOjM6InNoYSI7czo0MDoiMzcyZjYxMDM4YTkzYjg5MGNiM2RiMDgyZjRkMzBhYTJmNGQ1NWNmYyI7czozOiJ1cmwiO3M6MTA2OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC90cmVlcy8zNzJmNjEwMzhhOTNiODkwY2IzZGIwODJmNGQzMGFhMmY0ZDU1Y2ZjIjt9czozOiJ1cmwiO3M6MTA4OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC9jb21taXRzLzhhZjc3ZjY2OTYxMTY2MjlmMTEzOWMzODUwOTAxZDJlNGMzMTg2ZDMiO3M6MTM6ImNvbW1lbnRfY291bnQiO2k6MDt9czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvOGFmNzdmNjY5NjExNjYyOWYxMTM5YzM4NTA5MDFkMmU0YzMxODZkMyI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC84YWY3N2Y2Njk2MTE2NjI5ZjExMzljMzg1MDkwMWQyZTRjMzE4NmQzIjtzOjEyOiJjb21tZW50c191cmwiO3M6MTEzOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvOGFmNzdmNjY5NjExNjYyOWYxMTM5YzM4NTA5MDFkMmU0YzMxODZkMy9jb21tZW50cyI7czo2OiJhdXRob3IiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo3OiJwYXJlbnRzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjozOntzOjM6InNoYSI7czo0MDoiYmMyZmIwYjNmZWM5N2EwMWM1YTViZDI0MGQ0OTVmZWYyNzRmMzZkNyI7czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvYmMyZmIwYjNmZWM5N2EwMWM1YTViZDI0MGQ0OTVmZWYyNzRmMzZkNyI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC9iYzJmYjBiM2ZlYzk3YTAxYzVhNWJkMjQwZDQ5NWZlZjI3NGYzNmQ3Ijt9fX0=', '', 'https://github.com/babsgosgens/crossinghippos/commit/8af77f6696116629f1139c3850901d2e4c3186d3', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 3, '8bbf42f1d1e4bd37d8b0bbf69e659f6627bceb82', '2013-09-16 11:58:18', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6IjhiYmY0MmYxZDFlNGJkMzdkOGIwYmJmNjllNjU5ZjY2MjdiY2ViODIiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTZUMTE6NTg6MThaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE2VDExOjU4OjE4WiI7fXM6NzoibWVzc2FnZSI7czozMToiRnJvbnQgYW5kIGJhY2tlbmQgc3RyZWFtcyB2aWV3cyI7czo0OiJ0cmVlIjtPOjg6InN0ZENsYXNzIjoyOntzOjM6InNoYSI7czo0MDoiYmY2OTg0NGRmNDIyMTJiMjc2NjBkYmQ1M2YzZTM2ZWY4OTYyNTYxYiI7czozOiJ1cmwiO3M6MTA2OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC90cmVlcy9iZjY5ODQ0ZGY0MjIxMmIyNzY2MGRiZDUzZjNlMzZlZjg5NjI1NjFiIjt9czozOiJ1cmwiO3M6MTA4OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC9jb21taXRzLzhiYmY0MmYxZDFlNGJkMzdkOGIwYmJmNjllNjU5ZjY2MjdiY2ViODIiO3M6MTM6ImNvbW1lbnRfY291bnQiO2k6MDt9czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvOGJiZjQyZjFkMWU0YmQzN2Q4YjBiYmY2OWU2NTlmNjYyN2JjZWI4MiI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC84YmJmNDJmMWQxZTRiZDM3ZDhiMGJiZjY5ZTY1OWY2NjI3YmNlYjgyIjtzOjEyOiJjb21tZW50c191cmwiO3M6MTEzOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvOGJiZjQyZjFkMWU0YmQzN2Q4YjBiYmY2OWU2NTlmNjYyN2JjZWI4Mi9jb21tZW50cyI7czo2OiJhdXRob3IiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo3OiJwYXJlbnRzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjozOntzOjM6InNoYSI7czo0MDoiY2E2NDNmMDI0ZDJkNGQyODFlMmNiYzU1Y2M0OTVlZTQ5Nzg3NjY5YiI7czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvY2E2NDNmMDI0ZDJkNGQyODFlMmNiYzU1Y2M0OTVlZTQ5Nzg3NjY5YiI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC9jYTY0M2YwMjRkMmQ0ZDI4MWUyY2JjNTVjYzQ5NWVlNDk3ODc2NjliIjt9fX0=', '', 'https://github.com/babsgosgens/crossinghippos/commit/8bbf42f1d1e4bd37d8b0bbf69e659f6627bceb82', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 3, '8bd7b312dbe6fcd0f621edcb10d4de7bc26e3467', '2013-09-17 12:24:04', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6IjhiZDdiMzEyZGJlNmZjZDBmNjIxZWRjYjEwZDRkZTdiYzI2ZTM0NjciO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTdUMTI6MjQ6MDRaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE3VDEyOjI0OjA0WiI7fXM6NzoibWVzc2FnZSI7czo0MDoiR2V0IHNldHRpbmdzIGZyb20gdGhlIHRhYmxlLiBBZGQgR2l0aHViLiI7czo0OiJ0cmVlIjtPOjg6InN0ZENsYXNzIjoyOntzOjM6InNoYSI7czo0MDoiYzkzMTM2N2MwOWI1MmMzODRmZTA5MGJmOGE3MDQ4MTY0NDA0ODg4YSI7czozOiJ1cmwiO3M6MTA2OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC90cmVlcy9jOTMxMzY3YzA5YjUyYzM4NGZlMDkwYmY4YTcwNDgxNjQ0MDQ4ODhhIjt9czozOiJ1cmwiO3M6MTA4OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC9jb21taXRzLzhiZDdiMzEyZGJlNmZjZDBmNjIxZWRjYjEwZDRkZTdiYzI2ZTM0NjciO3M6MTM6ImNvbW1lbnRfY291bnQiO2k6MDt9czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvOGJkN2IzMTJkYmU2ZmNkMGY2MjFlZGNiMTBkNGRlN2JjMjZlMzQ2NyI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC84YmQ3YjMxMmRiZTZmY2QwZjYyMWVkY2IxMGQ0ZGU3YmMyNmUzNDY3IjtzOjEyOiJjb21tZW50c191cmwiO3M6MTEzOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvOGJkN2IzMTJkYmU2ZmNkMGY2MjFlZGNiMTBkNGRlN2JjMjZlMzQ2Ny9jb21tZW50cyI7czo2OiJhdXRob3IiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo3OiJwYXJlbnRzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjozOntzOjM6InNoYSI7czo0MDoiNWNiNDk3Yzg0OTFkMzkwMTBmNGUwYzBjNDNkNjE2MGRmNjBjZTAyOCI7czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvNWNiNDk3Yzg0OTFkMzkwMTBmNGUwYzBjNDNkNjE2MGRmNjBjZTAyOCI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC81Y2I0OTdjODQ5MWQzOTAxMGY0ZTBjMGM0M2Q2MTYwZGY2MGNlMDI4Ijt9fX0=', '', 'https://github.com/babsgosgens/crossinghippos/commit/8bd7b312dbe6fcd0f621edcb10d4de7bc26e3467', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 3, '95d218b0aed954b291f3b2e495ef21b759f820f4', '2013-09-16 12:31:34', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6Ijk1ZDIxOGIwYWVkOTU0YjI5MWYzYjJlNDk1ZWYyMWI3NTlmODIwZjQiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTZUMTI6MzE6MzRaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE2VDEyOjMxOjM0WiI7fXM6NzoibWVzc2FnZSI7czoyNToiVW5kbyB1bm5lc2Nlc3NhcnkgY2hhbmdlcyI7czo0OiJ0cmVlIjtPOjg6InN0ZENsYXNzIjoyOntzOjM6InNoYSI7czo0MDoiYTY0ZDZkNTI3YWM2N2Q3MTBmNGY2OGUwOTQ0ODk3YmY5OGViODE2YyI7czozOiJ1cmwiO3M6MTA2OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC90cmVlcy9hNjRkNmQ1MjdhYzY3ZDcxMGY0ZjY4ZTA5NDQ4OTdiZjk4ZWI4MTZjIjt9czozOiJ1cmwiO3M6MTA4OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC9jb21taXRzLzk1ZDIxOGIwYWVkOTU0YjI5MWYzYjJlNDk1ZWYyMWI3NTlmODIwZjQiO3M6MTM6ImNvbW1lbnRfY291bnQiO2k6MDt9czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvOTVkMjE4YjBhZWQ5NTRiMjkxZjNiMmU0OTVlZjIxYjc1OWY4MjBmNCI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC85NWQyMThiMGFlZDk1NGIyOTFmM2IyZTQ5NWVmMjFiNzU5ZjgyMGY0IjtzOjEyOiJjb21tZW50c191cmwiO3M6MTEzOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvOTVkMjE4YjBhZWQ5NTRiMjkxZjNiMmU0OTVlZjIxYjc1OWY4MjBmNC9jb21tZW50cyI7czo2OiJhdXRob3IiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo3OiJwYXJlbnRzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjozOntzOjM6InNoYSI7czo0MDoiYmQxNmRmMjQ5NGQ1MDI0N2I5OWRhNjAwYjJiMWQ2OTZlYTg4YjgzNyI7czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvYmQxNmRmMjQ5NGQ1MDI0N2I5OWRhNjAwYjJiMWQ2OTZlYTg4YjgzNyI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC9iZDE2ZGYyNDk0ZDUwMjQ3Yjk5ZGE2MDBiMmIxZDY5NmVhODhiODM3Ijt9fX0=', '', 'https://github.com/babsgosgens/crossinghippos/commit/95d218b0aed954b291f3b2e495ef21b759f820f4', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 3, '9c17c2daa97cbae3d7b4ef81a924f3d89411e5ac', '2013-09-17 18:30:47', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6IjljMTdjMmRhYTk3Y2JhZTNkN2I0ZWY4MWE5MjRmM2Q4OTQxMWU1YWMiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTdUMTg6MzA6NDdaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE3VDE4OjMwOjQ3WiI7fXM6NzoibWVzc2FnZSI7czoxNjM6Ik1WQyBpcyBzY3Jld2VkIHVwIC0gc3RhdGUgbWV0aG9kcyBmYWxsaW5nIGJhY2sgb24gd3JvbmcgbW9kZWwuIEFkZCBzdGF0ZSBtZXRob2RzIHRvIHN0cmVhbXMgbW9kZWwgZm9yIG5vdyBhbmQgcmUtYWRkcmVzcyBpc3N1ZSBsYXRlci4gU3RhdGUgbWV0aG9kcyBub3cgZnVuY3Rpb25hbC4iO3M6NDoidHJlZSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czozOiJzaGEiO3M6NDA6ImY3YTIxNTYxMDJiMWFjNjI2OTQ3NDc2MjQ0MzFlNzMzZTM5NWJlYjQiO3M6MzoidXJsIjtzOjEwNjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9naXQvdHJlZXMvZjdhMjE1NjEwMmIxYWM2MjY5NDc0NzYyNDQzMWU3MzNlMzk1YmViNCI7fXM6MzoidXJsIjtzOjEwODoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9naXQvY29tbWl0cy85YzE3YzJkYWE5N2NiYWUzZDdiNGVmODFhOTI0ZjNkODk0MTFlNWFjIjtzOjEzOiJjb21tZW50X2NvdW50IjtpOjA7fXM6MzoidXJsIjtzOjEwNDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzljMTdjMmRhYTk3Y2JhZTNkN2I0ZWY4MWE5MjRmM2Q4OTQxMWU1YWMiO3M6ODoiaHRtbF91cmwiO3M6OTM6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXQvOWMxN2MyZGFhOTdjYmFlM2Q3YjRlZjgxYTkyNGYzZDg5NDExZTVhYyI7czoxMjoiY29tbWVudHNfdXJsIjtzOjExMzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzljMTdjMmRhYTk3Y2JhZTNkN2I0ZWY4MWE5MjRmM2Q4OTQxMWU1YWMvY29tbWVudHMiO3M6NjoiYXV0aG9yIjtPOjg6InN0ZENsYXNzIjoxNjp7czo1OiJsb2dpbiI7czoxMToiYmFic2dvc2dlbnMiO3M6MjoiaWQiO2k6MTI2ODE0MjtzOjEwOiJhdmF0YXJfdXJsIjtzOjEzOToiaHR0cHM6Ly8xLmdyYXZhdGFyLmNvbS9hdmF0YXIvYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjY/ZD1odHRwcyUzQSUyRiUyRmlkZW50aWNvbnMuZ2l0aHViLmNvbSUyRjUzODU1MTg0OGJlYjU4NmU3MjU1MzkxMzI5MDU2N2YzLnBuZyI7czoxMToiZ3JhdmF0YXJfaWQiO3M6MzI6ImIzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2IjtzOjM6InVybCI7czo0MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2VucyI7czo4OiJodG1sX3VybCI7czozMDoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zIjtzOjEzOiJmb2xsb3dlcnNfdXJsIjtzOjUwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2VycyI7czoxMzoiZm9sbG93aW5nX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IjtzOjk6Imdpc3RzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9naXN0c3svZ2lzdF9pZH0iO3M6MTE6InN0YXJyZWRfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N0YXJyZWR7L293bmVyfXsvcmVwb30iO3M6MTc6InN1YnNjcmlwdGlvbnNfdXJsIjtzOjU0OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N1YnNjcmlwdGlvbnMiO3M6MTc6Im9yZ2FuaXphdGlvbnNfdXJsIjtzOjQ1OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL29yZ3MiO3M6OToicmVwb3NfdXJsIjtzOjQ2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlcG9zIjtzOjEwOiJldmVudHNfdXJsIjtzOjU3OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2V2ZW50c3svcHJpdmFjeX0iO3M6MTk6InJlY2VpdmVkX2V2ZW50c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVjZWl2ZWRfZXZlbnRzIjtzOjQ6InR5cGUiO3M6NDoiVXNlciI7fXM6OToiY29tbWl0dGVyIjtPOjg6InN0ZENsYXNzIjoxNjp7czo1OiJsb2dpbiI7czoxMToiYmFic2dvc2dlbnMiO3M6MjoiaWQiO2k6MTI2ODE0MjtzOjEwOiJhdmF0YXJfdXJsIjtzOjEzOToiaHR0cHM6Ly8xLmdyYXZhdGFyLmNvbS9hdmF0YXIvYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjY/ZD1odHRwcyUzQSUyRiUyRmlkZW50aWNvbnMuZ2l0aHViLmNvbSUyRjUzODU1MTg0OGJlYjU4NmU3MjU1MzkxMzI5MDU2N2YzLnBuZyI7czoxMToiZ3JhdmF0YXJfaWQiO3M6MzI6ImIzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2IjtzOjM6InVybCI7czo0MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2VucyI7czo4OiJodG1sX3VybCI7czozMDoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zIjtzOjEzOiJmb2xsb3dlcnNfdXJsIjtzOjUwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2VycyI7czoxMzoiZm9sbG93aW5nX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IjtzOjk6Imdpc3RzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9naXN0c3svZ2lzdF9pZH0iO3M6MTE6InN0YXJyZWRfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N0YXJyZWR7L293bmVyfXsvcmVwb30iO3M6MTc6InN1YnNjcmlwdGlvbnNfdXJsIjtzOjU0OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N1YnNjcmlwdGlvbnMiO3M6MTc6Im9yZ2FuaXphdGlvbnNfdXJsIjtzOjQ1OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL29yZ3MiO3M6OToicmVwb3NfdXJsIjtzOjQ2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlcG9zIjtzOjEwOiJldmVudHNfdXJsIjtzOjU3OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2V2ZW50c3svcHJpdmFjeX0iO3M6MTk6InJlY2VpdmVkX2V2ZW50c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVjZWl2ZWRfZXZlbnRzIjtzOjQ6InR5cGUiO3M6NDoiVXNlciI7fXM6NzoicGFyZW50cyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czozOiJzaGEiO3M6NDA6IjE4NzVlOWEzYzk0NDdiY2QwYzJlMWE5ZDRhMDliODcwMGU2NGNmOGQiO3M6MzoidXJsIjtzOjEwNDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzE4NzVlOWEzYzk0NDdiY2QwYzJlMWE5ZDRhMDliODcwMGU2NGNmOGQiO3M6ODoiaHRtbF91cmwiO3M6OTM6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXQvMTg3NWU5YTNjOTQ0N2JjZDBjMmUxYTlkNGEwOWI4NzAwZTY0Y2Y4ZCI7fX19', '', 'https://github.com/babsgosgens/crossinghippos/commit/9c17c2daa97cbae3d7b4ef81a924f3d89411e5ac', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 3, '9c730dd0cde8f751ad536ba36613a075a29dfe42', '2013-09-16 12:15:02', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6IjljNzMwZGQwY2RlOGY3NTFhZDUzNmJhMzY2MTNhMDc1YTI5ZGZlNDIiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTZUMTI6MTU6MDJaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE2VDEyOjE1OjAyWiI7fXM6NzoibWVzc2FnZSI7czo0MzoiQWRkIHBhcnRpYWwgbGF5b3V0cyBmb3IgZGlmZmVyZW50IHBsYXRmb3JtcyI7czo0OiJ0cmVlIjtPOjg6InN0ZENsYXNzIjoyOntzOjM6InNoYSI7czo0MDoiMThkNzdhMmEyNTZkNzExY2QxMjMzYTdlZGE5ZDU1ZTU3ZWVjYTUzMCI7czozOiJ1cmwiO3M6MTA2OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC90cmVlcy8xOGQ3N2EyYTI1NmQ3MTFjZDEyMzNhN2VkYTlkNTVlNTdlZWNhNTMwIjt9czozOiJ1cmwiO3M6MTA4OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC9jb21taXRzLzljNzMwZGQwY2RlOGY3NTFhZDUzNmJhMzY2MTNhMDc1YTI5ZGZlNDIiO3M6MTM6ImNvbW1lbnRfY291bnQiO2k6MDt9czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvOWM3MzBkZDBjZGU4Zjc1MWFkNTM2YmEzNjYxM2EwNzVhMjlkZmU0MiI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC85YzczMGRkMGNkZThmNzUxYWQ1MzZiYTM2NjEzYTA3NWEyOWRmZTQyIjtzOjEyOiJjb21tZW50c191cmwiO3M6MTEzOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvOWM3MzBkZDBjZGU4Zjc1MWFkNTM2YmEzNjYxM2EwNzVhMjlkZmU0Mi9jb21tZW50cyI7czo2OiJhdXRob3IiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo3OiJwYXJlbnRzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjozOntzOjM6InNoYSI7czo0MDoiM2ZiMjIyMzE4ODhkZmJjOGZmOTY3ZDczYjE0NTk2Y2Y1NTRhYzRmNSI7czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvM2ZiMjIyMzE4ODhkZmJjOGZmOTY3ZDczYjE0NTk2Y2Y1NTRhYzRmNSI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC8zZmIyMjIzMTg4OGRmYmM4ZmY5NjdkNzNiMTQ1OTZjZjU1NGFjNGY1Ijt9fX0=', '', 'https://github.com/babsgosgens/crossinghippos/commit/9c730dd0cde8f751ad536ba36613a075a29dfe42', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 3, 'aaf70f7dc81bbf6b0ebc4324080c528f8dac24c4', '2013-09-16 12:43:38', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6ImFhZjcwZjdkYzgxYmJmNmIwZWJjNDMyNDA4MGM1MjhmOGRhYzI0YzQiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTZUMTI6NDM6MzhaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE2VDEyOjQzOjM4WiI7fXM6NzoibWVzc2FnZSI7czoxODoiQ2FsbCBmYWNlYm9vayBwb3N0IjtzOjQ6InRyZWUiO086ODoic3RkQ2xhc3MiOjI6e3M6Mzoic2hhIjtzOjQwOiIzZDQ1ZTAwZjU5NzU0ODQ5MDc4YTFkY2NhYTI4NDZjNDcyYThhNzJhIjtzOjM6InVybCI7czoxMDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L3RyZWVzLzNkNDVlMDBmNTk3NTQ4NDkwNzhhMWRjY2FhMjg0NmM0NzJhOGE3MmEiO31zOjM6InVybCI7czoxMDg6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L2NvbW1pdHMvYWFmNzBmN2RjODFiYmY2YjBlYmM0MzI0MDgwYzUyOGY4ZGFjMjRjNCI7czoxMzoiY29tbWVudF9jb3VudCI7aTowO31zOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9hYWY3MGY3ZGM4MWJiZjZiMGViYzQzMjQwODBjNTI4ZjhkYWMyNGM0IjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0L2FhZjcwZjdkYzgxYmJmNmIwZWJjNDMyNDA4MGM1MjhmOGRhYzI0YzQiO3M6MTI6ImNvbW1lbnRzX3VybCI7czoxMTM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9hYWY3MGY3ZGM4MWJiZjZiMGViYzQzMjQwODBjNTI4ZjhkYWMyNGM0L2NvbW1lbnRzIjtzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjk6ImNvbW1pdHRlciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjc6InBhcmVudHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjM6e3M6Mzoic2hhIjtzOjQwOiI5NWQyMThiMGFlZDk1NGIyOTFmM2IyZTQ5NWVmMjFiNzU5ZjgyMGY0IjtzOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy85NWQyMThiMGFlZDk1NGIyOTFmM2IyZTQ5NWVmMjFiNzU5ZjgyMGY0IjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0Lzk1ZDIxOGIwYWVkOTU0YjI5MWYzYjJlNDk1ZWYyMWI3NTlmODIwZjQiO319fQ==', '', 'https://github.com/babsgosgens/crossinghippos/commit/aaf70f7dc81bbf6b0ebc4324080c528f8dac24c4', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `flock_streams` (`id`, `api_id`, `post_id`, `date_created`, `raw`, `metadata`, `permalink`, `params`, `language`, `state`, `publish_up`, `publish_down`) VALUES
(46, 3, 'b9542f11503d04918a1d4ddb1fc824e18baffdfd', '2013-09-17 07:39:38', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6ImI5NTQyZjExNTAzZDA0OTE4YTFkNGRkYjFmYzgyNGUxOGJhZmZkZmQiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTdUMDc6Mzk6MzhaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE3VDA3OjM5OjM4WiI7fXM6NzoibWVzc2FnZSI7czoyNzoiUmVuYW1lIGNvbHVtbnMsIHVwZGF0ZSBjb2RlIjtzOjQ6InRyZWUiO086ODoic3RkQ2xhc3MiOjI6e3M6Mzoic2hhIjtzOjQwOiIyYjM5YThjZmY3OTc1Zjg4NTUyOTQ5YWRhZDFjMzZiN2ZmYTM0YjkwIjtzOjM6InVybCI7czoxMDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L3RyZWVzLzJiMzlhOGNmZjc5NzVmODg1NTI5NDlhZGFkMWMzNmI3ZmZhMzRiOTAiO31zOjM6InVybCI7czoxMDg6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L2NvbW1pdHMvYjk1NDJmMTE1MDNkMDQ5MThhMWQ0ZGRiMWZjODI0ZTE4YmFmZmRmZCI7czoxMzoiY29tbWVudF9jb3VudCI7aTowO31zOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9iOTU0MmYxMTUwM2QwNDkxOGExZDRkZGIxZmM4MjRlMThiYWZmZGZkIjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0L2I5NTQyZjExNTAzZDA0OTE4YTFkNGRkYjFmYzgyNGUxOGJhZmZkZmQiO3M6MTI6ImNvbW1lbnRzX3VybCI7czoxMTM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9iOTU0MmYxMTUwM2QwNDkxOGExZDRkZGIxZmM4MjRlMThiYWZmZGZkL2NvbW1lbnRzIjtzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjk6ImNvbW1pdHRlciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjc6InBhcmVudHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjM6e3M6Mzoic2hhIjtzOjQwOiIyNWFiNmMxYWU2NzVmMzEyNDY1YzI0YTYyNTU2NmQzYTViY2QzN2I4IjtzOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy8yNWFiNmMxYWU2NzVmMzEyNDY1YzI0YTYyNTU2NmQzYTViY2QzN2I4IjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0LzI1YWI2YzFhZTY3NWYzMTI0NjVjMjRhNjI1NTY2ZDNhNWJjZDM3YjgiO319fQ==', '', 'https://github.com/babsgosgens/crossinghippos/commit/b9542f11503d04918a1d4ddb1fc824e18baffdfd', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 3, 'bc2fb0b3fec97a01c5a5bd240d495fef274f36d7', '2013-09-17 06:55:34', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6ImJjMmZiMGIzZmVjOTdhMDFjNWE1YmQyNDBkNDk1ZmVmMjc0ZjM2ZDciO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTdUMDY6NTU6MzRaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE3VDA2OjU1OjM0WiI7fXM6NzoibWVzc2FnZSI7czo1NzoiVXBkYXRlIHRoZSB0d2l0dGVyIG1vZGVsIHRvIHJlZmxlY3QgY2hhbmdlcyB0byBjb250cm9sbGVyIjtzOjQ6InRyZWUiO086ODoic3RkQ2xhc3MiOjI6e3M6Mzoic2hhIjtzOjQwOiJhNjRlNjcyYWZiMTRjYjM4Y2YzNTEyYjBkZjhhYjgwZTgwZDU5ZDRmIjtzOjM6InVybCI7czoxMDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L3RyZWVzL2E2NGU2NzJhZmIxNGNiMzhjZjM1MTJiMGRmOGFiODBlODBkNTlkNGYiO31zOjM6InVybCI7czoxMDg6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L2NvbW1pdHMvYmMyZmIwYjNmZWM5N2EwMWM1YTViZDI0MGQ0OTVmZWYyNzRmMzZkNyI7czoxMzoiY29tbWVudF9jb3VudCI7aTowO31zOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9iYzJmYjBiM2ZlYzk3YTAxYzVhNWJkMjQwZDQ5NWZlZjI3NGYzNmQ3IjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0L2JjMmZiMGIzZmVjOTdhMDFjNWE1YmQyNDBkNDk1ZmVmMjc0ZjM2ZDciO3M6MTI6ImNvbW1lbnRzX3VybCI7czoxMTM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9iYzJmYjBiM2ZlYzk3YTAxYzVhNWJkMjQwZDQ5NWZlZjI3NGYzNmQ3L2NvbW1lbnRzIjtzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjk6ImNvbW1pdHRlciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjc6InBhcmVudHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjM6e3M6Mzoic2hhIjtzOjQwOiJmYTQxYjI2OGI1ZDI5ZGZiNjhkMDVjYjIyNjlhYzkyOTJhY2NjMWVmIjtzOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9mYTQxYjI2OGI1ZDI5ZGZiNjhkMDVjYjIyNjlhYzkyOTJhY2NjMWVmIjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0L2ZhNDFiMjY4YjVkMjlkZmI2OGQwNWNiMjI2OWFjOTI5MmFjY2MxZWYiO319fQ==', '', 'https://github.com/babsgosgens/crossinghippos/commit/bc2fb0b3fec97a01c5a5bd240d495fef274f36d7', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 3, 'bccbe543610c88e6075e346f3f886d3794b91c9e', '2013-09-17 18:40:43', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6ImJjY2JlNTQzNjEwYzg4ZTYwNzVlMzQ2ZjNmODg2ZDM3OTRiOTFjOWUiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTdUMTg6NDA6NDNaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE3VDE4OjQwOjQzWiI7fXM6NzoibWVzc2FnZSI7czozMzoiQWxsb3cgb3JkZXJpbmcgYnkgaWQuIEZpeCBsYWJlbHMuIjtzOjQ6InRyZWUiO086ODoic3RkQ2xhc3MiOjI6e3M6Mzoic2hhIjtzOjQwOiJiYmJiNzhmYjQwYjUwOTUwZjMwMjAyYmY5ZGEzODRlNjE2ODI1NzFmIjtzOjM6InVybCI7czoxMDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L3RyZWVzL2JiYmI3OGZiNDBiNTA5NTBmMzAyMDJiZjlkYTM4NGU2MTY4MjU3MWYiO31zOjM6InVybCI7czoxMDg6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L2NvbW1pdHMvYmNjYmU1NDM2MTBjODhlNjA3NWUzNDZmM2Y4ODZkMzc5NGI5MWM5ZSI7czoxMzoiY29tbWVudF9jb3VudCI7aTowO31zOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9iY2NiZTU0MzYxMGM4OGU2MDc1ZTM0NmYzZjg4NmQzNzk0YjkxYzllIjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0L2JjY2JlNTQzNjEwYzg4ZTYwNzVlMzQ2ZjNmODg2ZDM3OTRiOTFjOWUiO3M6MTI6ImNvbW1lbnRzX3VybCI7czoxMTM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9iY2NiZTU0MzYxMGM4OGU2MDc1ZTM0NmYzZjg4NmQzNzk0YjkxYzllL2NvbW1lbnRzIjtzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjk6ImNvbW1pdHRlciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjc6InBhcmVudHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjM6e3M6Mzoic2hhIjtzOjQwOiI5YzE3YzJkYWE5N2NiYWUzZDdiNGVmODFhOTI0ZjNkODk0MTFlNWFjIjtzOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy85YzE3YzJkYWE5N2NiYWUzZDdiNGVmODFhOTI0ZjNkODk0MTFlNWFjIjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0LzljMTdjMmRhYTk3Y2JhZTNkN2I0ZWY4MWE5MjRmM2Q4OTQxMWU1YWMiO319fQ==', '', 'https://github.com/babsgosgens/crossinghippos/commit/bccbe543610c88e6075e346f3f886d3794b91c9e', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 3, 'bd16df2494d50247b99da600b2b1d696ea88b837', '2013-09-16 12:29:13', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6ImJkMTZkZjI0OTRkNTAyNDdiOTlkYTYwMGIyYjFkNjk2ZWE4OGI4MzciO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjU6ImVtYWlsIjtzOjIxOiJiYWJzZ29zZ2Vuc0BnbWFpbC5jb20iO3M6NDoiZGF0ZSI7czoyMDoiMjAxMy0wOS0xNlQxMjoyOToxM1oiO31zOjk6ImNvbW1pdHRlciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjU6ImVtYWlsIjtzOjIxOiJiYWJzZ29zZ2Vuc0BnbWFpbC5jb20iO3M6NDoiZGF0ZSI7czoyMDoiMjAxMy0wOS0xNlQxMjoyOToxM1oiO31zOjc6Im1lc3NhZ2UiO3M6NjQ6Ik1lcmdlIHB1bGwgcmVxdWVzdCAjMSBmcm9tIGplYW50amUvbWFzdGVyCgpBZGRlZCBmYWNlYm9vayBtb2RlbC4iO3M6NDoidHJlZSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czozOiJzaGEiO3M6NDA6ImZjNmJkYzA0ZGQ1N2YwMDgxM2JhNTRkYmM2ZGZmNTQyYjRiYWNmMDkiO3M6MzoidXJsIjtzOjEwNjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9naXQvdHJlZXMvZmM2YmRjMDRkZDU3ZjAwODEzYmE1NGRiYzZkZmY1NDJiNGJhY2YwOSI7fXM6MzoidXJsIjtzOjEwODoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9naXQvY29tbWl0cy9iZDE2ZGYyNDk0ZDUwMjQ3Yjk5ZGE2MDBiMmIxZDY5NmVhODhiODM3IjtzOjEzOiJjb21tZW50X2NvdW50IjtpOjA7fXM6MzoidXJsIjtzOjEwNDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzL2JkMTZkZjI0OTRkNTAyNDdiOTlkYTYwMGIyYjFkNjk2ZWE4OGI4MzciO3M6ODoiaHRtbF91cmwiO3M6OTM6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXQvYmQxNmRmMjQ5NGQ1MDI0N2I5OWRhNjAwYjJiMWQ2OTZlYTg4YjgzNyI7czoxMjoiY29tbWVudHNfdXJsIjtzOjExMzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzL2JkMTZkZjI0OTRkNTAyNDdiOTlkYTYwMGIyYjFkNjk2ZWE4OGI4MzcvY29tbWVudHMiO3M6NjoiYXV0aG9yIjtPOjg6InN0ZENsYXNzIjoxNjp7czo1OiJsb2dpbiI7czoxMToiYmFic2dvc2dlbnMiO3M6MjoiaWQiO2k6MTI2ODE0MjtzOjEwOiJhdmF0YXJfdXJsIjtzOjEzOToiaHR0cHM6Ly8xLmdyYXZhdGFyLmNvbS9hdmF0YXIvYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjY/ZD1odHRwcyUzQSUyRiUyRmlkZW50aWNvbnMuZ2l0aHViLmNvbSUyRjUzODU1MTg0OGJlYjU4NmU3MjU1MzkxMzI5MDU2N2YzLnBuZyI7czoxMToiZ3JhdmF0YXJfaWQiO3M6MzI6ImIzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2IjtzOjM6InVybCI7czo0MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2VucyI7czo4OiJodG1sX3VybCI7czozMDoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zIjtzOjEzOiJmb2xsb3dlcnNfdXJsIjtzOjUwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2VycyI7czoxMzoiZm9sbG93aW5nX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IjtzOjk6Imdpc3RzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9naXN0c3svZ2lzdF9pZH0iO3M6MTE6InN0YXJyZWRfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N0YXJyZWR7L293bmVyfXsvcmVwb30iO3M6MTc6InN1YnNjcmlwdGlvbnNfdXJsIjtzOjU0OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N1YnNjcmlwdGlvbnMiO3M6MTc6Im9yZ2FuaXphdGlvbnNfdXJsIjtzOjQ1OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL29yZ3MiO3M6OToicmVwb3NfdXJsIjtzOjQ2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlcG9zIjtzOjEwOiJldmVudHNfdXJsIjtzOjU3OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2V2ZW50c3svcHJpdmFjeX0iO3M6MTk6InJlY2VpdmVkX2V2ZW50c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVjZWl2ZWRfZXZlbnRzIjtzOjQ6InR5cGUiO3M6NDoiVXNlciI7fXM6OToiY29tbWl0dGVyIjtPOjg6InN0ZENsYXNzIjoxNjp7czo1OiJsb2dpbiI7czoxMToiYmFic2dvc2dlbnMiO3M6MjoiaWQiO2k6MTI2ODE0MjtzOjEwOiJhdmF0YXJfdXJsIjtzOjEzOToiaHR0cHM6Ly8xLmdyYXZhdGFyLmNvbS9hdmF0YXIvYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjY/ZD1odHRwcyUzQSUyRiUyRmlkZW50aWNvbnMuZ2l0aHViLmNvbSUyRjUzODU1MTg0OGJlYjU4NmU3MjU1MzkxMzI5MDU2N2YzLnBuZyI7czoxMToiZ3JhdmF0YXJfaWQiO3M6MzI6ImIzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2IjtzOjM6InVybCI7czo0MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2VucyI7czo4OiJodG1sX3VybCI7czozMDoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zIjtzOjEzOiJmb2xsb3dlcnNfdXJsIjtzOjUwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2VycyI7czoxMzoiZm9sbG93aW5nX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dpbmd7L290aGVyX3VzZXJ9IjtzOjk6Imdpc3RzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9naXN0c3svZ2lzdF9pZH0iO3M6MTE6InN0YXJyZWRfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N0YXJyZWR7L293bmVyfXsvcmVwb30iO3M6MTc6InN1YnNjcmlwdGlvbnNfdXJsIjtzOjU0OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3N1YnNjcmlwdGlvbnMiO3M6MTc6Im9yZ2FuaXphdGlvbnNfdXJsIjtzOjQ1OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL29yZ3MiO3M6OToicmVwb3NfdXJsIjtzOjQ2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlcG9zIjtzOjEwOiJldmVudHNfdXJsIjtzOjU3OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2V2ZW50c3svcHJpdmFjeX0iO3M6MTk6InJlY2VpdmVkX2V2ZW50c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVjZWl2ZWRfZXZlbnRzIjtzOjQ6InR5cGUiO3M6NDoiVXNlciI7fXM6NzoicGFyZW50cyI7YToyOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czozOiJzaGEiO3M6NDA6IjljNzMwZGQwY2RlOGY3NTFhZDUzNmJhMzY2MTNhMDc1YTI5ZGZlNDIiO3M6MzoidXJsIjtzOjEwNDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS9yZXBvcy9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXRzLzljNzMwZGQwY2RlOGY3NTFhZDUzNmJhMzY2MTNhMDc1YTI5ZGZlNDIiO3M6ODoiaHRtbF91cmwiO3M6OTM6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2Vucy9jcm9zc2luZ2hpcHBvcy9jb21taXQvOWM3MzBkZDBjZGU4Zjc1MWFkNTM2YmEzNjYxM2EwNzVhMjlkZmU0MiI7fWk6MTtPOjg6InN0ZENsYXNzIjozOntzOjM6InNoYSI7czo0MDoiNjZhMWQ4Y2ZiYjZmNDExN2M1ZmRmMTNlYWFlNTFlZDA4YjM4MmVlMiI7czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvNjZhMWQ4Y2ZiYjZmNDExN2M1ZmRmMTNlYWFlNTFlZDA4YjM4MmVlMiI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC82NmExZDhjZmJiNmY0MTE3YzVmZGYxM2VhYWU1MWVkMDhiMzgyZWUyIjt9fX0=', '', 'https://github.com/babsgosgens/crossinghippos/commit/bd16df2494d50247b99da600b2b1d696ea88b837', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 3, 'c75b191d66481f65dc78e4f9343a3e602cda3219', '2013-09-17 19:18:51', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6ImM3NWIxOTFkNjY0ODFmNjVkYzc4ZTRmOTM0M2EzZTYwMmNkYTMyMTkiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTdUMTk6MTg6NTFaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE3VDE5OjE4OjUxWiI7fXM6NzoibWVzc2FnZSI7czoyODoiUmVuZGVyIGJ1dHRvbnMgZnJvbSBhcGkgbGlzdCI7czo0OiJ0cmVlIjtPOjg6InN0ZENsYXNzIjoyOntzOjM6InNoYSI7czo0MDoiYTIxZGYyNTM5ZDM3NTY4OTllNWJmZmEyMzIwY2NjY2VkNDljYzVjYyI7czozOiJ1cmwiO3M6MTA2OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC90cmVlcy9hMjFkZjI1MzlkMzc1Njg5OWU1YmZmYTIzMjBjY2NjZWQ0OWNjNWNjIjt9czozOiJ1cmwiO3M6MTA4OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC9jb21taXRzL2M3NWIxOTFkNjY0ODFmNjVkYzc4ZTRmOTM0M2EzZTYwMmNkYTMyMTkiO3M6MTM6ImNvbW1lbnRfY291bnQiO2k6MDt9czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvYzc1YjE5MWQ2NjQ4MWY2NWRjNzhlNGY5MzQzYTNlNjAyY2RhMzIxOSI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC9jNzViMTkxZDY2NDgxZjY1ZGM3OGU0ZjkzNDNhM2U2MDJjZGEzMjE5IjtzOjEyOiJjb21tZW50c191cmwiO3M6MTEzOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvYzc1YjE5MWQ2NjQ4MWY2NWRjNzhlNGY5MzQzYTNlNjAyY2RhMzIxOS9jb21tZW50cyI7czo2OiJhdXRob3IiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo3OiJwYXJlbnRzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjozOntzOjM6InNoYSI7czo0MDoiMWNmYjM1NzNkMjYwYjQyZGRjNDA4YWY3M2FjYmMzMWUyMmYyMGI5NyI7czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvMWNmYjM1NzNkMjYwYjQyZGRjNDA4YWY3M2FjYmMzMWUyMmYyMGI5NyI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC8xY2ZiMzU3M2QyNjBiNDJkZGM0MDhhZjczYWNiYzMxZTIyZjIwYjk3Ijt9fX0=', '', 'https://github.com/babsgosgens/crossinghippos/commit/c75b191d66481f65dc78e4f9343a3e602cda3219', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 3, 'd3e16b844c948600c214e6b61b8e7fd51ff3dbab', '2013-09-16 19:02:41', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6ImQzZTE2Yjg0NGM5NDg2MDBjMjE0ZTZiNjFiOGU3ZmQ1MWZmM2RiYWIiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTZUMTk6MDI6NDFaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE2VDE5OjAyOjQxWiI7fXM6NzoibWVzc2FnZSI7czoyNDoiUmVtb3ZlIGN1c3RvbSBGQiBsaWJyYXJ5IjtzOjQ6InRyZWUiO086ODoic3RkQ2xhc3MiOjI6e3M6Mzoic2hhIjtzOjQwOiIzY2ViZjhiZjUyYzQ2YjAzNThmZjkyOTNkN2I4MzhmNzk2Y2NhZjc1IjtzOjM6InVybCI7czoxMDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L3RyZWVzLzNjZWJmOGJmNTJjNDZiMDM1OGZmOTI5M2Q3YjgzOGY3OTZjY2FmNzUiO31zOjM6InVybCI7czoxMDg6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L2NvbW1pdHMvZDNlMTZiODQ0Yzk0ODYwMGMyMTRlNmI2MWI4ZTdmZDUxZmYzZGJhYiI7czoxMzoiY29tbWVudF9jb3VudCI7aTowO31zOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9kM2UxNmI4NDRjOTQ4NjAwYzIxNGU2YjYxYjhlN2ZkNTFmZjNkYmFiIjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0L2QzZTE2Yjg0NGM5NDg2MDBjMjE0ZTZiNjFiOGU3ZmQ1MWZmM2RiYWIiO3M6MTI6ImNvbW1lbnRzX3VybCI7czoxMTM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9kM2UxNmI4NDRjOTQ4NjAwYzIxNGU2YjYxYjhlN2ZkNTFmZjNkYmFiL2NvbW1lbnRzIjtzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjk6ImNvbW1pdHRlciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjc6InBhcmVudHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjM6e3M6Mzoic2hhIjtzOjQwOiI0M2YyNmRhMjRjZTMyMjQ1OGYzN2ZmYzVhMmNhNjZmMDZkODkxNzI2IjtzOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy80M2YyNmRhMjRjZTMyMjQ1OGYzN2ZmYzVhMmNhNjZmMDZkODkxNzI2IjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0LzQzZjI2ZGEyNGNlMzIyNDU4ZjM3ZmZjNWEyY2E2NmYwNmQ4OTE3MjYiO319fQ==', '', 'https://github.com/babsgosgens/crossinghippos/commit/d3e16b844c948600c214e6b61b8e7fd51ff3dbab', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 3, 'e6edfd1bb2c741890cb648dcdd3e4ba59d1e54f2', '2013-09-17 19:53:12', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6ImU2ZWRmZDFiYjJjNzQxODkwY2I2NDhkY2RkM2U0YmE1OWQxZTU0ZjIiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTdUMTk6NTM6MTJaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE3VDE5OjUzOjEyWiI7fXM6NzoibWVzc2FnZSI7czo4NToiTmV3IGRhdGFiYXNlIGR1bXAsIGxvdHMgb2YgbmV3IEFQSXMuIFBsZWFzZSBpbXBvcnQgMjAxMzA5MTcyMTUxLWNyb3NzaW5naGlwcG9zX2ozLnNxbCI7czo0OiJ0cmVlIjtPOjg6InN0ZENsYXNzIjoyOntzOjM6InNoYSI7czo0MDoiMWRjM2FjOTc5NGRjY2RkMDQ4ZjVkYjJjMDE2NGFkNmRhMGQ3ZjQzNyI7czozOiJ1cmwiO3M6MTA2OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC90cmVlcy8xZGMzYWM5Nzk0ZGNjZGQwNDhmNWRiMmMwMTY0YWQ2ZGEwZDdmNDM3Ijt9czozOiJ1cmwiO3M6MTA4OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2dpdC9jb21taXRzL2U2ZWRmZDFiYjJjNzQxODkwY2I2NDhkY2RkM2U0YmE1OWQxZTU0ZjIiO3M6MTM6ImNvbW1lbnRfY291bnQiO2k6MDt9czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvZTZlZGZkMWJiMmM3NDE4OTBjYjY0OGRjZGQzZTRiYTU5ZDFlNTRmMiI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC9lNmVkZmQxYmIyYzc0MTg5MGNiNjQ4ZGNkZDNlNGJhNTlkMWU1NGYyIjtzOjEyOiJjb21tZW50c191cmwiO3M6MTEzOiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvZTZlZGZkMWJiMmM3NDE4OTBjYjY0OGRjZGQzZTRiYTU5ZDFlNTRmMi9jb21tZW50cyI7czo2OiJhdXRob3IiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjE2OntzOjU6ImxvZ2luIjtzOjExOiJiYWJzZ29zZ2VucyI7czoyOiJpZCI7aToxMjY4MTQyO3M6MTA6ImF2YXRhcl91cmwiO3M6MTM5OiJodHRwczovLzEuZ3JhdmF0YXIuY29tL2F2YXRhci9iMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNj9kPWh0dHBzJTNBJTJGJTJGaWRlbnRpY29ucy5naXRodWIuY29tJTJGNTM4NTUxODQ4YmViNTg2ZTcyNTUzOTEzMjkwNTY3ZjMucG5nIjtzOjExOiJncmF2YXRhcl9pZCI7czozMjoiYjM0Yzg1NTc3NTI5ODc3OTM3YTM4MDdiMjAyZDcxMjYiO3M6MzoidXJsIjtzOjQwOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zIjtzOjg6Imh0bWxfdXJsIjtzOjMwOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMiO3M6MTM6ImZvbGxvd2Vyc191cmwiO3M6NTA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93ZXJzIjtzOjEzOiJmb2xsb3dpbmdfdXJsIjtzOjYzOiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2ZvbGxvd2luZ3svb3RoZXJfdXNlcn0iO3M6OToiZ2lzdHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL2dpc3Rzey9naXN0X2lkfSI7czoxMToic3RhcnJlZF91cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3RhcnJlZHsvb3duZXJ9ey9yZXBvfSI7czoxNzoic3Vic2NyaXB0aW9uc191cmwiO3M6NTQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvc3Vic2NyaXB0aW9ucyI7czoxNzoib3JnYW5pemF0aW9uc191cmwiO3M6NDU6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvb3JncyI7czo5OiJyZXBvc191cmwiO3M6NDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvcmVwb3MiO3M6MTA6ImV2ZW50c191cmwiO3M6NTc6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZXZlbnRzey9wcml2YWN5fSI7czoxOToicmVjZWl2ZWRfZXZlbnRzX3VybCI7czo1NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZWNlaXZlZF9ldmVudHMiO3M6NDoidHlwZSI7czo0OiJVc2VyIjt9czo3OiJwYXJlbnRzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjozOntzOjM6InNoYSI7czo0MDoiMTBkOWE0OTZlN2VlOGVmZWNmYjc5YWM5MmUzYTdhYTRlM2ZjYjg1YyI7czozOiJ1cmwiO3M6MTA0OiJodHRwczovL2FwaS5naXRodWIuY29tL3JlcG9zL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdHMvMTBkOWE0OTZlN2VlOGVmZWNmYjc5YWM5MmUzYTdhYTRlM2ZjYjg1YyI7czo4OiJodG1sX3VybCI7czo5MzoiaHR0cHM6Ly9naXRodWIuY29tL2JhYnNnb3NnZW5zL2Nyb3NzaW5naGlwcG9zL2NvbW1pdC8xMGQ5YTQ5NmU3ZWU4ZWZlY2ZiNzlhYzkyZTNhN2FhNGUzZmNiODVjIjt9fX0=', '', 'https://github.com/babsgosgens/crossinghippos/commit/e6edfd1bb2c741890cb648dcdd3e4ba59d1e54f2', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 3, 'fa25b68af5d2be30ab8d7ae3b0b61b9123a57681', '2013-09-17 09:26:37', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6ImZhMjViNjhhZjVkMmJlMzBhYjhkN2FlM2IwYjYxYjkxMjNhNTc2ODEiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTdUMDk6MjY6MzdaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE3VDA5OjI2OjM3WiI7fXM6NzoibWVzc2FnZSI7czo0MjoiQWRkIEpUd2l0dGVyIHZlcnNpb24gZm9yIEplYW4gdG8gcGxheSB3aXRoIjtzOjQ6InRyZWUiO086ODoic3RkQ2xhc3MiOjI6e3M6Mzoic2hhIjtzOjQwOiIxZDc5Zjk2ZTRiYjc5NmFkYTQ2MWQ0YzBjOTBhMWQ4NDQ2Mzg3MjA0IjtzOjM6InVybCI7czoxMDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L3RyZWVzLzFkNzlmOTZlNGJiNzk2YWRhNDYxZDRjMGM5MGExZDg0NDYzODcyMDQiO31zOjM6InVybCI7czoxMDg6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L2NvbW1pdHMvZmEyNWI2OGFmNWQyYmUzMGFiOGQ3YWUzYjBiNjFiOTEyM2E1NzY4MSI7czoxMzoiY29tbWVudF9jb3VudCI7aTowO31zOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9mYTI1YjY4YWY1ZDJiZTMwYWI4ZDdhZTNiMGI2MWI5MTIzYTU3NjgxIjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0L2ZhMjViNjhhZjVkMmJlMzBhYjhkN2FlM2IwYjYxYjkxMjNhNTc2ODEiO3M6MTI6ImNvbW1lbnRzX3VybCI7czoxMTM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9mYTI1YjY4YWY1ZDJiZTMwYWI4ZDdhZTNiMGI2MWI5MTIzYTU3NjgxL2NvbW1lbnRzIjtzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjk6ImNvbW1pdHRlciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjc6InBhcmVudHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjM6e3M6Mzoic2hhIjtzOjQwOiIxODc5MjIwZTczMGMzMDNhYzkyOTVkNDkyNWQ5ZmViMzFjODUwOTA2IjtzOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy8xODc5MjIwZTczMGMzMDNhYzkyOTVkNDkyNWQ5ZmViMzFjODUwOTA2IjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0LzE4NzkyMjBlNzMwYzMwM2FjOTI5NWQ0OTI1ZDlmZWIzMWM4NTA5MDYiO319fQ==', '', 'https://github.com/babsgosgens/crossinghippos/commit/fa25b68af5d2be30ab8d7ae3b0b61b9123a57681', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 3, 'fa41b268b5d29dfb68d05cb2269ac9292accc1ef', '2013-09-16 21:03:00', 'Tzo4OiJzdGRDbGFzcyI6ODp7czozOiJzaGEiO3M6NDA6ImZhNDFiMjY4YjVkMjlkZmI2OGQwNWNiMjI2OWFjOTI5MmFjY2MxZWYiO3M6NjoiY29tbWl0IjtPOjg6InN0ZENsYXNzIjo2OntzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjExOiJiYWJzZ29zZ2VucyI7czo1OiJlbWFpbCI7czoyMToiYmFic2dvc2dlbnNAZ21haWwuY29tIjtzOjQ6ImRhdGUiO3M6MjA6IjIwMTMtMDktMTZUMjE6MDM6MDBaIjt9czo5OiJjb21taXR0ZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxMToiYmFic2dvc2dlbnMiO3M6NToiZW1haWwiO3M6MjE6ImJhYnNnb3NnZW5zQGdtYWlsLmNvbSI7czo0OiJkYXRlIjtzOjIwOiIyMDEzLTA5LTE2VDIxOjAzOjAwWiI7fXM6NzoibWVzc2FnZSI7czo0NToiT25seSB1c2Ugc2Vjb25kIHBhcnQgb2YgaWQsIEZCIGlkIGlzIHRvbyBsb25nIjtzOjQ6InRyZWUiO086ODoic3RkQ2xhc3MiOjI6e3M6Mzoic2hhIjtzOjQwOiIzMzUyMmMzZWE4YjdiODJlNjI2M2EyMDZhNzlkODA3MDMzYjc0NTFjIjtzOjM6InVybCI7czoxMDY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L3RyZWVzLzMzNTIyYzNlYThiN2I4MmU2MjYzYTIwNmE3OWQ4MDcwMzNiNzQ1MWMiO31zOjM6InVybCI7czoxMDg6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvZ2l0L2NvbW1pdHMvZmE0MWIyNjhiNWQyOWRmYjY4ZDA1Y2IyMjY5YWM5MjkyYWNjYzFlZiI7czoxMzoiY29tbWVudF9jb3VudCI7aTowO31zOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9mYTQxYjI2OGI1ZDI5ZGZiNjhkMDVjYjIyNjlhYzkyOTJhY2NjMWVmIjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0L2ZhNDFiMjY4YjVkMjlkZmI2OGQwNWNiMjI2OWFjOTI5MmFjY2MxZWYiO3M6MTI6ImNvbW1lbnRzX3VybCI7czoxMTM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9mYTQxYjI2OGI1ZDI5ZGZiNjhkMDVjYjIyNjlhYzkyOTJhY2NjMWVmL2NvbW1lbnRzIjtzOjY6ImF1dGhvciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjk6ImNvbW1pdHRlciI7Tzo4OiJzdGRDbGFzcyI6MTY6e3M6NToibG9naW4iO3M6MTE6ImJhYnNnb3NnZW5zIjtzOjI6ImlkIjtpOjEyNjgxNDI7czoxMDoiYXZhdGFyX3VybCI7czoxMzk6Imh0dHBzOi8vMS5ncmF2YXRhci5jb20vYXZhdGFyL2IzNGM4NTU3NzUyOTg3NzkzN2EzODA3YjIwMmQ3MTI2P2Q9aHR0cHMlM0ElMkYlMkZpZGVudGljb25zLmdpdGh1Yi5jb20lMkY1Mzg1NTE4NDhiZWI1ODZlNzI1NTM5MTMyOTA1NjdmMy5wbmciO3M6MTE6ImdyYXZhdGFyX2lkIjtzOjMyOiJiMzRjODU1Nzc1Mjk4Nzc5MzdhMzgwN2IyMDJkNzEyNiI7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMiO3M6ODoiaHRtbF91cmwiO3M6MzA6Imh0dHBzOi8vZ2l0aHViLmNvbS9iYWJzZ29zZ2VucyI7czoxMzoiZm9sbG93ZXJzX3VybCI7czo1MDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9mb2xsb3dlcnMiO3M6MTM6ImZvbGxvd2luZ191cmwiO3M6NjM6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZm9sbG93aW5ney9vdGhlcl91c2VyfSI7czo5OiJnaXN0c191cmwiO3M6NTY6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vdXNlcnMvYmFic2dvc2dlbnMvZ2lzdHN7L2dpc3RfaWR9IjtzOjExOiJzdGFycmVkX3VybCI7czo2MzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdGFycmVkey9vd25lcn17L3JlcG99IjtzOjE3OiJzdWJzY3JpcHRpb25zX3VybCI7czo1NDoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9zdWJzY3JpcHRpb25zIjtzOjE3OiJvcmdhbml6YXRpb25zX3VybCI7czo0NToiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9vcmdzIjtzOjk6InJlcG9zX3VybCI7czo0NjoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9yZXBvcyI7czoxMDoiZXZlbnRzX3VybCI7czo1NzoiaHR0cHM6Ly9hcGkuZ2l0aHViLmNvbS91c2Vycy9iYWJzZ29zZ2Vucy9ldmVudHN7L3ByaXZhY3l9IjtzOjE5OiJyZWNlaXZlZF9ldmVudHNfdXJsIjtzOjU2OiJodHRwczovL2FwaS5naXRodWIuY29tL3VzZXJzL2JhYnNnb3NnZW5zL3JlY2VpdmVkX2V2ZW50cyI7czo0OiJ0eXBlIjtzOjQ6IlVzZXIiO31zOjc6InBhcmVudHMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjM6e3M6Mzoic2hhIjtzOjQwOiJkM2UxNmI4NDRjOTQ4NjAwYzIxNGU2YjYxYjhlN2ZkNTFmZjNkYmFiIjtzOjM6InVybCI7czoxMDQ6Imh0dHBzOi8vYXBpLmdpdGh1Yi5jb20vcmVwb3MvYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0cy9kM2UxNmI4NDRjOTQ4NjAwYzIxNGU2YjYxYjhlN2ZkNTFmZjNkYmFiIjtzOjg6Imh0bWxfdXJsIjtzOjkzOiJodHRwczovL2dpdGh1Yi5jb20vYmFic2dvc2dlbnMvY3Jvc3NpbmdoaXBwb3MvY29tbWl0L2QzZTE2Yjg0NGM5NDg2MDBjMjE0ZTZiNjFiOGU3ZmQ1MWZmM2RiYWIiO319fQ==', '', 'https://github.com/babsgosgens/crossinghippos/commit/fa41b268b5d29dfb68d05cb2269ac9292accc1ef', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `flock_streams_apis`
--

DROP TABLE IF EXISTS `flock_streams_apis`;
CREATE TABLE IF NOT EXISTS `flock_streams_apis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `params` text NOT NULL,
  `language` char(7) NOT NULL DEFAULT '*',
  `state` tinyint(1) NOT NULL,
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idr` (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `parent_id_2` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `flock_streams_apis`
--

INSERT INTO `flock_streams_apis` (`id`, `parent_id`, `title`, `alias`, `params`, `language`, `state`, `publish_up`, `publish_down`) VALUES
(1, 0, 'Twitter', 'twitter', 'consumer_key=KSlsiPWpC50tBn2jLD8xQ\r\nconsumer_secret=BfFmluo0rnZp2I3H3XitCWhFvOqHHJFSGmMaTTvwN4\r\noauth_access_token=110107572-YMo8GKZ6ulzP1loyygnLTQUWx9dI681V4kU8LASv\r\noauth_access_token_secret=u1GpK5fNbI8POV9kY9lVbScLu6l331MEoDOJbJGqChY', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 0, 'Facebook', 'facebook', 'app_id=231110010232949\r\napp_secret=eedc870587dc39297be6fe57ab8f2b3d\r\napp_redirect=', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 0, 'Github', 'github', 'username=jeantje\r\npassword=jeangeheim\r\nrepository=crossinghippos', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 0, 'Dribbble', 'dribbble', 'username=babsgosgens', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 0, 'Flickr', 'flickr', 'key=ee4dd443e631ba1803cb8bb3a44aafb6\r\nsecret=5fd277f0c3f0cb42', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 0, 'Behance', 'behance', 'client_id=5tq3cGGMES1FqwDILUuxQ10u4vAX97uU\r\nclient_secret=BljHqQLFUl32Ji9mvuSpRDoRlzVgCqHW', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 0, 'Google+', 'googleplus', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 0, 'LinkedIn', 'linkedin', 'api_key=ex3babit93fp\r\nsecret_key=ShKaRn3ZdBdnXSNw\r\noauth_user_token=4e017b3a-27e1-470e-aad7-0364f27e1894\r\noauth_user_secret=efafac4a-3555-4a95-b7f0-2d3fff6fbe07', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `flock_tags`
--

DROP TABLE IF EXISTS `flock_tags`;
CREATE TABLE IF NOT EXISTS `flock_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
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
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `flock_tags`
--

INSERT INTO `flock_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 1, 0, '', 'ROOT', 'root', '', '', 1, 0, '0000-00-00 00:00:00', 1, '{}', '', '', '', 0, '2011-01-01 00:00:01', '', 0, '0000-00-00 00:00:00', '', '', 0, '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `flock_template_styles`
--

DROP TABLE IF EXISTS `flock_template_styles`;
CREATE TABLE IF NOT EXISTS `flock_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `flock_template_styles`
--

INSERT INTO `flock_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(4, 'beez3', 0, '0', 'Beez3 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(7, 'protostar', 0, '0', 'protostar - Default', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
(8, 'isis', 1, '1', 'isis - Default', '{"templateColor":"","logoFile":""}'),
(9, 'crossinghippos', 0, '0', 'Crossing Hippos - Default', '{"jQueryVersion":"1.10.2","webFontVersion":"1.4.8","webFontConfig":"google: { families: [ ''Asap:400,700,400italic,700italic:latin'' ] }"}'),
(10, 'babs', 0, '1', 'Crossing Hippos (Babs) - Default', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `flock_ucm_base`
--

DROP TABLE IF EXISTS `flock_ucm_base`;
CREATE TABLE IF NOT EXISTS `flock_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_ucm_base`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_ucm_content`
--

DROP TABLE IF EXISTS `flock_ucm_content`;
CREATE TABLE IF NOT EXISTS `flock_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(255) NOT NULL,
  `core_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `core_body` mediumtext NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) NOT NULL DEFAULT '',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int(10) unsigned DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the #__assets table.',
  `core_images` text NOT NULL,
  `core_urls` text NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text NOT NULL,
  `core_metadesc` text NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains core content data in name spaced fields' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `flock_ucm_content`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_updates`
--

DROP TABLE IF EXISTS `flock_updates`;
CREATE TABLE IF NOT EXISTS `flock_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Available Updates' AUTO_INCREMENT=53 ;

--
-- Dumping data for table `flock_updates`
--

INSERT INTO `flock_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`) VALUES
(1, 3, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '3.1.1.2', '', 'http://update.joomla.org/language/details3/ro-RO_details.xml', ''),
(2, 3, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/nl-BE_details.xml', ''),
(3, 3, 0, 'Chinese Traditional', '', 'pkg_zh-TW', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/zh-TW_details.xml', ''),
(4, 3, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/fr-FR_details.xml', ''),
(5, 3, 0, 'Galician', '', 'pkg_gl-ES', 'package', '', 0, '3.0.2.2', '', 'http://update.joomla.org/language/details3/gl-ES_details.xml', ''),
(6, 3, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/de-DE_details.xml', ''),
(7, 3, 0, 'Hebrew', '', 'pkg_he-IL', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/he-IL_details.xml', ''),
(8, 3, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/hu-HU_details.xml', ''),
(9, 3, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/af-ZA_details.xml', ''),
(10, 3, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/ar-AA_details.xml', ''),
(11, 3, 0, 'Belarusian', '', 'pkg_be-BY', 'package', '', 0, '3.0.2.1', '', 'http://update.joomla.org/language/details3/be-BY_details.xml', ''),
(12, 3, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '3.0.3.1', '', 'http://update.joomla.org/language/details3/bg-BG_details.xml', ''),
(13, 3, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/ca-ES_details.xml', ''),
(14, 3, 0, 'Chinese Simplified', '', 'pkg_zh-CN', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/zh-CN_details.xml', ''),
(15, 3, 0, 'Croatian', '', 'pkg_hr-HR', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/hr-HR_details.xml', ''),
(16, 3, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/cs-CZ_details.xml', ''),
(17, 3, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/da-DK_details.xml', ''),
(18, 3, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/nl-NL_details.xml', ''),
(19, 3, 0, 'English AU', '', 'pkg_en-AU', 'package', '', 0, '3.1.0.1', '', 'http://update.joomla.org/language/details3/en-AU_details.xml', ''),
(20, 3, 0, 'English US', '', 'pkg_en-US', 'package', '', 0, '3.1.0.1', '', 'http://update.joomla.org/language/details3/en-US_details.xml', ''),
(21, 3, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '3.0.2.1', '', 'http://update.joomla.org/language/details3/et-EE_details.xml', ''),
(22, 3, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/it-IT_details.xml', ''),
(23, 3, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/ja-JP_details.xml', ''),
(24, 3, 0, 'Korean', '', 'pkg_ko-KR', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/ko-KR_details.xml', ''),
(25, 3, 0, 'Kurdish Sorani', '', 'pkg_ckb-IQ', 'package', '', 0, '3.0.2.1', '', 'http://update.joomla.org/language/details3/ckb-IQ_details.xml', ''),
(26, 3, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/lv-LV_details.xml', ''),
(27, 3, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/mk-MK_details.xml', ''),
(28, 3, 0, 'Norwegian Bokmal', '', 'pkg_nb-NO', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/nb-NO_details.xml', ''),
(29, 3, 0, 'Persian', '', 'pkg_fa-IR', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/fa-IR_details.xml', ''),
(30, 3, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '3.1.4.2', '', 'http://update.joomla.org/language/details3/pl-PL_details.xml', ''),
(31, 3, 0, 'Portuguese', '', 'pkg_pt-PT', 'package', '', 0, '3.0.2.2', '', 'http://update.joomla.org/language/details3/pt-PT_details.xml', ''),
(32, 3, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/ru-RU_details.xml', ''),
(33, 3, 0, 'Scottish Gaelic', '', 'pkg_gd-GB', 'package', '', 0, '3.1.0.1', '', 'http://update.joomla.org/language/details3/gd-GB_details.xml', ''),
(34, 3, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '3.1.5.2', '', 'http://update.joomla.org/language/details3/sk-SK_details.xml', ''),
(35, 3, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/sv-SE_details.xml', ''),
(36, 3, 0, 'Syriac', '', 'pkg_sy-IQ', 'package', '', 0, '3.1.2.1', '', 'http://update.joomla.org/language/details3/sy-IQ_details.xml', ''),
(37, 3, 0, 'Tamil', '', 'pkg_ta-IN', 'package', '', 0, '3.1.5.2', '', 'http://update.joomla.org/language/details3/ta-IN_details.xml', ''),
(38, 3, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '3.1.4.2', '', 'http://update.joomla.org/language/details3/th-TH_details.xml', ''),
(39, 3, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/tr-TR_details.xml', ''),
(40, 3, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '3.1.4.4', '', 'http://update.joomla.org/language/details3/uk-UA_details.xml', ''),
(41, 3, 0, 'Uyghur', '', 'pkg_ug-CN', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/ug-CN_details.xml', ''),
(42, 3, 0, 'Albanian', '', 'pkg_sq-AL', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/sq-AL_details.xml', ''),
(43, 3, 0, 'Portuguese Brazil', '', 'pkg_pt-BR', 'package', '', 0, '3.0.3.1', '', 'http://update.joomla.org/language/details3/pt-BR_details.xml', ''),
(44, 3, 0, 'Serbian Latin', '', 'pkg_sr-YU', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/sr-YU_details.xml', ''),
(45, 3, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/es-ES_details.xml', ''),
(46, 3, 0, 'Bosnian', '', 'pkg_bs-BA', 'package', '', 0, '3.1.1.1', '', 'http://update.joomla.org/language/details3/bs-BA_details.xml', ''),
(47, 3, 0, 'Serbian Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/sr-RS_details.xml', ''),
(48, 3, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '3.0.3.1', '', 'http://update.joomla.org/language/details3/vi-VN_details.xml', ''),
(49, 3, 0, 'Bahasa Indonesia', '', 'pkg_id-ID', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/id-ID_details.xml', ''),
(50, 3, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '3.1.4.1', '', 'http://update.joomla.org/language/details3/fi-FI_details.xml', ''),
(51, 3, 0, 'Swahili', '', 'pkg_sw-KE', 'package', '', 0, '3.1.5.1', '', 'http://update.joomla.org/language/details3/sw-KE_details.xml', ''),
(52, 4, 0, 'ScriptMerge', '', 'scriptmerge', 'component', '', 0, '0.9.8', '', 'http://www.yireo.com/updates/com_scriptmerge.xml', 'http://www.yireo.com/software/joomla-extensions/scriptmerge');

-- --------------------------------------------------------

--
-- Table structure for table `flock_update_sites`
--

DROP TABLE IF EXISTS `flock_update_sites`;
CREATE TABLE IF NOT EXISTS `flock_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `type` varchar(20) DEFAULT '',
  `location` text NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Update Sites' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `flock_update_sites`
--

INSERT INTO `flock_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`) VALUES
(1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 1, 1379412277),
(2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1, 1379412277),
(3, 'Accredited Joomla! Translations', 'collection', 'http://update.joomla.org/language/translationlist_3.xml', 1, 1379412277),
(4, 'com_scriptmerge', 'extension', 'http://www.yireo.com/updates/com_scriptmerge.xml', 1, 1379412277),
(5, 'plg_system_scriptmerge', 'extension', 'http://www.yireo.com/updates/plg_system_scriptmerge.xml', 1, 1379412277);

-- --------------------------------------------------------

--
-- Table structure for table `flock_update_sites_extensions`
--

DROP TABLE IF EXISTS `flock_update_sites_extensions`;
CREATE TABLE IF NOT EXISTS `flock_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links extensions to update sites';

--
-- Dumping data for table `flock_update_sites_extensions`
--

INSERT INTO `flock_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 700),
(2, 700),
(3, 600),
(4, 10002),
(5, 10003);

-- --------------------------------------------------------

--
-- Table structure for table `flock_usergroups`
--

DROP TABLE IF EXISTS `flock_usergroups`;
CREATE TABLE IF NOT EXISTS `flock_usergroups` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `flock_usergroups`
--

INSERT INTO `flock_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 18, 'Public'),
(2, 1, 8, 15, 'Registered'),
(3, 2, 9, 14, 'Author'),
(4, 3, 10, 13, 'Editor'),
(5, 4, 11, 12, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 16, 17, 'Super Users'),
(9, 1, 2, 3, 'Guest');

-- --------------------------------------------------------

--
-- Table structure for table `flock_users`
--

DROP TABLE IF EXISTS `flock_users`;
CREATE TABLE IF NOT EXISTS `flock_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=626 ;

--
-- Dumping data for table `flock_users`
--

INSERT INTO `flock_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`) VALUES
(623, 'Super User', 'babsgosgens', 'babs@crossinghippos.nl', '5d6bbe9a857e194a3a63167eb861c8d6:vvZG3UYTXlWKftqNhnnQ4RSTG79PUhHH', 0, 1, '2013-09-13 11:16:48', '2013-09-18 07:22:47', '0', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0),
(624, 'Jean Brouwers', 'jeanbrouwers', 'jean@crossinghippos.nl', 'd4e3abb8df5921d76eabf3aa7bb4fbb4:QSY9KZVLQcsSjyIT0HL7O5xs1wMICMap', 0, 0, '2013-09-13 11:19:07', '0000-00-00 00:00:00', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0),
(625, 'Jelle van Grinsven', 'jellevangrinsven', 'jelle@crossinghippos.nl', 'd044df4f99dd0afb4316b1ca5af04418:xIbcy0AAtZED4etJGQ9Pcik3WFlNv7nG', 0, 0, '2013-09-13 11:20:01', '0000-00-00 00:00:00', '', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `flock_user_notes`
--

DROP TABLE IF EXISTS `flock_user_notes`;
CREATE TABLE IF NOT EXISTS `flock_user_notes` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `flock_user_notes`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_user_profiles`
--

DROP TABLE IF EXISTS `flock_user_profiles`;
CREATE TABLE IF NOT EXISTS `flock_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) NOT NULL,
  `profile_value` varchar(255) NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simple user profile storage table';

--
-- Dumping data for table `flock_user_profiles`
--


-- --------------------------------------------------------

--
-- Table structure for table `flock_user_usergroup_map`
--

DROP TABLE IF EXISTS `flock_user_usergroup_map`;
CREATE TABLE IF NOT EXISTS `flock_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_user_usergroup_map`
--

INSERT INTO `flock_user_usergroup_map` (`user_id`, `group_id`) VALUES
(623, 8),
(624, 2),
(624, 7),
(625, 2),
(625, 7);

-- --------------------------------------------------------

--
-- Table structure for table `flock_viewlevels`
--

DROP TABLE IF EXISTS `flock_viewlevels`;
CREATE TABLE IF NOT EXISTS `flock_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `flock_viewlevels`
--

INSERT INTO `flock_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 1, '[6,2,8]'),
(3, 'Special', 2, '[6,3,8]'),
(5, 'Guest', 0, '[9]');

-- --------------------------------------------------------

--
-- Table structure for table `flock_weblinks`
--

DROP TABLE IF EXISTS `flock_weblinks`;
CREATE TABLE IF NOT EXISTS `flock_weblinks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
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
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `images` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `flock_weblinks`
--

