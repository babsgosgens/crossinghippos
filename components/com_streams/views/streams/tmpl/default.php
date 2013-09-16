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

<?php if ( empty($this->items[0]) ):
	?>
	<?php else: 
		foreach ($this->items as $item) :
			$platform = $item->platform;

			$this->post = $item->php;
			echo $this->loadTemplate( JText::_('COM_STREAMS_LABEL_PLATFORM'.$platform) );
		?>
		<?php endforeach; ?>
<?php endif; ?>