<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_weblinks
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

function replaceLinks($string){
    if (preg_replace_callback("/(?i)\b((?:https?:\/\/|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'\".,<>?«»“”‘’]))/", function($m) { return strlen($m[0]); }, $string) >= 20){
        return preg_replace_callback("/(?i)\b((?:https?:\/\/|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'\".,<>?«»“”‘’]))/", function($m) { return '<a href="' . $m[0] . '">' . trim(substr($m[0], 0, 20)) . '&hellip;</a>'; }, $string);
    } else {
        return preg_replace("/(?i)\b((?:https?:\/\/|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'\".,<>?«»“”‘’]))/", '<a href="$1">$1</a>', $string);
    }
}
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
					$post = $item->php;
					?>

					<article style="position: relative;" class="stream <?php echo $platform; ?>">
					<?php require('default_' . $platform . '.php'); ?>
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