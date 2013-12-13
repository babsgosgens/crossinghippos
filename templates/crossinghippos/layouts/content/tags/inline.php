<?php
/**
 * @package     tlp_crossinghippos
 * @subpackage  layouts
 * @author      Babs Gösgens <babs@crossinghippos.nl>
 * @copyright   Copyright (C) 2013 Transvision B.V., Netherlands
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('JPATH_BASE') or die;

JLoader::register('TagsHelperRoute', JPATH_BASE . '/components/com_tags/helpers/route.php');
?>

<?php if (!empty($displayData)) : ?>
	<p class="tags list-inline">
		<?php $tagsTotal = count($displayData); ?>
		<?php $i=0; foreach ($displayData as $i => $tag) : ?>
			<?php if (in_array($tag->access, JAccess::getAuthorisedViewLevels(JFactory::getUser()->get('id')))) : ?>
				<?php $link_class = 'tags__anchor anchor anchor--incognito'; ?>
					<?php if($i==0): ?><a href="" class="fa fa-tags"></a>&nbsp;&nbsp;<?php endif; ?>
					<a href="<?php echo JRoute::_(TagsHelperRoute::getTagRoute($tag->tag_id . '-' . $tag->alias)) ?>" class="<?php echo $link_class; ?>">
						<?php echo $this->escape($tag->title); ?><?php if(($i+1) < $tagsTotal): ?>, <?php endif; ?>
					</a>

			<?php endif; ?>
		<?php $i++; endforeach; ?>
	</p>
<?php endif; ?>
