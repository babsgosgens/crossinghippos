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
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="http://use.typekit.net/ztu5gmc.js"></script>
	<script type="text/javascript">try{Typekit.load();}catch(e){}</script>
	<link href="<?php echo $this->baseurl ?>/templates/<?php echo $this->template; ?>/stylesheets/screen.css" media="screen" rel="stylesheet" type="text/css" />

</head>
<body>
<div class="root">
	<jdoc:include type="modules" name="top" /> 

	<nav class="main-nav lt--fourth">
		<ul>
			   <li class="lt__item--vertical"><a href="#" class="box--small main-nav__item">About</a></li><!--
			--><li class="lt__item--vertical"><a href="#" class="box--small main-nav__item">Work</a></li><!--
			--><li class="lt__item--vertical"><a href="#" class="box--small main-nav__item">fun</a></li><!--
			--><li class="lt__item--vertical"><a href="#" class="box--small main-nav__item">fun</a></li>
		</ul>
	</nav>
	<header class="masthead lt--half">
		<h1 class="masthead__title">
			<a href="#" class="anchor--incognito">
				<span class="hd hd--masthead">Crossing Hippos</span>
				<span class="masthead__tagline" style="font-weight: 300;">webdesign &amp; development</span>
			</a>
		</h1>
	</header>

	<div class="lt--half">	 
	<jdoc:include type="message" />
    <jdoc:include type="modules" name="content-top" />
    <jdoc:include type="modules" name="position-6" />
    <jdoc:include type="modules" name="component-modules" style="raw" />

<jdoc:include type="modules" name="bottom" />
	<section>
		<h1 class="hd--section">Articles</h1>
		<ul class="box-list">
			<li class="lt lt--third box-list__item">
				<div class="box--small box--box-list">1</div>
			</li><!--
		 --><li class="lt lt--third box-list__item">
				<div class="box--small box--box-list">2</div>
			</li><!--
		 --><li class="lt lt--third box-list__item">
				<div class="box--small box--box-list">3</div>
			</li>
		</ul>
	</section>
	<section>
		<h1 class="hd--section">Stream</h1>
		<ul class="box-list">
			<li class="lt lt--third box-list__item">
				<h2 class="hd--a hd--item">Twitter</h2>
				<div class="box--small box--box-list">
					<p>
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec nisi tempor sem rhoncus tincidunt id ut magna. 
						Integer sapien sapien, egestas sed urna suscipit, mollis porta massa. 
					</p>
				</div>
			</li><!--
		 --><li class="lt lt--third box-list__item">
		 		<h2 class="hd--a hd--item">Facebook</h2>
				<div class="box--small box--box-list">
					<p>
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec nisi tempor sem rhoncus tincidunt id ut magna. 
						Integer sapien sapien, egestas sed urna suscipit, mollis porta massa. Morbi sed ultrices mauris. Donec condimentum 
						mollis arcu nec iaculis. Phasellus a mauris vel arcu dictum tristique. Morbi placerat nisl id venenatis pharetra
					</p>
				</div>
				</li><!--
		 --><li class="lt lt--third box-list__item">
		 		<h2 class="hd--a hd--item">Dribbble</h2>
				<div class="box--small box--box-list">
					<p>
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec nisi tempor sem rhoncus tincidunt id ut magna. 
						Integer sapien sapien, egestas sed urna suscipit, mollis porta massa. Morbi sed ultrices mauris.
					</p>
				</div>
			</li>
		</ul>
	</div>
	</section>

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
