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
class Jvsocial_publishViewChannels extends JViewLegacy
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
		JToolBarHelper::title(JText::_('COM_JVSOCIAL_PUBLISH_TITLE_CHANNELS'), 'channels.png');

        $Jvsocial_publishHelper = new Jvsocial_publishHelper();
        if(Jvsocial_publishHelper::getJoomlaVersion() == 'j2x'){
            $this->f_state = $Jvsocial_publishHelper->buildFilterState();
            $this->f_source = $Jvsocial_publishHelper->buildFilterSource();
            $this->f_type = $Jvsocial_publishHelper->buildFilterType();
            $this->f_post = $Jvsocial_publishHelper->buildFilterPost();
        }else{
            JHtmlSidebar::setAction('index.php?option=com_jvsocial_publish');
            JHtmlSidebar::addFilter(
                JText::_('JOPTION_SELECT_PUBLISHED'),
                'filter_state',
                JHtml::_('select.options', $Jvsocial_publishHelper->buildFilterState(), 'value', 'text', $this->state->get('filter.state'), true)
            );
            JHtmlSidebar::addFilter(
                JText::_('COM_JVSOCIAL_PUBLISH_SELECT_SOURCE'),
                'filter_source',
                JHtml::_('select.options', $Jvsocial_publishHelper->buildFilterSource(), 'value', 'text', $this->state->get('filter.source'), true)
            );
            JHtmlSidebar::addFilter(
                JText::_('COM_JVSOCIAL_PUBLISH_SELECT_TYPE'),
                'filter_type',
                JHtml::_('select.options', $Jvsocial_publishHelper->buildFilterType(), 'value', 'text', $this->state->get('filter.type'), true)
            );
            JHtmlSidebar::addFilter(
                JText::_('COM_JVSOCIAL_PUBLISH_SELECT_POST'),
                'filter_post',
                JHtml::_('select.options', $Jvsocial_publishHelper->buildFilterPost(), 'value', 'text', $this->state->get('filter.post'), true)
            );
        }

        //Check if the form exists before showing the add/edit buttons
        $formPath = JPATH_COMPONENT_ADMINISTRATOR.'/views/channel';
        if (file_exists($formPath)) {
            if ($canDo->get('core.create')) {
                JToolBarHelper::addNew('channel.add','JTOOLBAR_NEW');
            }

            if ($canDo->get('core.edit') && isset($this->items[0])) {
                JToolBarHelper::editList('channel.edit','JTOOLBAR_EDIT');
            }
        }

		if ($canDo->get('core.edit.state')) {
            if (isset($this->items[0]->state)) {
			    JToolBarHelper::divider();
			    JToolBarHelper::custom('channels.publish', 'publish.png', 'publish_f2.png','JTOOLBAR_PUBLISH', true);
			    JToolBarHelper::custom('channels.unpublish', 'unpublish.png', 'unpublish_f2.png', 'JTOOLBAR_UNPUBLISH', true);
            }
            if (isset($this->items[0]->checked_out)) {
                JToolBarHelper::custom('channels.checkin', 'checkin.png', 'checkin_f2.png', 'JTOOLBAR_CHECKIN', true);
            }
            JToolBarHelper::divider();
            JToolBarHelper::deleteList('', 'channels.delete','JTOOLBAR_DELETE');
        }
        
        if ($canDo->get('core.admin')) {
            JToolBarHelper::divider();
			JToolBarHelper::preferences('com_jvsocial_publish');
		}


	}
}
