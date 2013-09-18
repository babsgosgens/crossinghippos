<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_weblinks
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
?>

<h1>Streams</h1>

<?php if ( empty($this->items) ):
	?>
	<p>Geen resultaten</p>
	<?php else: 

			// echo '<pre>';
			// print_r($this->items);
			// echo '</pre>';

			foreach ($this->items as $item) :

			// echo '<pre>';
			// print_r($item);
			// echo '</pre>';

			$this->post = $item->php;

			$platform = $item->platform;
			echo $this->loadTemplate($platform);
		?>
		<?php endforeach; ?>
<?php endif; ?>

<div class="pagination">
	<p class="counter pull-right">
		<?php echo $this->pagination->getPagesCounter(); ?>
	</p>
	<?php echo $this->pagination->getPagesLinks(); ?>
</div>
