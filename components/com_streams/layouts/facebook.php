<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_streams
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Uncomment for available attributes
// echo '<pre>';
// print_r($displayData);
// echo '</pre>';
?>

<img class="avatar" src="https://graph.facebook.com/<?php echo $displayData['post']->from->id; ?>/picture?square">
<a href="https://www.facebook.com/<?php echo $displayData['post']->from->id; ?>"><span><?php echo $displayData['post']->from->name;?></span></a>
<?php if(isset($displayData['post']->message)): ?>
	<p><?php echo $displayData['post']->message; ?></p>
<?php endif; ?>
<time><?php echo $displayData['date']; ?></time>