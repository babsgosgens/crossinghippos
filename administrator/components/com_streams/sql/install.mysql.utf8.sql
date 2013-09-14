CREATE TABLE IF NOT EXISTS  `#__streams` (
`id` SERIAL NOT NULL ,
`platform` TINYINT( 2 ) NOT NULL ,
`date_created` DATETIME NOT NULL ,
`raw` TEXT NOT NULL ,
`metadata` TEXT NOT NULL ,
`permalink` TEXT NOT NULL ,
`params` TEXT NOT NULL ,
`language` CHAR( 7 ) NOT NULL ,
`state` TINYINT( 1 ) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;