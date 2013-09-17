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
				'platform', 'a.api_id',
				'date_created', 'a.date_created',
				'state', 'a.state',
			);
		}

		parent::__construct($config);
	}

	/**
	 * Overload getItems()
	 */
	public function getItems()
	{
		$items = parent::getItems();

		// Unserialize raw attribute into PHP array
		foreach ($items as $key => &$item) {
			$item->php = unserialize($item->raw);
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
				'a.api_id,
				 a.date_created,
				 a.raw,
				 a.state, 
				 a.language'
		);
		$query->from($db->quoteName('#__streams') . ' AS a');


		$published = $this->getState('filter.state');
		if (is_numeric($published))
		{
			$query->where('a.state = ' . (int) $published);
		}
		elseif ($published === '')
		{
			$query->where('(a.state IN (0, 1))');
		}

		// echo nl2br(str_replace('#__','jos_',$query));
		return $query;
	}
}
