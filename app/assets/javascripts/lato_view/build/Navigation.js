var Navigation = (function($) {
  'use strict';

  /*
  * Debounced function which manages the click handler for the dropdown's list-item.
  * @params: -
  * @return: undefined
  */
  var sidebarDropdown = Util.debounce(function() {
    var $sidebarListItem = $('.sidebar-list-item');

    if(Modernizr.mq("only screen and (max-width: 1023px)")) {
      $(document).on('click', '.sidebar-main-link', function(event) {
        if($(this).parent('.sidebar-list-item').hasClass('has-child')) {
          event.preventDefault();
          $(this).next('ul').toggleClass('is-drop-open');
        }
      });
    } else {
      $(document).off('click', '.sidebar-main-link');
      $sidebarListItem.find('ul').removeClass('is-drop-open');
    }
  }, 200);

  var init = function() {
    sidebarDropdown();
  };

  return {
    init: init,
    manageSidebarDropdown: sidebarDropdown
  };
  
})(jQuery);