<?php
/**
 * @package     Joomla.Site
 * @subpackage  Templates.crossinghippos
 *
 * @copyright   Copyright (C) 2013 Babs Gösgens. All rights reserved.
 */

// No direct access.
defined('_JEXEC') or die;

require_once('crossinghippos.php');
?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="<?php echo $this->language; ?>" lang="<?php echo $this->language; ?>" dir="<?php echo $this->direction; ?>" >
	<head>
		<script type="text/javascript">
		<!--
			WebFontConfig={google:{families:["Yanone+Kaffeesatz:400,200,300,700:latin"]}};(function(){var wf=document.createElement("script");wf.src=("https:"==document.location.protocol?"https":"http")+"://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js";wf.type="text/javascript";wf.async="true";var s=document.getElementsByTagName("script")[0];s.parentNode.insertBefore(wf,s)})();
		-->
		</script>

		<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes"/>
		<meta name="HandheldFriendly" content="true" />
		<meta name="apple-mobile-web-app-capable" content="YES" />

		<jdoc:include type="head" />

	</head>
	<body<?php echo isset($bodyClass[0]) ? ' class="'.implode(' ',$bodyClass).'"' : ''; ?>>

		<header class="siteheader" role="banner">
			<div class="root">
				<div class="siteheader-logo">
					<img src="<?php echo Juri::root(); ?>images/blank.gif" alt="" width="100" height="100">
				</div
				><hgroup>
					<h1 class="siteheader-title"><?php echo $config->get('sitename'); ?></h1>
					<h2 class="siteheader-subtitle"><?php echo $config->get('MetaDesc'); ?></h2>
				</hgroup>
			</div>
		</header>

		<nav class="mainnav">
			<jdoc:include type="modules" name="mainnav" />
		</nav>

		<section class="page">

			<header class="pageheader">
				<h1 class="pageheader-title"><?php echo $pageTitle; ?></h1>
			</header>


			<nav class="breadcrumbs">
				<jdoc:include type="modules" name="breadcrumbs" />
			</nav>

			<div class="main">

				<?php include($pageLayout); ?>

			</div>

		</section>

		<footer class="sitefooter">
			<div class="sitefooter-skyline"></div>
			<div class="root">
				<jdoc:include type="modules" name="default.footer" style="footer" tag="aside" class="fourth column" />
			</div>
		</footer>

		<?php include('includes/deferred.php'); ?>
		<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
	</body>
</html>
