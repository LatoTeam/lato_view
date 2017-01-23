var FormManager = (function($) {
  'use strict';

  // Activate selectize.js module
  var _manageSelect = function() {

    var $inputNSelects = $('.input-nselect');
    var $select = $('.select');
    var $selectCreate = $('.select-create');

    $select.selectize({
      hideSelected: 'true'
    });

    $selectCreate.selectize({
      hideSelected: 'true',
      create: function(input) {
        return {
          value: input,
          text: input
        }
      }
    });

		$inputNSelects.each(function (index, inputNSelect) {
			_manageInputNSelect(inputNSelect);
		});
  };

  // Main function for each cell
	var _manageInputNSelect = function(inputNSelect) {
		var selectInputs = $(inputNSelect).find('.form-control');

		// init selectize
		selectInputs.each(function(index) {
			_initSelectize(index, selectInputs);
		});

		// load options for first selectize
		_loadOptions(null, 0, selectInputs);
	};

  // Function to init a select with the call of the api
	var _loadOptions = function (filterId, selectInputPosition, selectInputs) {
    var selectInput = selectInputs[selectInputPosition];
    if (!selectInput) { return }
    var apiUrl = $(selectInput).attr('data-api-url');
		$.ajax({
			url: apiUrl,
			cache: false,
			data: (filterId ? {filter_id: filterId} : null),
			success: function (response) {
				_updateSelectize(response, selectInputPosition, selectInputs);
			}
		});
	};

  // Function to init an empty input to become a selectize
	var _initSelectize = function (selectInputPosition, selectInputs) {
		var selectInput = selectInputs[selectInputPosition];
		var input = $(selectInput).find('.select-nselect');
		var valueField = $(selectInput).attr('data-value-field');
		var labelField = $(selectInput).attr('data-label-field');
		var initialVal = $(input).val();
		var id = $(selectInput).attr('data-value-id');

		input.selectize({
			maxItems: 1,
			valueField: valueField,
			labelField: labelField,
			searchField: labelField,
			options: [],
			onChange: function (value) {
				_loadOptions(value, parseInt(id) + 1, selectInputs);
			},
			onInitialize: function() {
				if (initialVal) {
					this.setValue(initialVal);
					_loadOptions(initialVal, parseInt(id) + 1, selectInputs);
				}
			}
		});
	};

  // Function to update a selectize with correct options
	var _updateSelectize = function (options, selectInputPosition, selectInputs) {
		var selectInput = selectInputs[selectInputPosition];
		var input = $(selectInput).find('.select-nselect');
		var id = $(selectInput).attr('data-value-id');
		var initialVal = $(input).val();

		var selectize = $(input)[0].selectize;

		if (selectize) {
			selectize.clear();
			selectize.clearOptions();
			selectize.load(function(callback) {
			  callback(options);
			});
			if (initialVal) {
				selectize.setValue(initialVal);
				_loadOptions(initialVal, parseInt(id) + 1, selectInputs);
			}
		}
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
      selectMonths: true
    });

    var $datepicker = $('.birthdate-picker').pickadate({
      firstDay: 1,
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
        .on('focus', function() { $input.addClass( 'has-focus' ); })
        .on('blur', function() { $input.removeClass( 'has-focus' ); });
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
    if ($('.email-suggestion').length) {
      var domains = ['yahoo.com', 'gmail.com', 'google.com', 'hotmail.com', 'me.com', 'libero.it', 'live.it', 'live.com'];

      $('.email-suggestion').emailautocomplete({
        domains: domains
      });
    }
  };

  /*
  * Manage form elements' submit
  * @return: undefined or boolean
  */
  var _manageFormSubmit = function() {
    $('.lato-form').not('.login-form').each(function(i, el) {
      $(el).on('submit', function(event) {

        var $requiredControls = $(el).find('.form-control[data-input="required"]');
        var $emailControls = $(el).find('.input-email');
        var $lengthControls = $(el).find('.input-length');
        var $radioControls = $(el).find('.form-control[data-input="radio"]');
        var $passwordControl = $(el).find('.input-password');
        var $passwordConfirm = $(el).find('.confirm-password');
        var $numberControls = $(el).find('.input-number');

        var tests = {
          //"number": Validator.controlNumber($numberControls),
          // "required": Validator.controlRequired($requiredControls),
          // "email": Validator.controlEmail($emailControls),
          //"password": Validator.controlPasswordEquality($passwordControl, $passwordConfirm)
          //"length": Validator.controlInputLength($lengthControls),
          //"radiobox": Validator.controlRadiobox($radioControls)
        };

        // Basta che uno dei test fallisca per generare un errore
        $.each(tests, function(index, val) {
          // if(!val) {
          //   event.preventDefault();
          //   return false;
          // }
        });

        console.log(event);
      });
    });
  }

  // Manage form validation in semi-real-time.
  var _manageBlurValidation = function() {
    // $('.lato-form').on('blur', '.input', function(event) {
    //   var type = $(this).parent('.form-control').data('input');
    //   var controlType = $(this).parent('.form-control').data('control');
    //
    //   // Email suggestion case
    //   if($('.eac-input-wrap').length) {
    //     Validator.controlEmail('.input-email');
    //   }
    //
    //   // Get input desired className.
    //   var tester = '.' + $(this).attr('class').split(' ')[1];
    //
    //   // Manage data-control type
    //   switch(controlType) {
    //     case 'number':
    //       Validator.controlNumber(tester);
    //       break;
    //     case 'email':
    //       Validator.controlEmail(tester);
    //       break;
    //   }
    //
    // });
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
