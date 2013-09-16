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

/*
	// Call attributes like so
	$created_at = $post->created_at;
	$text = $post->text;
 */

// Uncomment for available attributes
echo '<pre>';
print_r($post);
echo '</pre>';
?>