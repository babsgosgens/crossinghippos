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
		foreach ($this->items as $item) :
			$this->post = $item->php;

			$platform = $item->platform;

			echo $this->loadTemplate( JText::_('COM_STREAMS_LABEL_PLATFORM'.$platform) );
		?>
		<?php endforeach; ?>
<?php endif; ?>