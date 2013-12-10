<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_content
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

JHtml::addIncludePath(JPATH_COMPONENT . '/helpers');
JHtml::_('behavior.caption');

// Disallow access to disabled articles
if ($this->item->state == 0) {
	return false;
}

// Create shortcuts to some parameters.
$params 	= $this->item->params;
$images  	= json_decode($this->item->images);
$url 		= JRoute::_(ContentHelperRoute::getArticleRoute($this->item->slug, $this->item->catid));
$urls    	= json_decode($this->item->urls);
$canEdit 	= $params->get('access-edit');
$user    	= JFactory::getUser();
$info    	= $params->get('info_block_position', 0);

$useDefList = (
	$params->get('show_modify_date')	 || 
	$params->get('show_publish_date')	 || 
	$params->get('show_create_date')	 || 
	$params->get('show_hits')			 || 
	$params->get('show_category') 	  	 || 
	$params->get('show_parent_category') || 
	$params->get('show_author')
);

// echo '<pre>';
// print_r($this->item);
// echo '</pre>';

// Prepare display data for article layout
$article = array();
$article['params'] = &$params;
$article['title'] = array(
	'tag' => 'h1',
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
	'toc' => isset ($this->item->toc) ? $this->item->toc : '',
	'content' => $this->item->text,
	'event' => array(
		'before' => $this->item->event->beforeDisplayContent,
		'after' => $this->item->event->afterDisplayContent
		)
	);
?>

<article class="article<?php echo $this->pageclass_sfx?>">
	
	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * PRIMARY
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<div class="lt-prime lt-prime--alpha-beta lt-gutters">

		<?php $articleLayout = new JLayoutFile('content.article', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
		<?php echo $articleLayout->render($article); ?>

		<?php // Article date ?>
		<?php if ($params->get('show_publish_date')) : ?>
			<time class="article__date"><?php echo JHtml::_('date', $this->item->publish_up, JText::_('DATE_FORMAT_LC3')); ?></time>
		<?php endif; ?>

		<?php echo $this->item->event->afterDisplayContent; ?>


	<?php if (!empty($this->item->pagination) && $this->item->pagination && !$this->item->paginationposition && $this->item->paginationrelative)
	{
		echo $this->item->pagination;
	}
	?>

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

	
	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * TERTIARY
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<div class="lt-beta lt-gutters">
		<?php if (isset($this->item->project)): ?>
		<?php $project = $this->item->project; ?>
		<dl class="lt-column">

			<?php if (!empty($this->item->parent_slug)) : ?>
			<?php $catTitle = $this->escape($this->item->parent_title); ?>
			<?php $catUrl = JRoute::_(ContentHelperRoute::getCategoryRoute($this->item->parent_slug)); ?>
			<dt class="lt-base lt-column--third"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_PROJECT'); ?></dt>
			<dd class="lt-base lt-column--two-third"><a href="<?php echo $catUrl; ?>" class="anchor--incognito  hd"><?php echo $catTitle;?></a></dd>
			<?php endif; ?>

			<?php if (isset($project['projectclient']) && !empty($project['projectclient'])): ?>
			<dt class="lt-base lt-column--third"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_CLIENT'); ?></dt>
			<dd class="lt-base lt-column--two-third"><?php echo $project['projectclient']; ?></dd>
			<?php endif; ?>

			<?php if (isset($project['projectcontractor']) && !empty($project['projectcontractor'])): ?>
			<dt class="lt-base lt-column--third"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_CONTRACTOR'); ?></dt>
			<dd class="lt-base lt-column--two-third"><?php echo $project['projectcontractor']; ?></dd>
			<?php endif; ?>

			<?php if (isset($project['projectstart']) && !empty($project['projectstart'])): ?>
			<dt class="lt-base lt-column--third"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_PROJECTSTART'); ?></dt>
			<dd class="lt-base lt-column--two-third"><?php echo $project['projectstart']; ?></dd>
			<?php endif; ?>

			<?php if (isset($project['projectend']) && !empty($project['projectend'])): ?>
			<dt class="lt-base lt-column--third"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_PROJECTEND'); ?></dt>
			<dd class="lt-base lt-column--two-third"><?php echo $project['projectend']; ?></dd>
			<?php endif; ?>

			<?php if (isset($project['projecturl']) && !empty($project['projecturl'])): ?>
			<dt class="lt-base lt-column--third"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_WEBSITE'); ?></dt>
			<dd class="lt-base lt-column--two-third"><a href="<?php echo $project['projecturl']; ?>"><?php echo $project['projecturl']; ?></a></dd>
			<?php endif; ?>
		</dl>
	<?php endif; ?>
	</div>

</article>
