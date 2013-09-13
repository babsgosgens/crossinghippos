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

/**
 * ALways load nszonetaxi language file
 *
 */
$language = JFactory::getLanguage();
$language->load('com_nszonetaxi');

/**
 * Get browser info
 *
 */
$browser = new JBrowser();
$msieold = $browser->getBrowser()=='msie' && $browser->getMajor()<=9;

/**
 * Initialise dependent resources
 *
 */
$user = JFactory::getUser();
$isGuest = $user->guest ? true : false;

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
$ns     = $this->baseurl.'/templates/'.$this->template.'/stylesheets/ns-generic-styles.css';
$screen = $this->baseurl.'/templates/'.$this->template.'/stylesheets/screen.css';
$print  = $this->baseurl.'/templates/'.$this->template.'/stylesheets/print.css';

// $doc->addStyleSheet('http://www.ns.nl/ns2010/static/css/generic/generic-styles.min.css','text/css','screen');
$doc->addStyleSheet($ns,'text/css','screen');
$doc->addStyleSheet($screen,'text/css','screen');
$doc->addStyleSheet($print,'text/css','print');

if($msieold) {
	$doc->addStyleSheet($doc->baseurl.'/templates/'.$doc->template.'/stylesheets/ie.css','text/css','screen');
}

// Add jQuery
$path_to_remote_jquery = '//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js';
$path_to_local_jquery  = $doc->baseurl.'/media/com_nszonetaxi/js/jquery-latest.min.js';

	/*
	 * Use php to detect availability of jQuery, otherwise the order in which scripts are injected will break the scripts
	 * because the remaining scripts will be loaded before jQuery loads.
	 */
	if (@fopen($path_to_remote_jquery, 'r')) {
		$jQuery = $path_to_remote_jquery;
	} else {
		$jQuery = $path_to_local_jquery;
	}

	$jQueryScript = "<script src=\"".$jQuery."\" type=\"text/javascript\"></script>\n";
	$jQueryScript .= "<script>$.noConflict();</script>\n";


// Add the other scripts
$doc->addScript($doc->baseurl.'/media/com_nszonetaxi/js/bootstrap.min.js');
$doc->addScript($doc->baseurl.'/media/com_nszonetaxi/js/jquery.formutils.js');
$doc->addScript($doc->baseurl.'/media/com_nszonetaxi/js/persistentgrid.js');


// Add Modernizr and HTML5 shiv

	/*
	 * Scriptmerge will inject the merged js and css before the closing head tag,
	 * therefor it's not possible to load them after the css.
	 */

	$doc->addScript($doc->baseurl.'/media/com_nszonetaxi/js/modernizr.custom.min.js');
	$doc->addScriptDeclaration('document.documentElement.className = "js";');
	$doc->addScriptDeclaration('if(Modernizr.inputtypes.date) { document.documentElement.className += " date"; } else { document.documentElement.className += " no-date"; }');
	$doc->addScriptDeclaration('if(Modernizr.inputtypes.time) { document.documentElement.className += " time"; } else { document.documentElement.className += " no-time"; }');
	$doc->addScriptDeclaration('if(Modernizr.inputtypes.datetime) { document.documentElement.className += " datetime"; } else { document.documentElement.className += " no-datetime"; }');