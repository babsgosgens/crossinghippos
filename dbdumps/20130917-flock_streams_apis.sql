ALTER TABLE  `flock_streams` CHANGE  `platform_id`  `api_id` BIGINT( 50 ) NOT NULL;

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
  UNIQUE KEY `idr` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

INSERT INTO `flock_streams_apis` (`id`, `parent_id`, `title`, `alias`, `params`, `language`, `state`, `publish_up`, `publish_down`) VALUES
(1, 0, 'Twitter', 'twitter', 'consumer_key=KSlsiPWpC50tBn2jLD8xQ\r\nconsumer_secret=BfFmluo0rnZp2I3H3XitCWhFvOqHHJFSGmMaTTvwN4\r\naccess_token=110107572-YMo8GKZ6ulzP1loyygnLTQUWx9dI681V4kU8LASv\r\naccess_token_secret=u1GpK5fNbI8POV9kY9lVbScLu6l331MEoDOJbJGqChY', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 0, 'Facebook', 'facebook', 'app_id=231110010232949\r\napp_secret=eedc870587dc39297be6fe57ab8f2b3d\r\napp_redirect=', '', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

ALTER TABLE  `flock_streams_apis` ADD INDEX (  `parent_id` );
ALTER TABLE  `flock_streams` ADD INDEX (  `api_id` );