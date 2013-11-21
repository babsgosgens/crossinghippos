<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_login
 *
 * @copyright   Copyright (C) 2013 Babs Gösgens
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Include slider script.
$document = JFactory::getDocument();
$document->addScript('media/mod_streams/js/slider.js');
$count = 0;
?>

<style>
.box-list__group
{
	display: inline-block;
}
</style>

<div class="streamscontent">

	<div class="streamswrapper">

		<ul class="box-list">
				
			<?php foreach($items as $item): ?>

				<?php if ($count % 4 == 1): ?>
					<div class="box-list__group">
				<?php endif; ?>
			
					<li class="lt box-list__item box--box-list box--small stream <?php echo $item->platform; ?>">
					    <?php
						$date = new JDate($item->date_created);
						$date_created = $date->format(JText::_('DATE_FORMAT_LC2'));
						$platform = $item->platform;
						$post = unserialize(base64_decode($item->raw));
						require(JPATH_SITE . '/components/com_streams/views/streams/tmpl/default_' . $platform . '.php');
						echo '<time>' . $date_created . '</time>';
						?>
					</li>

				<?php if ($count % 4 == 0): ?>
					</div>
				<?php endif; ?>

			<?php $count++; endforeach; ?>
				
		</ul>

	</div>

	<a href="#left" class="left"><</a>
	<a href="#right" class="right">></a>

</div>