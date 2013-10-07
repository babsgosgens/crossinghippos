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
		$content = $post['object']['attachments'][0]['image']['url'];
		$link = $post['object']['attachments'][0]['url'];
		$description = '';
	} elseif ($post['object']['attachments'][0]['objectType'] == 'article'){
		$content = $post['object']['attachments'][0]['fullImage']['url'];
		$link = $post['object']['attachments'][0]['url'];

		if (isset($post['object']['attachments'][0]['content'])){
			$description = $post['object']['attachments'][0]['content'];
		} else {
			$description = '';
		}
	} elseif ($post['object']['attachments'][0]['objectType'] == 'video'){
		$content = $post['object']['attachments'][0]['image']['url'];
		$link = $post['object']['attachments'][0]['url'];

		if (isset($post['object']['attachments'][0]['content'])){
			$description = $post['object']['attachments'][0]['content'];
		} else {
			$description = '';
		}
	}

	$attachment = array('type' => $post['object']['attachments'][0]['objectType'], 'content' => $content, 'url' => $link, 'description' => $description);
}
?>

<!-- PROFILE -->
<?php echo '<img src="' . $post['actor']['image']['url'] . '"></img>'; ?>
<?php echo $post['actor']['displayName']; ?>
<!-- PROFILE -->

<!-- TITLE -->
<?php
if (isset($post['title']))
{
	echo '<h1>' . $post['title'] .'</h1>';
}
?>
<!-- TITLE -->

<!-- ITEM -->
<?php
if (isset($attachment)){
	echo '<a href="' . $attachment['url'] . '"><img src="' . $attachment['content'] . '"></a>';

	if (isset($attachment['description']))
	{
		echo '<p>' . $attachment['description'] . '</p>';
	}
	
} else {
	echo '<p>' . $post['object']['content'] . '</p>';
}
?>
<!-- ITEM -->