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
        @links = links
        @title = title
        @button = button
      end

      def show
        render 'show.html'
      end
      # Fine funzioni cella
    end
    # Fine cella
  end
end
