<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_articles_latest
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
?>

<ul class="box-list">
<?php foreach ($list as $item) :  ?>
	<li class="lt box-list__item">
		<div class="lt lt--fourth">
			Eye icon
		</div><!--
	 --><div class="lt lt--half"
			<a href="<?php echo $item->link; ?>"><?php echo $item->title; ?></a>

			<?php
			if (strlen($item->introtext) > 200) {
				echo (substr($item->introtext, 0, 200)) . "&hellip;";
			} else {
				echo $item->introtext;
			}
			?>
		</div><!--
	 --><div class="lt lt--fourth">
			<?php foreach ($item->tags->itemTags as $tag) : ?>
				<?php echo $tag->title; ?>
			
			<?php endforeach; ?>
		</div>
	</li>
<?php endforeach; ?>
</ul>