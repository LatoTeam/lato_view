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
    var stepNavigatorSelector = '.step-navigator[data-step-id=' + stepElementid + ']';
    var fragment = $(document.createDocumentFragment());

    $.each(currentSteps, function(i, el) {
      if ((parseInt(i)+1) === 1) {
        var li = $('<li class="step-paginate-index active">' + (parseInt(i) + 1) + '</li>');
      } else {
        var li = $('<li class="step-paginate-index">' + (parseInt(i) + 1) + '</li>');
      }
      fragment.append(li);
    });

    _disableNavigation('.step-prev', stepElementid);
    $(stepNavigatorSelector).find('.step-paginate').append(fragment);
  };

  var _disableNavigation = function($navEl, stepId) {
    var selector = '.step-navigator[data-step-id="' + stepId + '"]';
    $(selector).find($navEl).addClass('step-disabled');
  };

  var _enableNavigation = function($navEl, stepId) {
    var selector = '.step-navigator[data-step-id="' + stepId + '"]';
    $(selector).find($navEl).removeClass('step-disabled');
  };

  var _setActiveStep = function(currentStepElement, id) {
    var stepElementid = $(currentStepElement).data('step-id');
    var $step = $(currentStepElement).find('.step');
    var stepNavigatorSelector = '.step-navigator[data-step-id=' + stepElementid + ']';
    var $stepPaginateIndex = $(stepNavigatorSelector).find('.step-paginate-index');

    $stepPaginateIndex.removeClass('active');
    $stepPaginateIndex.eq(id).addClass('active');

    $step.removeClass('active');
    $step.eq(id).addClass('active');
  };

  var moveStep = function(currentStepElement, direction) {
    currentStepElement = currentStepElement || $('.element-step:first');
    direction = direction || 'initial';
    var transform = ['transform', 'msTransform', 'webkitTransform', 'mozTransform', 'oTransform'];
    var transformProperty = Util.getSupportedPropertyName(transform);
    var stepScroller = $(currentStepElement).find('.step-scroller')[0];
    var muchScroll = $(currentStepElement).outerWidth();
    var stepCount = parseInt($(currentStepElement).find('.step').length);
    var currentIndex = parseInt($(currentStepElement).find('.step.active').index() + 1);
    var stepElementid = $(currentStepElement).data('step-id');

    if (transformProperty) {
      if (typeof direction === 'string') {
        switch (direction) {
          case 'prev':
            if (currentIndex !== 1) {
              _setActiveStep(currentStepElement, currentIndex-2);
              stepScroller.style[transformProperty] = 'translateX(-' + (muchScroll * (currentIndex - 2)) + 'px)';
            }
            break;
          case 'next':
            if (currentIndex !== stepCount) {
              stepScroller.style[transformProperty] = 'translateX(-' + (muchScroll * currentIndex) + 'px)';
              _setActiveStep(currentStepElement, currentIndex);
            }
            break;
          case 'initial':

            break;
          default:
        }

      } else if (typeof direction === 'number') {
        var index = direction-1;
        stepScroller.style[transformProperty] = 'translateX(-' + (muchScroll * index) + 'px)';
        _setActiveStep(currentStepElement, index);
        //_updateNavigationControl(currentIndex, stepElementid, stepCount);
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

  var _indexNavigation = function() {
    $(document).on('click', '.step-paginate-index', function() {
      var stepElementid = $(this).parents('.step-navigator').data('step-id');
      var paginateId = parseInt($(this).text());
      var currentStepElementSelector = '.element-step[data-step-id=' + stepElementid + ']';
      var $currentStepElement = $(currentStepElementSelector);

      moveStep($currentStepElement, paginateId);
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
        _indexNavigation();
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
