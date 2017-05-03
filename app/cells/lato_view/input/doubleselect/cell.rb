module LatoView
  class Input::Doubleselect::Cell < Cell

    @@widths = VIEW_INPUTWIDTH

    attr_accessor :first_select_name, :first_select_label, :width, :required,
                  :disabled, :custom_class, :token, :second_select_label, :second_select_name,
                  :first_select_endpoint_url, :second_select_endpoint_url, :first_select_val,
                  :second_select_val, :second_select_value_field, :first_select_label_field,
                  :first_select_value_field, :second_select_label_field

    def initialize(first_select_name: 'input',
    			         second_select_name: '', first_select_label: '',
                   width: 'large', required: false, disabled: false,
                   custom_class: '', token:'', second_select_label: '',
                   first_select_endpoint_url: '', second_select_endpoint_url: '',
                   first_select_val: '', second_select_val: '',
                   first_select_label_field: 'name', second_select_label_field: 'name',
                   first_select_value_field: 'id', second_select_value_field: 'id'
                   )
      # save params
      @width = width
      @required = required
      @disabled = disabled
      @custom_class = custom_class

      @first_select_label = first_select_label
      @second_select_label = second_select_label
      @first_select_endpoint_url = first_select_endpoint_url
      @second_select_endpoint_url = second_select_endpoint_url
      @first_select_name = first_select_name
      @second_select_name = second_select_name
      @first_select_val = first_select_val
      @second_select_val = second_select_val
      @first_select_label_field = first_select_label_field
      @second_select_label_field = second_select_label_field
      @first_select_value_field = first_select_value_field
      @second_select_value_field = second_select_value_field
      @token = token

      # advise to not use double select
      puts "@" * 20
      puts "DOUBLE SELECT IS DEPRECATED. USE NSELECT."
      puts "@" * 20

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

    # check params
    private def check_params
      raise 'Input Cells: width has not a correct value' unless @@widths.include? width
      raise 'Input Cells: first_select_endpoint_url is missing ' if @first_select_endpoint_url.blank?
      raise 'Input Cells: second_select_endpoint_url is missing ' if @second_select_endpoint_url.blank?
    end

  end
end
