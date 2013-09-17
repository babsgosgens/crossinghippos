DROP TABLE IF EXISTS `flock_streams`;
CREATE TABLE IF NOT EXISTS `flock_streams` (
  `api_id` tinyint(2) NOT NULL,
  `post_id` bigint(50) NOT NULL,
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
  KEY `api_id` (`api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;
