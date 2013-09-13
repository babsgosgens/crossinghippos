<?php
/**
 * @package     WinTOP
 * @subpackage  tmp_nszonetaxi
 * @author      Babs Gösgens <babs@crossinghippos.nl>
 * @copyright   Copyright (C) 2013 Transvision B.V., Netherlands
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Include template logic
include(JPATH_SITE.'/templates/'.$this->template.'/template/template.php');

if (!isset($this->error))
{
	$this->error = JError::raiseWarning(404, JText::_('JERROR_ALERTNOAUTHOR'));
	$this->debug = false;
}

//get language and direction
$doc = JFactory::getDocument();
$this->language = $doc->language;
$this->direction = $doc->direction;

// Load modules class
jimport( 'joomla.application.module.helper' );
$modulesNavigation = JModuleHelper::getModules($navigation);
$modulesLogout = JModuleHelper::getModules('logout');

// var_dump($modulesNavigation);
?>
<!DOCTYPE html>
<html lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>" class="no-js">
<head>
    <meta http-equiv="x-ua-compatible" content="IE=9">
	<title><?php echo $this->error->getCode(); ?> - <?php echo $this->title; ?></title>
	<?php $debug = JFactory::getConfig()->get('debug_lang'); ?>
	<?php if (JDEBUG || $debug): ?>
	<?php endif; ?>
    <?php echo $jQueryScript; ?>
	<link rel="stylesheet" href="<?php echo $ns; ?>" type="text/css" />
	<link rel="stylesheet" href="<?php echo $screen; ?>" type="text/css" />
</head>
<body>

    <header  role="banner" class="banner">
        <h1 class="banner-title"><a href="<?php echo $this->baseurl; ?>"><img src="<?php echo $this->baseurl; ?>/images/NSZonetaxi-logo277px.png" alt="NS Zonetaxi" width="277" height="93"></a></h1>
    </header
    ><nav class="nav-group">
    	<?php $attribs['style'] = 'default'; ?>
    	<?php foreach ($modulesNavigation as $module): ?>
    	<?php echo JModuleHelper::renderModule( $module, $attribs ); ?>
	    <?php endforeach; ?>
    </nav>

	<div class="page guest error">
		<div id="outline">
		<div id="errorboxoutline">
			<h1 id="errorboxheader"><?php echo JText::_('COM_NSZONETAXI_ERROR_CODE'.$this->error->getCode()); ?></h1>
			<div id="errorboxbody">
			<p><strong><?php echo JText::_('JERROR_LAYOUT_NOT_ABLE_TO_VISIT'); ?></strong></p>
				<ol>
					<li><?php echo JText::_('JERROR_LAYOUT_AN_OUT_OF_DATE_BOOKMARK_FAVOURITE'); ?></li>
					<li><?php echo JText::_('JERROR_LAYOUT_SEARCH_ENGINE_OUT_OF_DATE_LISTING'); ?></li>
					<li><?php echo JText::_('JERROR_LAYOUT_MIS_TYPED_ADDRESS'); ?></li>
					<li><?php echo JText::_('JERROR_LAYOUT_YOU_HAVE_NO_ACCESS_TO_THIS_PAGE'); ?></li>
					<li><?php echo JText::_('JERROR_LAYOUT_REQUESTED_RESOURCE_WAS_NOT_FOUND'); ?></li>
					<li><?php echo JText::_('JERROR_LAYOUT_ERROR_HAS_OCCURRED_WHILE_PROCESSING_YOUR_REQUEST'); ?></li>
				</ol>
			<p><strong><?php echo JText::_('JERROR_LAYOUT_PLEASE_TRY_ONE_OF_THE_FOLLOWING_PAGES'); ?></strong></p>

				<ul>
					<li><a href="<?php echo $this->baseurl; ?>/index.php" title="<?php echo JText::_('JERROR_LAYOUT_GO_TO_THE_HOME_PAGE'); ?>"><?php echo JText::_('JERROR_LAYOUT_HOME_PAGE'); ?></a></li>
				</ul>

			<p><?php echo JText::_('JERROR_LAYOUT_PLEASE_CONTACT_THE_SYSTEM_ADMINISTRATOR'); ?>.</p>
			<div id="techinfo">
			<p><?php echo $this->error->getCode(); ?> - <?php echo $this->error->getMessage(); ?></p>
			<p>
				<?php if ($this->debug) :
					echo $this->renderBacktrace();
				endif; ?>
			</p>
			</div>
			</div>
		</div>
		</div>		
    </div>
</body>
</html>
