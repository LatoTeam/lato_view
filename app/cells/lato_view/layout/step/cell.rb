module LatoView
  class Layout::Step::Cell < Cell

    @@widths = VIEW_GRIDCLASS

    attr_accessor :content, :width, :custom_class, :prev_name, :next_name

    def initialize(width: 'small-12 medium-12 large-12 xlarge-12', content: '',
                   custom_class: '', prev_name: 'Prev', next_name: 'Next')
      # save params
      @width = width
      @content = content
      @class = custom_class
      @random = SecureRandom.hex
      @prev_name = prev_name
      @next_name = next_name
      # check params
    end

    def show
      open + @content + close
    end

    # open new step container
    def open(width: @width, custom_class: @class)
      "<div class='content-block column #{width} #{custom_class}'><div class='element-step' data-step-id='#{@random}'>
        <div class='step-scroller'>"
    end

    def open_step(active: false)
      "<div class='step'>" if active 
      "<div class='step active'>"
    end

    def close_step
      "</div>"
    end

    # close step container
    def close(prev_name: @prev_name, next_name: @next_name)
      "</div><div class='step-navigator' data-step-id='#{@random}'><button class='lato-button step-button step-prev'>#{@prev_name}</button><div class='step-paginate-container'><ul class='step-paginate'></ul></div><button class='lato-button step-button step-next'>#{@next_name}</button></div></div></div>"
    end

    # check params
    private def check_params
      raise 'Block Cell: width value in not correct' unless (@width.to_s.split(' ') - @@widths).empty?
    end

  end
end
