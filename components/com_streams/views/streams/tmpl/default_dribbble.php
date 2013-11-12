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
// print_r($post);
// echo '</pre>';
// exit;
?>

	<a href="http://dribbble.com/<?php echo $post->player->username; ?>"><span><?php echo $post->player->name;?></span></a></p>
	<p><a href="<?php echo $post->url; ?>"> <img class="postimage" src="<?php echo $post->image_url; ?>" width="150"></a></p>