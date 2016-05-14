module LatoView

  class Searchbar::Cell < Cell

    # Nome dell'istanza del database da utilizzare nella ricerca
    attr_accessor :elements

    # La variabile di filtro ricerca
    attr_accessor :search_filter

    # La variabile ricercata
    attr_accessor :searched_val

    # La variabile ricercata
    attr_accessor :search_route

    def initialize(elements: nil, search_filter: nil, searched_val: nil, search_route: nil)
      @elements = elements
      puts @elements
      puts "@@@@@@@"
      @search_filter = search_filter
      @search_route = search_route
      puts @search_route
      puts "@@@@@@@"

    end


    def show
      render 'show.html'
    end

  end

end
