<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_streams
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

$post = $displayData['post'];

// Uncomment for available attributes
// echo '<pre>';
// print_r(count($post->likes->data));
// echo '</pre>';
/*	<img class="round img--inline outline--decorative" src="https://graph.facebook.com/<?php echo $displayData['post']->from->id; ?>/picture?square" width="32" height="32" alt="">&nbsp; */
?>
<time class="date" datetime="<?php echo $displayData['datetime']; ?>"><i class="fa fa-calendar"></i> <?php echo $displayData['date']; ?></time>

<p class="lt-vertical-padding">
	<?php echo $post->message; ?>
</p>
<?php if (isset($post->likes)) : ?>
<div class="post__likes"><i class="fa fa-thumbs-up"></i> <?php echo count($post->likes->data); ?></div>
<?php endif; ?>

<a href="https://https://www.facebook.com/babsgosgens" class="post__actor">
	<i class="fa fa-facebook-square"></i>&nbsp;
	<span><?php echo $post->from->name; ?></span>
</a>
