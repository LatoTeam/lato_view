module LatoView

  class Index::Cell < Cell

    # Istanze del database da stampare
    attr_accessor :elements
    # Intestazione della tabella
    # * *struttura*: ['Voce 1', 'Voce 2', ... ]
    attr_accessor :head
    # Attributi dellle entità da mostrare nella tabella
    # * *struttura*: ['voce1', 'voce2', ... ]
    attr_accessor :attributes
    # Link principale alla pagina index delle entità (da gestire tramite resources)
    attr_accessor :link
    # Valore booleano che indica se mostrare il link allo show dell'entità
    # * *default*: true
    attr_accessor :show_link
    # Valore booleano che indica se mostrare il link all'edit dell'entità
    # * *default*: true
    attr_accessor :edit_link
    # Valore booleano che indica se mostrare il link al delete dell'entità
    # * *default*: true
    attr_accessor :delete_link
    # Valore booleano che indica se il link di eliminazione deve essere eseguito con il remote: true
    # * *default*: false
    attr_accessor :remote_delete
    # Valore usato per aggiungere delle classi custom alla tabella dell'index
    # * *default*: nil
    attr_accessor :custom_class


    def initialize(elements: nil, head: nil, attributes: nil, link: nil, show_link: true, edit_link: true, delete_link: true, remote_delete: false, custom_class: nil)
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
      return open + head + rows + close
    end


    # Funzione che stampa l'apertura dell'index
    def open
      return "<table class='table #{@custom_class}'>"
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
      return '</table>'
    end


    # Funzione che ritorna il link allo show dell'entità con l'id passato come parametro
    protected def show_link(id)
      if(@link.end_with? '/')
        return "#{@link}#{id}"
      else
        return "#{@link}/#{id}"
      end
    end


    # Funzione che ritorna il link all'edit dell'entità con l'id passato come parametro
    protected def edit_link(id)
      if(@link.end_with? '/')
        return "#{@link}#{id}/edit"
      else
        return "#{@link}/#{id}/edit"
      end
    end


    # Funzione che ritorna il link all'edit dell'entità con l'id passato come parametro
    protected def delete_link(id)
      return show_link(id)
    end

  end

end
