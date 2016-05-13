module LatoView

  class Input::Cell < Cell

    # Lista di tipologie di input accettate
    @@types = ['text', 'number', 'select', 'password', 'email', 'editor','checkbox','radio']


    # Tipologia di input da inizializzare (text, number, select, password, email, multiple-select, date, checkbox, radio)
    # * *default*: 'text'
    attr_accessor :type
    # Nome da assegnare all'input
    # * *default*: 'input'
    attr_accessor :name
    # Valore da inserire come placeholder all'input
    # * *default*: nil
    attr_accessor :placeholder
    # Valore già impostato nell'input
    # * *default*: nil
    attr_accessor :value
    # Testo da inserire nella label dell'input
    # * *default*: nil
    attr_accessor :label
    # Dimensione dell'input (half, third, fourth, two-third)
    # * *default*: nil ('large')
    attr_accessor :width
    # Valore booleano usato per indicare se l'input è obbligatorio nel form in cui si trova
    # * *default*: false
    attr_accessor :required
    # Valore booleano che indica (nel caso di input password) se mostrare il pulsante per vedere la password
    # * *default*: true
    attr_accessor :password_visible
    # Classi custom da inserire nel codice dell'input
    # * *default*: nil
    attr_accessor :custom_class
    # Lista di opzioni da mostrare (nel caso di input select). La struttura deve essere [['value1', 'Name 1'], ['value2', 'Name 2']]
    # * *default*: []
    attr_accessor :options
    # Valore booleano che indica (nel caso di input select) se mostrare o meno la prima opzione del
    # select vuota
    # * *default*: false
    attr_accessor :option_blank
    # Valore che indica se disattivare o meno l'input
    # * *default*: false
    attr_accessor :disabled

    def initialize(type: 'text', name: 'input', placeholder: '',
                   value: '', label: '', width: '', required: false,
                   password_visible: true, custom_class: '', options: [], option_blank: false, disabled: false)
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
      render "#{@type.downcase}.html" if(@type)
    end


    # Ritorna il value di un opzione di un select ricevuta come parametro
    protected def get_option_value(option)
      if(option.kind_of?(Array))
        return option.first
      else
        return option
      end
    end


    # Ritorna il name di un opzione di un select di un select ricevuta come parametro
    protected def get_option_name(option)
      if(option.kind_of?(Array))
        return option.last
      else
        return option
      end
    end


    # Ritorna una stringa 'selected' se il valore dell'option ricevuto come parametro è uguale
    # al value inizializzato all'input
    protected def get_selected_value(option)
      value = get_option_value(option)
      return "selected='selected'" if(value === @value)
    end


    # Funzione che ritorna la stringa con attributo data-input settato a required se l'input risulta
    # essere stato inizializzato come obbligatorio
    protected def get_required_data_input
      return "data-input='required'" if(@required)
    end


    # Funzione che disabilita un input
    protected def get_disabled_data_input
      return "disabled='disabled'" if(@disabled)
    end


    # Funzione che prende in input un activerecords, il nome dell'attributo da usare come valore e il nome
    # dell'attributo da usare come nome e ritorna un array da usare come options per un input select
    def self.generate_options_from_activerecords(activerecords, value, name)
      rows = []
      activerecords.each do |row|
        rows.push([row.send(value), row.send(name)])
      end
      return rows
    end

  end

end
