<?php
/**
 * @package     Joomla.Site
 * @subpackage  Templates.crossinghippos
 *
 * @copyright   Copyright (C) 2013 Babs Gösgens. All rights reserved.
 */

// No direct access.
defined('_JEXEC') or die;

// Get request info
echo $option = JRequest::getVar('option');
echo $view = JRequest::getVar('view');
echo $layout = JRequest::getVar('layout');
$id = JRequest::getVar('id');

// Inject CSS
$this->addStylesheet($this->baseurl.'/templates/'.$this->template.'/css/screen.css');
$this->addStylesheet($this->baseurl.'/templates/'.$this->template.'/css/print.css');

// Remove generator meta tag
$this->setGenerator('');

// Get global config
$config = JFactory::getConfig();

// Get menu object
$menu = JFactory::getApplication()->getMenu()->getActive();
if(!is_null($menu)) {
	$params = $menu->params;

	$bodyClass = array();
	if( $params->get('pageclass_sfx') ) {
		array_push($bodyClass, $params->get('pageclass_sfx'));
	}

	$pageTitle = $params->get('page_heading');
	if(is_null($pageTitle)) {
		$pageTitle = $menu->title;
	}
}
else {
	switch ($view) {
		case 'tag':
			$tag = explode(':', $id);
			$pageTitle = JText::sprintf('By %s', $tag[1]);
			break;
		default:
			$pageTitle = 'Tidbits';
			break;
	}
}

// Component container class
$_componentClass = array();
if ($option) {
	$_componentClass[] = $option;
}
if ($view) {
	$_componentClass[] = $view;
}
if ($layout) {
	$_componentClass[] = $layout;
}

$_componentClass[] = 'component';

if( $this->countModules('component-right') ) {
	$_componentClass[] = 'has-component-right';
}
if( $this->countModules('component-bottom') ) {
	$_componentClass[] = 'has-component-bottom';
}

$componentClass = implode(' ', $_componentClass);

// Page Layout
$_layoutPath = JPATH_SITE.'/templates/'.$this->template.'/layouts/';
$_fallbackLayout = $_layoutPath.'default.php';
switch ($option.$view.$layout) {
	case 'com_tagstag':
	case 'com_contentcategoryblog':
	case 'com_contentfeatured':
		$pageLayout = $_layoutPath.'blog.php';
		break;
	default:
		$pageLayout = $_layoutPath.'default.php';
		break;
}

if( !JFile::exists($pageLayout) ) {
	$pageLayout = $_fallbackLayout;
}
