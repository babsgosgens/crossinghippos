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
 * Channels list controller class.
 */
class Jvsocial_publishControllerManual_Post extends JControllerLegacy
{
    public function getModel($name = 'manual_post', $prefix = 'Jvsocial_publishModel', $config = Array())
    {
        $model = parent::getModel($name, $prefix, array('ignore_request' => true));
        return $model;
    }

	public function getArticles(){
        $list = array();
        $source = JFactory::getApplication()->input->get('source','','string');
        $db = JFactory::getDbo();
        $query = $db->getQuery(true);
        if($source == 'content'){
            $query->select('a.id, a.title, a.catid, c.title AS category_name')
                ->from('#__content AS a')
                ->join('LEFT','#__categories AS c ON c.id = a.catid')
                ->order('c.title ASC, a.title')
                ->where('a.state = 1');
        }elseif($source == 'k2'){
            $query->select('a.id, a.title, a.catid, c.name AS category_name')
                ->from('#__k2_items AS a')
                ->join('LEFT','#__k2_categories AS c ON c.id = a.catid')
                ->order('c.name ASC, a.title')
                ->where('a.published = 1 AND a.trash = 0');
        }else{
            exit(json_encode($list));
        }
        $db->setQuery($query);
        $articles = $db->loadObjectList();

        $currentCat = 0;
        $i = -1;
        $j = -1;
        if($articles) foreach($articles as $article){
            if($currentCat != $article->catid){
                $currentCat = $article->catid;
                $i++;
                $j = 0;
                $list[$i]['label'] = $article->category_name;
                $list[$i]['children'] = array();
            }
            $list[$i]['children'][$j]['name'] = $article->title;
            $list[$i]['children'][$j]['id'] = $article->id;
            $j++;
        }

        exit(json_encode($list));
    }

    public function post(){
        $post = JFactory::getApplication()->input->get('jform',array(),'array');
        JTable::addIncludePath(JPATH_SITE.'/administrator/components/com_jvsocial_publish/tables');
        $channel = JTable::getInstance('channel','Jvsocial_publishTable');
        $channel->load($post['channel']);
        $channel->params = json_decode($channel->params);
        if($post['target']){
            $channel->params->target = $post['target'];
        }
        $channel->source = $post['source'];

        $Jvsocial_publishHelper = new Jvsocial_publishHelper();

        $data = $Jvsocial_publishHelper->getArticle($post['source_id'], $post['source']);
        if($data === false){
            $this->setRedirect('index.php?option=com_jvsocial_publish&view=manual_post',JText::_('COM_JVSOCIAL_PUBLISH_REQUESTS_MSG_POST_FAIL'), 'error');
        }

        if($channel->type == 'facebook'){
            $result = $Jvsocial_publishHelper->postFacebook($channel, $data);
        }else{
            $result = $Jvsocial_publishHelper->postTwitter($channel, $data);
        }
        if($result){
            $this->setRedirect('index.php?option=com_jvsocial_publish&view=manual_post',JText::_('COM_JVSOCIAL_PUBLISH_REQUESTS_MSG_POST_SUCEESS'));
        }else{
            $this->setRedirect('index.php?option=com_jvsocial_publish&view=manual_post',JText::_('COM_JVSOCIAL_PUBLISH_REQUESTS_MSG_POST_FAIL'), 'error');
        }
    }

    public function getAjaxItem(){
        $model = $this->getModel();
        exit(json_encode($model->getItems()));
    }

}