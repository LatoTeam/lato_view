module LatoView
  class Component::Searchbar::Cell < Cell

    # Include ransack as dependences
    include Ransack::Helpers::FormHelper

    @@styles = VIEW_COMPONENTSTYLES

    attr_accessor :elements, :filter, :url, :method, :style, :remote,
                  :custom_class

    def initialize(elements: nil, filter: nil, url: nil, method: 'get',
                   style: 'normal', remote: false, custom_class: '')
     # save params
      @elements = elements
      @filter = filter
      @url = url
      @method = method
      @style = style
      @remote = remote
      @custom_class = custom_class
      # check params
      check_params
    end

    def show
      render 'show.html'
    end

    # check params
    private def check_params
      raise 'Searchbar Cell: style value in not correct' unless @@styles.include? @style.to_s
    end

  end
end
