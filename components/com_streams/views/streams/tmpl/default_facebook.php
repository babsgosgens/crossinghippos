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
echo '<pre>';
print_r($post);
echo '</pre>';
?>

<a href="https://www.facebook.com/<?php echo $post->from->id; ?>"><span><?php echo $post->from->name;?></span></a>
<p><?php echo $post->message; ?></p>
<p><img src="<?php echo $post->picture ?>" /></p>