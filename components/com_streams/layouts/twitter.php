<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_streams
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Uncomment for available attributes
// echo '<pre>';
// print_r($displayData);
// echo '</pre>';

// Format the content
$patterns = array('/@(\w+)/', '/#(\w+)/', '/http[s]*:\/\/\w[.]{1}\w+[\/\w*]*[[.]{1}?\w\S*]+/');
$replace = array('<a href="https://www.twitter.com/$1">@$1</a>', '<a href="https://twitter.com/search?q=%23$1&src=hash">#$1</a>', '<a href="$1">$1</a>');
$formatted_post = preg_replace($patterns, $replace, $displayData['post']->text);

/* <img class="round img--inline outline--decorative" src="<?php echo $displayData['post']->user->profile_image_url; ?>" width="32" height="32"></a>&nbsp; */
?>


<time class="date"><i class="fa fa-calendar"></i> <?php echo $displayData['date']; ?></time>



<p class="lt-vertical-padding">
<a href="https://www.twitter.com/<?php echo $displayData['post']->user->screen_name; ?>"><?php echo $formatted_post; ?>
</p>
<a href="https://www.twitter.com/<?php echo $displayData['post']->user->screen_name; ?>" class="post__actor">
	<i class="fa fa-twitter"></i>&nbsp;
	<span><?php echo $displayData['post']->user->name;?> (@<?php echo $displayData['post']->user->screen_name;?>)</span>
</a>

