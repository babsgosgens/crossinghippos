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
			<jdoc:include type="modules" name="position-7" style="UiDd" />
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
		<div<?php if ($hasSubNavigation) : ?> class="w-sub-nav"<?php endif; ?>>

			<!-- component output -->
			<div role="main" class="main itemid-<?php echo $active->id; ?>">
				<jdoc:include type="message" />
				<jdoc:include type="modules" name="title" style="header" />
				<jdoc:include type="component" />
			</div>

			<!-- modules -->
			<aside class="lt-root">
				<!-- <h1 class="lt-prime lt-prime--clear lt-gutters hd hd--article">Through the grapevine:</h1> -->
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

			<?php if ($hasSubNavigation) : ?>
			<div role="navigation" class="sub-nav underline--dashed">
				<div class="lt-root">
				<jdoc:include type="modules" name="position-8" style="subnav" />
				</div>
			</div>
			<?php endif; ?>

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
				<jdoc:include type="modules" name="footer" style="cms" />
				</section>
			</div>
		</div>

	</footer>

	<script type="text/javascript">
	jQuery(document).ready(function($) {


		/* Prepare for toggle */
		$(".ui-dd__item").addClass("ui-dd__item--inactive");
		$(".adaptive-menu, .fld-group--ff").addClass("is--inactive");

		$("fld-group__label--ff").toggleStateClass({
			targetContext: ".fld-group",
			target: ".fld-group--ff",
			activeClass:"is--active",
			inactiveClass:"is--inactive"});

		/* Category navigat */
		$(".cat-nav__options").addClass("cat-nav__options--inactive").bind("click");
		$("cat-nav__options--inactive").on("click", function(e){
			$(this).toggleClass("cat-nav__options--active").toggleClass("cat-nav__options--inactive")
		});
		$(".cat-nav__options .active").toggleStateClass({
			targetContext: ".cat-nav",
			target: ".cat-nav__options",
			activeClass:"cat-nav__options--active",
			inactiveClass:"cat-nav__options--inactive"});


		/* Initialise toggles */
		$(".ui-dd__trigger").toggleStateClass();
		$(".adaptive-menu__trigger").toggleStateClass({
			targetContext: ".main-nav",
			target: ".adaptive-menu",
			activeClass:"is--active",
			inactiveClass:"is--inactive"});
		$(".adaptive-menu__item").on("click",function(){
			$(".adaptive-menu__trigger").click();
		});

		// $("[data-inject]").append( $( $("[data-inject]").data("inject") ).addClass("hd") );


	    var img    = $(".masthead__logo"),
	    	imgOrigPosition = $(".masthead__logo").position();
	    	mastheadHeight =$(".masthead").height(),
	    	artworkHeight =$(".footer__artwork").height(),
	    	artworkWidth =$(".footer__artwork").width(),
	    	artworkRatio = artworkWidth/artworkHeight,
	    	artworkTop = $(".footer__artwork").offset().top,
	    	artworkBottom = artworkTop + artworkHeight;

		$(window).resize(function(){
	    	artworkHeight =$(".footer__artwork").height(),
	    	artworkWidth =$(".footer__artwork").width(),
	    	artworkRatio = artworkWidth/artworkHeight,
	    	artworkTop = $(".footer__artwork").offset().top,
	    	artworkBottom = artworkTop - artworkHeight;
	    	$(this).trigger("curious");
		});
		$(window).scroll(function(){
	    	$(this).trigger("curious");
		});

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

		$(window).on("curious", function() {

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
		    	else {
		    		// console.log( artworkTop );
		    		// console.log( artworkBottom );
		    		// console.log(artworkHeight);
		    		// console.log(artworkHeight);
		    		offsetY = artworkBottom - 3*img.height();
		    		img.addClass("bottom").removeClass("top");
		    	}

			    img.delay(500).css({
			    	top: offsetY
			    });
		});
	});
	</script>

	</body>
</html>
