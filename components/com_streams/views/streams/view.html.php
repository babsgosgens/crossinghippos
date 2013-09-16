<?php
/**
 * @package     Streams
 *
 * @copyright   Copyright (C) 2010 - 2013 Crossing Hippos. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 */

defined('_JEXEC') or die;

/**
 * HTML View class for the Streams component
 *
 * @package     com_streams
 * @since       1.5
 */
class StreamsViewStreams extends JViewLegacy
{
	protected $state;

	protected $item;

	public function display($tpl = null)
	{
		// Get some data from the models
		$item		= $this->get('Item');

		parent::display($tpl);
	}
}
