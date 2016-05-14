module LatoView

  class Searchbar::Cell < Cell

    # Nome dell'istanza del database da utilizzare nella ricerca
    # * *default*: nil
    attr_accessor :elements
    # La variabile di filtro ricerca
    # * *default*: nil
    attr_accessor :filter
    # Url custom a cui il form deve inviare la ricerca
    # * *default*: nil
    attr_accessor :url
    # Metodo con il quale il form deve comunicare con il controller
    # * *default*: 'get'
    attr_accessor :method

    def initialize(elements: nil, filter: nil, url: nil, method: 'get')
      @elements = elements
      @filter = filter
      @url = url
      @method = method
    end


    def show
      render 'show.html'
    end

  end

end