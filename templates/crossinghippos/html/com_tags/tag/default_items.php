<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_tags
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

JHtml::addIncludePath(JPATH_COMPONENT.'/helpers');

JHtml::_('behavior.framework');
JHtml::_('formbehavior.chosen', 'select');

// Get the user object.
$user = JFactory::getUser();

// Check if user is allowed to add/edit based on tags permissions.
// Do we really have to make it so people can see unpublished tags???
$canEdit = $user->authorise('core.edit', 'com_tags');
$canCreate = $user->authorise('core.create', 'com_tags');
$canEditState = $user->authorise('core.edit.state', 'com_tags');
$items = $this->items;
$n = count($this->items);

		$tagsHelper = new JHelperTags();

?>


<?php if ($this->items == false || $n == 0) : ?>
	<p> <?php echo JText::_('COM_TAGS_NO_ITEMS'); ?></p>
<?php else : ?>

<form action="<?php echo htmlspecialchars(JUri::getInstance()->toString()); ?>" method="post" name="adminForm" id="adminForm" class="lt-prime lt-gutters">
	<?php if ($this->params->get('show_headings') || $this->params->get('filter_field') || $this->params->get('show_pagination_limit')) : ?>
	<fieldset class="filters btn-toolbar">
		<?php if ($this->params->get('filter_field')) :?>
			<div class="btn-group">
				<label class="filter-search-lbl element-invisible" for="filter-search">
					<?php echo JText::_('COM_TAGS_TITLE_FILTER_LABEL').'&#160;'; ?>
				</label>
				<input type="text" name="filter-search" id="filter-search" value="<?php echo $this->escape($this->state->get('list.filter')); ?>" class="inputbox" onchange="document.adminForm.submit();" title="<?php echo JText::_('COM_TAGS_FILTER_SEARCH_DESC'); ?>" placeholder="<?php echo JText::_('COM_TAGS_TITLE_FILTER_LABEL'); ?>" />
			</div>
		<?php endif; ?>
		<?php if ($this->params->get('show_pagination_limit')) : ?>
			<div class="btn-group pull-right">
				<label for="limit" class="element-invisible">
					<?php echo JText::_('JGLOBAL_DISPLAY_NUM'); ?>
				</label>
				<?php echo $this->pagination->getLimitBox(); ?>
			</div>
		<?php endif; ?>

		<input type="hidden" name="filter_order" value="" />
		<input type="hidden" name="filter_order_Dir" value="" />
		<input type="hidden" name="limitstart" value="" />
		<input type="hidden" name="task" value="" />
		<div class="clearfix"></div>
	</fieldset>
	<?php endif; ?>

	
</form>
<?php foreach ($items as $i => $item) : ?>
<article class="article">
<?php
$url = JRoute::_(TagsHelperRoute::getItemRoute($item->content_item_id, $item->core_alias, $item->core_catid, $item->core_language, $item->type_alias, $item->router));

// echo '<pre>';
// print_r($item);
// echo '</pre>';

// Prepare display data for article layout
$article = array();
$article['params'] = false;
$article['title'] = array(
	'tag' => 'h2',
	'url' => $url,
	'title' => $this->escape($item->core_title),
	'event' =>	array(
		'after' => $item->event->afterDisplayTitle
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
	'content' => $item->core_body,
	'event' => array(
		'before' => $item->event->beforeDisplayContent,
		'after' => $item->event->afterDisplayContent
		)
	);
$itemTags = $tagsHelper->getItemTags('com_content.article', $item->core_content_id);
?>

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
	<time class="article__date"><?php echo JHtml::_('date', $item->core_publish_up, JText::_('DATE_FORMAT_LC3')); ?></time>

	<?php echo $item->event->afterDisplayContent; ?>

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
	<?php echo $tagsLayout->render($itemTags); ?>
</div>
</article>
<?php endforeach; ?>


<?php endif; ?>
