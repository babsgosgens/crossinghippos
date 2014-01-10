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
$count = 1;
?>

<div class="streamwrapper">
	<div class="itemswrapper">
		<ul class="box-list">
			
			<?php foreach($this->$items as $item): ?>

				<?php if ($count % 4 == 1): ?>
					<div class="box-list__group">
				<?php endif; ?>
			
				<li class="lt-base lt-column--half lt-gutters--half lt-vertical-padding  box-list__item <?php echo $item->platform; ?>">
					<div class="lt-column box  box--padded box--stream">

				    <?php
				    $date = new JDate($item->date_created);

				    // new data
				    $itemObj['platform'] = $item->platform;
					$itemObj['date'] = $date->format(JText::_('DATE_FORMAT_LC2'));
				    $itemObj['post'] = unserialize(base64_decode($item->raw));

				    $layout = new JLayoutFile('layouts.' . $item->platform, JPATH_BASE . '\\components\\com_streams');
				    echo $layout->render($itemObj);
					?>

					</div>
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

<div class="pagination" style="display: none;">
	<p class="counter pull-right">
		<?php echo $this->pagination->getPagesCounter(); ?>
		<?php echo $this->pagination->getPagesLinks(); ?>
	</p>
</div>