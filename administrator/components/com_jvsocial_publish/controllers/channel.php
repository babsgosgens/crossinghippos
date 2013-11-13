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
 * Channel controller class.
 */
class Jvsocial_publishControllerChannel extends JControllerForm
{

    function __construct() {
        $this->view_list = 'channels';
        parent::__construct();
    }

    public function verifyCredentials(){
        if(!class_exists('TwitterAPIExchange')){
            require_once(JPATH_SITE.'/administrator/components/com_jvsocial_publish/assets/classes/TwitterAPIExchange.php');
        }
        $input = JFactory::getApplication()->input;
        $settings = array(
            'consumer_key' => $input->get('consumer_key','','string'),
            'consumer_secret' => $input->get('consumer_secret','','string'),
            'oauth_access_token' => $input->get('token','','string'),
            'oauth_access_token_secret' => $input->get('token_secret','','string')
        );
        $twitter = new TwitterAPIExchange($settings);
        $rs = json_decode($twitter->buildOauth('https://api.twitter.com/1.1/account/verify_credentials.json', 'GET')->performRequest());

        if(isset($rs->errors)){
            exit(json_encode(array('rs'=>'0', 'msg'=>JText::sprintf('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_ERROR_CODE', $rs->errors[0]->code, $rs->errors[0]->message))));
        }

        if($twitter->headers['x-access-level'] != 'read-write' && $twitter->headers['x-access-level'] != 'read-write-directmessages'){
            exit(json_encode(array('rs'=>'0', 'msg'=>JText::sprintf('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_ERROR_ACCESS_LEVEL', $twitter->headers['x-access-level'], ($twitter->headers['x-rate-limit-limit'] - $twitter->headers['x-rate-limit-remaining']).'/'.$twitter->headers['x-rate-limit-limit']))));
        }

        exit(json_encode(array('rs'=>'1', 'id'=>$rs->id, 'name'=>$rs->name, 'username'=>$rs->screen_name, 'photo'=>$rs->profile_image_url)));
    }

    public function getAjaxItem(){
        $model = $this->getModel();
        exit(json_encode($model->getItem(JFactory::getApplication()->input->get('id'))));
    }
}