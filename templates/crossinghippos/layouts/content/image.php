<?php
/**
 * @package     tlp_crossinghippos
 * @subpackage  layouts
 * @author      Babs Gösgens <babs@crossinghippos.nl>
 * @copyright   Copyright (C) 2013 Transvision B.V., Netherlands
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('JPATH_BASE') or die;

/*
 $displayData should look like:
	$displayData['image'] = array(
		'caption' => $images->image_intro_caption ? htmlspecialchars($images->image_intro_caption) : '',
		'src' => htmlspecialchars($images->image_intro),
		'alt' => $images->image_intro_alt ? htmlspecialchars($images->image_intro_alt) : '',
		'float' => 	empty($images->float_intro) ? $params->get('float_intro') : $images->float_intro
	);		
 }
*/
$g
?>
<?php if (!empty($displayData)) : ?>

	<?php if ($displayData['caption']!='' || $displayData['figureClass']!=''): ?>
	<figure<?php if ( isset($displayData['figureClass']) && $displayData['figureClass'] !='') : ?> class="<?php echo $displayData['figureClass']; ?> pretty-wrap"<?php endif; ?>>
		<?php if ($displayData['caption']!='') : ?><figcaption><?php echo $displayData['caption']; ?></figcaption><?php endif; ?>
		<?php if ( isset($displayData['url']) && $displayData!='') : ?>
		<a href="<?php echo $displayData['url']; ?>"><img src="<?php echo $displayData['src']; ?>" alt="<?php echo $displayData['alt']; ?>"<?php if ( isset($displayData['imageClass']) && $displayData['imageClass'] !='') : ?> class="<?php echo $displayData['imageClass']; ?>"<?php endif; ?>></a>
		<?php else: ?>
		<img src="<?php echo $displayData['src']; ?>" alt="<?php echo $displayData['alt']; ?>"<?php if ( isset($displayData['imageClass']) && $displayData['imageClass'] !='') : ?> class="<?php echo $displayData['imageClass']; ?>"<?php endif; ?>>
		<?php endif; ?>
		<div class="pretty">&nbsp;</div>
	</figure>
	<?php else: ?>
		<?php if ( isset($displayData['url']) && $displayData!='') : ?>
		<a href="<?php echo $displayData['url']; ?>"><img src="<?php echo $displayData['src']; ?>" alt="<?php echo $displayData['alt']; ?>"<?php if ( isset($displayData['imageClass']) && $displayData['imageClass'] !='') : ?> class="<?php echo $displayData['imageClass']; ?>"<?php endif; ?>></a>
		<?php else: ?>
		<img src="<?php echo $displayData['src']; ?>" alt="<?php echo $displayData['alt']; ?>"<?php if ( isset($displayData['imageClass']) && $displayData['imageClass'] !='') : ?> class="<?php echo $displayData['imageClass']; ?>"<?php endif; ?>>
		<?php endif; ?>
	<?php endif; ?>

<?php endif; ?>
