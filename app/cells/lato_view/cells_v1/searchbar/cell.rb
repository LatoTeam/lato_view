module LatoView
  # Elemento grafico composto da una barra di ricerca utilizzabile insieme
  # alla gemma 'ransack' per eseguire la ricerca tra le entita' di un modello.
  module CellsV1::Searchbar
    # Cella Searchbar
    class Cell < Cell
      # includo i formhelper di ransack
      include Ransack::Helpers::FormHelper

      # Nome dell'istanza del database da utilizzare nella ricerca
      # * *default*: nil
      attr_accessor :elements

      # La variabile di filtro ricerca
      # * *default*: nil
      attr_accessor :filter

      # Url custom a cui il form deve inviare la ricerca
      # * *default*: nil
      attr_accessor :url

      # Metodo con il quale il form deve comunicare con il controller
      # * *default*: 'get'
      attr_accessor :method

      # Stile della searchbar
      # * *default*: nil
      attr_accessor :style

      # Valore booleano indicante se la serachbar deve utilizzare il
      # remote true o meno nel form
      # * *default*: false
      attr_accessor :remote

      # Stringa contenente classi custom da aggiungere alla searchbar
      # * *default*: nil
      attr_accessor :custom_class

      def initialize(elements: nil, filter: nil, url: nil, method: 'get',
                     style: 'normal', remote: false, custom_class: '')
       # assegno i valori alle variabili di istanza
        @elements = elements
        @filter = filter
        @url = url
        @method = method
        @style = style
        @remote = remote
        @custom_class = custom_class
      end

      def show
        render 'show.html'
      end

    end
    # Fine cella
  end
end
