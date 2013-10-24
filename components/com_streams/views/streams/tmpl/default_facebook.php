<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_streams
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
if (isset($post->message))
{
	$formatted_post = replaceLinks($post->message);
}
?>


<?php echo '<img class="avatar" src="https://graph.facebook.com/' . $post->from->id . '/picture?square">'; ?>
<a href="https://www.facebook.com/<?php echo $post->from->id; ?>"><span><?php echo $post->from->name;?></span></a>
<?php
if (isset($formatted_post))
{
	echo '<p>' . $formatted_post . '</p>';
}
?>