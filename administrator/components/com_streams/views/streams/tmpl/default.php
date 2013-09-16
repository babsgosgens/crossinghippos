<?php
/**
 * @package     Streams
 *
 * @copyright   Copyright (C) 2010 - 2013 Crossing Hippos. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

JHtml::addIncludePath(JPATH_COMPONENT.'/helpers/html');
$_platforms = array('twitter', 'facebook', 'github', 'dribbble');
?>

<ul>
	<?php foreach ($_platforms as $type): ?>
		<?php $uri = JRoute::_('index.php?option=com_streams&task=update.'.$type); ?>
		<li><a href="<?php echo $uri; ?>"><?php echo $uri; ?></a></li>
	<?php endforeach; ?>
</ul>
