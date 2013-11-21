<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_streams
 *
 * @copyright   Copyright (C) 2013 Babs Gösgens
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
require_once(JPATH_SITE . '/components/com_streams/models/streams.php');

/**
 * Helper for mod_streams
 *
 * @package     Joomla.Site
 * @subpackage  mod_streams
 * @since       1.0
 */
class ModStreamsHelper
{
	public static function getStreams()
	{
		$streamsmodel = new StreamsModelStreams();
		return $streamsmodel->getItems();
	}
}