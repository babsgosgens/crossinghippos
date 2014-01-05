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

$total = count($items);
$columns = 2;
$columnLength = round($total/$columns);
?>

<div class="leader trailer">

		<?php for ($i=0; $i<$columns; $i++) : ?>
			<?php // Reset counter ?>
			<?php $c = $i * $columnLength; ?>
			<div class="lt-base lt-base--float lt-column--half lt-gutters">

			<?php for ($j=0; $j<$columnLength; $j++) : ?>
				<?php if ( !isset($items[$c])) { break; } ?>
				<?php $item = $items[$c]; $c++; ?>

				<article class="lt-column box box--js box--padded box--filled trailer box--stream post" data-api="<?php echo $item->platform; ?>">

				    <?php
				    // new data
				    $itemObj['platform'] = $item->platform;
					$itemObj['date'] = JHtml::_('date', $item->date_created);
					$itemObj['datetime'] = JHtml::_('date', $item->date_created, 'Y-m-d').'T'.JHtml::_('date', $item->date_created, 'H:i');
				    $itemObj['post'] = unserialize(base64_decode($item->raw));

				    $layout = new JLayoutFile('layouts.' . $item->platform, JPATH_BASE . '/components/com_streams');
				    echo $layout->render($itemObj);
					?>

				</article>

			<?php endfor; ?>

			</div>
		<?php endfor; ?>

</div>