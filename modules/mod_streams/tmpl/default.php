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

<div class="streamscontent leader trailer">

	<div class="streamswrapper">

		<ul class="list-inline box-list">
				
			<?php foreach($items as $item): ?>

				<li class="lt-base lt-base--float lt-column--half lt-gutters">
					<div class="lt-column box box--js box--padded box--filled trailer box--stream post" data-api="<?php echo $item->platform; ?>">

				    <?php
				    // new data
				    $itemObj['platform'] = $item->platform;
					$itemObj['date'] = JHtml::_('date', $item->date_created);
				    $itemObj['post'] = unserialize(base64_decode($item->raw));

				    $layout = new JLayoutFile('layouts.' . $item->platform, JPATH_BASE . '/components/com_streams');
				    echo $layout->render($itemObj);
					?>

					</div>
				</li>

			<?php $count++; endforeach; ?>

		</ul>

	</div>

</div>