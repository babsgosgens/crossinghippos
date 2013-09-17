-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 17, 2013 at 02:39 PM
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10010 ;

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
(10009, 'com_streams', 'component', 'com_streams', '', 1, 1, 1, 0, '{"name":"com_streams","type":"component","creationDate":"September 2013","author":"Babs Gosgens","copyright":"(C) 2010 - 2013 Crossing Hippos. All rights reserved.\\n\\t","authorEmail":"babs@crossinghippos.nl","authorUrl":"www.crossinghippos.nl","version":"3.0.0","description":"COM_STREAMS_XML_DESCRIPTION","group":""}', '{}', '', '', 0, '0000-00-00 00:00:00', 0, 0);

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
('qhv8o4cm15mkfrgnbmfk65fjk6', 1, 0, '1379421013', '__default|a:8:{s:15:"session.counter";i:204;s:19:"session.timer.start";i:1379402315;s:18:"session.timer.last";i:1379421012;s:17:"session.timer.now";i:1379421013;s:22:"session.client.browser";s:119:"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.62 Safari/537.36";s:8:"registry";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":4:{s:11:"application";O:8:"stdClass":1:{s:4:"lang";s:0:"";}s:13:"com_installer";O:8:"stdClass":2:{s:7:"message";s:0:"";s:17:"extension_message";s:0:"";}s:11:"com_streams";O:8:"stdClass":1:{s:7:"streams";O:8:"stdClass":3:{s:8:"ordercol";N;s:10:"limitstart";s:1:"0";s:9:"orderdirn";s:0:"";}}s:9:"com_cache";O:8:"stdClass":1:{s:5:"cache";O:8:"stdClass":4:{s:8:"ordercol";s:5:"group";s:6:"filter";O:8:"stdClass":1:{s:9:"client_id";i:0;}s:10:"limitstart";s:1:"0";s:9:"orderdirn";s:3:"asc";}}}}s:4:"user";O:5:"JUser":24:{s:9:"\\0\\0\\0isRoot";b:1;s:2:"id";s:3:"623";s:4:"name";s:10:"Super User";s:8:"username";s:11:"babsgosgens";s:5:"email";s:22:"babs@crossinghippos.nl";s:8:"password";s:65:"5d6bbe9a857e194a3a63167eb861c8d6:vvZG3UYTXlWKftqNhnnQ4RSTG79PUhHH";s:14:"password_clear";s:0:"";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:12:"registerDate";s:19:"2013-09-13 11:16:48";s:13:"lastvisitDate";s:19:"2013-09-17 06:49:41";s:10:"activation";s:1:"0";s:6:"params";s:92:"{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}";s:6:"groups";a:1:{i:8;s:1:"8";}s:5:"guest";i:0;s:13:"lastResetTime";s:19:"0000-00-00 00:00:00";s:10:"resetCount";s:1:"0";s:10:"\\0\\0\\0_params";O:9:"JRegistry":1:{s:7:"\\0\\0\\0data";O:8:"stdClass":6:{s:11:"admin_style";s:0:"";s:14:"admin_language";s:0:"";s:8:"language";s:0:"";s:6:"editor";s:0:"";s:8:"helpsite";s:0:"";s:8:"timezone";s:0:"";}}s:14:"\\0\\0\\0_authGroups";a:2:{i:0;i:1;i:1;i:8;}s:14:"\\0\\0\\0_authLevels";a:4:{i:0;i:1;i:1;i:1;i:2;i:2;i:3;i:3;}s:15:"\\0\\0\\0_authActions";N;s:12:"\\0\\0\\0_errorMsg";N;s:10:"\\0\\0\\0_errors";a:0:{}s:3:"aid";i:0;}s:13:"session.token";s:32:"f88c7e7cb438edb7c47ca9176c0f11b8";}__oauth_token|a:2:{s:3:"key";s:41:"Fmc5HBEULcXryTGio3aoTi4qMGoWfpcI5n6Ni7LVA";s:6:"secret";s:42:"R8GDa0aKDRNiBUZhgXUHIbntJB7TJ8mW65QGPq6U60";}', 623, 'babsgosgens');

-- --------------------------------------------------------

--
-- Table structure for table `flock_streams`
--

DROP TABLE IF EXISTS `flock_streams`;
CREATE TABLE IF NOT EXISTS `flock_streams` (
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
  KEY `api_id` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_streams`
--

INSERT INTO `flock_streams` (`api_id`, `post_id`, `date_created`, `raw`, `metadata`, `permalink`, `params`, `language`, `state`, `publish_up`, `publish_down`) VALUES
(2, '100002043048057_501221883289242', '2013-08-14 13:00:54', 'Tzo4OiJzdGRDbGFzcyI6MTc6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MDEyMjE4ODMyODkyNDIiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6NzU6IkhvdyB0byB1c2UgUGVyc2lzdGFudCBHcmlkIGluIHlvdXIgI0NvbXBhc3MgcHJvamVjdDogaHR0cDovL3QuY28vMUNCNmxTS25BcSI7czo3OiJwaWN0dXJlIjtzOjIwMjoiaHR0cHM6Ly9mYmV4dGVybmFsLWEuYWthbWFpaGQubmV0L2FwcF9mdWxsX3Byb3h5LnBocD9hcHA9MjIzMTc3NzU0MyZ2PTEmc2l6ZT16JmNrc3VtPTlhZjllZDA2OWI4N2QzNTRjNjQxNWFjZmI4YjdmMWY1JnNyYz1odHRwcyUzQSUyRiUyRnMzLmFtYXpvbmF3cy5jb20lMkZnaXRodWIlMkZyaWJib25zJTJGZm9ya21lX3JpZ2h0X2dyYXlfNmQ2ZDZkLnBuZyI7czo0OiJsaW5rIjtzOjIyOiJodHRwOi8vdC5jby8xQ0I2bFNLbkFxIjtzOjQ6Im5hbWUiO3M6MjU6IlBlcnNpc3RlbnQgR3JpZCDimaUgU3RhcnQiO3M6NzoiY2FwdGlvbiI7czoxODoicGVyc2lzdGVudGdyaWQuY29tIjtzOjExOiJkZXNjcmlwdGlvbiI7czoxMzU6IlBlcnNpc3RlbnQgR3JpZCBpcyBhIG1vZHVsYXIgQ1NTIGZyYW1ld29yayBidWlsdCB3aXRoIFNBU1MgYW5kIENvbXBhc3MuIEl0IGJhc2ljYWxseSBjb21lcyBpbiB0aHJlZSBmbGF2b3VyczogR3JpZCwgQmFzZSBhbmQgRnJhbWV3b3JrLiI7czo0OiJpY29uIjtzOjk0OiJodHRwczovL2ZiY2RuLXBob3Rvcy1jLWEuYWthbWFpaGQubmV0L2hwaG90b3MtYWstcHJuMS84NTE1NjVfMTAxNTEzOTc5MTE5Njc1NDRfNjMyNTI1NTgzX24ucG5nIjtzOjc6ImFjdGlvbnMiO2E6Mjp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czo3OiJDb21tZW50IjtzOjQ6ImxpbmsiO3M6NjI6Imh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS8xMDAwMDIwNDMwNDgwNTcvcG9zdHMvNTAxMjIxODgzMjg5MjQyIjt9aToxO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czoyNjoiQHBlcnNpc3RlbnRncmlkIG9uIFR3aXR0ZXIiO3M6NDoibGluayI7czoxMjE6Imh0dHBzOi8vdHdpdHRlci5jb20vcGVyc2lzdGVudGdyaWQ/dXRtX3NvdXJjZT1mYiZ1dG1fbWVkaXVtPWZiJnV0bV9jYW1wYWlnbj1wZXJzaXN0ZW50Z3JpZCZ1dG1fY29udGVudD0zNjc2MzE5MDYzNjk1ODEwNTYiO319czo3OiJwcml2YWN5IjtPOjg6InN0ZENsYXNzIjoxOntzOjU6InZhbHVlIjtzOjA6IiI7fXM6NDoidHlwZSI7czo0OiJsaW5rIjtzOjExOiJzdGF0dXNfdHlwZSI7czoxNzoiYXBwX2NyZWF0ZWRfc3RvcnkiO3M6MTE6ImFwcGxpY2F0aW9uIjtPOjg6InN0ZENsYXNzIjozOntzOjQ6Im5hbWUiO3M6NzoiVHdpdHRlciI7czo5OiJuYW1lc3BhY2UiO3M6NzoidHdpdHRlciI7czoyOiJpZCI7czoxMDoiMjIzMTc3NzU0MyI7fXM6MTI6ImNyZWF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOC0xNFQxMzowMDo1NCswMDAwIjtzOjEyOiJ1cGRhdGVkX3RpbWUiO3M6MjQ6IjIwMTMtMDgtMTRUMTM6MDA6NTQrMDAwMCI7czo1OiJsaWtlcyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJkYXRhIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6MTI6IkphbiBHw7ZzZ2VucyI7czoyOiJpZCI7czoxNToiMTAwMDAyNDk4MDc2NjEyIjt9fXM6NToiY291bnQiO2k6MTt9fQ==', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '100002043048057_501773916567372', '2013-08-15 20:35:35', 'Tzo4OiJzdGRDbGFzcyI6MTY6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MDE3NzM5MTY1NjczNzIiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6NTY6Ildvcmtpbmcgb24gY29uZmlndXJhYmxlIGJ1dHRvbnM6IGh0dHBzOi8vdC5jby9zdEhqZmVLeVM5IjtzOjc6InBpY3R1cmUiO3M6MjEwOiJodHRwczovL2ZiZXh0ZXJuYWwtYS5ha2FtYWloZC5uZXQvYXBwX2Z1bGxfcHJveHkucGhwP2FwcD0yMjMxNzc3NTQzJnY9MSZzaXplPXomY2tzdW09MzgyZjM4NmJhOTZiMzAzZDY4NWU2ZGFjZmZlNmQ4NjYmc3JjPWh0dHBzJTNBJTJGJTJGZ2l0aHViLmdsb2JhbC5zc2wuZmFzdGx5Lm5ldCUyRmltYWdlcyUyRm1vZHVsZXMlMkZsb2dvc19wYWdlJTJGT2N0b2NhdC5wbmciO3M6NDoibGluayI7czoyMzoiaHR0cHM6Ly90LmNvL3N0SGpmZUt5UzkiO3M6NDoibmFtZSI7czoxNDoicGVyc2lzdGVudGdyaWQiO3M6NzoiY2FwdGlvbiI7czoxMDoiZ2l0aHViLmNvbSI7czoxMToiZGVzY3JpcHRpb24iO3M6ODA6InBlcnNpc3RlbnRncmlkIC0gQSBsaWdodHdlaWdodCBhbmQgZmxleGlibGUgZ3JpZC4gUmVzcG9uc2l2ZS4gT3Igbm90LiBZb3VyIGNhbGwuIjtzOjQ6Imljb24iO3M6OTQ6Imh0dHBzOi8vZmJjZG4tcGhvdG9zLWMtYS5ha2FtYWloZC5uZXQvaHBob3Rvcy1hay1wcm4xLzg1MTU2NV8xMDE1MTM5NzkxMTk2NzU0NF82MzI1MjU1ODNfbi5wbmciO3M6NzoiYWN0aW9ucyI7YToyOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjc6IkNvbW1lbnQiO3M6NDoibGluayI7czo2MjoiaHR0cHM6Ly93d3cuZmFjZWJvb2suY29tLzEwMDAwMjA0MzA0ODA1Ny9wb3N0cy81MDE3NzM5MTY1NjczNzIiO31pOjE7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjI2OiJAcGVyc2lzdGVudGdyaWQgb24gVHdpdHRlciI7czo0OiJsaW5rIjtzOjEyMToiaHR0cHM6Ly90d2l0dGVyLmNvbS9wZXJzaXN0ZW50Z3JpZD91dG1fc291cmNlPWZiJnV0bV9tZWRpdW09ZmImdXRtX2NhbXBhaWduPXBlcnNpc3RlbnRncmlkJnV0bV9jb250ZW50PTM2ODEwODcwOTExMDUwMTM3NiI7fX1zOjc6InByaXZhY3kiO086ODoic3RkQ2xhc3MiOjE6e3M6NToidmFsdWUiO3M6MDoiIjt9czo0OiJ0eXBlIjtzOjQ6ImxpbmsiO3M6MTE6InN0YXR1c190eXBlIjtzOjE3OiJhcHBfY3JlYXRlZF9zdG9yeSI7czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czo3OiJUd2l0dGVyIjtzOjk6Im5hbWVzcGFjZSI7czo3OiJ0d2l0dGVyIjtzOjI6ImlkIjtzOjEwOiIyMjMxNzc3NTQzIjt9czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTE1VDIwOjM1OjM1KzAwMDAiO3M6MTI6InVwZGF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOC0xNVQyMDozNTozNSswMDAwIjt9', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '100002043048057_501930176551746', '2013-08-19 07:37:36', 'Tzo4OiJzdGRDbGFzcyI6MjA6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MDE5MzAxNzY1NTE3NDYiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6MTk6Ik1lIGxpa2VzIHB1cHBpZXMgOikiO3M6NToic3RvcnkiO3M6NDM6IkJhYnMgR8O2c2dlbnMgc2hhcmVkIE9tZyBUZWVucyDhg6YncyBwaG90by4iO3M6NzoicGljdHVyZSI7czo5MjoiaHR0cHM6Ly9mYmNkbi1waG90b3MtYy1hLmFrYW1haWhkLm5ldC9ocGhvdG9zLWFrLXBybjEvNjEyNTJfMzc3NTI0NzcyMzc2ODMwXzEwODE3NTI1NTBfcy5qcGciO3M6NDoibGluayI7czoxMDY6Imh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS9waG90by5waHA/ZmJpZD0zNzc1MjQ3NzIzNzY4MzAmc2V0PWEuMjkwMzAwNjMxMDk5MjQ1LjY3NTY2LjI5MDI5OTQxNzc2NjAzMyZ0eXBlPTEiO3M6NDoibmFtZSI7czoxNToiVGltZWxpbmUgUGhvdG9zIjtzOjc6ImNhcHRpb24iO3M6MTE6Ikxpa2UgLSBjdXRlIjtzOjEwOiJwcm9wZXJ0aWVzIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjozOntzOjQ6Im5hbWUiO3M6MjoiQnkiO3M6NDoidGV4dCI7czoxMzoiT21nIFRlZW5zIOGDpiI7czo0OiJocmVmIjtzOjc3OiJodHRwczovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvT21nLVRlZW5zLSVFMSU4MyVBNi8yOTAyOTk0MTc3NjYwMzM/cmVmPXN0cmVhbSI7fX1zOjQ6Imljb24iO3M6NjQ6Imh0dHBzOi8vZmJzdGF0aWMtYS5ha2FtYWloZC5uZXQvcnNyYy5waHAvdjIveUQvci9hUzhlY21ZUnlzMC5naWYiO3M6NzoiYWN0aW9ucyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjc6IkNvbW1lbnQiO3M6NDoibGluayI7czo2MjoiaHR0cHM6Ly93d3cuZmFjZWJvb2suY29tLzEwMDAwMjA0MzA0ODA1Ny9wb3N0cy81MDE5MzAxNzY1NTE3NDYiO319czo3OiJwcml2YWN5IjtPOjg6InN0ZENsYXNzIjoxOntzOjU6InZhbHVlIjtzOjA6IiI7fXM6NDoidHlwZSI7czo1OiJwaG90byI7czoxMToic3RhdHVzX3R5cGUiO3M6MTI6InNoYXJlZF9zdG9yeSI7czo5OiJvYmplY3RfaWQiO3M6MTU6IjM3NzUyNDc3MjM3NjgzMCI7czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NDoibmFtZSI7czoxNzoiRmFjZWJvb2sgZm9yIGlQYWQiO3M6OToibmFtZXNwYWNlIjtzOjc6ImZiaXBhZF8iO3M6MjoiaWQiO3M6MTU6IjE3Mzg0NzY0MjY3MDM3MCI7fXM6MTI6ImNyZWF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOC0xNlQwNjoxODoyNyswMDAwIjtzOjEyOiJ1cGRhdGVkX3RpbWUiO3M6MjQ6IjIwMTMtMDgtMTlUMDc6Mzc6MzYrMDAwMCI7czo1OiJsaWtlcyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJkYXRhIjthOjI6e2k6MDtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6MTU6IkNhcm9saW5lIENhbW1lbCI7czoyOiJpZCI7czoxNToiMTAwMDA1NjM4MjczNzk4Ijt9aToxO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czoxNzoiWWFvIFZhbiBMYW5kZXdpamsiO3M6MjoiaWQiO3M6OToiNjE5MzQxODQ1Ijt9fXM6NToiY291bnQiO2k6Mjt9czo4OiJjb21tZW50cyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJkYXRhIjthOjU6e2k6MDtPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtzOjI0OiI1MDE5MzAxNzY1NTE3NDZfNzI4NjgwMjEiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJLaXR0eSBNdWxkZXJzIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIxNjg1NzU5MTkiO31zOjc6Im1lc3NhZ2UiO3M6NTY6ImxhY2hlbiBsZXVrIGhvb3IsIGxpamt0IHdlbCBvZiB6ZSBhYW4gZWVuIGJvcnJlbCBkcmlua2VuIjtzOjEwOiJjYW5fcmVtb3ZlIjtiOjE7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTE2VDA2OjI2OjMzKzAwMDAiO3M6MTA6Imxpa2VfY291bnQiO2k6MDtzOjEwOiJ1c2VyX2xpa2VzIjtiOjA7fWk6MTtPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtzOjI0OiI1MDE5MzAxNzY1NTE3NDZfNzI4NjgwNTkiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6NDQ6IkVuIHpvIHRlIHppZW4gaGViYmVuIHplIGVyIGFsIGVlbiBwYWFyIG9wIDopIjtzOjEwOiJjYW5fcmVtb3ZlIjtiOjE7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTE2VDA3OjE2OjAzKzAwMDAiO3M6MTA6Imxpa2VfY291bnQiO2k6MTtzOjEwOiJ1c2VyX2xpa2VzIjtiOjA7fWk6MjtPOjg6InN0ZENsYXNzIjo4OntzOjI6ImlkIjtzOjI0OiI1MDE5MzAxNzY1NTE3NDZfNzI4NjgzODkiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjE0OiJDaGlhcmEgQWxpb3R0YSI7czoyOiJpZCI7czoxNToiMTAwMDAxNTcyMDY0NTM0Ijt9czo3OiJtZXNzYWdlIjtzOjYxOiJCYWJzLCBpZiB5b3UgaGFkIDUgbGlrZSBteSBjYXQgeW91IHdvdWxkIGNhbGwgZm9yIGJhbmtydXB0Y3khIjtzOjEyOiJtZXNzYWdlX3RhZ3MiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjU6e3M6MjoiaWQiO3M6MTU6IjEwMDAwMjA0MzA0ODA1NyI7czo0OiJuYW1lIjtzOjQ6IkJhYnMiO3M6NDoidHlwZSI7czo0OiJ1c2VyIjtzOjY6Im9mZnNldCI7aTowO3M6NjoibGVuZ3RoIjtpOjQ7fX1zOjEwOiJjYW5fcmVtb3ZlIjtiOjE7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTE2VDEyOjUxOjI5KzAwMDAiO3M6MTA6Imxpa2VfY291bnQiO2k6MTtzOjEwOiJ1c2VyX2xpa2VzIjtiOjE7fWk6MztPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtzOjI0OiI1MDE5MzAxNzY1NTE3NDZfNzI4Njg3NTUiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6MTUxOiJJIGhhZCBhIGxpdHRlciBvbmNlLi4uIEZvdXIgaGVhbHRoeSBvbmVzIGFuZCBvbmUgZGVhZCBvbmUgOiggVGhleSB3ZXJlIGFkb3JhYmxlIGJ1dCBURyB3ZSBoYWQgaG91c2VrZWVwaW5nIC0gdGhvc2UgdGlueSBwdXBwaWVzIGNhbiBtYWtlIGEgaHVnZSBtZXNzIDspIjtzOjEwOiJjYW5fcmVtb3ZlIjtiOjE7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTE2VDE3OjExOjU1KzAwMDAiO3M6MTA6Imxpa2VfY291bnQiO2k6MDtzOjEwOiJ1c2VyX2xpa2VzIjtiOjA7fWk6NDtPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtzOjI0OiI1MDE5MzAxNzY1NTE3NDZfNzI4NzM5NDgiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjE1OiJDYXJvbGluZSBDYW1tZWwiO3M6MjoiaWQiO3M6MTU6IjEwMDAwNTYzODI3Mzc5OCI7fXM6NzoibWVzc2FnZSI7czoxODoiU2NoYXR0aWchISEhISHzvq6XIjtzOjEwOiJjYW5fcmVtb3ZlIjtiOjE7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTE5VDA3OjM3OjM2KzAwMDAiO3M6MTA6Imxpa2VfY291bnQiO2k6MDtzOjEwOiJ1c2VyX2xpa2VzIjtiOjA7fX1zOjY6InBhZ2luZyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo3OiJjdXJzb3JzIjtPOjg6InN0ZENsYXNzIjoyOntzOjU6ImFmdGVyIjtzOjQ6Ik5RPT0iO3M6NjoiYmVmb3JlIjtzOjQ6Ik1RPT0iO319fX0=', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '100002043048057_502128869865210', '2013-08-16 19:38:50', 'Tzo4OiJzdGRDbGFzcyI6MTY6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MDIxMjg4Njk4NjUyMTAiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6MTA4OiJNeSBzb24gd291bGQgbG92ZSB0aGVzZSA6KSBodHRwOi8vaG90cGVuZ3Vpbi5uZXQvZGVzcGljYWJsZS1tZS1taW5pb25zLWRyZXNzZWQtdXAtYXMtcG9wLWN1bHR1cmUtY2hhcmFjdGVycy8iO3M6NzoicGljdHVyZSI7czoyMTQ6Imh0dHBzOi8vZmJleHRlcm5hbC1hLmFrYW1haWhkLm5ldC9zYWZlX2ltYWdlLnBocD9kPUFRRFFyU1Fqd1pVRGlac2Emdz0xNTQmaD0xNTQmdXJsPWh0dHAlM0ElMkYlMkZob3RwZW5ndWluLm5ldCUyRndwLWNvbnRlbnQlMkZ1cGxvYWRzJTJGMjAxMyUyRjA4JTJGRGVzcGljYWJsZS1NZS1NaW5pb25zLURyZXNzZWQtVXAtYXMtUG9wLUN1bHR1cmUtQ2hhcmFjdGVycy0xNi5qcGciO3M6NDoibGluayI7czo4MToiaHR0cDovL2hvdHBlbmd1aW4ubmV0L2Rlc3BpY2FibGUtbWUtbWluaW9ucy1kcmVzc2VkLXVwLWFzLXBvcC1jdWx0dXJlLWNoYXJhY3RlcnMvIjtzOjQ6Im5hbWUiO3M6NTg6IkRlc3BpY2FibGUgTWUgTWluaW9ucyBEcmVzc2VkIFVwIGFzIFBvcCBDdWx0dXJlIENoYXJhY3RlcnMiO3M6NzoiY2FwdGlvbiI7czoxNDoiaG90cGVuZ3Vpbi5uZXQiO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjMwNzoiV2hldGhlciB5b3XigJl2ZSBzZWVuIHRoZSBzZXF1ZWwgdG8gRGVzcGljYWJsZSBNZSBvciBub3QsIGNoYW5jZXMgYXJlIGdvb2QgeW91IGtub3cgZXhhY3RseSB3aG8gdGhlIE1pbmlvbnMgYXJlLiBUaGVzZSB5ZWxsb3cgY29sb3JlZCwgY3lsaW5kZXIgc2hhcGVkIGNyZWF0dXJlcyBhcmUgdGhlIG1vc3Qgbm90YWJsZSBjaGFyYWN0ZXJzIGZyb20gdGhlIGZpbG0sIGFuZCB3ZeKAmXZlIGRlZmluaXRlbHkgYmVlbiBpbmZhdHVhdGVkIHdpdGggdGhlbSBzaW5jZSB0aGUgb3JpZ2luYWwgbW92aWUgaGl0IHRoZSBiaWcgc2NyZWVuIGJhYy4uLiI7czo0OiJpY29uIjtzOjY0OiJodHRwczovL2Zic3RhdGljLWEuYWthbWFpaGQubmV0L3JzcmMucGhwL3YyL3lEL3IvYVM4ZWNtWVJ5czAuZ2lmIjtzOjc6ImFjdGlvbnMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czo3OiJDb21tZW50IjtzOjQ6ImxpbmsiO3M6NjI6Imh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS8xMDAwMDIwNDMwNDgwNTcvcG9zdHMvNTAyMTI4ODY5ODY1MjEwIjt9fXM6NzoicHJpdmFjeSI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJ2YWx1ZSI7czowOiIiO31zOjQ6InR5cGUiO3M6NDoibGluayI7czoxMToic3RhdHVzX3R5cGUiO3M6MTI6InNoYXJlZF9zdG9yeSI7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTE2VDE5OjM4OjUwKzAwMDAiO3M6MTI6InVwZGF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOC0xNlQxOTozODo1MCswMDAwIjtzOjU6Imxpa2VzIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImRhdGEiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czoxMToiSmFkaWUgVmFsa2UiO3M6MjoiaWQiO3M6MTU6IjEwMDAwMjY4NzI0ODE0NyI7fX1zOjU6ImNvdW50IjtpOjE7fX0=', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '100002043048057_502130456531718', '2013-08-17 08:42:31', 'Tzo4OiJzdGRDbGFzcyI6MTU6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MDIxMzA0NTY1MzE3MTgiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6MjA5OiJBbG1vc3QgdW5yZWFsOiB0aGVzZSBwZXRhbHMgbG9vayBsaWtlIGFjdHVhbCBmZWF0aGVycyEgVHVsaXBzIGFyZSBiZWF1dGlmdWwgOikgaHR0cDovL3d3dy5mbG93ZXJtdXNlLmNvbS9tZWRpYS9jYXRhbG9nL3Byb2R1Y3QvY2FjaGUvMS9pbWFnZS85ZGY3OGVhYjMzNTI1ZDA4ZDZlNWZiOGQyNzEzNmU5NS9kL2EvZGFyay1wdXJwbGUtcGFycm90LXR1bGlwcy0xLmpwZyI7czo3OiJwaWN0dXJlIjtzOjI0MDoiaHR0cHM6Ly9mYmV4dGVybmFsLWEuYWthbWFpaGQubmV0L3NhZmVfaW1hZ2UucGhwP2Q9QVFCNDhTQXJGbmZiRWM1RSZ3PTE1NCZoPTE1NCZ1cmw9aHR0cCUzQSUyRiUyRnd3dy5mbG93ZXJtdXNlLmNvbSUyRm1lZGlhJTJGY2F0YWxvZyUyRnByb2R1Y3QlMkZjYWNoZSUyRjElMkZpbWFnZSUyRjlkZjc4ZWFiMzM1MjVkMDhkNmU1ZmI4ZDI3MTM2ZTk1JTJGZCUyRmElMkZkYXJrLXB1cnBsZS1wYXJyb3QtdHVsaXBzLTEuanBnIjtzOjQ6ImxpbmsiO3M6MTMwOiJodHRwOi8vd3d3LmZsb3dlcm11c2UuY29tL21lZGlhL2NhdGFsb2cvcHJvZHVjdC9jYWNoZS8xL2ltYWdlLzlkZjc4ZWFiMzM1MjVkMDhkNmU1ZmI4ZDI3MTM2ZTk1L2QvYS9kYXJrLXB1cnBsZS1wYXJyb3QtdHVsaXBzLTEuanBnIjtzOjQ6Im5hbWUiO3M6MTAwOiJodHRwOi8vd3d3LmZsb3dlcm11c2UuY29tL21lZGlhL2NhdGFsb2cvcHJvZHVjdC9jYWNoZS8xL2ltYWdlLzlkZjc4ZWFiMzM1MjVkMDhkNmU1ZmI4ZDI3MTM2ZTk1L2QvYS9kIjtzOjc6ImNhcHRpb24iO3M6MTg6Ind3dy5mbG93ZXJtdXNlLmNvbSI7czo0OiJpY29uIjtzOjY0OiJodHRwczovL2Zic3RhdGljLWEuYWthbWFpaGQubmV0L3JzcmMucGhwL3YyL3l6L3IvU3RFaDNSaFB2amsuZ2lmIjtzOjc6ImFjdGlvbnMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czo3OiJDb21tZW50IjtzOjQ6ImxpbmsiO3M6NjI6Imh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS8xMDAwMDIwNDMwNDgwNTcvcG9zdHMvNTAyMTMwNDU2NTMxNzE4Ijt9fXM6NzoicHJpdmFjeSI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJ2YWx1ZSI7czowOiIiO31zOjQ6InR5cGUiO3M6NDoibGluayI7czoxMToic3RhdHVzX3R5cGUiO3M6MTI6InNoYXJlZF9zdG9yeSI7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTE2VDE5OjQ0OjMwKzAwMDAiO3M6MTI6InVwZGF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOC0xN1QwODo0MjozMSswMDAwIjtzOjg6ImNvbW1lbnRzIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImRhdGEiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjc6e3M6MjoiaWQiO3M6MjQ6IjUwMjEzMDQ1NjUzMTcxOF83Mjg3MDE3NCI7czo0OiJmcm9tIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6MTM6IkJhYnMgR8O2c2dlbnMiO3M6MjoiaWQiO3M6MTU6IjEwMDAwMjA0MzA0ODA1NyI7fXM6NzoibWVzc2FnZSI7czo2MzoiaHR0cDovL2Zsb3dlcnBpY3MubmV0L3dwLWNvbnRlbnQvdXBsb2Fkcy8yMDExLzEwL1R1bGlwLTAwNDAuanBnIjtzOjEwOiJjYW5fcmVtb3ZlIjtiOjE7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTE3VDA4OjQyOjMxKzAwMDAiO3M6MTA6Imxpa2VfY291bnQiO2k6MDtzOjEwOiJ1c2VyX2xpa2VzIjtiOjA7fX1zOjY6InBhZ2luZyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo3OiJjdXJzb3JzIjtPOjg6InN0ZENsYXNzIjoyOntzOjU6ImFmdGVyIjtzOjQ6Ik1RPT0iO3M6NjoiYmVmb3JlIjtzOjQ6Ik1RPT0iO319fX0=', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '100002043048057_506947236050040', '2013-08-29 06:01:39', 'Tzo4OiJzdGRDbGFzcyI6MjA6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MDY5NDcyMzYwNTAwNDAiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6MzI6IkEgcGFydGluZyBnaWZ0IGZyb20gbXkgaW50ZXJuIDopIjtzOjU6InN0b3J5IjtzOjQ1OiJCYWJzIEfDtnNnZW5zIHNoYXJlZCBDcm9zc2luZyBIaXBwb3MncyBwaG90by4iO3M6NzoicGljdHVyZSI7czo5NDoiaHR0cHM6Ly9mYmNkbi1waG90b3MtZS1hLmFrYW1haWhkLm5ldC9ocGhvdG9zLWFrLXBybjIvOTcxNjQ2XzEwMTUxODAzMjU2ODk5MTkwXzc4NDI4MDMyOV9zLmpwZyI7czo0OiJsaW5rIjtzOjExMjoiaHR0cHM6Ly93d3cuZmFjZWJvb2suY29tL3Bob3RvLnBocD9mYmlkPTEwMTUxODAzMjU2ODk5MTkwJnNldD1hLjEwMTUxODAzMjU2ODc5MTkwLjEwNzM3NDE4MjUuMzU0NTc5Mzk0MTg5JnR5cGU9MSI7czo0OiJuYW1lIjtzOjE1OiJUaW1lbGluZSBQaG90b3MiO3M6NzoiY2FwdGlvbiI7czozNzoiQSBsaXR0bGUgcGFydGluZyBnaWZ0IGZyb20gbXkgaW50ZXJuOiI7czoxMDoicHJvcGVydGllcyI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjI6IkJ5IjtzOjQ6InRleHQiO3M6MTU6IkNyb3NzaW5nIEhpcHBvcyI7czo0OiJocmVmIjtzOjcwOiJodHRwczovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvQ3Jvc3NpbmctSGlwcG9zLzM1NDU3OTM5NDE4OT9yZWY9c3RyZWFtIjt9fXM6NDoiaWNvbiI7czo2NDoiaHR0cHM6Ly9mYnN0YXRpYy1hLmFrYW1haWhkLm5ldC9yc3JjLnBocC92Mi95RC9yL2FTOGVjbVlSeXMwLmdpZiI7czo3OiJhY3Rpb25zIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6NzoiQ29tbWVudCI7czo0OiJsaW5rIjtzOjYyOiJodHRwczovL3d3dy5mYWNlYm9vay5jb20vMTAwMDAyMDQzMDQ4MDU3L3Bvc3RzLzUwNjk0NzIzNjA1MDA0MCI7fX1zOjc6InByaXZhY3kiO086ODoic3RkQ2xhc3MiOjE6e3M6NToidmFsdWUiO3M6MDoiIjt9czo0OiJ0eXBlIjtzOjU6InBob3RvIjtzOjExOiJzdGF0dXNfdHlwZSI7czoxMjoic2hhcmVkX3N0b3J5IjtzOjk6Im9iamVjdF9pZCI7czoxNzoiMTAxNTE4MDMyNTY4OTkxOTAiO3M6MTE6ImFwcGxpY2F0aW9uIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6NjoiUGhvdG9zIjtzOjI6ImlkIjtzOjEwOiIyMzA1MjcyNzMyIjt9czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA4LTI4VDEyOjU4OjQ1KzAwMDAiO3M6MTI6InVwZGF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOC0yOVQwNjowMTozOSswMDAwIjtzOjU6Imxpa2VzIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImRhdGEiO2E6NDp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czoxNDoiTW9uaXF1ZSBHZWVsZW4iO3M6MjoiaWQiO3M6MTU6IjEwMDAwMDYxNDMxODQxNyI7fWk6MTtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6MTA6IlJvYiBHZWVsZW4iO3M6MjoiaWQiO3M6MTU6IjEwMDAwMDYzNzEzNzIwOSI7fWk6MjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6MTk6IkV2ZWxpZW4gdmFuIExlZXV3ZW4iO3M6MjoiaWQiO3M6MTU6IjEwMDAwMjQ4NDQxNjI0MCI7fWk6MztPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6MTY6Ik1hcmllLWFubmUgTWVsaXMiO3M6MjoiaWQiO3M6MTU6IjEwMDAwMTcwODExMTQ1NCI7fX1zOjU6ImNvdW50IjtpOjEwO31zOjg6ImNvbW1lbnRzIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImRhdGEiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjc6e3M6MjoiaWQiO3M6MjQ6IjUwNjk0NzIzNjA1MDA0MF83Mjg5NjEwNiI7czo0OiJmcm9tIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6MTQ6IkNoaWFyYSBBbGlvdHRhIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDE1NzIwNjQ1MzQiO31zOjc6Im1lc3NhZ2UiO3M6ODoic28gY3V0ZSEiO3M6MTA6ImNhbl9yZW1vdmUiO2I6MTtzOjEyOiJjcmVhdGVkX3RpbWUiO3M6MjQ6IjIwMTMtMDgtMjlUMDY6MDE6MzkrMDAwMCI7czoxMDoibGlrZV9jb3VudCI7aToxO3M6MTA6InVzZXJfbGlrZXMiO2I6MTt9fXM6NjoicGFnaW5nIjtPOjg6InN0ZENsYXNzIjoxOntzOjc6ImN1cnNvcnMiO086ODoic3RkQ2xhc3MiOjI6e3M6NToiYWZ0ZXIiO3M6NDoiTVE9PSI7czo2OiJiZWZvcmUiO3M6NDoiTVE9PSI7fX19fQ==', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '100002043048057_508874709190626', '2013-09-04 20:00:04', 'Tzo4OiJzdGRDbGFzcyI6MTg6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MDg4NzQ3MDkxOTA2MjYiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6NTk6Ik9uZGVydGVrZW4gZGUgcGV0aXRpZSwgZGUgemVsZnN0YW5kaWdlbmFmdHJlayBtb2V0IGJsaWp2ZW4uIjtzOjc6InBpY3R1cmUiO3M6MTQxOiJodHRwczovL2ZiZXh0ZXJuYWwtYS5ha2FtYWloZC5uZXQvc2FmZV9pbWFnZS5waHA/ZD1BUUR5bGJfeVNEMFJUdkNwJnc9MTU0Jmg9MTU0JnVybD1odHRwJTNBJTJGJTJGY2RuLnBldGl0aW9uczI0LmNvbSUyRmltYWdlcyUyRnBldGl0aW9uNC5qcGciO3M6NDoibGluayI7czo2MToiaHR0cDovL3d3dy5wZXRpdGllczI0LmNvbS9kZV96ZWxmc3RhbmRpZ2VuYWZ0cmVrX21vZXRfYmxpanZlbiI7czo0OiJuYW1lIjtzOjM1OiJEZSBaZWxmc3RhbmRpZ2VuYWZ0cmVrIE1vZXQgQmxpanZlbiI7czo3OiJjYXB0aW9uIjtzOjE4OiJ3d3cucGV0aXRpZXMyNC5jb20iO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjMwNzoiVm9sZ2VucyBoZXQgRkQgdmFuIDYgYXVndXN0dXMgaGViYmVuIFZWRCBlbiBQdmRBIGhldCB2b29ybmVtZW4gZGUgemVsZnN0YW5kaWdlbmFmdHJlayBpbiBkZSBpbmtvbXN0ZW5iZWxhc3RpbmcgYWYgdGUgc2NoYWZmZW4gb2YgZmxpbmsgdGUgYmVwZXJrZW4uIE9vayB3b3JkdCBnZXNwcm9rZW4gb3ZlciBkZSBvcHRpZSBkZSB6ZWxmc3RhbmRpZ2VuYWZ0cmVrIHRlIGxhdGVuIGJlc3RhYW4sIG1hYXIgZWVuIOKAmHp6cC1iZWxhc3RpbmfigJkgaW4gdGUgdm9lcmVuLCB3YXQgdm9vciBlZW4gZ3JvdGUgZ3JvZXAgb25kZXJuZW1lcnMgby4uLiI7czo0OiJpY29uIjtzOjY0OiJodHRwczovL2Zic3RhdGljLWEuYWthbWFpaGQubmV0L3JzcmMucGhwL3YyL3lEL3IvYVM4ZWNtWVJ5czAuZ2lmIjtzOjc6ImFjdGlvbnMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czo3OiJDb21tZW50IjtzOjQ6ImxpbmsiO3M6NjI6Imh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS8xMDAwMDIwNDMwNDgwNTcvcG9zdHMvNTA4ODc0NzA5MTkwNjI2Ijt9fXM6NzoicHJpdmFjeSI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJ2YWx1ZSI7czowOiIiO31zOjQ6InR5cGUiO3M6NDoibGluayI7czoxMToic3RhdHVzX3R5cGUiO3M6MTI6InNoYXJlZF9zdG9yeSI7czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czoxNzoiU2hhcmVfYm9va21hcmtsZXQiO3M6MjoiaWQiO3M6MTA6IjUwODU2NDc5OTUiO31zOjEyOiJjcmVhdGVkX3RpbWUiO3M6MjQ6IjIwMTMtMDktMDJUMDg6MzE6MzErMDAwMCI7czoxMjoidXBkYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA5LTA0VDIwOjAwOjA0KzAwMDAiO3M6NToibGlrZXMiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoiZGF0YSI7YTozOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjk6IkFuamEgSGFnZSI7czoyOiJpZCI7czoxMDoiMTE5MDI0NTgzMiI7fWk6MTtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6MjY6IkRhbm55IFBhc3F1YWxlIE1vb2kgU29tZXJzIjtzOjI6ImlkIjtzOjEwOiIxNTM1OTE3NTQ5Ijt9aToyO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czoxMDoiUmF5IEJvZ21hbiI7czoyOiJpZCI7czoxMDoiMTA1MzU3MzY5MSI7fX1zOjU6ImNvdW50IjtpOjM7fXM6ODoiY29tbWVudHMiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoiZGF0YSI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6Nzp7czoyOiJpZCI7czoyNDoiNTA4ODc0NzA5MTkwNjI2XzcyOTA5MjY5IjtzOjQ6ImZyb20iO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czo5OiJBbmphIEhhZ2UiO3M6MjoiaWQiO3M6MTA6IjExOTAyNDU4MzIiO31zOjc6Im1lc3NhZ2UiO3M6MTg6IkhlbGVtYWFsIG1lZSBlZW5zISI7czoxMDoiY2FuX3JlbW92ZSI7YjoxO3M6MTI6ImNyZWF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOS0wNFQyMDowMDowNCswMDAwIjtzOjEwOiJsaWtlX2NvdW50IjtpOjA7czoxMDoidXNlcl9saWtlcyI7YjowO319czo2OiJwYWdpbmciO086ODoic3RkQ2xhc3MiOjE6e3M6NzoiY3Vyc29ycyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo1OiJhZnRlciI7czo0OiJNUT09IjtzOjY6ImJlZm9yZSI7czo0OiJNUT09Ijt9fX19', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '100002043048057_510169425727821', '2013-09-05 17:45:21', 'Tzo4OiJzdGRDbGFzcyI6MTA6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MTAxNjk0MjU3Mjc4MjEiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6Nzg6IkhvZSB6aXQgaGV0IG1ldCBqb3V3IHBlcnNvb25saWprIGxlaWRlcnNjaGFwPyBIdHRwOi8vd3d3LmZsZXhmb2N1cy5ubC9leWVvbm1lLyI7czo3OiJhY3Rpb25zIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6NzoiQ29tbWVudCI7czo0OiJsaW5rIjtzOjYyOiJodHRwczovL3d3dy5mYWNlYm9vay5jb20vMTAwMDAyMDQzMDQ4MDU3L3Bvc3RzLzUxMDE2OTQyNTcyNzgyMSI7fX1zOjc6InByaXZhY3kiO086ODoic3RkQ2xhc3MiOjE6e3M6NToidmFsdWUiO3M6MDoiIjt9czo0OiJ0eXBlIjtzOjY6InN0YXR1cyI7czoxMToic3RhdHVzX3R5cGUiO3M6MjA6Im1vYmlsZV9zdGF0dXNfdXBkYXRlIjtzOjExOiJhcHBsaWNhdGlvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjE5OiJGYWNlYm9vayBmb3IgaVBob25lIjtzOjk6Im5hbWVzcGFjZSI7czo4OiJmYmlwaG9uZSI7czoyOiJpZCI7czoxMDoiNjYyODU2ODM3OSI7fXM6MTI6ImNyZWF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOS0wNVQxNzo0NToyMSswMDAwIjtzOjEyOiJ1cGRhdGVkX3RpbWUiO3M6MjQ6IjIwMTMtMDktMDVUMTc6NDU6MjErMDAwMCI7fQ==', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '100002043048057_510178002393630', '2013-09-06 06:15:24', 'Tzo4OiJzdGRDbGFzcyI6MTE6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MTAxNzgwMDIzOTM2MzAiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6ODE6Ik9IOiB3ZSd2ZSBiZWVuIGdvbmUgZm9yIDEwIHllYXJzLiBUaGlzIGlzIGEgd2hvbGUgbmV3IGdlbmVyYXRpb24gb2YgcGlja3VwIGdpcmxzLiI7czo3OiJhY3Rpb25zIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6NzoiQ29tbWVudCI7czo0OiJsaW5rIjtzOjYyOiJodHRwczovL3d3dy5mYWNlYm9vay5jb20vMTAwMDAyMDQzMDQ4MDU3L3Bvc3RzLzUxMDE3ODAwMjM5MzYzMCI7fX1zOjc6InByaXZhY3kiO086ODoic3RkQ2xhc3MiOjE6e3M6NToidmFsdWUiO3M6MDoiIjt9czo0OiJ0eXBlIjtzOjY6InN0YXR1cyI7czoxMToic3RhdHVzX3R5cGUiO3M6MjA6Im1vYmlsZV9zdGF0dXNfdXBkYXRlIjtzOjExOiJhcHBsaWNhdGlvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo0OiJuYW1lIjtzOjE5OiJGYWNlYm9vayBmb3IgaVBob25lIjtzOjk6Im5hbWVzcGFjZSI7czo4OiJmYmlwaG9uZSI7czoyOiJpZCI7czoxMDoiNjYyODU2ODM3OSI7fXM6MTI6ImNyZWF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOS0wNVQxODoxNzoyNCswMDAwIjtzOjEyOiJ1cGRhdGVkX3RpbWUiO3M6MjQ6IjIwMTMtMDktMDZUMDY6MTU6MjQrMDAwMCI7czo4OiJjb21tZW50cyI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJkYXRhIjthOjI6e2k6MDtPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtzOjI0OiI1MTAxNzgwMDIzOTM2MzBfNzI5MTE2MDQiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjIwOiJJbmdyaWQgVmFuIGRlIE1vcnRlbCI7czoyOiJpZCI7czoxNToiMTAwMDAwMTE4ODA4NDAxIjt9czo3OiJtZXNzYWdlIjtzOjI1OiJQaWNrLXVwIGdpcmxzIGluIFR1cmtpamU/IjtzOjEwOiJjYW5fcmVtb3ZlIjtiOjE7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA5LTA1VDIyOjQyOjEwKzAwMDAiO3M6MTA6Imxpa2VfY291bnQiO2k6MDtzOjEwOiJ1c2VyX2xpa2VzIjtiOjA7fWk6MTtPOjg6InN0ZENsYXNzIjo3OntzOjI6ImlkIjtzOjI0OiI1MTAxNzgwMDIzOTM2MzBfNzI5MTI1NDAiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6MTc6IkxvbCwgbmVlIGluIEdoYW5hIjtzOjEwOiJjYW5fcmVtb3ZlIjtiOjE7czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA5LTA2VDA2OjE1OjI0KzAwMDAiO3M6MTA6Imxpa2VfY291bnQiO2k6MDtzOjEwOiJ1c2VyX2xpa2VzIjtiOjA7fX1zOjY6InBhZ2luZyI7Tzo4OiJzdGRDbGFzcyI6MTp7czo3OiJjdXJzb3JzIjtPOjg6InN0ZENsYXNzIjoyOntzOjU6ImFmdGVyIjtzOjQ6Ik1nPT0iO3M6NjoiYmVmb3JlIjtzOjQ6Ik1RPT0iO319fX0=', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '100002043048057_511826638895433', '2013-09-09 07:14:03', 'Tzo4OiJzdGRDbGFzcyI6MTc6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MTE4MjY2Mzg4OTU0MzMiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6MTcyOiJKZSBrdW50IHZhbiBGYWNlYm9vayB2aW5kZW4gd2F0IGplIHZpbmQsIG1hYXIgZGl0IGlzIGVlbiBmYW50YXN0aXNjaCBpbml0aWF0aWVmLiBJbnRlcm5ldCBpcyBlZW4gZWZmZWN0aWV2ZSBtYW5pZXIgb20gQWZyaWthIChlbiBhbmRlcmUgZGVyZGUgd2VyZWxkIGxhbmRlbikgdGUgb250d2lra2VsZW4uIjtzOjc6InBpY3R1cmUiO3M6MTkwOiJodHRwczovL2ZiZXh0ZXJuYWwtYS5ha2FtYWloZC5uZXQvc2FmZV9pbWFnZS5waHA/ZD1BUUI3a2hGZzR1T3ZLam1nJnc9MTU0Jmg9MTU0JnVybD1odHRwcyUzQSUyRiUyRmFzc2V0cy1zdGFja3NvY2lhbC5uZXRkbmEtc3NsLmNvbSUyRnVwbG9hZGVkX3NjcmVlbnNob3RfMXMlMkY1MzcxJTJGcmVkZXNpZ25fM19MZW5zX1JlZG8ucG5nIjtzOjQ6ImxpbmsiO3M6MTA1OiJodHRwOi8vZGVzaWdudGF4aS5jb20vbmV3cy8zNjA0NDQvTWFyay1adWNrZXJiZXJnLUFubm91bmNlcy1MYXVuY2gtT2YtSW50ZXJuZXQtb3JnLyMuVWkxMEdpS2NYTDguZmFjZWJvb2siO3M6NDoibmFtZSI7czo3MToiTWFyayBadWNrZXJiZXJnIEFubm91bmNlcyBMYXVuY2ggT2Yg4oCYSW50ZXJuZXQub3Jn4oCZIC0gRGVzaWduVEFYSS5jb20iO3M6NzoiY2FwdGlvbiI7czoxNDoiZGVzaWdudGF4aS5jb20iO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjcxOiJNYXJrIFp1Y2tlcmJlcmcgQW5ub3VuY2VzIExhdW5jaCBPZiDigJhJbnRlcm5ldC5vcmfigJkgLSBEZXNpZ25UQVhJLmNvbSI7czo0OiJpY29uIjtzOjY0OiJodHRwczovL2Zic3RhdGljLWEuYWthbWFpaGQubmV0L3JzcmMucGhwL3YyL3lxL3IvU0MyWm1Fa2ZJLVgucG5nIjtzOjc6ImFjdGlvbnMiO2E6MTp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czo3OiJDb21tZW50IjtzOjQ6ImxpbmsiO3M6NjI6Imh0dHBzOi8vd3d3LmZhY2Vib29rLmNvbS8xMDAwMDIwNDMwNDgwNTcvcG9zdHMvNTExODI2NjM4ODk1NDMzIjt9fXM6NzoicHJpdmFjeSI7Tzo4OiJzdGRDbGFzcyI6MTp7czo1OiJ2YWx1ZSI7czowOiIiO31zOjQ6InR5cGUiO3M6NDoibGluayI7czoxMToic3RhdHVzX3R5cGUiO3M6MTI6InNoYXJlZF9zdG9yeSI7czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czoxNzoiU2hhcmVfYm9va21hcmtsZXQiO3M6MjoiaWQiO3M6MTA6IjUwODU2NDc5OTUiO31zOjEyOiJjcmVhdGVkX3RpbWUiO3M6MjQ6IjIwMTMtMDktMDlUMDc6MTQ6MDMrMDAwMCI7czoxMjoidXBkYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA5LTA5VDA3OjE0OjAzKzAwMDAiO3M6NToibGlrZXMiO086ODoic3RkQ2xhc3MiOjI6e3M6NDoiZGF0YSI7YToxOntpOjA7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjE0OiJDaGlhcmEgQWxpb3R0YSI7czoyOiJpZCI7czoxNToiMTAwMDAxNTcyMDY0NTM0Ijt9fXM6NToiY291bnQiO2k6MTt9fQ==', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, '100002043048057_515362341875196', '2013-09-16 18:45:26', 'Tzo4OiJzdGRDbGFzcyI6MTc6e3M6MjoiaWQiO3M6MzE6IjEwMDAwMjA0MzA0ODA1N181MTUzNjIzNDE4NzUxOTYiO3M6NDoiZnJvbSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjEzOiJCYWJzIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDIwNDMwNDgwNTciO31zOjc6Im1lc3NhZ2UiO3M6MjQ6IkRhYXIgaXMgaGV0IGxla2tlciB3ZWVyLiI7czo3OiJwaWN0dXJlIjtzOjE1NDoiaHR0cHM6Ly9mYmV4dGVybmFsLWEuYWthbWFpaGQubmV0L3NhZmVfaW1hZ2UucGhwP2Q9QVFDUHI5azQ2cDIwWUU4SCZ3PTE1NCZoPTE1NCZ1cmw9aHR0cCUzQSUyRiUyRmZhcm02LnN0YXRpY2ZsaWNrci5jb20lMkY1NTQ0JTJGOTYxOTAyODAzOV85NzFmOTJmYWFlLmpwZyI7czo0OiJsaW5rIjtzOjgxOiJodHRwOi8vdHJhaW5pbmd0cmlwcy5ldS9kZXN0aW5hdGlvbnMvZGVzdGluYXRpb24vMTk0LWJvdXNrb3VyYS1jYXNhYmxhbmNhP2xhbmc9ZW4iO3M6NDoibmFtZSI7czoyMDoiQm91c2tvdXJhIENhc2FibGFuY2EiO3M6NzoiY2FwdGlvbiI7czoxNjoidHJhaW5pbmd0cmlwcy5ldSI7czoxMToiZGVzY3JpcHRpb24iO3M6MzAzOiJUaGlzIGhvdGVsIG9mZmVycyBhIHllYXItcm91bmQgcHJhY3RpY2UgZmFjaWxpdHkgaW4gYW4gaWRlYWwgY2xpbWF0ZS4gRXZlcnl0aGluZyBhIGZvb3RiYWxsIHRlYW0gbmVlZHMgaXMgcHJvdmlkZWQ6IGZyb20gdGhlIHRvcCBxdWFsaXR5IG9mIHRoZSBmb290YmFsbCBwaXRjaGVzIGFuZCBhY2NvbW1vZGF0aW9uIG9mIHRoZSBoaWdoZXN0IHN0YW5kYXJkcyB0byBmdWxsIGNhdGVyaW5nIHNlcnZpY2VzLCBhIGhvc3Qgb2Ygb3RoZXIgYWN0aXZpdGllcyBzdWNoIGFzIHRlbm5pcywgYSBmdWxseSBlcXVpcHBlZCBGaXRuZXNzIEMuLi4iO3M6NDoiaWNvbiI7czo2NDoiaHR0cHM6Ly9mYnN0YXRpYy1hLmFrYW1haWhkLm5ldC9yc3JjLnBocC92Mi95RC9yL2FTOGVjbVlSeXMwLmdpZiI7czo3OiJhY3Rpb25zIjthOjE6e2k6MDtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6NzoiQ29tbWVudCI7czo0OiJsaW5rIjtzOjYyOiJodHRwczovL3d3dy5mYWNlYm9vay5jb20vMTAwMDAyMDQzMDQ4MDU3L3Bvc3RzLzUxNTM2MjM0MTg3NTE5NiI7fX1zOjc6InByaXZhY3kiO086ODoic3RkQ2xhc3MiOjE6e3M6NToidmFsdWUiO3M6MDoiIjt9czo0OiJ0eXBlIjtzOjQ6ImxpbmsiO3M6MTE6InN0YXR1c190eXBlIjtzOjEyOiJzaGFyZWRfc3RvcnkiO3M6MTE6ImFwcGxpY2F0aW9uIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6Im5hbWUiO3M6MTc6IlNoYXJlX2Jvb2ttYXJrbGV0IjtzOjI6ImlkIjtzOjEwOiI1MDg1NjQ3OTk1Ijt9czoxMjoiY3JlYXRlZF90aW1lIjtzOjI0OiIyMDEzLTA5LTE2VDE4OjQ1OjI2KzAwMDAiO3M6MTI6InVwZGF0ZWRfdGltZSI7czoyNDoiMjAxMy0wOS0xNlQxODo0NToyNiswMDAwIjtzOjU6Imxpa2VzIjtPOjg6InN0ZENsYXNzIjoyOntzOjQ6ImRhdGEiO2E6Mjp7aTowO086ODoic3RkQ2xhc3MiOjI6e3M6NDoibmFtZSI7czoxMjoiSmFuIEfDtnNnZW5zIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDI0OTgwNzY2MTIiO31pOjE7Tzo4OiJzdGRDbGFzcyI6Mjp7czo0OiJuYW1lIjtzOjE5OiJIZWxlZW4gTG91d2VyZW5idXJnIjtzOjI6ImlkIjtzOjE1OiIxMDAwMDAyMDI2OTU3MTUiO319czo1OiJjb3VudCI7aToyO319', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `flock_streams.bak`
--

DROP TABLE IF EXISTS `flock_streams.bak`;
CREATE TABLE IF NOT EXISTS `flock_streams.bak` (
  `platform` tinyint(2) NOT NULL,
  `platform_id` bigint(50) NOT NULL,
  `date_created` datetime NOT NULL,
  `raw` text NOT NULL,
  `metadata` text NOT NULL,
  `permalink` text NOT NULL,
  `params` text NOT NULL,
  `language` char(7) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`platform`,`platform_id`),
  UNIQUE KEY `platformid` (`platform`,`platform_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flock_streams.bak`
--

INSERT INTO `flock_streams.bak` (`platform`, `platform_id`, `date_created`, `raw`, `metadata`, `permalink`, `params`, `language`, `state`, `publish_up`, `publish_down`) VALUES
(1, 361485006050299906, '2013-07-28 13:55:16', 'O:8:"stdClass":22:{s:10:"created_at";s:30:"Sun Jul 28 13:55:16 +0000 2013";s:2:"id";i:361485006050299906;s:6:"id_str";s:18:"361485006050299906";s:4:"text";s:32:"@betweenbrain @nightshiftc rotfl";s:6:"source";s:82:"<a href="http://twitter.com/download/iphone" rel="nofollow">Twitter for iPhone</a>";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";i:361258942904545280;s:25:"in_reply_to_status_id_str";s:18:"361258942904545280";s:19:"in_reply_to_user_id";i:18042689;s:23:"in_reply_to_user_id_str";s:8:"18042689";s:23:"in_reply_to_screen_name";s:12:"betweenbrain";s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:0;s:14:"favorite_count";i:0;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:0:{}s:7:"symbols";a:0:{}s:4:"urls";a:0:{}s:13:"user_mentions";a:2:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:12:"betweenbrain";s:4:"name";s:12:"betweenbrain";s:2:"id";i:18042689;s:6:"id_str";s:8:"18042689";s:7:"indices";a:2:{i:0;i:0;i:1;i:13;}}i:1;O:8:"stdClass":5:{s:11:"screen_name";s:11:"nightshiftc";s:4:"name";s:15:"Cristina Solana";s:2:"id";i:18868607;s:6:"id_str";s:8:"18868607";s:7:"indices";a:2:{i:0;i:14;i:1;i:26;}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:4:"lang";s:2:"de";}', '', 'https://twitter.com/babsgosgens/status/361485006050299906', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 366915293664133122, '2013-08-12 13:33:17', 'O:8:"stdClass":22:{s:10:"created_at";s:30:"Mon Aug 12 13:33:17 +0000 2013";s:2:"id";i:366915293664133122;s:6:"id_str";s:18:"366915293664133122";s:4:"text";s:48:"@nightshiftc now where have I heard that before?";s:6:"source";s:82:"<a href="http://twitter.com/download/iphone" rel="nofollow">Twitter for iPhone</a>";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";i:366911811582312449;s:25:"in_reply_to_status_id_str";s:18:"366911811582312449";s:19:"in_reply_to_user_id";i:18868607;s:23:"in_reply_to_user_id_str";s:8:"18868607";s:23:"in_reply_to_screen_name";s:11:"nightshiftc";s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:0;s:14:"favorite_count";i:0;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:0:{}s:7:"symbols";a:0:{}s:4:"urls";a:0:{}s:13:"user_mentions";a:1:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:11:"nightshiftc";s:4:"name";s:15:"Cristina Solana";s:2:"id";i:18868607;s:6:"id_str";s:8:"18868607";s:7:"indices";a:2:{i:0;i:0;i:1;i:12;}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:4:"lang";s:2:"en";}', '', 'https://twitter.com/babsgosgens/status/366915293664133122', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 367286034553663488, '2013-08-13 14:06:29', 'O:8:"stdClass":22:{s:10:"created_at";s:30:"Tue Aug 13 14:06:29 +0000 2013";s:2:"id";i:367286034553663488;s:6:"id_str";s:18:"367286034553663488";s:4:"text";s:66:"@Myth720 @nightshiftc note to self: show this tweet to @jangosgens";s:6:"source";s:82:"<a href="http://twitter.com/download/iphone" rel="nofollow">Twitter for iPhone</a>";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";i:367267766216441856;s:25:"in_reply_to_status_id_str";s:18:"367267766216441856";s:19:"in_reply_to_user_id";i:513890925;s:23:"in_reply_to_user_id_str";s:9:"513890925";s:23:"in_reply_to_screen_name";s:7:"Myth720";s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:0;s:14:"favorite_count";i:0;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:0:{}s:7:"symbols";a:0:{}s:4:"urls";a:0:{}s:13:"user_mentions";a:3:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:7:"Myth720";s:4:"name";s:13:"Martin Rivera";s:2:"id";i:513890925;s:6:"id_str";s:9:"513890925";s:7:"indices";a:2:{i:0;i:0;i:1;i:8;}}i:1;O:8:"stdClass":5:{s:11:"screen_name";s:11:"nightshiftc";s:4:"name";s:15:"Cristina Solana";s:2:"id";i:18868607;s:6:"id_str";s:8:"18868607";s:7:"indices";a:2:{i:0;i:9;i:1;i:21;}}i:2;O:8:"stdClass":5:{s:11:"screen_name";s:10:"jangosgens";s:4:"name";s:12:"Jan Gösgens";s:2:"id";i:110945085;s:6:"id_str";s:9:"110945085";s:7:"indices";a:2:{i:0;i:55;i:1;i:66;}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:4:"lang";s:2:"en";}', '', 'https://twitter.com/babsgosgens/status/367286034553663488', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 367910337594789888, '2013-08-15 07:27:14', 'O:8:"stdClass":24:{s:10:"created_at";s:30:"Thu Aug 15 07:27:14 +0000 2013";s:2:"id";i:367910337594789888;s:6:"id_str";s:18:"367910337594789888";s:4:"text";s:106:"RT @yireo: #joomla Bootstrap Accordion menu by yireo http://t.co/QSgUqZJ5ZV simple yet beautiful, and free";s:6:"source";s:82:"<a href="http://twitter.com/download/iphone" rel="nofollow">Twitter for iPhone</a>";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";N;s:25:"in_reply_to_status_id_str";N;s:19:"in_reply_to_user_id";N;s:23:"in_reply_to_user_id_str";N;s:23:"in_reply_to_screen_name";N;s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:16:"retweeted_status";O:8:"stdClass":23:{s:10:"created_at";s:30:"Thu Aug 15 06:51:25 +0000 2013";s:2:"id";i:367901323217620992;s:6:"id_str";s:18:"367901323217620992";s:4:"text";s:95:"#joomla Bootstrap Accordion menu by yireo http://t.co/QSgUqZJ5ZV simple yet beautiful, and free";s:6:"source";s:73:"<a href="http://www.yireo.com/" rel="nofollow">Joomla! TweetScheduler</a>";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";N;s:25:"in_reply_to_status_id_str";N;s:19:"in_reply_to_user_id";N;s:23:"in_reply_to_user_id_str";N;s:23:"in_reply_to_screen_name";N;s:4:"user";O:8:"stdClass":38:{s:2:"id";i:37994221;s:6:"id_str";s:8:"37994221";s:4:"name";s:5:"yireo";s:11:"screen_name";s:5:"yireo";s:8:"location";s:11:"Netherlands";s:11:"description";s:64:"Yireo - Extensions and guides for Joomla! and Magento developers";s:3:"url";s:22:"http://t.co/2VnepOnUgE";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/2VnepOnUgE";s:12:"expanded_url";s:20:"http://www.yireo.com";s:11:"display_url";s:9:"yireo.com";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:1311;s:13:"friends_count";i:239;s:12:"listed_count";i:66;s:10:"created_at";s:30:"Tue May 05 19:12:12 +0000 2009";s:16:"favourites_count";i:3;s:10:"utc_offset";i:7200;s:9:"time_zone";s:9:"Amsterdam";s:11:"geo_enabled";b:0;s:8:"verified";b:0;s:14:"statuses_count";i:3821;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"FFFFFF";s:28:"profile_background_image_url";s:75:"http://a0.twimg.com/profile_background_images/377445735/yireo_twitbacks.png";s:34:"profile_background_image_url_https";s:77:"https://si0.twimg.com/profile_background_images/377445735/yireo_twitbacks.png";s:23:"profile_background_tile";b:0;s:17:"profile_image_url";s:89:"http://a0.twimg.com/profile_images/3124693542/812ff32c19cfbff2d90e6332188224b6_normal.png";s:23:"profile_image_url_https";s:91:"https://si0.twimg.com/profile_images/3124693542/812ff32c19cfbff2d90e6332188224b6_normal.png";s:18:"profile_link_color";s:6:"BB1E1E";s:28:"profile_sidebar_border_color";s:6:"BB1E1E";s:26:"profile_sidebar_fill_color";s:6:"FFFFFF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:1;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";N;s:19:"follow_request_sent";b:0;s:13:"notifications";N;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:3;s:14:"favorite_count";i:0;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:1:{i:0;O:8:"stdClass":2:{s:4:"text";s:6:"joomla";s:7:"indices";a:2:{i:0;i:0;i:1;i:7;}}}s:7:"symbols";a:0:{}s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/QSgUqZJ5ZV";s:12:"expanded_url";s:21:"http://bit.ly/11L1heJ";s:11:"display_url";s:14:"bit.ly/11L1heJ";s:7:"indices";a:2:{i:0;i:42;i:1;i:64;}}}s:13:"user_mentions";a:0:{}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:18:"possibly_sensitive";b:0;s:4:"lang";s:2:"en";}s:13:"retweet_count";i:3;s:14:"favorite_count";i:0;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:1:{i:0;O:8:"stdClass":2:{s:4:"text";s:6:"joomla";s:7:"indices";a:2:{i:0;i:11;i:1;i:18;}}}s:7:"symbols";a:0:{}s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/QSgUqZJ5ZV";s:12:"expanded_url";s:21:"http://bit.ly/11L1heJ";s:11:"display_url";s:14:"bit.ly/11L1heJ";s:7:"indices";a:2:{i:0;i:53;i:1;i:75;}}}s:13:"user_mentions";a:1:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:5:"yireo";s:4:"name";s:5:"yireo";s:2:"id";i:37994221;s:6:"id_str";s:8:"37994221";s:7:"indices";a:2:{i:0;i:3;i:1;i:9;}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:18:"possibly_sensitive";b:0;s:4:"lang";s:2:"en";}', '', 'https://twitter.com/babsgosgens/status/367910337594789888', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 369718500706643968, '2013-08-20 07:12:14', 'O:8:"stdClass":23:{s:10:"created_at";s:30:"Tue Aug 20 07:12:14 +0000 2013";s:2:"id";i:369718500706643968;s:6:"id_str";s:18:"369718500706643968";s:4:"text";s:56:"Authentic Design http://t.co/4MWBug2Ip2 via @smashingmag";s:6:"source";s:72:"<a href="http://twitter.com/tweetbutton" rel="nofollow">Tweet Button</a>";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";N;s:25:"in_reply_to_status_id_str";N;s:19:"in_reply_to_user_id";N;s:23:"in_reply_to_user_id_str";N;s:23:"in_reply_to_screen_name";N;s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:0;s:14:"favorite_count";i:0;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:0:{}s:7:"symbols";a:0:{}s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/4MWBug2Ip2";s:12:"expanded_url";s:60:"http://www.smashingmagazine.com/2013/07/16/authentic-design/";s:11:"display_url";s:38:"smashingmagazine.com/2013/07/16/aut…";s:7:"indices";a:2:{i:0;i:17;i:1;i:39;}}}s:13:"user_mentions";a:1:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:11:"smashingmag";s:4:"name";s:17:"Smashing Magazine";s:2:"id";i:15736190;s:6:"id_str";s:8:"15736190";s:7:"indices";a:2:{i:0;i:44;i:1;i:56;}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:18:"possibly_sensitive";b:0;s:4:"lang";s:2:"en";}', '', 'https://twitter.com/babsgosgens/status/369718500706643968', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 370102142314352640, '2013-08-21 08:36:41', 'O:8:"stdClass":22:{s:10:"created_at";s:30:"Wed Aug 21 08:36:41 +0000 2013";s:2:"id";i:370102142314352640;s:6:"id_str";s:18:"370102142314352640";s:4:"text";s:39:"@FronteersConf ik zoek nog een kaartje!";s:6:"source";s:3:"web";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";N;s:25:"in_reply_to_status_id_str";N;s:19:"in_reply_to_user_id";i:37661073;s:23:"in_reply_to_user_id_str";s:8:"37661073";s:23:"in_reply_to_screen_name";s:13:"FronteersConf";s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:0;s:14:"favorite_count";i:0;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:0:{}s:7:"symbols";a:0:{}s:4:"urls";a:0:{}s:13:"user_mentions";a:1:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:13:"FronteersConf";s:4:"name";s:20:"Fronteers Conference";s:2:"id";i:37661073;s:6:"id_str";s:8:"37661073";s:7:"indices";a:2:{i:0;i:0;i:1;i:14;}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:4:"lang";s:2:"nl";}', '', 'https://twitter.com/babsgosgens/status/370102142314352640', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 370111851159224320, '2013-08-21 09:15:16', 'O:8:"stdClass":22:{s:10:"created_at";s:30:"Wed Aug 21 09:15:16 +0000 2013";s:2:"id";i:370111851159224320;s:6:"id_str";s:18:"370111851159224320";s:4:"text";s:58:"@FronteersConf Zit daar toevallig ook nog ledenkorting op?";s:6:"source";s:3:"web";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";i:370111183459598337;s:25:"in_reply_to_status_id_str";s:18:"370111183459598337";s:19:"in_reply_to_user_id";i:37661073;s:23:"in_reply_to_user_id_str";s:8:"37661073";s:23:"in_reply_to_screen_name";s:13:"FronteersConf";s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:0;s:14:"favorite_count";i:0;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:0:{}s:7:"symbols";a:0:{}s:4:"urls";a:0:{}s:13:"user_mentions";a:1:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:13:"FronteersConf";s:4:"name";s:20:"Fronteers Conference";s:2:"id";i:37661073;s:6:"id_str";s:8:"37661073";s:7:"indices";a:2:{i:0;i:0;i:1;i:14;}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:4:"lang";s:2:"nl";}', '', 'https://twitter.com/babsgosgens/status/370111851159224320', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 370163717263986688, '2013-08-21 12:41:22', 'O:8:"stdClass":22:{s:10:"created_at";s:30:"Wed Aug 21 12:41:22 +0000 2013";s:2:"id";i:370163717263986688;s:6:"id_str";s:18:"370163717263986688";s:4:"text";s:21:"@FronteersConf Check!";s:6:"source";s:3:"web";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";i:370158373406121984;s:25:"in_reply_to_status_id_str";s:18:"370158373406121984";s:19:"in_reply_to_user_id";i:37661073;s:23:"in_reply_to_user_id_str";s:8:"37661073";s:23:"in_reply_to_screen_name";s:13:"FronteersConf";s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:0;s:14:"favorite_count";i:0;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:0:{}s:7:"symbols";a:0:{}s:4:"urls";a:0:{}s:13:"user_mentions";a:1:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:13:"FronteersConf";s:4:"name";s:20:"Fronteers Conference";s:2:"id";i:37661073;s:6:"id_str";s:8:"37661073";s:7:"indices";a:2:{i:0;i:0;i:1;i:14;}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:4:"lang";s:2:"en";}', '', 'https://twitter.com/babsgosgens/status/370163717263986688', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 370915337501294594, '2013-08-23 14:28:02', 'O:8:"stdClass":23:{s:10:"created_at";s:30:"Fri Aug 23 14:28:02 +0000 2013";s:2:"id";i:370915337501294594;s:6:"id_str";s:18:"370915337501294594";s:4:"text";s:81:"@HugoGiraudel hey, cool stuff: https://t.co/oBBlajMinD thanks for sharing that :)";s:6:"source";s:3:"web";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";N;s:25:"in_reply_to_status_id_str";N;s:19:"in_reply_to_user_id";i:551949534;s:23:"in_reply_to_user_id_str";s:9:"551949534";s:23:"in_reply_to_screen_name";s:12:"HugoGiraudel";s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:0;s:14:"favorite_count";i:1;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:0:{}s:7:"symbols";a:0:{}s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:23:"https://t.co/oBBlajMinD";s:12:"expanded_url";s:45:"https://github.com/HugoGiraudel/Sass-snippets";s:11:"display_url";s:28:"github.com/HugoGiraudel/S…";s:7:"indices";a:2:{i:0;i:31;i:1;i:54;}}}s:13:"user_mentions";a:1:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:12:"HugoGiraudel";s:4:"name";s:13:"Hugo Giraudel";s:2:"id";i:551949534;s:6:"id_str";s:9:"551949534";s:7:"indices";a:2:{i:0;i:0;i:1;i:13;}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:18:"possibly_sensitive";b:0;s:4:"lang";s:2:"en";}', '', 'https://twitter.com/babsgosgens/status/370915337501294594', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 371887676779397120, '2013-08-26 06:51:46', 'O:8:"stdClass":22:{s:10:"created_at";s:30:"Mon Aug 26 06:51:46 +0000 2013";s:2:"id";i:371887676779397120;s:6:"id_str";s:18:"371887676779397120";s:4:"text";s:41:"@nightshiftc hehe... I''m guessing: a PJP?";s:6:"source";s:82:"<a href="http://twitter.com/download/iphone" rel="nofollow">Twitter for iPhone</a>";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";i:371674565904433153;s:25:"in_reply_to_status_id_str";s:18:"371674565904433153";s:19:"in_reply_to_user_id";i:18868607;s:23:"in_reply_to_user_id_str";s:8:"18868607";s:23:"in_reply_to_screen_name";s:11:"nightshiftc";s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:0;s:14:"favorite_count";i:0;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:0:{}s:7:"symbols";a:0:{}s:4:"urls";a:0:{}s:13:"user_mentions";a:1:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:11:"nightshiftc";s:4:"name";s:15:"Cristina Solana";s:2:"id";i:18868607;s:6:"id_str";s:8:"18868607";s:7:"indices";a:2:{i:0;i:0;i:1;i:12;}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:4:"lang";s:2:"en";}', '', 'https://twitter.com/babsgosgens/status/371887676779397120', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 371898063968686080, '2013-08-26 07:33:02', 'O:8:"stdClass":23:{s:10:"created_at";s:30:"Mon Aug 26 07:33:02 +0000 2013";s:2:"id";i:371898063968686080;s:6:"id_str";s:18:"371898063968686080";s:4:"text";s:100:"Foundation Icons have been updated - it''s a great collection: http://t.co/DcPfZKK505 @foundationzurb";s:6:"source";s:3:"web";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";N;s:25:"in_reply_to_status_id_str";N;s:19:"in_reply_to_user_id";N;s:23:"in_reply_to_user_id_str";N;s:23:"in_reply_to_screen_name";N;s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:2;s:14:"favorite_count";i:2;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:0:{}s:7:"symbols";a:0:{}s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/DcPfZKK505";s:12:"expanded_url";s:50:"http://zurb.com/playground/foundation-icon-fonts-3";s:11:"display_url";s:26:"zurb.com/playground/fou…";s:7:"indices";a:2:{i:0;i:62;i:1;i:84;}}}s:13:"user_mentions";a:1:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:14:"foundationzurb";s:4:"name";s:18:"Foundation by ZURB";s:2:"id";i:360434586;s:6:"id_str";s:9:"360434586";s:7:"indices";a:2:{i:0;i:85;i:1;i:100;}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:18:"possibly_sensitive";b:0;s:4:"lang";s:2:"en";}', '', 'https://twitter.com/babsgosgens/status/371898063968686080', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 371900495025041408, '2013-08-26 07:42:42', 'O:8:"stdClass":23:{s:10:"created_at";s:30:"Mon Aug 26 07:42:42 +0000 2013";s:2:"id";i:371900495025041408;s:6:"id_str";s:18:"371900495025041408";s:4:"text";s:68:"Awesome roundup of (R)WD tools by @brad_frost http://t.co/NjsAQZ9wVj";s:6:"source";s:72:"<a href="http://twitter.com/tweetbutton" rel="nofollow">Tweet Button</a>";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";N;s:25:"in_reply_to_status_id_str";N;s:19:"in_reply_to_user_id";N;s:23:"in_reply_to_user_id_str";N;s:23:"in_reply_to_screen_name";N;s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:0;s:14:"favorite_count";i:1;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:0:{}s:7:"symbols";a:0:{}s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/NjsAQZ9wVj";s:12:"expanded_url";s:66:"http://www.netmagazine.com/features/top-25-responsive-design-tools";s:11:"display_url";s:33:"netmagazine.com/features/top-2…";s:7:"indices";a:2:{i:0;i:46;i:1;i:68;}}}s:13:"user_mentions";a:1:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:10:"brad_frost";s:4:"name";s:10:"Brad Frost";s:2:"id";i:11855482;s:6:"id_str";s:8:"11855482";s:7:"indices";a:2:{i:0;i:34;i:1;i:45;}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:18:"possibly_sensitive";b:0;s:4:"lang";s:2:"en";}', '', 'https://twitter.com/babsgosgens/status/371900495025041408', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 371953090511261696, '2013-08-26 11:11:41', 'O:8:"stdClass":22:{s:10:"created_at";s:30:"Mon Aug 26 11:11:41 +0000 2013";s:2:"id";i:371953090511261696;s:6:"id_str";s:18:"371953090511261696";s:4:"text";s:46:"@nightshiftc PJ Party lol, yup sounds perfect!";s:6:"source";s:82:"<a href="http://twitter.com/download/iphone" rel="nofollow">Twitter for iPhone</a>";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";i:371952198546378752;s:25:"in_reply_to_status_id_str";s:18:"371952198546378752";s:19:"in_reply_to_user_id";i:18868607;s:23:"in_reply_to_user_id_str";s:8:"18868607";s:23:"in_reply_to_screen_name";s:11:"nightshiftc";s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:0;s:14:"favorite_count";i:0;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:0:{}s:7:"symbols";a:0:{}s:4:"urls";a:0:{}s:13:"user_mentions";a:1:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:11:"nightshiftc";s:4:"name";s:15:"Cristina Solana";s:2:"id";i:18868607;s:6:"id_str";s:8:"18868607";s:7:"indices";a:2:{i:0;i:0;i:1;i:12;}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:4:"lang";s:2:"en";}', '', 'https://twitter.com/babsgosgens/status/371953090511261696', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 372803567843033089, '2013-08-28 19:31:11', 'O:8:"stdClass":22:{s:10:"created_at";s:30:"Wed Aug 28 19:31:11 +0000 2013";s:2:"id";i:372803567843033089;s:6:"id_str";s:18:"372803567843033089";s:4:"text";s:54:"@nightshiftc you there? Can leave in 10, home in 20...";s:6:"source";s:82:"<a href="http://twitter.com/download/iphone" rel="nofollow">Twitter for iPhone</a>";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";N;s:25:"in_reply_to_status_id_str";N;s:19:"in_reply_to_user_id";i:18868607;s:23:"in_reply_to_user_id_str";s:8:"18868607";s:23:"in_reply_to_screen_name";s:11:"nightshiftc";s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:0;s:14:"favorite_count";i:0;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:0:{}s:7:"symbols";a:0:{}s:4:"urls";a:0:{}s:13:"user_mentions";a:1:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:11:"nightshiftc";s:4:"name";s:15:"Cristina Solana";s:2:"id";i:18868607;s:6:"id_str";s:8:"18868607";s:7:"indices";a:2:{i:0;i:0;i:1;i:12;}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:4:"lang";s:2:"en";}', '', 'https://twitter.com/babsgosgens/status/372803567843033089', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `flock_streams.bak` (`platform`, `platform_id`, `date_created`, `raw`, `metadata`, `permalink`, `params`, `language`, `state`, `publish_up`, `publish_down`) VALUES
(1, 373369733640228864, '2013-08-30 09:00:56', 'O:8:"stdClass":23:{s:10:"created_at";s:30:"Fri Aug 30 09:00:56 +0000 2013";s:2:"id";i:373369733640228864;s:6:"id_str";s:18:"373369733640228864";s:4:"text";s:60:"8 Compass extensions you may not know http://t.co/kjlUx31cm7";s:6:"source";s:72:"<a href="http://twitter.com/tweetbutton" rel="nofollow">Tweet Button</a>";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";N;s:25:"in_reply_to_status_id_str";N;s:19:"in_reply_to_user_id";N;s:23:"in_reply_to_user_id_str";N;s:23:"in_reply_to_screen_name";N;s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:0;s:14:"favorite_count";i:0;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:0:{}s:7:"symbols";a:0:{}s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/kjlUx31cm7";s:12:"expanded_url";s:21:"http://disq.us/8evr4b";s:11:"display_url";s:14:"disq.us/8evr4b";s:7:"indices";a:2:{i:0;i:38;i:1;i:60;}}}s:13:"user_mentions";a:0:{}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:18:"possibly_sensitive";b:0;s:4:"lang";s:2:"en";}', '', 'https://twitter.com/babsgosgens/status/373369733640228864', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 375231207300022272, '2013-09-04 12:17:45', 'O:8:"stdClass":23:{s:10:"created_at";s:30:"Wed Sep 04 12:17:45 +0000 2013";s:2:"id";i:375231207300022272;s:6:"id_str";s:18:"375231207300022272";s:4:"text";s:142:"RT @ChiaraAliotta: Have you find a wall for the Pixelles Islands'' poster? @crossinghippos just shared it with me! #office #creativity http:…";s:6:"source";s:3:"web";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";N;s:25:"in_reply_to_status_id_str";N;s:19:"in_reply_to_user_id";N;s:23:"in_reply_to_user_id_str";N;s:23:"in_reply_to_screen_name";N;s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:16:"retweeted_status";O:8:"stdClass":23:{s:10:"created_at";s:30:"Wed Sep 04 12:02:16 +0000 2013";s:2:"id";i:375227307557810176;s:6:"id_str";s:18:"375227307557810176";s:4:"text";s:137:"Have you find a wall for the Pixelles Islands'' poster? @crossinghippos just shared it with me! #office #creativity http://t.co/dOdd7gLa4G";s:6:"source";s:3:"web";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";N;s:25:"in_reply_to_status_id_str";N;s:19:"in_reply_to_user_id";N;s:23:"in_reply_to_user_id_str";N;s:23:"in_reply_to_screen_name";N;s:4:"user";O:8:"stdClass":39:{s:2:"id";i:606062741;s:6:"id_str";s:9:"606062741";s:4:"name";s:14:"Chiara Aliotta";s:11:"screen_name";s:13:"ChiaraAliotta";s:8:"location";s:0:"";s:11:"description";s:133:"Italian designer and typography addict. Founder of the small creative agency, Until Sunday. Enthusiastic web designer at Joomlashack.";s:3:"url";s:22:"http://t.co/fwZSmrZeez";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/fwZSmrZeez";s:12:"expanded_url";s:25:"http://www.untilsunday.it";s:11:"display_url";s:14:"untilsunday.it";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:256;s:12:"listed_count";i:11;s:10:"created_at";s:30:"Tue Jun 12 06:00:49 +0000 2012";s:16:"favourites_count";i:19;s:10:"utc_offset";i:10800;s:9:"time_zone";s:6:"Athens";s:11:"geo_enabled";b:0;s:8:"verified";b:0;s:14:"statuses_count";i:625;s:4:"lang";s:2:"it";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"8C8585";s:28:"profile_background_image_url";s:93:"http://a0.twimg.com/profile_background_images/813643867/2d843f447d1bd5136523574845ba50af.jpeg";s:34:"profile_background_image_url_https";s:95:"https://si0.twimg.com/profile_background_images/813643867/2d843f447d1bd5136523574845ba50af.jpeg";s:23:"profile_background_tile";b:0;s:17:"profile_image_url";s:71:"http://a0.twimg.com/profile_images/2301018825/Chiara_Twitter_normal.png";s:23:"profile_image_url_https";s:73:"https://si0.twimg.com/profile_images/2301018825/Chiara_Twitter_normal.png";s:18:"profile_banner_url";s:58:"https://pbs.twimg.com/profile_banners/606062741/1357910093";s:18:"profile_link_color";s:6:"0084B4";s:28:"profile_sidebar_border_color";s:6:"FFFFFF";s:26:"profile_sidebar_fill_color";s:6:"DDEEF6";s:18:"profile_text_color";s:6:"333333";s:28:"profile_use_background_image";b:1;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";N;s:19:"follow_request_sent";b:0;s:13:"notifications";N;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:2;s:14:"favorite_count";i:1;s:8:"entities";O:8:"stdClass":5:{s:8:"hashtags";a:2:{i:0;O:8:"stdClass":2:{s:4:"text";s:6:"office";s:7:"indices";a:2:{i:0;i:95;i:1;i:102;}}i:1;O:8:"stdClass":2:{s:4:"text";s:10:"creativity";s:7:"indices";a:2:{i:0;i:103;i:1;i:114;}}}s:7:"symbols";a:0:{}s:4:"urls";a:0:{}s:13:"user_mentions";a:1:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:14:"crossinghippos";s:4:"name";s:13:"Babs Gösgens";s:2:"id";i:21284548;s:6:"id_str";s:8:"21284548";s:7:"indices";a:2:{i:0;i:55;i:1;i:70;}}}s:5:"media";a:1:{i:0;O:8:"stdClass":10:{s:2:"id";i:375227307570393088;s:6:"id_str";s:18:"375227307570393088";s:7:"indices";a:2:{i:0;i:115;i:1;i:137;}s:9:"media_url";s:46:"http://pbs.twimg.com/media/BTUTP4nCcAAIjgL.jpg";s:15:"media_url_https";s:47:"https://pbs.twimg.com/media/BTUTP4nCcAAIjgL.jpg";s:3:"url";s:22:"http://t.co/dOdd7gLa4G";s:11:"display_url";s:26:"pic.twitter.com/dOdd7gLa4G";s:12:"expanded_url";s:66:"http://twitter.com/ChiaraAliotta/status/375227307557810176/photo/1";s:4:"type";s:5:"photo";s:5:"sizes";O:8:"stdClass":4:{s:5:"large";O:8:"stdClass":3:{s:1:"w";i:1024;s:1:"h";i:1365;s:6:"resize";s:3:"fit";}s:5:"thumb";O:8:"stdClass":3:{s:1:"w";i:150;s:1:"h";i:150;s:6:"resize";s:4:"crop";}s:5:"small";O:8:"stdClass":3:{s:1:"w";i:340;s:1:"h";i:453;s:6:"resize";s:3:"fit";}s:6:"medium";O:8:"stdClass":3:{s:1:"w";i:600;s:1:"h";i:800;s:6:"resize";s:3:"fit";}}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:18:"possibly_sensitive";b:0;s:4:"lang";s:2:"en";}s:13:"retweet_count";i:2;s:14:"favorite_count";i:0;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:2:{i:0;O:8:"stdClass":2:{s:4:"text";s:6:"office";s:7:"indices";a:2:{i:0;i:114;i:1;i:121;}}i:1;O:8:"stdClass":2:{s:4:"text";s:10:"creativity";s:7:"indices";a:2:{i:0;i:122;i:1;i:133;}}}s:7:"symbols";a:0:{}s:4:"urls";a:0:{}s:13:"user_mentions";a:2:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:13:"ChiaraAliotta";s:4:"name";s:14:"Chiara Aliotta";s:2:"id";i:606062741;s:6:"id_str";s:9:"606062741";s:7:"indices";a:2:{i:0;i:3;i:1;i:17;}}i:1;O:8:"stdClass":5:{s:11:"screen_name";s:14:"crossinghippos";s:4:"name";s:13:"Babs Gösgens";s:2:"id";i:21284548;s:6:"id_str";s:8:"21284548";s:7:"indices";a:2:{i:0;i:74;i:1;i:89;}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:4:"lang";s:2:"en";}', '', 'https://twitter.com/babsgosgens/status/375231207300022272', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 375670051397197824, '2013-09-05 17:21:34', 'O:8:"stdClass":23:{s:10:"created_at";s:30:"Thu Sep 05 17:21:34 +0000 2013";s:2:"id";i:375670051397197824;s:6:"id_str";s:18:"375670051397197824";s:4:"text";s:86:"Hoe staat het met jouw persoonlijk leiderschap? http://t.co/qBJXWldIW5 @TweetFlexfocus";s:6:"source";s:81:"<a href="http://twitter.com/#!/download/ipad" rel="nofollow">Twitter for iPad</a>";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";N;s:25:"in_reply_to_status_id_str";N;s:19:"in_reply_to_user_id";N;s:23:"in_reply_to_user_id_str";N;s:23:"in_reply_to_screen_name";N;s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:0;s:14:"favorite_count";i:0;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:0:{}s:7:"symbols";a:0:{}s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/qBJXWldIW5";s:12:"expanded_url";s:32:"http://www.flexfocus.nl/eyeonme/";s:11:"display_url";s:21:"flexfocus.nl/eyeonme/";s:7:"indices";a:2:{i:0;i:48;i:1;i:70;}}}s:13:"user_mentions";a:1:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:14:"TweetFlexfocus";s:4:"name";s:9:"FlexFocus";s:2:"id";i:170316692;s:6:"id_str";s:9:"170316692";s:7:"indices";a:2:{i:0;i:71;i:1;i:86;}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:18:"possibly_sensitive";b:0;s:4:"lang";s:2:"nl";}', '', 'https://twitter.com/babsgosgens/status/375670051397197824', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 377331138756243457, '2013-09-10 07:22:08', 'O:8:"stdClass":22:{s:10:"created_at";s:30:"Tue Sep 10 07:22:08 +0000 2013";s:2:"id";i:377331138756243457;s:6:"id_str";s:18:"377331138756243457";s:4:"text";s:42:"Thank you @twitter, for including @Pocket.";s:6:"source";s:3:"web";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";N;s:25:"in_reply_to_status_id_str";N;s:19:"in_reply_to_user_id";N;s:23:"in_reply_to_user_id_str";N;s:23:"in_reply_to_screen_name";N;s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:0;s:14:"favorite_count";i:0;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:0:{}s:7:"symbols";a:0:{}s:4:"urls";a:0:{}s:13:"user_mentions";a:2:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:7:"twitter";s:4:"name";s:7:"Twitter";s:2:"id";i:783214;s:6:"id_str";s:6:"783214";s:7:"indices";a:2:{i:0;i:10;i:1;i:18;}}i:1;O:8:"stdClass":5:{s:11:"screen_name";s:6:"Pocket";s:4:"name";s:6:"Pocket";s:2:"id";i:27530178;s:6:"id_str";s:8:"27530178";s:7:"indices";a:2:{i:0;i:34;i:1;i:41;}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:4:"lang";s:2:"en";}', '', 'https://twitter.com/babsgosgens/status/377331138756243457', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 378777744152465408, '2013-09-14 07:10:26', 'O:8:"stdClass":22:{s:10:"created_at";s:30:"Sat Sep 14 07:10:26 +0000 2013";s:2:"id";i:378777744152465408;s:6:"id_str";s:18:"378777744152465408";s:4:"text";s:111:"@nightshiftc @YourAnonNews quite likely that means we will now start to complain about the inherent lay-offs ;)";s:6:"source";s:82:"<a href="http://twitter.com/download/iphone" rel="nofollow">Twitter for iPhone</a>";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";i:378737296469946368;s:25:"in_reply_to_status_id_str";s:18:"378737296469946368";s:19:"in_reply_to_user_id";i:18868607;s:23:"in_reply_to_user_id_str";s:8:"18868607";s:23:"in_reply_to_screen_name";s:11:"nightshiftc";s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:0;s:14:"favorite_count";i:0;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:0:{}s:7:"symbols";a:0:{}s:4:"urls";a:0:{}s:13:"user_mentions";a:2:{i:0;O:8:"stdClass":5:{s:11:"screen_name";s:11:"nightshiftc";s:4:"name";s:15:"Cristina Solana";s:2:"id";i:18868607;s:6:"id_str";s:8:"18868607";s:7:"indices";a:2:{i:0;i:0;i:1;i:12;}}i:1;O:8:"stdClass":5:{s:11:"screen_name";s:12:"YourAnonNews";s:4:"name";s:9:"Anonymous";s:2:"id";i:279390084;s:6:"id_str";s:9:"279390084";s:7:"indices";a:2:{i:0;i:13;i:1;i:26;}}}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:4:"lang";s:2:"en";}', '', 'https://twitter.com/babsgosgens/status/378777744152465408', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(1, 378800222912405504, '2013-09-14 08:39:45', 'O:8:"stdClass":22:{s:10:"created_at";s:30:"Sat Sep 14 08:39:45 +0000 2013";s:2:"id";i:378800222912405504;s:6:"id_str";s:18:"378800222912405504";s:4:"text";s:61:"OH: I am utterly indecisive when it comes to making decisions";s:6:"source";s:101:"<a href="http://itunes.apple.com/us/app/twitter/id409789998?mt=12" rel="nofollow">Twitter for Mac</a>";s:9:"truncated";b:0;s:21:"in_reply_to_status_id";N;s:25:"in_reply_to_status_id_str";N;s:19:"in_reply_to_user_id";N;s:23:"in_reply_to_user_id_str";N;s:23:"in_reply_to_screen_name";N;s:4:"user";O:8:"stdClass":38:{s:2:"id";i:110107572;s:6:"id_str";s:9:"110107572";s:4:"name";s:13:"Babs Gösgens";s:11:"screen_name";s:11:"babsgosgens";s:8:"location";s:8:"Rosmalen";s:11:"description";s:136:"(Web)designer and developer, stubborn as hell, always questioning everything. Likes to re-invent the wheel to see if it can be approved.";s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:8:"entities";O:8:"stdClass":2:{s:3:"url";O:8:"stdClass":1:{s:4:"urls";a:1:{i:0;O:8:"stdClass":4:{s:3:"url";s:22:"http://t.co/mVyGyCzTSc";s:12:"expanded_url";s:24:"http://crossinghippos.nl";s:11:"display_url";s:17:"crossinghippos.nl";s:7:"indices";a:2:{i:0;i:0;i:1;i:22;}}}}s:11:"description";O:8:"stdClass":1:{s:4:"urls";a:0:{}}}s:9:"protected";b:0;s:15:"followers_count";i:203;s:13:"friends_count";i:175;s:12:"listed_count";i:13;s:10:"created_at";s:30:"Sun Jan 31 10:49:47 +0000 2010";s:16:"favourites_count";i:69;s:10:"utc_offset";i:-7200;s:9:"time_zone";s:9:"Greenland";s:11:"geo_enabled";b:1;s:8:"verified";b:0;s:14:"statuses_count";i:1134;s:4:"lang";s:2:"en";s:20:"contributors_enabled";b:0;s:13:"is_translator";b:0;s:24:"profile_background_color";s:6:"131516";s:28:"profile_background_image_url";s:92:"http://a0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:34:"profile_background_image_url_https";s:94:"https://si0.twimg.com/profile_background_images/252041055/xc5e06aac9fb164bd92751bc0447b3eb.png";s:23:"profile_background_tile";b:1;s:17:"profile_image_url";s:62:"http://a0.twimg.com/profile_images/1350320952/jab11_normal.png";s:23:"profile_image_url_https";s:64:"https://si0.twimg.com/profile_images/1350320952/jab11_normal.png";s:18:"profile_link_color";s:6:"009999";s:28:"profile_sidebar_border_color";s:6:"EEEEEE";s:26:"profile_sidebar_fill_color";s:6:"EFEFEF";s:18:"profile_text_color";s:6:"000000";s:28:"profile_use_background_image";b:0;s:15:"default_profile";b:0;s:21:"default_profile_image";b:0;s:9:"following";b:0;s:19:"follow_request_sent";b:0;s:13:"notifications";b:0;}s:3:"geo";N;s:11:"coordinates";N;s:5:"place";N;s:12:"contributors";N;s:13:"retweet_count";i:0;s:14:"favorite_count";i:0;s:8:"entities";O:8:"stdClass":4:{s:8:"hashtags";a:0:{}s:7:"symbols";a:0:{}s:4:"urls";a:0:{}s:13:"user_mentions";a:0:{}}s:9:"favorited";b:0;s:9:"retweeted";b:0;s:4:"lang";s:2:"en";}', '', 'https://twitter.com/babsgosgens/status/378800222912405504', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 0, '2013-09-16 18:37:23', 'a:10:{i:0;O:8:"stdClass":17:{s:2:"id";s:31:"100002043048057_511826638895433";s:4:"from";O:8:"stdClass":2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:172:"Je kunt van Facebook vinden wat je vind, maar dit is een fantastisch initiatief. Internet is een effectieve manier om Afrika (en andere derde wereld landen) te ontwikkelen.";s:7:"picture";s:190:"https://fbexternal-a.akamaihd.net/safe_image.php?d=AQB7khFg4uOvKjmg&w=154&h=154&url=https%3A%2F%2Fassets-stacksocial.netdna-ssl.com%2Fuploaded_screenshot_1s%2F5371%2Fredesign_3_Lens_Redo.png";s:4:"link";s:105:"http://designtaxi.com/news/360444/Mark-Zuckerberg-Announces-Launch-Of-Internet-org/#.Ui10GiKcXL8.facebook";s:4:"name";s:71:"Mark Zuckerberg Announces Launch Of ‘Internet.org’ - DesignTAXI.com";s:7:"caption";s:14:"designtaxi.com";s:11:"description";s:71:"Mark Zuckerberg Announces Launch Of ‘Internet.org’ - DesignTAXI.com";s:4:"icon";s:64:"https://fbstatic-a.akamaihd.net/rsrc.php/v2/yq/r/SC2ZmEkfI-X.png";s:7:"actions";a:1:{i:0;O:8:"stdClass":2:{s:4:"name";s:7:"Comment";s:4:"link";s:62:"https://www.facebook.com/100002043048057/posts/511826638895433";}}s:7:"privacy";O:8:"stdClass":1:{s:5:"value";s:0:"";}s:4:"type";s:4:"link";s:11:"status_type";s:12:"shared_story";s:11:"application";O:8:"stdClass":2:{s:4:"name";s:17:"Share_bookmarklet";s:2:"id";s:10:"5085647995";}s:12:"created_time";s:24:"2013-09-09T07:14:03+0000";s:12:"updated_time";s:24:"2013-09-09T07:14:03+0000";s:5:"likes";O:8:"stdClass":2:{s:4:"data";a:1:{i:0;O:8:"stdClass":2:{s:4:"name";s:14:"Chiara Aliotta";s:2:"id";s:15:"100001572064534";}}s:5:"count";i:1;}}i:1;O:8:"stdClass":11:{s:2:"id";s:31:"100002043048057_510178002393630";s:4:"from";O:8:"stdClass":2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:81:"OH: we''ve been gone for 10 years. This is a whole new generation of pickup girls.";s:7:"actions";a:1:{i:0;O:8:"stdClass":2:{s:4:"name";s:7:"Comment";s:4:"link";s:62:"https://www.facebook.com/100002043048057/posts/510178002393630";}}s:7:"privacy";O:8:"stdClass":1:{s:5:"value";s:0:"";}s:4:"type";s:6:"status";s:11:"status_type";s:20:"mobile_status_update";s:11:"application";O:8:"stdClass":3:{s:4:"name";s:19:"Facebook for iPhone";s:9:"namespace";s:8:"fbiphone";s:2:"id";s:10:"6628568379";}s:12:"created_time";s:24:"2013-09-05T18:17:24+0000";s:12:"updated_time";s:24:"2013-09-06T06:15:24+0000";s:8:"comments";O:8:"stdClass":2:{s:4:"data";a:2:{i:0;O:8:"stdClass":7:{s:2:"id";s:24:"510178002393630_72911604";s:4:"from";O:8:"stdClass":2:{s:4:"name";s:20:"Ingrid Van de Mortel";s:2:"id";s:15:"100000118808401";}s:7:"message";s:25:"Pick-up girls in Turkije?";s:10:"can_remove";b:1;s:12:"created_time";s:24:"2013-09-05T22:42:10+0000";s:10:"like_count";i:0;s:10:"user_likes";b:0;}i:1;O:8:"stdClass":7:{s:2:"id";s:24:"510178002393630_72912540";s:4:"from";O:8:"stdClass":2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:17:"Lol, nee in Ghana";s:10:"can_remove";b:1;s:12:"created_time";s:24:"2013-09-06T06:15:24+0000";s:10:"like_count";i:0;s:10:"user_likes";b:0;}}s:6:"paging";O:8:"stdClass":1:{s:7:"cursors";O:8:"stdClass":2:{s:5:"after";s:4:"Mg==";s:6:"before";s:4:"MQ==";}}}}i:2;O:8:"stdClass":10:{s:2:"id";s:31:"100002043048057_510169425727821";s:4:"from";O:8:"stdClass":2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:78:"Hoe zit het met jouw persoonlijk leiderschap? Http://www.flexfocus.nl/eyeonme/";s:7:"actions";a:1:{i:0;O:8:"stdClass":2:{s:4:"name";s:7:"Comment";s:4:"link";s:62:"https://www.facebook.com/100002043048057/posts/510169425727821";}}s:7:"privacy";O:8:"stdClass":1:{s:5:"value";s:0:"";}s:4:"type";s:6:"status";s:11:"status_type";s:20:"mobile_status_update";s:11:"application";O:8:"stdClass":3:{s:4:"name";s:19:"Facebook for iPhone";s:9:"namespace";s:8:"fbiphone";s:2:"id";s:10:"6628568379";}s:12:"created_time";s:24:"2013-09-05T17:45:21+0000";s:12:"updated_time";s:24:"2013-09-05T17:45:21+0000";}i:3;O:8:"stdClass":18:{s:2:"id";s:31:"100002043048057_508874709190626";s:4:"from";O:8:"stdClass":2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:59:"Onderteken de petitie, de zelfstandigenaftrek moet blijven.";s:7:"picture";s:141:"https://fbexternal-a.akamaihd.net/safe_image.php?d=AQDylb_ySD0RTvCp&w=154&h=154&url=http%3A%2F%2Fcdn.petitions24.com%2Fimages%2Fpetition4.jpg";s:4:"link";s:61:"http://www.petities24.com/de_zelfstandigenaftrek_moet_blijven";s:4:"name";s:35:"De Zelfstandigenaftrek Moet Blijven";s:7:"caption";s:18:"www.petities24.com";s:11:"description";s:307:"Volgens het FD van 6 augustus hebben VVD en PvdA het voornemen de zelfstandigenaftrek in de inkomstenbelasting af te schaffen of flink te beperken. Ook wordt gesproken over de optie de zelfstandigenaftrek te laten bestaan, maar een ‘zzp-belasting’ in te voeren, wat voor een grote groep ondernemers o...";s:4:"icon";s:64:"https://fbstatic-a.akamaihd.net/rsrc.php/v2/yD/r/aS8ecmYRys0.gif";s:7:"actions";a:1:{i:0;O:8:"stdClass":2:{s:4:"name";s:7:"Comment";s:4:"link";s:62:"https://www.facebook.com/100002043048057/posts/508874709190626";}}s:7:"privacy";O:8:"stdClass":1:{s:5:"value";s:0:"";}s:4:"type";s:4:"link";s:11:"status_type";s:12:"shared_story";s:11:"application";O:8:"stdClass":2:{s:4:"name";s:17:"Share_bookmarklet";s:2:"id";s:10:"5085647995";}s:12:"created_time";s:24:"2013-09-02T08:31:31+0000";s:12:"updated_time";s:24:"2013-09-04T20:00:04+0000";s:5:"likes";O:8:"stdClass":2:{s:4:"data";a:3:{i:0;O:8:"stdClass":2:{s:4:"name";s:9:"Anja Hage";s:2:"id";s:10:"1190245832";}i:1;O:8:"stdClass":2:{s:4:"name";s:26:"Danny Pasquale Mooi Somers";s:2:"id";s:10:"1535917549";}i:2;O:8:"stdClass":2:{s:4:"name";s:10:"Ray Bogman";s:2:"id";s:10:"1053573691";}}s:5:"count";i:3;}s:8:"comments";O:8:"stdClass":2:{s:4:"data";a:1:{i:0;O:8:"stdClass":7:{s:2:"id";s:24:"508874709190626_72909269";s:4:"from";O:8:"stdClass":2:{s:4:"name";s:9:"Anja Hage";s:2:"id";s:10:"1190245832";}s:7:"message";s:18:"Helemaal mee eens!";s:10:"can_remove";b:1;s:12:"created_time";s:24:"2013-09-04T20:00:04+0000";s:10:"like_count";i:0;s:10:"user_likes";b:0;}}s:6:"paging";O:8:"stdClass":1:{s:7:"cursors";O:8:"stdClass":2:{s:5:"after";s:4:"MQ==";s:6:"before";s:4:"MQ==";}}}}i:4;O:8:"stdClass":20:{s:2:"id";s:31:"100002043048057_506947236050040";s:4:"from";O:8:"stdClass":2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:32:"A parting gift from my intern :)";s:5:"story";s:45:"Babs Gösgens shared Crossing Hippos''s photo.";s:7:"picture";s:94:"https://fbcdn-photos-e-a.akamaihd.net/hphotos-ak-prn2/971646_10151803256899190_784280329_s.jpg";s:4:"link";s:112:"https://www.facebook.com/photo.php?fbid=10151803256899190&set=a.10151803256879190.1073741825.354579394189&type=1";s:4:"name";s:15:"Timeline Photos";s:7:"caption";s:37:"A little parting gift from my intern:";s:10:"properties";a:1:{i:0;O:8:"stdClass":3:{s:4:"name";s:2:"By";s:4:"text";s:15:"Crossing Hippos";s:4:"href";s:70:"https://www.facebook.com/pages/Crossing-Hippos/354579394189?ref=stream";}}s:4:"icon";s:64:"https://fbstatic-a.akamaihd.net/rsrc.php/v2/yD/r/aS8ecmYRys0.gif";s:7:"actions";a:1:{i:0;O:8:"stdClass":2:{s:4:"name";s:7:"Comment";s:4:"link";s:62:"https://www.facebook.com/100002043048057/posts/506947236050040";}}s:7:"privacy";O:8:"stdClass":1:{s:5:"value";s:0:"";}s:4:"type";s:5:"photo";s:11:"status_type";s:12:"shared_story";s:9:"object_id";s:17:"10151803256899190";s:11:"application";O:8:"stdClass":2:{s:4:"name";s:6:"Photos";s:2:"id";s:10:"2305272732";}s:12:"created_time";s:24:"2013-08-28T12:58:45+0000";s:12:"updated_time";s:24:"2013-08-29T06:01:39+0000";s:5:"likes";O:8:"stdClass":2:{s:4:"data";a:4:{i:0;O:8:"stdClass":2:{s:4:"name";s:14:"Monique Geelen";s:2:"id";s:15:"100000614318417";}i:1;O:8:"stdClass":2:{s:4:"name";s:10:"Rob Geelen";s:2:"id";s:15:"100000637137209";}i:2;O:8:"stdClass":2:{s:4:"name";s:19:"Evelien van Leeuwen";s:2:"id";s:15:"100002484416240";}i:3;O:8:"stdClass":2:{s:4:"name";s:16:"Marie-anne Melis";s:2:"id";s:15:"100001708111454";}}s:5:"count";i:10;}s:8:"comments";O:8:"stdClass":2:{s:4:"data";a:1:{i:0;O:8:"stdClass":7:{s:2:"id";s:24:"506947236050040_72896106";s:4:"from";O:8:"stdClass":2:{s:4:"name";s:14:"Chiara Aliotta";s:2:"id";s:15:"100001572064534";}s:7:"message";s:8:"so cute!";s:10:"can_remove";b:1;s:12:"created_time";s:24:"2013-08-29T06:01:39+0000";s:10:"like_count";i:1;s:10:"user_likes";b:1;}}s:6:"paging";O:8:"stdClass":1:{s:7:"cursors";O:8:"stdClass":2:{s:5:"after";s:4:"MQ==";s:6:"before";s:4:"MQ==";}}}}i:5;O:8:"stdClass":15:{s:2:"id";s:31:"100002043048057_502130456531718";s:4:"from";O:8:"stdClass":2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:209:"Almost unreal: these petals look like actual feathers! Tulips are beautiful :) http://www.flowermuse.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/d/a/dark-purple-parrot-tulips-1.jpg";s:7:"picture";s:240:"https://fbexternal-a.akamaihd.net/safe_image.php?d=AQB48SArFnfbEc5E&w=154&h=154&url=http%3A%2F%2Fwww.flowermuse.com%2Fmedia%2Fcatalog%2Fproduct%2Fcache%2F1%2Fimage%2F9df78eab33525d08d6e5fb8d27136e95%2Fd%2Fa%2Fdark-purple-parrot-tulips-1.jpg";s:4:"link";s:130:"http://www.flowermuse.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/d/a/dark-purple-parrot-tulips-1.jpg";s:4:"name";s:100:"http://www.flowermuse.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/d/a/d";s:7:"caption";s:18:"www.flowermuse.com";s:4:"icon";s:64:"https://fbstatic-a.akamaihd.net/rsrc.php/v2/yz/r/StEh3RhPvjk.gif";s:7:"actions";a:1:{i:0;O:8:"stdClass":2:{s:4:"name";s:7:"Comment";s:4:"link";s:62:"https://www.facebook.com/100002043048057/posts/502130456531718";}}s:7:"privacy";O:8:"stdClass":1:{s:5:"value";s:0:"";}s:4:"type";s:4:"link";s:11:"status_type";s:12:"shared_story";s:12:"created_time";s:24:"2013-08-16T19:44:30+0000";s:12:"updated_time";s:24:"2013-08-17T08:42:31+0000";s:8:"comments";O:8:"stdClass":2:{s:4:"data";a:1:{i:0;O:8:"stdClass":7:{s:2:"id";s:24:"502130456531718_72870174";s:4:"from";O:8:"stdClass":2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:63:"http://flowerpics.net/wp-content/uploads/2011/10/Tulip-0040.jpg";s:10:"can_remove";b:1;s:12:"created_time";s:24:"2013-08-17T08:42:31+0000";s:10:"like_count";i:0;s:10:"user_likes";b:0;}}s:6:"paging";O:8:"stdClass":1:{s:7:"cursors";O:8:"stdClass":2:{s:5:"after";s:4:"MQ==";s:6:"before";s:4:"MQ==";}}}}i:6;O:8:"stdClass":16:{s:2:"id";s:31:"100002043048057_502128869865210";s:4:"from";O:8:"stdClass":2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:108:"My son would love these :) http://hotpenguin.net/despicable-me-minions-dressed-up-as-pop-culture-characters/";s:7:"picture";s:214:"https://fbexternal-a.akamaihd.net/safe_image.php?d=AQDQrSQjwZUDiZsa&w=154&h=154&url=http%3A%2F%2Fhotpenguin.net%2Fwp-content%2Fuploads%2F2013%2F08%2FDespicable-Me-Minions-Dressed-Up-as-Pop-Culture-Characters-16.jpg";s:4:"link";s:81:"http://hotpenguin.net/despicable-me-minions-dressed-up-as-pop-culture-characters/";s:4:"name";s:58:"Despicable Me Minions Dressed Up as Pop Culture Characters";s:7:"caption";s:14:"hotpenguin.net";s:11:"description";s:307:"Whether you’ve seen the sequel to Despicable Me or not, chances are good you know exactly who the Minions are. These yellow colored, cylinder shaped creatures are the most notable characters from the film, and we’ve definitely been infatuated with them since the original movie hit the big screen bac...";s:4:"icon";s:64:"https://fbstatic-a.akamaihd.net/rsrc.php/v2/yD/r/aS8ecmYRys0.gif";s:7:"actions";a:1:{i:0;O:8:"stdClass":2:{s:4:"name";s:7:"Comment";s:4:"link";s:62:"https://www.facebook.com/100002043048057/posts/502128869865210";}}s:7:"privacy";O:8:"stdClass":1:{s:5:"value";s:0:"";}s:4:"type";s:4:"link";s:11:"status_type";s:12:"shared_story";s:12:"created_time";s:24:"2013-08-16T19:38:50+0000";s:12:"updated_time";s:24:"2013-08-16T19:38:50+0000";s:5:"likes";O:8:"stdClass":2:{s:4:"data";a:1:{i:0;O:8:"stdClass":2:{s:4:"name";s:11:"Jadie Valke";s:2:"id";s:15:"100002687248147";}}s:5:"count";i:1;}}i:7;O:8:"stdClass":20:{s:2:"id";s:31:"100002043048057_501930176551746";s:4:"from";O:8:"stdClass":2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:19:"Me likes puppies :)";s:5:"story";s:43:"Babs Gösgens shared Omg Teens ღ''s photo.";s:7:"picture";s:92:"https://fbcdn-photos-c-a.akamaihd.net/hphotos-ak-prn1/61252_377524772376830_1081752550_s.jpg";s:4:"link";s:106:"https://www.facebook.com/photo.php?fbid=377524772376830&set=a.290300631099245.67566.290299417766033&type=1";s:4:"name";s:15:"Timeline Photos";s:7:"caption";s:11:"Like - cute";s:10:"properties";a:1:{i:0;O:8:"stdClass":3:{s:4:"name";s:2:"By";s:4:"text";s:13:"Omg Teens ღ";s:4:"href";s:77:"https://www.facebook.com/pages/Omg-Teens-%E1%83%A6/290299417766033?ref=stream";}}s:4:"icon";s:64:"https://fbstatic-a.akamaihd.net/rsrc.php/v2/yD/r/aS8ecmYRys0.gif";s:7:"actions";a:1:{i:0;O:8:"stdClass":2:{s:4:"name";s:7:"Comment";s:4:"link";s:62:"https://www.facebook.com/100002043048057/posts/501930176551746";}}s:7:"privacy";O:8:"stdClass":1:{s:5:"value";s:0:"";}s:4:"type";s:5:"photo";s:11:"status_type";s:12:"shared_story";s:9:"object_id";s:15:"377524772376830";s:11:"application";O:8:"stdClass":3:{s:4:"name";s:17:"Facebook for iPad";s:9:"namespace";s:7:"fbipad_";s:2:"id";s:15:"173847642670370";}s:12:"created_time";s:24:"2013-08-16T06:18:27+0000";s:12:"updated_time";s:24:"2013-08-19T07:37:36+0000";s:5:"likes";O:8:"stdClass":2:{s:4:"data";a:2:{i:0;O:8:"stdClass":2:{s:4:"name";s:15:"Caroline Cammel";s:2:"id";s:15:"100005638273798";}i:1;O:8:"stdClass":2:{s:4:"name";s:17:"Yao Van Landewijk";s:2:"id";s:9:"619341845";}}s:5:"count";i:2;}s:8:"comments";O:8:"stdClass":2:{s:4:"data";a:5:{i:0;O:8:"stdClass":7:{s:2:"id";s:24:"501930176551746_72868021";s:4:"from";O:8:"stdClass":2:{s:4:"name";s:13:"Kitty Mulders";s:2:"id";s:15:"100002168575919";}s:7:"message";s:56:"lachen leuk hoor, lijkt wel of ze aan een borrel drinken";s:10:"can_remove";b:1;s:12:"created_time";s:24:"2013-08-16T06:26:33+0000";s:10:"like_count";i:0;s:10:"user_likes";b:0;}i:1;O:8:"stdClass":7:{s:2:"id";s:24:"501930176551746_72868059";s:4:"from";O:8:"stdClass":2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:44:"En zo te zien hebben ze er al een paar op :)";s:10:"can_remove";b:1;s:12:"created_time";s:24:"2013-08-16T07:16:03+0000";s:10:"like_count";i:1;s:10:"user_likes";b:0;}i:2;O:8:"stdClass":8:{s:2:"id";s:24:"501930176551746_72868389";s:4:"from";O:8:"stdClass":2:{s:4:"name";s:14:"Chiara Aliotta";s:2:"id";s:15:"100001572064534";}s:7:"message";s:61:"Babs, if you had 5 like my cat you would call for bankruptcy!";s:12:"message_tags";a:1:{i:0;O:8:"stdClass":5:{s:2:"id";s:15:"100002043048057";s:4:"name";s:4:"Babs";s:4:"type";s:4:"user";s:6:"offset";i:0;s:6:"length";i:4;}}s:10:"can_remove";b:1;s:12:"created_time";s:24:"2013-08-16T12:51:29+0000";s:10:"like_count";i:1;s:10:"user_likes";b:1;}i:3;O:8:"stdClass":7:{s:2:"id";s:24:"501930176551746_72868755";s:4:"from";O:8:"stdClass":2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:151:"I had a litter once... Four healthy ones and one dead one :( They were adorable but TG we had housekeeping - those tiny puppies can make a huge mess ;)";s:10:"can_remove";b:1;s:12:"created_time";s:24:"2013-08-16T17:11:55+0000";s:10:"like_count";i:0;s:10:"user_likes";b:0;}i:4;O:8:"stdClass":7:{s:2:"id";s:24:"501930176551746_72873948";s:4:"from";O:8:"stdClass":2:{s:4:"name";s:15:"Caroline Cammel";s:2:"id";s:15:"100005638273798";}s:7:"message";s:18:"Schattig!!!!!!', '', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 370769586334473, '2012-09-29 16:24:29', 'a:7:{s:2:"id";s:15:"370769586334473";s:4:"from";a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:37:"JC, wat heb ik vandaag weer gelachen!";s:12:"updated_time";s:24:"2012-09-29T16:24:29+0000";s:4:"tags";a:2:{s:4:"data";a:4:{i:0;a:2:{s:2:"id";s:15:"100000118808401";s:4:"name";s:20:"Ingrid Van de Mortel";}i:1;a:2:{s:2:"id";s:15:"100002632552238";s:4:"name";s:15:"Marijke Wiegers";}i:2;a:2:{s:2:"id";s:10:"1528179752";s:4:"name";s:13:"Wenda Hagting";}i:3;a:2:{s:2:"id";s:10:"1513537157";s:4:"name";s:16:"Claartje Furlong";}}s:6:"paging";a:1:{s:4:"next";s:88:"https://graph.facebook.com/370769586334473/tags?limit=25&offset=25&__after_id=1513537157";}}s:5:"likes";a:2:{s:4:"data";a:5:{i:0;a:2:{s:2:"id";s:15:"100002632552238";s:4:"name";s:15:"Marijke Wiegers";}i:1;a:2:{s:2:"id";s:10:"1516839310";s:4:"name";s:20:"Annemieke van Boxtel";}i:2;a:2:{s:2:"id";s:10:"1528179752";s:4:"name";s:13:"Wenda Hagting";}i:3;a:2:{s:2:"id";s:9:"787448164";s:4:"name";s:22:"Karijn van den Bossche";}i:4;a:2:{s:2:"id";s:15:"100002498076612";s:4:"name";s:12:"Jan Gösgens";}}s:6:"paging";a:1:{s:7:"cursors";a:2:{s:5:"after";s:20:"MTAwMDAyNDk4MDc2NjEy";s:6:"before";s:20:"MTAwMDAyNjMyNTUyMjM4";}}}s:8:"comments";a:2:{s:4:"data";a:3:{i:0;a:7:{s:2:"id";s:23:"370769586334473_2424730";s:4:"from";a:2:{s:4:"name";s:12:"Jan Gösgens";s:2:"id";s:15:"100002498076612";}s:7:"message";s:16:"Dat klinkt goed!";s:10:"can_remove";b:1;s:12:"created_time";s:24:"2012-09-29T18:06:20+0000";s:10:"like_count";i:0;s:10:"user_likes";b:0;}i:1;a:7:{s:2:"id";s:23:"370769586334473_2425495";s:4:"from";a:2:{s:4:"name";s:13:"Wenda Hagting";s:2:"id";s:10:"1528179752";}s:7:"message";s:16:"Helemaaal leuk x";s:10:"can_remove";b:1;s:12:"created_time";s:24:"2012-09-29T21:55:39+0000";s:10:"like_count";i:0;s:10:"user_likes";b:0;}i:2;a:7:{s:2:"id";s:23:"370769586334473_2429540";s:4:"from";a:2:{s:4:"name";s:18:"Annemarie van Lent";s:2:"id";s:10:"1210568023";}s:7:"message";s:36:"en zo hoort het ook, fun in the sun!";s:10:"can_remove";b:1;s:12:"created_time";s:24:"2012-10-01T08:10:26+0000";s:10:"like_count";i:0;s:10:"user_likes";b:0;}}s:6:"paging";a:1:{s:7:"cursors";a:2:{s:5:"after";s:4:"Mw==";s:6:"before";s:4:"MQ==";}}}}', 'a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 373663749378390, '2012-10-07 12:48:19', 'a:5:{s:2:"id";s:15:"373663749378390";s:4:"from";a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:72:"https://mobile.twitter.com/babsgosgens/status/254842047771594752?photo=1";s:12:"updated_time";s:24:"2012-10-07T12:48:19+0000";s:5:"likes";a:2:{s:4:"data";a:1:{i:0;a:2:{s:2:"id";s:9:"535967346";s:4:"name";s:12:"Peter Martin";}}s:6:"paging";a:1:{s:7:"cursors";a:2:{s:5:"after";s:12:"NTM1OTY3MzQ2";s:6:"before";s:12:"NTM1OTY3MzQ2";}}}}', 'a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 373750979369667, '2012-10-07 18:02:28', 'a:5:{s:2:"id";s:15:"373750979369667";s:4:"from";a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:50:"Dank allen/thanks all :) This was a nice birthday!";s:12:"updated_time";s:24:"2012-10-07T18:02:28+0000";s:5:"likes";a:2:{s:4:"data";a:2:{i:0;a:2:{s:2:"id";s:15:"100000614318417";s:4:"name";s:14:"Monique Geelen";}i:1;a:2:{s:2:"id";s:9:"743354838";s:4:"name";s:10:"Jen Kramer";}}s:6:"paging";a:1:{s:7:"cursors";a:2:{s:5:"after";s:12:"NzQzMzU0ODM4";s:6:"before";s:20:"MTAwMDAwNjE0MzE4NDE3";}}}}', 'a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 390711517673613, '2012-11-23 12:32:52', 'a:6:{s:2:"id";s:15:"390711517673613";s:4:"from";a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:18:"Erik Jan en Gerrit";s:12:"updated_time";s:24:"2012-11-23T12:32:52+0000";s:5:"likes";a:2:{s:4:"data";a:2:{i:0;a:2:{s:2:"id";s:15:"100001160074221";s:4:"name";s:12:"Joke De Haan";}i:1;a:2:{s:2:"id";s:15:"100002498076612";s:4:"name";s:12:"Jan Gösgens";}}s:6:"paging";a:1:{s:7:"cursors";a:2:{s:5:"after";s:20:"MTAwMDAyNDk4MDc2NjEy";s:6:"before";s:20:"MTAwMDAxMTYwMDc0MjIx";}}}s:8:"comments";a:2:{s:4:"data";a:3:{i:0;a:7:{s:2:"id";s:24:"390711517673613_72138923";s:4:"from";a:2:{s:4:"name";s:10:"Rob Geelen";s:2:"id";s:15:"100000637137209";}s:7:"message";s:31:"Is Gerrit een nieuwe aanwinst??";s:10:"can_remove";b:1;s:12:"created_time";s:24:"2012-11-23T15:32:28+0000";s:10:"like_count";i:0;s:10:"user_likes";b:0;}i:1;a:7:{s:2:"id";s:24:"390711517673613_72138936";s:4:"from";a:2:{s:4:"name";s:15:"Jeroen Gösgens";s:2:"id";s:9:"691508720";}s:7:"message";s:7:"Gerrit?";s:10:"can_remove";b:1;s:12:"created_time";s:24:"2012-11-23T15:36:34+0000";s:10:"like_count";i:0;s:10:"user_likes";b:0;}i:2;a:7:{s:2:"id";s:24:"390711517673613_72141216";s:4:"from";a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:37:"Niet bij ons, maar wel bij oma Sas :)";s:10:"can_remove";b:1;s:12:"created_time";s:24:"2012-11-24T07:57:15+0000";s:10:"like_count";i:0;s:10:"user_likes";b:0;}}s:6:"paging";a:1:{s:7:"cursors";a:2:{s:5:"after";s:4:"Mw==";s:6:"before";s:4:"MQ==";}}}}', 'a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 426061367471961, '2013-02-10 19:40:53', 'a:6:{s:2:"id";s:15:"426061367471961";s:4:"from";a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:100:"SAY WHAT? Voor optimaal gebruik van deze pagina''s kunt u het beste Netscape 2.0+ of hoger gebruiken.";s:12:"updated_time";s:24:"2013-02-10T19:40:53+0000";s:5:"likes";a:2:{s:4:"data";a:2:{i:0;a:2:{s:2:"id";s:15:"100002841979979";s:4:"name";s:17:"Anita Weltevreden";}i:1;a:2:{s:2:"id";s:10:"1053573691";s:4:"name";s:10:"Ray Bogman";}}s:6:"paging";a:1:{s:7:"cursors";a:2:{s:5:"after";s:16:"MTA1MzU3MzY5MQ==";s:6:"before";s:20:"MTAwMDAyODQxOTc5OTc5";}}}s:8:"comments";a:2:{s:4:"data";a:1:{i:0;a:7:{s:2:"id";s:24:"426061367471961_72386323";s:4:"from";a:2:{s:4:"name";s:17:"Anita Weltevreden";s:2:"id";s:15:"100002841979979";}s:7:"message";s:28:"Dat is wel heel old skool :)";s:10:"can_remove";b:1;s:12:"created_time";s:24:"2013-02-10T21:24:01+0000";s:10:"like_count";i:0;s:10:"user_likes";b:0;}}s:6:"paging";a:1:{s:7:"cursors";a:2:{s:5:"after";s:4:"MQ==";s:6:"before";s:4:"MQ==";}}}}', 'a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 437505249660906, '2013-03-11 10:27:39', 'a:5:{s:2:"id";s:15:"437505249660906";s:4:"from";a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:97:"“When we really see each other, we want to help each other.”\n\nBeautiful. And thankfully true.";s:12:"updated_time";s:24:"2013-03-11T10:27:39+0000";s:5:"likes";a:2:{s:4:"data";a:2:{i:0;a:2:{s:2:"id";s:9:"579089670";s:4:"name";s:10:"Paul Orwig";}i:1;a:2:{s:2:"id";s:15:"100000205000698";s:4:"name";s:14:"Christian Hent";}}s:6:"paging";a:1:{s:7:"cursors";a:2:{s:5:"after";s:20:"MTAwMDAwMjA1MDAwNjk4";s:6:"before";s:12:"NTc5MDg5Njcw";}}}}', 'a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 472958119448952, '2013-06-07 08:38:04', 'a:4:{s:2:"id";s:15:"472958119448952";s:4:"from";a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:92:"Mijn zoon vanochtend, in de auto op weg naar school: "mama, kun je radio wat warmer zetten?"";s:12:"updated_time";s:24:"2013-06-07T08:38:04+0000";}', 'a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 494481377296626, '2013-07-28 18:03:00', 'a:6:{s:2:"id";s:15:"494481377296626";s:4:"from";a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:79:"Leuke fotoos van Rafi, Ejan, Jadie Valke en Evelien van Leeuwen in Euro Disney.";s:12:"updated_time";s:24:"2013-07-28T18:03:00+0000";s:4:"tags";a:2:{s:4:"data";a:5:{i:0;a:2:{s:2:"id";s:15:"100000374518354";s:4:"name";s:12:"Michel Valke";}i:1;a:2:{s:2:"id";s:15:"100002498076612";s:4:"name";s:12:"Jan Gösgens";}i:2;a:2:{s:2:"id";s:10:"1718467445";s:4:"name";s:14:"Angeline Valke";}i:3;a:2:{s:2:"id";s:15:"100002484416240";s:4:"name";s:19:"Evelien van Leeuwen";}i:4;a:2:{s:2:"id";s:15:"100002687248147";s:4:"name";s:11:"Jadie Valke";}}s:6:"paging";a:1:{s:4:"next";s:93:"https://graph.facebook.com/494481377296626/tags?limit=25&offset=25&__after_id=100002687248147";}}s:5:"likes";a:2:{s:4:"data";a:7:{i:0;a:2:{s:2:"id";s:10:"1590183300";s:4:"name";s:15:"Jeroen van Oers";}i:1;a:2:{s:2:"id";s:15:"100002687248147";s:4:"name";s:11:"Jadie Valke";}i:2;a:2:{s:2:"id";s:15:"100000374518354";s:4:"name";s:12:"Michel Valke";}i:3;a:2:{s:2:"id";s:15:"100000614318417";s:4:"name";s:14:"Monique Geelen";}i:4;a:2:{s:2:"id";s:10:"1718467445";s:4:"name";s:14:"Angeline Valke";}i:5;a:2:{s:2:"id";s:15:"100000637137209";s:4:"name";s:10:"Rob Geelen";}i:6;a:2:{s:2:"id";s:15:"100002498076612";s:4:"name";s:12:"Jan Gösgens";}}s:6:"paging";a:1:{s:7:"cursors";a:2:{s:5:"after";s:20:"MTAwMDAyNDk4MDc2NjEy";s:6:"before";s:16:"MTU5MDE4MzMwMA==";}}}}', 'a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `flock_streams.bak` (`platform`, `platform_id`, `date_created`, `raw`, `metadata`, `permalink`, `params`, `language`, `state`, `publish_up`, `publish_down`) VALUES
(2, 510169425727821, '2013-09-05 17:45:21', 'a:4:{s:2:"id";s:15:"510169425727821";s:4:"from";a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:78:"Hoe zit het met jouw persoonlijk leiderschap? Http://www.flexfocus.nl/eyeonme/";s:12:"updated_time";s:24:"2013-09-05T17:45:21+0000";}', 'a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 510178002393630, '2013-09-05 18:17:23', 'a:5:{s:2:"id";s:15:"510178002393630";s:4:"from";a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:81:"OH: we''ve been gone for 10 years. This is a whole new generation of pickup girls.";s:12:"updated_time";s:24:"2013-09-05T18:17:23+0000";s:8:"comments";a:2:{s:4:"data";a:2:{i:0;a:7:{s:2:"id";s:24:"510178002393630_72911604";s:4:"from";a:2:{s:4:"name";s:20:"Ingrid Van de Mortel";s:2:"id";s:15:"100000118808401";}s:7:"message";s:25:"Pick-up girls in Turkije?";s:10:"can_remove";b:1;s:12:"created_time";s:24:"2013-09-05T22:42:10+0000";s:10:"like_count";i:0;s:10:"user_likes";b:0;}i:1;a:7:{s:2:"id";s:24:"510178002393630_72912540";s:4:"from";a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}s:7:"message";s:17:"Lol, nee in Ghana";s:10:"can_remove";b:1;s:12:"created_time";s:24:"2013-09-06T06:15:24+0000";s:10:"like_count";i:0;s:10:"user_likes";b:0;}}s:6:"paging";a:1:{s:7:"cursors";a:2:{s:5:"after";s:4:"Mg==";s:6:"before";s:4:"MQ==";}}}}', 'a:2:{s:4:"name";s:13:"Babs Gösgens";s:2:"id";s:15:"100002043048057";}', '', '', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
  `language` char(7) NOT NULL,
  `state` tinyint(1) NOT NULL,
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idr` (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `parent_id_2` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `flock_streams_apis`
--

INSERT INTO `flock_streams_apis` (`id`, `parent_id`, `title`, `alias`, `params`, `language`, `state`, `publish_up`, `publish_down`) VALUES
(1, 0, 'Twitter', 'twitter', 'consumer_key=KSlsiPWpC50tBn2jLD8xQ\r\nconsumer_secret=BfFmluo0rnZp2I3H3XitCWhFvOqHHJFSGmMaTTvwN4\r\noauth_access_token=110107572-YMo8GKZ6ulzP1loyygnLTQUWx9dI681V4kU8LASv\r\noauth_access_token_secret=u1GpK5fNbI8POV9kY9lVbScLu6l331MEoDOJbJGqChY', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 0, 'Facebook', 'facebook', 'app_id=231110010232949\r\napp_secret=eedc870587dc39297be6fe57ab8f2b3d\r\napp_redirect=', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 0, 'Github', 'github', 'username=babsgosgens\r\npassword=datgingm44rnetgoed\r\nrepository=crossinghippos', '*', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `flock_template_styles`
--

INSERT INTO `flock_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `params`) VALUES
(4, 'beez3', 0, '0', 'Beez3 - Default', '{"wrapperSmall":"53","wrapperLarge":"72","logo":"images\\/joomla_black.gif","sitetitle":"Joomla!","sitedescription":"Open Source Content Management","navposition":"left","templatecolor":"personal","html5":"0"}'),
(5, 'hathor', 1, '0', 'Hathor - Default', '{"showSiteName":"0","colourChoice":"","boldText":"0"}'),
(7, 'protostar', 0, '0', 'protostar - Default', '{"templateColor":"","logoFile":"","googleFont":"1","googleFontName":"Open+Sans","fluidContainer":"0"}'),
(8, 'isis', 1, '1', 'isis - Default', '{"templateColor":"","logoFile":""}'),
(9, 'crossinghippos', 0, '1', 'Crossing Hippos - Default', '{"jQueryVersion":"1.10.2","webFontVersion":"1.4.8","webFontConfig":"google: { families: [ ''Asap:400,700,400italic,700italic:latin'' ] }"}');

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
(623, 'Super User', 'babsgosgens', 'babs@crossinghippos.nl', '5d6bbe9a857e194a3a63167eb861c8d6:vvZG3UYTXlWKftqNhnnQ4RSTG79PUhHH', 0, 1, '2013-09-13 11:16:48', '2013-09-17 07:18:37', '0', '{"admin_style":"","admin_language":"","language":"","editor":"","helpsite":"","timezone":""}', '0000-00-00 00:00:00', 0),
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

