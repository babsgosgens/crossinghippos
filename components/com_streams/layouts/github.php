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
<a href="<?php echo $displayData['post']->author->html_url; ?>"><span><?php echo $displayData['post']->commit->author->name; ?></span></a>
<p><?php echo $displayData['post']->commit->message; ?></p>
<time><?php echo $displayData['date']; ?></time>