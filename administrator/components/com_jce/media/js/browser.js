/* JCE Editor - 2.3.4RC7 | 14 November 2013 | http://www.joomlacontenteditor.net | Copyright (C) 2006 - 2013 Ryan Demmer. All rights reserved | GNU/GPL Version 2 or later - http://www.gnu.org/licenses/gpl-2.0.html */
(function($){$.WFBrowserWidget={options:{element:null,plugin:{plugin:'browser',root:'',site:'',help:function(e){var win=window.parent;$.Dialog.iframe('Help','index.php?option=com_jce&view=help&tmpl=component&section=editor&category=browser',{width:768,height:520});}},manager:{upload:{insert:false},expandable:false}},init:function(options){var self=this,win=window.parent,doc=win.document;$.extend(true,this.options,options);$('<input type="hidden" id="src" value="" />').appendTo(document.body);$.Plugin.init(this.options.plugin);$('button#insert, button#cancel').hide();if(this.options.element){$('button#insert').show().click(function(e){self.insert();self.close();e.preventDefault();});$('button#cancel').show().click(function(e){self.close();e.preventDefault();});var src=doc.getElementById(this.options.element).value||'';$('#src').val(src);}
WFFileBrowser.init($('#src'),$.extend(this.options.manager,{}));},insert:function(){if(this.options.element){var src=WFFileBrowser.getSelectedItems(0);window.parent.document.getElementById(this.options.element).value=$(src).data('url')||'';}},close:function(){var win=window.parent;if(typeof win.$jce!=='undefined'){return win.$jce.closeDialog('#'+this.options.element+'_browser');}
if(typeof win.SqueezeBox!=='undefined'){return win.SqueezeBox.close();}}};})(jQuery);var tinyMCE={addI18n:function(p,o){return jQuery.Plugin.addI18n(p,o);}};