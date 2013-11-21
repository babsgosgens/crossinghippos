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

JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_ERROR_WHEN_GET_ACCESS_TOKEN');
JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_ERROR_WHEN_CHECK_ACCESS_TOKEN');
JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_INVALID_APP_SECRET');
JText::script('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_ERROR_DO_NOT_PERMISSION');

$input = JFactory::getApplication()->input;
$app_id = $input->get('app_id','','string');
$app_secret = $input->get('app_secret','','string');
?>
<script src="//connect.facebook.net/en_UK/all.js" type="text/javascript"></script>
<script type="text/javascript">
    $JVSP(function($){
        function getQueryVariable(query, variable)
        {
            var vars = query.split("&");
            for (var i=0;i<vars.length;i++) {
                var pair = vars[i].split("=");
                if(pair[0] == variable){return pair[1];}
            }
            return(false);
        }

        function checkTokenPermission(token){
            var valid = false;
            $.ajax({
                url: 'https://graph.facebook.com/me/permissions?access_token='+token,
                dataType: 'json',
                async: false,
                beforeSend: function(){},
                success: function(data){
                    var permission = ['publish_actions','publish_stream','user_groups','manage_pages'];

                    if(data.data[0]) $.each(data.data[0], function(key, item){
                        if(key == 'publish_actions' && item == 1) permission.splice(0,1,'');
                        if(key == 'publish_stream' && item == 1) permission.splice(1,1,'');
                        if(key == 'user_groups' && item == 1) permission.splice(2,1,'');
                        if(key == 'manage_pages' && item == 1) permission.splice(3,1,'');
                    });

                    var error = [];

                    $.each(permission, function(key, item){
                        if(item!='') error.push(item);
                    });

                    if(error.length == 0){
                        valid = true;
                    }else{
                        alert(Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_ERROR_DO_NOT_PERMISSION') + error);
                    }
                },
                error: function(jqXHR,textStatus,errorThrown){
                    alert(Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_ERROR_WHEN_CHECK_ACCESS_TOKEN'));
                }
            });

            return valid;
        }

        $(document).ready(function(){
            FB.init({ appId: '<?php echo $app_id;?>', status: true, cookie: true, xfbml: true  });
            var APICall = function(func){
                FB.getLoginStatus(function(response){
                    if(response.status == 'connected'){
                        func(response)
                    }else{
                        FB.login(function (response) {
                            func(response)
                        },{
                            scope: 'publish_actions, publish_stream, user_groups, manage_pages'
                        });
                    }
                });
            };

            APICall(function(response){
                if(response.authResponse.accessToken){
                    $.ajax({
                        url: 'https://graph.facebook.com/oauth/access_token',
                        data: {
                            client_id: '<?php echo $app_id;?>',
                            client_secret: '<?php echo $app_secret;?>',
                            grant_type: 'fb_exchange_token',
                            fb_exchange_token: response.authResponse.accessToken
                        },
                        beforeSend: function(){},
                        success: function(data){
                            var access_token = getQueryVariable(data,'access_token');
                            if(access_token){
                                if(checkTokenPermission(access_token)){
                                    window.opener.ChannelModel.token(access_token);
                                    FB.api('/me?fields=name,picture,username', function(data){
										if(data.id) window.opener.ChannelModel.user_id(data.id);
                                        if(data.name) window.opener.ChannelModel.user_name(data.name);
                                        if(data.username) window.opener.ChannelModel.user_username(data.username);
                                        if(data.picture) window.opener.ChannelModel.user_photo(data.picture.data.url);
										
										window.opener.ChannelModel.targets([]);
                                        window.opener.ChannelModel.pushOption('me', [{id: '', name: data.name}]);

                                        FB.api('/me/groups', function(groups){
											if(groups.data.length>0){
                                                window.opener.ChannelModel.pushOption('groups', groups.data);
												window.opener.ChannelModel.groups(window.opener.ko.toJSON(groups.data));
											}

                                            FB.api('/me/likes', function(pages){
                                                if(pages.data.length>0){
                                                    window.opener.ChannelModel.pushOption('pages', pages.data);
                                                    window.opener.ChannelModel.pages(window.opener.ko.toJSON(pages.data));
                                                }

                                                window.opener.ChannelModel.target('');
                                                window.close();
                                            });
                                        });
                                    });
                                }else{
                                    window.close();
                                }
                            }else{
                                alert(Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_ERROR_WHEN_GET_ACCESS_TOKEN'));
                                window.close();
                            }
                        },
                        error: function(jqXHR,textStatus,errorThrown){
                            alert(Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_INVALID_APP_SECRET'));
                            window.close();
                        }
                    });
                }
            });
        });
    });
</script>

