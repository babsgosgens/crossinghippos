<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_login
 *
 * @copyright   Copyright (C) 2013 Babs Gösgens
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
?>

<script src="media/mod_streams/js/script.js"></script>

<div class="streamwrapper">
	<div class="streamintro">X</div>
	<div class="itemswrapper">
		<div class="items">

					<?php foreach($items as $item): ?>

					<article class="stream <?php echo $item->platform; ?>">

					    <?php
						$date = new JDate($item->date_created);
						$date_created = $date->format(JText::_('DATE_FORMAT_LC2'));
						$platform = $item->platform;
						$post = unserialize(base64_decode($item->raw));
						require(JPATH_SITE . '/components/com_streams/views/streams/tmpl/default_' . $platform . '.php');
						echo '<time>' . $date_created . '</time>';
						?>

					</article>
					
					<?php endforeach; ?>

		</div>
	</div>	

	<a href="#left" class="left"><</a>
	<a href="#right" class="right">></a>

</div>