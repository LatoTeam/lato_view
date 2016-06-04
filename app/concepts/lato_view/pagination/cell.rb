module LatoView
  # Elemento grafico che genera una paginazione.
  module Pagination
    # Cella Pagination
    class Cell < Cell
      # Nome dell'istanza del database da utilizzare nella paginazione
      # * *default*: nil
      attr_accessor :elements

      # Classi da aggiungere al contenitore della paginazione
      # * *default*: nil
      attr_accessor :custom_class

      def initialize(elements: nil, custom_class: '')
        @elements = elements
        @custom_class = custom_class
      end

      def show
        render 'show.html'
      end
      
    end
    # Fine cella
  end
end
