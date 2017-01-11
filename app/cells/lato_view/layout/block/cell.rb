module LatoView
  class Layout::Block::Cell < Cell

    @@widths = VIEW_GRIDCLASS

    attr_accessor :content, :width, :custom_class

    def initialize(width: 'small-12 medium-12 large-12 xlarge-12', content: '',
                   custom_class: '')
      # save params
      @width = width
      @content = content
      @class = custom_class
      # check params
    end

    def show
      open + @content + close
    end

    # open new block
    def open(width: @width, custom_class: @class)
      "<div class='content-block column #{width} #{custom_class}'>"
    end

    # close block
    def close
      '</div>'
    end

    # check params
    private def check_params
      raise 'Block Cell: width value in not correct' unless (@width.to_s.split(' ') - @@widths).empty?
    end

  end
end
