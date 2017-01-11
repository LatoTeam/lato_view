var ActionBar = (function($) {
  'use strict';

   /*
  * Manage responsive Action Bar component - moves the unnecessary elements to a separate menu.
  * @params: -
  * @return: undefined
  */
  var _responsiveActionBar = function() {
    var resizing = false;
    var $actionBar = $('.action-bar');
    var $actionRemove = $actionBar.find('.action-remove');

    function _detachElements(elements) {
      $(elements).detach();
    }
     
    var moveActionBarElement = Util.debounce(function() {

      if($actionRemove.length) {
        $actionBar.each(function(index, el) {
          var $elToRemove = $(el).find('.action-remove');
          var $actionHolder = $(el).find('.action-nav-menu');
          var $header = $('.main-navigation-header');

          var dataAttrs = [];
          $elToRemove.each(function(index, el) {
            dataAttrs.push($(el).data('position'));
          });

          if ( Modernizr.mq("only screen and (max-width: 1070px)")) {
            _detachElements($elToRemove);
            $elToRemove.appendTo($actionHolder);
          } else if ( Modernizr.mq("only screen and (min-width: 1071px)") ) {
            _detachElements($elToRemove);
            $elToRemove.each(function(index, el) {
              $(el).appendTo($elToRemove.eq(0));
            });
            $header.find('.nav-logo').after($elToRemove);
          }
        });

        resizing = false;
      }

    }, 200);

    moveActionBarElement();
    $(window).on('resize', function() {
      if( !resizing ) {
        window.requestAnimationFrame(moveActionBarElement);
        resizing = true;
      }
    });
  };

  var init = function() {
    _responsiveActionBar();
  };

  return {
    init: init
  };
  
})(jQuery);