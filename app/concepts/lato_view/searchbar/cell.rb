module LatoView

  class Searchbar::Cell < Cell

    # Istanze del database da utilizzare nella ricerca
    attr_accessor :elements

    # La variabile di filtro ricerca
    attr_accessor :filter


    def initialize(elements: nil, filter: nil)
      @elements = elements
      @filter = filter
    end


    def show
      render 'show.html'
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
