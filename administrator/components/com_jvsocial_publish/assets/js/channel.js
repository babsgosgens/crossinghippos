var ChannelModel = (function($){
    return function(data){
        var self = this;
        this.type = ko.observable(data.type);
        this.loading = ko.observable(false);
        this.error = ko.observable(false);
        this.errorHtml = ko.observable('');
		
		this.option = function(name, value){
			this.name = name;
			this.value = value;
		}
		
		this.optionGroup = function(label, children){
			this.label = ko.observable(label);
			this.children = ko.observableArray(children);
		}

        this.pushOption = function(type, array){
            var label = Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_TARGET_ME');
            if(type == 'groups') label = Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_TARGET_GROUPS');
            if(type == 'pages') label = Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_TARGET_PAGES');
            var groupList = [];
            $.each(array, function(i, item){
                groupList.push( new self.option(item.name, item.id));
            });
            self.targets.push(
                new self.optionGroup(label, groupList)
            );
        }

        this.targets = ko.observableArray([]);
		this.target = ko.observable(data.params.target);

        if(data.params.user_name){
            this.pushOption('me', [{id: '', name: data.params.user_name}]);
        }

        if(data.params.groups){
            this.groups = ko.observable(ko.toJSON(data.params.groups));
            this.pushOption('groups', data.params.groups);
        }else{
            this.groups = ko.observable('');
        }

        if(data.params.pages){
            this.pages = ko.observable(ko.toJSON(data.params.pages));
            this.pushOption('pages', data.params.pages);
        }else{
            this.pages = ko.observable('');
        }

        this.app_id = ko.observable(data.params.app_id);
        this.app_secret = ko.observable(data.params.app_secret);

        this.consumer_key = ko.observable(data.params.consumer_key);
        this.consumer_secret = ko.observable(data.params.consumer_secret);

        this.token = ko.observable(data.params.token);
        this.token_secret = ko.observable(data.params.token_secret);

        this.user_id = ko.observable(data.params.user_id);
        this.user_name = ko.observable(data.params.user_name);
        this.user_username = ko.observable(data.params.user_username);
        this.user_photo = ko.observable(data.params.user_photo);

        this.getQueryVariable = function(query, variable)
        {
            var vars = query.split("&");
            for (var i=0;i<vars.length;i++) {
                var pair = vars[i].split("=");
                if(pair[0] == variable){return pair[1];}
            }
            return(false);
        }

        this.changeType = function(){
            self.token('');
            self.token_secret('')
            self.user_id('');
            self.user_name('');
            self.user_username('');
            self.user_photo('');
            self.targets([]);
        }

        this.getToken = function(){
            self.checkValid();
            self.error(false);
            self.user_id('');
            self.user_name('');
            self.user_username('');
            self.user_photo('');
            self.targets([]);
            if(self.type()=='facebook' && self.app_id() && self.app_secret()){
                self.token('');
                $.ajax({
                    url: 'https://graph.facebook.com/'+self.app_id(),
                    dataType: 'json',
                    beforeSend: function(){
                        self.loading(true);
                    },
                    success: function(data){
                        if(typeof(data.icon_url) != 'undefined'){
                            self.loading(false);
                            var w = 550;
                            var h = 450;
                            var left = (screen.width/2)-(w/2);
                            var top = (screen.height/2)-(h/2);
                            window.open('index.php?option=com_jvsocial_publish&view=channel&layout=connect_facebook&tmpl=component&app_id='+self.app_id()+'&app_secret='+self.app_secret(), 'Get Access Token', 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left).focus();
                        }else{
                            self.loading(false);
                            self.error(true);
                            self.errorHtml(Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_INVALID_APP_ID'));
                        }
                    },
                    error: function(){
                        self.loading(false);
                        self.error(true);
                        self.errorHtml(Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_INVALID_APP_ID'));
                    }
                });
            }

            if(self.type()=='twitter' && self.consumer_key() && self.consumer_secret() && self.token() && self.token_secret()){
                $.ajax({
                    url: 'index.php?option=com_jvsocial_publish&task=channel.verifyCredentials',
                    data: {
                        consumer_key: self.consumer_key(),
                        consumer_secret: self.consumer_secret(),
                        token: self.token(),
                        token_secret: self.token_secret()
                    },
                    type: 'post',
                    dataType: 'json',
                    beforeSend: function(){
                        self.loading(true);
                    },
                    success: function(data){
                        self.loading(false);
                        if(data.rs == '1'){
                            self.user_id(data.id);
                            self.user_name(data.name);
                            self.user_username(data.username);
                            self.user_photo(data.photo);
                            self.pushOption('me', [{id: '', name: data.name}]);
                        }else{
                            self.error(true);
                            self.errorHtml(data.msg);
                        }
                    }
                });
            }
        }

        this.checkValid = function(save){
            if(!save) save = false;
            var valid = true;
            if($('#jform_name').val()=='' && save){
                valid = false;
                $.pnotify({text: Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_REQUIRE_NAME'), type:'error'});
            }
            if(!this.type()){
                valid = false;
                $.pnotify({text: Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_REQUIRE_TYPE'), type:'error'});
            }
            if(!valid) return valid;

            if(this.type() == 'facebook'){
                if(!this.app_id()){
                    valid = false;
                    $.pnotify({text: Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_REQUIRE_APP_ID'), type:'error'});
                }
                if(!this.app_secret()){
                    valid = false;
                    $.pnotify({text: Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_REQUIRE_APP_SECRET'), type:'error'});
                }
                if(!this.token() && save){
                    valid = false;
                    $.pnotify({text: Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_REQUIRE_ACCESS_TOKEN'), type:'error'});
                }
            }
            if(!valid) return valid;

            if(this.type() == 'twitter'){
                if(!this.consumer_key()){
                    valid = false;
                    $.pnotify({text: Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_REQUIRE_CONSUMER_KEY'), type:'error'});
                }
                if(!this.consumer_secret()){
                    valid = false;
                    $.pnotify({text: Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_REQUIRE_CONSUMER_SECRET'), type:'error'});
                }
                if(!this.token()){
                    valid = false;
                    $.pnotify({text: Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_REQUIRE_ACCESS_TOKEN'), type:'error'});
                }
                if(!this.token_secret()){
                    valid = false;
                    $.pnotify({text: Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_REQUIRE_ACCESS_TOKEN_SECRET'), type:'error'});
                }
            }

            if(!valid) return valid;

            if(!this.user_id() && save){
                valid = false;
                if(this.type() == 'facebook'){
                    $.pnotify({text: Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_GET_ACCESS_TOKEN'), type:'error'});
                }else{
                    $.pnotify({text: Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_MSG_VERIFY_CREDENTIALS'), type:'error'});
                }
            }

            return valid;
        }
    }
})($JVSP);

$JVSP(document).ready(function($){
    Joomla.submitbutton = function(task)
    {
        if (task == 'channel.cancel') {
            Joomla.submitform(task, document.getElementById('channel-form'));
        }
        else{
            if(ChannelModel.checkValid(true))
                Joomla.submitform(task, document.getElementById('channel-form'));
        }
    }

    $('#jform_type').change(function(){
        ChannelModel.changeType();
    });

    $.pnotify.defaults.delay = 5000;
});