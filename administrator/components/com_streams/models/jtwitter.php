<?php
/**
 * @package     Streams
 *
 * @copyright   Copyright (C) 2010 - 2013 Crossing Hippos. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// https://github.com/J7mbo/twitter-api-php
require_once( JPATH_SITE.'/libraries/twitter/TwitterAPIExchange.php' );

/**
 * Methods supporting a list of weblink records.
 *
 * @package     com_streams
 * @since       3.1
 */
class StreamsModelJtwitter extends JModelAdmin
{
	/**
	 * var
	 * $settings array An array of authentication data
	 */
	protected $settings = array();

	/**
	 * var
	 * $api TwitterAPIExchange An instance of the api object
	 */
	protected $api = null;

	/**
	 * var
	 * $response mixed A (JSON) array with response data
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

		// Call the URI object to get the current request
		$uri = JFactory::getUri();

		// Required settings, 
		$access_token = '110107572-YMo8GKZ6ulzP1loyygnLTQUWx9dI681V4kU8LASv';
		$access_token_secret = 'u1GpK5fNbI8POV9kY9lVbScLu6l331MEoDOJbJGqChY';

		$consumer_key = 'KSlsiPWpC50tBn2jLD8xQ';
		$consumer_secret = 'BfFmluo0rnZp2I3H3XitCWhFvOqHHJFSGmMaTTvwN4';

		$callback_url = $uri->toString();

		// Build the options object
		$options = new JRegistry;

		// $options->set('access_token', $access_token);
		// $options->set('access_token_secret', $access_token_secret);

		$options->set('consumer_key', $consumer_key);
		$options->set('consumer_secret', $consumer_secret);
		$options->set('callback', $callback_url);
		$options->set('sendheaders', true);

		// Authenticate 
		$oauth = new JTwitterOAuth($options);
		// $oauth->setToken($access_token);
		// $access_token = $oauth->authenticate();
		$oauth->authenticate();

		// Create the Facebook object
		$twitter = new JTwitter($oauth);
		$statuses = $twitter->statuses;

		echo '<pre>';
		print_r($statuses);
		echo '</pre>';
		exit;

		// Make it accessible to this object
		$this->api = $twitter;
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
		if ( is_null($this->_response) )
		{
			$this->setResponse();
		}

		return $this->response;
	}

	/**
	 * Method to update the database with the new items
	 *
	 */
	public function update($response = null)
	{
		/**
		 * Twitter returns an array of items if the call wass succesful
		 */
		$response = $response ? $response : $this->getResponse();

		if ( is_array($response) && isset($response[0]) )
		{
			foreach ($response as $item)
			{
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
				$data = array(
					'date_created' => $date_created->toSql(),
					'raw' => base64_encode(serialize($item)),
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
					$row = array_merge($id,$data);
					$table->bind($row);
					$table->store($row);
					// $this->save($data);
				}
			}
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
		// Only call the data once
		if ( $this->response==null ) 
		{
			// Get a reference to the api object
			$twitter =& $this->api;

			// Do stuff
			$this->response = $twitter->statuses;
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
