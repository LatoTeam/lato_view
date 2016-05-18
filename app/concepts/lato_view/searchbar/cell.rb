module LatoView
  # Elemento grafico composto da una barra di ricerca utilizzabile insieme
  # alla gemma 'ransack' per eseguire la ricerca tra le entita' di un modello.
  module Searchbar
    # Cella Searchbar
    class Cell < Cell
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

      def initialize(elements: nil, filter: nil, url: nil, method: 'get',
                     style: nil)
        @elements = elements
        @filter = filter
        @url = url
        @method = method
        @style = style
      end

      def show
        render 'show.html'
      end
      # Fine funzioni cella
    end
    # Fine cella
  end
end
