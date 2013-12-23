<?php
/**
 * @package     Joomla.Site
 * @subpackage  com_content
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

$lang	= JFactory::getLanguage();
if (count($this->items[$this->parent->id]) > 0 && $this->maxLevelcat != 0) :
$tagsHelper = new JHelperTags();
$app = JFactory::getApplication('site');
?>
	<?php foreach($this->items[$this->parent->id] as $id => $item) : ?>
	<?php
		$itemTags 	= $tagsHelper->getItemTags('com_content.category', $item->id);
		$itemImage 	= $item->getParams()->get('image');
		$itemTitle 	= $this->escape($item->title);
		$itemUrl 	= JRoute::_(ContentHelperRoute::getCategoryRoute($item->id));
		//echo '<pre>';
		//print_r($item);exit;
		//echo '</pre>';
	?>
	<div class="lt-column lt-gutters lt-vertical-padding  projects__item project">
		<div class="box box--projects">
			<h1 class="hd box__title">
				<a href="<?php echo $itemUrl; ?>" class="anchor--incognito">
				<div class="image-whitespace">
				<img src="<?php echo $itemImage; ?>" class="project__image media soft" alt="<?php echo JText::sprintf('TPL_CROSSINGHIPPOS_ALT_PROJECTIMAGE', $itemTitle); ?>">
				</div>
				<?php echo $this->escape($item->title); ?>
				</a>
			</h1>
			<?php $tagsLayout = new JLayoutFile('content.tags', JPATH_SITE . '/templates/crossinghippos/layouts/'); ?>
			<?php echo $tagsLayout->render($itemTags); ?>

		</div>
	</div>
	<?php endforeach; ?>
<?php endif; ?>