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

<article class="stream intro">
	<p>
		Hello, this is a small intro block.
		I describe unnecessery info here.
		And this is also not interesting.
	</p>
</article>

<div class="scrollable" id="scrollable">
  	<div class="scrollable__items">

		<?php $count = 1; foreach($this->items as $item): ?>

			<?php if ($count%2 == 1 && !$detect->isMobile()): ?>
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

			<?php if ($count%2 == 0 && !$detect->isMobile()): ?>
	        	</div>
		    <?php endif; ?>
		
		<?php $count++; endforeach; ?>

		<?php if ($count%2 != 1 && !$detect->isMobile()) echo "</div>"; ?>

  </div>
</div>

<a class="next browse right">></a>
<a class="prev browse left"><</a>

<script>
if(jQuery().scrollable) {
    $(".scrollable").scrollable({touch: false});
}
</script>

<div class="pagination">
	<p class="counter pull-right">
		<?php echo $this->pagination->getPagesCounter(); ?>
		<?php echo $this->pagination->getPagesLinks(); ?>
	</p>
</div>