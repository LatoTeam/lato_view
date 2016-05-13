module LatoView

  class Block::Cell < Cell

    # Lista dei parametri accettati per l'attributo width
    @@widths = ['half', 'third', 'fourth', 'two-third']

    # Dimensione del blocco (half, third, fourth, two-third)
    # * *default*: nil (large)
    attr_accessor :width
    # Contenuto del blocco
    # * *default*: nil
    attr_accessor :content
    # Classi custom aggiunte all'html del  blocco
    # * *default*: nil
    attr_accessor :custom_class


    def initialize(width: '', content: '', custom_class: '')
      @width = width
      @content = content
      @class = custom_class
    end


    def show
      return open + @content + close
    end


    # Funzione per stampare l'apertura di un blocco
    # * *Parametri* :
    # - width: dimensione del blocco da aprire (se non viene impostata la funzione
    # utilizza la dimensione prefissata in fase di inizializzazione)
    def open(width: @width, custom_class: @class)
      return "<div class='content-block #{width} #{custom_class}'>"
    end


    # Funzione per stampare la chiusura di un blocco
    def close
      return '</div>'
    end

  end

end
