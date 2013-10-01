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
$patterns = array('/@(\w+)/', '/#(\w+)/');
$replace = array('<a href="https://www.facebook.com/$1">@$1</a>&nbsp;', '<a href="https://www.facebook.com/hashtag/$1">#$1</a>');
$formatted_post = preg_replace($patterns, $replace, $post->message);
>>>>>>> b9efe081be9b165e173ab08973548db08858c753
?>

<a href="https://www.facebook.com/<?php echo $post->from->id; ?>"><span><?php echo $post->from->name;?></span></a>
<p><?php echo $formatted_post; ?></p>
<p><img src="<?php echo $post->picture ?>" /></p>