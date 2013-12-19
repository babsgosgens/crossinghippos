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

<p><img class="avatar" src="<?php echo $displayData['post']->owners[0]->images->{50}; ?>" width="32" height="32">
<a href="<?php echo $displayData['post']->owners[0]->url; ?>"><span><?php echo $displayData['post']->owners[0]->username; ?></span></a></p>
<p><a href="<?php echo $displayData['post']->url; ?>"><span><?php echo $displayData['post']->name; ?></span></p>
<p><img class="postimage" src="<?php echo $displayData['post']->covers->{202}; ?>" width="150"></a></p>
<time><?php echo $displayData['date']; ?></time>