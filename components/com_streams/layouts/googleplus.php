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
// print_r($displayData['post']);
// echo '</pre>';

// format according element
if (isset($displayData['post']['object']['attachments'])){

	if ($displayData['post']['object']['attachments'][0]['objectType'] == 'photo'){
		$content = $displayData['post']['object']['attachments'][0]['image']['url'];
		$link = $displayData['post']['object']['attachments'][0]['url'];
		$description = '';
	} elseif ($displayData['post']['object']['attachments'][0]['objectType'] == 'article'){
		$content = $displayData['post']['object']['attachments'][0]['fullImage']['url'];
		$link = $displayData['post']['object']['attachments'][0]['url'];

		if (isset($displayData['post']['object']['attachments'][0]['content'])){
			$description = $displayData['post']['object']['attachments'][0]['content'];
		} else {
			$description = '';
		}
	} elseif ($displayData['post']['object']['attachments'][0]['objectType'] == 'video'){
		$content = $displayData['post']['object']['attachments'][0]['image']['url'];
		$link = $displayData['post']['object']['attachments'][0]['url'];

		if (isset($displayData['post']['object']['attachments'][0]['content'])){
			$description = $displayData['post']['object']['attachments'][0]['content'];
		} else {
			$description = '';
		}
	}

	$attachment = array('type' => $displayData['post']['object']['attachments'][0]['objectType'], 'content' => $content, 'url' => $link, 'description' => $description);
}
?>

<!-- PROFILE -->
<?php echo '<img class="avatar" src="' . $displayData['post']['actor']['image']['url'] . '">'; ?>
<?php echo $displayData['post']['actor']['displayName']; ?>
<!-- PROFILE -->

<!-- TITLE -->
<?php
if (isset($displayData['post']['title']))
{
	echo '<h1>' . $displayData['post']['title'] .'</h1>';
}
?>
<!-- TITLE -->

<!-- ITEM -->
<?php
if (isset($attachment)){
	echo '<a href="' . $attachment['url'] . '"><img class="postimage" src="' . $attachment['content'] . '"></a>';

	if (isset($attachment['description']))
	{
		echo '<p>' . $attachment['description'] . '</p>';
	}
	
} else {
	$patterns = array("/(?i)\b((?:https?:\/\/|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'\".,<>?«»“”‘’]))/");
	$replace = array('<a href="$1">$1</a>');
	$formatted_post = preg_replace($patterns, $replace, $displayData['post']['object']['content']);
	echo '<p>' . $formatted_post . '</p>';
}
?>
<!-- ITEM -->
<time><?php echo $displayData['date']; ?></time>