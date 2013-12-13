<?php
/**
 * @package     Joomla.Site
 * @subpackage  mod_articles_categories
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;
/**
 * Get request object
 *
 */
$app = JFactory::getApplication();
$input = $app->input;

$activeCategory = $input->getInt('catid');
?>
<span class="title-navigation__options hd">
	<?php
	foreach ($list as $item) :
	if ($_SERVER['PHP_SELF'] == JRoute::_(ContentHelperRoute::getCategoryRoute($item->id))) {
		$activeCategory = $input->getInt('id');
	}
	$isActiveCategory = $activeCategory == $item->id;
	$categoryUrl = JRoute::_(ContentHelperRoute::getCategoryRoute($item->id));
	?>
	<<?php echo $isActiveCategory ? 'h1' : 'span'; ?> class="title-navigation__item<?php if ($isActiveCategory) : ?> title-navigation__item--active<?php endif; ?>">
		<a href="<?php echo $categoryUrl; ?>" class="anchor--incognito">
		<i class="title-navigation__indicator<?php if ($isActiveCategory) : ?> fa fa-check<?php endif; ?>"></i>
		<?php echo $item->title; ?>
		<?php if ($isActiveCategory) : ?><i class="title-navigation__trigger fa fa-sort"></i><?php endif; ?>
		</a>
	</<?php echo $isActiveCategory ? 'h1' : 'span'; ?>>
<?php endforeach; ?>
</span>
