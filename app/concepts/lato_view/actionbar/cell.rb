module LatoView
  # Cella che si occupa di generare una actionbar in grado di contenere
  # il titolo della pagina e i link alle principali azioni. Puo' inoltre
  # contenere anche dei widget per altri tipi di interazioni.
  module Actionbar
    # Cella Actionbar
    class Cell < Cell
      # Lista allineamenti accettati dalla cella per i widget
      @@align = %(left right)
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
        # assegno i valori alle variabili di istanza
        @links = links if links && check_links(links)
        @title = title
        @widgets = widgets if widgets && check_widgets(widgets)
      end

      def show
        render 'show.html'
      end

      # Funzione che controlla che la lista links sia inviata nel formato
      # corretto
      private def check_links(links)
        # evito il controllo se sono in production
        return true if Rails.env.production?
        raise 'Actionbar Concept: links must be an array' unless links.is_a? Array
        links.each do |link|
          raise 'Actionbar Concept: links content must be an array' unless link.is_a? Array
          raise 'Actionbar Concept: links content must have two value' if link.length != 2
        end
      end

      # Funzione che controlla che i widgets passati alla actionbar siano corretti
      private def check_widgets(widgets)
        # evito il controllo se sono in production
        return true if Rails.env.production?
        raise 'Actionbar Concept: links must be an array' unless widgets.is_a? Array
        widgets.each do |widget|
          raise 'Actionbar Concept: widgets content must be an array' unless widget.is_a? Array
          raise 'Actionbar Concept: widgets content must have two value' if widget.length != 2
          raise 'Actionbar Concept: widget align is not a correct value' unless @@align.include? widget.last.to_s
        end
      end

    end
    # Fine cella
  end
end
