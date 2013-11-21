<?php
/**
 * @package     Streams
 *
 * @copyright   Copyright (C) 2010 - 2013 Crossing Hippos. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

/**
 * Methods supporting a list of weblink records.
 *
 * @package     com_streams
 * @since       3.1
 */
class StreamsModelFlickr extends JModelAdmin
{
	/**
	 * var
	 * JRegistry Parameters
	 */
	protected $params = null;

	/**
	 * var
	 * Dribbble An instance of the api object
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
		$table->load(6);
		$params = new JRegistry( $table->get('params') );

		// get contents
		$flickr = file_get_contents('http://api.flickr.com/services/rest/?method=flickr.people.getPublicPhotos&api_key='.$params->get('key').'&user_id='.$params->get('user').'&format=json&nojsoncallback=1&per_page=20');

		// get profileimage
		$profileimage = json_decode(file_get_contents('http://api.flickr.com/services/rest/?method=flickr.people.getInfo&api_key='.$params->get('key').'&user_id='.$params->get('user').'&format=json&nojsoncallback=1&per_page=20'));
		$profileimage = 'http://farm' . $profileimage->person->iconfarm . '.staticflickr.com/' . $profileimage->person->iconserver . '/buddyicons/' . $profileimage->person->nsid . '.jpg';
		
		// make available to this object.
		$this->set('profileimg', $profileimage);
		$this->set('api', $flickr);
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
	public function update( $response=null )
	{
		/**
		 * Dribbble returns an array of items if the call wass succesful
		 */
		$response = $response ? $response : $this->getResponse();

		if ( is_array($response->photos->photo) && isset($response->photos->photo[0]) )
		{

			// Keep counter for update items
			$c = 0;
			foreach ($response->photos->photo as $item)
			{
				$data = null;

				$photo_data = json_decode(file_get_contents('http://api.flickr.com/services/rest/?method=flickr.photos.getInfo&api_key='.$this->params->get('key').'&photo_id='.$item->id.'&format=json&nojsoncallback=1'));
				$item = $photo_data->photo;

				$item->profileimg = $this->profileimg;

				/**
				 * Get a reference to the table
				 */
				$table =& $this->getTable('Stream', 'StreamsTable');

				/**
				 * Reformat the date
				 */
				$date_created = new JDate($item->dateuploaded);

				/**
				 * Create two array with data for storage,
				 * use the first array to determine if the item exists
				 */
				$id = array(
					'api_id' => 6,
					'post_id' => $item->id
				);

				$post = array(
					'date_created' => $date_created->ToSql(),
					'raw' => base64_encode(serialize($item)), // http://stackoverflow.com/a/1058294
					'metadata' => null,
					'permalink' => 'http://farm'.$item->farm.'.staticflickr.com/'.$item->server.'/'.$item->id.'_'.$item->secret.'.jpg',
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
			JFactory::getApplication()->enqueueMessage( JText::sprintf('COM_STREAMS_UPDATE_SUCCESS', 'Flickr', $c), 'message');
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
		if ( $this->response==null ) 
		{
			$flickr =& $this->api;
			$decode = json_decode($flickr);
			$this->response = $decode;
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
