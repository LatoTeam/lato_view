var FormManager = (function($) {
  'use strict';

  // Activate selectize.js module
  var _manageSelect = function() {
    $('.select').selectize({
      hideSelected: 'true' // for multiple-select working
    });
  };

  // Activate pikaday.js module
  var _manageDatePicker = function() {
    var $datepicker = $('.date-picker').pickadate({
      firstDay: 1,
      min: new Date(1900, 0, 1),
      max: new Date(3000, 12, 31),
      selectYears: true,
      format: 'dd/mm/yyyy',
      hiddenPrefix: '',
      hiddenSuffix: '',
      selectMonths: true,
      selectYears: 80,
      max: true
    });
  };

  var _manageTimePicker = function() {
    var $timePicker = $('.time-picker').pickatime({
      format: 'H:i',
      hiddenPrefix: '',
      hiddenSuffix: ''
    });
  };

  var _manageFileUploader = function() {
    var $dropZone = $('.drop-zone');
    var parentForm = $dropZone.parent('.lato-form');

    $dropZone.dropzone({ url: parentForm.attr('action') });
  };

  // Manage input type="file" component.
  // Replaces the label text depending on the uploaded files.
  var _manageInputFile = function() {
    if($('.input-file').length) {
      $('.input-file').each( function() {
        var $input = $(this);
        var $label   = $input.next('label');
        var labelVal = $label.html();

        $input.on('change', function(event) {
          var fileName = '';

          if(this.files && this.files.length > 1) {
            fileName = (this.getAttribute('data-multiple-caption') || '' ).replace( '{count}', this.files.length );
          } else if(event.target.value) {
            fileName = event.target.value.split('\\').pop();
          }

          if(fileName) {
            $label.find('span').html(fileName);
          } else {
            $label.html(labelVal);
          }

        });

        // Firefox bug fix
        $input
        .on('focus', function(){ $input.addClass( 'has-focus' ); })
        .on('blur', function(){ $input.removeClass( 'has-focus' ); });
      });
    }
  };

  // Manage password-reveal sub-module.
  // Transforms the input type.
  var _manageInputPassword = function() {
    $(document).on('click', '.password-reveal', function(event) {
      event.preventDefault();
      var $input = $(this).prev('.input');

      $(this).toggleClass('is-text');
      $input.attr('type') === 'password' ? $input.attr('type', 'text') : $input.attr('type', 'password');
    });
  };

  // Activate email data-list autocomplete
  var _insertSuggestions = function() {
    if($('.email-suggestion').length) {
      var domains = ['yahoo.com', 'gmail.com', 'google.com', 'hotmail.com', 'me.com', 'libero.it', 'live.it', 'live.com'];

      $('.email-suggestion').emailautocomplete({
        domains: domains
      });
    }
  };

  /*
  * Manage form submission/validation
  * @return: undefined or boolean
  */
  var _manageFormSubmit = function() {
    $('.lato-form').on('submit', function(event) {

      var tests = {
        "number": Validator.controlNumber('.input-number'),
        "required": Validator.controlRequired('data-input="required"'),
        "email": Validator.controlEmail('.input-email'),
        "password": Validator.controlPasswordEquality('.input-password', '.confirm-password'),
        "length": Validator.controlInputLength('.input-length'),
        "radiobox": Validator.controlRadiobox('data-input="radio"')
      };

      // Basta che uno dei test fallisca per generare un errore
      $.each(tests, function(index, val) {
        if(val === false) {
          event.preventDefault();
          return false;
        }
      });

    });
  }

  // Manage form validation in semi-real-time.
  var _manageBlurValidation = function() {
    $('.lato-form').on('blur', '.input', function(event) {
      var type = $(this).parent('.form-control').data('input');
      var controlType = $(this).parent('.form-control').data('control');

      // Email suggestion case
      if($('.eac-input-wrap').length) {
        Validator.controlEmail('.input-email');
      }

      // Get input desired className.
      var tester = '.' + $(this).attr('class').split(' ')[1];

      // Manage data-control type
      switch(controlType) {
        case 'number':
          Validator.controlNumber(tester);
          break;
        case 'email':
          Validator.controlEmail(tester);
          break;
      }

    });
  };

  var init = function() {
    _manageSelect();
    _manageDatePicker();
    _manageTimePicker();
    // _manageFileUploader();
    _manageInputFile();
    _manageInputPassword();
    _insertSuggestions();
    _manageFormSubmit();
    _manageBlurValidation();
  };

  return {
    init: init
  };

})(jQuery);
