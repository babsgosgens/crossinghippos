<?php
/**
 * @version     1.0.0
 * @package     com_jvsocial_publish
 * @copyright   Copyright (C) 2013. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      joomlavi <info@joomlavi.com> - http://www.joomlavi.com
 */

// No direct access
defined('_JEXEC') or die;

jimport('joomla.application.component.controllerform');

/**
 * Request controller class.
 */
class Jvsocial_publishControllerRequest extends JControllerForm
{

    function __construct() {
        $this->view_list = 'requests';
        parent::__construct();
    }

    public function process(){
        $id = JFactory::getApplication()->input->get('id');
        $Jvsocial_publishHelper = new Jvsocial_publishHelper();
        $result = $Jvsocial_publishHelper->process($id);
        if($result){
            $this->setRedirect('index.php?option=com_jvsocial_publish&view=requests',JText::_('COM_JVSOCIAL_PUBLISH_REQUESTS_MSG_POST_SUCEESS'));
        }else{
            $this->setRedirect('index.php?option=com_jvsocial_publish&view=requests',JText::_('COM_JVSOCIAL_PUBLISH_REQUESTS_MSG_POST_FAIL'), 'error');
        }
    }
}