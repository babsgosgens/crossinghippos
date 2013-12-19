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

<a href="http://dribbble.com/<?php echo $displayData['post']->player->username; ?>"><span><?php echo $displayData['post']->player->name;?></span></a></p>
<p><a href="<?php echo $displayData['post']->url; ?>"> <img class="postimage" src="<?php echo $displayData['post']->image_url; ?>"></a></p>
<time><?php echo $displayData['date']; ?></time>