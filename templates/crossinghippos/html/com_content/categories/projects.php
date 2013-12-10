<?php
/**
 * @package     plg_project
 * @author      Babs Gösgens <babs@crossinghippos.nl>
 * @copyright   Copyright (C) 2013 Babs Gösgens, Netherlands
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

JHtml::addIncludePath(JPATH_COMPONENT . '/helpers');
//  echo JLayoutHelper::render('joomla.content.categories_default', $this);
?>
<section class="lt-prime projects">
	<?php echo $this->loadTemplate('items'); ?>
</section>
