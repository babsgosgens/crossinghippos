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
$description = $this->params->get('all_tags_description');
$descriptionImage = $this->params->get('all_tags_description_image');

echo '<pre>';
print_r($this->params);
echo '</pre>';
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

<div class="tag-category<?php echo $this->pageclass_sfx; ?>">
	<?php if ($this->params->get('all_tags_show_description_image') && !empty($descriptionImage)):?>
		<div><?php echo '<img src="' . $descriptionImage . '">';?></div>
	<?php endif;?>
	<?php if (!empty($description)):?>
		<div><?php echo $description;?></div>
	<?php endif;?>

	<?php echo $this->loadTemplate('items'); ?>

</div>