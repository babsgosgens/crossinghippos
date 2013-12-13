<?php
/**
 * @package     Joomla.Site
 * @subpackage  Templates.crossinghippos
 *
 * @copyright   Copyright (C) 2013 Babs Gösgens. All rights reserved.
 */

// No direct access.
defined('_JEXEC') or die;
include(JPATH_SITE.'/templates/'.$this->template.'/template/template.php');
?>

<!DOCTYPE html>
<html lang="<?php echo $this->language; ?>">
	<head>
		<?php //echo $jQueryScript; ?>		
		<jdoc:include type="head" />
	</head>
	<body>

		<nav role="navigation" class="main-nav">
			<div class="lt-root">
			<jdoc:include type="modules" name="position-7" />
			</div>
		</nav>

		<header role="banner" class="masthead">
			<div class="lt-root">
				<h1 class="lt-prime  masthead__title">
					<a href="<?php echo $this->baseurl; ?>" class="anchor--incognito">
						<span class="hd">Crossing Hippos</span>
						<img src="<?php echo $this->baseurl; ?>/templates/crossinghippos/images/crossinghippos.svg" class="masthead__logo top" alt="Logo Crossing Hippos">
						<span class="masthead__tagline">webdesign &amp; development</span>
					</a>
				</h1>
			</div>
		</header>


		<!-- Wraps the main section of the page -->
		<div>

			<!-- component output -->
			<div role="main" class="main">
				<jdoc:include type="message" />
				<jdoc:include type="component" />
			</div>

			<!-- modules -->
			<aside class="lt-root">
				<div class="lt-prime <?php echo $mainColumnClass; ?>">
					<jdoc:include type="modules" name="position-prime" />
				</div>
    			<?php if($alphaColumn): ?>
				<div class="lt-alpha">
					<jdoc:include type="modules" name="position-alpha" />
				</div>
			    <?php endif; ?>
			    <?php if($betaColumn): ?>
				<div class="lt-beta">
					<jdoc:include type="modules" name="position-beta" />
				</div>
			    <?php endif; ?>
			</aside>


		</div>

	<footer class="footer" id="pagefooter">

		<div class="footer__artwork">
			<div class="lt-root">
				<img src="<?php echo $this->baseurl; ?>/templates/crossinghippos/images/artwork-by-untilsunday.it.svg" class="footer__image media">
			</div>
		</div>

		<div class="lt-root">
			<div class="lt-base lt-prime lt-prime--alpha-beta">
				<section id="contact">
					<h1 class="hd lt-gutters"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_CONTACT'); ?></h1>

					<address>
						<div class="lt-column lt-column--half lt-gutters">
							<div>Crossing Hippos</div>
							<div>Lodeizenstraat 4</div>
							<div>5254CT Rosmalen</div>
						</div>
						<div class="lt-column lt-column--half lt-gutters">
							<div><a href="mailto:babs@crossinghippos.nl" class="anchor--incognito"><i class="fa fa-envelope"></i> babs@crossinghippos.nl</a></div>
							<div><a href="tel:+31 (0)73 1234567" class="anchor--incognito"><i class="fa fa-phone"></i> +31 (0)73 1234567</a></div>
						</div>
					</address>

				</section>
			</div>
			<div class="lt-base lt-alpha lt-gutters">
				<div class="lt-column lt-column--half">
					<img src="<?php echo $this->baseurl; ?>/images/logo-fronteers.png" class="media" alt="Member of the Dutch association of frontend developers Fronteers">
					<img src="<?php echo $this->baseurl; ?>/images/logo-ecabo-accredited-training-company.png" class="soft" alt="Crossing Hippos is an accredited training company.">
				</div>
			</div>
			<div class="lt-base lt-beta lt-gutters">
				<ul class="list-inline list-icons">
					<li class="list-icons__icon"><a href="https://github.com/babsgosgens" title="<?php echo JText::_('TPL_ANCHOR_TITLE_GITHUB'); ?>"><i class="fa fa-github-alt fa-2x"></i></a></li>
					<li class="list-icons__icon"><a href="https://twitter.com/crossinghippos" title="<?php echo JText::_('TPL_ANCHOR_TITLE_TWITTER'); ?>"><i class="fa fa-twitter fa-2x"></i></a></li>
					<li class="list-icons__icon"><a href="http://www.linkedin.com/in/babsgosgens" title="<?php echo JText::_('TPL_ANCHOR_TITLE_LINKEDIN'); ?>"><i class="fa fa-linkedin-square fa-2x"></i></a></li>
				</ul>
			</div>
			<jdoc:include type="modules" name="footer" />
		</div>

	</footer>

	<script type="text/javascript">
	jQuery(document).ready(function($) {

	    var img    = $(".masthead__logo"),
	    	imgOrigPosition = $(".masthead__logo").position();
	    	mastheadHeight =$(".masthead").height(),
	    	artworkHeight =$(".footer__artwork").height(),
	    	artworkTop = $(".footer__artwork").offset().top,
	    	artworkBottom = artworkTop + $(".footer__artwork").height();

		$.fn.isOnScreen = function(){
		     
		    var win = $(window);
		     
		    var viewport = {
		        top : win.scrollTop(),
		        left : win.scrollLeft()
		    };
		    viewport.right = viewport.left + win.width();
		    viewport.bottom = viewport.top + win.height();
		     
		    var bounds = this.offset();
		    bounds.right = bounds.left + this.outerWidth();
		    bounds.bottom = bounds.top + this.outerHeight();
		     
		    return (!(viewport.right < bounds.left || viewport.left > bounds.right || viewport.bottom < bounds.top || viewport.top > bounds.bottom));
		     
		};

		$(window).scroll(function() {

		    var offsetY, offsetX;
				
	    	var atTop    = $(".masthead").isOnScreen(),
	    		atBottom = $(".footer__artwork").isOnScreen();

		    	
		    	if ( (atTop && atBottom) ) {
		    		return;
		    	}
		    	if (atTop) {
		    		offsetY = imgOrigPosition.top + "px";
		    		img.removeClass("bottom").addClass("top");
		    	}
		    	else if (atBottom) {
		    		offsetY = artworkBottom - 1.75*artworkHeight;
		    		img.addClass("bottom").removeClass("top");
		    	}
		    	else if (!atTop && !atBottom) {
		    		offsetY = $(this).scrollTop() + "px",
		    		img.removeClass("bottom").removeClass("top");
		    	}

			    img.delay(500).css({
			    	top: offsetY
			    });
		});
	});
	</script>

	</body>
</html>
