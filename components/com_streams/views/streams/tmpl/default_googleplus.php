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

// format according element
if (isset($post['object']['attachments'])){

	if ($post['object']['attachments'][0]['objectType'] == 'photo'){
		$type = 'photo';
		$content = $post['object']['attachments'][0]['image']['url'];
		$permalink = $post['url'];
	} elseif ($post['object']['attachments'][0]['objectType'] == 'video'){
		$type = 'video';
		$content = strtok($post['object']['attachments'][0]['embed']['url'], '?') . '?feature=player_embedded&autoplay=0';
		$permalink = '';
	} elseif ($post['object']['attachments'][0]['objectType'] == 'article'){
		$type = 'url';
		$content = $post['object']['attachments'][0]['image']['url'];
		$permalink = $post['object']['attachments'][0]['url'];
	}

	$element = array('type' => $type, 'content' => $content, 'permalink' => $permalink);

} else {
	$element = '';
}
?>

<!-- PROFILE -->
<?php echo '<img src="' . $post['actor']['image']['url'] . '"></img>'; ?>
<?php echo $post['actor']['displayName']; ?>
<!-- PROFILE -->

<!-- TITLE -->
<?php echo '<h1>' . $post['title'] .'</h1>'; ?>
<!-- TITLE -->

<!-- ITEM -->
<?php var_dump($element); ?>
<!-- ITEM -->