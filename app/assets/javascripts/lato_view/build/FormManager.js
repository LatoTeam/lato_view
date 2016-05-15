var FormManager = (function($) {
  'use strict';

  // Activate selectize.js module
  var _manageSelect = function() {
    $('.select').selectize();
  };

  // Activate pikaday.js module
  var _manageDatePicker = function() {
    var $datepicker = $('.date-picker').pikaday({
      firstDay: 1,
      minDate: new Date(2000, 0, 1),
      maxDate: new Date(2020, 12, 31),
      format: 'DD/MM/YYYY',
      yearRange: [1900, 3000],
      i18n: {
        previousMonth : 'Mese precedente',
        nextMonth     : 'Mese successivo',
        months        : ['Gennaio','Febbraio','Marzo','Aprile','Maggio','Giugno','Luglio','Agosto','Settembre','Ottobre','Novembre','Dicembre'],
        weekdays      : ['Domenica','Lunedi','Martedi','Mercoledi','Giovedi','Venerdi','Sabato'],
        weekdaysShort : ['Dom','Lun','Mar','Mar','Gio','Ven','Sab']
      }
    });
  };

  var _manageFileUploader = function() {
    var $dropZone = $('.drop-zone');
    var parentForm = $dropZone.parent('.lato-form');

    $dropZone.dropzone({ url: parentForm.attr('action') });
  };

  // Manage password-reveal sub-module.
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
  * @params: 
  * form: form element to test
  * validationTests: object of validation functions, coming from the Validate.js module.
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
        "checkbox": Validator.controlCheckbox('data-input="check"')
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

  var _manageBlurValidation = function() {
    $('.lato-form').on('blur', '.input', function(event) {
      var type = $(this).parent('.form-control').data('input');
      var controlType = $(this).parent('.form-control').data('control');

      // Manage data-input type
      if(type === 'required') {
        Validator.controlRequired('data-input="required"');
      }

      // Manage data-control type
      switch(controlType) {
        case 'number':
          Validator.controlNumber($(this));
          break;
        case 'email':
          Validator.controlEmail('.input-email');
          break;
      }

    });

    $('.lato-form').on('blur', '.textarea', function() {
      var type = $(this).parent('.form-control').data('input');

      // Manage data-input type
      if(type === 'required') {
        Validator.controlRequired('data-input="required"');
      }
    });
  };

  var init = function() {
    _manageSelect();
    _manageDatePicker();
    // _manageFileUploader();
    _manageInputPassword();
    _insertSuggestions();
    _manageFormSubmit();
    _manageBlurValidation();
  };

  return {
    init: init
  };

})(jQuery);