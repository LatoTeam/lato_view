module LatoView
  class CellsV1::Index::Cell < Cell

    attr_accessor :elements, :head, :attributes, :link, :show_link, :edit_link,
                  :delete_link, :remote_delete, :custom_class

    def initialize(elements: nil, head: nil, attributes: nil, link: nil,
                   show_link: true, edit_link: true, delete_link: true,
                   remote_delete: false, custom_class: nil)
      # save params
      @elements = elements
      @head = head
      @attributes = attributes
      @link = link
      @show_link = show_link
      @edit_link = edit_link
      @delete_link = delete_link
      @remote_delete = remote_delete
      @custom_class = custom_class
      # check params
      check_params
    end

    def show
      open + head + rows + close
    end

    # open index table
    def open
      "<table class='table #{@custom_class}'>"
    end

    # return ingex head
    def head
      render 'head.html'
    end

    # return index rows
    def rows
      render 'rows.html'
    end

    # return index end
    def close
      '</table>'
    end

    # return show url
    protected def show_link(id)
      return "#{@link}#{id}" if @link.end_with? '/'
      return "#{@link}/#{id}"
    end

    # return edit url
    protected def edit_link(id)
      return "#{@link}#{id}/edit" if @link.end_with? '/'
      return "#{@link}/#{id}/edit"
    end

    # return delete url
    protected def delete_link(id)
      return show_link(id)
    end

    # check params
    private def check_params
      raise 'Index Cell: head must be an array' unless @head.is_a? Array
      raise 'Index Cell: attributes must be an array' unless @attributes.is_a? Array
      raise 'Index Cell: head and attributes have different length' if @head.length != @attributes.length
    end

  end
end
