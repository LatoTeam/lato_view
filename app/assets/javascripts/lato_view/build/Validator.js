var Validator = (function($) {
  'use strict';

  /*
  * Check if the given value is a correct email address.
  * @params:
  * value: value to test
  * @return: boolean
  */
  var _isEmail = function(value) {
    return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) ? true : false;
  };

  /*
  * Check if an input in a form has a number as its value.
  * @params:
  * input: input to control
  * @return: undefined
  */
  var checkInputNaN = function(input) {
    if ($(input).length) {
      var passed = false;
      var results = [];
      var $formControl = $(input).parent('.form-control');
      var errorMessage = $('.number-hidden-message').text();

      $(input).each(function () {
        var $value = $(this).val();
        passed = Util.isNumber($value) && !Util.isEmptyString($value);
        results[results.length] = passed;
      });

      passed = results.indexOf(false);
      if(passed === -1) {
        $formControl.addClass('form-error');
        $(input).next('.input-error-message').text(errorMessage);
      } else {
        $formControl.removeClass('form-error');
        $(input).next('.input-error-message').text('');
      }
      return passed > -1;
    }
  };

  /*
  * Check if a required input is empty or not.
  * @params
  * attribute: data-attribute of form-control
  * @return: boolean
  */
  var isInputRequired = function(inputs) {
    if (inputs !== null && inputs.length) {
      var passed = false;
      var results = [];
      $.each(inputs, function(i, el) {
        var passed = false;
        var $requiredInputs = '';

        var isTextarea = $(el).find('.textarea').length;
        var $allInputs = $(el).find('.input, .textarea');
        var $onlyInput = $(el).find('.input');

        var errorMessage = $('.required-hidden-message').text();
        $requiredInputs = isTextarea ? $allInputs : $onlyInput;

        $requiredInputs.each(function(i, el) {
          if ($(this).val() === '') {
            passed = false;
            $(this).parent('.form-control').addClass('form-required');
            $requiredInputs.next('.input-error-message').text(errorMessage);
          } else {
            $(this).parent('.form-control').removeClass('form-required');
            $requiredInputs.next('.input-error-message').text();
          }
        });

        results.push(passed);
      });

      $.each(results, function(i, val) {
        if (!val) {
          passed = false;
          return false
        } else {
          passed = true;
        }
      });

      return passed;
    }
  };

  /*
  * check if a required radio box is empty.
  * @params
  * attribute: data-attribute of form-control
  * @return: boolean
  */
  var isRadioChecked = function(attribute) {
    if ($('.form-control[' + attribute + ']').length) {
      var passed = false;
      var $radios = $('.form-control[' + attribute + ']').find('.radio');
      var $control = $radios.parent().parent();
      var errorMessage = $('.check-hidden-message').text();

      if($radios.length) {
        $radios.each(function() {
          if($(this).prop('checked')) {
            passed = true;
            $(this).parent().next('.input-error-message').text('');
            return false;
          } else {
            $(this).parent().next('.input-error-message').text(errorMessage);
          }
        });
      }

      !passed ? $control.addClass('form-required') : $control.removeClass('form-required');

      return passed;
    }
  };

  /*
  * Check if the value given is a correct email string
  * @params
  * input: input to control
  * @return: undefined
  */
  var isInputEmail = function(inputs) {

    if (inputs !== null && inputs.length) {
      var passed = false;
      var results = [];
      $.each($(inputs), function(i, el) {
        var isSuggestion = $(el).parent('.eac-input-wrap').length;
        var $suggestionControl = $(el).parent('.eac-input-wrap').parent('.form-control');
        var $baseControl = $(el).parent('.form-control');

        // Distinguish when we have email suggestion or not
        var $formControl = isSuggestion ? $suggestionControl : $baseControl;
        var errorMessage = $('.email-hidden-message').text();

        var value = $(el).val();

        if (_isEmail(value) && !Util.isEmptyString(value)) {
          passed = true;

          $formControl.removeClass('form-error');

          // Distinguish when we have email suggestion or not
          if ($(el).parent('.eac-input-wrap').length) {
            $(el).parent('.eac-input-wrap').next('.input-error-message').text('');
          } else {
            $(el).next('.input-error-message').text('');
          }
        } else {
          passed = false;
          $formControl.addClass('form-error');

          // Distinguish when we have email suggestion or not
          if ($(el).parent('.eac-input-wrap').length) {
            $(el).parent('.eac-input-wrap').next('.input-error-message').text(errorMessage);
          } else {
            $(el).next('.input-error-message').text(errorMessage);
          }
        }

        results.push(passed);
      });

      console.log(results);

      $.each(results, function(i, val) {
        if (!val) {
          passed = false;
          return false
        } else {
          passed = true;
        }
      });

      return passed;
    }
  };

  /*
  * Check if two password inputs have the same value.
  * @params:
  * firstInput: first input to test
  * secondInput: second input to test
  * @return: boolean
  */
  var isPasswordEqual = function(firstInput, secondInput) {
    if($(secondInput).length) {
      var $confirmPassword = $(firstInput + ',' + secondInput).parent('.form-control');
      var firstValue = $(firstInput).val();
      var secondValue = $(secondInput).val();
      var errorMessage = $('.pass-same-hidden-message').text();

      var result = Util.isEqual(firstValue, secondValue);

      if (result) {
        $confirmPassword.removeClass('form-error');
        $(firstInput + ',' + secondInput).next('.password-reveal').next('.input-error-message').text('');
      } else {
        $confirmPassword.addClass('form-error');
        $(firstInput + ',' + secondInput).next('.password-reveal').next('.input-error-message').text(errorMessage);
      }

      return result;
    }
  };

  /*
  * Check if the given input has the correct number of characters.
  * @params:
  * input: input to examinate
  * @return: boolean
  */
  var isInputCorrectLenght = function(input) {
    if($(input).length) {
      var passed = false;
      var results = [];
      var $formControl = $(input).parent('.form-control');
      var errorMessage = $('.char-hidden-message').text();

      $(input).each(function() {
        passed = Util.checkLength($(this), 'max', undefined, 5);
        results[results.length] = passed;
      });

      passed = results.indexOf(false);

      if (passed === -1) {
        $formControl.removeClass('form-error');
        $(input).next('.input-error-message').text('');
      } else {
        $formControl.addClass('form-error');
        $(input).next('.input-error-message').text(errorMessage);
      }

      var result = passed === -1 ? false : true;
      return result;
    }
  };

  return {
    controlNumber: checkInputNaN,
    controlRequired: isInputRequired,
    controlEmail: isInputEmail,
    controlPasswordEquality: isPasswordEqual,
    controlInputLength: isInputCorrectLenght,
    controlRadiobox: isRadioChecked
  };

})(jQuery);
