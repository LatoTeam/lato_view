module LatoView
  class Component::Form::Cell < Cell

    attr_accessor :url, :method, :remote, :multipart, :custom_class

    def initialize(url: '', method: :post, remote: false, multipart: false, :custom_class: '')
     # save params
      @url = url
      @method = method
      @remote = remote
      @multipart = multipart
      @custom_class = custom_class
      # check params
      check_params
    end

    def show
      render 'show.html'
    end

    # check params
    private def check_params
      # TODO: Check values
    end

  end
end
