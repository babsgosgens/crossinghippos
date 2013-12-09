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

	<p>
		<a class="box__userlink" href="http://www.flickr.com/photos/<?php echo $post->owner->nsid; ?>">
			<i class="fa fa-flickr"></i>
			<span class="box__username"><?php echo $post->owner->username; ?></span>
		</a>
	</p>

	<p>
		<a href="<?php echo $post->urls->url[0]->_content; ?>">
			<img class="postimage" src="<?php echo 'http://farm'.$post->farm.'.staticflickr.com/'.$post->server.'/'.$post->id.'_'.$post->secret.'_m.jpg'; ?>">
		</a>
	</p>