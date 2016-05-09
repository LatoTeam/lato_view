var Validator = (function($) {
  'use strict';

  /*
  * Check if the given value is a correct email address.
  * @params:
  * value: value to test
  * @return: boolean
  */
  var _isEmail = function(value) {
    return !/[0-9\-\.\_a-z]+@[0-9\-\.a-z]+\.[a-z]+/.test(value) ? true : false;
  };

  /*
  * Prints out the error message after the validation process.
  * @params:
  * message: message to print
  * @return: boolean
  */
  var _appendMessage = function(message) {

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
  var isInputRequired = function(attribute) {
    if($('.form-control[' + attribute + ']').length) {
      var passed = false;
      var $requiredInputs = $('.form-control[' + attribute + ']').find('.input');
      var errorMessage = $('.required-hidden-message').text();

      $requiredInputs.each(function() {
        if($(this).val() === '') {
          passed = false;
          $(this).parent('.form-control').addClass('form-required');
          $requiredInputs.next('.input-error-message').text(errorMessage);
        } else {
          passed = true;
          $(this).parent('.form-control').removeClass('form-required');
          $requiredInputs.next('.input-error-message').text();
        }
      });

      return passed;
    }
  };

  /*
  * check if a required checkbox is empty.
  * @params
  * attribute: data-attribute of form-control
  * @return: boolean
  */
  var isCheckboxChecked = function(attribute) {
    if ($('.form-control[' + attribute + ']').length) {
      var passed = false;
      var $checkboxes = $('.form-control[' + attribute + ']').find('.check');
      var $radios = $('.form-control[' + attribute + ']').find('.radio');
      var $control = $checkboxes.parent().parent();

      if($checkboxes.length) {
        $checkboxes.each(function() {
          if($(this).prop('checked')) {
            passed = true;
            return false;
          }
        });
      }

      if($radios.length) {
        $radios.each(function() {
          if($(this).prop('checked')) {
            passed = true;
            return false;
          }
        });
      }

      !passed ? $control.addClass('form-error') : $control.removeClass('form-error');

      return passed;
    }
  };

  /*
  * Check if the value given is a correct email string
  * @params
  * input: input to control
  * @return: undefined
  */
  var isInputEmail = function(input) {
    if ($(input).length) {
      var passed = false;
      var results = [];
      var $formControl = $(input).parent('.form-control');
      var errorMessage = $('.email-hidden-message').text();

      $(input).each(function () {
        var $value = $(this).val();
        passed = _isEmail($value) && !Util.isEmptyString($value);
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

      var result = Util.isEqual(firstValue, secondValue);

      result ? $confirmPassword.removeClass('form-error') : $confirmPassword.addClass('form-error');
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

      $(input).each(function() {
        passed = Util.checkLength($(this), 'max', undefined, 5);
        results[results.length] = passed;
      });
      passed = results.indexOf(false);
      passed === -1 ? $formControl.removeClass('form-error') : $formControl.addClass('form-error');
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
    controlCheckbox: isCheckboxChecked
  };

})(jQuery);
