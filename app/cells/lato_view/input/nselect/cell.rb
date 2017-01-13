module LatoView
  class Input::Nselect::Cell < Cell

    @@widths = VIEW_INPUTWIDTH

    attr_accessor :width, :custom_class, :select_inputs

    # Select input structure: {name: '', label: '', api_url: '', value: '', value_field: '', label_field: '', width: ''}

    def initialize(width: 'large', custom_class: '', select_inputs: [])

      # save params
      @width = width
      @custom_class = custom_class
      @select_inputs = select_inputs


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
      return "data-input='disabled'" if @disabled
    end

    protected def get_select_width(select_input)
      return select_input[:width] if select_input[:width] && (@@widths.include? select_input[:width])
      return 'large'
    end

    # check params
    private def check_params
      raise 'Input Cells: width has not a correct value' unless @@widths.include? width
    end

  end
end
