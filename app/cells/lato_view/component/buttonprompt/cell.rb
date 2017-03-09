module LatoView
  class Component::Buttonprompt::Cell < Cell

    @@colors = %w(normal yellow green red)
    @@sizes = %w(normal small xsmall)

    attr_accessor :title, :url, :color, :size, :custom_class, :data_popup_text, :data_popup_no, :data_popup_ok, :custom_method

    def initialize(title: '', url: '', color: 'normal', size: 'normal', 
                   custom_class: '', data_popup_text: '', 
                   data_popup_no: '', data_popup_ok: '', custom_method: 'get')
     # save params
      @title = title
      @url = url
      @color = color
      @size = size
      @custom_class = custom_class
      @data_popup_text = data_popup_text
      @data_popup_no = data_popup_no
      @data_popup_ok = data_popup_ok
      @custom_method = custom_method
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
