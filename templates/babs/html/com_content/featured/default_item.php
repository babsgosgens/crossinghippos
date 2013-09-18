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
$images = json_decode($this->item->images);
$canEdit = $this->item->params->get('access-edit');
$info    = $this->item->params->get('info_block_position', 0);


$category = $this->item->parent_title!= 'ROOT' ? '<a href="'.JRoute::_(ContentHelperRoute::getCategoryRoute($this->item->parent_slug)).'">'.$this->escape($this->item->parent_title).'</a>/' : '';
$category .= '<a href="'.JRoute::_(ContentHelperRoute::getCategoryRoute($this->item->catslug)).'">'.$this->escape($this->item->category_title).'</a>'

?>

<article>
	<header class="streamheader">
		<h1 class="streamheader-title"><a href="<?php echo JRoute::_(ContentHelperRoute::getArticleRoute($this->item->slug, $this->item->catid)); ?>"><?php echo $this->escape($this->item->title); ?></a></h1>
		<p class="streamheader-category"><?php echo JText::sprintf('CROSSINGHIPPOS_STREAM_CATEGORY', $category); ?></p>
	</header>
	<figure class="streamcontent">
		<a href="<?php echo JRoute::_(ContentHelperRoute::getArticleRoute($this->item->slug, $this->item->catid)); ?>"><img src="<?php echo htmlspecialchars($images->image_intro); ?>" alt="<?php echo htmlspecialchars($images->image_intro_alt); ?>" width="1" height="1"></a>
	</figure>
</article>