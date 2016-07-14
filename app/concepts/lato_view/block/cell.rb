module LatoView
  # Cella che si occupa di generare un blocco contenitore generale
  # utilizzabile per inserire altri elementi
  module Block
    # Cella Block
    class Cell < Cell
      # Lista dei parametri accettati per l'attributo width
      @@widths = VIEW_GRIDCLASS

      # Dimensione del blocco (half, third, fourth, two-third)
      # * *default*: nil (large)
      attr_accessor :width

      # Contenuto del blocco
      # * *default*: nil
      attr_accessor :content

      # Classi custom aggiunte all'html del  blocco
      # * *default*: nil
      attr_accessor :custom_class

      def initialize(width: 'small-12 medium-12 large-12 xlarge-12', content: '', custom_class: '')
        # eseguo brevi controlli sull'input
        raise 'Block Concept: width value in not correct' unless (width.to_s.split(' ') - @@widths).empty?
        # assegno i valori alle variabili di istanza
        @width = width
        @content = content
        @class = custom_class
      end

      def show
        open + @content + close
      end

      # Funzione per stampare l'apertura di un blocco
      # * *Parametri* :
      # - width: dimensione del blocco da aprire (se non viene impostata la
      # funzione
      # utilizza la dimensione prefissata in fase di inizializzazione)
      def open(width: @width, custom_class: @class)
        "<div class='content-block column #{width} #{custom_class}'>"
      end

      # Funzione per stampare la chiusura di un blocco
      def close
        '</div>'
      end

    end
    # Fine cella
  end
end
