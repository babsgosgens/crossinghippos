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
		'figureClass' => 'blog__image',
		'imageClass' => 'media blog-article--item__image',
		'url' => $article['title']['url']
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


<article class="blog-article lt-root">

	<hr class="lt-gutters-margin leader--double">

	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * FIRST (IMAGE)
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<div class="lt-column blog-article__column-one lt-gutters blog-article__first">


		<?php if (isset($images->image_intro) && !empty($images->image_intro)) : ?>
			<?php $articleLayout = new JLayoutFile('content.image', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
			<?php echo $articleLayout->render($article['image']); ?>
		<?php endif; ?>

		<footer>
		<div class="blog-article__metadata">
			<div class="box--filled lt-gutters">
			<?php // Article date ?>
			<?php if ($params->get('show_publish_date')) : ?>
				<time class="date lt-vertical-padding lt-base"><i class="fa fa-calendar"></i>&nbsp;<?php echo JHtml::_('date', $this->item->publish_up, JText::_('DATE_FORMAT_LC3')); ?></time>
			<?php endif; ?>
			<?php //var_dump($this->item->tags->itemTags[]); ?>
			<?php if ($params->get('show_tags', 1) && !empty($this->item->tags)) : ?>
				<?php $tagsLayout = new JLayoutFile('content.tags.inline', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
				<?php echo $tagsLayout->render($this->item->tags->itemTags); ?>
			<?php endif; ?>
			</div>
		</div>

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
		</footer>
		<?php endif; ?>

	</div>


	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * MIDDLE (TEXT)
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<div class="lt-column blog-article__column-two lt-gutters blog__intro">

		<h1 class="hd hd--article">
			<a href="<?php echo $article['title']['url']; ?>" class="anchor--incognito"><?php echo $article['title']['title']; ?></a>
		</h1>

		<?php echo $article['article']['event']['before']; ?>
		<?php echo $article['article']['content']; ?>
		<?php echo $article['article']['event']['after']; ?>

		<?php if ($params->get('show_readmore') && $this->item->readmore) :
			if ($params->get('access-view')) :
				$link = JRoute::_(ContentHelperRoute::getArticleRoute($this->item->slug, $this->item->catid));
			else :
				$menu = JFactory::getApplication()->getMenu();
				$active = $menu->getActive();
				$itemId = $active->id;
				$link1 = JRoute::_('index.php?option=com_users&view=login&Itemid=' . $itemId);
				$returnURL = JRoute::_(ContentHelperRoute::getArticleRoute($this->item->slug, $this->item->catid));
				$link = new JUri($link1);
				$link->setVar('return', base64_encode($returnURL));
			endif; ?>

			<p class="leader"><a href="<?php echo $link; ?>"> <span class="icon-chevron-right"></span>

			<?php if (!$params->get('access-view')) :
				echo JText::_('COM_CONTENT_REGISTER_TO_READ_MORE');
			elseif ($readmore = $this->item->alternative_readmore) :
				echo $readmore;
				if ($params->get('show_readmore_title', 0) != 0) :
				echo JHtml::_('string.truncate', ($this->item->title), $params->get('readmore_limit'));
				endif;
			elseif ($params->get('show_readmore_title', 0) == 0) :
				echo JText::sprintf('TPL_CROSSINGHIPPOS_READ_MORE');
			else :
				echo JText::_('TPL_CROSSINGHIPPOS_READ_MORE');
				echo JHtml::_('string.truncate', ($this->item->title), $params->get('readmore_limit'));
			endif; ?>

			</a></p>

		<?php endif; ?>

	</div>


	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * LAST (METADATA)
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<!--footer class="lt-column lt-column--fourth lt-gutters">

	<div class="box--filled">
		<?php // Article date ?>
		<?php if ($params->get('show_publish_date')) : ?>
			<time class="date lt-vertical-padding lt-base"><i class="fa fa-calendar"></i>&nbsp;<?php echo JHtml::_('date', $this->item->publish_up, JText::_('DATE_FORMAT_LC3')); ?></time>
			<br><time class="date lt-vertical-padding lt-base"><i class="fa fa-calendar"></i>&nbsp;<?php echo JHtml::_('date', $this->item->publish_up, JText::_('DATE_FORMAT_LC3')); ?></time>
			<br><time class="date lt-vertical-padding lt-base"><i class="fa fa-calendar"></i>&nbsp;<?php echo JHtml::_('date', $this->item->publish_up, JText::_('DATE_FORMAT_LC3')); ?></time>
		<?php endif; ?>
		<?php if ($params->get('show_tags', 1) && !empty($this->item->tags)) : ?>
			<?php $tagsLayout = new JLayoutFile('content.tags.button', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
			<?php echo $tagsLayout->render($this->item->tags->itemTags); ?>
		<?php endif; ?>
		</div>
	</footer-->

</article>