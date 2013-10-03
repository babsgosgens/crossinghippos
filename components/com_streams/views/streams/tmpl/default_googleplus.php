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
?>

<?php echo $post[actor][image][url]; ?><?php echo $post[actor][displayName]; ?>
<?php echo $post[title]; ?><?php echo $post[url]; ?>

<?php echo $post[object][attachments][0][image][url]; ?>