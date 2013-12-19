<?php
/**
 * @package     Streams
 *
 * @copyright   Copyright (C) 2010 - 2013 Crossing Hippos. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// https://github.com/J7mbo/twitter-api-php
require_once( JPATH_SITE.'/libraries/streams/twitter/TwitterAPIExchange.php' );

/**
 * Methods supporting a list of weblink records.
 *
 * @package     com_streams
 * @since       3.1
 */
class StreamsModelTwitter extends JModelAdmin
{
	/**
	 * var
	 * JRegistry Parameters
	 */
	protected $params = null;

	/**
	 * var
	 * JRegistry The authentication object
	 */
	protected $options = null;

	/**
	 * var
	 * TwitterAPIExchange An instance of the api object
	 */
	protected $api = null;

	/**
	 * var
	 * mixed An object with response data
	 */
	protected $response = null;

	/**
	 * Constructor.
	 *
	 * @param   array  An optional associative array of configuration settings.
	 * @see     JController
	 * @since   1.6
	 */
	public function __construct( $config = array() )
	{
		parent::__construct($config);

		// Load this items parameters
		$table = $this->getTable('Api', 'StreamsTable');
		$table->load(1);
		$params = new JRegistry( $table->get('params') );

		$twitter = new TwitterAPIExchange( $params->toArray() );
		$this->set('api', $twitter);
		$this->set('params', $params);
	}

	/**
	 * Method to new items from stream
	 *
	 * @return a list of items
	 */
	public function getResponse()
	{
		/**
		 * Only fetch items if the response is empty
		 */
		if ( is_null($this->response) )
		{
			$this->setResponse();
		}

		return $this->response;
	}

	/**
	 * Method to update the database with the new items
	 *
	 */
	public function update( $response=null )
	{
		/**
		 * Twitter returns an array of items if the call wass succesful
		 */
		$response = $response ? $response : $this->getResponse();

		if ( is_array($response) && isset($response[0]) )
		{
			// Keep counter for update items
			$c = 0;
			foreach ($response as $item)
			{
				$data = null;

				/**
				 * Get a reference to the table
				 */
				$table =& $this->getTable('Stream', 'StreamsTable');

				/**
				 * Reformat the date
				 */
				$date_created = new JDate($item->created_at);

				/**
				 * Create two array with data for storage,
				 * use the first array to determine if the item exists
				 */
				$id = array(
					'api_id' => 1,
					'post_id' => $item->id_str
				);
				$post = array(
					'date_created' => $date_created->toSql(),
					'raw' => base64_encode(serialize($item)), // http://stackoverflow.com/a/1058294
					'metadata' => null,
					'permalink' => 'https://twitter.com/'.$item->user->screen_name.'/status/'.$item->id_str,
					'params' => null,
					'language' => '*',
					'state' => 1,
					'publish_up' => null,
					'publish_down' => null,
				);

				/**
				 * Save the item if it does not yet exist
				 */
				if ( $table->load($id) )
				{
				}
				else
				{
					$data = array_merge($id,$post);
					$table->bind($data);
					$table->store($data);

					// Update the counter
					$c++;
				}
			}
			JFactory::getApplication()->enqueueMessage( JText::sprintf('COM_STREAMS_UPDATE_SUCCESS', 'Twitter', $c), 'message');
		}
	}

	/**
	 * Method to new items from stream
	 *
	 * @param array An array with configuration data
	 *
	 * @return void
	 */
	protected function setResponse()
	{
		$url = 'https://api.twitter.com/1.1/statuses/home_timeline.json';

		if ( $this->response==null ) 
		{
			$twitter =& $this->api;
			
			$request = $twitter->buildOauth($url, 'GET')
							   ->performRequest();

			// todo: intercept error and throw exception

			$this->response = json_decode($request);
		}

	}

	/**
	 * Method to get the record form.
	 *
	 * @param   array  $data		An optional array of data for the form to interogate.
	 * @param   boolean	$loadData	True if the form is to load its own data (default case), false if not.
	 * @return  JForm	A JForm object on success, false on failure
	 * @since   1.6
	 */
	public function getForm($data = array(), $loadData = true)
	{
	}
}
