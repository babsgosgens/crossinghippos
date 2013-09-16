CREATE TABLE IF NOT EXISTS `#__streams` (
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
  UNIQUE KEY `platformid` (`platform`,`platform_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;
