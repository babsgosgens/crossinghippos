<?php
/**
 * @package     Streams
 *
 * @copyright   Copyright (C) 2010 - 2013 Crossing Hippos. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

if (!JFactory::getUser()->authorise('core.manage', 'com_streams'))
{
	return JError::raiseWarning(404, JText::_('JERROR_ALERTNOAUTHOR'));
}

$controller	= JControllerLegacy::getInstance('Streams');
$controller->execute(JFactory::getApplication()->input->get('task'));
$controller->redirect();
