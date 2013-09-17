-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 17, 2013 at 02:24 PM
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

