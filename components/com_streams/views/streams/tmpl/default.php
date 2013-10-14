<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_weblinks
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
require_once( JPATH_SITE.'/libraries/mobiledetect/Mobile_Detect.php' );
$detect = new Mobile_Detect;
?>

<div class="scrollable" id="scrollable">
  	<div class="scrollable__items">
	<?php if(!$detect->isMobile()): ?>

		<div>
			  	<article class="stream intro">
			  		<p>
			  			Hello, this is a small intro block.
			  			I describe unnecessery info here.
			  			And this is also not interesting.
			  		</p>
			  	</article>

			  	<?php
			  	$date = new JDate($this->items[0]->date_created);
				$this->items[0]->date_created = $date->format(JText::_('DATE_FORMAT_LC2'));
				$platform = $this->items[0]->platform;
				$this->post = $this->items[0]->php;
				?>

			  	<article class="stream <?php echo $this->items[0]->platform; ?>">
		  		<?php echo $this->loadTemplate($this->items[0]->platform); ?>
		  		<time><?php echo $this->items[0]->date_created; ?></time>
		  		</article>

		  		<?php
			  	$date = new JDate($this->items[1]->date_created);
				$this->items[1]->date_created = $date->format(JText::_('DATE_FORMAT_LC2'));
				$platform = $this->items[1]->platform;
				$this->post = $this->items[1]->php;
				?>

			  	<article class="stream <?php echo $this->items[1]->platform; ?>">
		  		<?php echo $this->loadTemplate($this->items[1]->platform); ?>
		  		<time><?php echo $this->items[1]->date_created; ?></time>
		  		</article>

		</div>

		<?php
		/**
		*
		* Remove the first two items because we allready printed those.
		*
		*/
		unset($this->items[0]);
		unset($this->items[1]);
		?>

	<?php endif; ?>

		<?php $count = 1; foreach($this->items as $item): ?>

			<?php if ($count%4 == 1 && !$detect->isMobile()): ?>
	        	<div>
		    <?php endif; ?>

	    <?php
		$date = new JDate($item->date_created);
		$item->date_created = $date->format(JText::_('DATE_FORMAT_LC2'));
		$platform = $item->platform;
		$this->post = $item->php;
		?>

		<article class="stream <?php echo $platform; ?>">
		<?php echo $this->loadTemplate($platform); ?>
		<time><?php echo $item->date_created; ?></time>
		</article>

			<?php if ($count%4 == 0 && !$detect->isMobile()): ?>
	        	</div>
		    <?php endif; ?>
		
		<?php $count++; endforeach; ?>

		<?php if ($count%4 != 1 && !$detect->isMobile()) echo "</div>"; ?>

  </div>
</div>

<?php if (!$detect->isMobile()): ?>
<a class="next browse right">></a>
<a class="prev browse left"><</a>
<?php endif; ?>

<script>
if(jQuery().scrollable) {
    $(".scrollable").scrollable();
}
</script>

<div class="pagination">
	<p class="counter pull-right">
		<?php echo $this->pagination->getPagesCounter(); ?>
		<?php echo $this->pagination->getPagesLinks(); ?>
	</p>
</div>