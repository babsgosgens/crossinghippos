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

	<img class="avatar" src="<?php echo $post->author->avatar_url; ?>" width="32" height="32">
	<a href="<?php echo $post->author->html_url; ?>"><span><?php echo $post->commit->author->name; ?></span></a>
	<p><?php echo $post->commit->message; ?></p>