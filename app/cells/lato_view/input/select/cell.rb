module LatoView
  class Input::Select::Cell < Cell

    @@widths = VIEW_INPUTWIDTH

    # NB: options must be an array of hash {name: 'name', value: 'value'}
    attr_accessor :name, :placeholder, :value, :label, :width, :required,
                  :disabled, :custom_class, :options, :option_blank, :multiple, :create

    def initialize(name: 'input', placeholder: '', value: '', label: '',
                   width: 'large', required: false, disabled: false,
                   custom_class: '', options: [], option_blank: true,
                   multiple: false, create: nil)
      # save params
      @name = name
      @placeholder = placeholder
      @value = value
      @label = label
      @width = width
      @required = required
      @disabled = disabled
      @custom_class = custom_class
      @select_class = create == true ? 'select-create' : 'select'
      @options = options
      @option_blank = option_blank
      @multiple = multiple
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

    # return multiple string to input
    protected def multiple_data_input
      return "multiple='multiple'" if @multiple
    end

    # return true or false to show if option is selected
    protected def selected_value(option)
      if @multiple
        @value.each do |value|
          return "selected='selected'" if option[:value] === value
        end
      else
        return "selected='selected'" if option[:value] === @value
      end
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
        rows.push({name: row.send(name), value: row.send(value)})
      end
      return rows
    end

    # take in input an array list, return
    # an array that can be used with select
    def self.generate_options_from_array(array)
      rows = []
      array.each do |row|
        rows.push({name: row, value: row})
      end
      return rows
    end

  end
end
