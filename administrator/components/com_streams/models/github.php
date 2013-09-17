<?php
/**
 * @package     Streams
 *
 * @copyright   Copyright (C) 2010 - 2013 Crossing Hippos. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

use Joomla\Github\Github;
use Joomla\Registry\Registry;

require_once(__DIR__ . '/api.php');


/**
 * Methods supporting a list of weblink records.
 *
 * @package     com_streams
 * @since       3.1
 */
class StreamsModelGithub extends StreamsModelApi
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
	 * JTwitter An instance of the api object
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
		$table =& $this->getTable('Api', 'StreamsTable');
		$table->load(3);
		$params = new JRegistry( $table->get('params') );

		// Build the options object
		$options = new JRegistry;
		$options->set('api.username', $params->get('username'));
		$options->set('api.password', $params->get('password'));

		// Create the Facebook object
		$github = new JGithub($options);

		// Make accessible to this object
		$this->set('api', $github);
		$this->set('params', $params);
		$this->set('options', $options);
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
		if ( isset($response[0]) )
		{
			// Keep counter for update items
			$c = 0;
			foreach ($response as $item)
			{

				/**
				 * Get a reference to the table
				 */
				$table =& $this->getTable('Stream', 'StreamsTable');

				/**
				 * Create two array with data for storage,
				 * use the first array to determine if the item exists
				 */
				$id = array(
					'api_id' => 3,
					'post_id' => $item->sha
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
					$date_created = new JDate($item->commit->committer->date);

					$data = array(
						'date_created' => $date_created->toSql(),
						'raw' => base64_encode(serialize($item)), // http://stackoverflow.com/a/1058294
						'metadata' => null,
						'permalink' => $item->html_url,
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
			$github = $this->get('api');
			$params = $this->get('params');

			$username = $params->get('username');
			$repository = $params->get('repository');

			$this->set('response', $github->commits->getList($username, $repository));
		}
	}
}
