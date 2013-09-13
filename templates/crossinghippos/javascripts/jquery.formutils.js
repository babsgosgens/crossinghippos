/* ============================================================
 * jquery.formutils.js v1.0.0 - Script for multi-step forms in Joomla
 * ============================================================
 * Copyright (C) 2013 Online Kollektief - Babs Gösgens. All rights reserved.
 *
 * Version:  1.0
 * ============================================================ */

(function($) {

  $.fn.extend({
    renderReview: function(config){
      return this.each(function(){
        new $.renderReview(this,config);
      });
    },
    loadFragment: function(config){
      return this.each(function(){
        new $.loadFragment(this,config);
      });
    }
  });

  $.renderReview = function(el, config)
  {

    var el = $(el),
        defaults = {
        }
    ;
    config = $.extend( {}, defaults, config );

    // Initialize variables
    var fieldsets = el.find('fieldset.use-for-review'),
        target = $(config.target),
        title = $('<h5 class="progress-title"></h5>').html(target.attr('data-title')),
        steps = $('<ol class="progress"></ol>')
    ;

    // Initialize methods
    var init = function(){

         target.append(title);

         fieldsets.each(function(){

          var t = $(this),
              ttitle = $('<h6 class="progress-step-title"></h6>').html(t.find('legend').html()),
              fields = $(t.find(':input').serializeArray());
              li = $('<li class="progress-step"></li>')
              list = $('<dl></dl>')
          ;


          fields.each(function(i,f){

            var field = findField(f);

            // Fields can be omitted from the auto-populate
            // by giving them an attribute of 'data-omit'
            if(!field.attr('data-omit')) {

              var label = findLabel(field),
                  dt = $('<dt class="progress-incomplete">'+label+':</dt>'),
                  dd = $('<dd><span data-fieldid="'+field.attr('id')+'"></span></dd>')
              ;

              list.append(dt).append(dd);

              field
              .on('change',function(e){
                evaluateField(field, dt);
              })
              .trigger('change');

            }
            // do stuff with fields that have an attribute of 'data-omit'
            else {

            }

          });

          // Populate
          li.append(ttitle).append(list);
          steps.append(li);
          target.append(steps);

         });
        },

        markComplete = function(){

        },

        markIncomplete = function(){

        },

        findField = function(f){
          return el.find('[name="'+f.name+'"]');
        },

        findLabel = function(field){

          console.log(field);

          if(field[0].type!='radio' || field[0].type!='checkbox') {
            return $('label[for="'+field.attr('id')+'"]').html();
          }
          else {

          }
        },

        evaluateField = function(field, dt){

          // @todo Link to frontend form validation

          var value = field.val();
          if(field[0]['type']=="select-one") {
            value = field.find(':selected').text()
          }

          if(field.val()) {
            dt.attr('class','progress-complete').next('dd').find('[data-fieldid]').text(value);
          }
          else {
            dt.attr('class','progress-incomplete').next('dd').find('[data-fieldid]').text('');
          }
        }

    init();

  }

  $.loadFragment = function(el, config)
  {

  }

})(jQuery);