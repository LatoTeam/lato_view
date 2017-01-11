module LatoView
  class Component::Buttongroup::Cell < Cell

    @@styles = VIEW_COMPONENTSTYLES
    @@sizes = %w()

    # NB: links must be an array of hash {name: 'name', url: 'url'}
    attr_accessor :links, :size, :style

    def initialize(links: [], size: '', style: 'normal')
      # save params
      @links = links
      @size = size
      @style = style
      # check params
      check_params
    end

    def show
      render 'show.html'
    end

    # check params
    private def check_params
      raise 'Bottongroup Cell: style value in not correct' unless @@styles.include? @style.to_s
      raise 'Bottongroup Cell: size value in not correct' unless @@sizes.include? @size.to_s
      raise 'Bottongroup Cell: links must be an array' unless @links.is_a? Array
    end

  end
end
