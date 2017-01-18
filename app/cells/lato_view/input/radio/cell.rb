module LatoView
  class Input::Radio::Cell < Cell

    @@widths = VIEW_INPUTWIDTH

    # NB: options must be an array of hash {name: 'name', value: 'value'}
    attr_accessor :name, :placeholder, :value, :label, :width, :required,
                  :disabled, :custom_class, :options

    def initialize(name: 'input', placeholder: '', value: '', label: '',
                   width: 'large', required: false, disabled: false,
                   custom_class: '', options: [])
      # save params
      @name = name
      @placeholder = placeholder
      @value = value
      @label = label
      @width = width
      @required = required
      @disabled = disabled
      @custom_class = custom_class
      @options = options
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

    # return true or false to show if option is selected
    protected def selected_value(option)
      return "checked" if option[:value] === @value
    end

    # check params
    private def check_params
      raise 'Input Cells: width has not a correct value' unless @@widths.include? width
      raise 'Input Cells: options must be an array of hash' if options && !options.is_a?(Array)
    end

    # take in input an activerecords list, a value string and a name string, return
    # an array that can be used with select
    def self.generate_options_from_activerecords(activerecords, value, name)
      rows = []
      activerecords.each do |row|
        rows.push([row.send(value), row.send(name)])
      end
      rows
    end

  end
end
