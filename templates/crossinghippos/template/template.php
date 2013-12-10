<?php
/**
 * @package     tpl_crossinghippos
 * @author      Babs Gösgens <babs@crossinghippos.nl>
 * @copyright   Copyright (C) 2013 Babs Gösgens, Netherlands
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

$head = $doc->getHeadData();
unset($doc->_scripts[JURI::root(true) . '/media/system/js/mootools-more.js']);
unset($doc->_scripts[JURI::root(true) . '/media/system/js/mootools-core.js']);
unset($doc->_scripts[JURI::root(true) . '/media/system/js/core.js']);
unset($doc->_scripts[JURI::root(true) . '/media/system/js/modal.js']);
unset($doc->_scripts[JURI::root(true) . '/media/system/js/caption.js']);
// unset($doc->_scripts[JURI::root(true) . '/media/jui/js/jquery.min.js']);
unset($doc->_scripts[JURI::root(true) . '/media/jui/js/jquery-noconflict.js']);
// unset($doc->_scripts[JURI::root(true) . '/media/jui/js/bootstrap.min.js']);
unset($doc->_scripts[JURI::root(true) . '/media/jui/js/jquery-migrate.min.js']);
unset($doc->_scripts[JURI::root(true) . '/media/system/js/tabs-state.js']);
// echo '<pre>';
// // print_r($head['scripts']);
// print_r($head['script']);
// echo '</pre>';

// $this->_script['text/javascript'] = 'jQuery.noConflict();'."\n" . $this->_scripts['text/javascript'];

$doc->addScriptDeclaration('jQuery.noConflict();');
/**
 * Remove inline scripts
 *
 */
if (isset($this->_script['text/javascript']))
{
    $this->_script['text/javascript'] = preg_replace("%jQuery\(.+\)\s*\{\s*new\s*JCaption\s*\('img.caption'\);\s*\}\);\%", '', $this->_script['text/javascript']);
    if (empty($this->_script['text/javascript']))
        unset($this->_script['text/javascript']);
}

/**
 * Get language object
 *
 */
$language = JFactory::getLanguage();

/**
 * Get application object
 *
 */
$app = JFactory::getApplication();

/**
 * Get request object
 *
 */
$input = $app->input;

/**
 * Get session object
 *
 */
$session = JFactory::getSession();

/**
 * Get current url
 *
 */
$uri = JFactory::getUri();
$currentUrl = $uri->toString();

/**
 * Get browser info
 *
 */
$browser = new JBrowser();
$msieold = $browser->getBrowser()=='msie' && $browser->getMajor()<=8;

/**
 * Build head
 *
 */

// Remove generator meta tag
$doc->setGenerator('');

// Set viewport
$doc->setMetaData('viewport', 'initial-scale = 1.0, width = device-width');

// Add CSS
$path = JPATH_SITE.'/templates/'.$this->template.'/stylesheets/';

$screen = $this->baseurl.'/templates/'.$this->template.'/stylesheets/screen.css?' . filemtime($path.'screen.css');
$print  = $this->baseurl.'/templates/'.$this->template.'/stylesheets/print.css?' . filemtime($path.'print.css');

$doc->addStyleSheet($screen,'text/css','screen');
$doc->addStyleSheet($print,'text/css','print');
$doc->addStyleSheet('//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css');

if($msieold) {
	$doc->addStyleSheet($doc->baseurl.'/templates/'.$doc->template.'/stylesheets/ieold.css','text/css','screen');
}

// // Add jQuery
// $path_to_remote_jquery = '//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js';
// $path_to_local_jquery  = $doc->baseurl.'/media/tpl_valys/js/jquery-latest.min.js';

// 	/*
// 	 * Use php to detect availability of jQuery, otherwise the order in which scripts are injected will break the scripts
// 	 * because the remaining scripts will be loaded before jQuery loads.
// 	 */
// 	if (@fopen($path_to_remote_jquery, 'r')) {
// 		$jQuery = $path_to_remote_jquery;
// 	} else {
// 		$jQuery = $path_to_local_jquery;
// 	}

// 	// $jQueryScript = "<script src=\"".$jQuery."\" type=\"text/javascript\"></script>\n";
// 	$jQueryScript = "<script src=\"".$doc->baseurl.'/media/tpl_crossinghippos/js/zepto.min.js'."\" type=\"text/javascript\"></script>\n";
// 	// $jQueryScript .= "<script>$.noConflict();</script>\n";

// 	// Add Modernizr and HTML5 shiv

	/*
	 * Scriptmerge will inject the merged js and css before the closing head tag,
	 * therefor it's not possible to load them after the css.
	 */

	$doc->addScript($doc->baseurl.'/media/tpl_crossinghippos/js/modernizr.min.js');

	// Add Typekit
	$doc->addScript('http://use.typekit.net/ztu5gmc.js');
	$doc->addScriptDeclaration('try{Typekit.load();}catch(e){}');

/*
-----------------------------------------------------------------------------
Count the number of columns
-----------------------------------------------------------------------------
*/

$mainColumnClass = 'lt-prime';

$alphaColumn = $this->countModules('position-alpha');
$betaColumn = $this->countModules('position-beta');
if( $alphaColumn && $betaColumn ) { /* Left */
	$mainColumnClass = $mainColumnClass . '--alpha-beta';
}
elseif( $alphaColumn) {
	$mainColumnClass = $mainColumnClass . '--alpha';
}
elseif( $betaColumn) {
	$mainColumnClass = $mainColumnClass . '--beta';
}