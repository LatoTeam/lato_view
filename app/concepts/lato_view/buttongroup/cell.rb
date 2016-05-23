module LatoView
  # Elemento grafico composto da un insieme di link uniti in orizzontale
  module Buttongroup
    # Cella Buttongroup
    class Cell < Cell
      # Lista stili possibili per il bottongroup
      @@styles = %w(normal)
      
      # Lista di links da mostrare nella Actionbar secondo la
      # struttura [['Nome link', 'url'], ['Nome link', 'url']]
      # * *default*: nil
      attr_accessor :links

      # Dimensione dei pulsanti della button
      # * *default*: nil
      attr_accessor :size

      # Stile da utilizzare per la buttongroup
      # * *default*: nil (normal)
      attr_accessor :style

      def initialize(links: nil, size: nil, style: 'normal')
        # eseguo brevi controlli sull'input
        raise 'Bottongroup Concept: style value in not correct' unless @@styles.include? style.to_s
        # assegno i valori alle variabili di istanza
        @links = links if links && check_links(links)
        @size = size
        @style = style
      end

      def show
        render 'show.html'
      end

      # Funzione che controlla che la lista links sia inviata nel formato
      # corretto
      private def check_links(links)
        # evito il controllo se sono in production
        return true if Rails.env.production?
        raise 'Bottongroup Concept: links must be an array' unless links.is_a? Array
        links.each do |link|
          raise 'Bottongroup Concept: links content must be an array' unless link.is_a? Array
          raise 'Bottongroup Concept: links content must have two value' if link.length != 2
        end
      end
      # Fine funzioni cella
    end
    # Fine cella
  end
end
