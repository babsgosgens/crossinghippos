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
// print_r($displayData);
// echo '</pre>';
// exit;

$post = $displayData['post'];

// $post_url = $post->post_url;
// $post_username = $post->blog_name;
// $post
?>
<time class="date"><i class="fa fa-calendar"></i> <?php echo $displayData['date']; ?></time>

<h1><a href="<?php echo $post_url; ?>"><?php echo $post->title; ?></a></h1>

<?php if ( isset($post->description) ) : ?>
<p style="max-height: 100px; overflow: hidden;"><?php echo $post->description; ?></p>
<?php endif; ?>
<?php if ( isset($post->body) ) : ?>
<p style="max-height: 100px; overflow: hidden;"><?php echo $post->body; ?></p>
<?php endif; ?>

<a href="http://dribbble.com/<?php echo $displayData['post']->player->username; ?>" class="post__actor">
	<i class="fa fa-tumblr-square"></i>&nbsp;
	<span><?php echo $post->blog_name; ?></span>
</a>
