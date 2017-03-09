module LatoView
  class Layout::Tablerows::Cell < Cell

    # NB: values must be an array of hash {title: 'title', content: 'content'}
    attr_accessor :values

    def initialize(values: [])
      # save params
      @values = values
      # check params
      check_params
    end

    def show
      render 'show.html'
    end

    private def check_params
      raise 'Tablerows Cell: values must be an array' unless @values.is_a? Array
    end

  end
end
