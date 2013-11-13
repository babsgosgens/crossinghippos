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
 * View class for a list of Jvsocial_publish.
 */
class Jvsocial_publishViewRequests extends JViewLegacy
{
	protected $items;
	protected $pagination;
	protected $state;

	/**
	 * Display the view
	 */
	public function display($tpl = null)
	{
		$this->state		= $this->get('State');
		$this->items		= $this->get('Items');
		$this->pagination	= $this->get('Pagination');

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
	 *
	 * @since	1.6
	 */
	protected function addToolbar()
	{
		$state	= $this->get('State');
		$canDo	= Jvsocial_publishHelper::getActions($state->get('filter.category_id'));
		JToolBarHelper::title(JText::_('COM_JVSOCIAL_PUBLISH_TITLE_REQUESTS'), 'requests.png');

        $Jvsocial_publishHelper = new Jvsocial_publishHelper();
        if(Jvsocial_publishHelper::getJoomlaVersion() == 'j2x'){
            $this->f_state = $Jvsocial_publishHelper->buildFilterProcess();
            $this->f_source = $Jvsocial_publishHelper->buildFilterSource();
            $this->f_channel = $Jvsocial_publishHelper->buildFilterChannel();
            $this->f_type = $Jvsocial_publishHelper->buildFilterType();
        }else{
            JHtmlSidebar::setAction('index.php?option=com_jvsocial_publish');
            JHtmlSidebar::addFilter(
                JText::_('COM_JVSOCIAL_PUBLISH_SELECT_PROCESS'),
                'filter_state',
                JHtml::_('select.options', $Jvsocial_publishHelper->buildFilterProcess(), 'value', 'text', $this->state->get('filter.state'), true)
            );
            JHtmlSidebar::addFilter(
                JText::_('COM_JVSOCIAL_PUBLISH_SELECT_SOURCE'),
                'filter_source',
                JHtml::_('select.options', $Jvsocial_publishHelper->buildFilterSource(), 'value', 'text', $this->state->get('filter.source'), true)
            );
            JHtmlSidebar::addFilter(
                JText::_('COM_JVSOCIAL_PUBLISH_SELECT_CHANNEL'),
                'filter_channel',
                JHtml::_('select.options', $Jvsocial_publishHelper->buildFilterChannel(), 'value', 'text', $this->state->get('filter.channel'), true)
            );
            JHtmlSidebar::addFilter(
                JText::_('COM_JVSOCIAL_PUBLISH_SELECT_TYPE'),
                'filter_type',
                JHtml::_('select.options', $Jvsocial_publishHelper->buildFilterType(), 'value', 'text', $this->state->get('filter.type'), true)
            );
        }

        if ($canDo->get('core.edit.state')) {
            JToolBarHelper::deleteList('', 'requests.delete','JTOOLBAR_DELETE');
        }

        if ($canDo->get('core.admin')) {
            JToolBarHelper::divider();
            JToolBarHelper::preferences('com_jvsocial_publish');
        }
    }
}
