<?php
/**
 * @package     Joomla.Site
 * @subpackage  Templates.crossinghippos
 *
 * @copyright   Copyright (C) 2013 Babs Gösgens. All rights reserved.
 */

// No direct access.
defined('_JEXEC') or die;
?>

<!DOCTYPE html>
<html lang="<?php echo $this->language; ?>">
	<head>
		<jdoc:include type="head" />
		<script type="text/javascript" src="media/modernizr/modernizr.custom.85231.js"></script>
		<script type="text/javascript" src="http://use.typekit.net/ztu5gmc.js"></script>
		<script type="text/javascript">try{Typekit.load();}catch(e){}</script>
		<link href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template; ?>/stylesheets/screen.css" media="screen" rel="stylesheet" type="text/css" />
		<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
		<script>
		jQuery( document ).ready(function() {
			jQuery('.fa-dribble').css('color', 'red');

			jQuery('.stream').hover(function() {
				streamType = jQuery(this).attr("class").split(" ")[5];
			});
		});
		</script>
	</head>
	<body>

		<!-- Wraps the main section of the page -->
		<div class="lt-root">


			<header role="banner" class="lt-base lt-primary lt-push lt-push--secondary  masthead">
				<h1 class="masthead__title">
					<a href="#" class="anchor--incognito">
						<span class="lt-column  masthead__logo"></span>
						<span class="lt-column  hd">Crossing Hippos</span>
						<span class="lt-column  masthead__tagline">webdesign &amp; development</span>
					</a>
				</h1>
			</header>
			<nav role="navigation" class="lt-base lt-gutters lt-secondary lt-pull lt-pull--primary main-nav  masthead-sibling masthead-sibling--links">
				<jdoc:include type="modules" name="position-7" />
			</nav>
			<div class="lt-base lt-gutters lt-tertiary  masthead-sibling masthead-sibling--icons">
				<jdoc:include type="modules" name="position-0" />
				<ul class="list-inline list-icons">
					<li class="list-icons__icon"><a href="https://github.com/babsgosgens" title="<?php echo JText::_('TPL_ANCHOR_TITLE_GITHUB'); ?>"><i class="fa fa-github-alt fa-2x"></i></a></li>
					<li class="list-icons__icon"><a href="https://twitter.com/crossinghippos" title="<?php echo JText::_('TPL_ANCHOR_TITLE_TWITTER'); ?>"><i class="fa fa-twitter fa-2x"></i></a></li>
					<li class="list-icons__icon"><a href="http://www.linkedin.com/in/babsgosgens" title="<?php echo JText::_('TPL_ANCHOR_TITLE_LINKEDIN'); ?>"><i class="fa fa-linkedin-square fa-2x"></i></a></li>
				</ul>
			</div>


			<!-- articles -->
			<div role="main" class="lt-root main">
				<jdoc:include type="message" />
				<jdoc:include type="component" />
			</div>

			<!-- streams -->
			<aside class="lt-root">
				<div class="lt-base lt-secondary">
					<jdoc:include type="modules" name="position-2-left" />
				</div>
				<div class="lt-base lt-primary">
					<jdoc:include type="modules" name="position-2" />
				</div>
				<div class="lt-base lt-tertiary">
					<jdoc:include type="modules" name="position-2-right" />
				</div>
			</aside>


			<footer>
				<div class="lt-base lt-column--fourth">

				</div>
				<div class="lt-base lt-column--half articles--center">
					<jdoc:include type="modules" name="footer-center" />
				</div>
				<div class="lt-base lt-column--fourth">

				</div>
			</footer>
			
		<?php /*	
		<dl class="global-style-classification">
			   <dt class="lt lt--fourth">.lt</dt><!--
			--><dd class="lt lt--fourth">Abstractions (PG)</dd><!--
			--><dd class="lt lt--half">Layout</dd>
			   <dt class="lt lt--fourth">.btn</dt><!--
			--><dd class="lt lt--fourth">Buttons</dd><!--
			--><dd class="lt lt--half">Abstractions, GUI</dd>
			   <dt class="lt lt--fourth">.hd</dt><!--
			--><dd class="lt lt--fourth">Titels</dd><!--
			--><dd class="lt lt--half">Abstractions, GUI</dd>
			   <dt class="lt lt--fourth">.txt</dt><!--
			--><dd class="lt lt--fourth">Text</dd><!--
			--><dd class="lt lt--half">Abstractions, GUI</dd>
			   <dt class="lt lt--fourth">.nav</dt><!--
			--><dd class="lt lt--fourth">Navigatie</dd><!--
			--><dd class="lt lt--half">Abstractions, GUI</dd>
			   <dt class="lt lt--fourth">.lst</dt><!--
			--><dd class="lt lt--fourth">Lijsten</dd><!--
			--><dd class="lt lt--half">Abstractions</dd>
		</dl>
		*/ ?>
		</div>
	</body>
</html>
