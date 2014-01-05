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

<p class="lt-vertical-padding"><a href="<?php echo $displayData['post']->html_url; ?>"><?php echo $displayData['post']->commit->message; ?></a></p>

<a href="<?php echo $displayData['post']->author->html_url; ?>" class="post__actor">
	<i class="fa fa-github"></i> <span><?php echo $displayData['post']->commit->author->name; ?></span></a>
