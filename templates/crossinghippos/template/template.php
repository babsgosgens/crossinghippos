<?php
/**
 * @package     WinTOP
 * @subpackage  tmp_nszonetaxi
 * @author      Babs Gösgens <babs@crossinghippos.nl>
 * @copyright   Copyright (C) 2013 Transvision B.V., Netherlands
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

// No direct access.
defined('_JEXEC') or die;

jimport('joomla.filesystem.file');

/**
 * Load document, this file is also included in the error page
 *
 */
$doc = JFactory::getDocument();
$app = JFactory::getApplication();
$user = JFactory::getUser();

$isGuest = $user->guest;
$menu = $app->getMenu();
$activeMenu = $menu->getActive();
//print_r($activeMenu);

/**
 * Load page title
 *
 */
$pageTitle = $activeMenu->params->get('page_heading', $activeMenu->title);

/**
 * Load template parameters
 *
 */
$params = $app->getTemplate(true)->params;

/**
 * Get browser info
 *
 */
$browser = new JBrowser();
$msieold = $browser->getBrowser()=='msie' && $browser->getMajor()<=9;

/**
 * Determine which menu to use
 *
 */
$navigation = $isGuest ? 'navigation-0' : 'navigation-1';
$topnav     = $isGuest ? 'topnav-0' : 'topnav-1';

/**
 * Determine how many columns are needed for the page
 *
 */
$pageClass = '';
if($doc->countModules('component-modules')) {
	$pageClass .= ' has-component-modules';
}


/**
 * Build head
 *
 */

// Remove generator meta tag
$doc->setGenerator('');

// Set viewport
$doc->setMetaData('viewport', 'initial-scale = 1.0, maximum-scale = 1.0, user-scalable = no, width = device-width');

// Add CSS
$path = JPATH_SITE.'/templates/'.$this->template.'/stylesheets/';
$uri = $doc->baseurl.'/templates/'.$doc->template.'/stylesheets/';
$cssScreen = 'screen.css';
$cssPrint = 'print.css';
$cssIeOld = 'ieold.css';

$doc->addStyleSheet($uri.$cssScreen.'?'.filemtime($path.$cssScreen),'text/css','screen');

if($msieold) {
}

// Add jQuery
$path_to_remote_jquery = 'http://ajax.googleapis.com/ajax/libs/jquery/'.$params->get('jQueryVersion').'/jquery.min.js';
$path_to_local_jquery  = $doc->baseurl.'/templates/'.$doc->template.'/javascripts/jquery-'.$params->get('jQueryVersion').'.min.js';
$doc->addScript($path_to_remote_jquery);

// Add jQuery Tools
$path_to_remote_jquerytools = 'http://cdn.jquerytools.org/'.$params->get('jQueryToolsVersion').'/all/jquery.tools.min.js';
$doc->addScript($path_to_remote_jquerytools);

// Add Modernizr and HTML5 shiv
$path_to_local_modernizr  = $doc->baseurl.'/templates/'.$doc->template.'/javascripts/modernizr.custom.55528.js';
$doc->addScript($path_to_local_modernizr);