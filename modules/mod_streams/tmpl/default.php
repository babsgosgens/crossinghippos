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
$document->addStyleSheet('media/mod_streams/js/slider.css');
$count = 1;
?>

<div class="streamscontent">

	<div class="streamswrapper">

		<ul class="box-list">
				
			<?php foreach($items as $item): ?>

				<?php if ($count % 4 == 1): ?>
					<div class="box-list__group">
				<?php endif; ?>

				<li class="lt-base lt-column--half lt-gutters lt-vertical-padding  box-list__item  box-list__item--js  box-list__item--<?php echo $item->platform; ?>" data-api="<?php echo $item->platform; ?>">
					<div class="lt-column box  box--padded box--stream">

				    <?php
				    $date = new JDate($item->date_created);

				    // new data
				    $itemObj['platform'] = $item->platform;
					$itemObj['date'] = $date->format(JText::_('DATE_FORMAT_LC2'));
				    $itemObj['post'] = unserialize(base64_decode($item->raw));

				    $layout = new JLayoutFile('layouts.' . $item->platform, JPATH_BASE . '/components/com_streams');
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