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
// exit;

$post = $displayData['post'];

/* <img class="round img--inline outline--decorative" src="<?php echo $post['actor']['image']['url']; ?>" alt="" width="32" height="32">  */

// format according element
$attachment = '';
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
<time class="date" datetime="<?php echo $displayData['datetime']; ?>"><i class="fa fa-calendar"></i> <?php echo $displayData['date']; ?></time>


<?php if ( isset($post['title']) ) : ?>
	<h1 class="lt-vertical-padding"><a href="<?php echo $post['url']; ?>"><?php echo $post['title']; ?></a></h1>
<?php endif; ?>

<?php if ( $attachment != '' ) : ?>
	<a href="<?php echo $attachment['url']; ?>"><img class="media soft" src="<?php echo $attachment['content']; ?>" alt=""></a>
<?php else : ?>
	<?php if ( isset($attachment['description']) ) : ?>
	<p><?php echo $attachment['description']; ?></p>
	<?php else: ?>
	<?php
	$patterns = array("/(?i)\b((?:https?:\/\/|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'\".,<>?«»“”‘’]))/");
	$replace = array('<a href="$1">$1</a>');
	$formatted_post = preg_replace($patterns, $replace, $post['object']['content']);
	?>
	<p><?php echo $formatted_post; ?></p>
	<?php endif; ?>
<?php endif; ?>



<a href="<?php echo $post['actor']['url']; ?>" class="post__actor">
	<i class="fa fa-google-plus"></i>&nbsp;
	<span><?php echo $post['actor']['displayName']; ?></span>
</a>
