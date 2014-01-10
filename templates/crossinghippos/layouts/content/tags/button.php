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
	<ul class="tags lt-bleed">
		<?php $tagsTotal = count($displayData); ?>
		<?php $i=0; foreach ($displayData as $i => $tag) : ?>
			<?php
			// Tags have id attr in com_tags and tag_id in com_content ?!? What's up with that ?!?
			$id = isset($tag->tag_id) ? isset($tag->tag_id) : $tag->id ;
			?>
			<?php if (in_array($tag->access, JAccess::getAuthorisedViewLevels(JFactory::getUser()->get('id')))) : ?>
				<?php $link_class = 'btn-base box--filled soft outline tags__anchor anchor anchor--incognito'; ?>
					<li class="lt-base lt-gutters trailer">
						<a href="<?php echo JRoute::_(TagsHelperRoute::getTagRoute($tag->tag_id . '-' . $tag->alias)) ?>" class="<?php echo $link_class; ?>" style="padding-right: .5em; padding-left: .5em;">
						<i class="fa fa-tag"></i>&nbsp;<?php echo $this->escape($tag->title); ?><?php if(($i+1) < $tagsTotal): ?><?php endif; ?></a>
					</li>

			<?php endif; ?>
		<?php $i++; endforeach; ?>
	</ul>
<?php endif; ?>
