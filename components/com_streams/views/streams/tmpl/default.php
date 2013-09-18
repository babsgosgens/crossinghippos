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
			$date = new JDate($item->date_created);
			$platform = $item->platform;

			$this->post = $item->php;
			?>
			<article class="stream <?php echo $platform; ?>">
				<?php echo $this->loadTemplate($platform); ?>
				<time><?php echo $item->date_created = $date->format( JText::_('DATE_FORMAT_LC2') ); ?></time>
			</article>
		<?php endforeach; ?>
<?php endif; ?>

<div class="pagination">
	<p class="counter pull-right">
		<?php echo $this->pagination->getPagesCounter(); ?>
	</p>
	<?php echo $this->pagination->getPagesLinks(); ?>
</div>
