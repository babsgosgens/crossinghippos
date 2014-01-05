<?php
/**
 * @package     tlp_crossinghippos
 * @subpackage  layouts
 * @author      Babs Gösgens <babs@crossinghippos.nl>
 * @copyright   Copyright (C) 2013 Transvision B.V., Netherlands
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('JPATH_BASE') or die;
$category   = $displayData['category'];
$project = $displayData['project'];
$image   = isset($displayData['image']) ? $displayData['image'] : '';
?>

			<dl class="lt-column lt-gutter-right  project__data">

				<dt class="lt-base lt-column--third-persistent  underline--dashed" style="vertical-align: bottom;"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_PROJECT'); ?></dt>
				<dd class="lt-base lt-column--two-third-persistent  underline--dashed">
					<?php if ($image != '') : ?>
					<div class="project__logo lt-column lt-column--two-third-persistent trailer--half">
						<img src="<?php echo $image; ?>" class="media">
					</div>
					<?php endif; ?>
					<div><?php echo $category;?></div>
				</dd>

				<?php if (isset($project['projectclient']) && !empty($project['projectclient'])): ?>
				<dt class="lt-base lt-column--third-persistent  underline--dashed"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_CLIENT'); ?></dt>
				<dd class="lt-base lt-column--two-third-persistent  underline--dashed"><?php echo $project['projectclient']; ?></dd>
				<?php endif; ?>

				<?php if (isset($project['projectcontractor']) && !empty($project['projectcontractor'])): ?>
				<dt class="lt-base lt-column--third-persistent  underline--dashed"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_CONTRACTOR'); ?></dt>
				<dd class="lt-base lt-column--two-third-persistent  underline--dashed"><?php echo $project['projectcontractor']; ?></dd>
				<?php endif; ?>

				<?php if (isset($project['projectstart']) && !empty($project['projectstart'])): ?>
				<dt class="lt-base lt-column--third-persistent  underline--dashed"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_PROJECTSTART'); ?></dt>
				<dd class="lt-base lt-column--two-third-persistent  underline--dashed"><?php echo $project['projectstart']; ?></dd>
				<?php endif; ?>

				<?php if (isset($project['projectend']) && !empty($project['projectend'])): ?>
				<dt class="lt-base lt-column--third-persistent  underline--dashed"><?php echo JText::_('TPL_CROSSINGHIPPOS_LABEL_PROJECTEND'); ?></dt>
				<dd class="lt-base lt-column--two-third-persistent  underline--dashed"><?php echo $project['projectend']; ?></dd>
				<?php endif; ?>

				<?php if (isset($project['projecturl']) && !empty($project['projecturl'])): ?>
				<dd class="lt-base lt-column  underline--dashed"><a href="<?php echo $project['projecturl']; ?>"><?php echo $project['projecturl']; ?></a></dd>
				<?php endif; ?>
			</dl>
