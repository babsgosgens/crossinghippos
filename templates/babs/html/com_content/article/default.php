<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_content
 *
 * @copyright   Copyright (C) 2013 Babs Gösgens. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

JHtml::addIncludePath(JPATH_COMPONENT . '/helpers');

// Create shortcuts to some parameters.
$params  = $this->item->params;
$images  = json_decode($this->item->images);
$urls    = json_decode($this->item->urls);
$canEdit = $params->get('access-edit');
$user    = JFactory::getUser();
$info    = $params->get('info_block_position', 0);
$author  = $this->item->created_by_alias ? $this->item->created_by_alias : $this->item->author;
?>
<article>
	<h1 class="article-title"><?php echo $this->escape($this->item->title); ?></h1>
	<aside class="article-metadata">
		<span class="icon-calendar"></span> <?php echo JText::sprintf('COM_CONTENT_PUBLISHED_DATE_ON', JHtml::_('date', $this->item->publish_up, JText::_('DATE_FORMAT_LC3'))); ?>
		<?php echo $this->item->tagLayout->render($this->item->tags->itemTags); ?>
	</aside
	><div class="article-text">
		<?php echo $this->item->text; ?>
	</div>
</article>