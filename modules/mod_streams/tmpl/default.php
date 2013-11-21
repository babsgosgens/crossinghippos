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
?>

<div class="streamwrapper">
	<div class="itemswrapper">
		<ul class="box-list">
			
			<?php foreach($items as $item): ?>
			
				<li class="lt-base lt-column--half lt-gutters--half lt-vertical-padding  box-list__item <?php echo $item->platform; ?>">
					<div class="lt-column box  box--padded box--stream">
				    <?php
					$date = new JDate($item->date_created);
					$date_created = $date->format(JText::_('DATE_FORMAT_LC2'));
					$platform = $item->platform;
					$post = unserialize(base64_decode($item->raw));
					require(JPATH_SITE . '/components/com_streams/views/streams/tmpl/default_' . $platform . '.php');
					echo '<time>' . $date_created . '</time>';
					?>
					</div>
				</li>

			<?php endforeach; ?>
			
		</ul>
	</div>	

	<a href="#left" class="left"><</a>
	<a href="#right" class="right">></a>

</div>