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
class StreamsControllerStreams extends JControllerAdmin
{
	/**
	 * Method to update the stream for any or all available platforms
	 *
	 * @param string 	$type 	A string representing a platform, e.g: 'twitter'
	 * @param array 	$config 	An optional array with configuration data
	 */
	public function update($config = array())
	{
		/*
		 * Check if a type was passed through the request
		 */
		$input = JFactory::getApplication()->input;
		$type = $input->get('type', '');

		/*
		 * Allow to search for older items
		 */
		if ( !isset($config['date']) )
		{
			$config['date'] = date(now);
		}

		var_dump($type);

		/*
		 * Call the model for this type
		 */
		$typeModel = $this->getModel($type);

		if ( $typeModel )
		{
			var_dump($typeModel);
		} else
		{
			var_dump($typeModel);
		}
	}

	/**
	 * Method to provide child classes the opportunity to process after the delete task.
	 *
	 * @param   JModelLegacy   $model   The model for the component
	 * @param   mixed          $ids     array of ids deleted.
	 *
	 * @return  void
	 *
	 * @since   3.1
	 */
	protected function postDeleteHook(JModelLegacy $model, $ids = null)
	{
	}
}
