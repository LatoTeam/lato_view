// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery2
//= require jquery_ujs
//= require lato_view/vendor/modernizr
//= require selectize
//= require lato_view/vendor/moment.min
//= require lato_view/vendor/pikaday
//= require lato_view/vendor/pikaday.jquery
//= require lato_view/vendor/dropzone.min
//= require lato_view/vendor/jquery.email-autocomplete.min
//= require lato_view/vendor/trumbowyg
//= require lato_view/build/Util
//= require lato_view/build/Validator
//= require lato_view/build/FormManager
//= require lato_view/build/Dropdown
//= require lato_view/build/Navigation
//= require lato_view/build/ActionBar
//= require lato_view/build/Flash

var Application = (function($) {

  var onResize = function() {
    $(window).on('resize', function() {
      Navigation.manageSidebarDropdown();
    });
  };

  var init = function() {
    $(document).on('ready', function() {

      // Active js functionalities
      document.documentElement.className = 'js';

      // Init our modules
      Dropdown.init();
      Navigation.init();
      //ActionBar.init();
      Flash.init();
      FormManager.init();
      $('.editor').trumbowyg({
        svgPath: '/ui/icons.svg'
      });

      // Functions executed on resize
      onResize();
    });
  };

  return {
    init: init,
  };

})(jQuery);

Application.init();
