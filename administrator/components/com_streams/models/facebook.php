<?php
/**
 * @package     Streams
 *
 * @copyright   Copyright (C) 2010 - 2013 Crossing Hippos. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\Facebook\Facebook;
use Joomla\Facebook\OAuth;
use Joomla\Registry\Registry;


/**
 * Methods supporting a list of weblink records.
 *
 * @package     com_streams
 * @since       3.1
 */
class StreamsModelFacebook extends JModelAdmin
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
  		$app_id = '231110010232949';
  		$app_secret = 'eedc870587dc39297be6fe57ab8f2b3d';
		$app_redirect = $uri->toString();

		// Build the options object
		$options = new JRegistry;
		$options->set('clientid', 	$app_id);
		$options->set('clientsecret', $app_secret);
		$options->set('redirecturi', $app_redirect);
		$options->set('sendheaders', true);
		$options->set('authmethod', 'get');

		// Authenticate 
		$oauth = new JFacebookOAuth($options);
		$access_token = $oauth->authenticate();

		// Create the Facebook object
		$facebook = new JFacebook($oauth);

		// Make it accessible to this object
		$this->api = $facebook;
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
		$response = $response ? $response : $this->getResponse();

		/**
		 * Facebook returns an object with two attributes: data and paginate if the call was succesful
		 */
		if ( property_exists($response, 'data') && $response->data[0] )
		{
			// Keep counter for update items
			$c = 0;
			foreach ($response->data as $item)
			{
				/**
				 * Get a reference to the table
				 */
				$table =& $this->getTable('Stream', 'StreamsTable');

				/**
				 * Create two arrays with data for storage,
				 * use the first array to determine if the item exists
				 */
				$pos = strpos($item->id, '_'); //Only use after underscore, first part is userid, second postid: 100002043048057_515362341875196
				$postId = substr($item->id, $pos+1 );
				$id = array(
					'api_id' => 2,
					'post_id' => $postId
				);

				/**
				 * Save the item if it does not yet exist
				 */
				if ( $table->load($id) )
				{
				}
				else
				{
					/**
					 * Reformat the date
					 */
					$date_created = new JDate($item->updated_time);

					$data = array(
						'date_created' => $date_created->toSql(),
						'raw' => base64_encode(serialize($item)), // http://stackoverflow.com/a/1058294
						'metadata' => null,
						'permalink' => null,
						'params' => null,
						'language' => '*',
						'state' => 1,
						'publish_up' => null,
						'publish_down' => null,
					);

					$row = array_merge($id,$data);
					$table->bind($row);
					$table->store($row);


					// Update the counter
					$c++;
				}
			}

			JFactory::getApplication()->enqueueMessage( JText::sprintf('COM_STREAMS_UPDATE_SUCCESS', 'Facebook', $c), 'message');
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
			$facebook =& $this->api;

			// Get the feed and store it in the class attribute
			$user = $facebook->user;
			$this->response = $user->getFeed("me");
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
