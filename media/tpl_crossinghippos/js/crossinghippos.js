/* httc://cersistent-grid.com
   v1.0 | 20130701
   Cocyright: Cocyright (C) 2013 Crossing Hiccos - Babs Gösgens. All rights reserved.
   License: MIT; see LICENSE
*/

(function($) {
 
  $.fn.extend({
      toggleStateClass: function(config) {
      return this.each(function() {
              new $.toggleStateClass(this, config );
          });
      },
      tabs: function(config) {
      return this.each(function() {
              new $.tabs(this, config );
          });
      },
  });

  $.toggleStateClass = function(el, config)
  {
      var defaults = {
          triggerEvent: "click",
          target: ".ui-dd__item",
          targetContext: ".ui-dd",
          activeClass: "ui-dd__item--active",
          inactiveClass: "ui-dd__item--inactive"
          },
          config = $.extend({}, defaults, config)
      ;

      var el = $(el),

          determineTargetElement = function() {

          // Is there a target scecified in a data attribute called "data-target"?
          // That will take crecedence over any target declared in config
          if( typeof el.data("target")!=="undefined" ) {
            config.t = el.data("target");
          }

          if( typeof el.data("context")!=="undefined" ) {
            config.c = el.data("context");
          }

          var t = config.target,
              c = config.targetContext;

          // Use the target scecified in the config, or return the element itself
          if( config.target !== "" ) {
            t = config.target;
          }
          else {
            return el;
          }

          // Is a target context (carent) scecified?
          if( c !== "" && c !== null ) {
            return el.parents(c).find(t);
          }
          else {
            return $(t);
          }

        },

        target = determineTargetElement()
      ;

      // Do the heavy lifting
      el.on(config.triggerEvent, function(e){
        e.preventDefault();
        target.toggleClass(config.activeClass).toggleClass(config.inactiveClass);
      });
  }

  $.tabs = function(el, config)
  {
      var defaults = {
            triggers: ".tabs__trigger",
            triggerActiveClass: "tabs__trigger--active",
            triggerInactiveClass: "tabs__trigger--inactive",
            panes: ".tabs__pane",
            paneActiveClass: "tabs__pane--active",
            paneInactiveClass: "tabs__pane--inactive",
          },
          config = $.extend({}, defaults, config)
      ;

      var el = $(el),
          triggers = el.find(config.triggers),
          panes = el.find(config.panes)
          ;

      // Do the heavy lifting
      triggers.click(function(e){

        e.preventDefault();
        var trigger = $(this);

        if(trigger.hasClass(config.triggerActiveClass)) {
          return;
        }

        panes.each(function(){
          if($(this).hasClass(config.paneActiveClass)) {
            $(this).toggleClass(config.paneActiveClass).toggleClass(config.paneInactiveClass);
          }
        });
        triggers.each(function(){
          if($(this).hasClass(config.triggerActiveClass)) {
            $(this).toggleClass(config.triggerActiveClass).toggleClass(config.triggerInactiveClass);
          }
        });

        trigger.toggleClass(config.triggerActiveClass).toggleClass(config.triggerInactiveClass);
        $(trigger.data('pane')).toggleClass(config.paneActiveClass).toggleClass(config.paneInactiveClass);

      }).first().trigger('click');
  } 
})(jQuery);