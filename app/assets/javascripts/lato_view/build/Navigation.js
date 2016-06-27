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

  /*
  * Manage responsive menu - moves the admin dropdown to the sidebar.
  * @params: -
  * @return: undefined
  */
  var responsiveMenu = function() {
    var resizing = false;
    var $topNavigation = $('.nav-account-area');
    var $sidebar = $('.main-navigation-sidebar');
    var $header = $('.main-navigation-header');

    function _detachElements() {
      $topNavigation.detach();
    }
     
    var moveNavigation = Util.debounce(function() {
      if ( Modernizr.mq("only screen and (max-width: 766px)")) {
        _detachElements();
        $topNavigation.appendTo($sidebar);
      } else if ( Modernizr.mq("only screen and (min-width: 767px)") ) {
        _detachElements();
        $header.find('.nav-logo').after($topNavigation);
      }
      resizing = false;
    }, 200);

    moveNavigation();
    $(window).on('resize', function() {
      if( !resizing ) {
        window.requestAnimationFrame(moveNavigation);
        resizing = true;
      }
    });
  };

  var _openMobileMenu = function() {
    var $sidebar = $('.main-navigation-sidebar');
    $(document).on('click', '.menu-toggle', function() {
      $(this).toggleClass('is-mobile-menu-open');
      $sidebar.toggleClass('is-mobile-menu-open');
    });
  }

  var init = function() {
    sidebarDropdown();
    responsiveMenu();
    _openMobileMenu();
  };

  return {
    init: init,
    manageSidebarDropdown: sidebarDropdown
  };
  
})(jQuery);