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
$patterns = array('/@(\w+)/', '/#(\w+)/');
$replace = array('<a href="https://www.twitter.com/$1">@$1</a>', '<a href="https://twitter.com/search?q=%23$1&src=hash">#$1</a>');
$formatted_post = preg_replace($patterns, $replace, $displayData['post']->text);
?>

<img class="avatar" src="<?php echo $displayData['post']->user->profile_image_url; ?>" width="32" height="32">
<a href="https://www.twitter.com/<?php echo $displayData['post']->user->screen_name; ?>"><span><?php echo $displayData['post']->user->name;?></span><em>@<?php echo $displayData['post']->user->screen_name;?></em></a>
<p><?php echo $formatted_post; ?></p>
<time><?php echo $displayData['date']; ?></time>