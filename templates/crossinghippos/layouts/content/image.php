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

	<?php if ($displayData['caption']!=''): ?>
	<figure<?php if ( isset($displayData['figureClass']) && $displayData['figureClass'] !='') : ?> class="<?php echo $displayData['figureClass']; ?>"<?php endif; ?>>
		<figcaption><?php echo $displayData['caption']; ?></figcaption>
		<img src="<?php echo $displayData['src']; ?>" alt="<?php echo $displayData['alt']; ?>"<?php if ( isset($displayData['imageClass']) && $displayData['imageClass'] !='') : ?> class="<?php echo $displayData['imageClass']; ?>"<?php endif; ?>>
	</figure>
	<?php else: ?>
		<img src="<?php echo $displayData['src']; ?>" alt="<?php echo $displayData['alt']; ?>"<?php if ( isset($displayData['imageClass']) && $displayData['imageClass'] !='') : ?> class="<?php echo $displayData['imageClass']; ?>"<?php endif; ?>>
	<?php endif; ?>

<?php endif; ?>
