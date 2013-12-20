<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_weblinks
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Uncomment for available attributes
// echo '<pre>';
// print_r($displayData['post']);
// echo '</pre>';
// exit;
?>

<time class="date"><i class="fa fa-calendar"></i> <?php echo $displayData['date']; ?></time>

<a href="<?php echo $displayData['post']->url; ?>" class="lt-base lt-vertical-padding"> <img class="media soft" src="<?php echo $displayData['post']->image_url; ?>"></a>

<a href="http://dribbble.com/<?php echo $displayData['post']->player->username; ?>" class="post__actor">
	<i class="fa fa-dribbble"></i>&nbsp;
	<span><?php echo $displayData['post']->player->name;?> (<?php echo $displayData['post']->player->username;?>)</span>
</a>
