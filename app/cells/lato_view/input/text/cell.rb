module LatoView
  module Input::Text
    class Cell < Cell

      @@widths = VIEW_INPUTWIDTH

      attr_accessor :name, :placeholder, :value, :label, :width, :required,
                    :disabled, :custom_class

      def initialize(name: 'input', placeholder: '', value: '', label: '',
                     width: 'large', required: false, disabled: false)

        raise 'Input Concept: width has not a correct value' unless @@widths.include? width

        @name = name
        @placeholder = placeholder
        @value = value
        @label = label
        @width = width
        @required = required
        @disabled = disabled
      end

      def show
        render "show.html"
      end

      # return required string tu input
      protected def required_data_input
        return "data-input='required'" if @required
      end

      # return disabled strind tu input
      protected def disabled_data_input
        return "disabled='disabled'" if @disabled
      end

    end
  end
end
