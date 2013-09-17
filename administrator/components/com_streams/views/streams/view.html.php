<?php
/**
 * @package     Streams
 *
 * @copyright   Copyright (C) 2010 - 2013 Crossing Hippos. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

/**
 * View class for a list of streams.
 *
 * @package     Streams
 * @since       3.1
 */
class StreamsViewStreams extends JViewLegacy
{
	protected $items;

	protected $pagination;

	protected $state;

	/**
	 * Display the view
	 *
	 * @return  void
	 */
	public function display($tpl = null)
	{
		$this->state		= $this->get('State');
		$this->items		= $this->get('Items');
		$this->pagination	= $this->get('Pagination');

		// Check for errors.
		if (count($errors = $this->get('Errors')))
		{
			JError::raiseError(500, implode("\n", $errors));
			return false;
		}

		$this->addToolbar();
		$this->sidebar = JHtmlSidebar::render();
		parent::display($tpl);
	}

	/**
	 * Add the page title and toolbar.
	 *
	 * @since   1.6
	 */
	protected function addToolbar()
	{
		require_once JPATH_COMPONENT.'/helpers/streams.php';

		$state	= $this->get('State');
		$canDo	= StreamsHelper::getActions();
		$user	= JFactory::getUser();
		// Get the toolbar object instance
		$bar = JToolBar::getInstance('toolbar');

		JToolbarHelper::title(JText::_('COM_STREAMS_MANAGER_STREAMS'), 'streams.png');
		if (count($user->getAuthorisedCategories('com_streams', 'core.create')) > 0)
		{
			JToolbarHelper::addNew('streams.add');
		}
		if ($canDo->get('core.edit.state')) {

			JToolbarHelper::publish('streams.publish', 'JTOOLBAR_PUBLISH', true);
			JToolbarHelper::unpublish('streams.unpublish', 'JTOOLBAR_UNPUBLISH', true);

			JToolbarHelper::archiveList('streams.archive');
		}
		if ($state->get('filter.state') == -2 && $canDo->get('core.delete'))
		{
			JToolbarHelper::deleteList('', 'streams.delete', 'JTOOLBAR_EMPTY_TRASH');
		} elseif ($canDo->get('core.edit.state'))
		{
			JToolbarHelper::trash('streams.trash');
		}
		if ($canDo->get('core.admin'))
		{
			JToolbarHelper::preferences('com_streams');
		}

		JToolbarHelper::help('JHELP_COMPONENTS_STREAMS_LINKS');

		JHtmlSidebar::setAction('index.php?option=com_streams&view=streams');

		JHtmlSidebar::addFilter(
			JText::_('COM_STREAMS_SELECT_PLATFORM'),
			'filter_platform',
			JHtml::_('select.options', JHtml::_('contentlanguage.existing', true, true), 'value', 'text', $this->state->get('filter.language'))
		);

		JHtmlSidebar::addFilter(
			JText::_('JOPTION_SELECT_PUBLISHED'),
			'filter_state',
			JHtml::_('select.options', JHtml::_('jgrid.publishedOptions'), 'value', 'text', $this->state->get('filter.state'), true)
		);
	}

	/**
	 * Returns an array of fields the table can be sorted by
	 *
	 * @return  array  Array containing the field name to sort by as the key and display text as value
	 *
	 * @since   3.0
	 */
	protected function getSortFields()
	{
		return array(
			'a.state' => JText::_('JSTATUS'),
			'platform_title' => JText::_('JGLOBAL_TITLE'),
			'a.date_created' => JText::_('JDATE'),
			'a.language' => JText::_('JGRID_HEADING_LANGUAGE'),
		);
	}
}
