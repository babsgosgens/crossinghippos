<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_tags
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
// Note that there are certain parts of this layout used only when there is exactly one tag.

JHtml::addIncludePath(JPATH_COMPONENT.'/helpers');

$isSingleTag = (count($this->item) == 1);
?>



<?php  if ($this->params->get('show_page_heading')) : ?>
<header class="underline--dashed">
	<div class="lt-root">
		<div class="w-title-navigation lt-gutters hd--page">
			<h1 class="hd"><a href="<?php echo JRoute::_('index.php?Itemid='.$itemid); ?>" title="<?php echo JText::sprintf('TPL_CROSSINGHIPPOS_ANCHOR_TITLE_PARENTCATEGORY', $this->params->get('page_title')); ?>" class="btn-base anchor--incognito"><?php echo $this->params->get('page_title'); ?></a></h1>
		</div>
	</div>
</header>
<?php endif; ?>





<?php // We only show a tag description if there is a single tag. ?>
<?php  if (count($this->item) == 1 && (($this->params->get('tag_list_show_tag_image', 1)) || $this->params->get('tag_list_show_tag_description', 1))) : ?>
	<div class="category-desc">
	<?php $images = json_decode($this->item[0]->images); ?>
	<?php if ($this->params->get('tag_list_show_tag_image', 1) == 1 && !empty($images->image_fulltext)) : ?>
		<img src="<?php echo htmlspecialchars($images->image_fulltext);?>">
	<?php endif; ?>
	<?php if ($this->params->get('tag_list_show_tag_description') == 1 && $this->item[0]->description) : ?>
		<?php echo JHtml::_('content.prepare', $this->item[0]->description, '', 'com_tags.tag'); ?>
	<?php endif; ?>
	<div class="clr"></div>
	</div>
<?php endif; ?>


<?php // If there are multiple tags and a description or image has been supplied use that. ?>
<?php if ($this->params->get('tag_list_show_tag_description', 1) || $this->params->get('show_description_image', 1)): ?>
		<?php if ($this->params->get('show_description_image', 1) == 1 && $this->params->get('tag_list_image')) :?>
			<img src="<?php echo $this->params->get('tag_list_image');?>">
		<?php endif; ?>
		<?php if ($this->params->get('tag_list_description', '') > '') :?>
			<?php echo JHtml::_('content.prepare', $this->params->get('tag_list_description'), '', 'com_tags.tag'); ?>
		<?php endif; ?>

<?php endif; ?>

<?php echo $this->loadTemplate('items'); ?>
	<?php if (($this->params->def('show_pagination', 1) == 1  || ($this->params->get('show_pagination') == 2)) && ($this->pagination->get('pages.total') > 1)) : ?>
	<div class="pagination">
		<?php  if ($this->params->def('show_pagination_results', 1)) : ?>
		<p class="counter pull-right"> <?php echo $this->pagination->getPagesCounter(); ?> </p>
		<?php endif; ?>
		<?php echo $this->pagination->getPagesLinks(); ?>
	</div>
	<?php  endif; ?>

</div>
