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

<div class="streamwrapper">
	<div class="streamintro">
		<p>
			Hello, this is a small intro block.
			I describe unnecessery info here.
			And this is also not interesting.
		</p>
	</div>
	<div class="itemswrapper">
		<div class="items">

					<?php foreach($this->items as $item): ?>

				    <?php
					$date = new JDate($item->date_created);
					$item->date_created = $date->format(JText::_('DATE_FORMAT_LC2'));
					$platform = $item->platform;
					$this->post = $item->php;
					?>

					<article style="position: relative;" class="stream <?php echo $platform; ?>">
					<?php echo $this->loadTemplate($platform); ?>
					<time><?php echo $item->date_created; ?></time>
					</article>
					
					<?php endforeach; ?>

		</div>
	</div>
</div>

<div class="pagination" style="display: none;">
	<p class="counter pull-right">
		<?php echo $this->pagination->getPagesCounter(); ?>
		<?php echo $this->pagination->getPagesLinks(); ?>
	</p>
</div>

<a class="left">left</a>
<a class="right">right</a>

<script>
var count = 0;
var items = 20;

$(document).ready(function() {
    $('a.left').click(function() {
    	if (count > 0){
			$('.stream').animate({
           		left: '+=10%'
        	}, 300);
        	count--;
        	console.log(count);
        }
    });

    $('a.right').click(function() {
    	if (count < (items - 2) / 2){
			$('.stream').animate({
           		left: '-=10%'
        	}, 300);
        	count++;
        	console.log(count);
        }
    });
});
</script>