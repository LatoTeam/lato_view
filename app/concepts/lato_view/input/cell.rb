module LatoView
  # Cella che gestisce tutti i possibili input utilizzabili nei form
  module Input
    # Cella Input
    class Cell < Cell
      # Lista di tipologie di input accettate
      @@types = %w(text number select password email editor checkbox radio
                   textarea file)

      # Tipologia di input da inizializzare
      # (text, number, select, password, email, multiple-select, date,
      # checkbox, radio, textarea, file)
      # * *default*: 'text'
      attr_accessor :type
      # Nome da assegnare all'input
      # * *default*: 'input'
      attr_accessor :name
      # Valore da inserire come placeholder all'input
      # * *default*: nil
      attr_accessor :placeholder
      # Valore gia' impostato nell'input
      # * *default*: nil
      attr_accessor :value
      # Testo da inserire nella label dell'input
      # * *default*: nil
      attr_accessor :label
      # Dimensione dell'input (half, third, fourth, two-third)
      # * *default*: nil ('large')
      attr_accessor :width
      # Valore booleano usato per indicare se l'input e' obbligatorio
      # nel form in cui si trova
      # * *default*: false
      attr_accessor :required
      # Valore booleano che indica (nel caso di input password) se mostrare
      # il pulsante per vedere la password
      # * *default*: true
      attr_accessor :password_visible
      # Classi custom da inserire nel codice dell'input
      # * *default*: nil
      attr_accessor :custom_class
      # Lista di opzioni da mostrare (nel caso di input select o radio buttons).
      # La struttura deve essere [['value1', 'Name 1'], ['value2', 'Name 2']]
      # * *default*: []
      attr_accessor :options
      # Valore booleano che indica (nel caso di input select) se mostrare
      # o meno la prima opzione del select vuota
      # * *default*: false
      attr_accessor :option_blank
      # Valore che indica se disattivare o meno l'input
      # * *default*: false
      attr_accessor :disabled

      def initialize(type: 'text', name: 'input', placeholder: '',
                     value: '', label: '', width: '', required: false,
                     password_visible: true, custom_class: '', options: [],
                     option_blank: false, disabled: false)
        @type = type
        @name = name
        @placeholder = placeholder
        @value = value
        @label = label
        @width = width
        @required = required
        @password_visible = password_visible
        @options = options
        @custom_class = custom_class
        @option_blank = option_blank
        @disabled = disabled
      end

      def show
        render "#{@type.downcase}.html" if @type
      end

      # Ritorna il value di un opzione di un select ricevuta come parametro.
      # Funzione usata solo per i select e i radio button
      protected def option_value(option)
        return option.first if option.is_a? Array
        option
      end

      # Ritorna il name di un opzione di un select di un select ricevuta
      # come parametro. Funzione usata solo per i select e i radio button
      protected def option_name(option)
        return option.last if option.is_a? Array
        option
      end

      # Ritorna una stringa 'selected' se il valore dell'option ricevuto
      # come parametro e' uguale al value inizializzato all'input
      protected def selected_value(option)
        value = option_value(option)
        return "selected='selected'" if value === @value
      end

      # Funzione che ritorna la stringa con attributo data-input settato a
      # required se l'input risulta essere stato inizializzato come obbligatorio
      protected def required_data_input
        return "data-input='check'" if @type === 'checkbox' && @required
        return "data-input='required'" if @required
      end

      # Funzione che disabilita un input
      protected def disabled_data_input
        return "disabled='disabled'" if @disabled
      end

      # Funzione che prende in input un activerecords, il nome dell'attributo
      # da usare come valore e il nome dell'attributo da usare come nome e
      # ritorna un array da usare come options per un input select
      def self.generate_options_from_activerecords(activerecords, value, name)
        rows = []
        activerecords.each do |row|
          rows.push([row.send(value), row.send(name)])
        end
        rows
      end
      # Fine funzioni cella
    end
    # Fine cella
  end
end
