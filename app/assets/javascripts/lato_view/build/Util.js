var Util = (function($) {
  'use strict';

  /*
  * Debounce any function
  * @params: 
  * func: function to test.
  * wait: the time interval for the next function execution.
  * immediate: triggers the function on the leading edge, instead of the trailing.
  * @return: a function, that, as long as it continues to be invoked, will not be triggered.
  */ 
  var debounce = function(func, wait, immediate) {
    var timeout;
    return function() {
      var context = this, args = arguments;
      var later = function() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

  /*
  * Check if the value given is a number.
  * @params: 
  * value: value to test
  * @return: boolean
  */
  var isNumber = function(value) {
    return !Number(value);
  };

  /*
  * Check if two strings have the same value.
  * @params: 
  * firstValue: value to test.
  * secondValue: value to compare to.
  * @return: boolean
  */
  var isEqual = function(firstValue, secondValue) {
    return firstValue === secondValue ? true : false;
  };

  /*
  * Check if a string is empty
  * @params: 
  * value: value to test
  * @return: boolean
  */
  var isEmptyString = function(value) {
    return value === '';
  };

  /*
  * Check if the lenght of a given value respects the limit given.
  * @params: 
  * el: element to test
  * limit: limit to give. Ex: max, min, between
  * minValue: minimum value to respect
  * maxValue: maximum value to respect
  * @return: boolean
  */
  var checkLength = function(el, limit, minValue, maxValue) {
    var $length = $(el).val().length;
    minValue = minValue || 1;
    maxValue = maxValue || 0;

    if (limit === 'max') {
      return $length <= maxValue;
    } else if (limit === 'min') {
      return $length >= minValue;
    } else if (limit === 'between') {
      return $length >= minValue && $length <= maxValue;
    } else {
      return false;
    }
  };

  return {
    debounce: debounce,
    isNumber: isNumber,
    isEqual: isEqual,
    isEmptyString: isEmptyString,
    checkLength: checkLength
  };
  
})(jQuery);