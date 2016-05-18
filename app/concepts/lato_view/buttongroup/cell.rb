module LatoView
  # Elemento grafico composto da un insieme di link uniti in orizzontale
  module Buttongroup
    # Cella Buttongroup
    class Cell < Cell
      # Lista di links da mostrare nella Actionbar secondo la
      # struttura [['Nome link', 'url'], ['Nome link', 'url']]
      # * *default*: nil
      attr_accessor :links
      # Dimensione dei pulsanti della button
      # * *default*: nil
      attr_accessor :size
      # Stile da utilizzare per la buttongroup
      # * *default*: nil
      attr_accessor :style

      def initialize(links: nil, size: nil, style: nil)
        @links = links
        @size = size
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
