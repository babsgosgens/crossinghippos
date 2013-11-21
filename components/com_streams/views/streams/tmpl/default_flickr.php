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

	<p><img class="avatar" src="<?php echo $post->profileimg; ?>"></p>
	<p><a href="http://www.flickr.com/photos/<?php echo $post->owner->nsid; ?>"><span><?php echo $post->owner->username; ?></span></a></p>
	<p><a href="<?php echo $post->urls->url[0]->_content; ?>"><span><?php echo $post->title->_content; ?></span></p>
	<p><img class="postimage" src="<?php echo 'http://farm'.$post->farm.'.staticflickr.com/'.$post->server.'/'.$post->id.'_'.$post->secret.'_m.jpg'; ?>" width="150"></a></p>