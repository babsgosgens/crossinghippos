<?php
/**
 * @version     1.0.0
 * @package     com_jvsocial_publish
 * @copyright   Copyright (C) 2013. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      joomlavi <info@joomlavi.com> - http://www.joomlavi.com
 */


// no direct access
defined('_JEXEC') or die;
ini_set('display_errors', '0');

// Access check.
if (!JFactory::getUser()->authorise('core.manage', 'com_jvsocial_publish')) 
{
	throw new Exception(JText::_('JERROR_ALERTNOAUTHOR'));
}

if (!JPluginHelper::getPlugin('content','jvsocial_publish_content', true))
{
        JError::raiseWarning('5', JText::_('COM_JVSOCIAL_PUBLISH_MSG_PLUGIN_NOT_ENABLE'));
}

// Include dependancies
jimport('joomla.application.component.controller');
require_once JPATH_COMPONENT.'/helpers/jvsocial_publish.php';
Jvsocial_publishHelper::updateVersion();
$controller	= JControllerLegacy::getInstance('Jvsocial_publish');
$controller->execute(JFactory::getApplication()->input->get('task'));
$controller->redirect();
