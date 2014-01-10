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
JHtml::addIncludePath(JPATH_SITE.'/components/com_content/helpers');
require_once(JPATH_SITE.'/components/com_content/helpers/route.php');

// JHtml::_('behavior.framework');
// JHtml::_('formbehavior.chosen', 'select');

// echo '<pre>';
// var_dump($this->items);
// echo '</pre>';

// Get the user object.
$user = JFactory::getUser();

// Check if user is allowed to add/edit based on tags permissions.
// Do we really have to make it so people can see unpublished tags???
$canEdit = $user->authorise('core.edit', 'com_tags');
$canCreate = $user->authorise('core.create', 'com_tags');
$canEditState = $user->authorise('core.edit.state', 'com_tags');
$items = $this->items;
$n = count($this->items);

?>

<?php if ($this->items == false || $n == 0) : ?>
	<p class="leader lt-gutters"> <?php echo JText::_('COM_TAGS_NO_ITEMS'); ?></p>
<?php else : ?>

<?php if ($this->params->get('show_headings') || $this->params->get('filter_field') || $this->params->get('show_pagination_limit')) : ?>
<form action="<?php echo htmlspecialchars(JUri::getInstance()->toString()); ?>" method="post" name="adminForm" id="adminForm" class="lt-column lt-gutters leader">

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

</form>
<?php endif; ?>


<ol class="lt-column link-list leader">
	<?php foreach ($items as $i => $item) : ?>
	<?php
		// Format article details so the layout can work with it - Joomla uses different attribute names accross components.
		// Really Joomla - you can do better than that
		preg_match_all('/[0-9]+[:]\S[^?&]+/', $item->link, $slug);
		$slug = $slug ? $slug[0][0] : $slug ;
		$article = array(
			'title' => $this->escape($item->core_title),
			'publish_up' => array('meta' => JHtml::_('date', $item->core_publish_up, JText::_('DATE_FORMAT_LC2')), 'render' => JHtml::_('date', $item->core_publish_up, JText::_('DATE_FORMAT_LC3')) ),
			'images' => json_decode($item->core_images),
			'summary' => $item->text,
			'url' => $slug ? JRoute::_(ContentHelperRoute::getArticleRoute($slug, $item->core_catid)) : JRoute::_($item->link)
			);
	?>
	<li class="lt-column lt-column--fourth lt-gutters trailer">
		<article class="box box--primary soft outline link-list__item">
			<?php $layout = new JLayoutFile('content.article.box', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
			<?php echo $layout->render($article); ?>
		</article>
	</li>
	<?php endforeach; ?>
</ol>
<?php endif; ?>
