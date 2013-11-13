<?php
/**
 * @version     1.0.0
 * @package     com_jvsocial_publish
 * @copyright   Copyright (C) 2013. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      joomlavi <info@joomlavi.com> - http://www.joomlavi.com
 */

// No direct access.
defined('_JEXEC') or die;

jimport('joomla.application.component.controlleradmin');

/**
 * Requests list controller class.
 */
class Jvsocial_publishControllerRequests extends JControllerAdmin
{
	/**
	 * Proxy for getModel.
	 * @since	1.6
	 */
	public function getModel($name = 'request', $prefix = 'Jvsocial_publishModel', $config = Array())
	{
		$model = parent::getModel($name, $prefix, array('ignore_request' => true));
		return $model;
	}
}