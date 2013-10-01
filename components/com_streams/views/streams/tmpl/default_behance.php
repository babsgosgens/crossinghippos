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

	<img src="<?php echo $post->owners[0]->images->{50}; ?>" width="32" height="32">
	<a href="<?php echo $post->owners[0]->url; ?>"><span><?php echo $post->owners[0]->username; ?></span></a>
	<a href="<?php echo $post->url; ?>"><span><?php echo $post->name; ?></span>
	<img src="<?php echo $post->covers->{202}; ?>" width="150"></a>
	Behance
