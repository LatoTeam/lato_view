module LatoView
  class Component::Dropdown::Cell < Cell

    # NB: links must be an array of hash {name: 'name', url: 'url'}
    attr_accessor :links, :title, :open_text

    def initialize(links: [], title: '', open_text: nil)
      # save params
      @links = links
      @title = title
      @open_text = open_text
      # check params
      check_params
    end

    def show
      render 'show.html'
    end

    # check params
    private def check_params
      raise 'Dropdown Cell: links must be an array' unless @links.is_a? Array
    end

  end
end
