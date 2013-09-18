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
$user = $post->user;
/*
	// Call attributes like so
	$created_at = $post->created_at;
	$text = $post->text;
 */

// Uncomment for available attributes
echo '<pre>';
// print_r($user);
// print_r($post);
echo '</pre>';

// Format the content
$patterns = array('/@(\w+)/', '/#(\w+)/');
$replace = array('<a href="https://www.twitter.com/$1">@$1</a>&nbsp;', '<a href="https://twitter.com/search?q=%23$1&src=hash">#$1</a>');
$formatted_post = preg_replace($patterns, $replace, $post->text);

?>

	<img src="<?php echo $user->profile_image_url; ?>" width="32" height="32">
	<!-- DON'T FORGET TO REMOVE EMBEDDED EM STYLES -->
	<a href="https://www.twitter.com/<?php echo $user->screen_name; ?>"><span><?php echo $user->name;?></span><em>@<?php echo $user->screen_name;?></em></a>
	<p><?php echo $formatted_post; ?></p>