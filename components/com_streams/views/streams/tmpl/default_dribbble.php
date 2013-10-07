<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_weblinks
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

$post = $this->post;

// Uncomment for available attributes
// echo '<pre>';
//print_r($post);
// echo '</pre>';
// exit;
?>

	<p><img class="avatar" src="<?php echo $post->player->avatar_url; ?>" width="32" height="32">
	<a href="http://dribbble.com/<?php echo $post->player->username; ?>"><span><?php echo $post->player->name;?></span></a></p>
	<p><a href="<?php echo $post->url; ?>"><span><?php echo $post->title; ?></span></p>
	<p><img class="postimage" src="<?php echo $post->image_url; ?>" width="150"></a></p>