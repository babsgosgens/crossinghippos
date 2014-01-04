<?php
/**
 * @version     1.0
 * @package     CrossingHippos.Plugin
 * @subpackage  Content.disqus
 * @author      Babs Gösgens <babs@crossinghippos.nl>
 * @copyright   Copyright (C) 2013 Babs Gösgens, Netherlands
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

/**
 * Editor Article buton
 *
 * @package     CrossingHippos.Plugin
 * @subpackage  Editors-xtd.disqus
 * @since       1.5
 */
class PlgButtonDisqus extends JPlugin
{
	/**
	 * Load the language file on instantiation.
	 *
	 * @var    boolean
	 * @since  3.1
	 */
	protected $autoloadLanguage = true;

	/**
	 * Display the button
	 *
	 * @param   string  $name  The name of the button to add
	 *
	 * @return  object $button
	 */
	public function onDisplay($name)
	{
		$doc = JFactory::getDocument();

		// Button is not active in specific content components

		$containerClass = $this->params->get('container_class', '');

		$getContent = $this->_subject->getContent($name);
		$present = JText::_('PLG_READMORE_ALREADY_EXISTS', true);

		// Build the disqus container html
		if ($containerClass != '') {
			$html = '<div id="disqus_thread" class="'. $containerClass.'"></div>';
		}
		else {
			$html = '<div id="disqus_thread"></div>';
		}
		
		$js = "
			function insertDisqus(editor)
			{
				var content = $getContent
				jInsertEditorText('$html', editor);
			}
			";

		$doc->addScriptDeclaration($js);

		$button = new JObject;
		$button->modal = false;
		$button->class = 'btn';
		$button->onclick = 'insertDisqus(\'' . $name . '\');return false;';
		$button->text = JText::_('PLG_EDITORS-XTD_DISQUS_BUTTON_DISQUS');
		$button->name = 'comments';

		// @TODO: The button writer needs to take into account the javascript directive
		// $button->link', 'javascript:void(0)');
		$button->link = '#';

		return $button;
	}
}
