<?php
/**
 * @version     1.0.0
 * @package     com_jvsocial_publish
 * @copyright   Copyright (C) 2013. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      joomlavi <info@joomlavi.com> - http://www.joomlavi.com
 */

// No direct access
defined('_JEXEC') or die;

jimport('joomla.application.component.view');

/**
 * View to edit
 */
class Jvsocial_publishViewGuide extends JViewLegacy
{
	/**
	 * Display the view
	 */
	public function display($tpl = null)
	{
		// Check for errors.
		if (count($errors = $this->get('Errors'))) {
            throw new Exception(implode("\n", $errors));
		}

        $input = JFactory::getApplication()->input;
        $view = $input->getCmd('view', '');
        Jvsocial_publishHelper::addAsset();
        Jvsocial_publishHelper::addSubmenu($view);
        $this->addToolbar();
        if(Jvsocial_publishHelper::getJoomlaVersion() == 'j3x'){
            $this->sidebar = JHtmlSidebar::render();
        }

        parent::display($tpl);
	}

	/**
	 * Add the page title and toolbar.
	 */
	protected function addToolbar()
	{
		JToolBarHelper::title(JText::_('COM_JVSOCIAL_PUBLISH_TITLE_GUIDE'), 'guide.png');
        JToolBarHelper::preferences('com_jvsocial_publish');
	}
}
