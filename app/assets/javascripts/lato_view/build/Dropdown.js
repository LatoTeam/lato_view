var Dropdown = (function($) {
  'use strict';

  var _manageDropdown = function() {

    $(document).on('click', '.active-voice', function(event) {
      event.stopPropagation();
      $(this).parent('.dropdown').toggleClass('is-arranger-open');
    });

    $(document).on('click', '.nav-account-area', function(event) {
      event.stopPropagation();
      $('body').toggleClass('is-dropdown-open');
    });

    // FIXME - da rivedere il click fuori dall'area dropdown
    $('html').on('click', function(event) {
      if($('body').hasClass('is-dropdown-open')) {
        //$('body').removeClass('is-dropdown-open');
      }
    });

  };

  var init = function() {
    _manageDropdown();
  };

  return {
    init: init
  };
  
})(jQuery);