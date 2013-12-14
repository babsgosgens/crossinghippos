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
<ul class="title-navigation__items lt-base" id="categories">
	<?php
	foreach ($list as $item) :
	if ($_SERVER['PHP_SELF'] == JRoute::_(ContentHelperRoute::getCategoryRoute($item->id))) {
		$activeCategory = $input->getInt('id');
	}
	$isActiveCategory = $activeCategory == $item->id;
	$categoryUrl = JRoute::_(ContentHelperRoute::getCategoryRoute($item->id));
	?>
	<?php if (!$isActiveCategory) : ?>
	<li>
		<a href="<?php echo $categoryUrl; ?>" class="title-navigation__item anchor--incognito">
		<?php echo $item->title; ?>
		</a>
	</li>
	<?php endif; ?>
<?php endforeach; ?>
</ul>
