<?php
/**
 * @package     Joomla.Site
 * @subpackage  Templates.beez3
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

/**
 * beezDivision chrome.
 *
 * @since   3.0
 */
function modChrome_footer($module, &$params, &$attribs)
{
	$tag = $attribs['tag'];
	$class = $attribs['class'];
?><<?php echo $tag; ?> class="<?php echo $class; ?>">
<h1><?php echo $module->title; ?></h1>
<?php echo $module->content; ?>
</<?php echo $tag; ?>><?php
}
