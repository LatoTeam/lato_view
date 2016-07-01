module LatoView
  # Cella che si occupa di generare un blocco contenitore generale
  # utilizzabile per inserire altri elementi
  module Block
    # Cella Block
    class Cell < Cell
      # Lista dei parametri accettati per l'attributo width
      @@widths = %w(small-1 small-2 small-3 small-4 small-5 small-6
                    small-7 small-8 small-9 small-10 small-11 small-12
                    small-half small-full medium-1 medium-2 medium-3
                    medium-4 medium-5 medium-6 medium-7 medium-8 medium-9
                    medium-10 medium-11 medium-12 medium-half medium-full
                    large-1 large-2 large-3 large-4 large-5 large-6 large-7
                    large-8 large-9 large-10 large-11 large-12 large-half
                    large-full xlarge-1 xlarge-2 xlarge-3 xlarge-4 xlarge-5
                    xlarge-6 xlarge-7 xlarge-8 xlarge-9 xlarge-10 xlarge-11
                    xlarge-12 xlarge-half xlarge-full)

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
