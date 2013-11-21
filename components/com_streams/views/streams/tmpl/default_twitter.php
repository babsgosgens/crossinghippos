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

// Format the content
$patterns = array('/@(\w+)/', '/#(\w+)/');
$replace = array('<a href="https://www.twitter.com/$1">@$1</a>', '<a href="https://twitter.com/search?q=%23$1&src=hash">#$1</a>');
$formatted_post = preg_replace($patterns, $replace, $post->text);
$formatted_post = replaceLinks($formatted_post);
?>
<meta charset="utf-8"> 
<img class="avatar" src="<?php echo $post->user->profile_image_url; ?>" width="32" height="32">
<!-- DON'T FORGET TO REMOVE EMBEDDED EM STYLES -->
<a href="https://www.twitter.com/<?php echo $post->user->screen_name; ?>"><span><?php echo $post->user->name;?></span><em>@<?php echo $post->user->screen_name;?></em></a>
<p><?php echo $formatted_post; ?></p>