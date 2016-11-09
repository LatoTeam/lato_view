module LatoView
  class Input::Date::Cell < Cell

    @@widths = VIEW_INPUTWIDTH

    attr_accessor :name, :placeholder, :value, :label, :width, :required,
                  :disabled, :custom_class, :birthdate

    def initialize(name: 'input', placeholder: '', value: '', label: '',
                   width: 'large', required: false, disabled: false,
                   custom_class: '', birthdate: false)

      # save params
      @name = name
      @placeholder = placeholder
      @value = value
      @label = label
      @width = width
      @required = required
      @disabled = disabled
      @custom_class = custom_class
      @datepicker_class = birthdate ? 'birthdate-picker' : 'date-picker'
      # check params
      check_params
    end

    def show
      render "show.html"
    end

    # return required string to input
    protected def required_data_input
      return "data-input='required'" if @required
    end

    # return disabled string to input
    protected def disabled_data_input
      return "disabled='disabled'" if @disabled
    end

    # check params
    private def check_params
      raise 'Input Cells: width has not a correct value' unless @@widths.include? width
    end

  end
end
