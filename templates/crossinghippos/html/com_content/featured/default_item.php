<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_content
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// Disallow access to disabled articles
if ($this->item->state == 0) {
	return false;
}

$params     = &$this->item->params;
$tags 		= &$this->item->tags;
$images     = json_decode($this->item->images);
$canEdit    = $params->get('access-edit');
$info       = $params->get('info_block_position', 0);
$url 		= JRoute::_(ContentHelperRoute::getArticleRoute($this->item->slug, $this->item->catid));
$urls    	= json_decode($this->item->urls);

$useDefList = (
	$params->get('show_modify_date') || 
	// $params->get('show_publish_date') || 
	$params->get('show_create_date') || 
	$params->get('show_hits') || 
	$params->get('show_category') || 
	$params->get('show_parent_category') || 
	$params->get('show_author') 
);

// Prepare display data for article layout
$article = array();
$article['params'] = &$params;
$article['title'] = array(
	'tag' => 'h2',
	'url' => $url,
	'title' => $this->escape($this->item->title),
	'event' =>	array(
		'after' => $this->item->event->afterDisplayTitle
		)
	);
if (isset($images->image_intro) && !empty($images->image_intro)) {
$article['image'] = array(
		'caption' => $images->image_intro_caption ? htmlspecialchars($images->image_intro_caption) : '',
		'src' => htmlspecialchars($images->image_intro),
		'alt' => $images->image_intro_alt ? htmlspecialchars($images->image_intro_alt) : '',
		'float' => 	empty($images->float_intro) ? $params->get('float_intro') : $images->float_intro
	);		
}
$article['article'] = array(
	'content' => $this->item->introtext,
	'event' => array(
		'before' => $this->item->event->beforeDisplayContent,
		'after' => $this->item->event->afterDisplayContent
		)
	);
?>


<article class="article">


	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * PRIMARY
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<div class="lt-prime lt-prime--alpha lt-gutters">

		<?php $articleLayout = new JLayoutFile('content.article', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
		<?php echo $articleLayout->render($article); ?>

		<?php // Article date ?>
		<?php if ($params->get('show_publish_date')) : ?>
			<time class="article__date"><?php echo JHtml::_('date', $this->item->publish_up, JText::_('DATE_FORMAT_LC3')); ?></time>
		<?php endif; ?>

		<?php echo $this->item->event->afterDisplayContent; ?>

	</div>


	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * SECONDARY
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<div class="lt-alpha lt-gutters">
		<?php if ($params->get('show_tags', 1) && !empty($this->item->tags)) : ?>
			<?php $tagsLayout = new JLayoutFile('content.tags', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
			<?php echo $tagsLayout->render($this->item->tags->itemTags); ?>
		<?php endif; ?>
	</div>


</article>


<?php if ($useDefList && ($info == 0 ||  $info == 2)) : ?>
	<dl class="article-info  muted">
		<dt class="article-info-term">
		<?php echo JText::_('COM_CONTENT_ARTICLE_INFO'); ?>
		</dt>

		<?php if ($params->get('show_author') && !empty($this->item->author )) : ?>
			<dd class="createdby">
				<?php $author = $this->item->author; ?>
				<?php $author = ($this->item->created_by_alias ? $this->item->created_by_alias : $author); ?>
				<?php if (!empty($this->item->contactid ) && $params->get('link_author') == true) : ?>
					<?php
					echo JText::sprintf('COM_CONTENT_WRITTEN_BY',
						JHtml::_('link', JRoute::_('index.php?option=com_contact&view=contact&id='.$this->item->contactid), $author)
					); ?>
				<?php else :?>
					<?php echo JText::sprintf('COM_CONTENT_WRITTEN_BY', $author); ?>
				<?php endif; ?>
			</dd>
		<?php endif; ?>

		<?php if ($params->get('show_parent_category') && !empty($this->item->parent_slug)) : ?>
			<dd class="parent-category-name">
				<?php $title = $this->escape($this->item->parent_title);
				$url = '<a href="'.JRoute::_(ContentHelperRoute::getCategoryRoute($this->item->parent_slug)).'">'.$title.'</a>';?>
				<?php if ($params->get('link_parent_category') && !empty($this->item->parent_slug)) : ?>
					<?php echo JText::sprintf('COM_CONTENT_PARENT', $url); ?>
				<?php else : ?>
					<?php echo JText::sprintf('COM_CONTENT_PARENT', $title); ?>
				<?php endif; ?>
			</dd>
		<?php endif; ?>

		<?php if ($params->get('show_category')) : ?>
			<dd class="category-name">
				<?php $title = $this->escape($this->item->category_title);
				$url = '<a href="'.JRoute::_(ContentHelperRoute::getCategoryRoute($this->item->catslug)).'">'.$title.'</a>';?>
				<?php if ($params->get('link_category') && $this->item->catslug) : ?>
					<?php echo JText::sprintf('COM_CONTENT_CATEGORY', $url); ?>
				<?php else : ?>
					<?php echo JText::sprintf('COM_CONTENT_CATEGORY', $title); ?>
				<?php endif; ?>
			</dd>
		<?php endif; ?>

		<?php if ($params->get('show_publish_date')) : ?>
			<dd class="published">
				<span class="icon-calendar"></span> <?php echo JText::sprintf('COM_CONTENT_PUBLISHED_DATE_ON', JHtml::_('date', $this->item->publish_up, JText::_('DATE_FORMAT_LC3'))); ?>
			</dd>
		<?php endif; ?>

		<?php if ($info == 0) : ?>
			<?php if ($params->get('show_modify_date')) : ?>
				<dd class="modified">
				<span class="icon-calendar"></span>
				<?php echo JText::sprintf('COM_CONTENT_LAST_UPDATED', JHtml::_('date', $this->item->modified, JText::_('DATE_FORMAT_LC3'))); ?>
				</dd>
			<?php endif; ?>

			<?php if ($params->get('show_create_date')) : ?>
				<dd class="create">
					<span class="icon-calendar"></span>
					<?php echo JText::sprintf('COM_CONTENT_CREATED_DATE_ON', JHtml::_('date', $this->item->created, JText::_('DATE_FORMAT_LC3'))); ?>
				</dd>
			<?php endif; ?>

			<?php if ($params->get('show_hits')) : ?>
				<dd class="hits">
					<span class="icon-eye-open"></span>
					<?php echo JText::sprintf('COM_CONTENT_ARTICLE_HITS', $this->item->hits); ?>
				</dd>
			<?php endif; ?>

		<?php endif; ?>
	</dl>
<?php endif; ?>