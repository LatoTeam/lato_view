module LatoView
  # Cella che si occupa di generare una actionbar in grado di contenere
  # il titolo della pagina e i link alle principali azioni
  module Actionbar
    # Cella Actionbar
    class Cell < Cell
      # Lista di links da mostrare nella Actionbar secondo la
      # struttura [['Nome link', 'url'], ['Nome link', 'url']]
      # * *default*: nil
      attr_accessor :links
      # Titolo principale da mostrare nella Actionbar
      # * *default*: nil
      attr_accessor :title
      # Searchbar da aggiungere nella Actionbar
      # * *default*: nil

      def initialize(links: nil, title: '', searchbar: nil)
        @links = links
        @title = title
        @searchbar = searchbar
      end

      def show
        render 'show.html'
      end
      # Fine funzioni cella
    end
    # Fine cella
  end
end
