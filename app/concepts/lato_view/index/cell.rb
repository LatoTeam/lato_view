module LatoView
  # Cella che si occupa di mostrare una lista di elementi di un model
  # insieme ai link alle azioni di visualizzazione, modifica e eliminazione.
  # Il corretto funzionamento dei link alle azioni necessita che i routes del
  # modello siano settati attraverso la funzione 'resources'
  module Index
    # Cella Index
    class Cell < Cell
      # Istanze del database da stampare
      attr_accessor :elements

      # Intestazione della tabella
      # * *struttura*: ['Voce 1', 'Voce 2', ... ]
      attr_accessor :head

      # Attributi dellle entita' da mostrare nella tabella
      # * *struttura*: ['voce1', 'voce2', ... ]
      attr_accessor :attributes

      # Link principale alla pagina index delle entita'
      # (da gestire tramite resources)
      attr_accessor :link

      # Valore booleano che indica se mostrare il link allo show dell'entita'
      # * *default*: true
      attr_accessor :show_link

      # Valore booleano che indica se mostrare il link all'edit dell'entita'
      # * *default*: true
      attr_accessor :edit_link

      # Valore booleano che indica se mostrare il link al delete dell'entita'
      # * *default*: true
      attr_accessor :delete_link

      # Valore booleano che indica se il link di eliminazione deve essere
      # eseguito con il remote: true
      # * *default*: false
      attr_accessor :remote_delete

      # Valore usato per aggiungere delle classi custom alla tabella dell'index
      # * *default*: nil
      attr_accessor :custom_class

      def initialize(elements: nil, head: nil, attributes: nil, link: nil,
                     show_link: true, edit_link: true, delete_link: true,
                     remote_delete: false, custom_class: nil)
        # eseguo brevi controlli sull'input
        raise 'Index Concept: head must be an array' unless head.is_a? Array
        raise 'Index Concept: attributes must be an array' unless attributes.is_a? Array
        raise 'Index Concept: head and attributes have different length' if head.length != attributes.length
        # assegno i valori alle variabili di istanza
        @elements = elements
        @head = head
        @attributes = attributes
        @link = link
        @show_link = show_link
        @edit_link = edit_link
        @delete_link = delete_link
        @remote_delete = remote_delete
        @custom_class = custom_class
      end

      def show
        open + head + rows + close
      end

      # Funzione che stampa l'apertura dell'index
      def open
        "<table class='table #{@custom_class}'>"
      end

      # Funzione che genera l'intestazione dell'index
      def head
        render 'head.html'
      end

      # Funzione che stampa le righe dell'index
      def rows
        render 'rows.html'
      end

      # Funzione che stampa la chiusura di una tabella
      def close
        '</table>'
      end

      # Funzione che ritorna il link allo show dell'entita' con l'id
      # passato come parametro
      protected def show_link(id)
        return "#{@link}#{id}" if @link.end_with? '/'
        "#{@link}/#{id}"
      end

      # Funzione che ritorna il link all'edit dell'entita'
      # con l'id passato come parametro
      protected def edit_link(id)
        return "#{@link}#{id}/edit" if @link.end_with? '/'
        "#{@link}/#{id}/edit"
      end

      # Funzione che ritorna il link all'edit dell'entita'
      # con l'id passato come parametro
      protected def delete_link(id)
        show_link(id)
      end

      
    end
    # Fine cella
  end
end
