<?php
/**
 * @package     tlp_crossinghippos
 * @subpackage  layouts
 * @author      Babs Gösgens <babs@crossinghippos.nl>
 * @copyright   Copyright (C) 2013 Transvision B.V., Netherlands
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('JPATH_BASE') or die;

$article = $displayData;
$images  = $displayData['images'];
?>
<?php if (isset($article['publish_up']) && $article['publish_up'] != '') : ?>
<time class="date link-list__date" datetime="<?php echo $article['publish_up']['meta']; ?>">
	<i class="fa fa-calendar-o"></i> <?php echo $article['publish_up']['render']; ?>
</time>
<?php endif; ?>

<h1 class="box__title link-list__title">
	<a href="<?php echo $article['url']; ?>" class="anchor--incognito"><?php echo $article['title']; ?></a>
</h1>

<?php if (isset($article['summary']) && $article['summary'] != '') : ?>
	<?php echo $article['summary']; ?>
<?php endif; ?>

<?php if (isset($article['category']) && $article['category'] != '') : ?>
<div class="link-list__meta">
	<span class="link-list__category"><i class="fa fa-folder-open"></i> Projects</span>
</div>
<?php endif; ?>

<?php if (isset($images->image_intro) && $images->image_intro != '') : ?>
<a href="<?php echo $article['url']; ?>" class="anchor--incognito">
<img src="<?php echo $images->image_intro; ?>" alt="<?php echo $images->image_intro_alt; ?>" class="media link-list__image">
</a>
<?php endif; ?>