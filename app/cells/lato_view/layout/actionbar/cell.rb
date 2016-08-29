module LatoView
  class Layout::Actionbar::Cell < Cell

    @@widget_align = %(left right)

    # NB: widgets must be an array of hash {component: 'component', align: 'align'}
    attr_accessor :title, :widgets

    def initialize(title: '', widgets: [])
      # save params
      @title = title
      @widgets = widgets
      # check params
      check_params
    end

    def show
      render 'show.html'
    end

    private def check_params
      raise 'Actionbar Cell: widgets must be an array' unless @widgets.is_a? Array
      widgets.each do |widget|
        raise 'Actionbar Cell: widget align is not a correct value' unless @@widget_align.include? widget[:align].to_s
      end
    end

  end
end
