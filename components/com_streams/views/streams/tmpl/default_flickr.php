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
// print_r($post);
// echo '</pre>';
// exit;
?>

	<a href="<?php echo $post->owner->nsid; ?>"><span><?php echo $post->owner->username; ?></span></a>
	<a href="<?php echo $post->urls->url[0]->_content; ?>"><span><?php echo $post->title->_content; ?></span>
	<img src="<?php echo 'http://farm'.$post->farm.'.staticflickr.com/'.$post->server.'/'.$post->id.'_'.$post->secret.'_m.jpg'; ?>" width="150"></a>