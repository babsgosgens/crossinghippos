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
?>
<img class="avatar" src="<?php echo $displayData['post']->profileimg; ?>">
<a href="http://www.flickr.com/photos/<?php echo $displayData['post']->owner->nsid; ?>"><span><?php echo $displayData['post']->owner->username; ?></span></a>
<a href="<?php echo $displayData['post']->urls->url[0]->_content; ?>"><span><?php echo $displayData['post']->title->_content; ?></span>
<img class="postimage" src="<?php echo 'http://farm'.$displayData['post']->farm.'.staticflickr.com/'.$displayData['post']->server.'/'.$displayData['post']->id.'_'.$displayData['post']->secret.'_m.jpg'; ?>" width="150"></a>
<time><?php echo $displayData['date']; ?></time>