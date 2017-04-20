module LatoView
  class Component::Button::Cell < Cell

    @@colors = %w(normal yellow green red)
    @@sizes = %w(normal small)

    attr_accessor :title, :url, :color, :size, :custom_class, :method

    def initialize(title: '', url: '', color: 'normal', size: 'normal', custom_class: '', method: 'get')
     # save params
      @title = title
      @url = url
      @color = color
      @size = size
      @method = method
      @custom_class = custom_class
      # check params
      check_params
    end

    def show
      render 'show.html'
    end

    # check params
    private def check_params
      raise 'Button Cell: color value in not correct' unless @@colors.include? @color.to_s
      raise 'Button Cell: size value in not correct' unless @@sizes.include? @size.to_s
    end

  end
end
