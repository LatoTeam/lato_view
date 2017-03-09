var ConfirmationPopup = (function($) {
  'use strict';

  var _manageConfirmationPopup = function() {
    $(document).on('click', '.js-confirmation-popup-trigger', function(event) {
      var $this = $(this);

      var $confirmationPopup = $('.js-confirmation-popup');
      var $confirmationPopupQuestion = $confirmationPopup.find('.js-confirmation-popup-question');
      var $confirmationPopupAnswerOk = $confirmationPopup.find('.js-confirmation-popup-answer-success');
      var $confirmationPopupAnswerNope = $confirmationPopup.find('.js-confirmation-popup-answer-nope');

      var location = $this.attr('href');
      var messageOk = $this.data('popup-ok');
      var messageNo = $this.data('popup-no');
      var messageText = $this.data('popup-text');

      // Set property data
      $confirmationPopupQuestion.text(messageText);
      $confirmationPopupAnswerOk.text(messageOk);
      $confirmationPopupAnswerOk.attr('href', location);
      $confirmationPopupAnswerNope.text(messageNo);

      event.preventDefault();
      event.stopPropagation();

      setTimeout(function() {
        $('body').addClass('is-confirmation-popup-open');
      }, 300);

    });
  };

  var _nopePopup = function() {
    $(document).on('click', '.js-confirmation-popup-answer-nope', function() {
      $('body').removeClass('is-confirmation-popup-open');
    });
  };

  var init = function() {
    _manageConfirmationPopup();
    _nopePopup();
  };

  return {
    init: init
  };

})(jQuery);
