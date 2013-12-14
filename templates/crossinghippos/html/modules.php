<?php
/**
 * @package     tpl_crossinghippos
 * @author      Babs Gösgens <babs@crossinghippos.nl>
 * @copyright   Copyright (C) 2013 Babs Gösgens
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die('Restricted access');

/**
 * This is a file to add template specific chrome to module rendering.  To use it you would
 * set the style attribute for the given module(s) include in your template to use the style
 * for each given modChrome function.
 *
 * eg.  To render a module mod_test in the sliders style, you would use the following include:
 * <jdoc:include type="module" name="test" style="slider" />
 *
 * This gives template designers ultimate control over how modules are rendered.
 *
 * NOTICE: All chrome wrapping methods should be named: modChrome_{STYLE} and take the same
 * three arguments.
 */


/**
 * Custom module chrome, echos the whole module in a <div> and the header in <h{x}>. The level of
 * the header can be configured through a 'vel' attribute of the <jdoc:include /> tag.
 * Defaults to <h3> if none given
 */
function modChrome_Raw($module, $params, $attribs)
{
	echo $module->content; 
}

function modChrome($module, $params, $attribs)
{
	modChrome_Default($module, $params, $attribs);
}

function modChrome_Cms($module, $params, $attribs)
{
	$moduleClass = $params->get('moduleclass_sfx', '');
	$moduleTag = $params->get('module_tag', 'div');
	$headerClass = $params->get('header_class', '');
	$headerTag = $params->get('header_tag', 'h3');
	?>
	<<?php echo $moduleTag ?><?php if((boolean)$moduleClass): ?> class="<?php echo $moduleClass; ?>"<?php endif; ?>>
		<?php if ($module->showtitle) : ?>
		<<?php echo $headerTag ?><?php if((boolean)$headerClass): ?> class="<?php echo $headerClass; ?>"<?php endif; ?>>
			<?php echo $module->title ?>
		</<?php echo preg_replace('/(\s\D+)/', '', $headerTag) ?>>
		<?php endif ?>
		<?php echo $module->content ?>
	</<?php echo preg_replace('/(\s\D+)\>/', '', $moduleTag) ?>>
	<?php
}

function modChrome_UiDd($module, $params, $attribs)
{
	// $moduleClass = preg_replace('/(\s+\D*)$/', '', $params->get('moduleclass_sfx', 'ui-dd'));
	// $params->set('header_class', $moduleClass.'__trigger');
	$params->set('header_tag', 'a href="#menu"');
	
	modChrome_Cms($module, $params, $attribs);

}

function modChrome_Id($module, $params, $attribs)
{
	if (isset($attribs['module_id'])) {
		$params->set('module_id', $attribs['module_id']);
	}
	// $params->set('header_tag', 'a href="#menu"');
	
	modChrome_Cms($module, $params, $attribs);

}