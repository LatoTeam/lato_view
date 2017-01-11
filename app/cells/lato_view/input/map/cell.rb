module LatoView
  class Input::Map::Cell < Cell

    @@widths = VIEW_INPUTWIDTH

    attr_accessor :name_lat, :name_lng, :name_address,
                  :value_lat, :value_lng, :value_address,
                  :placeholder, :label, :width, :required,
                  :disabled, :custom_class

    def initialize(name_lat: 'lat', name_lng: 'lng', name_address: 'address_input',
                   value_lat: '', value_lng: '', value_address: '',
                   placeholder: '', label: '', width: 'large', 
                   required: false, disabled: false, custom_class: '')
      # save params
      @name_lat = name_lat
      @name_lng = name_lng
      @name_address = name_address
      @value_lat = value_lat
      @value_lng = value_lng
      @value_address = value_address

      @placeholder = placeholder
      @width = width
      @label = label
      @required = required
      @disabled = disabled
      @custom_class = custom_class

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
