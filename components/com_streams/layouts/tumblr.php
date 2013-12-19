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
?>
<p><?php echo $displayData['post']->blog_name; ?></p>
<p><?php if (isset($displayData['post']->title)){ echo $displayData['post']->title; } ?></p>
<time><?php echo $displayData['date']; ?></time>