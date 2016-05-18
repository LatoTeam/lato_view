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
      # Celleda inserire all'interno della Actionbar. Le celle per ora
      # supportate sono: (searchbar, dropdown, buttongroup).
      # I widget devono essere inseriti sotto forma di array che segue
      # la seguente struttura:
      # [[cella_widget, 'allineamento'], [...]]
      # * *default*: nil
      attr_accessor :widgets

      def initialize(links: nil, title: '', widgets: nil)
        @links = links
        @title = title
        @widgets = widgets
      end

      def show
        render 'show.html'
      end

      # Fine funzioni cella
    end
    # Fine cella
  end
end
