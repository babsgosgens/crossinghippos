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
    JHTML::_('script','system/multiselect.js',false,true);
}else{
    JHtml::_('bootstrap.tooltip');
    JHtml::_('behavior.multiselect');
}

JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_TARGET_ME');
JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_TARGET_GROUPS');
JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_TARGET_PAGES');

JText::script('COM_JVSOCIAL_PUBLISH_MANUAL_POST_REQUIRE_CHANNEL');
JText::script('COM_JVSOCIAL_PUBLISH_MANUAL_POST_REQUIRE_SOURCE');
JText::script('COM_JVSOCIAL_PUBLISH_MANUAL_POST_REQUIRE_ARTICLE');
?>

<form action="<?php echo JRoute::_('index.php?option=com_jvsocial_publish&view=manual_post'); ?>" method="post" name="adminForm" id="manual_post-form" class="jvsocial-form">
<?php if (Jvsocial_publishHelper::getJoomlaVersion() == 'j3x' && !empty( $this->sidebar)){ ?>
    <div id="j-sidebar-container" class="span2">
    <?php echo $this->sidebar; ?>
    </div>
    <div id="j-main-container" class="span10">
<?php }else{ ?>
    <div id="j-main-container">
<?php }?>
        <div id="channel_loading">
            <img src="<?php echo JURI::base(true).'/components/com_jvsocial_publish/assets/images/loading.gif'?>">
        </div>
        <div id="channel_details" class="row-fluid form-horizontal">
            <div class="span6">
                <div>
                    <legend><?php echo JText::_('COM_JVSOCIAL_PUBLISH_LEGEND_CHANNEL_DATA')?></legend>
                    <div>
                        <div class="control-group">
                            <label class="control-label" for="jform_channel"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_TITLE_CHANNEL')?><span class="star">&nbsp;*</span></label>
                            <div class="controls">
                                <select name="jform[channel]" id="jform_channel" data-bind="value: channel">
                                    <option value=""><?php echo JText::_('COM_JVSOCIAL_PUBLISH_SELECT_CHANNEL');?></option>
                                    <?php if($this->items) foreach($this->items as $item){?>
                                        <option value="<?php echo $item->id;?>"><?php echo $item->name;?></option>
                                    <?php }?>
                                </select>
                            </div>
                        </div>
                        <div class="control-group" data-bind="visible: type">
                            <label class="control-label" for="jform_type"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_TYPE')?></label>
                            <div class="controls">
                                <input type="text" id="jform_type" readonly="true" data-bind="value: type"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div data-bind="visible: channel">
                    <legend><?php echo JText::_('COM_JVSOCIAL_PUBLISH_LEGEND_CHANNEL_USER')?></legend>
                    <div>
                        <div class="control-group">
                            <label class="control-label" for="jform_params_user_id"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_USER_ID')?></label>
                            <div class="controls">
                                <input type="text" id="jform_params_user_id" readonly="true" data-bind="value: user_id">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="jform_params_user_name"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_USER_NAME')?></label>
                            <div class="controls">
                                <input type="text" id="jform_params_user_name" readonly="true" data-bind="value: user_name">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="jform_params_user_username"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_USER_USERNAME')?></label>
                            <div class="controls">
                                <input type="text" id="jform_params_user_username" readonly="true" data-bind="value: user_username">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_USER_PICTURE')?></label>
                            <div class="controls">
                                <img src="" data-bind="attr:{src: user_photo}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="span6">
                <legend><?php echo JText::_('COM_JVSOCIAL_PUBLISH_LEGEND_MANUAL_POST_CUSTOM_POST')?></legend>
                <div>
                    <div class="alert alert-warning" data-bind="visible: !channel()"><?php echo JText::sprintf('COM_JVSOCIAL_PUBLISH_MSG_SELECT_FIRST','<span class="label label-info">'.JText::_('COM_JVSOCIAL_PUBLISH_TITLE_CHANNEL').'</span>');?></div>
                    <div data-bind="visible: channel">

                        <div class="control-group" data-bind="visible: type() == 'Facebook' && targets().length">
                            <label class="control-label" for="jform_target"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_TARGET')?></label>
                            <div class="controls">
                                <select id="jform_target" name="jform[target]" data-bind="foreach: targets, value: target">
                                    <optgroup data-bind="attr: {label: label}, foreach: children">
                                        <option data-bind="text: name, attr:{value: $data.value}"></option>
                                    </optgroup>
                                </select>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="jform_source"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_SOURCE')?><span class="star">&nbsp;*</span></label>
                            <div class="controls">
                                <select name="jform[source]" id="jform_source" data-bind="value: source">
                                    <option value=""><?php echo JText::_('COM_JVSOCIAL_PUBLISH_SELECT_SOURCE')?></option>
                                    <?php foreach($this->f_source as $source){?>
                                    <option value="<?php echo $source->value;?>"><?php echo $source->text;?></option>
                                    <?php }?>
                                </select>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="jform_source_id"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_MANUAL_POST_ARTICLE')?><span class="star">&nbsp;*</span></label>
                            <div class="controls">
                                <select id="jform_source_id" name="jform[source_id]" data-bind="foreach: sources, value: source_id, visible: source() && sources().length">
                                    <optgroup data-bind="attr: {label: label}, foreach: children">
                                        <option data-bind="text: name, attr:{value: $data.value}"></option>
                                    </optgroup>
                                </select>
                                <img class="jvsocial-loading" src="<?php echo JURI::base(true).'/components/com_jvsocial_publish/assets/images/loading.gif'?>" data-bind="visible: loading">
                                <div class="alert alert-warning" data-bind="visible: !source()"><?php echo JText::sprintf('COM_JVSOCIAL_PUBLISH_MSG_SELECT_FIRST','<span class="label label-info">'.JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_SOURCE').'</span>');?></div>
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <button class="btn btn-primary" type="button" onclick="Joomla.submitbutton('manual_post.post')"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_REQUESTS_POST_TO_CHANNEL');?></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <?php if(Jvsocial_publishHelper::getJoomlaVersion() == 'j3x'){?>
    </div>
    <?php }?>
	<div>
		<input type="hidden" name="task" value="" />
		<?php echo JHtml::_('form.token'); ?>
	</div>
</form>

<script type="text/javascript">
    $JVSP(document).ready(function($){
        $.ajax({
            url: 'index.php?option=com_jvsocial_publish&task=manual_post.getAjaxItem',
            dataType: 'json',
            beforeSend: function(){
                $('#channel_details').hide();
            },
            success: function(data){
                $('#channel_loading').hide();
                $('#channel_details').show();
                window.ManualModel = new ManualModel(data);
                ko.applyBindings(window.ManualModel);
            }
        });

        Joomla.submitbutton = function(task)
        {
            if(ManualModel.checkValid()) Joomla.submitform(task, document.getElementById('manual_post-form'));
        }
    })
</script>