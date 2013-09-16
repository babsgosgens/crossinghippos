<?php
/**
 * @package     Streams
 *
 * @copyright   Copyright (C) 2010 - 2013 Crossing Hippos. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

/**
 * Streams list controller class.
 *
 * @package     com_streams
 * @since       3.1
 */
class StreamsControllerUpdate extends JControllerAdmin
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
		parent::__construct();

		/*
		 * Register the task to the fetch method
		 */
		$input = JFactory::getApplication()->input;
		$this->registerTask( $input->get('task', '') , 'update');
	}

	/**
	 * Method to update the stream for any or all available platforms
	 *
	 * @param string 	$type 	A string representing a platform, e.g: 'twitter'
	 * @param array 	$config 	An optional array with configuration data
	 *
	 * @return boolean 	True or false
	 */
	public function update(	$config = array() )
	{
		$type = $this->getTask();

		/*
		 * Call the model for this type
		 * Return to the default view if no model exists
		 */
		$m = $this->getModel($type);

		if ( $m )
		{
			$response = $m->getResponse($config);

			// Notify the user about the update
			if ( $response )
			{
				// Store the feed into the database
				$m->update($response);
			}
			else
			{
				$msg = JText::sprintf('COM_STREAMS_UPDATE_FAILURE', $type);
			}
		}
		else
		{
			$e = JText::sprintf('COM_STREAMS_ERROR_MISSING_PLATFORM_MODEL', $type);

			JError::raiseError( 500, $e );
		}

		$this->setRedirect( JRoute::_('index.php?option=com_streams'), $msg );

	}
}
