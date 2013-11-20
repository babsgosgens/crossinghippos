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
		<div class="root">
			<nav class="lt lt--fourth main-nav">
				    <jdoc:include type="modules" name="mainnav" />
				<ul>
					   <li><a href="#" class="main-nav__item">About</a></li><!--
					--><li><a href="#" class="main-nav__item">Work</a></li><!--
					--><li><a href="#" class="main-nav__item">Fun</a></li><!--
					--><li><a href="#" class="main-nav__item">Contact</a></li>
				</ul>
			</nav><!--
		 --><header class="lt lt--half masthead">
				<h1 class="masthead__title">
					<a href="#" class="anchor--incognito">
						<div class="masthead__logo">
						</div>
						<span class="hd hd--masthead">Crossing Hippos</span>
						<span class="masthead__tagline">webdesign &amp; development</span>
					</a>
				</h1>
			</header><!--
		 --><div class="lt lt--fourth ">
				<i class="hd--iconlink hd--colorred fa fa-github-alt fa-2x"></i>
				<i class="hd--iconlink hd--colorred fa fa-twitter fa-2x"></i>
				<i class="hd--iconlink hd--colorred fa fa-linkedin-square fa-2x"></i>
			</div>
			<!-- articles -->
			<div>			
				<jdoc:include type="message" />
				<jdoc:include type="modules" name="content-top" />
				<jdoc:include type="modules" name="component-modules" style="raw" />
			</div>
			<div class="lt root">
				<jdoc:include type="modules" name="content_articles" />
			</div>

			<!-- streams -->
			<div class="root"><!--
			 --><div class="lt lt--fourth">
					<jdoc:include type="modules" name="position-14" /><!--
			 --></div>
				<div class="lt lt--half">
					<jdoc:include type="modules" name="content_streams" />
				</div><!--
			 --><div class="lt lt--fourth">

				</div>
			</div>
			<footer>
				<div class="lt lt--fourth">

				</div>
				<div class="lt lt--half articles--center">
					<jdoc:include type="modules" name="footer-center" />
				</div>
				<div class="lt lt--fourth">

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
