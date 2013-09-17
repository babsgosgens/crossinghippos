<?php
/**
 * @package     Streams
 *
 * @copyright   Copyright (C) 2010 - 2013 Crossing Hippos. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

/**
 * Methods supporting a list of streams records.
 *
 * @package     com_streams
 * @since       3.1
 */
class StreamsModelStreams extends JModelList
{
	/**
	 * Constructor.
	 *
	 * @param   array  An optional associative array of configuration settings.
	 * @see     JController
	 * @since   1.6
	 */
	public function __construct($config = array())
	{
		if (empty($config['filter_fields']))
		{
			$config['filter_fields'] = array(
				'state', 'a.state',
				'title', 'aa.title', 'platform_title',
				'date_created', 'a.date_created',
				'language', 'a.language',
			);
		}

		parent::__construct($config);
	}

	/**
	 * Method to auto-populate the model state.
	 *
	 * Note. Calling getState in this method will result in recursion.
	 *
	 * @since   1.6
	 */
	protected function populateState($ordering = null, $direction = null)
	{
		// Load the filter state.
		$published = $this->getUserStateFromRequest($this->context . '.filter.state', 'filter_state', '', 'string');
		$this->setState('filter.state', $published);

		$platform = $this->getUserStateFromRequest($this->context . '.filter.platform', 'filter_platform', '', 'string');
		$this->setState('filter.platform', $platform);

		$language = $this->getUserStateFromRequest($this->context . '.filter.language', 'filter_language', '');
		$this->setState('filter.language', $language);

		// Load the parameters.
		$params = JComponentHelper::getParams('com_streams');
		$this->setState('params', $params);

		// List state information.
		parent::populateState('a.date_created', 'desc');
	}

	/**
	 * Method to get a store id based on model configuration state.
	 *
	 * This is necessary because the model is used by the component and
	 * different modules that might need different sets of data or different
	 * ordering requirements.
	 *
	 * @param   string  $id    A prefix for the store id.
	 * @return  string  A store id.
	 * @since   1.6
	 */
	protected function getStoreId($id = '')
	{
		// Compile the store id.
		$id .= ':' . $this->getState('filter.search');
		$id .= ':' . $this->getState('filter.state');
		$id .= ':' . $this->getState('filter.platform');
		$id .= ':' . $this->getState('filter.language');

		return parent::getStoreId($id);
	}

	/**
	 * Overload getItems()
	 */
	public function getItems()
	{
		$items = parent::getItems();


		// Unserialize raw attribute into PHP array
		foreach ($items as $key => &$item)
		{
			$item->php = unserialize(base64_decode($item->raw));  // http://stackoverflow.com/a/1058294
		}

		// Store in cache
		$this->cache[$store] = $items;

		return $this->cache[$store];
	}

	/**
	 * Build an SQL query to load the list data.
	 *
	 * @return  JDatabaseQuery
	 * @since   1.6
	 */
	protected function getListQuery()
	{
		// Create a new query object.
		$db = $this->getDbo();
		$query = $db->getQuery(true);
		$user = JFactory::getUser();

		// Select the required fields from the table.
		$query->select(
			'a.id,
			 a.api_id,
			 a.post_id,
			 a.date_created,
			 a.raw,
			 a.state, 
			 a.language'
		);
		$query->from($db->quoteName('#__streams') . ' AS a');

		// Join over the api platforms.
		$query->select('aa.alias AS platform, aa.title AS platform_title')
			->join('LEFT', $db->quoteName('#__streams_apis') . ' AS aa ON aa.id = a.api_id');

		// Filter by published state
		$published = $this->getState('filter.state');
		if (is_numeric($published))
		{
			$query->where('a.state = ' . (int) $published);
		}
		elseif ($published === '')
		{
			$query->where('(a.state IN (0, 1))');
		}

		// Filter on the language.
		if ($language = $this->getState('filter.language'))
		{
			$query->where('a.language = ' . $db->quote($language));
		}

		// Add the list ordering clause.
		echo $orderCol = $this->state->get('list.ordering');
		$orderDirn = $this->state->get('list.direction');
		if ($orderCol == 'aa.title')
		{
			$orderCol = 'aa.title ' . $orderDirn . ', a.date_created';
		}
		elseif ($orderCol == 'a.language')
		{
			$orderCol = 'a.language ' . $orderDirn . ', a.date_created';
		}
		$query->order($db->escape($orderCol . ' ' . $orderDirn));


		// echo nl2br(str_replace('#__','flock_',$query)); exit;
		return $query;
	}

	public function publish($data2, $data1)
	{
		var_dump($data2);
		var_dump($data1);
		exit;
	}
}
