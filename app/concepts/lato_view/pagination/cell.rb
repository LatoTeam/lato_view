module LatoView
  # Elemento grafico che genera una paginazione utilizzando la gemma
  # 'will_paginate'
  module Pagination
    # Cella Pagination
    class Cell < Cell
      # Nome dell'istanza del database da utilizzare nella paginazione
      # * *default*: nil
      attr_accessor :elements
      # Classi da aggiungere al contenitore della paginazione
      # * *default*: nil
      attr_accessor :custom_class
      # Valore booleano indicante se mostrare i numeri delle pagine o meno
      # * *default*: true
      attr_accessor :show_links

      def initialize(elements: nil, custom_class: '', show_links: true)
        @elements = elements
        @custom_class = custom_class
        @show_links = show_links
      end

      def show
        render 'show.html'
      end
      # Fine funzioni cella
    end
    # Fine cella
  end
end
