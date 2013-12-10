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
?>

<section class="section">
	
	<header>
		<?php if ($this->params->get('show_page_heading', 1)) : ?>
		<div class="page-header lt-gutters">
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
		<?php if ($this->params->get('show_description_image') && $this->category->getParams()->get('image')) : ?>
			<img src="<?php echo $this->category->getParams()->get('image'); ?>"/>
		<?php endif; ?>
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
	 * BETA
	 * ------------------------------------------------------------------------------------------------------------------
	 */
	?>
	<div class="lt-beta">
	<?php if (isset($this->category->project)): ?>
		<dl class="lt-column">
			<dt class="lt-base lt-column--third lt-gutters"><?php echo JText::_('Project'); ?></dt>
			<dd class="lt-base lt-column--two-third lt-gutters"><?php echo $this->category->title;?></dd>
			<?php if (isset($this->category->project->projectclient)): ?>
			<dt class="lt-base lt-column--third lt-gutters"><?php echo JText::_('Client'); ?></dt>
			<dd class="lt-base lt-column--two-third lt-gutters"><?php echo $this->category->project->projectclient; ?></dd>
			<?php endif; ?>
			<?php if (isset($this->category->project->projectcontractor)): ?>
			<dt class="lt-base lt-column--third lt-gutters">Contractor</dt>
			<dd class="lt-base lt-column--two-third lt-gutters"><?php echo $this->category->project->projectcontractor; ?></dd>
			<?php endif; ?>
			<?php if (isset($this->category->project->projectstart)): ?>
			<dt class="lt-base lt-column--third lt-gutters">Date</dt>
			<dd class="lt-base lt-column--two-third lt-gutters">J<?php echo $this->category->project->projectstart; ?></dd>
			<?php endif; ?>
			<?php if (isset($this->category->project->projectend)): ?>
			<dt class="lt-base lt-column--third lt-gutters">Delivery</dt>
			<dd class="lt-base lt-column--two-third lt-gutters"><?php echo $this->category->project->projectend; ?></dd>
			<?php endif; ?>
			<?php if (isset($this->category->project->projecturl)): ?>
			<dt class="lt-base lt-column--third lt-gutters">Url</dt>
			<dd class="lt-base lt-column--two-third lt-gutters"><a href="<?php echo $this->category->project->projecturl; ?>"><?php echo $this->category->project->projecturl; ?></a></dd>
			<?php endif; ?>
		</dl>
	<?php endif; ?>
	</div>

</section>

<section class="section<?php echo $this->pageclass_sfx;?>">

	<h1><?php echo JText::sprintf('TPL_CROSSINGHIPPOS_CONTENT_CATEGORY_BLOGTITLE'); ?></h1>
	<?php if (empty($this->lead_items) && empty($this->link_items) && empty($this->intro_items)) : ?>
		<?php if ($this->params->get('show_no_articles', 1)) : ?>
			<p><?php echo JText::_('COM_CONTENT_NO_ARTICLES'); ?></p>
		<?php endif; ?>
	<?php endif; ?>

	<?php $leadingcount = 0; ?>
	<?php if (!empty($this->lead_items)) : ?>
	<div class="items-leading clearfix">
		<?php foreach ($this->lead_items as &$item) : ?>
		<div class="leading-<?php echo $leadingcount; ?><?php echo $item->state == 0 ? ' system-unpublished' : null; ?>">
			<?php
				$this->item = &$item;
				echo $this->loadTemplate('item');
			?>
		</div>
		<?php $leadingcount++; ?>
		<?php endforeach; ?>
	</div><!-- end items-leading -->
	<?php endif; ?>

	<?php
	$introcount = (count($this->intro_items));
	$counter = 0;
	?>

	<?php if (!empty($this->intro_items)) : ?>
	<?php foreach ($this->intro_items as $key => &$item) : ?>
		<?php $rowcount = ((int) $key % (int) $this->columns) + 1; ?>
		<?php if ($rowcount == 1) : ?>
			<?php $row = $counter / $this->columns; ?>
		<div class="items-row cols-<?php echo (int) $this->columns;?> <?php echo 'row-'.$row; ?> row-fluid clearfix">
		<?php endif; ?>
			<div class="span<?php echo round((12 / $this->columns));?>">
				<div class="item column-<?php echo $rowcount;?><?php echo $item->state == 0 ? ' system-unpublished' : null; ?>">
					<?php
					$this->item = &$item;
					echo $this->loadTemplate('item');
				?>
				</div><!-- end item -->
				<?php $counter++; ?>
			</div><!-- end span -->
			<?php if (($rowcount == $this->columns) or ($counter == $introcount)) : ?>
		</div><!-- end row -->
			<?php endif; ?>
	<?php endforeach; ?>
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
	<?php  endif; ?>
</section>
