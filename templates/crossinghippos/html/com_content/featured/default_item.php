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


JPluginHelper::importPlugin('content'); 
$dispatcher = JEventDispatcher::getInstance();
$dispatcher->trigger( 'onContentPrepare', array('com_content.article', &$this->item, &$this->params) );

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
		'float' => 	empty($images->float_intro) ? $params->get('float_intro') : $images->float_intro,
		'figureClass' => 'lt-prime lt-gutters',
		'imageClass' => 'media soft'
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


<article class="article lt-root">

	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * PRIMARY
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<header class="lt-prime lt-prime--clear lt-gutters">
		<h1 class="hd hd--article">
			<a href="<?php echo $article['title']['url']; ?>"><?php echo $article['title']['title']; ?></a>
		</h1>

		<?php // Article date ?>
		<?php if ($params->get('show_publish_date')) : ?>
			<time class="date lt-vertical-padding lt-base"><i class="fa fa-calendar"></i>&nbsp;<?php echo JHtml::_('date', $this->item->publish_up, JText::_('DATE_FORMAT_LC3')); ?></time>
		<?php endif; ?>
	</header>

	<?php if (isset($images->image_intro) && !empty($images->image_intro)) : ?>
	<div>
		<?php $articleLayout = new JLayoutFile('content.image', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
		<?php echo $articleLayout->render($article['image']); ?>
	</div>
	<?php endif; ?>

	<div class="lt-prime lt-prime--alpha-beta lt-gutters">

		<?php echo $article['article']['event']['before']; ?>
		<?php echo $article['article']['content']; ?>
		<?php echo $article['article']['event']['after']; ?>

	</div>


	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * SECONDARY
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<aside class="lt-alpha lt-gutters">
		<?php if ($params->get('show_tags', 1) && !empty($this->item->tags)) : ?>
			<?php $tagsLayout = new JLayoutFile('content.tags.button', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
			<?php echo $tagsLayout->render($this->item->tags->itemTags); ?>
		<?php endif; ?>
	</aside>


	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * TERTIARY - PROJECT LOGO AND DATA
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<footer class="lt-beta lt-gutters">
		<?php if (isset($this->item->project) && !empty($this->item->project)): ?>
		<?php
		$title = $this->escape($this->item->category_title);
		$layoutData = array(
			'category' => '<a href="'.JRoute::_(ContentHelperRoute::getCategoryRoute($this->item->catslug)).'" class="hd anchor--incognito">'.$title.'</a>',
			'project'  => $this->item->project
			);
		?>
		<?php $projectDetails = new JLayoutFile('content.project', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
		<?php echo $projectDetails->render($layoutData); ?>
		<?php endif; ?>
	</footer>

</article>