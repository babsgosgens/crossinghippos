<?php
/**
 * @package     Streams
 *
 * @copyright   Copyright (C) 2010 - 2013 Crossing Hippos. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

// https://github.com/J7mbo/twitter-api-php
require_once( JPATH_SITE.'/libraries/facebook/facebook.php' );
jimport('joomla.twitter');

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
	protected $_settings = array();

	/**
	 * var
	 * $api TwitterAPIExchange An instance of the api object
	 */
	protected $_api = null;

	/**
	 * var
	 * $response mixed A (JSON) array with response data
	 */
	protected $_response = null;

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

		/**
		 * Set access tokens here - see: https://dev.twitter.com/apps/
		 * @todo add these to the component configuration
		 */
		$this->_settings = array(
  			'appId' => '231110010232949',
  			'secret' => 'eedc870587dc39297be6fe57ab8f2b3d',
  		);

		$this->_api = new Facebook($this->_settings);
	}

	/**
	 * Method to new items from stream
	 *
	 * @return a list of items
	 */
	public function getItems( $update=true )
	{

		if ($this->_api->getUser() == false) {

			$params = array('scope' => 'user_status');
			
			if (!isset($_GET['error'])){
				header("Location: " . $this->_api->getLoginUrl($params));
				exit;
			}

		} else {
			$this->_response = $this->_api->api("/me/statuses?limit=20&locale=nl");
		}

		if ( $update )
		{
			$this->updateTable();
		}

		return $this->_response['data'];

	}

	/**
	 * Method to update the database with the new items
	 *
	 */
public function updateTable()
	{
		/**
		 * Twitter returns an array of items if the call wass succesful
		 */
		$response =& $this->_response['data'];

		if (is_array($response) && isset($response[0]))
		{
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
				$date_created = new JDate($item['updated_time']);

				/**
				 * Create two array with data for storage,
				 * use the first array to determine if the item exists
				 */
				$data1 = array(
					'platform' => 2,
					'platform_id' => $item['id']
				);

				$data2 = array(
					'date_created' => $date_created->toSql(),
					'raw' => serialize($item),
					'metadata' => null,
					'permalink' => null,
					'params' => null,
					'language' => '*',
					'state' => 1,
					'publish_up' => null,
					'publish_down' => null,
				);

				/**
				 * Save the item if it does not yet exist
				 */
				if ( $table->load($data1) )
				{
				}
				else
				{
					$data = array_merge($data1,$data2);
					$table->bind($data);
					$table->store($data);
					// $this->save($data);
				}
			}
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
