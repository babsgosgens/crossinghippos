CREATE TABLE IF NOT EXISTS `#__jvsocial_publish_channels` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(255)  NOT NULL ,
`type` VARCHAR(255)  NOT NULL ,
`source` VARCHAR(255)  NOT NULL ,
`post` VARCHAR(255)  NOT NULL ,
`description` TEXT NOT NULL ,
`params` TEXT NOT NULL ,
`ordering` INT(11)  NOT NULL ,
`state` TINYINT(1)  NOT NULL DEFAULT '1',
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
`created` DATETIME NOT NULL ,
`created_by` INT(11)  NOT NULL DEFAULT '0',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT COLLATE=utf8_general_ci;

CREATE TABLE IF NOT EXISTS `#__jvsocial_publish_requests` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
`channel_id` INT(11)  NOT NULL ,
`source` VARCHAR(255)  NOT NULL ,
`source_id` INT(11)  NOT NULL ,
`feed_id` VARCHAR(255)  NOT NULL ,
`target` VARCHAR(255)  NOT NULL ,
`state` TINYINT(1)  NOT NULL DEFAULT '0',
`created` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
`created_by` INT(11)  NOT NULL DEFAULT '0',
PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT COLLATE=utf8_general_ci;


