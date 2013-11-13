<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_streams
 *
 * @copyright   Copyright (C) 2013 Babs Gösgens
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

/**
 * Helper for mod_streams
 *
 * @package     Joomla.Site
 * @subpackage  mod_streams
 * @since       1.0
 */
class ModStreamfilterHelper
{
	public static function splitNewLine($text)
	{
    	$code = preg_replace('/\n$/','', preg_replace('/^\n/','', preg_replace('/[\r\n]+/',"\n", $text)));
    	return explode("\n", $code);
	}

	public static function getPlatforms()
	{
		$db = JFactory::getDBO();
		$db->setQuery('SELECT id, alias FROM #__streams_apis WHERE state = 1');
		$result = $db->loadObjectList();
		$platforms_list = array();

		foreach ($result as $platform) {
			array_push($platforms_list, $platform->alias);
    	}

    	return $platforms_list;
	}

	public static function getIcons()
	{
		$db = JFactory::getDBO();
		$db->setQuery('SELECT alias, params FROM #__streams_apis WHERE state = 1');
		$result = $db->loadObjectList();

		foreach ($result as $item) {
		}
    	
    	return;
	}
}