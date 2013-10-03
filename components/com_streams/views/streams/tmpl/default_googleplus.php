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
?>

<!-- PROFILE -->
<?php echo '<img src="' . $post['actor']['image']['url'] . '"></img>'; ?>
<?php echo $post['actor']['displayName']; ?>

<!-- ITEM -->
<?php
if (isset($post['object']['attachments'][0])){
	// if photo
	if ($post['object']['attachments'][0]['objectType'] == 'photo'){
		echo '<a href="' . $post['url'] . '"><h1>' . $post['title'] . '</h1><img src="' . $post['object']['attachments'][0]['image']['url'] . '"></img></a>';
	} elseif ($post['object']['attachments'][0]['objectType'] == 'video'){
		echo '<h1>' . $post['title'] . '</h1><iframe src="' . strtok($post['object']['attachments'][0]['embed']['url'], '?') . '?feature=player_embedded&autoplay=0" frameborder="0" allowfullscreen></iframe>';
	}
}
?>