<?php
/**
 * @package     Joomla.Plugin
 * @subpackage  Editors-xtd.article
 *
 * @copyright   Copyright (C) 2005 - 2013 Open Source Matters, Inc. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

/**
 * Editor Article buton
 *
 * @package     Joomla.Plugin
 * @subpackage  Editors-xtd.article
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
	 * @return array A four element array of (article_id, article_title, category_id, object)
	 */
	public function onDisplay($name)
	{
		$doc = JFactory::getDocument();

		// Button is not active in specific content components

		$getContent = $this->_subject->getContent($name);
		$present = JText::_('PLG_READMORE_ALREADY_EXISTS', true);
		$js = "
			function insertDisqus(editor)
			{
				var content = $getContent
				jInsertEditorText('{disqus url=\"index.php?option=com_content&amp;view=article&amp;id=2&amp;\"}', editor);
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
