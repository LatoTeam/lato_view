module LatoView
  # Cella che si occupa di generare un pannello di dropdown in grado di
  # contenere una lista di link
  module Dropdown
    # Cella Actionbar
    class Cell < Cell
      # Lista di links da mostrare nel Dropdown secondo la
      # struttura [['Nome link', 'url'], ['Nome link', 'url']]
      # * *default*: nil
      attr_accessor :links

      # Titolo principale da mostrare nel dropdown
      # * *default*: nil
      attr_accessor :title

      # Testo da inserire come nome nel pulsante che apre il Dropdown
      # * *default*: nil
      attr_accessor :button

      def initialize(links: nil, title: '', button: nil)
        # assegno i valori alle variabili di istanza
        @links = links if links && check_links(links)
        @title = title
        @button = button
      end

      def show
        render 'show.html'
      end

      # Funzione che controlla che la lista links sia inviata nel formato
      # corretto
      private def check_links(links)
        # evito il controllo se sono in production
        return true if Rails.env.production?
        raise 'Dropdown Concept: links must be an array' unless links.is_a? Array
        links.each do |link|
          raise 'Dropdown Concept: links content must be an array' unless link.is_a? Array
          raise 'Dropdown Concept: links content must have two value' if link.length != 2
        end
      end
      # Fine funzioni cella
    end
    # Fine cella
  end
end
