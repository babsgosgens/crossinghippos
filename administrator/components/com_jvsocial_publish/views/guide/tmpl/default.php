<?php
/**
 * @version     1.0.0
 * @package     com_jvsocial_publish
 * @copyright   Copyright (C) 2013. All rights reserved.
 * @license     GNU General Public License version 2 or later; see LICENSE.txt
 * @author      joomlavi <info@joomlavi.com> - http://www.joomlavi.com
 */
// no direct access
defined('_JEXEC') or die;

if(Jvsocial_publishHelper::getJoomlaVersion() == 'j2x'){
    JHtml::_('behavior.tooltip');
    JHtml::_('behavior.keepalive');
}else{
    JHtml::_('bootstrap.tooltip');
    JHtml::_('behavior.multiselect');
}
JHtml::_('behavior.modal');
?>
<div class="jvsocial-form" name="adminForm">
<?php if (Jvsocial_publishHelper::getJoomlaVersion() == 'j3x' && !empty( $this->sidebar)){ ?>
    <div id="j-sidebar-container" class="span2">
        <?php echo $this->sidebar; ?>
    </div>
    <div id="j-main-container" class="span10">
<?php }else{ ?>
    <div id="j-main-container">
<?php }?>
        <ul class="nav nav-tabs" id="guideTab">
            <li><a href="#fbapi" data-toggle="tab"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_GUIDE_TAB_CREATE_FACEBOOK_API');?></a></li>
            <li><a href="#twapi" data-toggle="tab"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_GUIDE_TAB_CREATE_TWITTER_API');?></a></li>
            <li><a href="#template" data-toggle="tab"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_GUIDE_TAB_TEMPLATE');?></a></li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane" id="fbapi">
                <p class="alert alert-info"><span class='badge badge-info'>1</span> <?php echo JText::_('COM_JVSOCIAL_PUBLISH_GUIDE_FB1');?></p>
                <p><a class="modal thumbnail" href="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/fbapi1.jpg""><img style="width: 50%" src="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/fbapi1.jpg"></a></p>
                <p class="alert alert-info"><span class="badge badge-info">2</span> <?php echo JText::_('COM_JVSOCIAL_PUBLISH_GUIDE_FB2');?></p>
                <p><a class="modal thumbnail" href="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/fbapi2.jpg""><img style="width: 50%" src="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/fbapi2.jpg"></a></p>
                <p><a class="modal thumbnail" href="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/fbapi3.jpg""><img style="width: 50%" src="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/fbapi3.jpg"></a></p>
                <p class="alert alert-info"><span class="badge badge-info">3</span> <?php echo JText::_('COM_JVSOCIAL_PUBLISH_GUIDE_FB3');?></p>
                <p><a class="modal thumbnail" href="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/fbapi4.jpg""><img style="width: 50%" src="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/fbapi4.jpg"></a></p>
                <p class="alert alert-info"><span class="badge badge-info">4</span> <?php echo JText::_('COM_JVSOCIAL_PUBLISH_GUIDE_FB4');?></p>
            </div>
            <div class="tab-pane" id="twapi">
                <p class="alert alert-info"><span class="badge badge-info">1</span> <?php echo JText::_('COM_JVSOCIAL_PUBLISH_GUIDE_TW1');?></p>
                <p><a class="modal thumbnail" href="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/twapi1.jpg""><img style="width: 50%" src="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/twapi1.jpg"></a></p>
                <p class="alert alert-info"><span class="badge badge-info">2</span> <?php echo JText::_('COM_JVSOCIAL_PUBLISH_GUIDE_TW2');?></p>
                <p><a class="modal thumbnail" href="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/twapi2.jpg""><img style="width: 50%" src="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/twapi2.jpg"></a></p>
                <p class="alert alert-info"><span class="badge badge-info">3</span> <?php echo JText::_('COM_JVSOCIAL_PUBLISH_GUIDE_TW3');?></p>
                <p><a class="modal thumbnail" href="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/twapi3.jpg""><img style="width: 50%" src="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/twapi3.jpg"></a></p>
                <p class="alert alert-info"><span class="badge badge-info">4</span> <?php echo JText::_('COM_JVSOCIAL_PUBLISH_GUIDE_TW4');?></p>
                <p><a class="modal thumbnail" href="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/twapi4.jpg""><img style="width: 50%" src="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/twapi4.jpg"></a></p>
                <p class="alert alert-info"><span class="badge badge-info">5</span> <?php echo JText::_('COM_JVSOCIAL_PUBLISH_GUIDE_TW5');?></p>
                <p><a class="modal thumbnail" href="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/twapi5.jpg""><img style="width: 50%" src="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/twapi5.jpg"></a></p>
                <p class="alert alert-info"><span class="badge badge-info">6</span> <?php echo JText::_('COM_JVSOCIAL_PUBLISH_GUIDE_TW6');?></p>
            </div>
            <div class="tab-pane" id="template">
                <p class="alert alert-info"><span class="badge badge-info">1</span> <?php echo JText::_('COM_JVSOCIAL_PUBLISH_GUIDE_FACEBOOK_TEMPLATE');?></p>
                <p><a class="modal thumbnail" href="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/fbtemplate.jpg""><img style="width: 50%" src="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/fbtemplate.jpg"></a></p>
                <p class="alert alert-info"><span class="badge badge-info">2</span> <?php echo JText::_('COM_JVSOCIAL_PUBLISH_GUIDE_TWITTER_TEMPLATE');?></p>
                <p><a class="modal thumbnail" href="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/twtemplate.jpg""><img style="width: 50%" src="<?php echo JURI::base(true);?>/components/com_jvsocial_publish/assets/images/guides/twtemplate.jpg"></a></p>
            </div>
        </div>
    <?php if(Jvsocial_publishHelper::getJoomlaVersion() == 'j3x'){?>
    </div>
    <?php }?>
</div>

<script type="text/javascript">
    $JVSP(function($){
        $('#guideTab a:first').tab('show');
    })
</script>
