var ManualModel = (function($){
    return function(data){
        var self = this;
        self.loading = ko.observable(false);
        this.channel = ko.observable('');
        this.user_id = ko.observable('');
        this.user_name = ko.observable('');
        this.user_username = ko.observable('');
        this.user_photo = ko.observable('');
        this.type = ko.observable('');

        this.target = ko.observable('');
        this.targets = ko.observableArray([]);

        this.source = ko.observable('');
        this.source_id = ko.observable('');

        this.ucwords = function(str){
            return (str + '').replace(/^([a-z\u00E0-\u00FC])|\s+([a-z\u00E0-\u00FC])/g, function ($1) {
                return $1.toUpperCase();
            });
        }

        this.option = function(name, value){
            this.name = name;
            this.value = value;
        }

        this.optionGroup = function(label, children){
            this.label = ko.observable(label);
            this.children = ko.observableArray(children);
        }

        this.pushOption = function(type, array){
            var label;
            if(type == 'me') label = Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_TARGET_ME');
            if(type == 'groups') label = Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_TARGET_GROUPS');
            if(type == 'pages') label = Joomla.JText._('COM_JVSOCIAL_PUBLISH_CHANNEL_TARGET_PAGES');

            var groupList = [];
            $.each(array, function(i, item){
                groupList.push( new self.option(item.name, item.id));
            });

            if(label){
                self.targets.push(
                    new self.optionGroup(label, groupList)
                );
            }else{
                label = type;
                self.sources.push(
                    new self.optionGroup(label, groupList)
                )
            }
        }

        this.channel.subscribe(function(value){
            self.type('');
            self.target('');
            self.targets([]);
            self.source('');
            if(value){
                $.each(data, function(i, item){
                    if(value == item.id){
                        self.type(self.ucwords(item.type));
                        self.source(item.source);
                        self.user_id(item.params.user_id);
                        self.user_name(item.params.user_name);
                        self.user_username(item.params.user_username);
                        self.user_photo(item.params.user_photo);
                        if(item.params.user_name){
                            self.pushOption('me', [{id: '', name: item.params.user_name}]);
                        }
                        if(item.params.groups){
                            self.pushOption('groups', item.params.groups);
                        }
                        if(item.params.pages){
                            self.pushOption('pages', item.params.pages);
                        }
                        self.target(item.params.target);
                    }
                });
            }
        });

        this.sources = ko.observableArray([]);
        this.source.subscribe(function(value){
            self.sources([]);
            self.source_id('');
            if(value){
                $.ajax({
                    url: 'index.php?option=com_jvsocial_publish&task=manual_post.getArticles',
                    data:{source: self.source().toLocaleLowerCase()},
                    dataType: 'json',
                    beforeSend: function(){
                        self.loading(true);
                    },
                    success: function(data){
                        self.loading(false);
                        $.each(data, function(i, item){
                           if(!i && item.children[0]) self.source_id(item.children[0].id);
                           self.pushOption(item.label, item.children);
                        });
                    }
                })
            }
        });

    	this.checkValid = function(){
            valid = true;
            if(!self.channel()){
                valid = false;
                $.pnotify({text: Joomla.JText._('COM_JVSOCIAL_PUBLISH_MANUAL_POST_REQUIRE_CHANNEL'), type:'error'});
            }
            if(!self.source()){
                valid = false;
                $.pnotify({text: Joomla.JText._('COM_JVSOCIAL_PUBLISH_MANUAL_POST_REQUIRE_SOURCE'), type:'error'});
            }
            if(!self.source_id()){
                valid = false;
                $.pnotify({text: Joomla.JText._('COM_JVSOCIAL_PUBLISH_MANUAL_POST_REQUIRE_ARTICLE'), type:'error'});
            }

            return valid;
        }
    }
})($JVSP);

$JVSP(document).ready(function($){
    $.pnotify.defaults.delay = 5000;
});