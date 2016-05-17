var Flash = (function($) {

  var flashTimeout = 4000;

  var _showFlashes = function() {
    var $flash = $('.flashes-container');

    if($flash.length) {
      setTimeout(function() {
        $flash.addClass('is-remove');
      }, flashTimeout);
    }
  };

  var init = function() {
    _showFlashes();
  };

  return {
    init: init
  };

})(jQuery);