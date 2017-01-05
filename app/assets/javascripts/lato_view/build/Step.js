var Step = (function($) {
  'use strict';

  var $stepElements = $('.element-step');
  var $stepNavigator = $('.step-navigator');

  var _stepExists = function() {
    return $stepElements.length;
  };

  var _sameElementStep = function($elStep, $navigator) {
    return $elStep.data('step-id') === $navigator.data('step-id');
  };

  var _setStepsSize = function(currentStepElement) {
    var elW = $(currentStepElement).outerWidth();
    var $stepScroller = $(currentStepElement).find('.step-scroller');
    var $steps = $(currentStepElement).find('.step');
    var stepsCount = $steps.length;

    $steps.width(elW);
    $stepScroller.width(elW * stepsCount);
  };

  var _buildNavigation = function(currentStepElement, currentSteps) {
    var stepElementid = $(currentStepElement).data('step-id');
    var stepNavigatorSelector = '[data-step-id=' + stepElementid + ']';
    var fragment = $(document.createDocumentFragment());

    $.each(currentSteps, function(i, el) {
      if ((parseInt(i)+1) === 1) {
        var li = $('<li class="step-paginate-index active">' + (parseInt(i) + 1) + '</li>');
      } else {
        var li = $('<li class="step-paginate-index">' + (parseInt(i) + 1) + '</li>');
      }
      fragment.append(li);
    });

    $(stepNavigatorSelector).find('.step-paginate').append(fragment);
  };

  var _validateStep = function() {

  };

  var _setActiveStep = function(currentStepElement, id) {
    var $step = $(currentStepElement).find('.step');

    $step.removeClass('active');
    $step.eq(id).addClass('active');
  };

  var moveStep = function(currentStepElement, direction) {
    currentStepElement = currentStepElement || $('.element-step:first');
    direction = direction || 'initial';
    var transform = ['transform', 'msTransform', 'webkitTransform', 'mozTransform', 'oTransform'];
    var transformProperty = Util.getSupportedPropertyName(transform);
    var stepScroller = $(currentStepElement).find('.step-scroller')[0];
    var width = $(currentStepElement).outerWidth();
    var currentIndex = $(currentStepElement).find('.step.active').index() + 1;

    _setActiveStep(currentStepElement, currentIndex);

    if (transformProperty) {
      if (typeof direction === 'string') {
        switch (direction) {
          case 'prev':
            stepScroller.style[transformProperty] = 'translateX(-' + (width * currentIndex) + 'px)';
            break;
          case 'next':
            stepScroller.style[transformProperty] = 'translateX(-' + (width * currentIndex) + 'px)';
            break;
          case 'initial':

            break;
          default:
        }
      } else if (typeof direction === 'number') {

      } else {
        return false;
      }
    }
  };

  var prevStep = function(currentStepElement) {
    $(document).on('click', '.step-prev', function() {
      moveStep(currentStepElement, 'prev');
    });
  };

  var nextStep = function(currentStepElement) {
    $(document).on('click', '.step-next', function() {
      moveStep(currentStepElement, 'next');
    });
  };

  var resetStep = function() {
    $(document).on('click', '.step-reset', function() {
      moveStep(currentStepElement, 'initial');
    });
  };

  var updateStepsSize = function() {
    if (_stepExists()) {
      $.each($stepElements, function(i, el) {
        _setStepsSize(el);
      });
    }
  };

  var init = function() {
    if (_stepExists()) {
      $.each($stepElements, function(i, el) {
        var $elSteps = $(el).find('.step');

        prevStep(el);
        nextStep(el);
        _setStepsSize(el);
        _buildNavigation(el, $elSteps);
      });
    }
  };

  return {
    init: init,
    move: moveStep,
    prev: prevStep,
    next: nextStep,
    reset: resetStep,
    update: updateStepsSize
  };

})(jQuery);
