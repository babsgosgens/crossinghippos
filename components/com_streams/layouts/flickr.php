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
<time class="date" datetime="<?php echo $displayData['datetime']; ?>"><i class="fa fa-calendar"></i> <?php echo $displayData['date']; ?></time>
<p class="lt-vertical-padding">
<a href="<?php echo $displayData['post']->urls->url[0]->_content; ?>">
<img class="media soft" src="<?php echo 'http://farm'.$displayData['post']->farm.'.staticflickr.com/'.$displayData['post']->server.'/'.$displayData['post']->id.'_'.$displayData['post']->secret.'_m.jpg'; ?>" alt=""></a>
</p>
<a href="http://www.flickr.com/photos/<?php echo $displayData['post']->owner->nsid; ?>" class="post__actor">
	<i class="fa fa-flickr"></i>&nbsp;
	<span><?php echo $displayData['post']->owner->username; ?></span>
</a>
