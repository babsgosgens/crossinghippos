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

JHtml::_('behavior.tooltip');
JHtml::_('behavior.keepalive');
JHtml::_('behavior.formvalidation');

JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_REQUIRE_NAME');
JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_REQUIRE_TYPE');
JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_REQUIRE_APP_ID');
JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_REQUIRE_APP_SECRET');
JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_REQUIRE_CONSUMER_KEY');
JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_REQUIRE_CONSUMER_SECRET');
JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_REQUIRE_ACCESS_TOKEN');
JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_REQUIRE_ACCESS_TOKEN_SECRET');
JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_INVALID_APP_ID');
JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_GET_ACCESS_TOKEN');
JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_VERIFY_CREDENTIALS');

JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_TARGET_ME');
JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_TARGET_GROUPS');
JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_TARGET_PAGES');

if($this->item->created_by && JFactory::getUser($this->item->created_by)->name){
    $author = JFactory::getUser($this->item->created_by)->name;
}else{
    $user = JFactory::getUser();
    $author = $user->name;
    $this->item->created_by = $user->id;
}

if(!$this->item->created){
    $date = new JDate();
    $this->item->created = $date->toSql();
}
?>
<script src="//connect.facebook.net/en_UK/all.js" type="text/javascript"></script>

<form action="<?php echo JRoute::_('index.php?option=com_jvsocial_publish&layout=edit&id=' . (int) $this->item->id); ?>" method="post" name="adminForm" id="channel-form" class="jvsocial-form form-validate">
    <input type="hidden" name="task" value="" />
    <?php echo JHtml::_('form.token'); ?>

    <div class="row-fluid">
        <div class="span6 form-horizontal">
            <div id="channel_data">
                <legend><?php echo JText::_('COM_JVSOCIAL_PUBLISH_LEGEND_CHANNEL_DATA')?></legend>
                <div>
                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('id')?></div>
                        <div class="controls"><?php echo $this->form->getInput('id')?></div>
                    </div>

                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('name')?></div>
                        <div class="controls"><?php echo $this->form->getInput('name')?></div>
                    </div>

                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('type')?></div>
                        <div class="controls"><?php echo $this->form->getInput('type')?></div>
                    </div>

                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('source')?></div>
                        <div class="controls"><?php echo $this->form->getInput('source')?></div>
                    </div>

                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('post')?></div>
                        <div class="controls"><?php echo $this->form->getInput('post')?></div>
                    </div>

                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('description')?></div>
                        <div class="controls"><?php echo $this->form->getInput('description')?></div>
                    </div>

                    <div class="control-group">
                        <div class="control-label"><?php echo $this->form->getLabel('state')?></div>
                        <div class="controls"><?php echo $this->form->getInput('state')?></div>
                    </div>
                </div>
            </div>

            <div id="channel_publish">
                <legend><?php echo JText::_('COM_JVSOCIAL_PUBLISH_LEGEND_CHANNEL_PUBLISHING')?></legend>
                <div>
                    <div class="control-group">
                        <label class="control-label" for="jform_created"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_CREATED')?></label>
                        <div class="controls">
                            <input type="text" name="jform[created]" id="jform_created" value="<?php echo $this->item->created;?>" readonly="true">
                        </div>
                    </div>

                    <div class="control-group">
                        <label class="control-label" for="jform_author"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_CREATED_BY')?></label>
                        <div class="controls">
                            <input type="text" name="jform[created_by]" id="jform_author" value="<?php echo $author;?>" readonly="true">
                            <input type="hidden" name="jform[created_by]" id="jform_created_by" value="<?php echo $this->item->created_by;?>" readonly="true">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="span6 form-horizontal">
            <div id="channel_loading">
                <img src="<?php echo JURI::base(true).'/components/com_jvsocial_publish/assets/images/loading.gif'?>">
            </div>
            <div id="channel_details">
                <div>
                    <legend><?php echo JText::_('COM_JVSOCIAL_PUBLISH_LEGEND_CHANNEL_DETAILS')?></legend>
                    <div>
                        <div class="alert" data-bind="visible: !type()">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <?php echo JText::sprintf('COM_JVSOCIAL_PUBLISH_MSG_SELECT_FIRST','<span class="label label-info">'.JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_TYPE').'</span>');?>
                        </div>

                        <div class="control-group" data-bind="visible: type() == 'facebook'">
                            <label class="control-label required" for="jform_params_app_id"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_APP_ID')?><span class="star">&nbsp;*</span></label>
                            <div class="controls">
                                <input class="required" type="text" name="jform[params][app_id]" id="jform_params_app_id" data-bind="value: app_id">
                            </div>
                        </div>

                        <div class="control-group" data-bind="visible: type() == 'facebook'">
                            <label class="control-label required" for="jform_params_app_secret"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_APP_SECRET')?><span class="star">&nbsp;*</span></label>
                            <div class="controls">
                                <input class="required" type="text" name="jform[params][app_secret]" id="jform_params_app_secret" data-bind="value: app_secret">
                            </div>
                        </div>

                        <div class="control-group" data-bind="visible: type() == 'facebook'">
                            <div class="controls">
                                <button class="btn btn-primary" type="button" data-bind="click: getToken"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_CHANNEL_BUTTON_GET_ACCESS_TOKEN')?></button>
                                <img class="jvsocial-loading" src="<?php echo JURI::base(true).'/components/com_jvsocial_publish/assets/images/loading.gif'?>" data-bind="visible: loading">
                            </div>
                        </div>

                        <div class="control-group" data-bind="visible: type() == 'twitter'">
                            <label class="control-label required" for="jform_params_consumer_key"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_CONSUMER_KEY')?><span class="star">&nbsp;*</span></label>
                            <div class="controls">
                                <input class="required" type="text" name="jform[params][consumer_key]" id="jform_params_consumer_key" data-bind="value: consumer_key">
                            </div>
                        </div>

                        <div class="control-group" data-bind="visible: type() == 'twitter'">
                            <label class="control-label required" for="jform_params_consumer_secret"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_CONSUMER_SECRET')?><span class="star">&nbsp;*</span></label>
                            <div class="controls">
                                <input class="required" type="text" name="jform[params][consumer_secret]" id="jform_params_consumer_secret" data-bind="value: consumer_secret">
                            </div>
                        </div>

                        <div class="control-group" data-bind="visible: type">
                            <label class="control-label required" for="jform_params_token"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_ACCESS_TOKEN');?><span class="star">&nbsp;*</span></label>
                            <div class="controls">
                                <input type="text" class="required" name="jform[params][token]" id="jform_params_token" data-bind="value: token, attr: {readonly: type()=='facebook'}">
                            </div>
                        </div>

                        <div class="control-group" data-bind="visible: type() == 'twitter'">
                            <label class="control-label required" for="jform_params_token_secret"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_ACCESS_TOKEN_SECRET')?><span class="star">&nbsp;*</span></label>
                            <div class="controls">
                                <input type="text" class="required" name="jform[params][token_secret]" id="jform_params_token_secret" data-bind="value: token_secret">
                            </div>
                        </div>

                        <div class="control-group" data-bind="visible: type() == 'twitter'">
                            <div class="controls">
                                <button class="btn btn-primary" type="button" data-bind="click: getToken"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_CHANNEL_BUTTON_VERIFY_CREDENTIALS');?></button>
                                <img class="jvsocial-loading" src="<?php echo JURI::base(true).'/components/com_jvsocial_publish/assets/images/loading.gif'?>" data-bind="visible: loading">
                            </div>
                        </div>

                        <div class="control-group" data-bind="visible: type() == 'facebook' && targets().length">
                            <label class="control-label" for="jform_params_target"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_TARGET')?></label>
                            <div class="controls">
                                <select id="jform_params_target" name="jform[params][target]" data-bind="foreach: targets, value: target">
                                    <optgroup data-bind="attr: {label: label}, foreach: children">
                                        <option data-bind="text: name, attr:{value: $data.value}"></option>
                                    </optgroup>
                                </select>
                                <input type="hidden" name="jform[params][groups]" data-bind="value: groups"/>
                                <input type="hidden" name="jform[params][pages]" data-bind="value: pages"/>
                            </div>
                        </div>

                        <div class="alert alert-error" data-bind="visible: error, html: errorHtml"></div>
                    </div>
                </div>

                <div data-bind="visible: user_id() && user_name() && user_username() && user_photo()">
                    <legend><?php echo JText::_('COM_JVSOCIAL_PUBLISH_LEGEND_CHANNEL_USER')?></legend>
                    <div>
                        <div class="control-group">
                            <label class="control-label" for="jform_params_user_id"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_USER_ID')?></label>
                            <div class="controls">
                                <input type="text" name="jform[params][user_id]" id="jform_params_user_id" readonly="true" data-bind="value: user_id">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="jform_params_user_name"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_USER_NAME')?></label>
                            <div class="controls">
                                <input type="text" name="jform[params][user_name]" id="jform_params_user_name" readonly="true" data-bind="value: user_name">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="jform_params_user_username"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_USER_USERNAME')?></label>
                            <div class="controls">
                                <input type="text" name="jform[params][user_username]" id="jform_params_user_username" readonly="true" data-bind="value: user_username">
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="jform_params_user_photo"><?php echo JText::_('COM_JVSOCIAL_PUBLISH_FORM_LBL_CHANNEL_USER_PICTURE')?></label>
                            <div class="controls">
                                <img src="" data-bind="attr:{src: user_photo}">
                                <input type="hidden" name="jform[params][user_photo]" id="jform_params_user_photo" readonly="true" data-bind="value: user_photo">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</form>

<script type="text/javascript">
    $JVSP(document).ready(function($){
        $.ajax({
            url: 'index.php?option=com_jvsocial_publish&task=channel.getAjaxItem',
            data: {id: <?php echo $this->item->id ? $this->item->id : 0;?>},
            dataType: 'json',
            beforeSend: function(){
                $('#channel_details').hide();
            },
            success: function(data){
                $('#channel_loading').hide();
                $('#channel_details').show();
                window.ChannelModel = new ChannelModel(data);
                ko.applyBindings(window.ChannelModel);
            }
        });
    });
</script>

