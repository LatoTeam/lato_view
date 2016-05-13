module LatoView

  class Actionbar::Cell < Cell

    # Lista di links da mostrare nella Actionbar secondo la struttura [['Nome link', 'url'], ['Nome link', 'url']]
    # * *default*: nil
    attr_accessor :links
    # Titolo principale da mostrare nella Actionbar
    # * *default*: nil
    attr_accessor :title


    def initialize(links: nil, title: '')
      @links = links
      @title = title
    end


    def show
      render 'show.html'
    end


  end

end
