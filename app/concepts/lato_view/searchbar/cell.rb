module LatoView

  class Searchbar::Cell < Cell

    # Nome dell'istanza del database da utilizzare nella ricerca
    attr_accessor :element_name

    # La variabile di filtro ricerca
    attr_accessor :search_filter

    # La variabile ricercata
    attr_accessor :searched_val

    def initialize(element_name: nil, search_filter: nil, searched_val: nil)
      @element_name = element_name
      @elements = instance_variable_get("@#{element_name}")
      @elements = @elements.ransack(searched_val)
      @search_filter = search_filter
    end


    def show
      render 'show.html'
    end

  end

end
