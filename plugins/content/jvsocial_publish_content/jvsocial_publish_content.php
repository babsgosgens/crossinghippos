<?php
/**
 * @version     1.0.0
 * @package     plg_jvsocial_publish_content
 * @copyright   Copyright (C) 2013. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      joomlavi <info@joomlavi.com> - http://www.joomlavi.com
 */

// No direct access
defined('_JEXEC') or die;

// Check for component
if (!JComponentHelper::getComponent('com_jvsocial_publish', true)->enabled)
{
	JError::raiseWarning('5', 'JV Social Publish Component is not installed or not enabled.');
	return;
}

require_once(JPATH_SITE.'/administrator/components/com_jvsocial_publish/helpers/jvsocial_publish.php');

class PlgContentJVSocial_publish_content extends JPlugin
{
    public function onContentAfterSave($context, $article, $isNew)
	{
        if($context != 'com_content.article' && $context != 'com_content.form' && $context != 'com_k2.item') return;

        $configs = JComponentHelper::getParams('com_jvsocial_publish');

        if($isNew){
            if((int)$configs->get('allow_font_end','0') || JFactory::getApplication()->isAdmin()){
                $this->loadLanguage('com_jvsocial_publish');
                $Jvsocial_publishHelper = new Jvsocial_publishHelper();

                if($context == 'com_content.article' || $context == 'com_content.form'){
                    $Jvsocial_publishHelper->feeds($article->id, 'content');
                }else if($context == 'com_k2.item'){
                    $Jvsocial_publishHelper->feeds($article->id, 'k2');
                }
            }
        }
    }
}
