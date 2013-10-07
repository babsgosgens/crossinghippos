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

	if ($post['object']['attachments'][0]['objectType'] == 'photo' ||  $post['object']['attachments'][0]['objectType'] == 'video'){
		$content = $post['object']['attachments'][0]['image']['url'];
		$permalink = $post['object']['attachments'][0]['url'];
	} elseif ($post['object']['attachments'][0]['objectType'] == 'article'){
		$content = $post['object']['attachments'][0]['fullImage']['url'];
		$permalink = $post['object']['attachments'][0]['url'];
	}

	$attachment = array('type' => $post['object']['attachments'][0]['objectType'], 'content' => $content, 'url' => $permalink);
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

		if ($attachment['type'] == 'photo' || $attachment['type'] == 'video')
		{
			echo '<a href="' . $attachment['url'] . '"><img src="' . $attachment['content'] . '"></a>';
		}
		elseif ($attachment['type'] == 'article')
		{
			echo '<a href="' . $attachment['url'] . '"><img src="' . $attachment['content'] . '"></a>';
		}
	}
	?>
<!-- ITEM -->