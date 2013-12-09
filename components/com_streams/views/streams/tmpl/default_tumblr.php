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
// exit;
?>
	<p>
		<a class="box__userlink" href="http://<?php echo $post->blog_name ?>.tumblr.com"> 	
			<i class="fa fa-tumblr"></i>
			<span class="box__username"><?php echo $post->blog_name; ?></span>
		</a>
	</p>
	<p class="post__title">
		<a href="<?php echo $post->short_url ?>">
			<?php if (isset($post->title)){ echo $post->title; } ?>
		</a>	
	</p>
	<div class="description">
		<?php if (isset($post->description)){ echo $post->description; } ?>
	</div>
