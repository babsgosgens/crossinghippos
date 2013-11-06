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
		$store = 'streams';

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

		// Only show published items
		$query->where('a.state = 1');

		// filter on given variables.
		$this->filterQuery($db, $query);

		// reverse date
		$query->order('a.date_created DESC');

		// echo nl2br(str_replace('#__','flock_',$query));
		return $query;
	}

	/**
	 * Build an SQL filtered query to load the list data.
	 *
	 * @return  JDatabaseQueryAndFilter
	 * @since   1.6
	 */
	private function filterQuery($db, $query)
	{	
		// get input.
		$input = JFactory::getApplication()->input;

		// get ?platform=[CONTENT] and filter.
		$platform = $input->get('platform', '', 'raw');

		// if ?platform=[CONTENT] is set
		if ($platform != ''){

			// empty array for query.
			$items = array();

			// split all $_GET items.
			$split = explode(' ', $platform);

			// generate query.
			foreach ($split as $item){
				array_push($items, 'aa.alias = ' . $db->quote($item));
			}

			// join query string.
			$string = implode(' OR ', $items);

			// execute query.
			$query->where($string);
		}
	}
}
