<?php
/**
 * @package     tlp_crossinghippos
 * @subpackage  layouts
 * @author      Babs Gösgens <babs@crossinghippos.nl>
 * @copyright   Copyright (C) 2013 Transvision B.V., Netherlands
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('JPATH_BASE') or die;

$params	 = &$displayData['params'];
$article = $displayData['article'];
$title 	 = $displayData['title'];
$image 	 = isset($displayData['image']) ? $displayData['image'] : false;
?>
<?php if (!empty($displayData)) : ?>


<?php // Article title ?>

<<?php echo $title['tag']; ?> class="hd hd-article">
	<a href="<?php echo $title['url']; ?>" class="anchor--incognito"> <?php echo $title['title']; ?></a>
</<?php echo $title['tag']; ?>>


<?php // Article image ?>
<?php if ($image) : ?>
	<?php if ($image['caption']!=''): ?>
	<figure>
		<figcaption><?php echo $image['caption']; ?></figcaption>
		<img src="<?php echo $image['src']; ?>" alt="<?php echo $image['alt']; ?>">
	</figure>
	<?php else: ?>
		<img src="<?php echo $image['src']; ?>" alt="<?php echo $image['alt']; ?>">
	<?php endif; ?>
<?php endif; ?>


<?php echo $title['event']['after']; ?>

<?php echo $article['event']['before']; ?>
<?php echo $article['content']; ?>

<?php endif; ?>
