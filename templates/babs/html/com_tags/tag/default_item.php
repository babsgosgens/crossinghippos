<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_content
 *
 * @copyright   Copyright (C) 2013 Babs Gösgens. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Create a shortcut for params.
$params = &$this->item->params;
$images = json_decode($this->item->core_images);
?>
<article>
	<header class="streamheader">
		<h1 class="streamheader-title"><a href="<?php echo $this->item->link; ?>"><?php echo $this->escape($this->item->core_title); ?></a></h1>
		<p class="streamheader-category"><?php //echo JText::sprintf('CROSSINGHIPPOS_STREAM_CATEGORY', $category); ?></p>
	</header>
	<figure class="streamcontent">
		<a href="<?php echo $this->item->link; ?>"><img src="<?php echo htmlspecialchars($images->image_intro); ?>" alt="<?php echo htmlspecialchars($images->image_intro_alt); ?>" width="1" height="1"></a>
	</figure>
</article>