<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_streams
 *
 * @copyright   Copyright (C) 2013 Babs Gösgens
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
require_once __DIR__ . '/helper.php';

$platforms = ModStreamsfilterHelper::getPlatforms();
$icons = ModStreamsfilterHelper::getIcons();

$uri = JFactory::getURI();

$input = JFactory::getApplication()->input;

$layout = $params->get('layout', 'default');
require JModuleHelper::getLayoutPath('mod_streams_filter', $layout);