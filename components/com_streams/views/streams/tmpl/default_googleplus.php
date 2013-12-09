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
<a class="box__userlink" href="<?php echo $post['actor']['url']; ?>">
	<!--<?php echo '<img class="avatar" src="' . $post['actor']['image']['url'] . '">'; ?>-->
	<i class="fa fa-google-plus"></i>
	<span class="box__username"><?php echo $post['actor']['displayName']; ?></span>
</a>
<!-- PROFILE -->

<!-- TITLE -->

<!-- TITLE -->

<!-- ITEM -->
<?php
if (isset($attachment)){
	echo '<div class="description"><a href="' . $attachment['url'] . '"><img class="postimage" src="' . $attachment['content'] . '"></a></div>';

	if (isset($attachment['description']))
	{
		echo '<p class="description description--small">' . $attachment['description'] . '</p>';
	}
	
} else {
	$patterns = array("/(?i)\b((?:https?:\/\/|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'\".,<>?«»“”‘’]))/");
	$replace = array('<a href="$1">$1</a>');
	$formatted_post = preg_replace($patterns, $replace, $post['object']['content']);
	echo '<p class="description">' . $formatted_post . '</p>';
}
?>
<!-- ITEM -->