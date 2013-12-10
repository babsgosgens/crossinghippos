<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_content
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

JHtml::addIncludePath(JPATH_COMPONENT.'/helpers');


$dummyClass = array();


/*
 * The plugin is only triggered for child articles
 * Trigger the plugin manually to retrieve the project data
 */
JPluginHelper::importPlugin('content'); 
$dispatcher = JEventDispatcher::getInstance();
$project = $dispatcher->trigger( 'onContentPrepare', 'com_content.category', array(), array() );

if( isset($project[0]->project) ) {
	$project = $project[0]->project;
}
else {
	$project = array();
}
?>

<section class="section">
	
	<header>
		<?php if ($this->params->get('show_page_heading', 1)) : ?>
		<div class="page-header">
			<h1> <?php echo $this->escape($this->params->get('page_heading', 'Projects')); ?> </h1>
		</div>
		<?php endif; ?>
		<?php if ($this->params->get('show_category_title', 1) or $this->params->get('page_subheading')) : ?>
		<h1 class="hd hd-section lt-prime lt-gutters"> <?php echo $this->escape($this->params->get('page_subheading')); ?>
			<?php if ($this->params->get('show_category_title')) : ?>
			<span class="subheading-category"><?php echo $this->category->title;?></span>
			<?php endif; ?>
		</h1>
		<?php endif; ?>
	</header>


	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * PRIMARY
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<div class="lt-prime lt-prime--tags lt-prime--alpha-beta lt-gutters">
	<?php if ($this->params->get('show_description', 1) || $this->params->def('show_description_image', 1)) : ?>
	<div class="category-desc clearfix">
		<?php if ($this->params->get('show_description') && $this->category->description) : ?>
			<?php echo JHtml::_('content.prepare', $this->category->description, '', 'com_content.category'); ?>
		<?php endif; ?>
	</div>
	<?php endif; ?>
	</div>


	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * SECONDARY
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<div class="lt-alpha lt-gutters">
		<?php $tagsLayout = new JLayoutFile('content.tags', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
		<?php echo $tagsLayout->render($this->category->tags->itemTags); ?>
	</div>


	<?php
	/*
	 * ------------------------------------------------------------------------------------------------------------------
	 * TERTIARY
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<div class="lt-beta lt-gutters">
	<?php if ($this->params->get('show_description_image') && $this->category->getParams()->get('image')) : ?>
		<img src="<?php echo $this->category->getParams()->get('image'); ?>" class="media soft outline">
	<?php endif; ?>

	<?php if (!empty($project)): ?>
		<dl class="lt-column">
			<dt class="lt-base lt-column--third"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_PROJECT'); ?></dt>
			<dd class="lt-base lt-column--two-third"><?php echo $this->category->title;?></dd>

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

</section>


<?php
/*
 * ------------------------------------------------------------------------------------------------------------------
 * Articles
 * ------------------------------------------------------------------------------------------------------------------
 */
?>
<?php if (!empty($this->intro_items)) : ?>
<aside>
	<?php /* <h1><?php echo JText::sprintf('TPL_CROSSINGHIPPOS_CONTENT_CATEGORY_BLOGTITLE', $this->category->title); ?></h1> */ ?>
	<div class="lt-prime">
	<?php foreach ($this->intro_items as $key => &$item) : ?>
	<?php
		$this->item = &$item;
		echo $this->loadTemplate('box');
	?>
	<?php endforeach; ?>
	</div>
	<?php endif; ?>


	<?php if (!empty($this->link_items)) : ?>
	<div class="items-more">
	<?php echo $this->loadTemplate('links'); ?>
	</div>
	<?php endif; ?>

	<?php if (!empty($this->children[$this->category->id])&& $this->maxLevel != 0) : ?>
	<div class="cat-children">
	<?php if ($this->params->get('show_category_heading_title_text', 1) == 1) : ?>
		<h3> <?php echo JTEXT::_('JGLOBAL_SUBCATEGORIES'); ?> </h3>
	<?php endif; ?>
		<?php echo $this->loadTemplate('children'); ?> </div>
	<?php endif; ?>
	<?php if (($this->params->def('show_pagination', 1) == 1  || ($this->params->get('show_pagination') == 2)) && ($this->pagination->get('pages.total') > 1)) : ?>
	<div class="pagination">
		<?php  if ($this->params->def('show_pagination_results', 1)) : ?>
		<p class="counter pull-right"> <?php echo $this->pagination->getPagesCounter(); ?> </p>
		<?php endif; ?>
		<?php echo $this->pagination->getPagesLinks(); ?> </div>
</aside>
<?php  endif; ?>
