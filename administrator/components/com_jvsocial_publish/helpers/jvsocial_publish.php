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

/**
 * Jvsocial_publish helper.
 */
class Jvsocial_publishHelper
{
	/**
	 * Configure the Linkbar.
	 */
	public static function addSubmenu($vName = '')
	{
		if(self::getJoomlaVersion() == 'j2x'){
            JSubMenuHelper::addEntry(
                JText::_('COM_JVSOCIAL_PUBLISH_TITLE_CHANNELS'),
                'index.php?option=com_jvsocial_publish&view=channels',
                $vName == 'channels'
            );

            JSubMenuHelper::addEntry(
                JText::_('COM_JVSOCIAL_PUBLISH_TITLE_REQUESTS'),
                'index.php?option=com_jvsocial_publish&view=requests',
                $vName == 'requests'
            );

            JSubMenuHelper::addEntry(
                JText::_('COM_JVSOCIAL_PUBLISH_TITLE_MANUAL_POST'),
                'index.php?option=com_jvsocial_publish&view=manual_post',
                $vName == 'manual_post'
            );

            JSubMenuHelper::addEntry(
                JText::_('COM_JVSOCIAL_PUBLISH_TITLE_GUIDE'),
                'index.php?option=com_jvsocial_publish&view=guide',
                $vName == 'guide'
            );
        }else{
            JHtmlSidebar::addEntry(
                JText::_('COM_JVSOCIAL_PUBLISH_TITLE_CHANNELS'),
                'index.php?option=com_jvsocial_publish&view=channels',
                $vName == 'channels'
            );

            JHtmlSidebar::addEntry(
                JText::_('COM_JVSOCIAL_PUBLISH_TITLE_REQUESTS'),
                'index.php?option=com_jvsocial_publish&view=requests',
                $vName == 'requests'
            );

            JHtmlSidebar::addEntry(
                JText::_('COM_JVSOCIAL_PUBLISH_TITLE_MANUAL_POST'),
                'index.php?option=com_jvsocial_publish&view=manual_post',
                $vName == 'manual_post'
            );

            JHtmlSidebar::addEntry(
                JText::_('COM_JVSOCIAL_PUBLISH_TITLE_GUIDE'),
                'index.php?option=com_jvsocial_publish&view=guide',
                $vName == 'guide'
            );
        }

	}

    public static function updateVersion(){
        // update version 1.1.0
        // add column created_by
        JTable::addIncludePath(JPATH_SITE.'/administrator/components/com_jvsocial_publish/tables');
        $requestTable = JTable::getInstance('request','Jvsocial_publishTable');
        $fields = $requestTable->getFields();
        if(!isset($fields['created_by'])){
            $db = JFactory::getDbo();
            $db->setQuery('ALTER TABLE #__jvsocial_publish_requests ADD COLUMN `created_by` INT(11) NOT NULL DEFAULT 0');
            $db->execute();
        }
    }

	/**
	 * Gets a list of the actions that can be performed.
	 *
	 * @return	JObject
	 * @since	1.6
	 */
	public static function getActions(){
		$user	= JFactory::getUser();
		$result	= new JObject;

		$assetName = 'com_jvsocial_publish';

		$actions = array(
			'core.admin', 'core.manage', 'core.create', 'core.edit', 'core.edit.own', 'core.edit.state', 'core.delete'
		);

		foreach ($actions as $action) {
			$result->set($action, $user->authorise($action, $assetName));
		}

		return $result;
	}

    public static function addAsset(){
        $document = JFactory::getDocument();
        if(Jvsocial_publishHelper::getJoomlaVersion() == 'j2x'){
            $document->addStyleSheet(JURI::base(true).'/components/com_jvsocial_publish/assets/bootstrap/css/bootstrap.css');
            $document->addStyleSheet(JURI::base(true).'/components/com_jvsocial_publish/assets/bootstrap/css/bootstrap-responsive.min.css');
        }
        $document->addStyleSheet(JURI::base(true).'/components/com_jvsocial_publish/assets/pnotify/jquery.pnotify.default.css');
        $document->addStyleSheet(JURI::base(true).'/components/com_jvsocial_publish/assets/css/jvsocial_publish.css');
        $document->addStyleSheet(JURI::base(true).'/components/com_jvsocial_publish/assets/css/jvsocial_publish_'.Jvsocial_publishHelper::getJoomlaVersion().'.css');
        $document->addStyleSheet(JURI::base(true).'/components/com_jvsocial_publish/assets/bootstrap-custom-icons/cus-icons.css');
        if(Jvsocial_publishHelper::getJoomlaVersion() == 'j2x'){
            $document->addScript(JURI::base(true).'/components/com_jvsocial_publish/assets/js/jquery.min.js');
            $document->addScript(JURI::base(true).'/components/com_jvsocial_publish/assets/bootstrap/js/bootstrap.min.js');
        }else{
            JHtml::_('Jquery.framework');
        }
        $document->addScript(JURI::base(true).'/components/com_jvsocial_publish/assets/js/knockout-2.2.1.js');
        $document->addScript(JURI::base(true).'/components/com_jvsocial_publish/assets/pnotify/jquery.pnotify.min.js');
        $document->addScript(JURI::base(true).'/components/com_jvsocial_publish/assets/js/jquery.noconflict.js');
        if(JFactory::getApplication()->input->get('view','','string') == 'channel'){
            $document->addScript(JURI::base(true).'/components/com_jvsocial_publish/assets/js/channel.js');
        }
        if(JFactory::getApplication()->input->get('view','','string') == 'manual_post'){
            $document->addScript(JURI::base(true).'/components/com_jvsocial_publish/assets/js/manual.js');
        }
    }

    public static function getSocialUrl($type, $username){
        if($type == 'facebook'){
            return 'https://www.facebook.com/'.$username;
        }else{
            return 'https://twitter.com/'.$username;
        }
    }

    public function cutString($str, $limit=100, $endChar='...'){
        if(strlen($str)<=$limit) return $str;
        if(strpos($str," ",$limit) > $limit){
            $new_limit=strpos($str," ",$limit);
            $new_str = substr($str,0,$new_limit).$endChar;
            return $new_str;
        }
        $new_str = substr($str,0,$limit).$endChar;
        return $new_str;
    }

    public function getArticle($id, $source){
        $config = JComponentHelper::getParams('com_jvsocial_publish');
        $root = rtrim(JURI::root(), '/');

        $db = JFactory::getDbo();
        $query = $db->getQuery(true);

        if($source == 'content'){
            require_once JPATH_SITE.'/components/com_content/helpers/route.php';
            $query
                ->select('a.id,a.catid,a.title,a.alias,a.introtext,a.fulltext,a.images,c.alias AS category_alias')
                ->from('#__content AS a')->where('a.id='.$id)
                ->join('LEFT','#__categories AS c ON c.id=a.catid');

            $db->setQuery($query);
            $article = $db->loadObject();

            if(!$article){
                if((int)$config->get('font_end_message','1') || JFactory::getApplication()->isAdmin()){
                    JFactory::getApplication()->enqueueMessage(JText::_('COM_JVSOCIAL_PUBLISH_REQUESTS_MSG_ARTICLE_NOT_FOUND'), 'error');
                }
                return false;
            }

            $article->link = JRoute::_(ContentHelperRoute::getArticleRoute($article->id.':'.$article->alias, $article->catid.':'.$article->category_alias), false);
            $app    = JFactory::getApplication()->getInstance('site');
            $router = &$app->getRouter();
            $newUrl = $router->build($article->link)->toString(array('path', 'query', 'fragment'));
            $article->link = JURI::root().ltrim(str_replace(JURI::base(true), '', $newUrl), '/');

            $article->images = json_decode($article->images);
            $article->imagelink = '';
            if($article->images->image_intro){
                $article->imagelink = JURI::root().$article->images->image_intro;
            }
        }else{
            if (!JComponentHelper::getComponent('com_k2', true)->enabled){
                if((int)$config->get('font_end_message','1') || JFactory::getApplication()->isAdmin()){
                    JFactory::getApplication()->enqueueMessage(JText::_('COM_JVSOCIAL_PUBLISH_MSG_K2_NOT_ENABLE'), 'error');
                }
                return false;
            }
            require_once JPATH_SITE.'/components/com_k2/helpers/route.php';
            $query
                ->select('a.id,a.catid,a.title,a.alias,a.introtext,a.fulltext,c.alias AS category_alias')
                ->from('#__k2_items AS a')->where('a.id='.$id)
                ->join('LEFT','#__k2_categories AS c ON c.id=a.catid');

            $db->setQuery($query);
            $article = $db->loadObject();

            if(!$article){
                if((int)$config->get('font_end_message','1') || JFactory::getApplication()->isAdmin()){
                    JFactory::getApplication()->enqueueMessage(JText::_('COM_JVSOCIAL_PUBLISH_REQUESTS_MSG_ARTICLE_NOT_FOUND'), 'error');
                }
                return false;
            }

            $article->link = urldecode(JRoute::_(K2HelperRoute::getItemRoute($article->id.':'.urlencode($article->alias), $article->catid.':'.urlencode($article->category_alias))));
            $app    = JFactory::getApplication()->getInstance('site');
            $router = &$app->getRouter();
            $newUrl = $router->build($article->link)->toString(array('path', 'query', 'fragment'));
            $article->link = JURI::root().ltrim(str_replace(JURI::base(true), '', $newUrl), '/');

            jimport('joomla.filesystem.file');
            $article->imagelink = '';
            if (JFile::exists(JPATH_SITE.DS.'media'.DS.'k2'.DS.'items'.DS.'cache'.DS.md5("Image".$article->id).'_S.jpg')){
                $article->imagelink = JURI::root().'media/k2/items/cache/'.md5("Image".$article->id).'_S.jpg';
            }
        }

        if(!$article->imagelink){
            if(!class_exists('phpQuery')){
                require_once(JPATH_SITE.'/administrator/components/com_jvsocial_publish/assets/classes/phpQuery.php');
            }
            $doc = phpQuery::newDocumentHTML($article->introtext);
            $article->imagelink = $doc->find('img')->eq(0)->attr('src');
            if(!$article->imagelink){
                $doc = phpQuery::newDocumentHTML($article->fulltext);
                $article->imagelink = $doc->find('img')->eq(0)->attr('src');
            }
        }

        if($article->imagelink){
            if(!preg_match('~((http|https|ftp|ftps)://|www.)(.+?)~',$article->imagelink)){
                $article->imagelink = JURI::root().$article->imagelink;
            }
        }

        $article->intro = strip_tags($article->introtext);
        if(!$article->intro){
            $article->intro = strip_tags($article->fulltext);
        }

        if($article->intro) $article->intro = $this->cutString($article->intro,intval($config->get('max_length_desc',100)),$config->get('end_char_desc','...'));

        if($config->get('user_short_url','1')){
            $article->link = $this->get_tiny_url($article->link);
            if(!$article->link){
                if((int)$config->get('font_end_message','1') || JFactory::getApplication()->isAdmin()){
                    JFactory::getApplication()->enqueueMessage(JText::_('COM_JVSOCIAL_PUBLISH_REQUESTS_MSG_GET_SHORT_URL_ERROR'), 'error');
                }
                return false;
            }
        }

        $message_template = str_replace(array('{title}', '{link}', '{root}'), array($article->title, $article->link, $root), $config->get('message_template','{title}'));
        $status_template = str_replace(array('{title}', '{link}', '{root}'), array($article->title, $article->link, $root), $config->get('status_template','{title} {link}'));
        $caption_template = str_replace(array('{title}', '{link}', '{root}'), array($article->title, $article->link, $root), $config->get('caption_template','{root}'));

        return array(
            'article_id' => $id,
            'message' => $message_template,
            'status' => $status_template,
            'picture' => $article->imagelink,
            'link' => $article->link,
            'name' => $article->title,
            'caption' => $caption_template,
            'description' => $article->intro
        );
    }

    public function saveRequest($request){
        JTable::addIncludePath(JPATH_SITE.'/administrator/components/com_jvsocial_publish/tables');
        if(!isset($request['id'])){
            $request['created_by'] = JFactory::getUser()->id;
        }
        $requestTable = JTable::getInstance('request','Jvsocial_publishTable');
        $requestTable->bind($request);
        $requestTable->store();
    }

    public function get_tiny_url($url)  {
        $ch = curl_init();
        $timeout = 30;
        curl_setopt($ch,CURLOPT_URL,'http://tinyurl.com/api-create.php?url='.urlencode($url));
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
        curl_setopt($ch,CURLOPT_CONNECTTIMEOUT,$timeout);
        $data = curl_exec($ch);
        curl_close($ch);
        return $data;
    }

    /* functions to feed */

    public function postFacebook($channel, $data, $request_id=0){
        if(!class_exists('Facebook')){
            require_once(JPATH_SITE.'/administrator/components/com_jvsocial_publish/assets/classes/facebook-php-sdk/facebook.php');
        }

        $config = JComponentHelper::getParams('com_jvsocial_publish');

        $facebook = new Facebook(array(
            'appId'  => $channel->params->app_id,
            'secret' => $channel->params->app_secret
        ));

        $facebook->setAccessToken($channel->params->token);

        if($channel->params->target){
            try{
                $page_info = $facebook->api("/".$channel->params->target."?fields=access_token");
                if(isset($page_info['access_token'])){
                    $facebook->setAccessToken($page_info['access_token']);
                }
            }catch (Exception $e){}
        }

        $postFields = array(
            'message' => $data['message'],
            'picture' => $data['picture'],
            'link' => $data['link'],
            'name' => $data['name'],
            'caption' => $data['caption'],
            'description' => $data['description']
        );

        try{
            if($channel->params->target){
                $ret = $facebook->api('/'.$channel->params->target.'/feed','POST', $postFields);
            }else{
                $ret = $facebook->api('/me/feed','POST', $postFields);
            }
            if($request_id){
                $this->saveRequest(array(
                    'id' => $request_id,
                    'feed_id' => $ret['id'],
                    'state' => 1
                ));
            }else{
                $this->saveRequest(array(
                    'channel_id' => $channel->id,
                    'source' => $channel->source,
                    'source_id' => $data['article_id'],
                    'target' => $channel->params->target,
                    'feed_id' => $ret['id'],
                    'state' => 1
                ));
            }
            if((int)$config->get('font_end_message','1') || JFactory::getApplication()->isAdmin()){
                JFactory::getApplication()->enqueueMessage(JText::sprintf('COM_JVSOCIAL_PUBLISH_REQUESTS_MSG_CHANNEL_SUCCESS', $channel->name));
            }
            return true;
        }catch (Exception $e){
            $error = $e->getResult();
            if(!$request_id && $config->get('save_to_request','1')){
                $this->saveRequest(array(
                    'channel_id' => $channel->id,
                    'source' => $channel->source,
                    'source_id' => $data['article_id'],
                    'target' => $channel->params->target
                ));
            }
            if((int)$config->get('font_end_message','1') || JFactory::getApplication()->isAdmin()){
                JFactory::getApplication()->enqueueMessage(JText::sprintf('COM_JVSOCIAL_PUBLISH_REQUESTS_MSG_CHANNEL_ERROR', $channel->name, $error['error']['code'], $error['error']['message']), 'error');
            }
            return false;
        }
    }

    public function postTwitter($channel, $data, $request_id=0){
        if(!class_exists('TwitterAPIExchange')){
            require_once(JPATH_SITE.'/administrator/components/com_jvsocial_publish/assets/classes/TwitterAPIExchange.php');
        }

        $config = JComponentHelper::getParams('com_jvsocial_publish');

        $settings = array(
            'consumer_key' => $channel->params->consumer_key,
            'consumer_secret' => $channel->params->consumer_secret,
            'oauth_access_token' => $channel->params->token,
            'oauth_access_token_secret' => $channel->params->token_secret
        );

        $postFields = array(
            'status' => $data['status']
        );
        $twitter = new TwitterAPIExchange($settings);
        $rs = json_decode($twitter->buildOauth('https://api.twitter.com/1.1/statuses/update.json', 'POST')->setPostfields($postFields)->performRequest());
        if(isset($rs->errors)){
            if(!$request_id && $config->get('save_to_request','1')){
                $this->saveRequest(array(
                    'channel_id' => $channel->id,
                    'source' => $channel->source,
                    'source_id' => $data['article_id'],
                    'target' => $channel->params->target
                ));
            }
            if((int)$config->get('font_end_message','1') || JFactory::getApplication()->isAdmin()){
                JFactory::getApplication()->enqueueMessage(JText::sprintf('COM_JVSOCIAL_PUBLISH_REQUESTS_MSG_CHANNEL_ERROR', $channel->name, $rs->errors[0]->code, $rs->errors[0]->message), 'error');
            }
            return false;
        }else{
            if($request_id){
                $this->saveRequest(array(
                    'id' => $request_id,
                    'feed_id' => $rs->id,
                    'state' => 1
                ));
            }else{
                $this->saveRequest(array(
                    'channel_id' => $channel->id,
                    'source' => $channel->source,
                    'source_id' => $data['article_id'],
                    'target' => $channel->params->target,
                    'feed_id' => $rs->id,
                    'state' => 1
                ));
            }
            if((int)$config->get('font_end_message','1') || JFactory::getApplication()->isAdmin()){
                JFactory::getApplication()->enqueueMessage(JText::sprintf('COM_JVSOCIAL_PUBLISH_REQUESTS_MSG_CHANNEL_SUCCESS', $channel->name));
            }
            return true;
        }
    }

    public function feeds($article_id, $source='content'){
        $data = $this->getArticle($article_id, $source);
        if($data === false) return;

        $db = JFactory::getDbo();
        $db->setQuery('SELECT * FROM #__jvsocial_publish_channels WHERE source='.$db->quote($source).' AND state=1');
        $channels = $db->loadObjectList();
        foreach($channels as $channel){
            $channel->params = json_decode($channel->params);
            if($channel->post == 'save'){
                $this->saveRequest(array(
                    'channel_id' => $channel->id,
                    'source' => $channel->source,
                    'source_id' => $article_id,
                    'target' => $channel->params->target
                ));
            }else{
                if($channel->type == 'facebook'){
                    $this->postFacebook($channel, $data);
                }else{
                    $this->postTwitter($channel, $data);
                }
            }
        }
    }

    public function process($request_id){
        JTable::addIncludePath(JPATH_SITE.'/administrator/components/com_jvsocial_publish/tables');
        $request = JTable::getInstance('request','Jvsocial_publishTable');
        $request->load($request_id);
        $channel = JTable::getInstance('channel','Jvsocial_publishTable');
        $channel->load($request->channel_id);
        $channel->params = json_decode($channel->params);

        $data = $this->getArticle($request->source_id, $request->source);
        if($data === false) return;

        if($channel->source != $request->source) $channel->source = $request->source;
        if($channel->params->target != $request->target) $channel->params->target = $request->target;
        if($channel->type == 'facebook'){
            return $this->postFacebook($channel, $data, $request_id);
        }else{
            return $this->postTwitter($channel, $data, $request_id);
        }
    }

    /* functions build filter */

    public function buildFilterProcess(){
        $options = array();
        $options[]	= JHtml::_('select.option', '0', JText::_('COM_JVSOCIAL_PUBLISH_STATE_WAIT'));
        $options[]	= JHtml::_('select.option', '1', JText::_('COM_JVSOCIAL_PUBLISH_STATE_COMPLETE'));
        return $options;
    }

    public function buildFilterSource(){
        $options = array();
        $options[]	= JHtml::_('select.option', 'content', JText::_('COM_JVSOCIAL_PUBLISH_SOURCE_CONTENT'));
        if (is_file(JPATH_ROOT.'/administrator/components/com_k2/k2.php') && JComponentHelper::getComponent('com_k2', true)->enabled)
        {
            $options[]	= JHtml::_('select.option', 'k2', JText::_('COM_JVSOCIAL_PUBLISH_SOURCE_K2'));
        }
        return $options;
    }

    public function buildFilterChannel(){
        $options = array();
        $db = JFactory::getDbo();
        $db->setQuery('SELECT * FROM #__jvsocial_publish_channels');
        $channels = $db->loadObjectList();
        foreach($channels as $channel){
            $options[]	= JHtml::_('select.option', $channel->id, $channel->name);
        }
        return $options;
    }

    public function buildFilterType(){
        $options = array();
        $options[]	= JHtml::_('select.option', 'facebook', JText::_('COM_JVSOCIAL_PUBLISH_TYPE_FACEBOOK'));
        $options[]	= JHtml::_('select.option', 'twitter', JText::_('COM_JVSOCIAL_PUBLISH_TYPE_TWITTER'));
        return $options;
    }

    public function buildFilterState(){
        $options = array();
        $options[]	= JHtml::_('select.option', '1', JText::_('JPUBLISHED'));
        $options[]	= JHtml::_('select.option', '0', JText::_('JUNPUBLISHED'));
        return $options;
    }

    public function buildFilterPost(){
        $options = array();
        $options[]	= JHtml::_('select.option', 'auto', JText::_('COM_JVSOCIAL_PUBLISH_POST_AUTO'));
        $options[]	= JHtml::_('select.option', 'save', JText::_('COM_JVSOCIAL_PUBLISH_POST_SAVE'));
        return $options;
    }

    public static function getJoomlaVersion(){
        if(version_compare(JVERSION, '3.0', '<')){
            return 'j2x';
        }else{
            return 'j3x';
        }
    }
}
