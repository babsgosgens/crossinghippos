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

// Format the content
$patterns = array("/(?i)\b((?:https?:\/\/|www\d{0,3}[.]|[a-z0-9.\-]+[.][a-z]{2,4}\/)(?:[^\s()<>]+|\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+(?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)|[^\s`!()\[\]{};:'\".,<>?«»“”‘’]))/", '/@(\w+)/', '/#(\w+)/');
$replace = array('<a href="$1">$1</a>', '<a href="https://www.facebook.com/$1">@$1</a>&nbsp;', '<a href="https://www.facebook.com/hashtag/$1">#$1</a>');
$formatted_post = preg_replace($patterns, $replace, $post->message);

if ($post->picture != ''){
	$picture = '<p><img src="' . $post->picture . '" /></p>';
} else {
	$picture = '';
}
?>

<a href="https://www.facebook.com/<?php echo $post->from->id; ?>"><span><?php echo $post->from->name;?></span></a>
<p><?php echo $formatted_post; ?></p>
<?php echo $picture; ?>